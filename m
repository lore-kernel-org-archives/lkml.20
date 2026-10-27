Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114695;
	b=3cHA2GjKvjNDwtzimPA84CM+YDKn6vFf35W204Cd4ux3nY6Mb/bAaxNAFcx5Mu7B3+a0
	 7cwaPci+zoDHemG8iT6LAZcNBTS9ue5G/HJ43SgPnyZyrv7lCykvFICy7+xxkUHpZdRiS
	 7sSjJoGr9qzNIkYaCvEacKVBECA2T+YdSVAq02oH/0F/aatVnJ817l+uMDtEM2az5Fnex
	 kCyFUn79FkFS9mzsvVDREVqHoA1//GpNnsvHfwPfvWbAmti+LxnCx5MTKu3tKUr+7nRoI
	 Ul2Yq+05j+/fnZvoPcd6cb2Co/MzWZrEUK1PpLk3QetVwZbOZEBr25EuLPRa6btTUmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vjqSPFjUdrt8PscvM9fFZjHp8A1xWrb3rVaClebLZKU=;
	b=s9klDpLr9KXcmL0kdcT1hY5b1V31Vb7ik1il9pB7790nt0wGceuCVT7mOEfp0I2z5zdw
	 QSTiFX3dp7OeYWhvrUekCRGfWSOw+EQeiZ/fx+A0e4ymndYaUcuyE5qDc/jY7FFFfILcS
	 Lrzi0oZCbDeYhZa9d3YXrb8UyihJzZiOEsPVm/rnBpF1CjfnCNFnp63LlM+XMkd4ke3p8
	 WZWRGaWd9ww/ExdOCrab04rc2bXhRxGz5aC9JupY1tadlDROnchTPGkXyHMMOXj7mt8bB
	 Bk2c05NNkKD61tEZnz71iNaNDi5gtCTSNfrt5zMFMRTdsqOmyk4tAIpPqLPSnJTy/tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umAOXndx;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF5E606A321
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:24:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAF5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=umAOXndx
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso1869898a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114693; x=1793719493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjqSPFjUdrt8PscvM9fFZjHp8A1xWrb3rVaClebLZKU=;
        b=umAOXndxvjSlOCIPbIQX2IOta62OjaS2NDgt9ts+RCrfuKW6oHSnzP5O9hLr75KiMY
         qTV0Q0xSNjQkkIDwciaQ51JwIyrC/MKmzRJTYN8bA+M/186GsmpwZh29KzK+N1wrQU4j
         Zc9VN6KCBVL5f1tBH86GeG1exKDp03EQotttGrZQaiZ6d3lpYNbnCcyfrMs2JgFhUgo+
         SSov1Rm0u/nRSuN25Eper0sGTRSR4+9wWZwj/CQQL3fKicGNl9VNf6Jo7p0TyzX5ctuY
         7UbvtmvSVDuGa/4PBqSAJCV5Lz38duGUO9Vn7dj5n2gkBna9eHm3eo4XgQlaG6PDBVxR
         FBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114693; x=1793719493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjqSPFjUdrt8PscvM9fFZjHp8A1xWrb3rVaClebLZKU=;
        b=FWJKo7wJb4mlhZ3edj7TBgEgul+mqPjb96DhJdRIBKJqpkI1cuslgPFcTbF/CLZGB4
         bZxI/+kksEvGixFe2ZV9k+ilL090QM13fS5HTH1J9L1ZWpHta6+/yDpTAakHypcxRknj
         /DhxQDPuKOIuzaGlGYnSI6wfgBtKRkD2uDH9dhs5aBlyNjuPQCcUgx1PCETQsYJQUcXG
         4MwB62XjpTEJRE0nZUH7jQOQs275MPEz+j75CKpbG/T2ao3y+LBiQ+kEhzG2jVoQm4rp
         Rdb8fnPzF5+4qLOA1kWI5dRcVWLRh0UEpe/8Qk30cScReXQG4WXnxxMxgTs+gRBB4oSe
         iOiA==
