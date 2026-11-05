Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922703;
	b=LxdwSxnMwbkYnrq7on2fMIgJvAtiT+BUZjoFsW7eGXlcIpfvsN04/Le2FUOXfxAikbfb
	 NVOyMzEnzhW4vWblQ9sBdyA4G5XDd4YJ1mYpYZG5keEN1Muf2z1WVd8njelmWUXUm2Tts
	 Sl3B2dWqvRSxKGbwNPzoKdVuL9TsiMSkl4EMzs8g4w1BvpgsuLukISDBsXg+MwovCbU1V
	 DfFsWMvUDrnocQh81OUrEx0YUN4duzP4uYbrPK/3K0rPAaW4SAnpFor5J+XbqNXEFJZZa
	 AZiaM7YlyARQeOiyj0oWZzfDaUzomu3KyjKT46OE72OJo/LRfjDAz6sxNGIeCa1c3lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
	b=5OV9Xn0wwqZ+RudFPeCLSjDHpkPyVTTm/r51AKKuyXhd49V8LynBBCHWzi7l4msBlcbK
	 mDtBOXf9+evqp4R1yE0FjjO79+EFRXYmvyzAALLTWhxvdDy6Sp+otFlsb0XKvXyddh9tv
	 kIuv55RpEou6Pz7HFIauA4nr1Y/SxpfNt1eWkJrMUlqFZQcSm7OtQyYPkA9a24MMXidx4
	 7pvzDaI7aPf33eiyovZYicInovL+EGPRtXGnS8dHiOPVxi3/pYVRA6wBoVOBcy1oP6Kuy
	 /2plwmJuMqoInSkZ66NY97myVnkRjLmESEqa1xY/gcVm93/MqOJzZehfTJZtkOoyCJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C08606D811
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C08606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UkMr84MR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jViDaO+s
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Nf7HH3217099
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 23:51:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZPLdkk8872+
	3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=; b=UkMr84MRhG2lwl6GRudk0/V1aKS
	k6KLoW94KwpoB0/8NXIq8PN2pxR0aylngS8LJuzs+1ioj8sPRmPgOiuJuZq61DMf
	Nb78RcqMZoNje9ftXFatgSbVwuvSUsZwZ4Bz1zDzk8Lvy4atOm/D70c0D7pr6SH+
	/uUE4vmoAGYVIaBcznb9huBgRNsta7bZJtxMd3YSpxWgyFTfc+lVbsLtVHreYEm/
	2hBdudXpsOqHnLFHEhy5V0Cq0rsba5oIrS2KBwzOh8LX3NClFBfk2brdXvhB1/dx
	RkTlGEJ+C3EcNoR5cNO0dqSXB7DWUxTiGbJ2LgZ7RaRrbX2kTBUzsKMEG5w==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9r13q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:51:42 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139b62317d0so478409c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 15:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922702; x=1794527502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=jViDaO+s+ivKsMA2QnAHSoZfkgIrZrQTPI2rYIxck7cIOlBNOyEIYeX4Dn9xxB6xpt
         0UWqtFrewptgL5IGTyroBcLjdygbiQeH7GbzmalXo2GtVVZ/NEHa00gWZJzgGqjY3LAI
         w+wMwpcEfTN9bfecGu8hwI+8Rak5qLqQ+YX6nu0F/cTCKRyjVjPlzvrbe1bUaoqTQxBF
         hG1jxQ/gC6m420RNCYWvBg3c5RzDeMTQuI3Cr9g7CgTm3DaK8EjH3yiUyPCXGFwgnrC8
         eSmLzLi2Ik2SNCGZ1e4sr+R9l+0t7o6+1IBb9IO81YuCdez+zOmrvFFbzbhkiYM/ADJN
         ggDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922702; x=1794527502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZPLdkk8872+3hTdrWeH9X039pnhcr7CAG7eCMOqHgoo=;
        b=J81//uRlaM5JENBQEj/p/b5d7i+S6KFxXM5ubApK56UfKt8T+p/KuTcsghwDc6SXZC
         q/55QUkXmxmhrwySpgGM125Rqv4EcvrPtqe11J6S4l+3IgTtMEZA5OSgiH1QwZryPOkm
         EbAEjw2IqyLZhJWnYY/V0FuF3akh/vuJ9vh2WVQmXi7edkZ3tYQqgw7zr69UpZjdHlND
         7j/T5df+0uUusY4RPeXkkdUItYvoiL9NylG+PQ78uJ56A0naCB6WsbTFB/AKVOQpIOZe
         ci3eYFWpk7a4a0qAL4VsowVtnnhZ0o+g6at1U31zXmAkAsQS+ZEfI837jw04mPYyYAO7
         QqtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAuqR/gVvaVwSNjHTbb8MPWwCd8bhiYzhEog6q0bn7tyHwSXbQbb8Kjp+JH6e4hw8gtcqANrw+XVNnx4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ipw3lbCQyYu9uYLh7JR4cRjE6+1SIkrr4IsXRSQvUF60T4p+E
	IbB/EOe5ap/TcAQ4J7RuUfk4x0823p4zwknikpOQoRFbX4pyhibDod+U37DGc2u1XrYbmmiLqV7
	VsxB2CjL+LRlwIYyai3iWklbzDGZtfof0nUpxYY9/0Qh34gJRok+yl4khL24igdK+FghEVjxXJd
	c=
