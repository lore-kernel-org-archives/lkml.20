Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.130.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258615;
	b=OpdH/ShWIN2yyRF7bYnNsXmR02a2LuT9CpXy0nhLjvO21UijvipMBXnLAKk6hi42vDPF
	 ISInSSDEueNcANCEviCpOLoDUuvMjIOnbo6cT2db8LmFYisUtIJ0cq0OVjFWm54KqKfWf
	 2OiI5oTfkOUhxkyGV0LarKullRP2m7v9vNNqkgM6m77BuoG72zkad8Mmw9Vy1U85TgdCk
	 EfmmybRPfAKMDxVKAlm+ySAONa6BX6C0mbcHF+A3p57x2U3wquTbDSRujaIpsROiWmWQO
	 2SgAUgYTAeRFJyzbI/5LVhnKwkk9a/+l89eYCp44ptwOSyAH7l2NGOjlMfOOBEgcdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258615;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=g4f41ef3kWSKX5qXwGEjvgmce7MkNP0+yJw+Z8GwAV4=;
	b=BHxtDkXFGSterovHEteoOpv0gvI78Huw6OlfbA57pEwqxhVDEkUcVq9IWVywu82O4/nV
	 nm0tT1Likol3f10vnzZljRguAdLnCysamtAidTgaYnLgSrSlpGwqXE9UoS5vDlljs5lio
	 kRuoLgBSi47X07eaBtpfc0Rg9gotjHP8dH04W91wize5wu+s7t+iKLa3IElq81Sf6zkJW
	 OWN36baclInmDd7Tg31nE06fym+63mb8R4rQ6jj4V01cXwS/OZK5H8BoHKjFwBm8DaOY0
	 rZRZY+uS6jOhkhJ7SQZAwdgIgVb7ImKxNI92agxwpeGqkxozSCcExi+A+IgVTlSuJ2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=GvQChmxR;
	arc=none smtp.remote-ip=74.6.130.41
