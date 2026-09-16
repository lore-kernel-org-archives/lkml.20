Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA2D485CE7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789559763; cv=none; b=WGhGmzyLEhDsurkUW3jhvrqo0EBCPbcVY1mOFEwhMEk+qRZG0d8mw/xZt9FKLQ8Bxr9LMjk3xl5mYEfwiBtPzRWZb6uNDbVvGhJRgQuFwwm9zUbwssBzkXYL2VWuR1FKQW4G6Cx16RtqSo3YEKCl36vtVF6eML7H9D4+VbIjnyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789559763; c=relaxed/simple;
	bh=r5edjYHWcbLbf1p3IWihy7C7waQQXQNiUeI2eHMHB/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Kj0lj9StComKIQ9R2i/iu76m2PcROZx5EysHH4Zt7sn6b6G2S8MRSi3bjad8JvVHHBid7Aj6uAxLQciAGl0ht4S5pGy+N5aCSMaDV2c30YRS5mZcaAKjd4TNsa6gdZtgypz/7mVqo2c1cwkGg1p+tDKS1y65PLcmo8XcVwKdVNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nn3VDP0Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fsrpaWnx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nn3VDP0Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fsrpaWnx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ege3169101
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6ee0FcggQC8Fx6LCyjG2aS
	hjOOnSgooLHQ16SsvJMiU=; b=nn3VDP0YUDbQ9kat3MvT1E2iSx6rfD2Jfh1bGV
	0cZ4FFmL5uiOvGc5evtNw/elXzCYS+i6gDJW4HQUoHEnf/rp4hSOvSPQmEUxODru
	4PS1VWxHZjfd5OzNM4Fg7XdoIHJp9ODtIOcjINgB5rjEXFehtfJBeTpzV6J2cvwJ
	bRs7F9OLS2LSSwhV3WzMip4AXFub9w8BzoTuJZz8xMCo1buJ/nuYI5goUd+krbL1
	DrGM4tX7xwXrNOqYXW7duR64hN3gYCM5zFZGc934KY/bvi/51Bv78CxZchqyDaa5
	ECQBvdlv9ubZ3V2JeVflZRYQHYPiEaTDiHawHt9wRgtgROtg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2s24y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 11:55:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso474742885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 04:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789559752; x=1790164552; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ee0FcggQC8Fx6LCyjG2aShjOOnSgooLHQ16SsvJMiU=;
        b=fsrpaWnxVW3dHM0BKVY5WVKYhrkTY/S9CQUignERWLIeIEZkwxRgXS3vQq6hwdv0xi
         LWaEMSzeXbaVd+8zIpDeef2jObNPGMuB87OGaIk86lOS2/KGNsFTWhE182Ws+egGDvr9
         dIPxR41Rne+9MKgeD6eOZOsQm5eWYVRor647MN4ZVZ10swB5WKja+9BgNlBrcoZoYXTC
         IGBrffI4EHyTAes/cRGe1svAhK2HdQBQZKAgWNaktJYgHeWC+U8PmWF48pwTSueRT3KG
         lgUAGbiI2ebB6ck/EwGPSQDgz0riLk88ghkmwvfltM9MNrnXQaSaP32F/bvBk0fS9dua
         zg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789559752; x=1790164552;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6ee0FcggQC8Fx6LCyjG2aShjOOnSgooLHQ16SsvJMiU=;
        b=s7tnVB1AVET0HcJd+hPjV9xKGOyOzbPKWnp/XRsf/ex2Rh2rajauma/93SmKwgUOYe
         yP1Z3l0mk1c1vKZuBb3rR4pOCoaKEQkP264cAFZ4dCJHkRsWBin3vT8c3izM/2Ou7JSN
         B6aRWBW/ow/80ybt4zw+HqfZhTFHnS2hBpfi62jimEfpp/fLxag9QsVVaqPELV5seAvb
         zMXF173HCkkp4OUeoBOwoj9tjRxOZ1/y1EUtX5bPXi5TozIGWLUAf2L0oKnBaxtSAAVG
         SswsLzSbVrsA4Lh0BviBz9I8ReA4GEGaY276Tg2AdwH6CrlhSYaYlrQnBGat0p/IBkMK
         wQqw==
