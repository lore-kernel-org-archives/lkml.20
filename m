Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634808;
	b=Xt5HX0nQdf0hJFWPjp+x5bg2Qhzj4RxdsAxLaBQvssRSmdT41QF+1j4ymhEIoPUiMBeR
	 rl6XkBAtaIeuWDOAT3jhr8u/O2L0IqkQY+qKXWGApHj6OVcQGht7rBE2kViPj1mtmwHQ5
	 oApPnsuO5msb0vprdzGA0AFinr8V+uBOvvRYQUirG1o2TOy8JWk1xGg6Ej5JvGePXB8vz
	 Yh6Y1PIFrrMHdgZ5Miyt9QfaVxBFjnzJ3eWETYf5aAI1OzeSEZBDu+qW2fBupvi0aAs27
	 Ko5U6I2J0uduP6FSLCMNYGU/ti+rIZEL6zT6p5TLLYXK/f7c7ej9cUpGjMa5GsPyPww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634808;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=;
	b=J9GSj23D7wlAASgKax9AlEeP6PI/66sjM4LidfgzwLalUHPg9EKV5nKXpeggTpryK4Cd
	 Uz9tQdGNF3LbrdN7H7JhunuuADsfLeVF4h6QDTzceWxNesQl8te6Lf80UVKuNM8EATaVg
	 8TOVgeKWHkKHKAugnIMNN4UA1NQt4Fzi+5AG/mw5lVUZXxYyssf77e35eHv7LGx/DTCWA
	 EcbwUtit4cSsnw/5s+93XW68lhqlZddkMjHydD3mFDQAqZp9NXv6Og4mBUbSbmWkj8CCs
	 9BebHDNRwIENBOlHLJ+gGOyecho/hA0iFPypT6sEXaD++NYwQlsjIrdo8cCdAW7G/XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu4Tnj8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="a5kYb/jA";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4FA60AED14
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 15:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD4FA60AED14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UVu4Tnj8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a5kYb/jA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRPe477097
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 15:53:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=; b=UVu4Tnj8ZPUJ7Yp1
	Nf/ExzKQ6Uh+3p2uwCXvsyNhHRzIPSD/RuneqmCjLih5DmcBTRhsd2ePvq1XO00j
	W01HwsJP+l4mpH/CDgMQM7IEaW9oaKAiJSgw8U0d0at0X/87L9yhM/G5uBMQKcsV
	MVNFG7aWQu2q15aezJGkIJBtqq/D9+JSkz5RQxMxk1eb6KGLE77Huy6jgbHcAvPq
	PfJFawohyY9mcNhig8w2JvzriBjo6Wfnrdu2Iz0/6S/dyXQwfH+mxjtaqWpCXmfx
	KQ9vc9JkpX/EsQ6z6nIFOoxI1fDpRgiETxgOC5CXuEmpb78Vwd4iSCTf4Oc5MvzI
	nLJt1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpph19ynr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:53:26 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9905fc56b60so2549042241.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 07:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634806; x=1794239606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=;
        b=a5kYb/jAVHknx/3aN6HG26siSYVZoKfDaO8Hhzg2IUCB9f7407q/RcnPY+BxjM4CwM
         8BL59ME0iqyZplFN+eucL4TTfoVPdk3jxCC5MdOGMVvL5xuAEmVXZjzzO0ivVGSGOfoN
         2kKYA/pSqPSOzY7slVpJWcWXP8a4xElunDNwilYtiB5ExqZVt/UuFV4hxcOnJPA0122R
         51MfQ7nPvfl2TR2S9gtG76CuhZC9/SjCyXsb4X7zzeGF5B6d5KBSOEIrfPsHOdEMENnv
         EbIYZ9Nvjl8w250Nji8GF8ZTvL8MJkZcbIiRnUdERO2DvD0xUCbMaYt75p23eJDb5icS
         OQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634806; x=1794239606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODaIjf5VwjF2KdsntRNya0T1MnDIbUmL9YbGffxb1Yo=;
        b=cxcvmfVbuAzwrnAbmSCOI9hzoJg+idAhdod/ReZfTrgE4NfDfKl0svRnC7craOiKbn
         POQ8XbJxzlmOSSAgr9x9vYrNyIzg7RRGumZjafoIurIpfS5dB8fscIscutYFB0h673zA
         v1tFxpV0TmFglLHBSfMiRXo/ZnECt5COeXT/1c5z55NYsF+B5u4BZsHNFMSQ+aJ5WAED
         jWr1AZV4bqyQTSGr+GGlrh4baditUYL4OsviUc3ORSDaT3VIRq9yqi0WlMigbxNxIKr5
         IjLYqgIveSQTeH3dVaTYBX+qicOnWd9AhGh5JHoztOTQpeG3SPpQdT3ZqeAHVUc1KdtR
         puzg==
