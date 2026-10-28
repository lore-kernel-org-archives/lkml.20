Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183921;
	b=1hJFyvRFnKC47WJxl4ZIowIg2qDcpjg550n0eDwUe++6oxaan5dyctF/+VhE990cS4BM
	 ImgvuF/rtMquamK3zdB0wqwYIIwPMjeYfIIshrYDdy6phozCeC1QLCpphNGp4ltqtw7p1
	 CN91pviHJd9/HIT/mxdQCFIRcK30/ozytkhburuVTZm2umEAlIW0rRNbZFyuyZaNfYjyf
	 DERXBmdoMabz1HCwqF/rmiaJa8HBKjo6ApNOY1GQXPTtNgFYMjipPJ+GrP9XZEStfSTdR
	 ePByu0Wc+ZJypXsYH0S0S7V0qnfmHB5gfr2eAWKG6oLnXlnne/u20I9u6etytOD9cCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183921;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=99kgVxGKiwJXgUWNXObAPN1o+z6L3i6B8XGsFbEit68=;
	b=yn+j7YXTSGnMuJ5mpVMYvzlewGLaDQxqK7uxkgVIkrrjQxvw/pLkqjbCXHsgRL0fAjSZ
	 RhnVUt+LolFMGdh2vRO1mn1JxqUlII7/yb/kTuj8rgi4p/+xgoGXCqZxc0rAmhNTZDj+F
	 RNjyv2V0910ZeOsylhWMOFLkV0ljLGVqDGOXuTQZhxApyO7MVFOyLzwg/1XKzPEvBQCII
	 7e2mB50hMi8S+k8UJiN0OJPC1N9BFCw0LBbGhbWgba1knpkL9BMiO2XvQ1YTw9F+IusY5
	 y6uKza4yZH1TKMOKXyl5QRBZEOABfbwdFc+yBpcztgEu2qIbQGwmt8oOA2whkqZsVCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUdCTyoU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdGgDkCm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFE606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35DFE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QUdCTyoU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IdGgDkCm
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KLtf3264807
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	99kgVxGKiwJXgUWNXObAPN1o+z6L3i6B8XGsFbEit68=; b=QUdCTyoUPOw4uJzd
	BGLjxpjTt8ltEffngWwuAoNFx7Vf/pxixKB45BHhekUelIttW2PxjMY5anjt/OHe
	dqZIs+YpLes2JxKovUSdQoFaaL3+JdQpxfYv34MKxEgJj4g9HoHMuv2hjiq2Xvqm
	FWfXkzaP9LwoGBm0/e9xxKqxXCrcf/6FX+oMNKgl1Iat+iWex6FOm9GgjL3trKe0
	yu6ja88ZdFn9ynFFc1DKpf8I3tmaS1wg+LYAmSalWIP+gJZbyFtRvQlLKBK7eg7H
	xBtn8KGsmvTRXU1PEi2y4jF26R0CZ1bzSX8/bcKYi5hFuxtinl4PxX2laLAbVgOF
	Nit1DQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713req-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1634169eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183920; x=1793788720; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=99kgVxGKiwJXgUWNXObAPN1o+z6L3i6B8XGsFbEit68=;
        b=IdGgDkCmOMZ4b1HB+gXkFhNlaekLDfOMIWKkCy+jsQ1v/sn1u87NRp9Oj6FZV8I2oh
         ltfzk+IgpeiocQPcZ//LaRm19u6JZcBSbJvpUiTI3APodoCSyueFZCns8V9kNSLRR4gv
         XSg+qmsl3MushKZTAiur+ShdAole1JDgsljwCru6bih/cTxbdYfdduydRido8MkCCUgd
         i+Zcb1nyK+SLKLOgtXchoU+N0PG3N3afb2Bgc7DUnuBUAHexN8NpFUKECbyH0v8TJOqX
         ckz/30Y681OHsqXlvf2nklXY6QmA/3utxoIKOj5CI4KOhfataFohbmx11hKvoDSgqYry
         A3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183920; x=1793788720;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=99kgVxGKiwJXgUWNXObAPN1o+z6L3i6B8XGsFbEit68=;
        b=WEDZ90G3t5GC6DV1Vs2mhJ4UXg3LjN8uNaiHSUOgRHnF2bOMIsh97yIwRqVbqVN/5V
         bIeLF38AsNea1YnBY2M4IE9bUrHf9Ur1pw0T+giBXMEVdCu3Q2K/TCbL+skpJvAGh55n
         qfKfB2Lc23Q8f8h1G33Zdplh0aTcyiA13mVx4gEzWZ0O2zW8azMDZ8W6zIoHmMIgx+9Z
         dHSUbGk9OR4XP2tBffrtQ1ayU/FvQ7XqxEzG1MKTPWzTp88H5gGabJfGpVd282rMZNrS
         l2LtrEw61RFWdky9wuYc8Gl/Q3aAj/tZIjqCNHji6OIlEaz3lJbUya8U0JOOPGWjFnuw
         izTw==
