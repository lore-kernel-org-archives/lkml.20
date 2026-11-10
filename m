Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279551;
	b=ElwvpquZS3TVZW+o55yoGnojLFjEvdK22bxrrc3Bnk7schvXKe2AgX//7umQ4Vpo599S
	 LxWPjGonN423Mlv6Cn2TcisCTFsycq50C2GSTPJjsrEnPsPI2TulX/LhL+rhd9jvIEPSW
	 s7Gt6+qfDRlo0p6PniCxV/cLQ1bhs+pexV12qzKw0XWPBBXVbAEPktTN+dm86cLCnaxyF
	 WdBjxuZVTGHqDR1Zqk5fJ2qQ22YRlEyU2/86x6+//yoFHgI01AV8i39kDJnBy8SMBOWVC
	 sDPOlsFge9MbGrCpoPlMUUElt8GKJBh0uiU0D1Q+c3ipW8KoyhxmgKvxiUAoNSaLfeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TKEXE5ZQs3KyTFl688A4Kvp/MS9lnzYMHmvWusn80YE=;
	b=P0bbWUGXvypymohNM0Tt6k5WSySUJpewazHUblCgzRnpaqLdYzAh1WSvBP3N11cndLd5
	 tbCXXWbt26uRW+5TeiU6Ik6Aw9FmMZrKoUSYveyoJ7bC+8T79SdyEyNZoFwW785H5rZUA
	 eKq00jvmQ3kJ/7wUR7zHU9Db0iDWn2W6d20hnkYajIPPGPWEqLkgHIXADhA33S+jKLadP
	 ytxz8WtbdVREJsU/Z293wRfrmMxAnfhs+VBJtqIucaZx+e69cqYbzEV5HDUgfBMh0A0Df
	 24NIUneHLhqMzy3VIjMcavUdK2rIxxxbg1bfXfF2Xv6gTbPAfMQFyHxO9EWh/vVvv0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXBwXJJV;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4CE606AA26
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B4CE606AA26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXBwXJJV
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53381e53b80so18530471cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279549; x=1794884349; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TKEXE5ZQs3KyTFl688A4Kvp/MS9lnzYMHmvWusn80YE=;
        b=eXBwXJJVTFqzqtNddRZbUr0xNa2mBfpHs1/Uoi6yAeEYaah4nhFSHTsHIKEhVA2Db5
         8aMpSnDE9ThzHF91BumcZOmS15bh6HyopLnOeObhZENBNkU7thUBqtepEGROjhn4oO69
         ut5pkwxJABjP75JQR8mA440d2ze87RgC6RYKDKDc8JZJB0xpq+HIEQwtZTTGccilWxD1
         jbeJ26dwzLhAaOE8wMvgiWkwNm0s8gWMYFCc3zEnQSQDjsec0T86udpaWhEna7xRpiVV
         m6bvnYT+v40UgwUsQneO/h2cTHbHRN4X2FblFQPn9Ddh5hvHHV6pBEIbiECXJ7UFu4AH
         s0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279549; x=1794884349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TKEXE5ZQs3KyTFl688A4Kvp/MS9lnzYMHmvWusn80YE=;
        b=mjlUE+s2yaqQSsw/LLk4jRZdibgXWrjW3/voeh6dgJyRkFYa6fAhAenADu+PAtMtE2
         w0uWUJ07T1rc6mjjEXoEzadHpQfqlmorWRskTQpNsZNuO6LdwH2ygmGxXOM1Prc/oav1
         1GbNEm8qQ6WKlscgI1MSyd9Tb/SL85zsjg9IWIxfw6PTPrT1/4eEKpPQXjH2/YB8We0F
         n7Dn95dPAGdGynYTexydQsFi68/Ol0tlOqcr7sZqCorN/gQpVTCxZwi3m4aaaVJ2okFK
         3EK3TTHvKRikXLI30oADI38ikKoB2wHTswGOF9RDXzL5LSLgIW85begl+4pWcx7mWqqo
         TctQ==
X-Forwarded-Encrypted: i=1; AL+hErG/NpScHma3Sva65cpah42nx080v0KV/wW0qIPeT1Acp7wjnpjKYCreeCGaJ78OuBDPT9QxKjp3j3EChpA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N0c9FeQFE5DDxoAdtYaf0FZY3dp/JvKPgmG6zdmgt47XiAWtq
	3rGGuBjz8dnVVyrJ8Mu6H3bCfhs4iM6bY4xMOXyiADRwPgoqqQgfqPQ=
X-Gm-Gg: AYBFou3MJiu8TYp67Z/fsBViD+HKnHIw9NT//cCRsiee+TvR5jH1eoz1YhcfhcFqLZF
	9D1XgZx5unMX6MBC+E0gUwRdrQZUg3E2rF1yndmoaqJa5UWdOyi6RnQS+L8+gn/88jO8e0eZKEb
	0UKnROV2YAg93S8CUFLbJPF12mVp2bj+UXKQ6tdMCsEYJGkseN5p/kTsiiclkp6XtBkLyOjXzFg
	bALVq9SvyHgS4pk7ahH8dltnt8EgxDGM5CXOgzAUtI2D6v4TmxEysgb73l+7OvJm8z1EIh6Lndl
	6YMgOA2Cx7MsR4fLfFPYxqwSSyiGGcTMesfOpA/BngJiqA8Ul1QY6T638LsYzVqc3UaLLIrRJg4
	MRYAvukveEvcbzWhtKk+QoMKj2alGlvpxJ+t7v31lA4RMMRiYeMq45FCglydygc/g6fDTBJACvU
	61QZt+b4roXG+g48THIq7+wsU9P2NidrkYOpJp7dZdEMhznBu0Mvwg8JR7HOpTHLIcazFGVu4vX
	7VD8J19bn8l5ppB8MFUfqXiA0d41TvfV7CNEiYA3lc+8QJ1zDrtJW6vUyX6sAKqLOhtEaNjMmWE
	l/xF8WtJEK295noFraigdKTAxHEk7QT4CTDz3MLLNnpLAARkeyxuCJYGj3t9XK7KD9XfibJHOSs
	UhcVWGpE6x2Dcodi8bY0ceK+eVoXvdoqrth6diFTotOfefBBz5YWpaspX2/cxcnkO
