Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA00524AE5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069169; cv=none; b=Hxzllf6E3AP6nC96yH/CVq6dVhJWSrAXl6R0YnjB6GoZj3OxVrUhlelacyIjMKQ/ilbV2EMzvjOSS6bcQezee9Kba19O9GC58iLy0JnK4nFijlFnE091RGqjR8mOJS0f1DdUZLvAv5xlCHccBHak84OkN80Hn6TpU7Raq1OCQkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069169; c=relaxed/simple;
	bh=H6ntn66f4ef9aZvMPuSRQhRjCjfBwkRDzsp/XruTxpI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F3u3ZHo0iH0l4NMo8306pH6Q7PRLvHkkQgEmBidw3H9vv2eica9EcHNMfMMdsN3q1TFhbSu1xAYbeRNYQIAllMXkCfOkc3QaL3jPKJTcPrb0Y4wA0qkvMv2uBF8hFVv277+DpumL6Zd4haUci+QjgYHwtoBGl2xpkkg21jEFSLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gRFs+kSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eHy5HjW7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gRFs+kSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eHy5HjW7"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jMHl4077500
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=; b=gRFs+kSwo4bhElst
	CbIafUGx7J/x8C1Lyyxcz6NHyXlcYrvy13gc6IXt0rTRmvxOgz01Ko+SYHtbADJu
	ZiirVWp+5sRRF5QtdA3LRjEXmLLT23Ou5VXV9KGUq4549FuYGgLoiJKc2Sqe1Zyx
	IyIu9fRToDuZvN+LTHs9Ga+BrnREu7qLjnuYw9v8IzMLS1TVo55suSFxgbl2Lg/b
	M71vXb2p547b0qf9b7dykGjOQXf7Ij673MGu2Wz1lu7wZFwAC+Ub+8L5OxgSBvcc
	csn99ynv8TCyT+sEtaonpDCf/D18ZZUvJumDUobMpldIMNz575vaymCYm5uf2we3
	L4xSlw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4havbc0ssp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 12:59:27 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so18732175ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 05:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792069166; x=1792673966; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=;
        b=eHy5HjW7b61Tux+EqdZFVpk3Iy25RFo/G91wzmE+iuvtulvqWrxzP2o/75uJpoCrKx
         Cn6uFa9E1bahBH9sBm5vQ4RyzsGm7AZ86B7FsOHA+T21cciQ0aNxEfhSkw5acqZPyrBE
         ULlOS2AKp2ez/Nlspg1d0j0uXhHh+L20cnIlkBzw/BMCINK4j6P2fewvcFrPsSWuciGF
         Dq+OIm0PoJBfbTZ7Dlel+zgtTxsgWHW9crNzezNer5zM+fJt5ppek/KOKi4fM7+aAgn5
         NExp56jEdvf6GAlMPyiEExc6nR/MC9j8ppXJkAViaqvqKQyPnpNN0NyR67SDLTwdnG+F
         JIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792069166; x=1792673966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfARhd2Cd5D0LKCfKmBfrYamQ5SQ7NPlyQwh4TIucTA=;
        b=zwEAk/144+vxejAO7bNIysyLyA7/miAgbycSobjt0A/e93WfgkdOLKMSo7gk4Gkuuy
         MYtVQhqle/ZCQ3F0uhyjO1bKKLsa73aZt7R9ek7H/yveuWg1SVqHD0/vQvlxP6WR6XKh
         Ybkj4Fw4jH/ltnqR9s+rm7BUwu8ML3VcaNljbpJf+JMxTU3wsxF381gsq8DisUDhPb+Y
         +PlcwFQGnCMmvNZqBH6Qsbz9l1ZCmSiDQCYNI2f3F5je63+d/UCw/R4hJmZZ6Rl1wjqT
         TKoyNFGPis5nWTJ6wxjRpuntCZ84yYQBgjLWPjS/BVGruCl9y08scW2afBf25WxUlT2t
         OTIQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7mODcbPB5Gp+R3j6UatgwMzRFGbXxZ4GEh/pdhUIoKbVdfLqoysxuJhPVTDTZrJ1hGXvt96+Tw+7XfAQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6SQTApjc/BtFfJdPGAP2r+FFCl9aNa3HT8NIS3V7ZRcYaXATk
	BTr68GINa9866d9D6qRRKZyk1vsUTQTEDb/WvkUeqVw+MSsa73i6zwpjKEjQ66USqB/DHDhPJkg
	9zTHdHVSjUCs/b4HCcQg/mbqrST0sP8VS5dhtqGayjuRK0CNEFo/VBb9Y8kQEkdQci78=
