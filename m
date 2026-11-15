Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794743775;
	b=Oz1h5nJRx0fflNUa5uVlXvmG0fnP4Ka4U1JOyc4gu4eiKHdp8dsEdUH3PctHjFKUTlw+
	 N/mfiAAoGiyLqF3QVsR28lvH8uqHNnvE25XRip/9dnNKA2sEGZFJRD/SbeQY6RmjIW6i3
	 lBP2NmcFr66aKGTHRtt0nkGsDdXR1lsTdZf2iqE1EPfgPnomBEcaFdK+0kfmWP8xqIGXo
	 JItXOCrGWiGNM9twVfCP7yf1wUXQFoexJYFW6au1/ZcVa/Dk1gEPizl0cve4ZDnlLacyO
	 arF6jLjAT2cuqyI58nGyV5PYD4h/47HDmpMmCeinMIMDEd1vX1Rx6AQYfPlY4ht3wmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794743775;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hfpuaPUeNzYRX/a4bpteWtQm3HZVKHFNeVxpDys+fxs=;
	b=16vgw4pYOyeFHIAXjw2T0fhBKkJ4culc+ac5UgAyEDenguxDLURFpJnPTbpt2kU2Fp6Z
	 h+9PPmiyHAo0XYHMn3B+auRC3G2nv6EfMuGFvlc45cJcUnH/uWEKk81oLkI6p/Dym+5rF
	 LSphEjrDifIARzfq6D0CHYn4DsHcfiSyVbzBqPFZz6U4CaWM7PJmu2rQnt6EkEvJ/nvaM
	 mhQS0pl3krPnYMe02+PiMgnvHX5kX5JgDb+oC4FbTZXQwRHneXaRHce977rNKoWdGVcdb
	 ZgVcyjXze5gYOts63gXHEyMxLWAuFvSHo9bMFaBtSXrtAgx6nhX8vEthM6g+wy5CaJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tn9z7leD;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E761606A32C
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E761606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tn9z7leD
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc758830601so2720935a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 03:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794743774; x=1795348574; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hfpuaPUeNzYRX/a4bpteWtQm3HZVKHFNeVxpDys+fxs=;
        b=tn9z7leDGheCOugWA/nznYEvtKxDfaiTWWpRt+sb6L8cX8DoslrAsdaNshDw1M3eQe
         LshUpqpL7PXQ26fkmx1M4FkdqTk5Xw1T90ahYfZZB7bCawPeDqcbNPOkChmZY3Uhw+hp
         vul99nQOgWv8Ew0qnhaAldImQFF7qqSAGMFqLFiiUtPpna2y5dRhq85lfCoZVFaHVfxI
         X/Th+7M0La+mFt1Swom/jBlVHh+XTSiFnnWaZfbiPYkGx1wBnGd+TrOdkjIZQK6E7MZ6
         2jc+MLYCn9zId6JW9vR/Nqdpbr/PjKLJtwnpgyPtx6fweEmXPxwZKrHqmHmfva9k7vIw
         lznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794743774; x=1795348574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hfpuaPUeNzYRX/a4bpteWtQm3HZVKHFNeVxpDys+fxs=;
        b=tIXJm0vqYHR36doGBC5hPav+o+MYhoqQvybow5RhlJ5CZp7CVLl8biCLeZDSjeYCR6
         G6dxlfUV6N9UZ09Sa5L2H31ddeUPc6ashrACk2sDN5KYQYBfH7iOo5iTcjBN5HSry/C4
         wmYt7sGacDkjYTDDdtkV+Z5iH4mxX7dtuz31umEujCIxWERDPjDTDhi5yOFKDB1uNE/j
         I2cHSkeQdkOKH81BbZfVQ9WtCzJaVDIFbD1uK3nSiN4POVPQ6IWIdEKYdfuMURNcFCpB
         SyeskrTgOj3dD3E0sM2+B8xYJQCXiqEowGRbN243CxiWsFoNqY1LsLrgDe+1UNKzwjEv
         jccA==
X-Forwarded-Encrypted: i=1; AL+hErH+Wq7UEQyvqFzDSO0U7YmRNBhp8NtRJg5NdsqCDnk086Wof0NqNfgW+/F7FbLKLL8sjscxAvs9c4uaX/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ODpXHZfyGOfAiFmfiZ9nhJ2KMgw9Po1Ilh/h+UPIemgtpNm9R
	j+3BaLaHQz+y2CxTtc+lqeWBoB5sN8WqglxeEdv0JNdkWVMd9ntsYoRT
