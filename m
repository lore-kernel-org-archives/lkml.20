Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A073AB47E
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791565042; cv=none; b=kCgjYo4aIu5h3yRoOArjn2ASySWcEDE9GQuP1nNovzx1ixybjuAdmg58Jjs/cmYxHbJh8kSRBnr3ovz+yYITFOvfAq0sLOzWxS4mvfiRWn3Fj5kElh370LWhrdF1JUvxW92IOOyi2k8ioj9KkPT7jGb7QEcrnzGM7Q4PF0MPxhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791565042; c=relaxed/simple;
	bh=lsKw8BUqB2i8PlWaeh2lm5BE6pBBcN0QCDBp7cwoE6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FQ4PrufpvjKAzRnRfP5zbX24ZmF6J3Ou9wEdsMchklYk6oPnq4zEqUB7XY54PDMLeJM/KvLq3CI5HLaG9WUXnb7kfRe9n19sMdAt0cORl6LGfYPADNVcBBuxRJ1PMuLXbLYpTM5RIXwQblRGw+LqE6YU0xuFwaYU2nNt69A9ijI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EGzxMH9q; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EGzxMH9q"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1880e1bf1so599165e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791565039; x=1792169839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pbt4JRGi2yyrIpxHVLcBe+EosGZVPWi/jFn4uBQ1NNo=;
        b=EGzxMH9qHhoOVFolss3DVPRDHRU5SBAK9ET7t0fHsuF+vsKKcLQsQF1kr2z9BJJMC3
         O5UoyWAlczIWjDAPKji3cHuIvyAlkW29bhYOEs8qWNQ3eRBG4ca17/Sq0xafu706xmc7
         p+dG3hK7N00B6ve4DfhV7/n06qHwxd5Y1nt4NeHR4XcW3qNdzJLCbTYvu6P73IaYZhUO
         1x6ugbc7aYVavf+pUUeSFnT3FuWtJyBu93NCirA5dOKyNYKiF2EMqdInSxmmmp8cykrz
         EpKABnJ3VdWfai48W2P6fmUOW+qQEGCDpnMo6YbPw9EofBOB1yVuEPVyWpF5/YknpWrB
         GutA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791565039; x=1792169839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pbt4JRGi2yyrIpxHVLcBe+EosGZVPWi/jFn4uBQ1NNo=;
        b=neJcOlKPI1OsgfiB2hhxpGu574oZUiTQiO21onXts+sttmZ41wBQepYYEXfsZnyfCT
         dc9hCVD3OjSWVTmrlaDGuke46PUHp41fSNcN5BA84gG+SQ3ZfeDvwSyZyItCEMx18xcR
         kGAgDTioNutfU3VKuHg5w4wQ2/lUz2Hr22Aa/3va2jvS6Wv3qoVqe1gviVkL6n0BRj/i
         D1PgMBU088bryBKXA8eLX5MqINyRTNZHjNXPWBwMoyRJVHu1shhSCgImgzQox++aG/eq
         BXrVdadaR5961DaaAvNAzZYnfV4y1AR7LdIyc1FXBcy1709eMnanxN8mtpeXaWnlnALM
         hviQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4lR47s7XExXY2EQzI6h91alnbm/HP7kfQv5tmLf95f8TZUbx/pLJZjP0Oi4ZsLdvBi8BOEvbPy92YRVg=@vger.kernel.org
X-Gm-Message-State: AFuF++mIkGEH5Vd9F1INmeAMjrmI/o3oma1NBreYmyZKd1nK0q16zYVz
	QGabTjMOClbKzgrQx4OYyGf4K4WzCH0AKflq9JBSrW5p+lgAq/x4e4jM6RPkKrKR
X-Gm-Gg: AYBFou0I+WILlqJoeDraKfkcIabE2yuu5Lmq9xvKwb7AS/le1zZs1lDdisJBSjjhB/M
	fXFLOmdeIFxiq2PFszAjSP/epxGLmTFml0juWSbaZt6N00QoGD6B0HyWp9Kgcdw2rQOVwPyiIQP
	k5x1K/MEX0cOdT2JSynC/Xu5w3DCDD97P4UaNfRTrhjQ9Uq7E6xtxCh1BQCZajiY+x0gy+j4vnu
	LOJkLZMsowEIluWvOKMaw+JGXHu7es5dQl6EjhChVho3hN0B8gx0ej7sr+6/9UDsTadKuEm6Vvu
	P3o/Eu39+UM+GGcNBH2VewilUkKsUQ1m9UJVGa9uvi4aGi0FhT1T4X0UrcVBoNkz0yvbnv5WKEh
	k02ZvFqKUI1PZiNff9WWAQY6D58n4FGUXM8ubYlycJ9Sk9RPhG/nlZ8cj/nTA1GDHdBfPPvdCRl
	ZVOKBPAuj64UJRIU+Yu2JCS0DVLe7YjI4s84QlaZLyGJe7+g/EsZK4pNsXqNjUzHw3XpZWeg847
	L+gCSBV9rM7HR/FuLxhfZgbN5EikmyRkv8qLpSpv5OF8dmsYmJpNgdYizGePLnYrCLH7vud/Lk8
	IniiND78b88l19m4Ow==
