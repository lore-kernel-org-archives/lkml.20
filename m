Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF812376A07
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 22:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789857314; cv=none; b=g3+Rk/ggBOkaa9q+3ir8sT91kl+HE8qVej0NR3Dj3cH3hWnx6viXvZf1jqmU3IXlGk2Rwrm/WNhUpAICg23Y4Z78KwZZfgDChhD0P9HsTlTzHNiF0aPox5ZSiYGojoSvfDq+yQdWULe7vSZ5ehprk37eI3HCcHzcdhpmyov4na4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789857314; c=relaxed/simple;
	bh=AbW3jZZfcmmjVKuJcp8cDcPmLIuu262w+aeqguxVmcg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uZI3n1ZxeZbDBMmIOpNwSa8CcdjUbh+bKVisLIfNS0Y72WYpdy4AlgM9yKf8yoz0wurUwdO3AA0PTXpQL7XhT6zWqf5o1Q45twUFVuAimxsSBueQcFpPjH/zWttKADjWSJUebvVtDQWuc7cro+tF05H71RKeyKlJTFoI7y/dTC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kJ9Dn1BT; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kJ9Dn1BT"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2dd77300816so5551085ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 15:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789857312; x=1790462112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKBMCnqQxAVAZA5OoEBqOOWoLHoxQT5GMnJh9vvIW74=;
        b=kJ9Dn1BT2g8waQO0tuPlpU8Ql58ntVYEi5/Q7iJe3d79HqqW7Wt9QljWwnUp+X/s1h
         kor6S+gxv2JQRb0ENJTD9RW0OUBP1n4D2DdLCxshoQG7jCfBG1rZ2JZ0v9Y3BNfPUrjC
         damlCJjUlfpDCuzkU4Zlbkpoc3E1cqIPcdv0yjU2qjLVsKW3YxY8jsBSiDgVJ8VN/E8x
         k/oR17nD/2xLKrwBXcdgiINwBIUSM1z7cbiMt/JtiZA9YZ7LX0IvjUi6eG5UNx2igeiq
         NBvvva7AkEexxo+14TsjtxXneKPhuL8jujWLEkvMUYxBVFllNuas6LVaNlPQ8nw7Tzps
         FLGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789857312; x=1790462112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKBMCnqQxAVAZA5OoEBqOOWoLHoxQT5GMnJh9vvIW74=;
        b=w23XUfHobOnKC22xidBeI4cPSm6ez/JWxHaTjDXTtqMXk7pytNuvjXeXiWarHcXsuh
         2v+LVRf/T7qjJPy+vJe9STIQpwmJQ7l7//JScBRyCowDpvGVdF42ghAD/EQPdqbVNBgJ
         wrn4m4zoRYXgopyZ//4inV1ROl7XQt3WRD1irXtC2Z335kqBKXtfF53iuLYQULudpkW0
         dLbJ4CnI8QZeiKlYOOg+ZJK1EMBzvb1L3xLqGIQoO+h+UFACTFNBiytjJRHa69e5d2aw
         ThbNJ4GB9BCxVqMI1rC+aQXWdsPN1WkSANDCfqVCpObZ1ZdGv4JqEk9AeD32M1lBZ0G7
         yZiw==
X-Forwarded-Encrypted: i=1; AKwUvByGOfvZquiUbH8liYIKCQ9PVyfsu9XVRXE2tgdDKKScG3h71Qw5X6GRdXsodRsi2nYeOrrvJJJDfBAoyoE=@vger.kernel.org
X-Gm-Message-State: AFuF++kskguBHhNOZZ7LnX6CNM2pcqTeLQZQNKiNoerOUajIPEocAxfA
	1HbMZlqeSw6OOr4jmseleRoyOdi0WkD3SMxZ3VOJ+qVUGvTBk/k5SPnE