X-Gm-Gg: AYBFou35dewiJGzsE7u0pnjGUOAXynf1tESowd+FNTv1C/KuEYtwhxrq8RxOb+na4Va
	pqfrR6xHBdiRG3RAH4JvkhfH2wWbZOWVMDpZldkd9Foko9kxBOVFjxDXS9g/s5YuR2bI/Qgh1Sz
	G1twSzm7oQv3EFc3vfklLr8d6057/HsbQsfQ9l7joKeiI2iSzj0w/OR9GaWPAkKRxGpxrw8DsLN
	Tsx1CEZzEIJiRRTBZE1BTcwUNWX5G9468rE50YkOjYcVgjY+PpUEMLqqJ6m7BfUfiXgjxqINhlz
	e66aK39mgNHrPMo2z4TdieYXzPbPoSaqLN1OnkIOrD2hiFgRHkVM01DnFfulLAGPqEQMn7RkK6o
	XMYz7Rft6TYTm8rpu12arwVV0pI6/E08h7BJec50xycinq91lyPCwUVWJhURKUD2DTkPJutp8/X
	rNnPbWV77j9tKpfLk5QRado2F0yKg=
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666760c88.40.1793922701690;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
X-Received: by 2002:a05:701b:280c:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b25d368d72mr666717c88.40.1793922701154;
        Thu, 05 Nov 2026 15:51:41 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:40 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/4] phy: qcom-mipi-csi2: Make OPP table optional
Date: Thu,  5 Nov 2026 15:51:35 -0800
Message-Id: <20261105235137.2635442-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
References: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX5xOeMILKlBFZ
 SN0YB32lzBVLHR2hLUySzYy9UZ5W9Hqgb6fKNEFxpsP7ZzsH85VIi5veJrrqWGZ1TlFbQp9ynqw
 0q7tFLokeHkzXRpznBw/zkWav/ejJcg=
X-Proofpoint-GUID: drEfCLS4OGXy1eA7Z6NigzDV2eklmzVT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX1ELexHI6irXK
 2xcJGbKdaxpqB4jxOBeOgqPLP+GNKCjs+Vx68apCp7C7zGiowSrmOAUR0Y41zE4Scu39GnSd09G
 4p+aGBPpElNUZ3eO1PeR5tB2oUYmKoZFX3eCH9437rXKDDj3ALCjrVFUfCe+A/fK9bwNuZrcnzz
 zWwjJO6f0jUowbBcRq2xbJ6VSm8ZKsQeurqW0PDVvxGUghltOIJxGrvChvHj+0mhjJqOaT3Uy12
 kLN0dlg64QDFznHpVMOaBvEu9T1d9cPvH0rilen6qRGMQyao0PNT2P1zfUHE6CcT/L6k8rFgl7v
 TLlVsG/gBQDuU70ATkEXENnL6LqKeGpJk6MeX0YFsUBdHmyljYU1/VmEzoUXmBqoBlQnS19yTvK
 kU6eFt/DaRCWjIdt9wcMBSwzpGR8tOvTZK7slr4YsRVDuPzHQfPwtQEJHSFfB6G5568cyP4/HoE
 H6G3ccgWYAgpGFKeyrA==
X-Proofpoint-ORIG-GUID: drEfCLS4OGXy1eA7Z6NigzDV2eklmzVT
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed168e cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=xhLwaI6HiHkcQTGlYsAA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

Not every SoC the generic MIPI CSI2 PHY driver supports needs an OPP
table: a CSIPHY with only a single, unscaled power-domain has no
performance state to vote on, so running its "core" clock through
the OPP framework buys nothing over a plain clk_set_rate(). Add a
no_opp flag to struct mipi_csi2phy_soc_cfg and skip
devm_pm_opp_set_clkname()/devm_pm_opp_of_add_table() in probe() and
the OPP/performance-state handling in
phy_qcom_mipi_csi2_set_clock_rates() when it's set, falling back to
clk_round_rate()/clk_set_rate() on the timer clock only.

