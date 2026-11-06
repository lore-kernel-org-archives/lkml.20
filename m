Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.6.135.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793965762;
	b=KKOPi6tDrF9ViL0BSzOtMPPeOW945AhIQgBDQ6qLeeyoOnmsKqNdaXo8CWQn2tswyXog
	 AWW/vjklp9DT7dEk/ei4pq24AfQOD3ex3CF4zDnoPGVCMl8IEJGzE7y/IB9Zaw2WFp0uF
	 +rtbHJ7QbVjNnGJ/D30gkVxadgdC11xJisabAMo1QM0oC/r7osIU+Vw5daBM0yo3fBp5o
	 U8hdErTuMXFPb579m3WalC2JuS2rLs0RkKc/jDLE735Rp6nmb1rkTZRRS4l/TskU3pr8F
	 7iHEjJOmVo6xW/+Zek5KPK+rRREeV5WttNt6A4xsliJ5JG9u8BIC5LIwxEn9NQxq4Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793965762;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:References;
	bh=GFq6zkIeXsKagh+H9ZkryOLiIeem2Yj35L0/DB3QvGA=;
	b=e8eukFfphfr5dRoPFnkWgFGxHG+7KLhNRAYiklZN0XQFWgX/oH3hDCDNGRewNQWqezhG
	 1t/Cy+nsZTn3lF0osPfdQAAkdd/iQOpJLJsr7BS0yxc5bABDl9HStXaYYn+OPRxBh4/UX
	 QT7bFWwnXZwxtHA3Gj11Rvl3qrjnf4tUYeinTQ8WsaWxU+GlgwNB9J26xgaJNJp2LyTHv
	 B5LnpG1i5a4CxwkTXCtegaXaAltiBJE1ghkvdCq8FUdm/pMTrdUlHOOC6sFQUvqa24L13
	 igX1u26zyyuLseBPPxF9YI7F4boJT0R7qh1USgRREBP+D40GALgyktsNUt+PaIS+g/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.com;
	spf=pass smtp.mailfrom=yahoo.com;
	dkim=pass header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cYRmobhu;
	arc=none smtp.remote-ip=74.6.135.123