X-Gm-Gg: AYBFou1CdpmwbNaqjXE7XpbO+ddWNpOuLef/tZcv5KD8v5DXhIv7lVM2ELOq5GHuxo0
	PnFVhM7NCfKPof0I5ixBIsmA6fKhEcFsnK4mKQRQNAWCFMLflGd4HTuoLYw6+d4DqAzN7mfEDAm
	Gu57AbdgzBZeiDx4KZFJ7TK3nVmEpaJT1G5ECTaL0DF4Idjw841syv3/CvdiA9Ax0GaY2/1a70c
	G+yDv/18BJU6QTpJJJBGAEfadB9ea1MFTzBUMFAPu6xtYI0m4ihhB0XoOhdSeZt/JA8A7DCiFc0
	CpvcGW3Dhu+a+cPEQSElLFMMBmklRi52RVL/D7+dPRBojsDFHBNEpE9LxQFv20pvKY0PRzP4zFh
	oRIg86OmGGMQKrj2WA6wkQ77GoYSOteENoA==
X-Received: by 2002:a17:902:e744:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e842cef77amr177414575ad.60.1792069166465;
        Thu, 15 Oct 2026 05:59:26 -0700 (PDT)
X-Received: by 2002:a17:902:e744:b0:2dd:c100:943e with SMTP id d9443c01a7336-2e842cef77amr177414375ad.60.1792069165928;
        Thu, 15 Oct 2026 05:59:25 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422b8d8dsm79691705ad.52.2026.10.15.05.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 05:59:25 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:27 +0530
Subject: [PATCH v3 7/8] i2c: qcom-geni: Use common GENI resource
 initialization helper
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-7-5da1096243c9@oss.qualcomm.com>
References: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
In-Reply-To: <20261015-derive_clk_perf_tbl_from_perf_domain_opp_table-v3-0-5da1096243c9@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Mark Brown <broonie@kernel.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-i2c@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792069108; l=3039;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=H6ntn66f4ef9aZvMPuSRQhRjCjfBwkRDzsp/XruTxpI=;
 b=iuzorpln8GRBCUKljGM4qKH0m54f2xCjz0e03AcfAxykORWve8VVaZm4I8yUUdhoZntZmIDlQ
 7Y9wUHGY9ywCQPbLwO2IW6dBz/krETNX9ZXurLuuHE68LZmU+//AvC1
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Authority-Analysis: v=2.4 cv=QbvzLcbv c=1 sm=1 tr=0 ts=6ad0ce2f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FF1tyFs_GJ8PAB6o4BcA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX0dFIWqQVFr0T
 W5e/UCXkbV6xw9ISY3WB8mKGxu8jlSFIuZve5d2rFX09i+t+mmHuYXJsxFqfjHccI+aGMcEVQw3
 86iJSWZmSf38uOaTGQ2jaDGJJIARt8c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MSBTYWx0ZWRfX+RVhvQoWtdOx
 I2OxLm06iAleZ9P4ljeEj8GHcriGpaoXKn1wJIMhHpA/+Q346RhxXm5iGnOdkCS1hYUaWtLmGiR
 adgKzdYmMZkdom5ymB1+BkkpeEBTlne3GUbqJN7bIjjd3hVNKSu+eIqGGfdLBf3m4Ms/KgDQwBS
 qqp9dUoolR1PGTkUZkO8lK8ezvnxkellzaMmBIsAM+cO3sNn8GKBLDd3Z/j/yllxFyqX1WaAlFg
 hxlI5+hWPrFnr0gR9Krf0kFgLf9M4722DSGOyXuWhS+vFvAP16rG2Gc/7BhV6Ta0bCMTQNImGwf
 GyrUQ9S23AKSxlpIMmpysF0Ei3N2SWQOIJ3lEk3ejWoIkxueW4wbthqb0Qp/+13ZyMmuwXyTpEN
 Ui1MvHK3qbhuOhVPJZcHkQFOwqaGURKyGrXiteOoD9bTP25e3cd4HgvD1XNIT8zZN10vSCbR1Vn
 Xy/z+6KJ0dSesSk1KYg==
