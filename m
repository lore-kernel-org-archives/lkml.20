Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4C14534A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 11:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788781870; cv=none; b=t8LcFu34gtEdYRC5IlS1PeSQrBzYo8CX00ish2wjvKDsBOvzYp66+WrzTFkWgAsEB9Tn7iS6kLql8/gk4RXBkkmuo34YSkO8FktPhdcQUfHf7vfUOEzweOqH2oVgPEy+S8dhhKDtqEsu+qbTEK+YBXc6c34PC0yKEegCDjXFSms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788781870; c=relaxed/simple;
	bh=2OZ8D+HZ6z2ZRz3LMuNutAC/kAsSH1RKaIHz33mkXqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=SiEXwNZapudfPbiPgXG0j7CrBfD2+F2h04SX35akkF93QT8mBAwUbJNEBh/ZnqhBfAXEAKirugwOH9PvLwROTlYKH70seimL7S22MDmi0cOfRdi4ePKGlPngfeD/489cgyTix7R4eHJ5h6kg9MWcSIVbcGwve6jcrE/G4dtzUu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QusFfYUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bq2uSuCi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QusFfYUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bq2uSuCi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Ammf1809858
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 11:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hnZ77uAGNkXZwL38YlAOhF
	w5azQdwBgsjPnqcAPbxdA=; b=QusFfYUSw+/4Pxv7ltfpDAIbTXM8YJfSkJhjj1
	mLfdf6bbvzll3xLVKO50+0u1O/bpwWFOhyqNjnJ3sjouJxiN35DA9gFxPc0vdM32
	vzapDgvFOp6h4zp7rbWOGGoFOc8vCopTpWdmLDWEyyOlXy5lyBC+tHnPzGYtpwaq
	p57o0KSfJqibgoY9TJx1rGPQxoYpvGHIz/g4Z24GXzCuG4OvhpOzyO+HlBMtOYKx
	oWUBmgI/Scsu3d+Ocq6L+uvQbnVmjBKJdjMJBH9S0XmxuUVLZmsItRSYsnPLudSY
	TYAiMeKqJovSyYCGGRpwgEiwNCaYFQEPDXjoP7Df+rpKuuxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghrua986b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:51:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9394ad7f64aso572503885a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788781866; x=1789386666; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hnZ77uAGNkXZwL38YlAOhFw5azQdwBgsjPnqcAPbxdA=;
        b=bq2uSuCiNFsk+hMn7iJhd4SjjQ4eEWo+T21ialF8HC6O5wUhSigul3bN4eUjcC5Po6
         38fUBCRauVTjrsc0DFrRE4wRGrtsLwN6WitAkB0v6TY1uF3IkENGerEdcSzvSeNvMPCS
         JUi9XD92+UZK7bm3t08/sWmc1Kacg+arDqm8fOBXtmo1Ohn0O//VTV1+uXSf2ai0+oYf
         06pZqBJHZ/bLzQ25MOWLrQ3soMEZeH6NIFq9Gzq9mXXTS38sFv5cYq71ePuWoEbsMfL6
         s+B4Ne2ibBhGDBj6MlzduH7dlUPvkUvcOk1Evfu0dLBSNFhVabrsekF28t2MTwBVVtYj
         MkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788781866; x=1789386666;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hnZ77uAGNkXZwL38YlAOhFw5azQdwBgsjPnqcAPbxdA=;
        b=YM70DJeq8f7fkpulnStHTTixSaFfrL8t5hVwoCUuQjtkRqTCgrwWzEzgctoNiaG4YI
         Z2teY2KP+olYOPya4YUVvJkk0wMvJ/eq7WkBGHGsx6NRLmMVJBf2mys/GZR9g3WAXeVf
         uUzHjYE3q/60gkcgoGgkaOdrzkEMqu5yK1svOOZTyS5KaqT9OTbvXJvzy37s44Eue/9j
         c13qGZa3Ohkua074pCLfx53E85QGmrYK70oonLKI1GzV559Wo+94/DuqOevYD1wKRzp5
         i8aKOdcEqEsV0zIDIEkwgdJLsnNbkT259BXdXRC6e9UMEgJ7YtcAPe8xg2xzmImmhume
         Qf9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUFIfj0Dze1gN7bS9Dszru5tfmRi5iE+/cgui8JX9p8mPHKTaVivL8hNPogYfgGAelIg535U2zw0W05tA=@vger.kernel.org
