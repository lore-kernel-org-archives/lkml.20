Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4344E80C2
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554607; cv=none; b=fi4ZL0EG4n+9WRGSTmYnOJuupPh4ls8CF84jdDrBqDXeaKFKcgUuOYuB0Rsn4XQUHEDIFiYrI0KjeJUdOqde9co627HV5IfA2Ra/wVmQb0x0hGrXqxyXlY5h8YxZ7kMEgcazJwg7DRR5Znz7+f4jfrPT2k+Z9R1NJC4cVRqt7tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554607; c=relaxed/simple;
	bh=qlfNz4pd0+y4mAPYA9gJApqjJZuFHRKp75YT7U9cYs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4fJu6uXhz8ICvDi1vW1QM2am1Wsd0aNHwDyIf9mapB3/M1epBYBDXLjG706hPF/CcmKaAJeMIIgIhymGHnciZShob8+BZU8S69TmnjozD+0lWym5EAm5K0A1asUIUE29ijJwH9xfrny4XbGGTkNWOBy2osEQ+rxPmhlgs6IdP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uij9MzDh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EHLrY4By; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uij9MzDh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EHLrY4By"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934IK2226506
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N4V3xiwbplHoiKjEUNaFCzSGf2IrsjYKLcMWg+xw8Gw=; b=Uij9MzDhSjaKWX2O
	JaDSSvhbc3Sxm2MP7IZXOQf2q7qJN8NTiOdb3J63P766fsWqecCMYHbmjy99X6VT
	cQOZY3D+JsEGGwBHv7c79s5DtpUoOIcYLnrKYRQc8dc75Y/Eo4KjEINEJv69RylU
	ztpGmI3WOxMa04kMBqEZh8A7OfraoCV651/fc+AVHsN5buWBVCgjn3KklXeBYYFS
	K/Rl6dl3Lnr3IZ5w0MgKNHljQG1Rok8h6JOEzPGW/1ju+NZEdlX0NInX1+WalYFs
	akvE8SvBmEYFlXswOQgFi8QoeBH66VgkHFwZbCaRSMt6K0YzI0TlpjLvkkLLgmQL
	j5N+IQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a1b824e84so685983185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554582; x=1790159382; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N4V3xiwbplHoiKjEUNaFCzSGf2IrsjYKLcMWg+xw8Gw=;
        b=EHLrY4ByPs1gmtjdArLGz6O+YfLnnqAdZDwJwX9BEF7kcSxDfKtCsr6YRtxO1u1CtQ
         ZmU1SoarsT+jMFEUxIlHqd+TKLO5Ya/nSf7CSnLRRemKgftz8l4h+NUJLZ9g0Lu4Y2XZ
         ZzeePhCIceRzTp/EHq4MTiJNJTAk6ell5K/idCit12ugyWllcutQgmUmUR/DlPix8egP
         Cz/ZlMHAU6tTjBWkTSQbg9Ov4/vRdRg5bgjR5P9VZJwguWB74DZDKWwUF9OWglj79JXJ
         eXQ2QeLlMSLrt5Ne0vdrSXhNvi4lRjvtVnDW9n+bIX30eCTF4okjJvPsUtTlr7dJkyui
         4urg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554582; x=1790159382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N4V3xiwbplHoiKjEUNaFCzSGf2IrsjYKLcMWg+xw8Gw=;
        b=J+rQ8gNxD+7OYP/h2kKpIioA6LnrA3HXr9EHpInugy0IhkSpQFtnMCjD9vAtGCSNIl
         i57VEuQOA9mnhSH3CrUc3sdYnE//8MR0f+nbR7dDcEkhQljh01wi/hI+olp22wQk4bHd
         IF3NtQcyakr7GNwcOOO/Rz+C3L7y2bRX82469KeP+VLhHTwUz2K4KHahz+dIuZteodHR
         beA4idFb1nWL2fohBtT5stbKwk9xjaFUmBjDe1tEdt3v+YZIBDHARRqbHNFzrbj+mpGg
         O18O8vonylpKsmfx3qIlt/kNCtzqTCyO8ZFNVte/r2D6jyOaUfgbPVHh+TzyQKjKKufu
         tJXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwOhFHwed/8PMa8BCdyPjpN0c23dMswz8N5dDFyjEBvyrZ6jHfTbvcLJofIVpbzIgL6kmPxXbgjyMQoox8=@vger.kernel.org
X-Gm-Message-State: AFuF++mdKfSaVGV1IHRH1EiQYbxCYQfeC8iFXFW0r085Bu0yIlltU9fk
	oWrpbivQOpcxEUwkwBmHSGFWUBG5hnFUxuUrQ02Bn7HcG2vC20UHwoUlTGiP+0c/ncN6JsJd6hb
	rVrDW2kUcEab/cd539nWMEqKnwelrqKLzk1RUlbxdvZvNng4X7XSPEy7t2BiqzxDl9YU=
