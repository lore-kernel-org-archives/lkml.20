Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793183915;
	b=jZ4p9w6y8KOhin3yOTsAArL9Bftfwz065m5OmAFdYmxQlRFENMFwsmJiVUCc/YRn5c22
	 4UjC3zhtC2k5uwyn5wFR44zjuUEJFmYRqVHH02QcUHLGmp2Vz3kF2KvKh/+sp8k9mtBad
	 /dRAPJQJ/dfKUZiuvWJpkRthagW47uokNjQy4qr68Gvx9WmwzZ9i2oWYRR4o578yfrRqg
	 gzs8nu0cBld+k1g02pEzlB93NAKIqKE35T+pP7qUvHal7rvjiZUClGfXDnrT89qmLvUBN
	 09Av/tHt/6I7wgC/xbNxVTUSqL1ov5wvFA6cRKIdqPprz0Y6bMmgsNjX3Zlzi96RDsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793183915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=;
	b=n8A470uPHsvPQwjdwQrJSYw55fCN/3hTZebZUEwLG/8+gOJ6EDM3DaDslqgn2hxnuV7e
	 pY6gvPbf5y+eKa1def7475lwtQC7Q2GeXOTvLT5At1no/o7zPLuepjzEjsZgaJ76H/s96
	 hgY8Et//yQYokGYE4Fm83IYvD3mIMZvQK/ujK3LhLvZBhqZAFd39EmrSee88aRBmyxeQ1
	 EZJoXWyyRsk1rUqUyGh72dHo9u55u+u8GhZU71Nj0RTJKyDgNNrQ8UBPbu6k2VYWFZU6u
	 pS7tn7zst4YzKPFETNEi15Mc35vS5CYocOIZe/H/tq7JuXnRr/jC2kT/yInCJlnPtJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfONDjTg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDPaMBiT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135D7606A323
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 135D7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lfONDjTg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UDPaMBiT
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8KKEs3264775
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=; b=lfONDjTgkToCXvMg
	BoMv2TAAzlzJp6j5zJoWnEW9+mC/jonY3K/37e1FX6s3wT3bTW0vVlVSZ2zZwPWf
	0AUp8kwEYGDNG4HJe13e/UsonKHMOlcKFVOHCa3NzasP4yWvvUmqgp4ikIZ57XcR
	9wD5EnECNP6en8OdQusbRPOjaCi+Rh8bmjTqVt1gaf4XF7OLRWPE6CmGY6GF2zB6
	cPdE9hRp15DMuBO3WZjBexXuwrkpEw10W2NTVXFCz+ip7aTJBeoScKnfSKWE85Dn
	ZMMo8I+EdBNiwvQxb8LzRn5HBGx6eL7Wd9LE2WtfNzvlmQWtZRd+tdZXRW4JIm93
	yUV7Ew==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy713ree-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:38:34 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-193b5eb133eso1040072c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 03:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793183914; x=1793788714; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=;
        b=UDPaMBiTxlmYxCBo1zK32kxegA20stJx/Iuz5SiQAq8wphZ6+6otyauG0NyW7U2qe/
         4eeJ2jaApc7rvJ2yqr2hG1+S6oHvIMCe4XSvOLP00ksVrDypzvNIsjtOzHZQrSA6rt7m
         mLt28NudYwknSe8/CpfXmhXLq6XVCCTD2W83scfuQJz8wRPsY9RtDrWAu87WLZmOBluu
         RGJnG3AXUDcj/LXpwy7VI0sUZ7R+4CBdOTCJnHJIWGFa6s0WbxQukc7TgmnWk9OHdk6e
         2Yi18FLdrXKBpxOUiNztTC9rI4Mq6xop8HhGSAxLHevGKze/K8cvWKyE0L+f7PFAVGov
         bcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793183914; x=1793788714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdQogbyw565MwGyAXZSXXJs+hMpJgQr7bh3Iu18EvWs=;
        b=ooTSxPuQhcyKdweVNLKUnctR24f6iraMPpKRzyc+qa94ZNMXyZrFXLe/+2geXlyqoS
         IoJBdWYzKOPT3Z3h54GUcaL5FvehCzm/qpzzdGa4UEtkmXvi8v/57x2fWI/W6iz5lRmY
         1SZbWR2yuookKw6G3UiGQ9IQvhW/ZZxQLucB2XQ1dzjS3y7O7165gwn84ME8pw29j29g
         wDpXHm3F2hJ4Dp9ElD7ldxO4GvR6WQnsQYpsODI4pQ7NCW5Ibj3HSwOttVfdzCK+rLoz
         WzIeCPdDnBixTt8ffdJBICOiJEzdPHQOQjNC4uc37RQ5YGMevFJkTWPX3rJsuGYwyYT7
         F34A==