X-Gm-Message-State: AFuF++mgYk3y9l27/MW7PiaqFUrhszrSNDoDPXHI/p3CbyQJS6RMSSE+
	2TUc/fNtIbXTeHX0lUZxUToAEYXX5d5IMiEiO33+dO529f9dkcj70BJnZJg1LB26vUZOCG4/dzG
	PgLAV0Zv8370qb1qnDbzUjlL56s+gbaf3YY/wkG13Q6jfz2VDFIA8q1YA7NWRvjVg6oI=
X-Gm-Gg: AYBFou0ngmp80GJFlO+Pb6Y7WseM/apzE9LiwJSJ+Ct+cjf3VPatT973Cf5X8CCm8IW
	YNiFzee9SFv46P7Z2IvlXiV/1NDXOQJeXjjhR7DO82YGa52bNbeOH9wZ8zgEYdOeiJSJ9g+9NyM
	EX9xhgborHRbPvzqucZe60hZxgiknhPRaRaM5UZY4bZldNLHxdINsZRmy/GlqIlWxAafoggJZkO
	HAjrT470+yOE2/6rzFF3YwQHBt1dOZTT2ur28YmrI26MDgEEeEiTvkO4F0t0yMVwgjh21mobwWY
	EDjnPeu7OtY5pldGo/wjNYFNUxulsC4cJ/4N79xtHIwcGbI0ksdlpJ7upezr6Py26CNVbLMauXg
	EX/6jvmisEyLUfg==
X-Received: by 2002:a05:620a:4686:b0:939:9d8f:cb50 with SMTP id af79cd13be357-9399d8fcc8dmr1109881385a.44.1788781866488;
        Mon, 07 Sep 2026 04:51:06 -0700 (PDT)
X-Received: by 2002:a05:620a:4686:b0:939:9d8f:cb50 with SMTP id af79cd13be357-9399d8fcc8dmr1109862985a.44.1788781864834;
        Mon, 07 Sep 2026 04:51:04 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859207c28fsm21589973f8f.5.2026.09.07.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:51:03 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 13:50:46 +0200
Subject: [PATCH net v2] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7ZC2EhRX3sOwKGWAJpbWaSUa0
 rvbcAI3P3n/J+/vEIktRbhVOzBtNlq/FlCnCsyi15nQjoVBCdWKTjQYk3PaYEgBidkzBvZBzzo
 RtkbI5jI0hlQHRRCYJvs55A9YKUFfysXG5Pl7HG7ymP5xbxIlXsUk5CDOo5703cdYv976abxzd
 Qnoc84/oHsD79AAAAA=
X-Change-ID: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Russell King <linux@armlinux.org.uk>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: HBQ7ZF0DnvdYu8AjRegXNfYQ_NI5qMCH
X-Authority-Analysis: v=2.4 cv=U+aiy+ru c=1 sm=1 tr=0 ts=6a9ea52b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5UFYL5-E9tWFkZEryMcA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: HBQ7ZF0DnvdYu8AjRegXNfYQ_NI5qMCH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMSBTYWx0ZWRfX7/jyhCUbpkAl
 ydXaNPE6BZ5zQ54Vh3W56IVALQQR1EL0t3CvKL1Pdfgqgfc/2uhWBIWXgOPPH/Wvh4aAWEu/+l3
 ih1fQx2v9qcBnQlV5dyOeHR1X1rjXgc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMSBTYWx0ZWRfX8FRL5+BKt0fe
 mAol8REhuSYYPkVSeIoQm+N8o9+XqIk0dWUouuSj4mkfsoN7Biezfhcy4hR+WReg77w9SaoZrIP
 uVedikKi3P1sPpJccCNT2R0K/RrpbASfrmFX4kLtOx6/HSYnH0/w3EKIqZSYXIm3PqgAPr2JcnF
 sDbdgjgcQ/FNcIPXhf/EWsZl8AmvP6MAsOIzgNNEHDfZZB4/4GODQSSvZBVIz/Tojumk1wDUIKE
 QgOlbB0gyW6AaOV27tph7QOlsAo926DPDa8yBxNJhuTXDZoIH9CTYmcZv3emi1vCjt1pdr5i3p7
 1sOa2DAF/f8uBgKEvILuosr+cAiMhBchfHGthn/vPtKncB5aMgeCLr2ZlQVRYpPUqS5RmTy80I3
 B3pvnLhtPlXSYvJ8yQeWQspoCkg+3hHQqKkwRcaaEnisJ87sLMofRTS24SYN1AHr78QCIaPpW03
 Tw1bkpRLofix9w4ZMow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070131

