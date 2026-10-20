Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792517822;
	b=fMGN7YCgzhilafpHn/B9MxRo39bCSEL+0tlvI2Mue8VYxaEcdSRTyWdi+PWwomP0Dufr
	 V4+HSZxd3JWREoFOCd+0TyxdGUTsq9NMPdv3sy9/pBEZAYLcM+O9OMFts61jTIxSZSQGi
	 wSpfS278sdQ42QSqfIflAvOmgZTxXc+iCnze4yhuxBRPyeUinRFCK3bOhEdcWy4dYj+0j
	 436V5bUofXZZn61sS0pOsLofHVSYwmOyZsTBG4wdtfkCB8FUC/2AY/l1kLUHpY9o6Xy4T
	 vJpX77Xh2lz9ktaHgw61y2p2e7Bg7tFVoiku2b/oq/IUChGM3XXJybyFtcYyS42DEog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792517822;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
	b=emeoOqYb+PIbyCGxhBp1wLJ2Eg6nFy4Kjj3wnoXYZpO1AE2u0UYTRVLS70PMjvJ+3aiD
	 ydBVNfR7L9JGkkVsxf4NvtNnfkNGwSM+L6MEDmx+xRuneGMHyJuTBIoi9utalb76lAUFP
	 3B2/zfZ+EfBs5oAvFlZ8a1cxme8uAvuFlppcdC8PNr/QRnjMLjeTpT2AlHDudbak7ukxq
	 8U9mW1LJ6T7ODOhTIdzn4iYGBZxWUHfwD76iV0lYcxnFhzwCpvoPYSsGnpuQ64oI0YTW9
	 uQW5XA21r4uFBYqMlOWC4l2SaO2ibnYI8N9kQ7FFMJl+6H0mUm9dPdEISKGFTCDvs2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpAWwkFI;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18742606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:37:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18742606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kpAWwkFI
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16af2a232so24342235e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792517820; x=1793122620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=kpAWwkFIF9xwPv2rF4Urtm/z72bnzw5wHjMRnjnWDZxbuO7568i6CG5x73NUlEKKry
         mx4b3vUHZiLTbrlxfQ6kXksr3dCLRwWiSDnIVvShyL42ACssSuvYZH14lS0Xkl0J7Qnu
         2F/5fMrlzhcFCbD/NgUIr8NegG13j3QAdsulLO9FsOLYpA1zmr/2egF6qSuhdCwptWcK
         AUrr74TZmzZMEFYl7CLnyzFVu58owtm8P87VwPcNzJBtHRujGkGcreuzRRtR6lKn4lKq
         awiJaUyI5dNBLJpkJ5gz4iQMyBDgXVeKhMonvHKjh/ZXQYbUUqlfwxsKRIdOIEohtEcl
         igxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792517820; x=1793122620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=pfwROT+jY5qoptFdexYpWciTUmBHMi0d7jzbhb5zxr96dDUgt4KgI97aZzD5SH2TrP
         NOpeZEKvKIM6aA6AOVrHNbGdeZTwVVvmhb0t1AwsAvrN/2xKig8NqJreITlSRJUIB6im
         3VMCs7bOHo4GvesRZy4jySuItpvSsk88c3qbXNoChTg6XiuCL1/CGE7pUYpkbZwxBenW
         50Rj+ZM/XMixno6jgI3SoVND0Gs7S4wiBkzKE3yqwLeBZgaA7H2to95Q9uwU5uGD6bqu
         waBdWXYExyUpv4iYplXUETlRk7N9tBbTFGHeDhr4B0YQGNR6KGBZJ2/qNJa+Pu95mdKZ
         5N5w==
X-Forwarded-Encrypted: i=1; AKwUvBw7VZdpTXS7fd3d/g1GlHEap6PNsNItmcwz35AtoXjwGoWRO9foc4TvcGQKm9x1/zqVArijJHT3KSBoP9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYIH+JEf6kqT2O4vK/5RYzHkf30ocWK+PKjVeWPGzXsgBtoEmN52
	Oa9f7jaVvv/n5ZJc/qX+Ihx5AycqBwiFMpLKII56HWFSHcDYCAYKBnSo
X-Gm-Gg: AYBFou0GBo5wQj2iXL0PD3JK7l/Z4IGFPydSgUmwRe1kRj4db01ipig5ljjUpmeNkUY
	zYAosAFPrg51H6kHQL8h5T6agzSKfxTvqDDLytYjvFrcG/Dblw6aGMw+6MAXq/GL83va6Fpg88f
	X4/xRtLrw5sR7RxsELgsxF3W5u+tVXZqStAbAQ5leBD2ZhCNLnNpxqZqrS5HcKO+mD3Gov9Khc4
	sG73A7ljtfRc6JXmQlekYk0JPEiw/SE+KYJtChiJccj1P9utOYsPOsxgPdt0msXUhoeOgwSwqHo
	kJ+W4imOEzdw8b9326A1QVqwF4ZOQCfgZryCGZqmILrxcTRIlAivYRF8i/IlLeb/3pHEOdOduYJ
	c6v0W35exRupARM+DbqhAk2dwEInzXUH1vTPEhF+z/jISSSR6LiBI9ET23yC2ggkSSSY+PfMRGR
	hdsX3wZ7mfSzNHttTYrNzcpSLJh9V04kzVew+EO84tq1EfjRKwWB1GXnMT4i/ZpSaEnxI=
X-Received: by 2002:a05:600c:c87:b0:4a1:fae2:a8ab with SMTP id 5b1f17b1804b1-4a1fae2a902mr22956085e9.3.1792517820215;
        Tue, 20 Oct 2026 10:37:00 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f8016c93sm52505235e9.5.2026.10.20.10.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 10:36:59 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH RESEND v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Tue, 20 Oct 2026 19:33:23 +0200
Message-ID: <20261020173556.632798-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020173556.632798-1-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0

