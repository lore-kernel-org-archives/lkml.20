Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792945618;
	b=EM0ysEmln1fAilpjTqeHbU/ul5UIfDV/TSMPTCIkitsT9QfdSVuC1yxF2UwGY4kKhV28
	 SwjXMXUIdiiEOTRl9ZoAsK02IRRdZG8sXqCyoT3AJqIuvl1oDQu/RQHsQQpXppvzdEeYo
	 a/pUjq5UXgTpLFxJ/dULdvuhe9hBn7vfJ8xALFvhAPw1AihIZFGTb8/pyFy5MbKDtJ3Rh
	 DNcrhA+j+7FFJRJDMZzW7EG2gGQuz0XgVD2HioPkwmQ6I0GwVNxiANggrwRWfzhesk1M9
	 5lyxXJUACXzUPl7JPHalhfpHn4vCMflpd62y1JxT/0KyP8YPT7f7Np3lwO6YE2cBCWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792945618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bDSSPNSQqDQ8t1tNwPdKc7jR5DatkZpoImvsQgQ5S54=;
	b=3DER/0QcedQuHUL42D5w4xaMEcg3zAeu6h2s9u9hP8/+k1FIH5DMbnhDpAAcFyluWV2I
	 fVL4g4j9rRrmBhu2UtkNozshEOJ+np+PSHsjTYEyxC9a3V/ed62p9VVSq4BPHzQRW67qs
	 JuZzJ4hQeBZN/IhoPkr5JMQTxZszjjS+7oMFBAzIsWVLkbeiNGOaPFjU20rLoFDx9m643
	 oXiMM1CkM6h1kDCK1AgKe87VxzX4ItbxF1PXZyqoKEl6F+YW5IOX5pgeXk2rSeXQ7kiy/
	 WM4ScpBIoQI6258N6PLhY3Df/KdHwi8tWs0bVc1/APH6tYgK3s3Lu0DEfEM4G9tvByQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzxt2t1J;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DDC606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 16:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18DDC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=hzxt2t1J
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b060ec084so1341610f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 09:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792945616; x=1793550416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDSSPNSQqDQ8t1tNwPdKc7jR5DatkZpoImvsQgQ5S54=;
        b=hzxt2t1JJI290AWZMMbrFT04USgwJ56QM2abbAq0YUa+RLcjcF4tzeqiw7vhF2dyIJ
         7oJFjXb8KDrLsfNCTcA8BIgyIHdHmIckbEPA6o+uKVEOujr7PkanHJi61fxLDKzsNgCH
         7tLdEAef4UKvhGkfspWmSwIxleoP/ywEwaj2idsTn1KfX3G252Rx2QpJmXYtku1VtLdB
         bF2FuQZFTNLMGUlP5YFgiPpFd/JOms6AwhHSv/HjYBdNuJ+wdU7Bp6zGAImFrXzBU4F0
         6xbgSE9dgDSO2Zsa9gtjUZJq2XOCajF+3QzpVN3yE1mfkT/qOUsgV87+550PbBkAlTcC
         JCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792945616; x=1793550416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bDSSPNSQqDQ8t1tNwPdKc7jR5DatkZpoImvsQgQ5S54=;
        b=XfvGvexPCM4NAW3zPoYNdgdsMYXmbEn6/ssK7ZRqBrHG1MlcjqlXyWCI+Z0PbjGoZi
         TprR5CiNZ09mhS7fEnyVwIH1bjnQh3w1BrEoCNgLRy9x40LANzy6HCor4+ffwKhBs+8r
         sVjmJk3DkTJ2x3U2PQqf6r4eUGmVmQI8Nd6tr2U8uNQrDqkEk4k7hI/HUeCg13Nw5WUK
         x/jiKqln/6hJXvFTEIweXRMUURndtdygWJm6JDhN38+8zP+Wc5eemsvGyVkOM8g2YorV
         kOhdGf7P5sDY3ulejYDlQM1PP9yPzhpfJehprZ+AOjGLEHEwwu7AtJoaIPLvrkNRVaQ2
         f2rw==