stmmac_setup_ptp() returns void and swallows both PTP setup errors:
the PTP reference clock enable and stmmac_init_timestamping()
failures are logged but never propagated. When they fail, the MAC
system time counter is left in its post-reset, non-running state,
while the driver keeps operating as if timestamping were up.
This matters for TAPRIO/EST qdisc offloading, which derives the EST
base time from the hardware timestamp counter: arming the gate list
against a non-advancing time base would leave the schedule permanently
stuck.

Make stmmac_setup_ptp() return an error code and propagate the
failure in __stmmac_open() and stmmac_resume(), stopping the DMA
engines when PTP setup fails.

Extend the same error propagation to the timestamping counter
initialisation: stmmac_update_subsecond_increment() and
stmmac_init_tstamp_counter() now return the addend and system time
programming errors instead of discarding them, so a counter that
cannot be configured is reported as a failure rather than silently
left non-running.

While at it, factor the timestamping availability check into a
stmmac_check_timestamp_cap() helper that requires both the hardware
timestamping capability and a valid PTP reference clock rate. This
keeps the interface operational on platforms with PTP-capable
silicon but an unconfigured PTP clock, where timestamping cannot be
enabled: those are treated as PTP-less rather than failing to open
or resume. Apply the same helper to the hwtstamp get/set paths so
they consistently report -EOPNOTSUPP when timestamping is not usable.

Fixes: 92ba6888510c ("stmmac: add the support for PTP hw clock driver")
Fixes: 0ad2be79f254 ("net: stmmac: Balance PTP reference clock enable/disable")
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
Changes in v2:
- Check clk_ptp_rate value in stmmac_check_timestamp_cap().
- Return error code in stmmac_update_subsecond_increment() and
  stmmac_init_tstamp_counter().
- Rely on stmmac_check_timestamp_cap() in stmmac_hwtstamp_set() and
  stmmac_hwtstamp_get().
- Link to v1: https://lore.kernel.org/r/20260904-stmmac-ptp-error-propagate-v1-1-80f01b03dafa@oss.qualcomm.com
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 96 +++++++++++++++--------
 1 file changed, 64 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 07a6fab6460e..99d4fbccc300 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -601,7 +601,7 @@ static void stmmac_get_rx_hwtstamp(struct stmmac_priv *priv, struct dma_desc *p,
 	}
 }
 
-static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
+static int stmmac_update_subsecond_increment(struct stmmac_priv *priv)
 {
 	bool xmac = dwmac_is_xmac(priv->plat->core_type);
 	u32 sec_inc = 0;
@@ -625,7 +625,18 @@ static void stmmac_update_subsecond_increment(struct stmmac_priv *priv)
 	 */
 	temp = (u64)(temp << 32);
 	priv->default_addend = div_u64(temp, priv->plat->clk_ptp_rate);
-	stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+	return stmmac_config_addend(priv, priv->ptpaddr, priv->default_addend);
+}
+
+static bool stmmac_check_timestamp_cap(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.time_stamp && !priv->dma_cap.atime_stamp)
+		return false;
+
+	if (!priv->plat->clk_ptp_rate)
+		return false;
+
+	return true;
 }
 
 /**
@@ -653,7 +664,7 @@ static int stmmac_hwtstamp_set(struct net_device *dev,
 	u32 ts_master_en = 0;
 	u32 ts_event_en = 0;
 
-	if (!(priv->dma_cap.time_stamp || priv->adv_ts)) {
+	if (!stmmac_check_timestamp_cap(priv)) {
 		NL_SET_ERR_MSG_MOD(extack, "No support for HW time stamping");
 		priv->hwts_tx_en = 0;
 		priv->hwts_rx_en = 0;
@@ -843,7 +854,7 @@ static int stmmac_hwtstamp_get(struct net_device *dev,
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp))
+	if (!stmmac_check_timestamp_cap(priv))
 		return -EOPNOTSUPP;
 
 	*config = priv->tstamp_config;
@@ -865,24 +876,21 @@ static int stmmac_init_tstamp_counter(struct stmmac_priv *priv,
 				      u32 systime_flags)
 {
 	struct timespec64 now;
-
-	if (!priv->plat->clk_ptp_rate) {
-		netdev_err(priv->dev, "Invalid PTP clock rate");
-		return -EINVAL;
-	}
+	int ret;
 
 	stmmac_config_hw_tstamping(priv, priv->ptpaddr, systime_flags);
 	priv->systime_flags = systime_flags;
 
-	stmmac_update_subsecond_increment(priv);
+	ret = stmmac_update_subsecond_increment(priv);
+	if (ret)
+		return ret;
 
 	/* initialize system time */
 	ktime_get_real_ts64(&now);
 
 	/* lower 32 bits of tv_sec are safe until y2106 */
