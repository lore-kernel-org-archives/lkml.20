Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=199.89.1.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043793;
	b=shXZjmrXWngURLerCLxhfrl5dSye56M5KGtgyW5LejsWxd+hCPPCCz2144K9yWAbevjt
	 jRKRiSLnmuM8eL1VFsSJed/Mw5vKUc6NXDl3AzzPFjAbXSBp5ng02f94pTxqTaA9KLGsZ
	 6jyI/9aH2Xk80YzCsrEcRsfPCsp2OHIg3kaXD4Y30wdLOqC1Q4DvADaMrN84W7MG393iF
	 mZjrvXZHSvjpKkGsIwMAjo/YLxGgyGl1QP2wyDXvoV/4mvRPzmGbKNiKAHwsqrNOn7GyA
	 NBHdfMn07icFFdgzg4vamApK1lWmQxY0bQH9cp5RcrNIFywTnEeTiv7YYo+wPRse63Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043793;
	h=DMARC-Filter:Received:DKIM-Signature:X-Virus-Scanned:Received:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kBMCb7RcCV+8caCyuLc3yIo5s/GTy2aYFC3sl8QUZ0Y=;
	b=JBnE2vZ3Kyk9eymN6UwQujc5hHvkcYi4CTF9RwqBh86ZISyRff80+kAJHAX24MTDhy/Z
	 8sjMMh3Hr79SEucaF1cKE8+pMyehndBwXvxaRw760QC+QFtzc8ClBkaKmSqfiXqS2ur0E
	 6OjntHM1TYa0DvOrJhUgMIW1gBDUGDqqZJs/SccRiiaxTRseLc7j7PsqpoCz42Dsq6/DR
	 8rUIruuKAXZDzxmnsClE1PTFWmYEgEFsd93oao/x4hUogwCvSemxiBms0wh0JiANaieXX
	 aKkxyyBFxk3/HMiZV9jllRK4gtF0rDymgCXJJZ+pA+KDufRl3GuxQlfz9EPUfQmjy5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=acm.org;
	spf=pass smtp.mailfrom=acm.org;
	dkim=pass header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=NNyeMdLn;
	arc=none smtp.remote-ip=199.89.1.14
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F71606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9F71606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=acm.org header.i=@acm.org header.a=rsa-sha256 header.s=mr01 header.b=NNyeMdLn
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4jD3vN0wtBz1XM30g;
	Mon, 26 Oct 2026 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:x-mailer:message-id:date
	:date:subject:subject:from:from:received:received; s=mr01; t=
	1793043789; x=1795635790; bh=kBMCb7RcCV+8caCyuLc3yIo5s/GTy2aYFC3
	sl8QUZ0Y=; b=NNyeMdLnprhX4NKEJ28lxYFvdlbPHY8vcUiiJmgmFHKL/oNh6fu
	5/RP7a7dl83Gwhw+HLx8b/9nlcmjs0EakdGe9gd6a+wY0ewY9FgTlPzC6y7t1MIi
	KNKAE+H360EEit7xFWUYwhzlVF1T/3M5OjAasSOpJhAc4Rh/FWAWVj5Jhugdi9Bt
	zXFlKTg8FFlFDc0jm0177/lOQGpWhT83hx8ViAE6iEQH9CJMlzMmjBNeMih/Ttbj
	q0bWAhXlU6evf3P+DoL2cCOgpb06rr9BAoKqEOMKA4vQBib0R4DCVyLJSeiPpuSl
	2PGivRBBltMmM+BswYWBj6pBrxecHgu2DOg==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id fWQ-iVHGBq7Q; Mon, 26 Oct 2026 19:43:09 +0000 (UTC)
Received: from bvanassche.c.googlers.com.com (57.237.82.34.bc.googleusercontent.com [34.82.237.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4jD3vK0BVWz1XM4Tl;
	Mon, 26 Oct 2026 19:43:08 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH] ntfs: Fix error handling in __ntfs_create()
Date: Mon, 26 Oct 2026 12:43:00 -0700
Message-ID: <7c0b17f73a031ae5564825ab94909f77eb2387d9.1793043780.git.bvanassche@acm.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In __ntfs_create(), if ntfs_init_acl() fails before
ntfs_mft_record_alloc() is called, jumping to err_out frees MFT record
0 ($MFT), unmaps an unmapped record and unlocks the unheld
&dir_ni->mrec_lock and &ni->mrec_lock mutexes. Call iput(vi) and
return ERR_PTR(err) directly instead, matching the
ntfs_mft_record_alloc() failure path right below it.

Fixes: af0db57d4293 ("ntfs: update inode operations")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 fs/ntfs/namei.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs/namei.c b/fs/ntfs/namei.c
index 62b01646c262..b46fe44b63b5 100644
--- a/fs/ntfs/namei.c
+++ b/fs/ntfs/namei.c
@@ -472,8 +472,10 @@ static struct ntfs_inode *__ntfs_create(const struct=
 mnt_idmap *idmap, struct in
 #ifdef CONFIG_NTFS_FS_POSIX_ACL
 	if (!S_ISLNK(mode) && (sb->s_flags & SB_POSIXACL)) {
 		err =3D ntfs_init_acl(idmap, vi, dir);
-		if (err)
-			goto err_out;
+		if (err) {
+			iput(vi);
+			return ERR_PTR(err);
+		}
 	} else
 #endif
 	{