X-Forwarded-Encrypted: i=1; AKwUvByCwI7bHg/SNFozPr9EEt5rbHOOdasY3kq+bq6yvYPC4E6KQGs2XcG3YQXdN/gwwdBBl+f73PU8N65Pf00=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2H+lo2OEkQFrhN4mfoc0UhC78qIvgFxTsQiR0ZidluyeZH+J6
	Bxq9b19AC1HhBkIlfkv5riqHsTYVNGMlNipmULA2WxxIS9Ye1iS6U+LT
X-Gm-Gg: AYBFou2xioHiDAz+w/Tr9lueLhrOuc6nAtivdqOBi8Lt2g90KWM7IQL1zPkkhfxDfh7
	aLv3tUmoXJjlLmzf7U1K5o0EVBCFvsQItAv7vTn2vcLJoVaw18/p0y4IrcZ0iiCWQgI0CoKCroQ
	mv8L2LV6Vd9+WZMLQ7J9XcJzEx15XugyMfC4teXAg6qTuX9aG5/D6mK7FEHu42OLVzAhBGxWxrn
	faQ4UE0Hijqrb6EXY9AUebBU4G4FTnT8ulrxuVsebwH1LSYOr4dxkwF613tjU+unknPLkeFt4Sw
	7kVYLCHaceGp60OOPTWgh7iRf2pOY8JFg14bvIy6V3nY9SYhJuKjiEMxOFN7pcKyDOeuHT3OugD
	16Rx64bcItLPW44xpHdYACJEHP3VSK9Ol12Hk50Wwuk+hxazVsNIpHtfsyAHMTYY0zRrF86ZdgC
	KXAQ9e4ebSUzD6T09xTHKd8T70pk6pdlZMNf2BU93bcrtCD0XgZR27UXWaRcI1X9L1LHjP5UfC+
	BGxySKiLZ1i33uA5Szi+kstWIiFtEj44OHxl7xUkH5GYE4mjDNYFNQ6BoKaJ9JPtVVUame+18gS
	AdiKPITKxtSg+VaSLMWHXO0=
X-Received: by 2002:adf:f0cb:0:b0:48b:e50:7159 with SMTP id ffacd0b85a97d-48e3eb931efmr6231047f8f.30.1792945616300;
        Sun, 25 Oct 2026 09:26:56 -0700 (PDT)
Received: from Ubuntu-vm ([115.186.50.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfb8esm11127395f8f.54.2026.10.25.09.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 09:26:55 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH v2] staging: sm750fb: remove unnecessary goto
Date: Sun, 25 Oct 2026 16:26:32 +0000
Message-ID: <20261025162632.7186-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025130258.10747-1-haasham93@gmail.com>
References: <20261025130258.10747-1-haasham93@gmail.com>
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

Return directly when setting the mode timing fails, rather than
jumping to a label that only returns ret. Return 0 on the successful
path.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---

Changes in v2:
- Return 0 on the successful path, as suggested by Dan Carpenter.
 drivers/staging/sm750fb/sm750_hw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index c4358d3e5091..4dfa1cb6b352 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -272,7 +272,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 	ret = ddk750_set_mode_timing(&modparm, clock);
 	if (ret) {
 		dev_err(&sm750_dev->pdev->dev, "Set mode timing failed\n");
-		goto exit;
+		return ret;
 	}
 
 	if (crtc->channel != sm750_secondary) {
@@ -332,8 +332,7 @@ int hw_sm750_crtc_set_mode(struct lynxfb_crtc *crtc,
 		poke32(CRT_DISPLAY_CTRL, reg);
 	}
 
-exit:
-	return ret;
+	return 0;
 }
 
 int hw_sm750_set_col_reg(struct lynxfb_crtc *crtc, ushort index, ushort red,
-- 
2.53.0

