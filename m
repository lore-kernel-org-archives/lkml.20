Received: from mta0.migadu.com (out-193.mta0.migadu.com [91.218.175.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE85D37C0E6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 07:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787987493; cv=none; b=eXkB5IX19luMprl+TTrsmZWqeMV2jvCJHJh7cSNcnkOa8AkZbLrWWILvqtpzPECF60qj3o6ifRrfIk9MouBtRnneK1/UMUXrJq4RX7ui4MVvPt54E5y3T5CD2SkRwZG0uUOSyoSG62KnkArRMRHxPUdYT2SRUXgzVNYMhMpGwuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787987493; c=relaxed/simple;
	bh=0WEUwWA13h6lSIRRHugW7N81xLfWs7SnLHtINewqeBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mln8YiVC1feu6qe3ioA+KbDeNntfxjE1OgiCU9JCbKdjsQtn0HOvINsuQ9tO9FfGTnu4rZR8EYi9zHtBMemRd9zleE9s40vu1P0z0j/h43/B4ObNVuQm5/5PdyLwj9YH2P7lD8bJU7wHBHmqFKWl85Ba4b/JeVll+vZ4ppaXN0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gHdy4XCO; arc=none smtp.client-ip=91.218.175.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gHdy4XCO"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0WEUwWA13h6lSIRRHugW7N81xLfWs7SnLHtINewqeBo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787987489; v=1; x=1788592289;
 b=gHdy4XCOPwERbcch+mSs+R/AtCyA0wsMxlYxMjYhqmlo/ZO6QGDCVMlKYGr+M41UzEPhDNQt
 NwfP62VVwmYLbYSaebgAI76k04ak09Xm7Ib4QzPjXLdBvWs+R8c7Y6bakK4gU/cVKU+qwkQ/7EF
 ys/noFDTUzhaxmbHJsBfVfIk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 891acf61f080e197;
	Sat, 29 Aug 2026 07:11:29 +0000
X-Mizu-Trace-ID: 891acf61f080e197
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Quentin Perret <qperret@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 2/2] KVM: arm64: selftests: Check SError is not pending after delivery
Date: Sat, 29 Aug 2026 08:11:20 +0100
Message-Id: <20260829071120.2522788-2-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260829071120.2522788-1-fuad.tabba@linux.dev>
References: <20260829071120.2522788-1-fuad.tabba@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

test_serror() never looks at the vCPU after the SError is delivered, so
a stale pending SError goes unnoticed. Read the vCPU events back and
check the SError is no longer pending.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 tools/testing/selftests/kvm/arm64/external_aborts.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/arm64/external_aborts.c b/tools/testing/selftests/kvm/arm64/external_aborts.c
index d8fe17a6cc592..b276a4998a92c 100644
--- a/tools/testing/selftests/kvm/arm64/external_aborts.c
+++ b/tools/testing/selftests/kvm/arm64/external_aborts.c
@@ -239,6 +239,7 @@ static void test_serror_guest(void)
 
 static void test_serror(void)
 {
+	struct kvm_vcpu_events events;
 	struct kvm_vcpu *vcpu;
 	struct kvm_vm *vm = vm_create_with_dabt_handler(&vcpu, test_serror_guest,
 							unexpected_dabt_handler);
@@ -247,6 +248,11 @@ static void test_serror(void)
 
 	vcpu_inject_serror(vcpu);
 	vcpu_run_expect_done(vcpu);
+
+	vcpu_events_get(vcpu, &events);
+	TEST_ASSERT(!events.exception.serror_pending,
+		    "SError still pending after the guest took it");
+
 	kvm_vm_free(vm);
 }
 
-- 
2.39.5