x1e80100 doesn't set no_opp, so this is a no-op for it. The "core"/
"timer" clock-name strings themselves stay hardcoded literals: every
SoC this driver supports uses the same two names, so there's nothing
to make configurable there.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 72 ++++++++++---------
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |  3 +
 2 files changed, 42 insertions(+), 33 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index 269232499fca..8bebc943a771 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -32,40 +32,43 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	unsigned long opp_rate = link_freq / 4;
 	struct dev_pm_opp *opp;
 	long timer_rate;
-	int i, pstate;
+	int i = 0, pstate;
 	int ret;
 
-	opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
-	if (IS_ERR(opp)) {
-		dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
-			link_freq);
-		return PTR_ERR(opp);
-	}
+	if (!csi2phy->soc_cfg->no_opp) {
+		opp = dev_pm_opp_find_freq_ceil(dev, &opp_rate);
+		if (IS_ERR(opp)) {
+			dev_err(csi2phy->dev, "Couldn't find ceiling for %lld Hz\n",
+				link_freq);
+			return PTR_ERR(opp);
+		}
 
-	pstate = 0;
-	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
-		unsigned int perf;
+		pstate = 0;
+		for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
+			unsigned int perf;
 
-		if (!csi2phy->soc_cfg->genpds[i].scaled)
-			continue;
+			if (!csi2phy->soc_cfg->genpds[i].scaled)
+				continue;
 
-		perf = dev_pm_opp_get_required_pstate(opp, pstate);
-		pstate += 1;
+			perf = dev_pm_opp_get_required_pstate(opp, pstate);
+			pstate += 1;
 
-		ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i], perf);
-		if (ret) {
-			dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
-				perf);
-			dev_pm_opp_put(opp);
-			goto unset_pstate;
+			ret = dev_pm_genpd_set_performance_state(csi2phy->pd_list->pd_devs[i],
+								 perf);
+			if (ret) {
+				dev_err(csi2phy->dev, "Couldn't set perf state %u\n",
+					perf);
+				dev_pm_opp_put(opp);
+				goto unset_pstate;
+			}
 		}
-	}
-	dev_pm_opp_put(opp);
+		dev_pm_opp_put(opp);
 
-	ret = dev_pm_opp_set_rate(dev, opp_rate);
-	if (ret) {
-		dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
-		goto unset_opp_rate;
+		ret = dev_pm_opp_set_rate(dev, opp_rate);
+		if (ret) {
+			dev_err(csi2phy->dev, "dev_pm_opp_set_rate() fail\n");
+			goto unset_opp_rate;
+		}
 	}
 
 	timer_rate = clk_round_rate(csi2phy->timer_clk, link_freq / 4);
@@ -83,7 +86,8 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	return 0;
 
 unset_opp_rate:
-	dev_pm_opp_set_rate(dev, 0);
+	if (!csi2phy->soc_cfg->no_opp)
+		dev_pm_opp_set_rate(dev, 0);
 
 unset_pstate:
 	while (i--) {
@@ -405,13 +409,15 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 	if (!csi2phy->timer_clk)
 		return dev_err_probe(dev, -ENODEV, "no timer clock\n");
 
-	ret = devm_pm_opp_set_clkname(dev, "core");
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
+	if (!csi2phy->soc_cfg->no_opp) {
+		ret = devm_pm_opp_set_clkname(dev, "core");
+		if (ret)
+			return dev_err_probe(dev, ret, "Failed to set opp clkname\n");
 
-	ret = devm_pm_opp_of_add_table(dev);
-	if (ret)
-		return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+		ret = devm_pm_opp_of_add_table(dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "invalid OPP table in device tree\n");
+	}
 
 	num_supplies = csi2phy->soc_cfg->num_supplies;
 	csi2phy->supplies = devm_kzalloc(dev, sizeof(*csi2phy->supplies) * num_supplies,
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index 7e55ae007370..6cf9e5b956f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -68,6 +68,9 @@ struct mipi_csi2phy_soc_cfg {
 	const char ** const clk_names;
 	const unsigned int num_clk;
 
+	/* Skip OPP-based clock/pstate scaling. */
+	const bool no_opp;
+
 	const struct mipi_csi2_genpd *genpds;
 	const unsigned int num_genpds;
 };
-- 
2.34.1