X-Gm-Gg: AYBFou2HlegAAkUvkNsvg5T1mN8UX0CyEwQc4tJmseKVYB9i6sHpeBp2hQDOYZ9xUqg
	75eadMKI4ctc8C0+9dgj5SwUAK+687e+yrmWXsG23LgsWF/krLbTIml5tM41CXf0cZBUUgkY2oL
	m6SAmHQhY5K95FcytJmq7wg6+eTWqMbFc0hlPWnlzIEQti9IEPvp65inSg0dGAkZEcGe9z/BfVF
	Wz7bRWhymSRa8C0PuR1JmGOi1CagUAhmiS77Bm/zAqETmP1lITktgc3L3JS8D4xEkXkBgwwFsSr
	Y8kkCeaRvEYAvMQA3MFMI9ZoIK6NzLh6H5610I+M0zkn2t1fGACbSlPHM9g7UkOT3H9e3cxEirW
	VQAD81wBFbclJ2NMzcL+zUI0BhkSV5SZrwPERGlBnu/PftLQze3eF+v25am0MmwjWwOG+oUuNUk
	BKOq9itCnXn5QlnNC6qRrqjowsV2/KEs6UzcwdzX0i1kR+DZSqFbwWNbYiWGeZsRKZc0uMIS9D1
	yLQE+Iqn9ckzWJFnvsI41kLMI8sH4LBtPVNl0hShMec3DrdScc44Sr8/ZjaQ2nos3ogMiVQOBB1
	Px0Pd5xl5IVRzQK6EgDv/tBKAJpCl7utNPGI26wqxq5sJcCOFCZnaLchIKjelroShYYP3Fw5iPU
	H7IQQ/UtazXPJYuDYvN9JI/jRLOca/uCuOqXfKcJ7/28=
X-Received: by 2002:a17:90b:4f44:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b1b0cf43admr7838406a91.47.1794743774561;
        Sun, 15 Nov 2026 03:56:14 -0800 (PST)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:5ade:5fb:5602:326b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3ac294bsm5853901a91.2.2026.11.15.03.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 03:56:14 -0800 (PST)
From: Ho Jie Feng <hjf3108@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Ho Jie Feng <hjf3108@gmail.com>
Subject: [PATCH rtw-next v4 3/7] wifi: rtw88: correctly expose beamformee capabilities
Date: Sun, 15 Nov 2026 19:43:29 +0800
Message-ID: <20261115114336.1739863-4-hjf3108@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261115114336.1739863-1-hjf3108@gmail.com>
References: <20261115114336.1739863-1-hjf3108@gmail.com>
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

Make MU and SU capability flags each depend on the chip declared
maximum instead of setting both flags together.

Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/realtek/rtw88/main.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtw88/main.c b/drivers/net/wireless/realtek/rtw88/main.c
index a8a603aaee..b0c338954b 100644
--- a/drivers/net/wireless/realtek/rtw88/main.c
+++ b/drivers/net/wireless/realtek/rtw88/main.c
@@ -1606,6 +1606,7 @@ static void rtw_init_ht_cap(struct rtw_dev *rtwdev,
 static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 			     struct ieee80211_sta_vht_cap *vht_cap)
 {
+	const struct rtw_chip_info *chip = rtwdev->chip;
 	struct rtw_efuse *efuse = &rtwdev->efuse;
 	u16 mcs_map = 0;
 	__le16 highest;
@@ -1624,10 +1625,13 @@ static void rtw_init_vht_cap(struct rtw_dev *rtwdev,
 		       0;
 	if (rtwdev->hal.rf_path_num > 1)
 		vht_cap->cap |= IEEE80211_VHT_CAP_TXSTBC;
-	vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE |
-			IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
-	vht_cap->cap |= (rtwdev->hal.bfee_sts_cap <<
-			IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT);
+	if (rtw_bf_support && chip->bfer_su_max_num) {
+		vht_cap->cap |= IEEE80211_VHT_CAP_SU_BEAMFORMEE_CAPABLE;
+		vht_cap->cap |= rtwdev->hal.bfee_sts_cap <<
+				IEEE80211_VHT_CAP_BEAMFORMEE_STS_SHIFT;
+	}
+	if (rtw_bf_support && chip->bfer_mu_max_num)
+		vht_cap->cap |= IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE;
 
 	if (rtw_chip_has_rx_ldpc(rtwdev))
 		vht_cap->cap |= IEEE80211_VHT_CAP_RXLDPC;
-- 
2.53.0