X-Proofpoint-ORIG-GUID: RH7r_nAC-wq9wqnN6uSpO2me7Tg7y7lY
X-Proofpoint-GUID: RH7r_nAC-wq9wqnN6uSpO2me7Tg7y7lY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150051

The driver implements a custom resources_init() callback for clock
frequency validation and bandwidth vote programming. Neither operation is
required for resource initialization itself.

Move clock frequency validation to probe and program the ICC bandwidth vote
from qcom_geni_i2c_conf(), where the bus frequency is configured. This
allows the driver to use geni_se_resources_init() directly and removes the
I2C-specific resource initialization wrapper.

Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a6fe89d0934f..dbe344719b86 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -275,7 +275,9 @@ static int qcom_geni_i2c_conf(struct geni_se *se, unsigned long freq)
 	trace_geni_i2c_bus_setup(gi2c->se.dev, gi2c->clk_freq_out,
 				 itr->clk_div, itr->t_high_cnt,
 				 itr->t_low_cnt, itr->t_cycle_cnt);
-	return 0;
+
+	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
+				  Bps_to_icc(gi2c->clk_freq_out));
 }
 
 static void geni_i2c_err_misc(struct geni_i2c_dev *gi2c)
@@ -1167,22 +1169,6 @@ static int geni_i2c_init(struct geni_i2c_dev *gi2c)
 	return ret;
 }
 
-static int geni_i2c_resources_init(struct geni_se *se)
-{
-	struct geni_i2c_dev *gi2c = dev_get_drvdata(se->dev);
-	int ret;
-
-	ret = geni_se_resources_init(&gi2c->se);
-	if (ret)
-		return ret;
-
-	ret = geni_i2c_clk_map_idx(gi2c);
-	if (ret)
-		return ret;
-
-	return geni_icc_set_bw_ab(&gi2c->se, GENI_DEFAULT_BW, GENI_DEFAULT_BW,
-				  Bps_to_icc(gi2c->clk_freq_out));
-}
 
 static int geni_i2c_probe(struct platform_device *pdev)
 {
@@ -1251,6 +1237,11 @@ static int geni_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	ret = geni_i2c_clk_map_idx(gi2c);
+	if (ret)
+		return dev_err_probe(gi2c->se.dev, ret, "Invalid clk frequency %d Hz\n",
+				     gi2c->clk_freq_out);
+
 	ret = i2c_add_adapter(&gi2c->adap);
 	if (ret) {
 		release_gpi_dma(gi2c);
@@ -1353,7 +1344,7 @@ static const struct dev_pm_ops geni_i2c_pm_ops = {
 };
 
 static const struct geni_i2c_desc geni_i2c = {
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,
@@ -1362,7 +1353,7 @@ static const struct geni_i2c_desc geni_i2c = {
 static const struct geni_i2c_desc i2c_master_hub = {
 	.no_dma_support = true,
 	.tx_fifo_depth = 16,
-	.resources_init = geni_i2c_resources_init,
+	.resources_init = geni_se_resources_init,
 	.set_rate = qcom_geni_i2c_conf,
 	.power_on = geni_se_resources_activate,
 	.power_off = geni_se_resources_deactivate,

-- 
2.34.1