X-Forwarded-Encrypted: i=1; AKwUvBxxGv6SOq/zmDkAxsMmpQwQmE5jhL33AYmhCf7ykv4nKryS4Hu2cSiAzfNUL0oFNR/xfUQHKAuL7fdlQcY=@vger.kernel.org
X-Gm-Message-State: AFuF++mebfoAkVuHDzlK+8OMF6X2ewiBOF3gsYfS9/HIp2ga6LDvCTG+
	EyMZD+GAsNCXBQGxzzv55e0qmL1VvuyXfz81IkxpNA/9zixzQbqXy05MpWhKJbc6WLruFmLAM6m
	k4oK3qws4dYS0HMbA0Ov8q9kgXDewjpUTSlRL7ZcSvUi78OqIa3c6v2zxAwcpQ3QgblQ=
X-Gm-Gg: AYBFou2PDac4OTIFwV+xGlKv5QsDC2YqRCSi1fAv4x+EmY4hvCPwZXog1ZKWlLr/xEA
	CdOk77PzkYpM6Lx3TDoaS2moaqySc1j9yRGA8MrSAw2MKDz/MtRbpkP4eKAVoMThyP026Y2s5U9
	a2pARyP6Jeh7neMj8JS98TInPKgyix3wdFjbHbFOYz5uYa/MVrs7WjHOy3Vsuers7YDggmFV+9Z
	dsC91IJettxNGyo11+pZIhX5MtlJmk7DsGGJ4r57dbHdr4xsAcld5TTfSblQtLgU4E1bHlhzTlr
	VNxpmCh+CJiLrTfWMtWHhpwxH36d8vX7alEG0pzfVWQgvn7yQypCEkF9zLMqopINI0EX5yx2UB7
	jjrLARjTZ
X-Received: by 2002:a05:620a:3710:b0:939:a8b1:3696 with SMTP id af79cd13be357-93a346faf19mr1043576185a.27.1789559752123;
        Wed, 16 Sep 2026 04:55:52 -0700 (PDT)
X-Received: by 2002:a05:620a:3710:b0:939:a8b1:3696 with SMTP id af79cd13be357-93a346faf19mr1043571685a.27.1789559751528;
        Wed, 16 Sep 2026 04:55:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf33e01sm7819977f8f.23.2026.09.16.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 04:55:50 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:55:46 +0300
Subject: [PATCH] clk: qcom: mmcc-sdm660: Fix MDSS AHB clock HWCG register
 offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-v1-1-30dcf09d907c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMGDqmoC/yXNQQrCMBCF4auUWTuQBhqIVxEXzWTSRE2jmVaF0
 rsbdfnB4/0bCNfEAsdug8rPJKnMDf2hA4rjPDEm3wxaaaNsb5BuV3xQyZgzEYrPxigM6Y3Zi+A
 YHcYXTVhCEF7QKGWDtuQGO0D7vFdu21/vdP5bVndhWr4R2PcPpeHtoZEAAAA=