X-Forwarded-Encrypted: i=1; AKwUvByETSEzy6GoNubHfnbXLpvtE7ku7/dA4980KXo3z3o0j2IudwaMVfdhg+jh1yjRgzR6g7LMBLt9tZ/Bkuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7nKjet57EuqtkjscZM1shDwCSiq3bqqyBAuVRqBHF/7CpgtYD
	ctSVb2+zglKgXp4b9vgm1KkWkXsT4KkbNiiQ0Z/HS+X5tnHL+RBnU0zg
X-Gm-Gg: AYBFou35k4x3rW7cKUqszWaTzvKPVcPV0F2WGLidSwSwiKsKJTXdXCPhhC5e9WSz6t0
	WXbu1AyhA/5ShCHXK6yhcJun0G9Uh8APV8nt5KE9JPkQqOspwQJOp/sYcoC78l732x2GkN8QY6W
	+b+vmH1lpgLjKsUhTMqZDHo6zIkPcWzzd1vYaJLQR6wOPazBqcFN1fLDfUk7MGOLrkq99sVqNpb
	xDrnQPICee44G870xIwIm48xVmWIDUXptLAjT1fVhzZECjHigYrEx6Yp/RUrjXnqXls4sg0l3Xj
	tQnVYWP3nHxWJskHuomxTCiL9oDTyqISsWS2VY6Nh3aAMLQhfGfWxD2KRPbeYN99FxYXoKsRRro
	jRmV3Zow9mh3vT0gJ7qoUuu+dDpvnpunuFDuBUP8DG/utZ75oe2adry3J2uZMIE55Ur9hK2DaEa
	OlZ6hplU8Ewqv3d+Cf9Sagv5BdPcsiQbM2cYpnL6Brdp1ZkpuZ+N0HCESYzzjt4QasrpK5t1aWx
	IkhBdnasCJsdGeF/n/Uqpu+nnhpnmSLZmmCcbUG7wXywjhSURs0N5nvdDo5ccZAzWPkRBhol8od
X-Received: by 2002:a17:907:7b8b:b0:c42:4f89:13 with SMTP id a640c23a62f3a-c49a73d41d4mr297034266b.15.1793114693026;
        Tue, 27 Oct 2026 08:24:53 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm467303866b.37.2026.10.27.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:24:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-omap@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] mfd: tps65910: Add restart handler
Date: Tue, 27 Oct 2026 17:24:22 +0200
Message-ID: <20261027152423.194794-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027152423.194794-1-clamor95@gmail.com>
References: <20261027152423.194794-1-clamor95@gmail.com>
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

From: Dmitry Osipenko <digetx@gmail.com>

Add restart handler to reset hardware properly on system reboot.

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # ASUS TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/tps65910.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 97855bd9cc3c8..ce7ecba504b3f 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -437,6 +437,17 @@ static int tps65910_power_off(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
+static int tps65910_restart(struct sys_off_data *data)
+{
+	struct tps65910 *tps65910 = data->cb_data;
+
+	regmap_update_bits(tps65910->regmap, TPS65910_DEVCTRL,
+			   DEVCTRL_DEV_OFF_RST_MASK | DEVCTRL_DEV_ON_MASK,
+			   DEVCTRL_DEV_OFF_RST_MASK);
+
+	return NOTIFY_DONE;
+}
+
 static int tps65910_i2c_probe(struct i2c_client *i2c)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
@@ -520,6 +531,12 @@ static int tps65910_i2c_probe(struct i2c_client *i2c)
 		if (ret)
 			return dev_err_probe(&i2c->dev, ret,
 					     "failed to register power-off handler\n");
+
+		ret = devm_register_restart_handler(&i2c->dev,
+						    tps65910_restart, tps65910);
+		if (ret)
+			return dev_err_probe(&i2c->dev, ret,
+					     "failed to register restart handler\n");
 	}
 
 	ret = devm_mfd_add_devices(tps65910->dev, -1,
-- 
2.53.0

