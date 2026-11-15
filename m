Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794772452;
	b=qCRzwjcCG6oZbverjhFD3p1v+dPVHUXXGdM/nGMvr5CDZgMF2AIisXZNO0eXowd98YCO
	 4K3tgaEq92xg4g3lU/vB5GafV546AgWYeokTRT5nO3MTyNZbsgK3DRfbxtlNOwLhvr/zr
	 SjzKFLTNM02J0IqSaBuiyD7XWdBCMqkiTx2YXUktnpJAvi3XzKATttvrFE14zepv2T26k
	 GREPikg8Rwy0HmP4Rf01FqsbutQ/yAvUtPRqR594qkklkfyYT8uLXqF1y/ubp02d+Be0T
	 YKtyg3Vjtq22SO76OejxtJED3h7TttDOtj+IgoEu/5b/P5CF0mYmua1+uP/aPT1DK/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794772452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IJ7CYFFRnuMUcOgQJTml1Hz82ZRZNC46Q6AzDn0dn2o=;
	b=w1FtrjJLAxnb0HQZwQzaAQaEvF/tJI3c7+i+etmlVDYz2wK6bf/Ti0qBWsCcdkgSfYjc
	 b3RRB16TCj3mtBsz43nZRLB9yf8G4gaZhPiFfsnsI72oFCC9IiMNNKXNndcpROOngbbEW
	 jaXrbqkocHyImaV6fI87880SwanmNEwrSWqYkTz9rRElftvrDaEqbUDp83EC1ewnTQIcP
	 kM4pBKRFQ0ncjQKxBl57KnW4p0mIliZmWcplOAB6OMNdVSIGq6r/0DsOXZWKZU0sRSO8h
	 3luqOeCiddHRX6QNGVCzRz3jQcAbbr2unoeCFaMMr4rKQ367/SMvC/vMN4u2hI7OkkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UDeMwg09;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318F6606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:54:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 318F6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UDeMwg09
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b3541bb1a2so12313527b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 11:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794772451; x=1795377251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IJ7CYFFRnuMUcOgQJTml1Hz82ZRZNC46Q6AzDn0dn2o=;
        b=UDeMwg09StS3utRvtN3DD93DuW4CLS3wP/Q8u50maYfKcrbKu2D7P6BsKMO50y/hDH
         NFUEU+djKLuQ6pYk2TkFttNlMYN7iFUt9k6aSuSB+hOuFPfABf35J1C7I26MGlK8qpyz
         eu5dpOaHB7wV3yGhNxPdnTz09XGgxv/6ROJTfFkHuy821g3/Hs2fgn7kaKVAn21dRXUB
         QYcjJbVjgbdQD2xHA4g1kWgXGnYzaqZY7vVfkJr+OyX/LKQ6YhxLZ2IGrQv/L3L/cxNn
         7l2D84n42o+Iat5Tn7Cll3axUDEtinykdKR4eQ+/nGNbWFHAhkkTlJNLLRhgEzkmMrno
         pXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794772451; x=1795377251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IJ7CYFFRnuMUcOgQJTml1Hz82ZRZNC46Q6AzDn0dn2o=;
        b=knON67Jhr2LFO3kPVTBhoarBfQKaNpEDcKSsgM+ykMqnNVT+znh4Dca30OzNAgPosd
         1wyWc0kt3R+7khgynM/eXsUgx+SKpdNVhuFMH5w7EGuv5BFwGKydm3ipM53TzCQcXbEE
         xHINI5cU82zpZM1Of/yMTCIS5uB3KmEnRXuBxuGDlaBnex9HFFK7CNit3/NuayEsmbDH
         LLE8MP01tlTnQXA621J/vZX9MCDmFbt2SWDWt68ialo3dxE/uw6NtuFhmngBi+6Nbkos
         HaZhKgsuynG7bKGWqEOyd3oJTSlEXg9qy43vLPj6mxaLBqpiqfmnlAHjwYGr6JA6Fmyj
         7RBA==
X-Forwarded-Encrypted: i=1; AL+hErE/UukKpQi8O/l/R3L3M+OffIHg26lsYcgR+ZZ52t0G9SP0irssN3xBlO+c1neAmrirU4w+a7V0QMOtOzg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e6RpeSejT9gH9VSnCXbXaFDTS6ThoWte0Be7Ej2Np7+uRebLX
	uH2Xis1daIONhRWe6NWrA2kd4SitADaF3dwrYxg8Isqijy/vf8z3BkgyiKO1ibyc
