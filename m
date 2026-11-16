Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825444;
	b=fgisjxHjaV47T0mE9/NYzCQvoWjdhH5xkdGlocSkSASiqmq+NpccbFe4dwjFSNsGatug
	 r/lw13XQ2VaxXRAlHXTuaOPeN6SZMF2h/ugdPUdo/OewgWZSE4b2gAFAiL8spPV/TFb6W
	 acz3GXDPeTS1zMxnimiZ/Wg0EzFfdiS8JT/UDMiYJDSVhiKBVBXS96efDSo88b9obvTXB
	 IbeR2NfRzvVC2DFgf2LZxT5lKlSLPQR+/CBHEZWpBx5GkpBz9oMNmxLd27ITHVDnXWqEn
	 YsAc/bnKwNvpsFelt+jn/wgkjoh+i9bwwSRpMuXzWnn4CieX1nzaK0qnGhdTACsPZfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825444;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Scanned-By;
	bh=0Gu+Ukkm9LaTMjLC6EylFPESV3dPO3uZmybp5fKqeAw=;
	b=jFDyUI4x/tZlQHj3x0SHFDPEW5fqIoJ8ckFzC4+4WdcVvbxaAl/xEKKeTc27chxHz42C
	 VwVCtYTVv7Z+QcS/5EMf6swpvKFdbZCJz1sVRygmRamh/w8FsfTI8JdQ37e0Y+T2iKXPU
	 A2ZV6mLPCxgfvUGhCs+Ou0fbZc3SXHM9gyEHeNLlLnUt6alPdG6KxToOOWZlt5uWJX2TO
	 +Imc3Y2Ch0eEL4s+gmmDT5mJ8IgbI7DQdGskUN7jkX+syrwGDbXgAmx+Qk36CpHm1PjKp
	 ck2dLpiuXWeHbdrorPo1PunjkCyo0u2q+zMlqqJM/SxjJStDf6PQkoOMQ7ZsCBSEXUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl9nygRv;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E9F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18E9F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Hl9nygRv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794825443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=0Gu+Ukkm9LaTMjLC6EylFPESV3dPO3uZmybp5fKqeAw=;
	b=Hl9nygRv1xZ5lelylWtL/P55fQ6nxL4s2hpnz36x2NtVLnQY3A4FJZRhW3ldLu6US1iDZk
	s7DFCnuSyGDQOeLfmkvulhK8MSG/gFaYxnAfAnG/Y6auwyKcuN49C+OW4dqONx+12YgU/W
	jnY6AmmK90QQC9qB+IE3spnNB6XyxzQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-88-xrhj7BO1MY-zWGsEGWyiSQ-1; Mon,
 16 Nov 2026 05:37:18 -0500
X-MC-Unique: xrhj7BO1MY-zWGsEGWyiSQ-1
X-Mimecast-MFC-AGG-ID: xrhj7BO1MY-zWGsEGWyiSQ_1794825437
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ADFCD180044D;
	Mon, 16 Nov 2026 10:37:16 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 573A41956088;
	Mon, 16 Nov 2026 10:37:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] selftests/powerpc: Fix set-but-not-used errors with GCC v16.2
Date: Mon, 16 Nov 2026 11:37:10 +0100
Message-ID: <20261116103710.674746-1-thuth@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

When compiling the powerpc selftests with GCC v16.2, the compilation
fails with:

 ../pmu/lib.c: In function ‘eat_cpu_child’:
 ../pmu/lib.c:86:22: error: variable ‘i’ set but not used [-Werror=unused-but-set-variable=]
    86 |         volatile int i = 0;
       |                      ^

and:

 ebb.c: In function ‘ebb_child’:
 ebb.c:352:18: error: variable ‘val’ set but not used [-Werror=unused-but-set-variable=]
   352 |         uint64_t val;
       |                  ^~~
 cc1: all warnings being treated as errors

Add some "asm volatile" statements here to make to mark the variables
as used and to avoid that the compiler might optimize the code away.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/powerpc/pmu/ebb/ebb.c | 1 +
 tools/testing/selftests/powerpc/pmu/lib.c     | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
index 21537d6eb6b7d..f4ef92bacd9ab 100644
--- a/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
+++ b/tools/testing/selftests/powerpc/pmu/ebb/ebb.c
@@ -391,6 +391,7 @@ int ebb_child(union pipe read_pipe, union pipe write_pipe)
 		val  = mfspr(SPRN_MMCRA);
 		val |= mfspr(SPRN_MMCR2);
 		val |= mfspr(SPRN_MMCR0);
+		asm volatile("" :: "r"(val) : "memory");
 	}
 
 	ebb_global_disable();
diff --git a/tools/testing/selftests/powerpc/pmu/lib.c b/tools/testing/selftests/powerpc/pmu/lib.c
index 3213579874084..32cafd40d2c56 100644
--- a/tools/testing/selftests/powerpc/pmu/lib.c
+++ b/tools/testing/selftests/powerpc/pmu/lib.c
@@ -95,7 +95,10 @@ static int eat_cpu_child(union pipe read_pipe, union pipe write_pipe)
 	wait_for_parent(read_pipe);
 
 	/* Soak up cpu forever */
-	while (1) i++;
+	while (1) {
+		i++;
+		asm volatile("" :: "r"(i) : "memory");
+	}
 
 	return 0;
 }
-- 
2.56.0