X-Received: by 2002:a05:600c:154b:b0:49c:fed6:cd3f with SMTP id 5b1f17b1804b1-4a18e4d0be2mr49995535e9.23.1791565038895;
        Fri, 09 Oct 2026 09:57:18 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:e93d:161b:5ff8:cb57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf1358asm70667395e9.4.2026.10.09.09.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:57:18 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] soc: renesas: rz-sysc: Make power sequencer auxiliary device name SoC specific
Date: Fri,  9 Oct 2026 17:57:06 +0100
Message-ID: <20261009165710.1320233-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The SYS driver currently creates the power sequencer auxiliary device with
a hard-coded name, which prevents SoCs with different power sequencer
configurations from selecting their own targets and consumer match
callback.

Make the auxiliary device name part of the SoC-specific initialization
data and use it when creating the auxiliary device. Set the existing
RZ/G3L configuration to "pwrseq-pwrrdy".

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/soc/renesas/r9a08g046-sysc.c | 1 +
 drivers/soc/renesas/rz-sysc.c        | 6 ++++--
 drivers/soc/renesas/rz-sysc.h        | 2 ++
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
index cd129c727461..4faaa511f41b 100644
--- a/drivers/soc/renesas/r9a08g046-sysc.c
+++ b/drivers/soc/renesas/r9a08g046-sysc.c
@@ -77,6 +77,7 @@ static const struct rz_sysc_soc_id_init_data rzg3l_sysc_soc_id_init_data __initc
 	.revision_mask = GENMASK(31, 28),
 	.specific_id_mask = GENMASK(27, 0),
 	.pwrrdy_pwrseq = true,
+	.pwrseq_aux_devname = "pwrseq-pwrrdy",
 };
 
 const struct rz_sysc_init_data rzg3l_sysc_init_data __initconst = {
diff --git a/drivers/soc/renesas/rz-sysc.c b/drivers/soc/renesas/rz-sysc.c
index 0e92c415d4be..05f04dd3c94e 100644
--- a/drivers/soc/renesas/rz-sysc.c
+++ b/drivers/soc/renesas/rz-sysc.c
@@ -107,6 +107,7 @@ MODULE_DEVICE_TABLE(of, rz_sysc_match);
 
 static int rz_sysc_probe(struct platform_device *pdev)
 {
+	const struct rz_sysc_soc_id_init_data *soc_data;
 	const struct rz_sysc_init_data *data;
 	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
@@ -150,8 +151,9 @@ static int rz_sysc_probe(struct platform_device *pdev)
 	if (IS_ERR(regmap))
 		return PTR_ERR(regmap);
 
-	if (data->soc_id_init_data->pwrrdy_pwrseq &&
-	    !devm_auxiliary_device_create(dev, "pwrseq-pwrrdy", regmap))
+	soc_data = data->soc_id_init_data;
+	if (soc_data->pwrrdy_pwrseq &&
+	    !devm_auxiliary_device_create(dev, soc_data->pwrseq_aux_devname, regmap))
 		return -ENODEV;
 
 	return of_syscon_register_regmap(dev->of_node, regmap);
diff --git a/drivers/soc/renesas/rz-sysc.h b/drivers/soc/renesas/rz-sysc.h
index e55f3258d703..b9665071cf4e 100644
--- a/drivers/soc/renesas/rz-sysc.h
+++ b/drivers/soc/renesas/rz-sysc.h
@@ -21,6 +21,7 @@
  * @specific_id_mask: SYSC SoC ID specific ID mask
  * @print_id: print SoC-specific extended device identification
  * @pwrrdy_pwrseq: has pwrrdy register controlled through power sequencer
+ * @pwrseq_aux_devname: Auxiliary device name associated with the SoC
  */
 struct rz_sysc_soc_id_init_data {
 	const char * const family;
@@ -31,6 +32,7 @@ struct rz_sysc_soc_id_init_data {
 	void (*print_id)(struct device *dev, void __iomem *sysc_base,
 			 struct soc_device_attribute *soc_dev_attr);
 	bool pwrrdy_pwrseq;
+	const char * const pwrseq_aux_devname;
 };
 
 /**
-- 
2.55.0

