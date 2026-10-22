Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656752;
	b=MDQlARBBZkztuMUXpJjLh5sv5mbX2tyERk0bPPgIXyZ4HRRTo+G6yE+TGzlECAbNunUZ
	 1PM0XNb6UOcMNS6AuVkIVFoBUMwtupoM8U3V97LCHywQesvbF6s0lbfunJ7xU762v9xZQ
	 UsKna6gmoQ3jv6ur32jTz39ExqXPNKBKxLwC4CacmCshvq2FANBxAPZ49yAIYZGS+zQni
	 AeD+oO2lTP6z1DxiARvJ6NuxE5wociLRZg10l9H0TvIVZIHwsEBrbMS5mQSFnRBShzjgC
	 UQ3nNpqsSncZ1BlihWhF1p3vu6H930onKx6pePNA7op05U5qPkuMQl0e9BcotK/kGBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aVlYtta/KrcT5WK6Gc3rn580QQmS4HTBK4d5W9mNTEw=;
	b=kIHwhiLCOYX9WkrGgjgRCks5wed9FfCHkC6rHva40KB4eOPdbwcflA64Sm2UE3/GBzqv
	 v2RUUpJpFaQUjcdbBc7tkfCPgJz07bXgIJVFfj7XcLwoVhD1fgMWVcycVrgyLRl71W1FS
	 0y/VX0aLoJyyz3pwGa/9lr1HeRT5cXviirIXTJi6iU09zM03fionLS7Ku6OsFGnflaXwk
	 wSMXKJ7zSShpXhcH/mTCGATooESbO7vvt1LRTNFbR6FsLXaX6zK47vVg2Gmq/u8LWTwcQ
	 ljeu/DS1CEqFNFCKcwmC4voirEjvT1ymv1/1Ydqf3v+v7QtxVTMyM4vgY0njMXGytxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Um7uTgPk;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F157B606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F157B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Um7uTgPk
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so2162016eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792656751; x=1793261551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aVlYtta/KrcT5WK6Gc3rn580QQmS4HTBK4d5W9mNTEw=;
        b=Um7uTgPkC7TJMHDc0gTllt6RE9mQT8awZdRBqtzmuOpjF/nkcklZX/4UhUuCjAYeCw
         rE+eowxyhLvBhxyShGCHxzCHWQawiM5BdwrcZIf1eSBDp2gzNxFkrQSM3Vxo0/EoqrX4
         WGwUchfqdeGtEX0g00668TFGVex3/F6nqU6BPyVQAN1PB7W1ApQBvTpcjU3hbIAgcLSy
         NqvPqRYBCsHljlZB861XLkCVoaFXa7w1MUFmKywAGGV4mHpGP+mRVnygXoFsACjQ+mVG
         +E9Avqd0Xk5O3goRF6uufFQ6bkR3u2H1tSkiiYUMGccH7I5pjblaTJUVpICdA9qucPO/
         4MoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656751; x=1793261551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVlYtta/KrcT5WK6Gc3rn580QQmS4HTBK4d5W9mNTEw=;
        b=kkoDjmHx+NEjaiHuNKeFtwtWtS8J2l5jd+RVlgOfqUn1GmVNr8SdNrFccooQD5DUpB
         UKjh81bdWR7dAb1e9/WRGUz2RmrX86Wz3AocJH23/OmcU/Tzxikyqk+DUvyp8HWW3yvH
         BIKc38seBm9NaxC0sSxBL13kgN3hFmN8Wg20/F1NlSfs9dxuawaNIeFIpHjYHSuc13A5
         w1kVwY+MjFbFQHuX+q22ebhjVNPTdFdlYyfJMWdI7ZlpKMKmPlDoM8E3TDwZGce8BtMm
         BG0ifsFMT0L6QBzDtzTHrTv8G43jmyIxgei1G+rk841ma9OSjY/0YmANGeoQUDX+12Ep
         Z4tQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxANaoZy2Ruhs4S7ZQ6d3pfGZniU1ipr8urgaJxse7GOzC6awH+UQyWfCJCtnqMWw80azVkm0/8ut63Bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrBzkxekInM/o6plRggCSXiRdKAi5L5pEYwpPoJ05WH5+Jv6NP
	9vpu9m3imWQJy4RWSWjD+fss5mgouVBnb6QRHy2IPEGBG2p2aoI2PaUj
X-Gm-Gg: AYBFou102VEpxSECBsh7+Pmk0fzvSo6g4+mj4Zfs0YelR/MDYcRRHzuxQpYtmD9k1UM
	bTihou/PCVytASV8DIGUvF/mnzwCMAdzaCfDVJr6HocQV/Nl2iEw0uU5GVkaGECs6IDORvTV6Yz
	5tIOJCLxrLZsjlUlRt6A0lYRgSShHDGT3PZB5PoOZ1vJQdcV2zF4rFG0KXJEGBmATYFUqYFn5HS
	kZHonYgDqytbW4UFLEnuRd5HTGAmnTc4ObEJsd/AqgsUBIyMPAJNB4aQtkpF454+oV5SrdC2V7Q
	+SmEkt4gDZT6wVKBYLguzpL0wbRUoTWqfEjd09vM2yuzF/Ow31spPYIbT8Yu0ZEHZX2vrgPq00U
	lCq/BATUWTjjBSQaJRjFPmXWFR+TX2l1KUeqU83M1x38Y8FBsNlDcErpfI/hjRGIdv342F4HPFc
	6lR/p4muOoi/e2cLopR/H/gCagfJEVi70rWHPLMX/YmBXGYKEDpE+PKTKdo6eeiPkgg1pNXJYen
	mzf27luJfCb2E/s9q1BAptyOr54/+I42J4JnDZzt6ji1vMnep1WfJRhQfQeujpBh1LBytGWC0Rl
	nRd/fWNXd6M=
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr5901963eec.12.1792656750578;
        Thu, 22 Oct 2026 01:12:30 -0700 (PDT)
Received: from LAPTOP-LJ15R92N.localdomain ([152.58.25.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367f52ce166sm10790141eec.29.2026.10.22.01.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:12:30 -0700 (PDT)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] rtc: rv3028: use sysfs_emit() instead of sprintf()
Date: Thu, 22 Oct 2026 08:12:42 +0000
Message-ID: <20261022081242.421-1-akshatrawat095@gmail.com>
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

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(timestamp0_show and timestamp0_count_show) to conform to the
recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/rtc/rtc-rv3028.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index d25e33d08..b3a5b1ef3 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -147,8 +147,8 @@ static ssize_t timestamp0_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%llu\n",
-		       (unsigned long long)rtc_tm_to_time64(&tm));
+	return sysfs_emit(buf, "%llu\n",
+			  (unsigned long long)rtc_tm_to_time64(&tm));
 };
 
 static DEVICE_ATTR_RW(timestamp0);
@@ -164,7 +164,7 @@ static ssize_t timestamp0_count_show(struct device *dev,
 	if (ret)
 		return ret;
 
-	return sprintf(buf, "%u\n", count);
+	return sysfs_emit(buf, "%u\n", count);
 };
 
 static DEVICE_ATTR_RO(timestamp0_count);
-- 
2.56.0.windows.2