X-Forwarded-Encrypted: i=1; AKwUvBwqS10g4xE+3fbNQ8CYZLHevzoYlczmsUEf+8GZCjKK5Uj+R1Qdvjdid19BjTPMEdhUhInJQXljfCXlkOM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoQWT4RzIVSMAbWcDXGQL4LsNW3JGgBWQavIdleMAHKELL/cOq
	JfeP9FTJldFg93vhLd3OwY6Yb6oUuATl5IgU6psxbNEjtdrnnTJ/qf4M/VAILPPjRZ88qsix/Y6
	1U4eUR0zP/elm8FnN0oxfJjBpSOt4MQfI2sg53dOhUwfz7gzhcqGXF+oGVIyHKCt3Muc=
X-Gm-Gg: AYBFou3Tsa/8gcPjLOvKvlJ2zsnHAoxZAxpfWfDbUBqz26VXaNz7Bh2JryVkaTbXv+s
	S/Ysjrriyo7hevm1QIhs+pWrIFEr4Ar9rKOJ5ee8gi1sjplLTYRpgytKvvZWu9nBEnhHW0TcVod
	w1XbvioIsWa7mGPzFlRLJhyuEBOcZheePydNnsALqQagEeIXa7bnCAtH+a/KkiUvaVRErF/sdC8
	OlSYGqdZPd6L2aiajlwKs/1rBmw+vt065h8LTU8D2sh7LbjVJhrebapFC50uQgDpXwvpPzpLmVU
	9FEeKra4QGWkjqthcoLqB6+g6hXeLQwcK6NmfRvI9mJ61IdrvfWS7A0WfJsj5LmPjchgVc6jTuD
	Os17L3V6rMo5A1SjEzvIYJvsS3eOtRlYJ9kgkr/Vh5yFG2ScR9aDxbIdTE6Ly4qHNGf/5jLeEtW
	Y=
X-Received: by 2002:a05:7022:6727:b0:155:7721:3a4c with SMTP id a92af1059eb24-1a6d15f8182mr3743999c88.35.1793183913394;
        Wed, 28 Oct 2026 03:38:33 -0700 (PDT)
X-Received: by 2002:a05:7022:6727:b0:155:7721:3a4c with SMTP id a92af1059eb24-1a6d15f8182mr3743906c88.35.1793183912618;
        Wed, 28 Oct 2026 03:38:32 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a75e5c6d4fsm8340186c88.14.2026.10.28.03.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 03:38:32 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 16:07:57 +0530