X-Forwarded-Encrypted: i=1; AKwUvBzSklUcBSmqRvBOAD3RpXF+WeBxqxif37xzOgjJVY710FqnzCWZcffw8MQAbLgQlrkFCiVWjL6vtYLxU4k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z7Dx2OJyRv/Yx7pp75fpSyiTKotA9XDzXwHHSqtPHEWOj5rgy
	6CCQowKy1Rxc+WDm0Zq+e53cWCR9xy1CBnfUWqiN5cdLMd/SvPNXbNgjrZlYsR+gwW2goaA5Ggm
	CqZRgpdHrL8vTXylHwwtoXySXTmJMoAVabf33kAp/knNFuPrgZ3u3+c5eSjJrmjH8AwU=
X-Gm-Gg: AYBFou2y2niqnwtsjfLkwEpz3jwwjYaD4iquCHIQMU40g0ejEF2dXu/9YAe5VdNb/FL
	jgKcnWFhekAQlM1McmKJYuSnMR/AHgclIbRndbOBCo1/XEzyAATOKci3Mc+Wjw8DHeeRYm5o7WY
	7vSjtIu/5awEa719H3J8wS8XCkIhrbg2vbzJrL1t9bnWVVaFrVw0AhRMhNppiK60VcV3pFRJ8xv
	UX2YkUnMbkiSW4NSFb0/OHzeBkvPgVmwxW7pbZHwF2IUMX0XRFaDnNGY+v8iA0F4RHyxwy6NEdK
	WarPPxQ0sbywdDLblwQz1eAIzf+iwGSmfXdCM0cxlUB7IpGB3IMdDW8hvC5sJG6ArpMpsAu/+zY
	7p9tV3xCkHueqT54vWEgCof37sIyd8BywWDGCzam6qNlHWhebiXVomjXUH7mwfShZlzXhikOP+A
	/kh7P7+umsQl1v+kb48DmGC6pQ5qZqSp5M8ZSVDxCpzZ52Zd/bV07vEzIAWfqslyXsJDeuUROEc
	1QjPrhMP9M8b0YaXSDxfe/YZ6NO
X-Received: by 2002:a05:6102:5244:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d054298427mr3918334137.25.1793634806094;
        Mon, 02 Nov 2026 07:53:26 -0800 (PST)
X-Received: by 2002:a05:6102:5244:b0:7c8:78bd:fd7a with SMTP id ada2fe7eead31-7d054298427mr3918321137.25.1793634805562;
        Mon, 02 Nov 2026 07:53:25 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:24 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:35 +0100