X-Gm-Gg: AYBFou0QTAz8LGfzKALBs3sR/8L8nqFW/XXf4LMADNf872tKvxfsugckA4TCmGlLH9a
	b6iiWZxiAuxnGgZ3ZawE4J47J3kVkihLE3ridqDf3adf+HXiu4JTnhsmxACs2Z7VuPw1NYgkFVi
	SaFFYVUsTj8NdENg1Kq/R3cEZMn/O5g+uQth/kQnseDJ9Yt2EHz7Io4Js41AaXQVOUc6OGTrfQi
	m5gzXj29NWMJhoJai8eBeePMun5ZPtZLQOgCbHptWv2Q4DqcBMjputyAIjmZKxipD65ORAsrHkw
	YhUJ2dhVOhHoCHpUjnWySZsz0mAHOxfZmLFmkwvY8AainvTqLc1/yGDfS6P0uWEmkgN5YbCbzVd
	/kL805bhXXXDewS9icuIW4JhAbt2LaBc4WYheiBGohrVkHqJ90NlIyEm84e8307Js/y34JGZXTw
	1vcgL10PSZSgcpHH2ShUspFAL6OwUDYr5qRErpYB8yZOaAfAEOATQRrVN+NeA7FdqNa5Qg2gnve
	P866PkD3W5/o89QOH2cytDigWlU99NBBZccl9CahCzfouJ2z6SGfntAdlPne528YK8P7KKg4t48
	cn/AI2xyxjy4+ksyG7HRsVdKaQmP3BJAQG0/VpKZrDje1ljVXLPR90QyBN8Prw0f4fH/oh7xryT
	zdOSo7zTYFSJkzV3zEe/JAeZKTSc=
X-Received: by 2002:a05:690c:6e81:b0:8b4:d8c6:4d9a with SMTP id 00721157ae682-8b4d8c6507cmr4656127b3.48.1794772451152;
        Sun, 15 Nov 2026 11:54:11 -0800 (PST)
Received: from localhost.localdomain (179-252-148-65.user3p.v-tal.net.br. [179.252.148.65])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9da90bsm69816367b3.37.2026.11.15.11.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 11:54:10 -0800 (PST)
From: Artur <arturfaleiros1254@gmail.com>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Max Chou <max.chou@realtek.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artur <arturfaleiros1254@gmail.com>
Subject: [PATCH 1/2] Bluetooth: btrtl: Return an error when reading the key id fails
Date: Sun, 15 Nov 2026 19:53:12 +0000
Message-ID: <20261115195313.20809-2-arturfaleiros1254@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115195313.20809-1-arturfaleiros1254@gmail.com>
References: <20261115195313.20809-1-arturfaleiros1254@gmail.com>
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

btrtl_initialize() stores the result of reading the RTL_SEC_PROJ
register in the local variable 'rc', but its error path returns
ERR_PTR(ret). At that point 'ret' still holds 0 from an earlier
successful call, so a failed read makes btrtl_initialize() return
ERR_PTR(0), which is NULL.

Both callers, btrtl_setup_realtek() and h5_btrtl_setup(), only check
the result with IS_ERR(). They then pass the NULL pointer to
btrtl_download_firmware() and btrtl_get_uart_settings(), which
dereference it right away. The register is read with a vendor HCI
command, so this happens whenever the controller times out or replies
with an unexpected status or length during setup.

The read used to live in rtlbt_parse_firmware_v2(), which returned
-EIO on failure. Commit cd8dbd9ef600 ("Bluetooth: btrtl: Avoid loading
the config file on security chips") moved it into btrtl_initialize()
but kept the separate 'rc' variable.

Store the result in 'ret' so that the error reaches the caller, and
drop the now unused 'rc' variable.

The problem was found with smatch:

  drivers/bluetooth/btrtl.c:1253 btrtl_initialize() warn: passing zero to 'ERR_PTR'

The analysis, the fix and this description were prepared with the help
of an AI coding assistant (Claude Opus 5.5).

Fixes: cd8dbd9ef600 ("Bluetooth: btrtl: Avoid loading the config file on security chips")
Cc: Max Chou <max.chou@realtek.com>
Signed-off-by: Artur <arturfaleiros1254@gmail.com>
---

Notes:
    Compile tested only (x86_64, W=1, sparse, smatch). The error path has
    not been exercised at runtime: no Realtek Bluetooth controller was
    available and no reproducer was written.

 drivers/bluetooth/btrtl.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btrtl.c b/drivers/bluetooth/btrtl.c
index d29813331603..d2c2e79800fc 100644
--- a/drivers/bluetooth/btrtl.c
+++ b/drivers/bluetooth/btrtl.c
@@ -1073,7 +1073,6 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 	u16 hci_rev, lmp_subver;
 	u8 hci_ver, lmp_ver, chip_type = 0;
 	int ret;
-	int rc;
 	u8 key_id;
 	u8 reg_val[2];
 
@@ -1185,8 +1184,8 @@ struct btrtl_device_info *btrtl_initialize(struct hci_dev *hdev,
 		goto err_free;
 	}
 
-	rc = btrtl_vendor_read_reg16(hdev, RTL_SEC_PROJ, reg_val);
-	if (rc < 0)
+	ret = btrtl_vendor_read_reg16(hdev, RTL_SEC_PROJ, reg_val);
+	if (ret < 0)
 		goto err_free;
 
 	key_id = reg_val[0];
-- 
2.43.0