Received: from sonic308-2.consmr.mail.bf2.yahoo.com (sonic308-2.consmr.mail.bf2.yahoo.com [74.6.130.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFB9606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 21:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADFB9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=GvQChmxR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794258613; bh=g4f41ef3kWSKX5qXwGEjvgmce7MkNP0+yJw+Z8GwAV4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=GvQChmxRgEku3EuCZO0g0c9DA78HJFhaGuamu3712P2wl90LMP/+wnG3MxKZHkIBZmVj9mxTdvOaPYmE1oMfC+Wtd0pNS3JepB7v73vHXBr60s7tuuO5icTByIRKp+mfsecQSrSo4DRZ+g6q4nRnf4jis8AWpMSeNYhIMTG/UjixxzEEEtWUSakrd6D1V6+9ankY+UCE7zHCKiBIt+PQ8zp++CCQ8Q3eNn/dLG6WMK0O9AZ54qBcVdrrhE/YiOm3TGPan0jwZIUO+PghtwlGhwX63wXdiU91QBex09EQwTWaFPk8+ZXvsqoXp90i4Rg1OTfbgQsGr6TjXtShkZgjZQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794258613; bh=6gzqf5ffLHRtr6QSoQA+ZF5oKY1b3VvNjkSbtQZA12b=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=aBaTY/BdQQkVqEFtWhg7MfYrgdb+pBGFEg+E4augK+gGwjKFL2hytuXEygeIOqC7WTCJHnBa+zlkJ+l6I6YoFAJVnFpklogEmGZgy3T6j1WcNHsPLNEb1tistLdpp2g1XqD4PhJ9VLOZJlqG2Gq4HJRMy89KPmZksUlzictPhfNFiDJvebNBvsEswMfH6OAEw2e/y2TTC2+gce4jWZUZ5xja1ZS6ua/YrHA17HzepSH8hgBx186kKkJHuPyIl0MgcyOucWjsBP9rkWfaEctuYThtH+l1T4AjY1Ro2xXxzN43GPbWn2SqMOZ1ZFhljSmq0w+GtzHG1LNmESKD6UJURA==
X-YMail-OSG: g_AOH4cVM1k5T_qXLFrFwkECR1KdiLVxkFoslLlihnIG_86Q2knTttCSBVGxoDX
 .BP4DiGJgqO6Ah3WokKJSogfHg.dw9yycbK7mtBn1pJer4HT2xLgwziReKHreb2v.SPUmG8tGajZ
 Km6DdC6MtOTWv60HKd9z2zyzYIie4p6XFqZ4cXwW8eilJhNd.ElDB0t.M_ohep0X3B9RUfbGDG7m
 A4zqQ_JroC8ZVtmlVi8GIv7Uqncwdo4IVjQDahshi1pHWtWMq6LUat6yVIHg_1BYMMp6ugKIG59r
 c1du7V5lr6TAe_Lmkecs.ZcvSmGXng5Sw3gCtA3h3umCfqf4.alhcoyS6fDsO63WxBU52TFXEzyQ
 iMb4we4LF2.OBJIkObfjuTNWtAahB0.aFB3nrZnpyOfCTOoFODpev7IDe621_2feYV1qavJM.G7I
 8FJVBL_IlucKZGrGT8O9OzwwqfaYut9qV7.NKak4IFmZyBPVL0l0E.Dh48rtrPKUptStfITYHrH4
 kAMv5DEFWIULafrNtgtbc.WBlP1WDSq4FbpICnVbQ_XvgPg4VXaNFjc83Foy.INZFFDlx4pCAZ1b
 Kh_ZFE7i2pqyBHAIsKt7hMVsEOKPm5fnMCXhgS.R4TnwzdAIfNEdR465WE_6vO4LpEv9E9hL6DH0
 G3KPtkl_t.5Ki8lQkI3TFceOeGaPvvCHh1zb.CnOC9pxTu0mEf..hP8pdZe_WpRlF.CIiuzZaD9w
 LP4FGiN2SwYWOfA9CX_h.lvvXgE_c3DBH_nd1H2yPK5M2hIM9yH1wCwPZJx8I73_9yG3rJhE06By
 VLll_fu7KF7TPgI563rXpjBjroJ3tx7SaZHU0jzf5UJobxsz6WtLCp97hdFRFZmuzDzZVLswabdP
 gSfW0g2Gwmp6iZCbsyy4ktL32WRjTLs3oggjri2JYjdEmxGvbajpKUNWlS0hqSJGUOPTRI.8WwbZ
 k9B1Ur4PWhgRBr0FeeMTq0VJFMAEnBpwdECB0GOazNGI7kN1pf4q_sXJcJReY9ok5SyTEVTw5jcY
 ilJBVvndtXmjAULFuySB0OwLIlqr4CKb1CSXynxzmJ0ffVXcPuCQebzVHBKNypmBxqoFOTqXXw8b
 8Vahb7wXnjX_CnopeKq88w5G6UceRoL.AZZHk231hJv0aDH5D.ZiH4ghNGnIfl2yb7DEZeigtvl5
 Gh8y0EpNa0W3workrYrjW3kYnqEpqXCP.ETmVeLOWUA_fNIuF_J65uiWasYzrYCZ5gbvvFrW8OXF
 KZzBr1DSlRcDUVsXP1afXBElZMjAs6Hke6MoDF9hlF1KZ77YpZGUSW4mnKATW6gjP7p7VjfzMPbl
 Rm9b6gEVBjtFsYFZRBAm8CdCm8c25GQnJOBstYS.sAL3MEVgOGp9L61ttrDfJM2RaKmZRNr9WmFy
 DmjbMcH6QweTAe8XZ49JJXMKVYD2ELQmv0yiv2aUHSkTz8wJ_6RFtBE3cm1.imP48qjYaQEMWXgK
 6N_te37DZ9I5FGQEWwoH6dhTxnUUvtJeA5OJKkGynAgKnEirpSwTTPJccRtgLLy6rNuvpN4kS3..
 2kAjLnTJ_bIwplEgXw0gCe5WkSFFvPdS0WtnHOKXW7UXVoRAUCWytC_1gymgphFAcYHdONHGSehX
 ZiG_W4gItQpSrEYf4HgigpewfkBhxz0ybe7jrVveVfwkJZNUl0sSOzy.P7POYEZrVa3DUfC9zaie
 UpDgnAmk7R4WqXxV2EHqaizkPqop7bJ4tN8FhgXZA3Ru6wYsKaaDmo53x97FGVn0w3DBkZxjERIg
 HNiiVytE5tC7RtzuC.fgLI_0FsH1zgCT3WZm1ogCxyQZRzu65ipbFQLHs10jrEBq9T1h8r6hFW7M
 qC.rEa016yLwDyctVCtmeSA6tDD9t.dxWk0Jw6jqQWxwvgHxi4Uiz5FMKQoHpKVaT7Jt4zDn91_j
 X37CHs5jm34hPZDZJ_jNfAEA0aehsZ4iPo9sznxHrwILoI5cxit7_yh8K_Jk0A.5y.xgwVjjPeND
 m0XWxgE6moRQlIW09M5EwoxKZ21q9tWq4e3AbNTkeeDrLUnH7meKguHXOAywnjcaBeuce8mJKltY
 cZ7WAqLAePv4JM5F5F8BtXH2kmbKwFCT09u4BhVhPkipfYSrw4dP5lxPVQ_3gzC8btOUkKqdd1nI
 Li5CtEEIHCpywW80h4Kp6i.DxnRLbs8.oMWyDRkPQIc2Ez3L6gV74rDKovzUPYfZ63.K99H5ooJw
 xoU984j6aTAjXktJoI22F8khz8XQyU7Ruyt8cUZI_GUC0LIeGCuBzJ6pwLcq_aU5MANcLC6_ummp
 y_uAzceMlRG4aBXPGw0VL_sOJjYiX7Us-
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: df5fb5cc-4cd2-41fa-94e3-cafebf2495ba
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Mon, 9 Nov 2026 21:10:13 +0000
Received: by hermes--production-ir2-5dd9bf4598-9c455 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 61376fa3b656664a2024a29cceeed25d;
          Mon, 09 Nov 2026 21:10:10 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: tomi.valkeinen@ideasonboard.com,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurian Iacob <laurian.iacob@yahoo.com>
Subject: [PATCH v2] media: i2c: ds90ub960: use guard(mutex) in simple register accessors
Date: Mon,  9 Nov 2026 23:09:40 +0200
Message-ID: <20261109210940.7751-1-laurian.iacob@yahoo.com>
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
References: <20261109210940.7751-1-laurian.iacob.ref@yahoo.com>

Convert the manual mutex_lock()/mutex_unlock() of reg_lock in
ub960_read(), ub960_write(), ub960_update_bits() and ub960_read16() to
guard(mutex), and in ub960_reset() to scoped_guard(mutex).

With the lock released automatically on return, the error paths can
return directly, which drops the out_unlock label from ub960_read() and
ub960_read16().

The rxport, txport and indirect register accessors are left unchanged,
as they still rely on goto-based error handling and include/linux/cleanup.h
asks that goto and cleanup helpers not be mixed within one function.

No functional change intended.

Signed-off-by: Laurian Iacob <laurian.iacob@yahoo.com>
---

Notes:
    Changes in v2:
     - Fix ub960_update_bits() always returning 0 when regmap_update_bits()
       fails
     - Don't convert the rxport/txport/indirect accessors, which still use
       goto-based error handling (see include/linux/cleanup.h)
     - Drop unrelated blank-line changes
     - Reword subject and changelog to match the reduced scope
    
    v1: https://lore.kernel.org/all/20261106114859.1579-1-laurian.iacob@yahoo.com/
    
    Compile-tested only (W=1); no DS90UB960/954 hardware available.

 drivers/media/i2c/ds90ub960.c | 68 +++++++++++++++--------------------
 1 file changed, 28 insertions(+), 40 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 7d7ba6d349fc..ee410bae1216 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -748,24 +748,20 @@ static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-		goto out_unlock;
+		if (err)
+			*err = ret;
+		return ret;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret && err)
-		*err = ret;
-
-	return ret;
+	return 0;
 }
 
 static int ub960_write(struct ub960_data *priv, u8 reg, u8 val, int *err)
