Received: from mail-dl2-f12.google.com (mail-dl2-f12.google.com [74.125.229.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0FF4968FF
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949904; cv=none; b=i0TqR/VYHLHjWcSdljdDapUoOpy319pNm45xf1J/PLaY107HAZczQ+mJoUZzzpQzw9LXyvLi2xRKw2i+/pzOgzVOJ26wUKUmfVc5H+DNg/SHVpefyBtm2+PWuhSJtU2RTHXyfbT/YPwmxllHl2QZqWVnKmuG6xzvoiTGb7gcDI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949904; c=relaxed/simple;
	bh=0aA08cUOcCkvWwT2S45HvZ1jn2zLufS3cFGbct+/1wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBSZI7rZ1F+NcSfBoCxYOsnMpVMUi06Cq2tpR/BI0MEmoo/6HVv9Dh3Ah1F5RVPWqpCcY4rP1guhYTZwTZdoinkl8AbWjUlRvfKiTggZYfL7wK7FIzAPdu/P7qUs7YXzJacKOOtio2kEhPcqpZvyS0Ju4xxltoYyc/VAum3634o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cJzdOkKB; arc=none smtp.client-ip=74.125.229.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cJzdOkKB"
Received: by mail-dl2-f12.google.com with SMTP id a92af1059eb24-142dd04be87so1765367c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790949899; x=1791554699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWoTdtEhaANGiWjxC7mDCG65IUsbfc9dm1bjsFUluhU=;
        b=cJzdOkKByWca2JovxDM2Vynyr8KLVmM4JkmHnzvnNeRh6yxnefc/y4Pp0oGJAOhH2+
         xrAT8lx8L0N/tGHlQjLZ3+YmAgR7Qq8Lr/Frrpbh0rnSJbH4qS5P09Bs6Z+WZD8REO0H
         9JdzalxWQCY/xlONSHdZh7/bKZiUXsA5mXfKfHt6+utPuQGV3DJ+XO7kBriQT8t2sIAB
         qHsiDq7op9U9e22eE8V8b5azz3OmdJQqjRQ7dbQR29LUQim/aDN17x4EqcLAlAVm1AXk
         OclwTHxtEqbu6enEiNwwKO06KnaLJEUPCt2FIubddcFF9LotqkbNlA/rAtjqNjFR19P3
         n0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949899; x=1791554699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWoTdtEhaANGiWjxC7mDCG65IUsbfc9dm1bjsFUluhU=;
        b=gn66mLOu+K9MchgoHUl+gdo556rh5qPjSDMBUulTMIuar0vZLQHBsWZAYtkBWN7gMJ
         whqn0UxskCvsCQSQCaa4rZz8lJXWcx21HEuRe4ma9HhUJkBBROUTXo/p70mhpQUQsO2O
         CYsBrDoeGHG3eM0wcuK13mqIRAs0NgaqRmdxsiqvdPsuIhEFsdllGtdLkOtCO29yN3uF
         OfHDLkPuV0kjY1AeIHy8IuQAoXds8etBfc3jrjRru/7CjnPJFWNbhQ5d8itGx/seDp2W
         kogM31Rhz77ahmmwlH8mFudJ7sMhGKO4HBqnEwIbU5XtzRD/+4Kzu8xYBw6im1FYnLbk
         dC3A==
X-Forwarded-Encrypted: i=1; AKwUvBzOQJuZjaWzpl65WpxV0tWekFbmmrw1bTlDd0VNmKCv8qKAT5zJtgTMWXMcB/PUljhtY1JvHSTOENV7mws=@vger.kernel.org
X-Gm-Message-State: AFuF++lxAdgRrdNy0i9QGmbvyRMLd7lmpUbBVj7BEcbBun3lOeLvKHEQ
	oevR2zPbacnocopw6PwEEhmCIjSOuykk5Z84t//dT97d5lnHI6JIdYrM
X-Gm-Gg: AYBFou3LV1cDnUD/AT4Kgx23pS71tEZ2CklccJmhS4h7/xRcy8UnK3dBoA92EZyWHGJ
	qsCFtMLDx6UD070MDX2TdmasnsFI8ewBMFYxsP/gSnWfzBIDXxD1ciqHeKHdL/G4c6CISSw2Kxo
	xF4VJsIDcSui+BrRtfGHX0VDilj/z6FV2u305DX3MNTl10WyJJ/qm1l/6Pm1IYXCCSILvu/oBrt
	E0pv4MzCPt5GLylV7kUZH6w23bc7GmJOFosOxJs7EMMP5hG+ZJ82J8ynLPiqwPKWCiAm5Jca+b1
	6kmt0QD9YA4x2iNNN76HYAI7YrNpltNP2K2T5L3SzsjkZvaRW1T7Cz2wXQW9an20h6K3KTV7w4V
	GRDSoZfeTdw4teGOcLYoGCMOrtGfSrR18iZjyedFH7ePoF3Vvm16BGckvl1eb7McLsBm46VXsNv
	0jl0qwdGY4nVuSJESjvVWNftuCR3ubG/A9wGXyeo66DM8/Xnt6NnZAc2ENwtUSNcSE/VGIXJ83
X-Received: by 2002:a05:7023:a4b:10b0:144:fedf:5789 with SMTP id a92af1059eb24-14f5bbfad09mr2830789c88.15.1790949898789;
        Fri, 02 Oct 2026 07:04:58 -0700 (PDT)
Received: from adi.. ([122.171.22.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f4766f92fsm6656244c88.16.2026.10.02.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:04:58 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Fri,  2 Oct 2026 14:04:50 +0000
Message-ID: <20261002140450.3209-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920142849.294162-1-itsadi2409@gmail.com>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer bound check in rtw_cfg80211_inform_bss() checked bssinf_len
(ie_length + header size) against MAX_BSSINFO_LEN (1000 bytes), but
network.ies[] is only MAX_IE_SZ (768) bytes. This allowed ie_length
values up to ~976 bytes to pass the check while a subsequent memcpy()
from network.ies still only has 768 valid bytes, and other paths that
write to network.ies consistently cap ie_length to MAX_IE_SZ.

Check ie_length against MAX_IE_SZ directly, which is the actual size
of network.ies, and drop the now-unused bssinf_len/MAX_BSSINFO_LEN
comparison.

Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 27e7b8442d7b..7e964b15ae6d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -210,7 +210,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	u64 notify_timestamp;
 	s32 notify_signal;
 	u8 *buf = NULL, *pbuf;
-	size_t len, bssinf_len = 0;
+	size_t len;
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 
@@ -218,8 +218,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	struct wiphy *wiphy = wdev->wiphy;
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 
-	bssinf_len = pnetwork->network.ie_length + sizeof(struct ieee80211_hdr_3addr);
-	if (bssinf_len > MAX_BSSINFO_LEN || pnetwork->network.ie_length > MAX_IE_SZ)
+	if (pnetwork->network.ie_length > MAX_IE_SZ)
 		goto exit;
 
 	{
-- 
2.43.0

