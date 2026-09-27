Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE4A3B6BFE
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790481479; cv=none; b=nMhftHCJgA9Wt412+X4ytqOrT5NhKUUhUM05/9gqFXKaeYCWHsslQ6Lfzt2166GjwDN0ScBDXrjr637zNdq4wM2wpKWI3k+vXpZUg3AMf2rnFaQ8u6PcURnF9lPOpn/F0n8K2LuefD+JY1wdrMkEx8isAXbcrWmVlJdLCUx6ntg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790481479; c=relaxed/simple;
	bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gr5OzBRtBIYQtzz7up1n+luYv2r8XvSUBRSok8HQv0207oEszzd3Z/j4yBP4TGcng15TSw8flGYa68sSPcEb1RvielGeWUZVbZZhHHCgkrxNMFyThkvZg2CIg3uZvK6i8thq6vPrQJkZ3VXsHDQ76AwNvlG3BKTPH+qkSYmB3rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPPYR6FD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jM0uywf7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPPYR6FD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jM0uywf7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68QGxQGq1329820
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=; b=lPPYR6FD0FII8Hk/
	aN7mLVf8ptNNXYjo8/cgBL+xqacBUNv2UsWF2oPKqoXawuewyDDnMmMA5mCvtzr+
	8jILTirvoGlj8xWBdsFrmFjqv/WXC2Aya+LSfJ5QJxlhIfDxw0ArMSp2T/MKTOk9
	AwD5DO7mv29AQLKEDDYJ+I5uWA/Tp1IYa6dR/tDHmRB75zgAZH7DSy7YIDk7jtKp
	P0DfdcMpcbirG8R6i+2m0UMXONWuZbTa9ijeDfQf3yoy7b/ni08LkncPHM/RdKTw
	CAQId28VMYuHTUgNYqXpm7XFaOuuUOnPiqOXmMOrSAH+Tw5b92XmOmRfpV2s1fQ1
	tW5DYg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50sacrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1437272611eso2392555c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 20:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790481476; x=1791086276; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=jM0uywf7sabZBK1f3RnIbvya96oJpWTLFGudpwkpFgXg+t7+P6KDJX9iMQk4AAkWF0
         4/41J+NNcctZxg8KgmlU9Pbv5jZkMQWaMTfoEjLZSZVJwCUzR8zIrISd3JgKrW8siRCT
         hJPLgntAM3hqUxvY8kgq/dk1+Jm2sjsat5EwFbdH9JThJE5T1l66xTuoAYOmugoBXer3
         sG83xPWtCyA4wm9XNPdm95RDonscY08I9u9/vM2tFXFpNKIAKRxR5GXxDmomkBo7NCMJ
         8X9EeH5l0pJgGK0dwTfV3yVA8+9iX81cLoSjcwOW49/38uSfpXhHr/iE3IC1D11Whvpp
         ckdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790481476; x=1791086276;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gtpnTYMOOxXGC2zn1lUUjguT+OqopJOrl2umsxLDW3E=;
        b=lQOH0+vZHBzoQrKIjzMsgeZZBApsPPWZxk4ceNQ5WizKUZtARJJnMS0UKTjP8ZElFj
         4KgM89XtVn9jj6SIj0sz+VLMvO0rfsL9jAs+OW+o0mDhKFMB801faoabbyKh3g9nLM/n
         R966taYNqx8no3jgWhbA6B47T8bkUtRCEsPtKhyyjCUUNoZ0HC4ZFMDHIKbrA5lBeTjh
         H3jqamk1RyefBwhR3+MFST7lIes0EJI09GyKzuC1pBq2tIzL1akEYz1Ds7bb9vTpqA5j
         wBbpDvCJAYKtQtWXCOB0sI75v8tPhQs9g/Eb2ExC2/fdcaL2s6DPQHCLENu+9XU2HQKL
         fQWA==
X-Forwarded-Encrypted: i=1; AKwUvBx44ZurtyvJpQ30UPDbj3MrT4ZRme4DPko2ItiG2mQNaHuOcjIYLES+luW4kXYbarjPv4jbP7EZdIrI7Jw=@vger.kernel.org
X-Gm-Message-State: AFuF++l/3Ng/3vO0PDU5Mtz2p5A6LqLvoDY7ASGBhbYpEaKjOzqxkW1d
	Vpq41//02/Kezwv3fj37STKHneLO1vviAC8IZZZyCtwk9FbVgIJ/J6ll0/3U8qrCsuUmwiw6fhG
	jA95/HrVYSb5y2jZEsrr4qsel1AXfXBR8yGnzORly62l3g63gv781kuX+EBBm3DWy5cM=
X-Gm-Gg: AYBFou0mwqvg/X48c7Py2TwxbY1sTEMbm2GVoMO84ZnOTSeL+IP76X3RcuzknrhmyVp
	WbIxoMQXlw7T1msXspJQL51ifbBQNneSvYhjLn+UxfI1rxKD+4NIDy2lY7+HmeeOxntdLUNGIVj
	XolV45DoBtCn3h1sRJiX9qpUZjad1VdX8KQBURs2x+zSdkJXTgPpjCJVe1+i2JaMLTSxENcspWU
	16VyTr9/BN+MYNjIxPr2CZsMipHKPloTwZ1k3UjjmLs6mrfioCxeMnEccFy6n2yfaCO/FpFsLnb
	9X0DkjFNtIobGWnAqEpgeUhIrl7K+Ad+U1wvvPtjfH+fdzEb6ZEfaRskzrt/rK+8IPOQcEuKAX7
	xXOjDPsVJcX3KxpR7Z1bL7mQSHwxHOQ==