Subject: [PATCH v12 4/9] media: uapi: Add CAMSS ISP configuration
 definition
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261102-camss-isp-ope-v12-4-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: yMSpIRXD4r31pS_ZeWby4GNXQFIy-e5k
X-Authority-Analysis: v=2.4 cv=IruL47/g c=1 sm=1 tr=0 ts=6ae8b1f6 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: yMSpIRXD4r31pS_ZeWby4GNXQFIy-e5k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXwrsoRkAXFI6V
 +XKqTlHWpQ2iEx/RXmb/H0svQ6UQySg3c/BwD+h36R9N9I1Gn5E1JuHeq4LtVgR3AOYbyxGRYQ9
 2f5VSREOF7am/s378Z8behACgEr3KHtX8iLULCjPCvC5APjrGQFxBGlx1utMAf/XPWTtXpTaeMF
 rHsThk2ak1gtRCnNxOMtLETOcgWStxDbvKalyJHRBPSqyIPJFuppxVqj6TCRfbqspWDzF+idFej
 CmHHWNx9epIT0k/BuHzbOy+nmpbG9sfYuBIv1VE14R9/cK2u+6irhb9e9ECS0B1k9BD/0eNtTo6
 YgF0r6bE5o0zQ4mW/YrcvpSG0gKUf7Dk0hMsMw6laB/+8y+Q5AS8keojJ9+QsWBe0XOAoUk35ZV
 pvvDy8+p6tQTajbZGREimdHw5Cn1GioUrq/hFvsLJtkE9nGl15wrWkyHzxT1cLDse8oSzQqHOrN
 tf+Tem0nTI4kpDLP2Xw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXxhLXjDa3cgWO
 iDPnsNVUEgz0E7OOchxZsDbp5Wqe2ZA0Gsf22To4sIGZYZOUWSr25f+PrmPxbX/W0qqX+YAn0+K
 yPVxWB3HZ+QZzxGA4DbWFPhc1YR764A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020063

Add the uapi header qcom-camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

The block type enum is shared across CAMSS ISPs so that userspace only
has to deal with a single set of block identifiers.

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Tested-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..5756d165e7e873a6d268909da077acb6f5f56054
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_block_header.
+ *
+ * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
+ *	&struct camss_params_wb_gain
+ * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
+ *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
+ * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
+ *	&struct camss_params_color_correct
+ * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
+ *	&struct camss_params_gamma
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_GAMMA = 4,
+};
+
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level subtraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ * @_pad:     padding for 64-bit alignment, must be zero
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) coefficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ * @_pad:   padding for 64-bit alignment, must be zero
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_block_header header;
+	__s16 luma_v0;
+	__s16 luma_v1;
+	__s16 luma_v2;
+	__s16 luma_k;
+	__s16 coeff_ap;
+	__s16 coeff_am;
+	__s16 coeff_bp;
+	__s16 coeff_bm;
+	__s16 coeff_cp;
+	__s16 coeff_cm;
+	__s16 coeff_dp;
+	__s16 coeff_dm;
+	__s16 kcb;
+	__s16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-16.0 .. +15.992)
+ *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
+ *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
+ *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
+ * @_pad:    padding for 64-bit alignment, must be zero
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_block_header header;
+	__s16 a[3];
+	__s16 b[3];
+	__s16 c[3];
+	__s16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_gamma - per-channel gamma correction curves
+ *
+ * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
+ * holds one independent lookup table per colour channel. Each table is a
+ * direct (not segmented) map of input level to output level.
+ *
+ * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
+ * output. The number of significant output bits follows the width of the
+ * engine's internal bus; the upper bits are ignored by the hardware.
+ *
+ * The module maps a 12-bit input to an 8-bit output: the top 8 input bits
+ * index the table and the low 4 bits are used to linearly interpolate
+ * between adjacent entries. Entry i therefore represents the output for
+ * input level i/255 of full scale.
+ * Output range: 0x00 = black, 0xFF = white.
+ *
+ * How to fill a curve (same on all three channels for pure luminance
+ * gamma; different curves per channel additionally shift colour balance):
+ *
+ *   Identity (pass-through, gamma 1.0):
+ *     lut[i] = i;                                // i = 0..255
+ *
+ *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
+ *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_GAMMA
+ * @glut:    green channel gamma curve
+ * @blut:    blue  channel gamma curve
+ * @rlut:    red   channel gamma curve
+ */
+struct camss_params_gamma {
+	struct v4l2_isp_block_header header;
+	__u16 glut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 blut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 rlut[CAMSS_GAMMA_LUT_SIZE];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct)	+\
+	 sizeof(struct camss_params_gamma))
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */

-- 
2.34.1

