Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624544;
	b=ySSpyrR45QoJnuMe2spaLYgnhOyVUxgpVhVCGpVsxUBGjqBIEBOIg2iPAvbjI6Jklmds
	 b1zfB/2WFmJjxVn4ZHqkSActe6AQAJuU81Dv03xkM+USBAt8gvjm4G8Pe5cIhd5T5vgqu
	 1/WDDsaT4Fy502hYHx6qMRnSLAHhSzAjz15meRQayFG0RbKpAYnJv5diPm+i2uWMjThcg
	 8Pk4VvoX+HB3sy4arAbW1i+5BdHAaIgGU53YbWcZn1syqBgg9FKW/wmfb4qh70vjH/mbW
	 EQcxSWfUW+En2QVQ9BAEkxX21pd0OX/nwkCJYWoClXuLbgmWAr5BbbSoD7lkNSVN1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624544;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MjI+KkE/DHdEAtZ+VS0VPmyG2kVLIeN4msuyxagZt3w=;
	b=UZ4NSkeBHkip+5CkOrtmCRxhEiWBYrl607htLpQs5+sPGNT72LgOZXoNGK6lptsmow1A
	 /tebWjwcdvMafdAA2SRmyl+FYogC/4dd4/ybjl8AY0wrrRaXfCZGiSMergYzC1JjTYJG0
	 3RwLJrtd46XnnvXyAZsQShyxy+muoTxO09VuQd30UdOU3lkCn/hj6yNQhnyHbYYyNmDac
	 zY92B/N+9xjhLWQLcoamo8Yby516DOtLf0XdvWYtRA6ZJr/zDAmVzm12bCAnBaue9uH90
	 5N19S6azNGRYo/TDUiZHCPIn4g/5duwFMvTy/qI8HSc3QJSh/mlyQ6KaIikyjxwvzyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=txsBw7YC;
	arc=none smtp.remote-ip=91.218.175.20
Received: from mta0.migadu.com (out-20.mta0.migadu.com [91.218.175.20])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA4F606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA4F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=txsBw7YC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=U4Ir26pDJYfRAMb+qjTuCOpUGkv3Z+5ql2B1l3nXv5c=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793624536; v=1; x=1794229336;
 b=txsBw7YCzmEEBr77+gazLgZrJJd/2VmPWroWP6PwdN4dISN15MzDnxssNn9qLmuN1+FBXrdd
 TEJAcTKbOr16YubP8l9TM1wNqvBz3zuNDxEAqAMAd+bs7WC2pNTP7CN4v/ogBhYK6jpEgBi18rb
 UopzYfQQW2tkAJGSoEfDykdM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a61fcc296cb9e8c4;
	Mon, 02 Nov 2026 13:02:15 +0000
X-Mizu-Trace-ID: a61fcc296cb9e8c4
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Ene <sebastianene@google.com>,
	=?UTF-8?q?Bart=C5=82omiej=20Grzesik?= <bgrzesik@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Radu Rendec <radu@rendec.net>,
	Fuad Tabba <tabba@google.com>,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/13] KVM: arm64: Deprivilege the host under stop_machine()
Date: Mon,  2 Nov 2026 13:01:27 +0000
Message-ID: <20261102130133.3684226-8-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102130133.3684226-1-fuad.tabba@linux.dev>
References: <20261102130133.3684226-1-fuad.tabba@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pkvm_drop_host_privileges() installs the host stage 2 on every CPU with
on_each_cpu(), and each CPU goes back to running the host as soon as its
own __pkvm_prot_finalize() returns. The ITS takeover a later patch adds
has to run while every other CPU is stopped and still privileged, and
let them finalise only after it. Stopping them means no CPU can post an
ITS command while the driver switches to its copies of the queue and
tables. Keeping them privileged means a takeover that fails leaves the
host as it was.

Finalise from a stop_machine() callback instead: no CPU leaves it until
every CPU's callback has returned. An error from any CPU still reaches
finalize_pkvm(), which runs once at boot.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/pkvm.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 016997288fd23..16dfb249b4961 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -11,6 +11,7 @@
 #include <asm/kvm_mmu.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/stop_machine.h>
 
 #include <asm/kvm_pkvm.h>
 
@@ -312,25 +313,19 @@ int pkvm_init_host_vm(struct kvm *kvm)
 	return 0;
 }
 
-static void __init _kvm_host_prot_finalize(void *arg)
+static int __init __pkvm_drop_host_privileges(void *arg)
 {
-	int *err = arg;
-
-	if (WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)))
-		WRITE_ONCE(*err, -EINVAL);
+	return WARN_ON(kvm_call_hyp_nvhe(__pkvm_prot_finalize)) ? -EINVAL : 0;
 }
 
 static int __init pkvm_drop_host_privileges(void)
 {
-	int ret = 0;
-
 	/*
 	 * Flip the static key upfront as that may no longer be possible
 	 * once the host stage 2 is installed.
 	 */
 	static_branch_enable(&kvm_protected_mode_initialized);
-	on_each_cpu(_kvm_host_prot_finalize, &ret, 1);
-	return ret;
+	return stop_machine(__pkvm_drop_host_privileges, NULL, cpu_online_mask);
 }
 
 static void __init pkvm_selftests(void)
-- 
2.47.3