Received: from sonic310-13.consmr.mail.bf2.yahoo.com (sonic310-13.consmr.mail.bf2.yahoo.com [74.6.135.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99595606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99595606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.com header.i=@yahoo.com header.a=rsa-sha256 header.s=s2048 header.b=cYRmobhu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793965760; bh=GFq6zkIeXsKagh+H9ZkryOLiIeem2Yj35L0/DB3QvGA=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=cYRmobhuoznPQTT1MoJ3Xt8TpvGRp6O+2pFrKj0LVe9icIYUYl0lEd5WLen32KSBKatPwXnSSmh4OMvwqDhiHrHwg06pY5AnV3hgxNLSxYJEz28dyMy+Cn2CPzTBAVLJZ9Hzws6G0zl/9zGmttubxTXDJvBsZtrHH011mqsCUn6gVoNyavxPkf3UDpq8QQvCy6z8XGm2rYmiTUoB5w8Hb2bHYhPEEEnqRfEwRUkH6nzA4y2HEAPOVobEVeiNV099eAbFDn8K1MKrR/SStA6ipoCTI/Gm6P0SDJhKCHWIswaBcm3ZAogg1F8B2IhVaYBA5HQ1Ho5Vb9feuaXW8IcOqA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1793965760; bh=ATsUMP3BUdw65MlOA8sVerWMNvG3qvNeBeKezp0nF96=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=DR8jTsFiB7TmN1A27xIUzzSP508emTF2G896fE+Mzh5wIL8cD4nchUI0U8qQTHJF1C2zDcZXMbY5LOlcl+z1/OX/Qdzr+4tdRuTLcJgIun8Rcfi5/8mBj6rxpR5CgFVeDn4/OazjN3y8dEpCMQgKWWeWWTgfxDaZxcP2VaMXGh1JFXSlsrhr6BjAokAJUtF7NR5V0DneEZ5kMdfLaSBZLb2tP5zEs0ZWOuXE2C2rabaincqpLuPmhISpJIwjYgG86ygYNGEdJs1mKK9v3CY3a7MdjOBzuzvPVzEPMdzNJu4I5K4u4QR8i9schBW/9iR11YmQEvPhISsTcDY18nCvQQ==
X-YMail-OSG: 5DP.kuwVM1luZe6XXA2uG5R2SpM_xJGnARXro8TPD1LwKOWuNAtF3W1CZpt2MB7
 5jLk2ICc_XV9OFPTPRcvI1VU6y1V1Vn7mnHBfPC0umxO6Zxu1PVr0PcpZeEA5ssdx1nOhNxZBVGu
 e91THDGckyzFhIrCYxzJi7y9CKf__gCWhwqOmMfQzZ2SSd.I962AS_l2MTad_9LbHs9x4_dEVRDA
 n.i.7BjXTV77Z2731ViTqAmhUIx484F_7hHlvvt3c8kuYGr.Y1cxt9KVjXchzB3kQ7XRCbjSVF1P
 qVXsdgU9owS6FjvvIlC5HhJu69GPSHRaWWiPkSGIFaNYQjNygJRo2xg5icrW7wqIZFR4vFN4o_6a
 Z0U2BskHAtLlzkThMpduf6.pqO.pVJku2lH3k5RHxIdGUU_s_YoPo.CNka124ecVEzqDjXurWQ8Y
 K6mYq5jGwMog3qDLKAwu7hEkG0ZheGvIy2YYTU.Rcp03Cez2NZRbY7zvj1gF2i7OpRym5qK2I5jy
 Gt1gE3IR4jAXETVtpDph989TtVasU09DCrOpjy20rBhBlKUsWJJSHnEixjqZkrX79hkn7EE5ydrq
 BwLcItsodfo2s7NbZO_vupH.tanpPMxuEOMfdz.dREhUNiOyNWuCZdhShd20x2.OwwXvhqveCbF2
 XVHFjQrlsm_zE2JhH7pU_zAqgUGaluEjHUp8EZSy70XMtexo8y_8IVe5rFtEXNVDyVIvku8jXk03
 jtMPpU.U3vCKD2dierJpzVnJzCw_OWC6jnaZfx.YNy9N8bfAP1RYWnvX1OmjvcOcarJUtjTsqUMC
 PFd2nbKeXQ.5sjzgLOJF5heZG6t4FcgxRf26HbPeMcswsXObr2pTSBaUNsoBqScIJW38dFuyWtRO
 Sl_Lj9zx335lQuPN_tb4JcRy2aC7lslLfjNp7FxJkXupw2wXF1B2FmqeAQTsnaf8J4Za2PnGFv3i
 Wmm_gLGyrSI2j9nYINFQLAopFTKQmT7.6OhEhxPtTnN1FyGxKBwM7Z7D6XEoa5cs7p_R0MpxorAR
 EmhonAwrkhiN6pjlN1kK5w7zaZi6npPqhvD8c8A9XjWjXpZisJEzIhjWl.rWK69EZgJyFN46cVdv
 h1s..fm9TYKErpNV6lE5PsBfthO3xk6R4XbkDRbHgBgD16RpuKjWBH5GdP_bC_8bZw3D.sVxHsXb
 OWkIfRoKXtKuON6TttT33cBaX0awR0bTZJLEZ459m83Up2bUQiHsfva1hivji28TEDmjN4jcltU9
 ydHxPyANxbjNWO5mjA5GlX_YNxtsPuyDSi8DVAyDhK7oMiQxBfM20CUVO_.nhavBg8EUiK7_XFnv
 nXx.e0MYOnv2wgPyCV7SwXYmUj8EmVWZKjyOng3eodAVCBwE5BUlSrbAu8GFyaKwyJUPQF8Gse2P
 gATgG8dwCSvMzN72vXBWFTaayKRvEV356PJehORtJ7ZRdRguyZd0rJG8sOxeL3RtQZeWlUBaQ7y5
 kxTvKsdDn3lF132qRoeWjzxF8eG48bBL2Oqn_YWGN.sjoXkkoRNLw4KNpDPa6fibseowWwUm0.hk
 BYF0QHJ5beUx00BJafKGbyk_Uzxgwk1Bokawqe1Nnj6ahrVdbdRzHjogUydCJI3ZgH4.TcBivDmX
 vicDJe2aHUNTaMKF9MDxlvy2DIwJ_fg0Uwr_6oOqLH7F6VNWATgHrLnuICTp8tS.q8xXbcdHM_Rz
 I.FN.P8d.5io8SnE1VmbzouGiZbbfC3GJacYgfW30t4VeAM7X1wvLtsHOIbz.yEXmfgm_tmAcdw4
 5Kr.C09PBc4vChJ_lu0GK5t_MEhZQRRMWQbnrErMea8frAq9ezgoQevumriaqKhZEml1gU60QM2i
 oOp3VtKYvcDtFeOeH2Ix.Gu3YJY7f6sn6IIMVZKyDhwQJmkoo5Cq.rVP.QmE9wehNOoQrrNQnGSI
 867RlDC6_3fubz1no3qeiqWsGuY7BEICWMpjyG0qJASpDmiB5cHPFBH1Irs23P40ruvlDqJtp4dx
 veG6WpraIKZfNmKk7hVCVBMohCBOuIJ20ul7Z._7dZ0wKHNQwY.XiElpeA0JRKyXazOWrFz4UX80
 de_T7HaUSM9Q1rjYFKZZAd_h7R_o3TdXLByn411X__nVa4xvnRPQiEYBESuyx.4wywiKYYVztjYN
 osPssvDfaWAtQB0OntOQIBvIUwiibNuG8f9HWqC4E05.lQfJBPMPsCjUCa1VZVqbOIfdkYRuRntp
 5Gt52VTeMjo8yRcWJ9p4yMIFVxKL0IJYRGWWTmpOiqExhacB9Y0dwn9urdESJzPiQEiz.gJpxAeH
 zr1D1dRkTCUo52k4PsR9FwUAFndgEOOOZzA--
X-Sonic-MF: <laurian.iacob@yahoo.com>
X-Sonic-ID: 064a999d-8026-49ee-89b0-7b9ccbf51b14
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.bf2.yahoo.com with HTTP; Fri, 6 Nov 2026 11:49:20 +0000
Received: by hermes--production-ir2-5dd9bf4598-ck52d (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 8164e76d67edcc433b51d334a9ea5c3a;
          Fri, 06 Nov 2026 11:49:18 +0000 (UTC)
From: Laurian Iacob <laurian.iacob@yahoo.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laurian Iacob <laurian.iacob@yahoo.com>
Subject: [PATCH] media: i2c: ds90ub960: use scope-based guard(mutex)
Date: Fri,  6 Nov 2026 13:48:59 +0200
Message-ID: <20261106114859.1579-1-laurian.iacob@yahoo.com>
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
References: <20261106114859.1579-1-laurian.iacob.ref@yahoo.com>

Modernize the locking in the ds90ub960 driver by converting manual
mutex_lock() and mutex_unlock() operations to the scope-based
guard(mutex) and scoped_guard(mutex) macros from <linux/cleanup.h>.

This simplifies error handling by allowing the removal of multiple
'out_unlock' goto labels and ensuring locks are safely released upon
function exit or block termination.

Signed-off-by: Laurian Iacob <laurian.iacob@yahoo.com>
---
 drivers/media/i2c/ds90ub960.c | 171 +++++++++++++---------------------
 1 file changed, 67 insertions(+), 104 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 7d7ba6d349fc..d603d12f026f 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -748,24 +748,19 @@ static int ub960_read(struct ub960_data *priv, u8 reg, u8 *val, int *err)
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
-
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
@@ -776,19 +771,19 @@ static int ub960_write(struct ub960_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
-	if (ret)
+	if (ret) {
 		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret && err)
-		*err = ret;
+		if (err)
+			*err = ret;
+		return ret;
+	}
 
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
 
-	mutex_unlock(&priv->reg_lock);
-
-	if (ret && err)
-		*err = ret;
+		if (err)
+			*err = ret;
+	}
 
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
+
+		return ret;
 	}
 
 	*val = be16_to_cpu(__v);
-
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
@@ -877,24 +867,22 @@ static int ub960_rxport_read(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -910,23 +898,19 @@ static int ub960_rxport_write(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
-
 	return ret;
 }
 
@@ -939,23 +923,20 @@ static int ub960_rxport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
 	if (ret)
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
-
 	return ret;
 }
 
@@ -969,27 +950,24 @@ static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_rxport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_bulk_read(priv->regmap, reg, &__v, sizeof(__v));
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	*val = be16_to_cpu(__v);
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
-
 	return ret;
 }
 
