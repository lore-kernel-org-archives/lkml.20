Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793060546;
	b=WTq4x7C07xvJN4+naEMKAEuDK5d9QIRC/+nLddcHDlTaxe8xCc25W72+CLKkB5ykJ/HE
	 fmQnxbNFycrds7jmYd20fnY8eGOtjslDBHJzGvAxNEIGwVhsCQRWK7Xgc4XBl00VLkX6j
	 2eQQJuVX3IOWzk0JA8W1iQzAmL2fAwUgUMRIDQcfus7leouKMQ7GgLYyTaTYODXeR8vGq
	 bYRbi0oYoAn+hIm8WTV0R41vawr0V/vfPEdvesxzAVJCizWuWs0ji1QOPxwOv1+Os3Jc/
	 GJspmkYlkA/6u3y4Sq2RFQ9u/GnxZ2EDJbw/8PXIoQa2qt85jKSEuGQXrXlpwp3pU2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793060546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
	b=5jviMDKpdOLwMQSNwliJJSL7/W25bqJrt3JyFUOvBsjP1t+6ZTlMetoOJgK3TD51+xMb
	 o/stBoXC7EOsqQ4fjeZrK6KL7/fdyK/R3jFDtMieDA9ZKIuy8BOlEXw/dNbHtME0hCwsv
	 HzT3itjCD6yGqMGDx9WElq/tcOdF2Qn1bA+yhOCwcOkgxp5uTH2a0HFenCqe1ccVnaMyD
	 xq6trfvoj1F5mPK435CDKxm0tWPGzyOz3ozwlfWQHmG0jY/zzfXc4OnnKjYAWHS4f8l1Y
	 OsZHPtQGXqexIp/octZNDSM/vgqMv3y13thsOsoC3gBhrw0NoUGNiGuqUO7xvYIKrZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqVRwstE;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ED1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 00:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47ED1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RqVRwstE
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-181516de561so280161c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793060544; x=1793665344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=RqVRwstEk0IAtB01732EcshaanpMY5DypEHX5WxS7yKbFTV8unwaPj7JU2c6j+Kz9S
         sxMWWcScesjf6lZxo4chZlxpVFqI/t+OpJ4Dsx8s4ar4RN/9Fq5owjyN5hnWrZZ+Ht9w
         dIQdya0CG3PvNK965IBtrFGG433MIrZh6+W57OYG59ZiQMxSE/Flzj7uM0wP7mRBg9gA
         EKLLqiTeEzAIW7BxeL1nPIfEEAfMlFLyRXDT6CsYt4FsBOV7BW3IbeV2vCvMNdhh9mmO
         dwA2I9YAUo6r6XkpMHbg3lpJdKP3U1ab+Yw6useqOybgE4aUUFcIMXuCuXboTAQBhFvs
         XB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793060544; x=1793665344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1qBZmfgPT2INlHLC5uDOw8q+VbmsUhEO4KbGb0W1nwg=;
        b=biqZhts5LWsPKFpabt870x4mti/J8yTcS8pQpjBYAHkIEJHQSazAgjnoud89WX4EQ2
         cHd8jh69KqfZJnbFu3HXP/E7nR7pbzj5r9TwiwTOvOXnsDdKyXiK1wtSPH4lIla+q0Ji
         PFrrw++0Mijzc3pTcI6yp/4YtnjKKkUarBX2UYjkrVb1wxKbt0GEY4CdWAWfBeg1pnk8
         zM6ROF5+Jz2Ax56zBlSsQoFno0G2j49K9nIMKOaVq0R1eY8dF0ezZJEvz7UIxCk2g5w7
         XgwvDy4du2Q2exQIgwGt+kkGtveXW2EA4vtg8TN6oAK4uwH2b7MEjjG2p8VaW3dBkSIc
         yI6g==
X-Forwarded-Encrypted: i=1; AKwUvBwQII2SvaIq5LybxkCmQFQexUV4cLfR5ZTHlYnhpKcdzYlO49gy0qjR0z7vylpeI3y7PuKCQyFXoiEKm/g=@vger.kernel.org
X-Gm-Message-State: AFq9FYLBz4dwyg/Mr3byR/iwHtWQV6KQuD4Z+8tAgszVYPs/PpwY+t2j
	0EpsJHjoKcGumr1XZOfkFt7MRUpk31DuF4lpD8yryMW/KXG1Q/CS5acP
X-Gm-Gg: AYBFou31ZDnX/guXB3xtDk6OuQi+oXO1mmQjyfbm1V9YaST88SgZ78wqW9owAFBa08w
	Yy3h+gWg+zpoFn6zTmn+wmqzSy2m+X+E8ULJKlPTTeLDKGY8Y5YvYMXTUjfImgYC//60SrOBscv
	jyIB2H0wT4GKTcHGURR+pB1Nf+TaTGCiIoODr2c6F7mfdt3WQpHEe+ZyCr17oMBEnOAdJDjyJKo
	dSMATH+fNKdK5RqteEaIVp1eeicK3llfmbN9BBF+4LvTwGoBNtXMzcIIe9wkwgtMEf38pnQd5xM
	x8XEWE8Im1NWJXpRXRvbiTcX+5iVE0VCJ9JMaCxZPinWD+3/WhQD98hqjnrLguzbqyZqWKSWs9U
	2BgFzL6MKOQCjxNQMMEeHNWN8mF11yC2lr0uOgL4XnSpQSvYtCwl1zESe0EdvgJ8IKjZZXRAiNx
	t6CiOK+eY50g08gpIdufkwaedBXJ6vSa5ixJQuymcentreubCMNKc0daHM/1i20r3zGgr29D96T
	oCpT8ImxWfjRaz+x9Viu894X3l7ICbj9wTk/p74kk+rgJNVbIqZNntRlXlQKVkBKt94FcyU55I6
	Qi2JKEuKbS5egTeLGU2FkzrSES8m
X-Received: by 2002:a05:701b:240e:b0:182:d0a8:d1a9 with SMTP id a92af1059eb24-1a3bde8faaamr1245749c88.0.1793060544072;
        Mon, 26 Oct 2026 17:22:24 -0700 (PDT)
Received: from localhost ([103.204.210.88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a21bc6cbsm27529598c88.16.2026.10.26.17.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 17:22:23 -0700 (PDT)
From: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
To: error27@gmail.com,
	dan.carpenter@oracle.com,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Subject: [PATCH] media: atomisp: Fix memory leak in atomisp_alloc_dis_coef_buf
Date: Tue, 27 Oct 2026 00:19:40 +0000
Message-ID: <20261027001940.20565-1-sifat.yt.2.0c@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate

fails to prevent a memory leak in the error path.

Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index eacd7ee5c050..48196a358ad9 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -1373,8 +1373,12 @@ int atomisp_alloc_dis_coef_buf(struct atomisp_sub_device *asd)
 	/* DIS projections. */
 	asd->params.dis_proj_data_valid = false;
 	asd->params.dvs_stat = ia_css_dvs2_statistics_allocate(dvs_grid);
-	if (!asd->params.dvs_stat)
+	if (!asd->params.dvs_stat) {
+		ia_css_dvs2_coefficients_free(asd->params.css_param.dvs2_coeff);
+		asd->params.css_param.dvs2_coeff = NULL;
 		return -ENOMEM;
+	}
+
 
 	asd->params.dvs_hor_proj_bytes =
 	    dvs_grid->aligned_height * dvs_grid->aligned_width *
-- 
2.53.0

