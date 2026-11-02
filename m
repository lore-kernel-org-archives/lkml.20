Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793598286;
	b=a8aI7f+2FGTviuG2tu8UM+UNOvX1DCkYyc/J2HFyRtsOMosM4Z/Te6iJKHPBZmSWQdoD
	 bCBLjOyoiW5+G7O+dIqW7jSbXgKphNtx5IAYZ065Q4L5G92am+49tyfTNXd3UXSk980y6
	 jd43mnvid9g3hgvTV4XG1LadCj4X8J+Ga8pNAHwwbocIGiCAANZE1k8VnX1adQ09lIEhu
	 egACbdIqMEbJOSAJiXvPsF5lmoLbjDoRSRwLSD8nM0R5sJLOk90xfWofVYY3jLSQ3bK9T
	 fAyqHqqvHfvyK3Yvq2muvlTbB1PXtLhO4FWVzBgEcewo4lmmqJJUjiXuTRTFMOQAomw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793598286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ZVAdkMAvn50gHozZX/KodN8m8JvreXpUXeN7urPtaNA=;
	b=E8to6PKRaNdg3RmDgI5vkdMxoZa6pBKCmdf2dpvf/6YlqfcXo+s6+d6px8FKqD4+sxNH
	 M/hHlrVZKeA24H7aQidGbB7t4R6KjY6h9z1ld2wy5cknOtoBcqoqGw0rd4KU77/eOfcBp
	 YMv5QV4+zZMfGpUwO3NHMXm4U0IOO9r40a0RPWD201FbOUwhGVvBFY2kZwRSNDHN3wquZ
	 AqXml0f2f+TRsrxzXGzxZyLlmfDpOid3F1PgRupxLkgD+meYkMeva/U4N07xTOv4bDaqL
	 DF5DICfLK6JDYa9SeNcYnJOlOkZV6DgvXoH1b0kpWaFaCOnM6EEM/uTeguzkVfXs7nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUfy1ZTB;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD91606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rUfy1ZTB
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so1415535a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 21:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793598284; x=1794203084; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZVAdkMAvn50gHozZX/KodN8m8JvreXpUXeN7urPtaNA=;
        b=rUfy1ZTB62G+QYUp6DXb0Ki3ZZ33xyn5Q6LPVvBInpNHDmONfKWI05iclAs37yUoDc
         Cho89CEa+ySpVl/Bm1gTM1OK7trGcsfvmlk0Vn9FzeI46Eh/i9Y368xplmQ+gaZmr8FF
         UFvi4jbgeJ0jAN+muQqvm+9L6LrqaxSDIOGdjD+mjFRi/6X9wSQPLuAQzqIkfGFVYIbT
         xGwnZXx+xBmVsVtgnTXLce6dD9kkhL8IFtnun3AaWda8tlLGBYUACtwhVq0a0QyBXlxa
         f/JtjZ4HIL9HcXDslXZbTjURb/n3YlcM13F1FTbgFzJSkVIUmAvYGjaBbOfJ7fmEAF2r
         7A6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793598284; x=1794203084;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZVAdkMAvn50gHozZX/KodN8m8JvreXpUXeN7urPtaNA=;
        b=rpTtTvzqIEviUANNxVR9faM5K6Jce8aNKs5D3ozYwA6il1hePwCg04RSxM9/PGwIKw
         bneE81rKQ9cc4MC/rQnrmrFhKXoAOE9UQm4Nsm4BT7K/4zZMRNUSyawENGAlDVcNrI9L
         FHvXO2zZHkjVbrWHKECODOKv9AFHHhvy7SHOj4T3aGCbfsfumOFuxvuBVmUVpjqltEod
         tnYmAATjf4V28OiIDmzAqODdBvX67pAOVAcpRpXC5acrDCs6v2JKqUp1MKTJgh6Gu4z1
         ELzflu3pwsKJjzl+TaJfP371ZIWy+k3chnalnuVFkUk19QgBQrCGzPm2DlvXpe5GAupn
         uwnA==
X-Forwarded-Encrypted: i=1; AKwUvBwd0MszCqJaIoUqHPmEfYqkgfyhZ8ZhmBqr17FtW2wMQJOYJg0tzHOH+V5zPeEUWxV0LEJC9s8jSDG5k0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYLb7Rta6/iRSM6Zvh24h9aPR2JMqAdC9Ltwp52HUfNSu1KpZ5o6
	kU5jG5aElc5l0fopBXydQ9YEX4gBdtdikf7MTGZ5zDnzJB6uPyYyt03f
