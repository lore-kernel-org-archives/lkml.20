Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7752A442388
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789820; cv=none; b=s+QC15mJHCRv/mobzM32e0wuVse5mQ3szp5FhSvBcdSZGKgk09qWZghl50i+75iUcpopPrhaiVML2r5GR/TveOv4e+Lqy/4TIzO3WXdnEF3vyfOl87iaoc3n/+ArrXTzQuhk7DEkpgXWsUDwT19nTguz6IpjK2I6r4IPD4oPFqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789820; c=relaxed/simple;
	bh=8osHfmVM/x10707NVXOB5jMsFNtRSzg5BZHUvq1PGuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ValW3aYrbUOcB27PG6/X0kHHBLnPGiz8Ts4dNjwwm6QP7KRoVLUZ3J+R9e0zqEH9AHFBIYp55Ewz+Rtd84yr3gehaxKrFmMuhDk87L4MGiOWhjIXsT5titRKigw+PlVEo0ZXIETwz43cFrRm7oP/Xmwbgghf0T7EpSHzTOTA4W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKMEqIZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aK+5QciF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKMEqIZm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aK+5QciF"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hOO474947
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=; b=YKMEqIZmV5dvh6tj
	ork9SaU+Dz7HG2wRT6Ad4sqXHWseWdY9/mRoUmCGwVWfPNucioSV2ZfTqGFnKVS4
	Wv7RBkr6eRxNxmW1AmPix6dsG3Pa5VCVTXtCHB8n96jZaqxd+AJ0+mhW/SLGDP+W
	ii40mwc1FpOXBUqtApJDw+9E7A3vUPBcK8asy6Zie1wKHH95XDEc3JGiyIdLdxSa
	INV5fwFfxtbZ3M0Wx8CWf86YguiVcMDhmrIeCJxWnpaTY2/zAtvE2pEsHoB1HVpO
	JMlIgPVO4NSxnJVXqMUQK44etEoaBCGdkDQ9z08LDmvee8E4pnkl/et50CryUzzI
	YT5/mg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9w5qn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:23:37 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so5044106eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789817; x=1792394617; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=;
        b=aK+5QciFBSX9846G0iU4l0+385WBd9caftbKc2Q6HEr6xAZPmcuyiWwC7eeFpkKXVi
         PrXZ41s0TGBSl5O7FTx4TbLtE8JQi/n9S/EJCbMsE+FhxiTvYuJFfircugp8v2J84ltd
         3/4jzbziQ1dBICvHnXAi8bLjAkwsQRwaeJfHYdWJLrPMdnd93+Sya10rHPD59vcHdCa7
         yP16qT+J3gf+6MCRNiyrfgVgI2QYPan0bu+74PzJynZa0reNEiZK8zE/X6CfnzR1OtqE
         2xtj83oy2OY6V3dJ5t3vmpO21ZbFFuTICy8IxOObsiv5b88X/LtGpB61kuBo7RG3B5Oo
         ikgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789817; x=1792394617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I0SdnE1JeLoOPl1Df+hp1q/Qe/3xcQQMjLrpIfPXNZM=;
        b=L4x0HppdAnCxpEYxoQbaXRsH+VDcauXTPEfbyRU7ocOLK58y7js+DPN5vb1+aQZawS
         2yWq16TUbRleLuJNcY2ZDnZrXiLpOj9JVZo+ppRvvNadCE5VkeNuF4RA6jNv7HWk9g2k
         XocGbwYt7xjxNFEB/5EtZTSJuV3vqxZpwSMNQA3Y0TI3/fgpyGnyU9CUZTzTHczexsdA
         XU3TlN+uCSLYkDRi1QnTMxkcD6vahPWY4ligTNNZ7hD35iu3tyMfo/5+S9NNiDSwk7gM
         nDkEfOv+DBUOjlUxq/YKNn07bUOt52J0kEwKXX5Z7r6C6Ew8fAebihvAlHSUMptj3Bvp
         yviA==
X-Forwarded-Encrypted: i=1; AKwUvBwyAS33EyNqM5L+3KNMn1P+wmrkOp5ZWj9KTcuXRDVlAL2/mkV4MTJWMHCTJdvdZF47V/Bvaq8zlq/m+NA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmhrHIuzI7i7g1uD/yYyEEtslqKI91KFQYP+vPjQI+vLgIEwva
	v6guH1PFREF+lcgIBXjl/pLKLzECCVbNE/xaDP0lBVns+MumaTBFIv5A14u7Ki/lh1J2/g0+VRh
	aQ4ukxns11O0vcU2Ihrb37JLMKgiYN8LOtZr5HTXvB7xYNYQXNHu1UvPk4tUWTj1S+VM=
