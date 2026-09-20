Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D430375F7B
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789914540; cv=none; b=Y4jdBiMoSWKE947uTOCfxrwL543KgpVClVuBGMhaL16/T9QI0kcpjC7UEQ7J7zKJuzqQBFsrCRfiEQH4biwbzMjK4G46TW574HTlqtDtZ+IRRg76wdFIHx7bQyPB2iHXzZUIaZdbqxVhZqfE3gpd9CtOXXbgg1cwDdqmgWTKC1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789914540; c=relaxed/simple;
	bh=Y3u77N/6KvA2bHU5i1U3fQaq9HzFqNXQR/t1pdDCMK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+mLopXhb6NytefHQ+W9GgwMhpYw25kOVFif1L7Ra85BudxANv1GygjdXahTfukzNNjTC+rCbs9kn5jrHjg/n4ICts4YUzkKhGEJO3RqocvRRWuE5KGtSh3+bEC8bUnXPS/xwAUyLF7RTBJH4A4pqjcdmg46fykc7LvV2X6a1zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzhHhKOt; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzhHhKOt"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so1895619a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789914539; x=1790519339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjpLp4JtVENucB8aT9J/XSdliF7SjYN6mnB5JCQ6UTA=;
        b=FzhHhKOtxr3nMlU3ImL7iyopfgvLZAcomFvFmSkdbACJgTAuRHnbw40jj19+jjWUDa
         5xIkPd5mSplnc72oq6/6QFVGaYNaRnVo3hXuB91fTWCJjYHMfGqgOLsSRvz/Ojgq/9bC
         AaxDquYWn6Pdn7wYRkimJo3TBhxFx5cI8+uxKKU8Ryh92ve+GMNSo+u9D/S8zdIa8hBp
         qZ0yx4TQDXeEKrFmEPa5oq//Etq8rJrBXSkFpJtGLEs6mYe8NLsCCqdkWZaYrsTfXz+o
         0YbTAJUGY9mKJOBub4qgNuh4C1S3Ax0jl9nicAxAgVW9a4MtKususe2y1jlrKQ7eM5i3
         WPpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789914539; x=1790519339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjpLp4JtVENucB8aT9J/XSdliF7SjYN6mnB5JCQ6UTA=;
        b=KHURL5KN8myVIeL4ucFPyjZ+Y2PeBNQnYlL5zAOZixjhjh9Xz4O4BG7yq21NQu4/Qn
         RXMv55TGxopewB9YLwOtkjAFbiuKmkbU1rGRq2yTYfFSo+Tl4RC3c5nrqXcLFo4ox9F7
         4FvigtWeergkgARnz10iXc/Y69w+YBEhE5+4AoPwFB+92WnaMWDQ3EUgYhh1roCtSoyE
         Dz+NXDtnBiiO+/zTS0GkxQBphSho9KRpK6HQ5IWezrRyTdP78VtKUbPc5t4J4lVKG1L7
         PQtaBgU1gs4a3lWnJl2WHTD/X4rU/QvcqZJAMDKtvDwoVrA7dZaNCbWEAM8YOoPhgaXd
         qynw==
X-Forwarded-Encrypted: i=1; AKwUvBzzC8YndcAnniysbSNiGOEB9Gxn9rKH2zuPNeQM47qHasbb+viTUYwz/p5k97D74J84rqihqW8VjPb9dhs=@vger.kernel.org
X-Gm-Message-State: AFuF++lKw80Ne4Zfs8gxUOdeW7YNjxhebdNZoPfOzKNokxUZVhyBSSDa
	yKrb7EYp5QylXVHOSzC6eujrqBsxVietWddHiinRQZ9Qz9zX960dmG1fE7sgIawY
X-Gm-Gg: AYBFou1+Lg6J04MzDIwEmkfUu+tgaQq90LGeSVE3oef139V/y5swWogvyjOf3ubjt1+
	DPmcQqQu9Uz5rfQf+9QWvqg1jUk5A7nx7mP0hJWZmzPZAM+dya/LOHV8up5eaUc5seFbH/x9IF5
	C9erMLLTaCoH+aoVzUJEzKeSDzM4rb7EWTcuCzHeKwU2YNFo1matd1WdPRoKgsi1hj8uOrDE1qu
	1L8+QEBl4V8xkiDU0hghauH6CJxGCk9ssU+5x2eA+/AGwT9Yfl+Bymw9HIoosrmwb2ABN3buvC3
	Ieq6dEvJofMe0gnFPp02xZvcxVXkhSSMg7MV0PhhJJaPyzdRwRoObErCE7CQq55A308Zzz8ZMSd
	kzOp+G/vRPxR4BJ/aIB22mwDmJER8kv4qUuSck47XgQCZFmHUwVivsY6sK+a3vnEUQbglf6lpBm
	qMEdDM748SIFCJFSpT5XU2B/7IQrW1m1o9s8HrJq+j7b9AYyxBGGH5OQEHlJpduTM=
X-Received: by 2002:a17:90a:da90:b0:39e:6a7f:1dc9 with SMTP id 98e67ed59e1d1-39e6a7f21c5mr7542737a91.37.1789914538671;
        Sun, 20 Sep 2026 07:28:58 -0700 (PDT)
Received: from adi.. ([122.171.21.241])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55d2269sm11992400c88.11.2026.09.20.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 07:28:58 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Sun, 20 Sep 2026 14:28:49 +0000
Message-ID: <20260920142849.294162-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer bound check in rtw_cfg80211_inform_bss() only verifies
that bssinf_len (ie_length + header size) does not exceed
MAX_BSSINFO_LEN (1000 bytes), but network.ies[] is only MAX_IE_SZ
(768) bytes. This allows ie_length values up to ~976 bytes to pass
the check while a subsequent memcpy() from network.ies still reads
only 768 valid bytes, and other paths that write to network.ies
consistently cap ie_length to MAX_IE_SZ.

Add an explicit check against MAX_IE_SZ so the bound matches the
actual size of network.ies.

Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3468d4114f60..27e7b8442d7b 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -219,7 +219,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 
 	bssinf_len = pnetwork->network.ie_length + sizeof(struct ieee80211_hdr_3addr);
-	if (bssinf_len > MAX_BSSINFO_LEN)
+	if (bssinf_len > MAX_BSSINFO_LEN || pnetwork->network.ie_length > MAX_IE_SZ)
 		goto exit;
 
 	{
-- 
2.43.0