X-Gm-Gg: AYBFou3LVCP3aS3Hcyus6QzYdU6dM0Qvrc8Ej3q7F00dakxc2Wdu7294qwHw/Tclbsl
	fHqwKkdNlJJ1sbP6DPRkIMGD/CC0Flm9w9uLDrICxteP92inzUxlBpsYVOzMGto1VR7DKxYjvL4
	CeGEsvz0KSKlYDK8AbRM5p5x07XEaV5uWOlrFssx5U10wCmcGnwQougCJEE+vuInGx9VTUNJmXu
	RcfTEz9/uebmUUTlY3shnqe/uWn+1qg4jHcCMZ5NkjIeH6Y4aLwtXSyKZpr6APzWuT4EsIEWkmK
	vpM/vZJK7HdZZgzZczctS+0NHqWISf9D8UCcg3ftvbhuiDuuqytQxvxJv8NHeLZu7706LU2yWHf
	pEMhyMogAH11pzHgViKaVPw8zGOyp6/dHFv+d43j5HjbGZmp5I6LASROQVLkEGD424BOIYITvPN
	R3Yy3L6puB2kNITSHuJM8BUJdUPOpa2H+vg1N0ZyEISef6EltT3UZ5QDwmZxM/gliFHA4efsV+J
	ORwpGpBA6v3KNylvrUibld7TSAFCLz2tXM66yUIzFIk8J8XWMoHb5Wn9/fqhuH+01sj6Qm+HgkG
	jjquFQTIdf7nqQ7PDuPJqOyH
X-Received: by 2002:a05:6808:2396:b0:53f:3c0e:c74b with SMTP id 5614622812f47-5640d91a298mr6523131b6e.9.1793598284521;
        Sun, 01 Nov 2026 21:44:44 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd9888bsm7654306b6e.5.2026.11.01.21.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 21:44:43 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Sun, 01 Nov 2026 23:44:37 -0600
Subject: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe
 deferral
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3NUQqDMAwA0KuUfBuIZWyuVxn7qG10YbSW1MpQv
 Luwd4F3QGUVruDMAcqbVFkyONN3BsLH55lRIjgDluy9J3qijtoYa+MdW6mrsk+SZ0zrF0uKS/K
 SMfLEihTC8OBxsDci6AwU5Ul+/+v1Ps8LIGoGRnsAAAA=
X-Change-ID: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb82400
To: Ulf Hansson <ulfh@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793598281; l=7479;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=SyPRYlUtZR7GNv/iXFv7JY2/OPcFvWdXR3T7DquKY1o=;
 b=61ytKL+JiPa+o5Cgw1Ggsx/eDe98G0g2mX78NMn5H5CLIGN8igwq2krqaLz8yNzcuMLdY2AZP
 AbzI3lK2g87DnRE0jTuxcZYkOcRVjUMRUh9A47PY36oC7KtHlSEuB4c
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=

scpsys_add_one_domain() powers each domain on as soon as it is added,
before the probe has looked up the supplies and clocks of the domains
after it. When one of those is not available yet the probe defers, and
the cleanup powers off every domain added so far, whatever state it was
found in. The retry then powers them all on again.

A bootloader that leaves the display scanning out does not survive
that. On the Amazon Fire HD 10 (MT8173), mfg_async's domain-supply comes
from the MT6397 PMIC, which registers after the power controller first
probes, and power cycling the MM domain under the running display hangs
the SoC on almost every boot.

Power the domains on only once all of them have been added, so that a
deferral leaves the hardware as it was found, and on cleanup power off
only the domains this probe has turned on.

Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Found on an Amazon Fire HD 10 (2017), an MT8173 tablet whose board DTS
is not upstream yet. Its bootloader (LK) leaves DISP_OVL0 scanning out
when it starts the kernel, and the MT6397 regulators register about 50 ms
after the power controller first probes, so the probe often defers.

The deferral was forced for the A/B with a local test knob that returns
-EPROBE_DEFER at the first domain with a domain-supply. Each boot attempt
was counted from the host's USB log, since a hung board is reset by the
watchdog into the same kernel. The hang does not happen when the
display is stopped before the power controller probes, which is what
our downstream kernel does today.

elm, hana and the MT8173 EVB also give mfg_async a domain-supply, from a
DA9211 on I2C, so they probably take the same deferral path. Whether
their firmware leaves anything running across it, I don't know.

Only MT8173 (direct control) was tested. The HW-voter cleanup changes
the same way, powering off only what this probe powered on, but there is
no such hardware here.

This patch was developed with the help of an LLM.
---
With the deferral forced at mfg_async on every boot and the bootloader's
display left running, 61 of 63 boot attempts hung before userspace
without this patch, and none of 5 with it. With the patch, the cleanup
left MM on as the bootloader had left it on every boot; without it, it
powered off all seven domains the probe had turned on, MM included.
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 60 ++++++++++++++++++------------
 1 file changed, 37 insertions(+), 23 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index f0fa79e01f9c..6a81aadc18f3 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -982,12 +982,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		pd->genpd.flags |= GENPD_FLAG_IRQ_SAFE;
 	}
 