X-Gm-Gg: AYBFou3kx9QF8xnAO4MXeMFv/V2TV17VCIxB53alUJU65z+P/TKuAywCefeprESNNEY
	Sud22XJbGp8cHlppghoVW5yIjikMoF16mu7ngRe+Gh/Ov9HiFWop2Ornfaf9iswpGhanXazqsED
	1ihqIT4JMKeknfDaFuLonAe+NAb7HioHamOP9oeXgUzRWiq+rfaW/blnubmHuD2eqNxoIUQ10tm
	MZ7n6f+aZo3dO5otXqZH7gl1AjvWu0SSN4Q5XUvEXQAuNKYyBC7e7O8XDxKEwySCKStwCB5d1Fq
	PrCs23tO9qWUuxURePEvnU8DBDm43dDg6coqEKxuz1p1uEw8MOP8PULsT9ZiH6KV0pZIkIzDu79
	jUDpk+Ps=
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr292102285a.5.1789554581626;
        Wed, 16 Sep 2026 03:29:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4512:b0:939:13a7:70f0 with SMTP id af79cd13be357-93bb770c2a0mr292099385a.5.1789554581099;
        Wed, 16 Sep 2026 03:29:41 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:40 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:29 +0300
Subject: [PATCH 13/48] clk: qcom: dispcc-x1e80100: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-13-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1802;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=qlfNz4pd0+y4mAPYA9gJApqjJZuFHRKp75YT7U9cYs4=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9XgIYWAAyWWO5S8pQ1375Ok4Z72pPaeI9SY
 GWnts4zZ2GJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvVwAKCRAbX0TJAJUV
 Vu20D/dJM25yhrbqyIQy8j6kaZPz8ScFaF+uOuX+6PO9yeN9q8jq1+lXoicjd8pse5BJrF7YfM2
 PkCT5/eAbPXKqaSIxsYbyJ2a/BBssRzOT0cJC08F2kK4rrAw8veS20fT8T3FCaDhaT0siejTFvW
 R4guZ5o5qgKj1I6qSMUR6+tjUdOMJipRzTBYFMdPigFcyksJ00orVViYNHf3vJabGFsEvnWt6/q
 0mWQksqh+XLLUyCuvnc01z1CYkjCN3I90kwkEsF0c3mQ/4g2Gh3+xGy1PlfSa98w21zxobbLqIH
 bZXRfemB7dPkqQUTaTlE4fyrUSr152iLBqM6/C0nJvXFrwTC2jO43bW6LRaZIk5c2q+GulsaSxf
 rMZtL8VftcDIvo18kWsRfg8BPl30ZnBB+jyHhtUM4Dy+10t9GY4p1HPO2ZABUrzthVi9cCeRjC2
 l9KM7lL7Jx7HCpyzX9FvRRPccUUlj2qZL8/xjB1JBlt4LfW4DoCDTKKvLIKDhAxBZZu4JZLALxw
 v/jswUwSxLtx6jUjd2+VuKKpzOh3L9svSCVJkhyFh3WMP2rXajA85PqFRDzsElFaxHhnPX6MSRI
 dAxSbhb9vHBWY0scvP1arhV36Q27Au7JT6zd0RzA8Np5HAceixQQ0vgDeSb2G7ZxOjN1mXs/t2g
 HSyPrwoHSiFES
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6f96 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=55LTGlQWyvwDnq5kMygA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: JjzEe2vY-vF72Pec3gtfSJnccqNwEESG
X-Proofpoint-GUID: JjzEe2vY-vF72Pec3gtfSJnccqNwEESG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3oeDmhK4H1GH
 iQeJ+sm2rjbCrHl27PQ14MFHPPEQcBGfP8AfMDdhVR3V/EWcTfdGBENPTtGBIFiqvldyo2HKzXx
 Tumm1bOBf62o+6KtqlOz90mnhsg+6MJh6yRCtbmRbss/MsS7qNEEgy9/aVD21Axplkcmx0wW4tR
 zBTnQMoOr0sTROypM2UuY+F7uu5uJsgtrSYRZ49Q2GAoLJMdLvr/+fibPaN9LY6USLqRgRzbEhH
 P7Rpx01hNAkQ4vyf/LHWGrJp1QiZPfqjBXljBX3wwvWRi4EGI6FUW5lqVLWVY8h4J+Ks1J4cmFk
 P5f9IrMqM/3Uj7KoTADAtVRe61ubpJtX/fDVrtUCm9clYXZ69lYuRWS0pDVHOXHT/Bfu6lUexVO
 XwPn2ZRKQaKNnsbumHRrnINUE8C04GI1cZvUJvF3R82Ozl0HaNWBTbaRTiTDRR8+4kNiSq2wL2w
 8Az47WBRGz26xhSHHOA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxpAla89tQu3M
 W+2LWuGmAkCwB7xTdCNEN7t1+UUSoN/PkzOUrI5OSOEBlRAUnRgbziJ93N7UYXJyPpXhXk5AZk8
 LfI1ud2azwcjZFtDzgoCGffBmM7i7E0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-x1e80100.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-x1e80100.c b/drivers/clk/qcom/dispcc-x1e80100.c
index 795279609c0b..7366c6513035 100644
--- a/drivers/clk/qcom/dispcc-x1e80100.c
+++ b/drivers/clk/qcom/dispcc-x1e80100.c
@@ -1637,7 +1637,18 @@ static const struct regmap_config disp_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_x1e80100_critical_cbcrs[] = {
+	0xe074, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_x1e80100_driver_data = {
+	.clk_cbcrs = disp_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_x1e80100_desc = {
+	.driver_data = &disp_cc_x1e80100_driver_data,
 	.config = &disp_cc_x1e80100_regmap_config,
 	.clks = disp_cc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_x1e80100_clocks),
@@ -1678,10 +1689,6 @@ static int disp_cc_x1e80100_probe(struct platform_device *pdev)
 	/* Enable clock gating for MDP clocks */
 	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);
 
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe074); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_x1e80100_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

