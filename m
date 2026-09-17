Received: from mta0.migadu.com (out-132.mta0.migadu.com [91.218.175.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DC14BD34E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789645583; cv=none; b=au2A7VS+g1bax46PA8DrCAmiMgxs7zbYqXuprjBpLcys+vRj6tEMGDSMaZQdRdMXKnpInZES78KpEW4zf8v7PxRNrUEMd8PuGcyn2/VwqgDSAZ50H4/nwE7pW654P65o41mIQML8NnzzvFMkF6MPygYczQGB5rtf73YVk6QQYtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789645583; c=relaxed/simple;
	bh=I+y/yZhjqmrKJ1vXwT9TgPxkQscaL8DMJp5rQ22dsrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a9BZrBvrc6Fqrx5sbcknk1Envb9jIa94JbkNkuDpNuCiLk7k0aoKh/U834/jzIy+IuPTJCp4W8JC3XJPhRwWvyMT6cAzZUBCaxMDEyUUyK2NGFMFDAiRXdGX6/bkG4B8vpjZv9F+Y7ZHcHTYSjHj6LK0YxBZxyeQxh2L4Z3RZE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=idNUoWmC; arc=none smtp.client-ip=91.218.175.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="idNUoWmC"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=I+y/yZhjqmrKJ1vXwT9TgPxkQscaL8DMJp5rQ22dsrc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789645573; v=1; x=1790250373;
 b=idNUoWmCSpPAg8zsXKrtRgklDgCHJwseeWf+tM83SaFSBsv2BejnrbtclsPcM79HRu9LHBpz
 msxKlIsyQCNsjhN5mesfMpIfZrunrROLrHolVWxiaBS0WErevSFh34HshSlpFtmwGgHZSPoVHCB
 2MGUpHB4EvfbiImEPiVxgosY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9c4b709d4d1133f3;
	Thu, 17 Sep 2026 11:46:13 +0000
X-Mizu-Trace-ID: 9c4b709d4d1133f3
X-Migadu-Flow: FLOW_OUT
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: pbonzini@redhat.com,
	seanjc@google.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH 3/3] KVM: selftests: Remove destroy_cgroup() from access_tracking_perf_test
Date: Thu, 17 Sep 2026 19:45:43 +0800
Message-ID: <20260917114543.85044-4-zenghui.yu@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917114543.85044-1-zenghui.yu@linux.dev>
References: <20260917114543.85044-1-zenghui.yu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

destroy_cgroup() is not called anywhere.  Remove the dead helper.

Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 tools/testing/selftests/kvm/access_tracking_perf_test.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/access_tracking_perf_test.c b/tools/testing/selftests/kvm/access_tracking_perf_test.c
index 98ace8b8b4ac..9b83e4efcaf9 100644
--- a/tools/testing/selftests/kvm/access_tracking_perf_test.c
+++ b/tools/testing/selftests/kvm/access_tracking_perf_test.c
@@ -523,11 +523,6 @@ static void help(char *name)
 	exit(0);
 }
 
-void destroy_cgroup(char *cg)
-{
-	printf("Destroying cgroup: %s\n", cg);
-}
-
 int main(int argc, char *argv[])
 {
 	struct test_params params = {
-- 
2.53.0