-	/*
-	 * Initially turn on all domains to make the domains usable
-	 * with !CONFIG_PM and to get the hardware in sync with the
-	 * software.  The unused domains will be switched off during
-	 * late_init time.
-	 */
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF)) {
 		bool domain_is_on;
 
@@ -999,15 +993,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (domain_is_on)
 			dev_warn(scpsys->dev,
 				 "%pOF: A default off power domain has been ON\n", node);
-	} else {
-		ret = pd->genpd.power_on(&pd->genpd);
-		if (ret < 0) {
-			dev_err(scpsys->dev, "%pOF: failed to power on domain: %d\n", node, ret);
-			goto err_put_subsys_clocks;
-		}
-
-		if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON))
-			pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+	} else if (MTK_SCPD_CAPS(pd, MTK_SCPD_ALWAYS_ON)) {
+		pd->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
 	}
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_ACTIVE_WAKEUP))
@@ -1085,7 +1072,7 @@ static int scpsys_add_subdomain(struct scpsys *scpsys, struct device_node *paren
 	return ret;
 }
 
-static void scpsys_remove_one_domain(struct scpsys_domain *pd)
+static void scpsys_remove_one_domain(struct scpsys_domain *pd, bool powered_on)
 {
 	struct scpsys *scpsys = pd->scpsys;
 	int ret;
@@ -1100,11 +1087,10 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 			"failed to remove domain '%s' : %d - state may be inconsistent\n",
 			pd->genpd.name, ret);
 
-	if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER) {
-		if (scpsys_hwv_domain_is_enable_done(pd))
+	if (powered_on) {
+		if (scpsys->soc_data->type == SCPSYS_MTCMOS_TYPE_HW_VOTER)
 			scpsys_hwv_power_off_internal(pd);
-	} else {
-		if (scpsys_domain_is_on(pd) || MTK_SCPD_CAPS(pd, MTK_SCPD_SIMPLE_PWRSEQ))
+		else
 			scpsys_power_off_internal(pd);
 	}
 
@@ -1112,7 +1098,8 @@ static void scpsys_remove_one_domain(struct scpsys_domain *pd)
 	clk_bulk_put(pd->num_subsys_clks, pd->subsys_clks);
 }
 
-static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num_probed)
+static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx,
+				  u8 num_probed, u8 num_powered)
 {
 	struct generic_pm_domain *genpd;
 	struct scpsys_domain *pd;
@@ -1124,7 +1111,8 @@ static void scpsys_domain_cleanup(struct scpsys *scpsys, u8 *domains_idx, u8 num
 		genpd = scpsys->pd_data.domains[pd_idx];
 		if (genpd) {
 			pd = to_scpsys_domain(genpd);
-			scpsys_remove_one_domain(pd);
+			scpsys_remove_one_domain(pd, i < num_powered &&
+						 !MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF));
 		}
 	}
 }
@@ -1361,6 +1349,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	struct scpsys *scpsys;
 	int num_domains, ret;
 	u8 num_added_pds = 0;
+	u8 num_powered_pds = 0;
 	u8 *added_pds_idx;
 
 	soc = of_device_get_match_data(&pdev->dev);
@@ -1436,6 +1425,31 @@ static int scpsys_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/*
+	 * Initially turn on all domains to make the domains usable
+	 * with !CONFIG_PM and to get the hardware in sync with the
+	 * software.  The unused domains will be switched off during
+	 * late_init time.
+	 *
+	 * Do this only once every domain has got its supply and clocks,
+	 * so that a probe deferral leaves the hardware as it was found:
+	 * the bootloader may still be using a domain that is already on.
+	 */
+	for (; num_powered_pds < num_added_pds; num_powered_pds++) {
+		struct scpsys_domain *pd;
+
+		pd = to_scpsys_domain(scpsys->domains[added_pds_idx[num_powered_pds]]);
+		if (MTK_SCPD_CAPS(pd, MTK_SCPD_KEEP_DEFAULT_OFF))
+			continue;
+
+		ret = pd->genpd.power_on(&pd->genpd);
+		if (ret < 0) {
+			dev_err(dev, "%s: failed to power on domain: %d\n",
+				pd->genpd.name, ret);
+			goto err_cleanup_domains;
+		}
+	}
+
 	ret = of_genpd_add_provider_onecell(np, &scpsys->pd_data);
 	if (ret) {
 		dev_err(dev, "failed to add provider: %d\n", ret);
@@ -1446,7 +1460,7 @@ static int scpsys_probe(struct platform_device *pdev)
 	return 0;
 
 err_cleanup_domains:
-	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds);
+	scpsys_domain_cleanup(scpsys, added_pds_idx, num_added_pds, num_powered_pds);
 	return ret;
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261009-rbrue-suez-upstreaming-mtk-pmdomain-defer-0cc87eb82400

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