X-Gm-Gg: AYBFou377kK72qdoBSC47uH/wbgrqOC7q5VVNSVubnA7yI2jiSfbYTsiPYzs+g9M124
	FKPOXB9U9B3JyE77g5SfXPGn6uWdTBouMlDniS7xW6y+8OZyIxNXtj76mkBC3pg8Q2YLHvYiN0b
	RgvMAt3WdBhpAZtOF87cfoMC6n6TR6rOpse1w7RqN5vodylr2nZTQ3bx1A99X9PzeaMMk0ayPnD
	esLSH0BvzMR+evtKzf2js8vQnG4BKxvxQgkeYx/eU3OSsczuWU6maYdUeXQJHcDtexlIyh381TE
	qQ+MhAxa+uUp90MaTyy4C0Hu/R5c9jRE1aRjcUmJ/TNZTz7mYM+3/olZ2Gs8KpllG7ExtRpvm0e
	RA1lMAn0ExwPD7a6LoXh9sPpuWEjSX0SIi14+QIWKPUrxtpRik6L1OBHWFKLOY8iB2YaEyL9QQm
	83zR3//ZbesGM7YG4BVaEk3LGPq2Ve
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr11555450c88.18.1791789817033;
        Mon, 12 Oct 2026 00:23:37 -0700 (PDT)
X-Received: by 2002:a05:701b:291c:b0:141:4951:f150 with SMTP id a92af1059eb24-16a5ea5d6famr11555429c88.18.1791789816486;
        Mon, 12 Oct 2026 00:23:36 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:07 +0530
Subject: [PATCH v7 07/11] arm64: dts: qcom: ipq5210: Enable download mode
 support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-7-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc8af9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=HaTVWnLGvC5sb4-HCggA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: Ngl2t986f5fvyZ7ZEbGHMBfOmDSvmr7Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX8UZtu+66PM3b
 DAudD+RVx3YmTVpEdlaQPEd5RztFcywkkNljs7NLShyk9Qb9OlW6QoxWOmmD8sisJvj98toIJiB
 ghLlb4nOEdxB83AlJI/sj5cBGNJXeodfXO7vNbEGPiFhtyyzBDpSIHLn3BxEJbt/JhD364da2SG
 s4yyIdpXxmx1CitNpwo0EyhL4WkyJBZC+fjVzzoUn7MNwSLUfT8h2c8Of+d/hFTnReQbeqeG7Ql
 UeCpCEoANtCSmxFHE6B1xY1D9NsbCKaG3r/pSpUcs9Qkn94RKGCQ/JTQ9H5BOq6wqwvR0pLE5cS
 +93uyUDuDiVKQLxY7kvK4TFcFGWjcpT5MnKGm71yWXjy7j7oOt/9fAxhh+nPsM1OXxmdiKjqFmP
 IeXG2N8R7hjrDFIY2WGamUcswx0/P2cYQrXFSHSX/6RDvrMynQ+HZ2kownz8anpf6RFgVaKNRiY
 ySIZ/4xCjEe9h0Q8shQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX+fEbeVv4LCfK
 wx4tj7RfpWiDSd8XvgqZD7/jBXtOBbZzz+csK/T5U9wNHFhca/Ps+3Ut2YrtmVsQrk8kky7y0zX
 mWscIiFpM1mR3kOJ3W8/m0s0/aeGAv8=
X-Proofpoint-ORIG-GUID: Ngl2t986f5fvyZ7ZEbGHMBfOmDSvmr7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Enable the support for download mode to collect the crashdumps if
system crashes, to debug crashes extensively.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index c14b42c22616..910196a23ca7 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -108,6 +108,7 @@ optee {
 
 		scm {
 			compatible = "qcom,scm-ipq5210", "qcom,scm";
+			qcom,dload-mode = <&tcsr 0x25100>;
 		};
 	};
 
@@ -392,6 +393,11 @@ tcsr_mutex: hwlock@1905000 {
 			#hwlock-cells = <1>;
 		};
 
+		tcsr: syscon@1937000 {
+			compatible = "qcom,tcsr-ipq5210", "syscon";
+			reg = <0x0 0x01937000 0x0 0x2b000>;
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

