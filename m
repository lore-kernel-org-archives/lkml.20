Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616556;
	b=oMoJhG3IuSQ7R2K6FTKzlR5SrXCkwJ7gNFQnicLOZryNy2yAfvH2BcBS3Polj22J/ogi
	 F7ABBCOamtF/3/1rrCOOhBChPb4SLEnmmMU/0SAYUO0LVN7iSL0meZSyxghde9cFMtZE8
	 2croDkmuTyFAx4nIoJOyDbBit0nJEr/IMgiJf3Ru8Fl3CBgNHXJQsTiyKZx0ezc75NT9s
	 2Ad8Oc009PkynKx9c0u9ckiignr2imbl20gMHgkTlWb2lx3hiWLAVOCnlCol/euyPjdQr
	 2idMup/r2xzLFs389lIM+VeoIlFR4HvsQQNoHuygzqgcQmv0ljLoMT52AjE/mjDZ/EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616556;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0clmgW6W8K3zvBAdCoPv8qr9pD2NFE9Kzq9ZUKQvStg=;
	b=d9epYjj8SiwTL6Qv9Pg73ytbICsWJzsxxlPLc0nQxDw9OUkM32sG/3Gfeid5BHQkJ9a0
	 +ZhvHrvoCxkeXJPJ8Hk/ByfWwtguo3uGpypYEApQaVpKXCP3R7JnzN489wmk7TfNX1y0A
	 B19s74rN4KEhhRT0EWzbtLNa39rZoPqSVDYerruTToltz6NmpJv4wgzbc8nabO8dxPeZN
	 imdgDGZEdrW4Kd4TKjEVdVCQ0CO1N/3/SzqMAKA3qv+uown7AkgwQgoBzzMegygFzroJV
	 qNv1jgTAYY5my+Ah/NI3F3h7kffEzvt7xLM5CpX0Cih5h+uYCp/ujgl+7RGse3WeR+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycvAvHqd;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B7C606A32E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65B7C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ycvAvHqd
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1957573f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:49:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793616555; x=1794221355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0clmgW6W8K3zvBAdCoPv8qr9pD2NFE9Kzq9ZUKQvStg=;
        b=ycvAvHqd90Khx1t6ulxhF8gchS7b43Ou4o6seEwKNejjao9eOz6NgM2DGN1b8QdPdQ
         xdthxBT7wm39HG61RJAQW7+YcynFbl3V+uh1laum65v5vxCV8MbydioKTXpthy1FqKVk
         wB6xOfFMgM101zAa/EpVSge8TOUQrHgTF1R0lwOMmoKHS9n3WaRWJmiOlRhGn5z/ZGjf
         q/GBc2UnNNFYDBJ1WblOezv1JKKZlQ1DlwVipraVfssY5KT82Fk33+0A0RN1vVffTFiz
         FEcMQGqk6RuuJaZEyyn5U8S2TLpvgpGpRs2j2LsxBRQEo+9kmxw56TWgBasKZcdy8bjs
         HZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616555; x=1794221355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0clmgW6W8K3zvBAdCoPv8qr9pD2NFE9Kzq9ZUKQvStg=;
        b=f8CP1Yoo1Lww5OePhxZ0tc525cf8GqGeUwfLgncHYZYe3cCwiqy+DrmaLPMWzlN+2S
         69udEhDizI5+hETcFcsPGXwRR5Lh0dFJEzUUth63U2nJaL25f2pURx1A88eWpKxTg767
         fAH9DCACKGUiGEihpRCrc2RPq6fkT0t5n9BXIUwcBLmnOovgw0x+WEjXSvVUbVnubXp8
         jKJMt/WliHivyc6WIRzj5aoZVnhPvYujPKJQFcMgUVt5aOOLIvZm2G41lX0GQdmHH2G5
         n829+AKfqHawOxEXxKGIJFYb+k2BcJsbnEc9j4ID3nChVIH30654rGkg9EvQ5yrnE82N
         DxxA==
X-Forwarded-Encrypted: i=1; AKwUvBxXhItviPYE0BXl7+eEklwIMSRiwbbfE+MZ5zKva0H/ySp3R/UegxHksXMFlE+HGMfxTeORzYE9f2tFm4M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJB7AfcbQCtnVzfYyqwDZ36LZQFtw40zv3XPPpbsOwYGgdYGer
	sr5HXSVloBz2VAdCWGDEwJ4+qRJWBVG0FIUiu2pY5rggb9IRZOHKR2yw
X-Gm-Gg: AYBFou29RsC0ygj12KsWXviagEhxeNodDZOPa8+3K5wFxyKYGIVeuDgUvoEYnysq/Pq
	K8ApYgrQW2NX7svGBUC1DMzkOMQS0kLNmw7r1Ql3Z3boNoU5b1FhSZCc1GquQadTgBC1T+cTavl
	jxWnpd7pn99s8jAVAselxZInUEXv5cL+S4FGvCsel4emkV7HEIZlUpb+qO8nm8LyDcnqn/lVCaL
	TDUG8/GOlNFXy14cOPWaD5yuDpvVdcst/NsT35ZBmrcF0rLRSufHovsdtmLKQVL8DjdCILOUSZX
	1FPi3o7cFXp1RjlAbFW+xKqbMlkkLslc0GtYJmvc2skdQ+wPjFVtUjABYmpiitBSvSiuz3Yp05O
	MgAdkLHuLuWy2nfl9uPBcyfbSaTy6dwn1+ScnL6P6bPKWdXsBhWIQDZsXoJ/MYyf1otUpaett6G
	/kxdA2XY3jYVLV7mPL5+MfuFnjTga8vsMkuNK4YxTwrr1Ac3hzDWSRwv3bnNDiSbdSBLa/DSBz2
	X4MP8duNQPDqv91mEIWXwktIbugdUo1IzDaVOhKDgoh4RjwAQCweRjdkieh/JuoSmiiCMzg19Ga
	IB2k9nGr5OQ+Pm5Nkwfdog0QNrael1N1HFjQHfrpJ/1hzqUM5vsyXTinaceVi9glxXQFqyQn489
	VSKS3uvqxNIzbL8Oo/k6+3vyOafyv44MSrJa7bg==