Subject: [PATCH v6 01/11] phy: qualcomm: qmp-combo: Add DP COM v8 header
 and fix register layout
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
Message-Id: <20261028-glymur-phy-v3-v6-1-1f1d2e565a66@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793183900; l=1983;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=+DVFqiryDONG9McNRCJ+BQaBHXz+SBZgygyspAMF7VU=;
 b=hU/MOjd0eA8eKsd1h/SVBDZgJ3/iLUcET7l3O94d1qJJYmHK3shPimYQhHn/0kjz+NDtzlbdG
 Obts0F4k5ZAAiL9+gOaLCdEPrQBfV6hfbOJFgiBSxFRm2EskIfmt5IU
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfXy58t4fusRvwB
 rprIbSSmG/EimfI8F/+XCD9TdB1SyBdnQMQwRMjYrvd/y0uuT/4wMyPiUzJ2VmwSNnu9+wL1n4R
 cTPrBYRUcDYjU9u0pex3Ec+fk653BEKe3nzEl6wk/ha+5gKtdLJq/pC39/GIp9BLR86Crb8zTkn
 AULIraOHVPwvkTexjQ/9IgCwhXUX3e30r9CURb6TdxhKwYEvmnTxs20EsWHv2TKrjAjw48u7NLr
 jGHCstFE57WR1CE/wQext0ZiJfkep4z/IO6kNu9iY38PObhPOTFKrQmiLkCwq6jmvIWvvoCFpNi
 w9gzIIoD3jaOShDI7ccq4q/KPTyovqEMJ9V0CLeZFjCxx4Vt0rppB/ufRrzn5v7mHWtAcwKjc/E
 rB9+yQPgi4ZiuG+nvVpkxXPqgpRaN6zZHaJZxu+UYLF/gKZGH+veS2265upjUpZXRSCy5pYmlzS
 hU0Qi+WCUXE561bGh8Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MiBTYWx0ZWRfX8zHctUbUyh4s
 Ueln5uDQHgKdB1+kJJWkSLgPCoFCSxef9fE+UXpJ2NfNKVr7Z9OWDpoUtbAM7y/9+zst4R3jsE9
 Lmt9VOCbzkOjesk8kfbA2wdD5earPU4=
X-Authority-Analysis: v=2.4 cv=JspkP84C c=1 sm=1 tr=0 ts=6ae1d0aa cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=mO8_gwkcAAAA:8 a=uxOsGGhB1PPybffeXOwA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-GUID: STVW5TJwpBBwHhaklekyFrQeTYQ0iwCm
X-Proofpoint-ORIG-GUID: STVW5TJwpBBwHhaklekyFrQeTYQ0iwCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280042

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add the new DP-specific QSERDES COM v8 header file and update the
register layout to use DP-specific status register offsets for
C_READY_STATUS and CMN_STATUS registers.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Fixes: 5b289913959b ("phy: qualcomm: qmp-combo: Update QMP PHY with Glymur settings")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Tested-by: Jeff Roach <jeff.roach0@gmail.com> # HP OmniBook X 16 (Mahua)
Tested-by: Luke Macken <luke@phorex.org>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 187f0cd11f6c..cd14efc3c59a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -52,6 +52,7 @@
 #include "phy-qcom-qmp-dp-phy-v5.h"
 #include "phy-qcom-qmp-dp-phy-v6.h"
 #include "phy-qcom-qmp-dp-phy-v8.h"
+#include "phy-qcom-qmp-qserdes-dp-com-v8.h"
 #include "phy-qcom-qmp-dp-phy-v10.h"
 
 #include "phy-qcom-qmp-usb43-pcs-v8.h"
@@ -326,8 +327,8 @@ static const unsigned int qmp_v8_n3_usb43dpphy_regs_layout[QPHY_LAYOUT_SIZE] = {
 	[QPHY_DP_AON_TOGGLE_ENABLE]		= QPHY_V8_PCS_AON_DP_AON_TOGGLE_ENABLE,
 
 	[QPHY_COM_RESETSM_CNTRL]		= QSERDES_V8_COM_RESETSM_CNTRL,
-	[QPHY_COM_C_READY_STATUS]		= QSERDES_V8_COM_C_READY_STATUS,
-	[QPHY_COM_CMN_STATUS]			= QSERDES_V8_COM_CMN_STATUS,
+	[QPHY_COM_C_READY_STATUS]		= DP_QSERDES_V8_COM_C_READY_STATUS,
+	[QPHY_COM_CMN_STATUS]			= DP_QSERDES_V8_COM_CMN_STATUS,
 	[QPHY_COM_BIAS_EN_CLKBUFLR_EN]	= QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN,
 
 	[QPHY_DP_PHY_STATUS]			= QSERDES_V8_DP_PHY_STATUS,

-- 
2.34.1