X-Received: by 2002:a05:622a:588c:b0:53f:8b6e:5380 with SMTP id d75a77b69052e-5552af4cbf5mr18843441cf.62.1794279548866;
        Mon, 09 Nov 2026 18:59:08 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:08 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 1/2] media: rcar-isp: release the core IRQ before destroying RPPX1
Date: Mon,  9 Nov 2026 21:59:04 -0500
Message-Id: <3b33e5cec5d3d046b67ab7ca31af0d63368da120.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1794278853.git.mhun512@gmail.com>
References: <cover.1794278853.git.mhun512@gmail.com>
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

risp_core_irq() accesses the separately allocated RPPX1 object before
taking core->lock. The managed IRQ can remain registered after probe
failure or removal frees that object.

Request the IRQ after initializing RPPX1 and the handler's state.
Free and synchronize it after draining I/O queues but before destroying
RPPX1, keeping completion IRQs available during drain. Unwind the
subdevice and mutex on IRQ failure, and convert -ENODEV to -ENXIO so
the parent does not mistake the failure for an absent core.

Fixes: 2151350f60d1 ("media: rcar-isp: Add support for ISPCORE")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v5:
- Regenerate for git send-email; no code changes from v4.

No hardware runtime testing.

 .../media/platform/renesas/rcar-isp/core.c    | 27 ++++++++++++-------
 .../platform/renesas/rcar-isp/risp-core.h     |  2 ++
 2 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/renesas/rcar-isp/core.c b/drivers/media/platform/renesas/rcar-isp/core.c
index 586a5adbedf..14f3c8f3505 100644
--- a/drivers/media/platform/renesas/rcar-isp/core.c
+++ b/drivers/media/platform/renesas/rcar-isp/core.c
@@ -798,15 +798,6 @@ static int risp_core_probe_resources(struct rcar_isp_core *core,
 	if (IS_ERR(core->base))
 		return PTR_ERR(core->base);
 
-	ret = platform_get_irq_byname(pdev, "core");
-	if (ret < 0)
-		return -ENODEV;
-
-	ret = devm_request_irq(&pdev->dev, ret, risp_core_irq, IRQF_SHARED,
-			       KBUILD_MODNAME, core);
-	if (ret)
-		return ret;
-
 	core->clk = devm_clk_get(&pdev->dev, "core");
 	if (IS_ERR(core->clk))
 		return -ENODEV;
@@ -887,14 +878,27 @@ int risp_core_probe(struct rcar_isp_core *core, struct platform_device *pdev,
 	spin_lock_init(&core->lock);
 	INIT_LIST_HEAD(&core->risp_jobs);
 
+	ret = platform_get_irq_byname(pdev, "core");
+	if (ret < 0)
+		goto err_cleanup_subdev;
+	core->irq = ret;
+
+	ret = devm_request_irq(core->dev, core->irq, risp_core_irq, IRQF_SHARED,
+			       KBUILD_MODNAME, core);
+	if (ret)
+		goto err_cleanup_subdev;
+
 	return 0;
 
+err_cleanup_subdev:
+	mutex_destroy(&core->io_lock);
+	media_entity_cleanup(&core->subdev.entity);
 err_unregister_v4l2:
 	v4l2_device_unregister(&core->v4l2_dev);
 err_destroy_rpp:
 	rppx1_destroy(core->rpp);
 	put_device(core->vspx.dev);
-	return ret;
+	return ret == -ENODEV ? -ENXIO : ret;
 }
 
 void risp_core_remove(struct rcar_isp_core *core)
@@ -905,9 +909,12 @@ void risp_core_remove(struct rcar_isp_core *core)
 
 	dev_info(core->dev, "Remove ISP Core\n");
 
+	/* Keep completion IRQs available while streaming queues are drained. */
 	for (unsigned int i = 0; i < RISP_CORE_NUM_PADS; i++)
 		risp_core_io_destroy(&core->io[i]);
 
+	devm_free_irq(core->dev, core->irq, core);
+
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	mutex_destroy(&core->io_lock);
diff --git a/drivers/media/platform/renesas/rcar-isp/risp-core.h b/drivers/media/platform/renesas/rcar-isp/risp-core.h
index 627a762d6b1..9e057bff4ee 100644
--- a/drivers/media/platform/renesas/rcar-isp/risp-core.h
+++ b/drivers/media/platform/renesas/rcar-isp/risp-core.h
@@ -112,6 +112,7 @@ struct rcar_isp_vspx {
  * @dev:	(OF) device
  * @rppaddr:	Hardware address of the RPP ISP (from OF)
  * @clk:	The clock for the ISP CORE
+ * @irq:	The interrupt for the ISP CORE
  * @rstc:	The reset for the ISP Core
  * @csrstc:	The reset for the ISP Channel Selector
  *
@@ -138,6 +139,7 @@ struct rcar_isp_core {
 
 	u32 rppaddr;
 	struct clk *clk;
+	int irq;
 
 	struct reset_control *rstc;
 	struct reset_control *csrstc;