X-Received: by 2002:a05:600c:8183:b0:49f:fdca:c361 with SMTP id 5b1f17b1804b1-4ac180f2ba7mr209406045e9.12.1793616554603;
        Mon, 02 Nov 2026 02:49:14 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:2980:4c44:a4da:31ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abe7706516sm180553815e9.0.2026.11.02.02.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:49:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v3] phy: renesas: rcar-gen3-usb2: Keep OTG VBUS disabled until role is known
Date: Mon,  2 Nov 2026 10:49:07 +0000
Message-ID: <20261102104907.16007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

On OTG channels of SoCs without ADP control, the VBUS regulator is
acquired with devm_regulator_get_exclusive() and its output is switched
by rcar_gen3_enable_vbus_ctrl() using regulator_hardware_enable() once
the port role is known.

The helper acquiring the regulator has the following problems:

- The internal regulator is unconditionally enabled at probe, so VBUS
  is driven before the port role is known. If the port is connected to
  an external host this can back-power it.

- regulator_get_exclusive() hands the consumer an enable reference if
  the regulator is already enabled, for example by the bootloader. The
  unconditional regulator_enable() then takes a second reference while
  only one is released on unbind, leaving the regulator enabled and
  triggering the WARN_ON() in _regulator_put().

Fix this by making sure the driver always holds exactly one reference
to the regulator: reuse the reference handed over by the exclusive get
if the regulator is already enabled, and call regulator_enable()
otherwise. Register the disable action in both cases, then turn off the
physical VBUS output with regulator_hardware_enable() until the port
role is established. Enabling a disabled regulator to take the
reference may briefly drive VBUS during probe; this cannot be avoided
with the regulator API.

Rename the regulator helper to reflect that it acquires the regulator
without directly enabling its physical VBUS output.

Fixes: b6d7dd157763 ("phy: renesas: rcar-gen3-usb2: Add regulator for OTG VBUS control")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
v2->v3:
- Added Fixes tag
- Added Reviewed-by and Tested-by tags

v1->v2:
- regulator_enable() is only called if the regulator is not already enabled,
  ensuring exactly one reference is held.
- Dropped enable parameter from the function
- Renamed function rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable()
  to rcar_gen3_phy_usb2_vbus_regulator_get_exclusive()
- Updated commit message
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 35 +++++++++++++++++-------
 1 file changed, 25 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index b5ba751805aa..3481505dea2e 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -1114,8 +1114,7 @@ static void rcar_gen3_phy_usb2_vbus_disable_action(void *data)
 	regulator_disable(vbus);
 }
 
-static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_gen3_chan *channel,
-								  bool enable)
+static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(struct rcar_gen3_chan *channel)
 {
 	struct device *dev = channel->dev;
 	int ret;
@@ -1133,17 +1132,35 @@ static int rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(struct rcar_ge
 		return 0;
 	}
 
-	if (enable) {
+	ret = regulator_is_enabled(channel->vbus);
+	if (ret < 0)
+		return ret;
+
+	if (!ret) {
 		ret = regulator_enable(channel->vbus);
 		if (ret)
 			return ret;
 	}
 
-	if (regulator_is_enabled(channel->vbus))
-		return devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
-						channel->vbus);
+	/*
+	 * An exclusive get of an enabled regulator already holds a reference, so
+	 * add a cleanup action to disable it when the device is released.
+	 */
+	ret = devm_add_action_or_reset(dev, rcar_gen3_phy_usb2_vbus_disable_action,
+				       channel->vbus);
+	if (ret)
+		return ret;
 
-	return 0;
+	/*
+	 * The regulator is enabled only so that the regulator core holds a
+	 * reference to it. Do not drive VBUS until the port's role is known;
+	 * rcar_gen3_enable_vbus_ctrl() switches it from then on.
+	 *
+	 * The VBUS regulator used on these SoCs implement the .enable/.disable
+	 * ops, so regulator_hardware_enable() cannot fail with -EOPNOTSUPP here
+	 * and no special handling for it is needed.
+	 */
+	return regulator_hardware_enable(channel->vbus, false);
 }
 
 static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *channel)
@@ -1151,7 +1168,6 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 	struct device *dev = channel->dev;
 	struct regulator_config rcfg = { .dev = dev, };
 	struct regulator_dev *rdev;
-	bool enable = false;
 
 	rcfg.of_node = of_get_available_child_by_name(dev->of_node,
 						      "vbus-regulator");
@@ -1165,10 +1181,9 @@ static int rcar_gen3_phy_usb2_vbus_regulator_register(struct rcar_gen3_chan *cha
 					     "Failed to create vbus-regulator\n");
 
 		channel->otg_internal_reg = true;
-		enable = true;
 	}
 
-	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive_enable(channel, enable);
+	return rcar_gen3_phy_usb2_vbus_regulator_get_exclusive(channel);
 }
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
-- 
2.56.0

