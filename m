Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250A63BB9EB
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009737; cv=none; b=ZzyN0ufyF5XdDWOWIL6lMz0mvENgrImUt/z21KwqPeNHfRneTU4wQ7f5lQH1V33eC2GARF8q5njDGyoTY5wDBKMRe27M/Py+vrpZMMPiZEIleLQVlBE6HaTtdnkPE2GxVFuJcpCMyzAUFGGMfVcyARxFzNRiMeqHtqS4WwdWLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009737; c=relaxed/simple;
	bh=2j13DYvkGAZXwy2JcMoXZIr+Oq280cX2u0gmxz/Z1Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Maq5uT8EN664bKC/tM91s5j6849IZe6vT48fLTM0lj0kXIRQEbYIg9bEm7gBcBKAgpS8EeiQrhfjNFSCXlfYs3IVvPY41RLLUcf8MDV6iRsG1a+lywAAahDzAa7MSzmLmHNhf1MuJ1pb/aZvP427cmz2pnzy/epIIK0ftAI8yFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpmTogPJ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpmTogPJ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea34ef3so2835662a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790009735; x=1790614535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XTJouOQS2I857DmmbqIbezzdJgMxhuitBuEs7cKuxm4=;
        b=TpmTogPJ497aMEPqZX4QlWwmlKmSig2ltA8vgFiYTH/MZ2WOjnEgdin3c4my+s3nCT
         fxXwymDrF3N6gVK4TWsVdLK2y798L1LKyXE5tnis/XBRf5Qb+/I/oWCCqBKRUzLEEgY8
         Whz15bpEU48zLDbCj1h5hKJ/eEHGpAA/ea7R2omnl9tWQEOZXFXpsBNE/ExbaiyMeLVI
         SW79gBZxj1+FntTEjl9zD0Tm08yhhPNjMH4XxKKFEp6Xo55iMBQNj4nn68J4t9yKdwGc
         onNDmJPD5edGo/1Vxn4peZGI770hr4AJvbF4ol7CINuSn1eFvXe88+XN4zC5dKosz50H
         MHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009735; x=1790614535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XTJouOQS2I857DmmbqIbezzdJgMxhuitBuEs7cKuxm4=;
        b=nwj7eWAgmleS2v8Jzbmi//jtGmG0OQ9DLcM7lJSwfHChuCWpumlA9t/Ru6uklVDTUu
         NtAqO67UKEIIgk+hyefWUVdJDN7BPvr1YNl8sGs3IsIioD54CU7ZF1B2DjGjII9LXii/
         l4ksyrYL8KELYa2ManAEMZWVHE7oCg/67MXUN1BsQLNRgTme2TfbMV/l/uXVLaBD6Q7r
         zTBJ4hUsgnprm8QohFdhesDDwZX8Dp1EueVa80UAnVmeaYdCFynGOkDOA+V2Z8rBAoVu
         NcQNdGn19J6+ZVrcPkzJzOGvFtsbEtl1txGOjVhPyECe2DEjf+EofsuUjuIw7vELknJb
         eFUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRf5JXIy+gEjyKW8UJaaGQLZVAf+e9QxDorltmF1ofp9NlPcyfj2Xlw0VIY65c9wcWw/tMkBFQyMcFj3A=@vger.kernel.org
X-Gm-Message-State: AFuF++kl9w20Nyy0EEfsOtP/XrR/tRmV8nngxkxO94HfGQyYf2NHJq0k
	QOyhPIEJ0YRUOcqkhf0AzGYNHJU32yKBfj41z3yHwJQuYSa0QaVC0Ls4
X-Gm-Gg: AYBFou2AMjGTulLntHfUpLiDjYCRYn4X8CG5DRRZ8+c7l58MMYtNtVLJyQN+HyWY883
	f+62Yvoz1P7e1wWyy0vu9Db24DfMd1Vxa71HwtSigIpU68o4E8qBRuny6VLSw5QxzQxJKp/qLtB
	TVeEUA7WDuq9Ez1CEsmYktz1L28vAcIMEoxtMpeNoHJWbg9lP39Gs/ub3EISt4n5gKLADDd7CQf
	DkOTHbpuXJNlU6Vj9Ch2iQ3ks3R8CiEyiG8Sr7J2jICNHjv14w5y7AKcXm3m6rRJsa6S+pZtAZL
	yT7J4yf5FBeaL5HEtv6LgOBY7v2ypDTUR10loaGO5GNYlKxdp2yBohQhx7setfdww3FT9pXrE19
	o1uAEU0F4Nadx60/6io3s1yb8aOdJnMEed4858k1ilVsCLucJfQcuwfUFYA3+WSrNdGhCF8RIY0
	xpzrc6FOk5jnLS9NyZxLwKzKtbLCblabO5eZffGzSgLRMTOHJqFfbKdWlnK/CNqw==
X-Received: by 2002:a05:6a21:390:b0:3d1:7238:33d9 with SMTP id adf61e73a8af0-3dd8c3f2984mr19418535637.3.1790009735459;
        Mon, 21 Sep 2026 09:55:35 -0700 (PDT)
Received: from adi.. ([122.171.20.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c331aeeddsm19677805eec.24.2026.09.21.09.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:55:34 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Mon, 21 Sep 2026 16:55:27 +0000
Message-ID: <20260921165527.1379-1-itsadi2409@gmail.com>
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
Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
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