@@ -1030,24 +1008,22 @@ static int ub960_txport_read(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_txport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
 			__func__, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -1063,23 +1039,20 @@ static int ub960_txport_write(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_txport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(dev, "%s: cannot write register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
-
 	return ret;
 }
 
@@ -1092,20 +1065,18 @@ static int ub960_txport_update_bits(struct ub960_data *priv, u8 nport, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_txport_select(priv, nport);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_update_bits(priv->regmap, reg, mask, val);
 	if (ret)
 		dev_err(dev, "%s: cannot update register 0x%02x (%d)!\n",
 			__func__, reg, ret);
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -1144,18 +1115,18 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(dev,
 			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	ret = regmap_read(priv->regmap, UB960_SR_IND_ACC_DATA, &v);
@@ -1163,14 +1134,12 @@ static int ub960_read_ind(struct ub960_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(dev,
 			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -1186,18 +1155,18 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(dev,
 			"Write to IND_ACC_ADDR failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_DATA, val);
@@ -1205,12 +1174,10 @@ static int ub960_write_ind(struct ub960_data *priv, u8 block, u8 reg, u8 val,
 		dev_err(dev,
 			"Write to IND_ACC_DATA failed when writing %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -1226,18 +1193,18 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub960_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto out;
 
 	ret = regmap_write(priv->regmap, UB960_SR_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(dev,
 			"Write to IND_ACC_ADDR failed when updating %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
 	ret = regmap_update_bits(priv->regmap, UB960_SR_IND_ACC_DATA, mask,
@@ -1246,12 +1213,10 @@ static int ub960_ind_update_bits(struct ub960_data *priv, u8 block, u8 reg,
 		dev_err(dev,
 			"Write to IND_ACC_DATA failed when updating %u:%x02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto out;
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+out:
 	if (ret && err)
 		*err = ret;
 
@@ -1272,12 +1237,10 @@ static int ub960_reset(struct ub960_data *priv, bool reset_regs)
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