X-Received: by 2002:a05:701b:4208:20b0:141:4951:f150 with SMTP id a92af1059eb24-146ce775aa9mr5296044c88.18.1790481476192;
        Sat, 26 Sep 2026 20:57:56 -0700 (PDT)
X-Received: by 2002:a05:701b:4208:20b0:141:4951:f150 with SMTP id a92af1059eb24-146ce775aa9mr5296027c88.18.1790481475641;
        Sat, 26 Sep 2026 20:57:55 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341460f5166sm19618127eec.29.2026.09.26.20.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 20:57:55 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 09:27:45 +0530
Subject: [PATCH v4 1/2] media: iris: enable pipe for hfi gen2 encoder
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-iris_vbv_delay-v4-1-8ee2b7462e68@oss.qualcomm.com>
References: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
In-Reply-To: <20260927-iris_vbv_delay-v4-0-8ee2b7462e68@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790481468; l=2664;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=PEgIh4M/astScc84Iv6ct6kewphSkXqlkuVssPAXI9I=;
 b=LFhvCkVHjjQBy3+xaSx220sbVyhPIsZdKcsrSgZoy1hDnzyHzmxlLw5V3gZrQJxZ/iwAL78QT
 nXuMo2Kw/dTDFTQ5ZnnSns1XGOal9zxwAkHrLls0f9GK/vjfFzFsWfs
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDAxNSBTYWx0ZWRfX+pInalUDvvhX
 xySCzEJVrI18gaPkq/UdywQA6TYngyMXP4nGlvb45Wu7G5t2RLL/ltFnEMsHA09UQmYG/O83m4U
 FVQtGCKRoshId2oRGMcVMGOJs6dSyOg=
X-Proofpoint-ORIG-GUID: D_pyOsjaC9Q2wGCZoVFZXtgGZXNXBmBx
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab89445 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=loXtWXkZPLyPDUeNfL4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDAxNSBTYWx0ZWRfX5DPz8y4OfZUO
 ynnERDRC3gpUb55oi8kprK+7IqdWb0UnE3jDbdsspn+41yMNFimFCKHiMcxGUmXutS5qftrZgHk
 +o4VDznSwejNQNd3o7N8du14ueaQKRkSrMm5vN6I3HwBkyrJG/dUUMr+MgNSv2Jjpy8le9EWSN/
 y9XIgc0kC3F2NDuyj5gFY123CH3fRGko5wFbvmbXsYbAST0n26+nwl8qOa/Vc/etBRdPKGi9Rvx
 x5T/NGTMIXnBc4xUlGuoL55Vu0NY6PTGxEHIfJcCkL4FVnhnHYPZ0cLeBnZcPJHKFk0ARWF+3hf
 AMndshqkyCIaS/XG05xR3GpUEeYCxCZ3gpL/0vF5dF7SBGxiygru/Jud6h37jIcMF9uPgMMEG27
 e3Mq1nkFK7h+uqTHDjARrgGrvxwWfGY3Ipe2feufXwRXO/NuvwC0WVp2PchVztVCvPpyW8LsLOR
 rPlFaZHzSKUKGA6ZT7g==
X-Proofpoint-GUID: D_pyOsjaC9Q2wGCZoVFZXtgGZXNXBmBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270015

Currently the PIPE capability (HFI_PROP_PIPE / work-route) is only
wired up for the HFI Gen2 decoder. Add a PIPE entry to the HFI Gen2
encoder instance capability table, and extend the encoder
branch of iris_session_init_caps() to derive PIPE's min/max/value
from the platform's num_vpp_pipe, mirroring the existing decoder
handling.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_ctrls.c    | 16 +++++++++++++---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c |  7 +++++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_ctrls.c b/drivers/media/platform/qcom/iris/iris_ctrls.c
index 10e33b8a73f6..33114d80aa68 100644
--- a/drivers/media/platform/qcom/iris/iris_ctrls.c
+++ b/drivers/media/platform/qcom/iris/iris_ctrls.c
@@ -453,13 +453,23 @@ void iris_session_init_caps(struct iris_core *core)
 			continue;
 
 		core->inst_fw_caps_enc[cap_id].cap_id = caps[i].cap_id;
-		core->inst_fw_caps_enc[cap_id].min = caps[i].min;
-		core->inst_fw_caps_enc[cap_id].max = caps[i].max;
 		core->inst_fw_caps_enc[cap_id].step_or_mask = caps[i].step_or_mask;
-		core->inst_fw_caps_enc[cap_id].value = caps[i].value;
 		core->inst_fw_caps_enc[cap_id].flags = caps[i].flags;
 		core->inst_fw_caps_enc[cap_id].hfi_id = caps[i].hfi_id;
 		core->inst_fw_caps_enc[cap_id].set = caps[i].set;
+
+		if (cap_id == PIPE) {
+			core->inst_fw_caps_enc[cap_id].value =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].min =
+				core->iris_platform_data->num_vpp_pipe;
+			core->inst_fw_caps_enc[cap_id].max =
+				core->iris_platform_data->num_vpp_pipe;
+		} else {
+			core->inst_fw_caps_enc[cap_id].min = caps[i].min;
+			core->inst_fw_caps_enc[cap_id].max = caps[i].max;
+			core->inst_fw_caps_enc[cap_id].value = caps[i].value;
+		}
 	}
 }
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index acc0ed8adda1..45a418fde7e9 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -365,6 +365,13 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_enc[] = {
 		.hfi_id = HFI_PROP_STAGE,
 		.set = iris_set_stage,
 	},
+	{
+		.cap_id = PIPE,
+		/* .max, .min and .value are set via platform data */
+		.step_or_mask = 1,
+		.hfi_id = HFI_PROP_PIPE,
+		.set = iris_set_pipe,
+	},
 	{
 		.cap_id = HEADER_MODE,
 		.min = V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE,

-- 
2.34.1

