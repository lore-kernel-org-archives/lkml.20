Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560898;
	b=E6ItEub6xNkdu9ySJKtCw0/e2F5RR9Q1SlNZ6afB3n0xF35vcdCqyb7y0UQ38YSbceqn
	 hB0CaPDTqh6n3sekzqVsUQo4RX4+pYXz9ktggSRmaj6yk6yoL3loxHTXL71VZXx2jzB2u
	 g9/q4lrm1vryhox2vt5qsW8+l88/vBofl5WDkAY1OQKgBE2lIgAc4RzXU/Qj9wsFcje9R
	 svTip4lm8bXJlzX7L0mJhni52W92eSfIy3Qhg8zr8PFRSoQyfBodoAcJtAXnnAcxKnyYg
	 KTFqune5hnLQWB9Q95zS9ftPW2clmQLEHiQJWd/7Fk+5xk5feCQJJAFkY3NTNrTFfhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560898;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=y6F4gCnVa/0pT5fMCRcDStuTkv+qtsePWRTz5MRJzw8=;
	b=OCDSo9x2J7qysdKRKvotUPA2FKMC96WV8LZfJXxh6Cm0A9uzK/KGNM8nEvrzGhtgADWv
	 G7hRFMt844SWBvIKSCDHvtSxBz78Z7eRf2hpwPENP99G9LWth6P1bOrUjmmdUrfQye60n
	 U9bJ/ZtI9aXcXt2d9u9ocvk6QktxBT1vAHFdzzEZFKvpSQJepv7JHMF5HSbFlZNzFcAJA
	 0iwegKt1ju1Yhmv6USk2ZBizGZWjUeWVoVXZpQP4UIlVAujy2RwtyULNdkAqa0h1Mcdet
	 MhLR97eooZL37RG89im+HeepIZnkxxRIe8DnDZZ8m3W8ceSI3TAxc90ssSaSUHlDG+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG6u8cZE;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77FD606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:08:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A77FD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BG6u8cZE
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso242730c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794560897; x=1795165697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=y6F4gCnVa/0pT5fMCRcDStuTkv+qtsePWRTz5MRJzw8=;
        b=BG6u8cZEkLL7QRmO3TiBSMVSWusUtcNW1KdaUsCJ4o9VGZJUnjGqMKaTppluGE1EL3
         Yz6ptmJa5NsXEZq2+10P4JUKjdrFZ2KQvSvZ8ili+v105XSW+Jtk8+xJAfdYoij6bGYP
         Sw9GEBkStVO1AgJoyUDrq7fjUY3yI77GGt5zbNfX9WfleeDI/F9DnXTXwttq3L6wwA6f
         WpmXuF7Zr2DF3nhtB3OpuQona7jhcPKMI63xNqzn9l3t2Lvbv02/9uuWaT0DnU//jmYA
         xVH8tntzCH1ALgRKBEeOvwt/+txu0A9Nxp6bOlera/3gSaHMpZRagAd7Z2mntuUkgXuJ
         d5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794560897; x=1795165697;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y6F4gCnVa/0pT5fMCRcDStuTkv+qtsePWRTz5MRJzw8=;
        b=H8Z5VgcwyDWht6jGRHoOWEDQoUysIzKOBybbq2ILYaYDpyi9Kc6r7l7fg8Z2epwZc8
         9JFzWnRLowml1I5HrihF9/ONSZToiI6irZLqn4ppvG7pPKaOdGTsXf+5P6IGJQ6509fz
         nANeIfQY/s8lUT8Rcgr1rpW82KEMrG2NwY5suUHFRGId3q44ozK0425nIFCledylgR2y
         dzWVvmWAEphvOltP9MOqrvuclXblYflTXFc4IO56tetJf0hd3SctAukg+BIhduSRQALY
         NjvcCBgzLCFIbh1NxK9tgAcS24wQiiF6/AU3nmExSKY2+ceWug5NvVifo1KrY5SmSELf
         p6Cg==
X-Forwarded-Encrypted: i=1; AL+hErFOtrbVzukdlrpihZBQVd2Ean05mIFHsMxlCPZXlzOF1kKBL+tokEGYtQM5nAiN2LwdUjbxm1RxV3FVHJA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NfcdfyL2k3+1t96wORmiFkLH044JNrlyZMjkKknIuN+PlukSF
	s8GtMMbP+N1+wpgm6ePfKMJjRNNV1+LBCWANuUDu5Snde6x6sH53P6js