-	stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec, now.tv_nsec);
-
-	return 0;
+	return stmmac_init_systime(priv, priv->ptpaddr, (u32)now.tv_sec,
+				   now.tv_nsec);
 }
 
 /**
@@ -900,11 +908,6 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	if (priv->plat->ptp_clk_freq_config)
 		priv->plat->ptp_clk_freq_config(priv);
 
-	if (!(priv->dma_cap.time_stamp || priv->dma_cap.atime_stamp)) {
-		netdev_info(priv->dev, "PTP not supported by HW\n");
-		return -EOPNOTSUPP;
-	}
-
 	ret = stmmac_init_tstamp_counter(priv, STMMAC_HWTS_ACTIVE |
 					       PTP_TCR_TSCFUPDT);
 	if (ret) {
@@ -937,22 +940,39 @@ static int stmmac_init_timestamping(struct stmmac_priv *priv)
 	return 0;
 }
 
-static void stmmac_setup_ptp(struct stmmac_priv *priv)
+static int stmmac_setup_ptp(struct stmmac_priv *priv)
 {
 	int ret;
 
+	if (!stmmac_check_timestamp_cap(priv)) {
+		netdev_info(priv->dev, "PTP not supported\n");
+		return 0;
+	}
+
 	ret = clk_prepare_enable(priv->plat->clk_ptp_ref);
-	if (ret < 0)
+	if (ret < 0) {
 		netdev_warn(priv->dev,
 			    "failed to enable PTP reference clock: %pe\n",
 			    ERR_PTR(ret));
+		return ret;
+	}
 
-	if (stmmac_init_timestamping(priv) == 0)
-		stmmac_ptp_register(priv);
+	ret = stmmac_init_timestamping(priv);
+	if (ret) {
+		clk_disable_unprepare(priv->plat->clk_ptp_ref);
+		return ret;
+	}
+
+	stmmac_ptp_register(priv);
+
+	return 0;
 }
 
 static void stmmac_release_ptp(struct stmmac_priv *priv)
 {
+	if (!stmmac_check_timestamp_cap(priv))
+		return;
+
 	stmmac_ptp_unregister(priv);
 	clk_disable_unprepare(priv->plat->clk_ptp_ref);
 }
@@ -4161,10 +4181,12 @@ static int __stmmac_open(struct net_device *dev,
 	ret = stmmac_hw_setup(dev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		goto init_error;
+		return ret;
 	}
 
-	stmmac_setup_ptp(priv);
+	ret = stmmac_setup_ptp(priv);
+	if (ret)
+		goto ptp_error;
 
 	stmmac_init_coalesce(priv);
 
@@ -4185,13 +4207,13 @@ static int __stmmac_open(struct net_device *dev,
 irq_error:
 	phylink_stop(priv->phylink);
 
-	stmmac_stop_all_dma(priv);
-
 	for (chan = 0; chan < priv->plat->tx_queues_to_use; chan++)
 		hrtimer_cancel(&priv->dma_conf.tx_queue[chan].txtimer);
 
 	stmmac_release_ptp(priv);
-init_error:
+ptp_error:
+	stmmac_stop_all_dma(priv);
+
 	return ret;
 }
 
@@ -8350,13 +8372,14 @@ int stmmac_resume(struct device *dev)
 	ret = stmmac_hw_setup(ndev);
 	if (ret < 0) {
 		netdev_err(priv->dev, "%s: Hw setup failed\n", __func__);
-		stmmac_legacy_serdes_power_down(priv);
-		mutex_unlock(&priv->lock);
-		rtnl_unlock();
-		return ret;
+		goto error_unlock;
 	}
 
-	stmmac_init_timestamping(priv);
+	if (stmmac_check_timestamp_cap(priv)) {
+		ret = stmmac_init_timestamping(priv);
+		if (ret)
+			goto error_stop_dma;
+	}
 
 	stmmac_init_coalesce(priv);
 	phylink_rx_clk_stop_block(priv->phylink);
@@ -8380,6 +8403,15 @@ int stmmac_resume(struct device *dev)
 	netif_device_attach(ndev);
 
 	return 0;
+
+error_stop_dma:
+	stmmac_stop_all_dma(priv);
+error_unlock:
+	stmmac_legacy_serdes_power_down(priv);
+	mutex_unlock(&priv->lock);
+	rtnl_unlock();
+
+	return ret;
 }
 EXPORT_SYMBOL_GPL(stmmac_resume);
 

---
base-commit: 7a036b5f83726ad5ea310fafae6cb7bb4c92072e
change-id: 20260904-stmmac-ptp-error-propagate-6c0147b4ce29

Best regards,
-- 
Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