X-Gm-Gg: AYBFou320qBeLWOKEUuGKTZP4GoDgX0WqibJV/So4t+OEzoEzgHtB8E709GUm6hTrEV
	t2ONDhC65MSEvhomPLj1mGhoiuY13z1ChLVZb55Ga2Tg05Q+67n05hpa4+vTxCTNttZiIX2hL0+
	bNODaXHO9SyV4RCH7T6XxCe8yAX1ir31LdDUdo2JcuqiEf6B5mZETRnsh/vByKmyszctve55i30
	pMDhgYM/6L/w7kzqO2LsiF7YcdHZxiBIS6IX4Psr/OwM/zhhNlhIj8f1UEEBLlxvz/JBz1QvJEm
	dHMXI2XeW9yZmLj92B7h0dYp178CLIdBMBrt3H/z41xnzRPBlh5f9iQPepaFA9eoFmNlBBoYn2c
	McF7ELSvAgiVWmvgnNIqqU1LSFxpkaPdDHx2mIJYVx5Y/a6QrXtyoVymhAFWnZY+NkdK6d38A3a
	ggfJrnH7SnyQu28a1aAbF6/qlA2s+6CmtklHUcUl2AJuHIt49zdj7q1sz6/aOZW6cxiIxjYErsT
	xtv4TBH+WHoOM6pOetm14obTgOhORvVymAUTXbuyUiBYBli02uaQ1Ffuzmt61o4ukyVw/gRsDqx
	eMtAgPUGN7g=
X-Received: by 2002:a17:902:d2d2:b0:2dd:ad73:5b5a with SMTP id d9443c01a7336-2ddb224f33bmr75712475ad.21.1789857312166;
        Sat, 19 Sep 2026 15:35:12 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc179dbd5sm13215505ad.39.2026.09.19.15.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 15:35:11 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: airlied@redhat.com,
	sean@poorly.run,
	tzimmermann@suse.de,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/udl: reject short USB EDID control transfers and fix URB init cleanup
Date: Sat, 19 Sep 2026 22:35:11 +0000
Message-ID: <20260919223511.3889061-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In drivers/gpu/drm/udl/ (udl_drv.c, udl_edid.c), check that
usb_control_msg() returns the full 2-byte response in
udl_read_edid_block() before copying read_buff[1], and clean up
allocated URBs if udl_Driver initialization fails.

Fixes: 5320918b9a87 ("drm/udl: initial UDL driver (v4)")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
diff --git a/drivers/gpu/drm/udl/udl_drv.c b/drivers/gpu/drm/udl/udl_drv.c
index 1922988625eb..239a6983f49f 100644
--- a/drivers/gpu/drm/udl/udl_drv.c
+++ b/drivers/gpu/drm/udl/udl_drv.c
@@ -97,8 +97,10 @@ static int udl_usb_probe(struct usb_interface *interface,
 		return PTR_ERR(udl);
 
 	r = drm_dev_register(&udl->drm, 0);
-	if (r)
+	if (r) {
+		udl_drop_usb(udl);
 		return r;
+	}
 
 	DRM_INFO("Initialized udl on minor %d\n", udl->drm.primary->index);
 
diff --git a/drivers/gpu/drm/udl/udl_edid.c b/drivers/gpu/drm/udl/udl_edid.c
index af4cff2a7c51..b7c462436573 100644
--- a/drivers/gpu/drm/udl/udl_edid.c
+++ b/drivers/gpu/drm/udl/udl_edid.c
@@ -36,7 +36,7 @@ static int udl_read_edid_block(void *data, u8 *buf, unsigned int block, size_t l
 		if (ret < 0) {
 			drm_err(dev, "Read EDID byte %zu failed err %x\n", i, ret);
 			goto err_drm_dev_exit;
-		} else if (ret < 1) {
+		} else if (ret != 2) {
 			ret = -EIO;
 			drm_err(dev, "Read EDID byte %zu failed\n", i);
 			goto err_drm_dev_exit;