X-Forwarded-Encrypted: i=1; AKwUvBy9iUisqKlRvuG1lrdrazMgsrUtx3gQJugs6LfyxDERk5awMQH+Xl6SarxhRR6nZpnIWN/LjBHjfXf7gB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmEUanZUnp16WEW71Cq4AU/YdqmBlpeXImy+iOzebkjjosKlPg
	LyGrLhLfo2iieWgJbDuiQqOQYM7ywl2sBLhLbQwXUDBeQbd8/wgTFUXwRWrLB9nF/uWSCsvjQVq
	fc6T95C2WT6zZ3aT3d7WQ86m4W/4n0iYWqAOGqgB0kkIgvAh3/1JWGh6VdvJulsGI3Is=
X-Gm-Gg: AYBFou13GHZyzw26QF6kAWl9nsNVa6iw14gUCEVQqHiICOLh+e5mgGHv2Cc631hoYsP
	TKrd8mP27U2msvSCkyDm9cWcCQcqNC3AhzC53iVvR1+solSgAkWKvXVHBUGlPqvSmhWeTb0JtqL
	LTx6RfD8clOPNfTbhvTduAFOYp2OuChKwyEmxk90kWNWfn1ZZ7ibN0NSJ+EPc1Dh5kJE1znNNkW
	0q4vbDxgW6fuZ7DvXWBExtBzExqjX5LjJTIe7fRxeH3sIKzfdkC/SY1m8c0sdRLt9n2FUzsccDO
	69xGNGbB95lztu0DvPPj+/Da3q3adD3un8l0MwaDiSGqUqnBXRAjYToBk+/q4BHA59hpsxlGGUq
	U6fAZJxjE217RP29VNWgNYwGZoLazji2oqpGJylPEPHWIM/sHa4Vld2VgfudCY0MrLT6gMWv4Rs
	0=
X-Received: by 2002:a05:7022:d9a:b0:193:7fb5:2c3d with SMTP id a92af1059eb24-1a6ce11409bmr2546753c88.21.1793183919465;
        Wed, 28 Oct 2026 03:38:39 -0700 (PDT)
X-Received: by 2002:a05:7022:d9a:b0:193:7fb5:2c3d with SMTP id a92af1059eb24-1a6ce11409bmr2546709c88.21.1793183918933;
        Wed, 28 Oct 2026 03:38:38 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:38 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:07:58 +0530
Subject: [PATCH v6 02/11] phy: qualcomm: qmp-combo: Update DP PHY common
 init tables
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
Message-Id: <20261028-glymur-phy-v3-v6-2-1f1d2e565a66@oss.qualcomm.com>
References: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
In-Reply-To: <20261028-glymur-phy-v3-v6-0-1f1d2e565a66@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jeff Roach <jeff.roach0@gmail.com>, Luke Macken <luke@phorex.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=5025;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=7HZziaSLnA0ARgiKO6FwLeVkhA5JJVb+gnNRS1dvFyQ=;
 b=UylhB/1tJv57BCqQ7rvyi0QokkqgK+PjDtd+kkQz+EpCB2wBpQ1muBd1HdCS1o/NiNSoR9oJE
 ItTV0BBYgx4ACONi34GGiHJ58gGOBQHB+PAXO6kYGsc5mYU7TgitNre
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX/5ZOCAEa1gQA
 o0JNremwmPvIA9r8Bb6ThZyGk7BHtHESyfMacB7N3JFsX3HklqAbp1WGMvs3AufjRAHBTrgI/3H
 t/SCakpSSe0KOdAIgyY3CztfZwgMvFMSlYthCJ8jmt8UZDotVYuPfG3MR8fLNYUD492F9tmmliI
 3G6dTKWyBER0SV8fLPsFEuRiwLxXKKxpmVlh5eXtaxc0EKDvpS+dOKfeqQa1RnZIb6UPtXL+YBW
 1PQSbPXd9bq58HFQddDoOIre6NkbrVvR04luYtlhSv9AVZlaHj/D4TSzMWevikPH3tDFLy/aGC+
 X3hLyaCpbbmMuCtzULPYkUDqNCnA5e0GTgPUf1yIy5bZHxqBFf7YzSj7+UZp91i9/0NO83XpFSQ
 Pj65o3zbh5oWQ7AmzQUkwYHohfF13kUB/G93yE7fAM1MsgL7TgOnzrGwYCQk/yWi4+FD7KMEGPH
 xMakBXjpchkKbZN/Z2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX+BkaQIRXr4RZ
 QqlKhY+t2F1H4MtvC/25jcRWWL3gjSaZvbNZltyaTrF1bKoyQz56+vGVeLIG2n86QSnpg6OsvQm
 S2bWO1aXLabIqBszcAA0rGkm5FBLl9E=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1d0b0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=gdyAoERjSoe6FnXwYpwA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: 5R14UJ1e9aD1TbtrHlrI-58FymUH9LAB
X-Proofpoint-ORIG-GUID: 5R14UJ1e9aD1TbtrHlrI-58FymUH9LAB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update common DP PHY serdes and TX initialization tables with
corrected PLL control values (MODE0 instead of MODE1), updated
SSC step size, reset control, and various TX lane configuration
parameters including emphasis levels and driver enable settings.

Fixes: d10736db98d25 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index cd14efc3c59a..4ed366d1751b 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1502,10 +1502,10 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
@@ -1520,12 +1520,13 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x56),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
@@ -1561,26 +1562,26 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT1, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x87),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRAN_DRVR_EMP_EN, 0x5f),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x2b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_DRV_LVL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_DRV_LVL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x51),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),

-- 
2.34.1