X-Gm-Gg: AYBFou0kZg9047TvWxNGgdfklhHqgokdRoUqP7nCV3VYsSqYHMlVG9LHd5gL2Oj9srb
	9N1sMGW8ZbmoGc0w0fY23mQI6X4r74H9gtI2EOq92peQdAo0fqd4vBI+YyexFnJvguWwcNXhCte
	7vu/0JB1JLuYrqbZtL6KD7xR/EntR+rz2rrakGzQk+RKdO3x/17ZdIDIK46ZvBhWaZhKWhBUs18
	qnZZP5pRsFSMf2nboQQ1sZUthTDbMoOFW5kxnCvLycL/2q76zEMRPi8Ij2wWk79yA/UVyEJ6Yiz
	UJPN/TGAbkk8X/3qUhpsVwD9PDHRO5BJBpMHcL357TpFb9gfJQaWV8uZs29jQ+s6ipiRceu6jtR
	zVSihFjsThxibQR6ibIIr0c45pCs2uPs5AgOZLJx3inPupgDPQ8aiDGFA1+OZp3yB0+Syn19v7+
	ZJanpFHyT8uEJz6P33ZZ9tquz4T9HNmHPDHLBWfu1hXOEKy7mob9VMwqr25ggyyNkT8lDGElVqY
	VAlHvphMtHybr+7fBC9V8VDR7SKEwslMtJhOc0KjTRBoKPsRf+AhoU7w3fpjSDP22Ztqh0pSvzf
	pfUU1Ih3+VjS2ZIlAnodO5dUpTWn02C8u55U834oRd50It4rYSQqoKNde0UHr8aP0qTzMNUOq7t
	fNW0XyUL5DuMZSJYyfwnZ0jCrhL5GUCUJciqI4g==
X-Received: by 2002:a05:693c:2a16:b0:369:fa21:ba0b with SMTP id 5a478bee46e88-3796721cfc1mr1578945eec.33.1794560896561;
        Fri, 13 Nov 2026 01:08:16 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955ffcbc9sm8090129eec.18.2026.11.13.01.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 01:08:16 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: hansg@kernel.org
Cc: arnd@arndb.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] virt: vbox: Do not report user namespace root as root to the host
Date: Fri, 13 Nov 2026 09:07:58 +0000
Message-ID: <20261113090758.87172-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

vbg_misc_device_requestor() decides whether the opener of the vboxguest
or vboxuser device is reported to the host as root:

	if (from_kuid(current_user_ns(), current_uid()) == 0)
		requestor |= VMMDEV_REQUESTOR_USR_ROOT;

from_kuid() translates the uid into the user namespace of the caller.
An unprivileged user who creates a user namespace and maps their uid to
0 in it is therefore reported as VMMDEV_REQUESTOR_USR_ROOT for every
request of that session, although the uid has no privileges outside of
that namespace. The host uses the user class to account the HGCM
requests of a session, so such a user is charged to the budget of root
instead of the one for ordinary users.

Compare the uid against GLOBAL_ROOT_UID so that only root in the initial
user namespace is reported as root.

Fixes: 0532a1b0d045 ("virt: vbox: Implement passing requestor info to the host for VirtualBox 6.0.x")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/virt/vboxguest/vboxguest_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/virt/vboxguest/vboxguest_linux.c b/drivers/virt/vboxguest/vboxguest_linux.c
index 7474bae2cd9a..ff66c00c27da 100644
--- a/drivers/virt/vboxguest/vboxguest_linux.c
+++ b/drivers/virt/vboxguest/vboxguest_linux.c
@@ -35,7 +35,7 @@ static u32 vbg_misc_device_requestor(struct inode *inode)
 			VMMDEV_REQUESTOR_CON_DONT_KNOW |
 			VMMDEV_REQUESTOR_TRUST_NOT_GIVEN;

-	if (from_kuid(current_user_ns(), current_uid()) == 0)
+	if (uid_eq(current_uid(), GLOBAL_ROOT_UID))
 		requestor |= VMMDEV_REQUESTOR_USR_ROOT;
 	else
 		requestor |= VMMDEV_REQUESTOR_USR_USER;
--
2.43.0