@@ -776,19 +772,18 @@ static int ub960_write(struct ub960_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
 			__func__, reg, ret);
+		if (err)
+			*err = ret;
+		return ret;
+	}
 
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret && err)
-		*err = ret;
-
-	return ret;
+	return 0;
 }
 
 static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val,
@@ -800,19 +795,18 @@ static int ub960_update_bits(struct ub960_data *priv, u8 reg, u8 mask, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
+		if (err)
+			*err = ret;
+		return ret;
+	}
 
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret && err)
-		*err = ret;
-
-	return ret;
+	return 0;
 }
 
 static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val, int *err)
@@ -824,24 +818,20 @@ static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_bulk_read(priv->regmap, reg, &__v, sizeof(__v));
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-		goto out_unlock;
+		if (err)
+			*err = ret;
+		return ret;
 	}
 
 	*val = be16_to_cpu(__v);
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret && err)
-		*err = ret;
-
-	return ret;
+	return 0;
 }
 
 static int ub960_rxport_select(struct ub960_data *priv, u8 nport)
@@ -1272,12 +1262,10 @@ static int ub960_reset(struct ub960_data *priv, bool reset_regs)
 	if (ret)
 		return ret;
 
-	mutex_lock(&priv->reg_lock);
-
-	ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
-				       (v & bit) == 0, 2000, 100000);
-
-	mutex_unlock(&priv->reg_lock);
+	scoped_guard(mutex, &priv->reg_lock) {
+		ret = regmap_read_poll_timeout(priv->regmap, UB960_SR_RESET, v,
+					       (v & bit) == 0, 2000, 100000);
+	}
 
 	if (ret)
 		dev_err(dev, "reset failed: %d\n", ret);
-- 
2.43.0

