Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792543919;
	b=D3RZyDGjFGwFc+A4FZHa2H1IaoHlSHX5BoYT6xKH6lGCBnBz17N19hmgrVCFKTnDZGF1
	 zddADw1AQaOxhktT/Cdflo0wp1QCbUL7opYZvWIiAlxBkUN1bhkjXsX+4iQf65JYQhyZG
	 Vi6opTAaH9v+5wFRPa0w0etXvlGEdvdo2zNszHIscXTxca3ShaOCOsLpywEKsTkDorpwL
	 Jj4h7P2KoUDYFH1SJ/PxtAbPw0pgKdJlOU0LlC5UmSF3nBoM1COQ4fgfq4dR2zAvvIlZY
	 fFfZCipMlOPfV6aCJjvgr8T6VAwRa14czMe4MpyhZ6Q4MrFPzPR00mdaVVu4n7o/t9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792543919;
	h=Received:DKIM-Signature:Date:To:From:Message-Id:Subject;
	bh=QgLW505K760LJmvW9PVoBSFelPRHI35xzhdjjqNg4n4=;
	b=MlslP0j3ty5VQsv3tbNjtspM5ggeUZfW38RFVOf/hIxNc5Nn16ImuT8SnTwtuNtb2OmC
	 BXWQtVVdlv9Ry3nyYRGd+0oJN8SahuHS9gj9kq9M8PPJRSXg7n7jI+elGvmrxiqtsKaH9
	 2+DtsbsarsYYC4CSFeVUFLHgp9QY7qEd0++skw9UKcC1rwcRDaXBUOUsmNCuZHCnlSRTJ
	 x9pHN6vHO128Dh7eku8fO4/iML1OAX2Vq5NQuruYxv+WatFy5eaZG6CIbmLafZCIRxTI1
	 LVdauDqx07C1kORqWej6FQBsmtmTVP7af6Zuz2iXkt9JWGdh088nLkOX+PueD1e31QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=isRLtUDi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38EB606A324
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=isRLtUDi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9068D1F000CF;
	Wed, 21 Oct 2026 00:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1792543918;
	bh=QgLW505K760LJmvW9PVoBSFelPRHI35xzhdjjqNg4n4=;
	h=Date:To:From:Subject;
	b=isRLtUDiGZMhnuC2IFyse4ByKzGhcaBQupAGPVs3oMZaslndlxvnU4RaiOudjAo3r
	 34xRVF48XO65qTN8b/B8UIefX2pV9ZT6tzJjgw9hZzxHKuptMNRha0JbWHCQmM9GEj
	 nT1yQXXoe18WhwDQetNuEJLQOotbD4unF2UeGKcM=
Date: Tue, 20 Oct 2026 17:51:58 -0700
To: brads@mainlining.org,thnkslprpt@gmail.com,akpm@linux-foundation.org,linux-kernel@vger.kernel.org
From: Andrew Morton <akpm@linux-foundation.org>
Message-Id: <e7e8de4d10204573a54c2044c060379b.1@linux-foundation.org>
Subject: [PATCH 1/3] profiling: fix sampling step on 64-bit big-endian systems
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

From: Avi Weiss <thnkslprpt@gmail.com>
Subject: profiling: fix sampling step on 64-bit big-endian systems
Date: Tue, 20 Oct 2026 13:12:24 +0300

read_profile() stores the sampling step in an unsigned long but copies
only four bytes to userspace.  On 64-bit big-endian systems (not common
obviously), this copies the upper 32 bits and discards the rest, causing
/proc/profile to report zero for normal shift values.

Cast to unsigned int so we get the correct 4 bytes, while keeping the
shift calculation in unsigned long.

A small C reproducer under qemu-s390x reproduced this and proved the fix
works for prof_shift=2.

Link: https://lore.kernel.org/20261020101225.917959-1-thnkslprpt@gmail.com
Fixes: 2d186afd04d6 ("profiling: fix shift-out-of-bounds bugs")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Reviewed-by: Bradley Morgan <brads@mainlining.org>
---

 kernel/profile.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/kernel/profile.c~profiling-fix-sampling-step-on-64-bit-big-endian-systems
+++ a/kernel/profile.c
@@ -156,7 +156,7 @@ read_profile(struct file *file, char __u
 	unsigned long p = *ppos;
 	ssize_t read;
 	char *pnt;
-	unsigned long sample_step = 1UL << prof_shift;
+	unsigned int sample_step = (unsigned int)(1UL << prof_shift);
 
 	if (p >= (prof_len+1)*sizeof(unsigned int))
 		return 0;
_