X-Change-ID: 20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-6009f29cb595
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1414;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=r5edjYHWcbLbf1p3IWihy7C7waQQXQNiUeI2eHMHB/g=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqoPEGDm5jrYhGCoYDA1YlLSBdj7bNyZ2o9uzb
 IvgGX80hb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqqDxAAKCRAbX0TJAJUV
 Vgf1D/oCaOMbGaJ1l9+agMauw/7gcumX2bkasnjBAJOnUnKQDeOWwuxxr+VRSmvqjZ8eLcBE4gL
 s85KhopcOqQkzkp7sgqkk15ZKZWCad7bcNHtuFrsUWTJTNx3D+MuUQ4uqLlwPpWpe+Ly6DY8V1S
 qDHuYixv2ZPXNJIjO8gliO0Ox4FLxWWmylM9KbSbIDXkFW/wvOkONb4q/tFHN1LEybeyCl8HNvy
 MIyNW4yK/RsN53SidXiZpIJFhboGiwqycHWX6dwJOA26QpVxeou2YsHhVTLMaiU+73TzbUVsF4X
 R0dB9GuyFiZVrdJyzL831adeg0b6NoPqfb1cqIFM8MHQvJO8jpcvNgew3v+o+pHG3o2CSaHJQ/w
 zsBQcAa0fqCkVVs/ac0Kd8utUKQvyqIedPCTarWlcpQhTFqer4ai409LlC2fH/yqMkHNeW7rx6T
 6L/+2Fu0TpaH3+B5+EXgK/JUk2yybol0EBUH4JXO0eT2VbrY8gtDQ1jPd6aTWDtmT4FmzqMBtcp
 GkqiVQWj7p4m1FKSZzyEB7IUqobmebRZqmU3UNSizdqdHTDS2v3zpV22ADtq+nnN0FHF5z6U48E
 zpMLuafC/kCOCFPIb8e8/rsTgvYfgbYnjXx52rqks0muidno69I/y2ggWUFAtL4xaUVYTxZ1qkL
 R7Nd7JD8iQdy/Cw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: 5dpaKnKSQuCshM0zbCqBd2ZwDRZt_O2r
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa83c9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=FrX4wj76YW4h5ywvKWkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5dpaKnKSQuCshM0zbCqBd2ZwDRZt_O2r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE1NiBTYWx0ZWRfXxFqZMAe3O1Cj
 qwy4s/I9ChS0mza5XGxUmYlJsj/9c38vIOfmbMz0ZA65KzkB5vmbVRpufyI3WF3L9pjiF9OgMe8
 D3zzJSw92fMHQQygEzE3G/Pulm7idJbZJoTObxzR6JSjy+sqGJVFUcSe1BtScnK4Gy2pFt4LKJL
 zhehfGNmoMrjJotG8ZaNspanqyA1NF1Hkujp2wNpoDxRgmnQ4WCI3XMAB14jXIN2WKGWG7qkgEv
 L/B/lCwITsc5q4PZqmBluit/Je/W1e139pHzqwyhaHoe6s01DiZANOuvCyvq4ZmvH9yygZ3nZYZ
 sxBC09l0f3WdzAfDFctkLe3wxn/m/U6UxkgQi1SWft2LG7TBW/21Im/75HEC3vAynm6G59MUHkb
 yqih7dvusUiolF8eaXARM0zbi06PHBONoznkE9Z+udGWa9AF0LJnGOByolx95X4K3B+fr33Ulyk
 TlEcxf+x1jCdKUILFKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE1NiBTYWx0ZWRfX+qibXBbVv8xF
 pObUwKtdOLPDRinV5g7lRjsZuRNfD1dF8+5kEpTMQM9UE69estXmoik9H5YBLacDZFP397Twqyf
 QU0QnV7mJIT5WPqrlSVZLFOjzFUl2Mw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160156

The MDSS AHB clock HWCG bit resides in the same register as the branch
enable and halt status bits, at offset 0x2308. The current HWCG register
offset of 0x8a004 exceeds the regmap maximum of 0x40000, so regmap rejects
the read in clk_branch_in_hwcg_mode(). Since the read error is ignored,
the helper uses an uninitialized value to decide whether to skip the
halt status check.

Correct the HWCG register offset so the helper reads the actual hardware
clock gating state.

Fixes: 5db3ae8b33de ("clk: qcom: Add SDM660 Multimedia Clock Controller (MMCC) driver")
Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/mmcc-sdm660.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 200f986de965..9f8b8e29fa0f 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -2017,7 +2017,7 @@ static struct clk_branch csiphy_ahb2crif_clk = {
 static struct clk_branch mdss_ahb_clk = {
 	.halt_reg = 0x2308,
 	.halt_check = BRANCH_HALT,
-	.hwcg_reg = 0x8a004,
+	.hwcg_reg = 0x2308,
 	.hwcg_bit = 1,
 	.clkr = {
 		.enable_reg = 0x2308,

---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-clk-qcom-mmcc-sdm660-fix-mdss-ahb-hwcg-offset-6009f29cb595

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

