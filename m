Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6B7367B97
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789887700; cv=none; b=uu1oqFOygbOpwNQr6gcQqiVaru9xJ8rYiKmcCR0rjAFamANNHu8uWdqD3xFFJAoerYeRWyI3xtMkSmKunTsz/fVelCsClUOFFBTn2Kf2GsEKDPl55DgcySH0ysibjEihyrXGnHVCks59PeK5/P/yZiYW2NyBXXwIDQ3oILq1PZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789887700; c=relaxed/simple;
	bh=vNH0OrCyO0Nl7ItUJbtPnS/ll7oBvOzY/BTQhEjFia8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLKe1y3ScUbMIAY4PQl3Z9C2huxDh9O/Fv6aljcsDA7rUqw2rxV6F4np6b+A2jyaK3aN0pVfWXzXJbZkF55jXDYohfv4KRC7SydKVxZFiQzDAh8Aqi8qMVd7cJz6MHNeJJrMzH9PGadRzYEygCF1IFsWFAgg2+gz8DpX69Jfiug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KK+57J88; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XImk4+ma; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KK+57J88";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XImk4+ma"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K55JPc2096837
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:01:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=npZKJCpy5rxuUhuCbItRrVGy
	+zKSXDH8vwHmzpQu0XY=; b=KK+57J88CKtU6mqN1SCAvHQiz3ysX2g1xheQSNt2
	OZIm0ymMOKIaPw7+c4PEb+JJF4bsaHMJn4umPPNPVu3Oh8RCay6opjQG1NNUdQio
	mIXAIXxKhZUJ/6WbOFu9ZCNyjBeoBXuYlv6WpWbTxzhXxN+wVEsNQa2HwfCYQBna
	e+s0gsyC2VQsJCzhx1i7ox654wZYFKCbWnA3nnmMVr8C+K5BDX9IuHWZ3zneqzu/
	/CwHHVfGY4/po7od8MYHfBwc6kxe6RrB+EcfqP1vRtGXj/yDkFJF6RysaDgxUDzh
	GMYTal4iDbIJve96jJLRv1Eqe08vBZHFwHtpJVvsL5oCHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshyxtgnc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:01:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so3359286a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 00:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789887696; x=1790492496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=npZKJCpy5rxuUhuCbItRrVGy+zKSXDH8vwHmzpQu0XY=;
        b=XImk4+maJjBZ1VmtohHqZsKji+UC6fD91wnPGZMri63GvAt9Gmqz0Jfd8KEQHvh1ua
         OVLaHa05YEqgdYGA3diIbvW/2Z16Yf1cZCfMRCJpIN/3FR8S5FlxlM/0/BqJYgA6UA8p
         IA3dVHobbfw8ole7elUrLbI5qvj9EmoUJJuBIegVjusIF+B/U6hrNVy10YkZJa7xNR+g
         GhhdZ5dAaMqduPHSuEOLu+w8GgHTRgTcn2p3+5KUWCAXSDmYC+oErRYy6Nr7MGgH6qhH
         SpdmzwLF9u/8HB0d6REgyRhC1dIg3XnkUCeG3oI5ZOyga1ruthm20LikYd7DuNs2jMAQ
         /JAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789887696; x=1790492496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=npZKJCpy5rxuUhuCbItRrVGy+zKSXDH8vwHmzpQu0XY=;
        b=DTkU7okLvFHvhtLsNQeDcrvk7WcgPZ4DnqUceNHRKkpBZ0ufIkzMrlygzyUseuUYNI
         371omLeQi8YINWmpB8faK7Qp/NQZLlXKGVkrg4HaYmRhYgRCSl94iAOh4uFYwrl+du/d
         ssdqwlWHBckDW9FRWbMC3wJjT3ZjDbWCMfK4IUdU887Rg5fjddPISUpa3WqlMq7je0EX
         1265rDCJevCjzeXlW+JOSa2fRRhqJyUpv0YdOoyb8Y+KVDdDkVZkP4JhLmdIG6IBfp4N
         /7ccMhANqnZLygxNAyXqpSQ60AulldJipAFz+0zNA25hKS+ZKig/F756WFgO5QwJuAD5
         rpjA==
X-Forwarded-Encrypted: i=1; AKwUvByf91tFayCQ8osPMsissB+k2QjEndQzQ6/hgMXNzC0KHqiPq/Q442cIl5GhBCa10Bd2Ub3+fzt2pjdrN3o=@vger.kernel.org
X-Gm-Message-State: AFuF++mXqd/3116QWTv9a9KiVTbgTbTWcAZYiRBC06jEnJZZ1W/eYS/G
	AnNo+MaqafJZTarTBwwM+JxHYLnDqHfGnE13zXcwDVP3ib1RnHIw8TXh6Pkq0nniA3akAW4UFUz
	0YfeOw++PUz3RnNea0bQ5lpCa3nLqei0G8AqyFiEQnVGDne1gligbFHr2MnYFIZ/qmdQ=
X-Gm-Gg: AYBFou0dquAGrv9eso/GQxAauETH0DGRcZYDGEcDCVkpnZQV3ISDNeBsrCcGJYOZxu8
	RBDkKnctNzwERk5yORp+PyyvtOWoXr0pVW2wUCH/TjI8OWdMivDDWUk43A///KrTIW6Y4vwW3lj
	eSisOk2tfnlncLAROo13mGG8VtbZ1zy2S+MH/0NPDuZDKSkUrRexFT3mhWgrTmv/7n13SYQHVoH
	aeytXN/BG8u5cDqNgqYQ8ImvXVXupVFCn5LNj4kTLZwHricUBSaPKE0Azrqu74DWlSvR7KYuM0k
	dLkChZ12qHLnUXitnHSy9mFDL5xxaPOuQpbX3VfxBUU9g1AZlgp0qeY/tSmEu2v/iOdW0iXW4+J
	+uokljr9KoOlveiEbT9zOLewcdSz0MhDoH+rxSSXlezY=
X-Received: by 2002:a17:90b:4c8b:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39e35e4f387mr16248828a91.14.1789887695712;
        Sun, 20 Sep 2026 00:01:35 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8b:b0:381:10a3:8b10 with SMTP id 98e67ed59e1d1-39e35e4f387mr16248811a91.14.1789887695094;
        Sun, 20 Sep 2026 00:01:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm18493280c88.15.2026.09.20.00.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:01:34 -0700 (PDT)
Date: Sun, 20 Sep 2026 15:01:28 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] media: qcom: camss: csid: Add support for CSID 900
Message-ID: <aq-EyEd6wypQ_oYs@QCOM-aGQu4IUr3Y>
References: <20260915-nord-v1-0-20db41a7f1ff@oss.qualcomm.com>
 <20260915-nord-v1-2-20db41a7f1ff@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915-nord-v1-2-20db41a7f1ff@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=PaRqFShd c=1 sm=1 tr=0 ts=6aaf84d0 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=deu6gN5U2PgMeQFyV_0A:9 a=pWFi5VUBVkcJZyBm:21
 a=CjuIK1q_8ugA:10 a=O8hF6Hzn-FEA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDA5OSBTYWx0ZWRfX66ke5NwO0LoZ
 DIC9RICMKENJN64/9l/bfUm6MDTNqTRrWParoYaVY8KgTsTkZUhUnOPkIv7iwZz7QukYge5yPTv
 5ozuN/mLnC+FFHnMTc748ngOhXRKGXE=
X-Proofpoint-GUID: Rd4pyYPj0CPL5VJCJo9h77lVDJgRWXyp
X-Proofpoint-ORIG-GUID: Rd4pyYPj0CPL5VJCJo9h77lVDJgRWXyp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDA5OSBTYWx0ZWRfX/P1g4dXyHQVw
 HW6S9l1kxAc8CCG8wEFfEguwpbfaxTvTV/O5KyDvPeuqHrXCTZUVkb/3/BroG8JAoIxUqz0J21m
 l8UGRZilIQGoH0EDI9VwZ7lm6GI5SLp6sFK7Iz5tzinJKmNpAVjAXsbYl8GZw87mvwxtsBffs7e
 IfmMhy6DVNxICZyU7OEdIfrBl2AoTF6AmrZMXhEtz8+N83J+kSymzZ+vV4I+3oshO0KKU+ZnlbE
 kruw85SOZr2+FgnQirw9SgB+vVwlE5KgRe+IvqyssB9SJ1sKSCWVBJBXnzyDb8/mBJi8NUXaihQ
 0RWZUiWbaHxzYQ/6Pod5qrftzmVQrYyu1Mr3eEMlEY0lUIZRfYutY7koG0x9nw+9VIEEIPjl6jF
 LAOEVVidUTbDIC4g/Ko2anXcH6OhnqKvOBGqLEG6zuMJbgnwUVK9XtkH44mRdfzI6W312FlNovE
 2ssnq4d7Uzw6TBviMEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200099

On Tue, Sep 15, 2026 at 05:34:12PM +0800, Wenmeng Liu wrote:
> Add a CSID driver for the "900" revision on the Nord SoC. It shares the
> CSI-2 RX helpers and the split RUP/AUP command model of the gen3/980
> lineage, but uses a single register map for both the full and lite
> instances, so add a separate file rather than a variant of an existing
> CSID.
> 
> The write master buffers are enqueued to the CSID: for every enabled RDI
> an AUP_UPDATE is issued once per initial buffer, followed by a single
> RUP_UPDATE, matching the number of buffers handed to the write master
> when it is enabled.
> 
> Nord has 3 CSID and 10 CSID Lite instances, all driven by csid_ops_900.
> 
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/Makefile         |   1 +
>  drivers/media/platform/qcom/camss/camss-csid-900.c | 361 +++++++++++++++++++++
>  drivers/media/platform/qcom/camss/camss-csid.h     |   9 +-
>  3 files changed, 370 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
> index 27898b3cc7d3c8f275567f81f0952e2a0e18f189..ddda81b6a3ee141e0ed5bee61d5970a0d7ee6116 100644
> --- a/drivers/media/platform/qcom/camss/Makefile
> +++ b/drivers/media/platform/qcom/camss/Makefile
> @@ -8,6 +8,7 @@ qcom-camss-objs += \
>  		camss-csid-4-7.o \
>  		camss-csid-340.o \
>  		camss-csid-680.o \
> +		camss-csid-900.o \
>  		camss-csid-gen2.o \
>  		camss-csid-gen3.o \
>  		camss-csiphy.o \
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-900.c b/drivers/media/platform/qcom/camss/camss-csid-900.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..921ddb7aca37f449dae7b9e3a7b12e5a601c633c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/camss/camss-csid-900.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * camss-csid-900.c
> + *
> + * Qualcomm MSM Camera Subsystem - CSID (CSI Decoder) Module 900
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +#include <linux/completion.h>
> +#include <linux/delay.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include "camss.h"
> +#include "camss-csid.h"
> +#include "camss-csid-gen3.h"
> +
> +#define CSID_RST_CFG				0xC
> +#define		RST_MODE				BIT(0)
> +#define		RST_LOCATION				BIT(4)
> +
> +#define CSID_RST_CMD				0x10
> +#define		SELECT_HW_RST				BIT(0)
> +#define		SELECT_IRQ_RST				BIT(2)
> +#define CSID_IRQ_CMD				0x14
> +#define		IRQ_CMD_CLEAR				BIT(0)
> +
> +#define CSID_RUP_CMD				0x18
> +#define CSID_AUP_CMD				0x1C
> +#define		CSID_RUP_AUP_RDI(rdi)			(BIT(8) << (rdi))
> +#define CSID_RUP_AUP_CMD			0x20
> +#define		RUP_SET					BIT(0)
> +#define		MUP					BIT(4)
> +
> +#define CSID_TOP_IRQ_STATUS			0x84
> +#define CSID_TOP_IRQ_MASK			0x88
> +#define CSID_TOP_IRQ_CLEAR			0x8C
> +#define CSID_TOP_IRQ_SET			0x90
> +#define		INFO_RST_DONE				BIT(0)
> +#define		CSI2_RX_IRQ_STATUS			BIT(2)
> +#define		BUF_DONE_IRQ_STATUS			BIT(3)
> +
> +#define CSID_BUF_DONE_IRQ_STATUS		0xA4
> +#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET		16
> +#define CSID_BUF_DONE_IRQ_MASK			0xA8
> +#define CSID_BUF_DONE_IRQ_CLEAR			0xAC
> +#define CSID_BUF_DONE_IRQ_SET			0xB0
> +
> +#define CSID_CSI2_RX_IRQ_STATUS			0xB4
> +#define CSID_CSI2_RX_IRQ_MASK			0xB8
> +#define CSID_CSI2_RX_IRQ_CLEAR			0xBC
> +#define CSID_CSI2_RX_IRQ_SET			0xC0
> +
> +#define CSID_CSI2_RX_CFG0			0x400
> +#define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
> +#define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
> +#define		CSI2_RX_CFG0_PHY_NUM_SEL		20
> +#define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
> +#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
> +#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
> +#define CSID_CSI2_RX_CFG1			0x404
> +#define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
> +#define		CSI2_RX_CFG1_VC_MODE			BIT(2)
> +
> +#define MSM_CSID_MAX_SRC_STREAMS_900		(csid_is_lite(csid) ? 4 : 5)
> +
> +#define CSID_RDI_BASE				(csid_is_lite(csid) ? 0x600 : 0x1300)
> +#define CSID_RDI_CFG0(rdi)			(CSID_RDI_BASE + 0x0 + 0x200 * (rdi))
> +#define		RDI_CFG0_RETIME_DIS			BIT(5)
> +#define		RDI_CFG0_TIMESTAMP_EN			BIT(6)
> +#define		RDI_CFG0_TIMESTAMP_STB_SEL		BIT(8)
> +#define		RDI_CFG0_DECODE_FORMAT			12
> +#define		RDI_CFG0_DT				16
> +#define		RDI_CFG0_VC				22
> +#define		RDI_CFG0_EN				BIT(31)
> +
> +#define CSID_RDI_CTRL(rdi)			(CSID_RDI_BASE + 0x4 + 0x200 * (rdi))
> +#define		RDI_CTRL_START_CMD			BIT(0)
> +
> +#define CSID_RDI_CFG1(rdi)			(CSID_RDI_BASE + 0x10 + 0x200 * (rdi))
> +#define		RDI_CFG1_DROP_H_EN			BIT(5)
> +#define		RDI_CFG1_DROP_V_EN			BIT(6)
> +#define		RDI_CFG1_CROP_H_EN			BIT(7)
> +#define		RDI_CFG1_CROP_V_EN			BIT(8)
> +#define		RDI_CFG1_PACKING_FORMAT_MIPI		BIT(15)
> +
> +#define CSID_RDI_PIX_STORE_CFG0(rdi)		(CSID_RDI_BASE + 0x14 + 0x200 * (rdi))
> +#define		RDI_PIX_STORE_CFG0_EN			BIT(0)
> +#define		RDI_PIX_STORE_CFG0_MIN_HBI		1
> +
> +#define CSID_CSI2_RDIN_IRQ_STATUS(rdi)		(0x114 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_MASK(rdi)		(0x118 + 0x10 * (rdi))
> +#define CSID_CSI2_RDIN_IRQ_CLEAR(rdi)		(0x11C + 0x10 * (rdi))
> +#define		INFO_RUP_DONE				BIT(23)
> +
> +static void __csid_aup_rup_trigger(struct csid_device *csid)
> +{
> +	writel(RUP_SET, csid->base + CSID_RUP_AUP_CMD);
> +}
> +
> +static void __csid_aup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->aup_update |= CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->aup_update, csid->base + CSID_AUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_rup_update(struct csid_device *csid, int port_id)
> +{
> +	csid->rup_update |= CSID_RUP_AUP_RDI(port_id);
> +	writel(csid->rup_update, csid->base + CSID_RUP_CMD);
> +
> +	__csid_aup_rup_trigger(csid);
> +}
> +
> +static void __csid_aup_rup_clear(struct csid_device *csid, int port_id)
> +{
> +	/* Hardware clears the registers upon consuming the settings */
> +	csid->aup_update &= ~CSID_RUP_AUP_RDI(port_id);
> +	csid->rup_update &= ~CSID_RUP_AUP_RDI(port_id);
> +}
> +
> +static void __csid_configure_rx(struct csid_device *csid,
> +				struct csid_phy_config *phy)
> +{
> +	struct camss *camss = csid->camss;
> +	int val;
> +
> +	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
> +	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
> +
> +	if (camss->tpg && csid->tpg_linked &&
> +	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
> +		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
> +		val |= CSI2_RX_CFG0_TPG_MUX_EN;
> +	} else {
> +		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
> +		       << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	}
> +	writel(val, csid->base + CSID_CSI2_RX_CFG0);
> +
> +	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
> +	writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +}
> +
> +static void __csid_configure_rx_vc(struct csid_device *csid, int vc)
> +{
> +	int val;
> +
> +	if (vc > 3) {
> +		val = readl(csid->base + CSID_CSI2_RX_CFG1);
> +		val |= CSI2_RX_CFG1_VC_MODE;
> +		writel(val, csid->base + CSID_CSI2_RX_CFG1);
> +	}
> +}
> +
> +static void __csid_ctrl_rdi(struct csid_device *csid, int enable, u8 rdi)
> +{
> +	int val = 0;
> +	u32 rdi_ctrl_offset = CSID_RDI_CTRL(rdi);
> +
> +	if (enable)
> +		val = RDI_CTRL_START_CMD;
> +
> +	writel(val, csid->base + rdi_ctrl_offset);
> +}
> +
> +static void __csid_configure_rdi_pix_store(struct csid_device *csid, u8 rdi)
> +{
> +	u32 val;
> +
> +	/*
> +	 * Configure pixel store to allow absorption of hblanking or idle time.
> +	 * This helps with horizontal crop and prevents line buffer conflicts.
> +	 * Reset state is 0x8 which has MIN_HBI=4, we keep the default MIN_HBI
> +	 * and just enable the pixel store functionality.
> +	 */
> +	val = (4 << RDI_PIX_STORE_CFG0_MIN_HBI) | RDI_PIX_STORE_CFG0_EN;
> +	writel(val, csid->base + CSID_RDI_PIX_STORE_CFG0(rdi));
> +}
> +
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)

I see that gen3 function sets up DT_ID, but it's omitted here, so two
RDIs on the same CSID/VC map to the same CID? Latent only because the
TPG topology happens to use one VC per RDI?

> +{
> +	u32 val;
> +	u8 lane_cnt = csid->phy.lane_cnt;
> +
> +	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
> +	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
> +	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
> +								   csid->res->formats->nformats,
> +								   input_format->code);
> +
> +	if (!lane_cnt)
> +		lane_cnt = 4;

lane_cnt seems used nohere.

> +
> +	u32 rdi_cfg0_offset = CSID_RDI_CFG0(port);
> +	u32 rdi_cfg1_offset = CSID_RDI_CFG1(port);
> +	u32 rdi_ctrl_offset = CSID_RDI_CTRL(port);

Declarations after statements.

> +
> +	val = RDI_CFG0_TIMESTAMP_EN;
> +	val |= RDI_CFG0_TIMESTAMP_STB_SEL;
> +	val |= RDI_CFG0_RETIME_DIS;
> +
> +	/* note: for non-RDI path, this should be format->decode_format */
> +	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
> +	val |= vc << RDI_CFG0_VC;
> +	val |= format->data_type << RDI_CFG0_DT;
> +	writel(val, csid->base + rdi_cfg0_offset);
> +
> +	val = RDI_CFG1_PACKING_FORMAT_MIPI;
> +	writel(val, csid->base + rdi_cfg1_offset);
> +
> +	if (!csid_is_lite(csid))
> +		__csid_configure_rdi_pix_store(csid, port);
> +
> +	val = 0;
> +	writel(val, csid->base + rdi_ctrl_offset);
> +
> +	val = readl(csid->base + rdi_cfg0_offset);
> +
> +	if (enable)
> +		val |= RDI_CFG0_EN;
> +
> +	writel(val, csid->base + rdi_cfg0_offset);
> +}
> +
> +static void csid_configure_stream(struct csid_device *csid, u8 enable)
> +{
> +	u8 i, k;
> +
> +	__csid_configure_rx(csid, &csid->phy);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_900; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			__csid_configure_rdi_stream(csid, enable, i, 0);
> +			__csid_configure_rx_vc(csid, 0);
> +
> +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++)
> +				__csid_aup_update(csid, i);
> +
> +			__csid_rup_update(csid, i);
> +
> +			__csid_ctrl_rdi(csid, enable, i);
> +		}
> +	}
> +}
> +
> +static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
> +{
> +	return 0;
> +}
> +
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id,
> +				   bool clear)
> +{
> +	if (clear)
> +		__csid_aup_rup_clear(csid, port_id);
> +	else
> +		__csid_aup_update(csid, port_id);
> +}
> +
> +static irqreturn_t csid_isr(int irq, void *dev)
> +{
> +	struct csid_device *csid = dev;
> +	u32 val, buf_done_val;
> +	u8 reset_done;
> +	int i;
> +
> +	val = readl(csid->base + CSID_TOP_IRQ_STATUS);
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +
> +	reset_done = val & INFO_RST_DONE;
> +
> +	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
> +	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_900; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
> +			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
> +
> +			if (val & INFO_RUP_DONE)
> +				csid_subdev_reg_update(csid, i, true);
> +
> +			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i))
> +				camss_buf_done(csid->camss, csid->id, i);
> +		}
> +	}
> +
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	if (reset_done)
> +		complete(&csid->reset_complete);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int csid_reset(struct csid_device *csid)
> +{
> +	unsigned long time;
> +	u32 val;
> +	int i;
> +
> +	reinit_completion(&csid->reset_complete);
> +
> +	val = INFO_RST_DONE | BUF_DONE_IRQ_STATUS;
> +	writel(val, csid->base + CSID_TOP_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_TOP_IRQ_MASK);
> +
> +	val = 0;
> +	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS_900; i++) {
> +		if (csid->phy.en_vc & BIT(i)) {
> +			/*
> +			 * Only need to clear buf done IRQ status here,
> +			 * RUP done IRQ status will be cleared once isr
> +			 * strobe generated by CSID_RST_CMD
> +			 */
> +			val |= BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
> +		}
> +	}
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
> +	writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
> +
> +	val = IRQ_CMD_CLEAR;
> +	writel(val, csid->base + CSID_IRQ_CMD);
> +
> +	val = RST_LOCATION | RST_MODE;
> +	writel(val, csid->base + CSID_RST_CFG);
> +
> +	val = SELECT_HW_RST | SELECT_IRQ_RST;
> +	writel(val, csid->base + CSID_RST_CMD);
> +
> +	time = wait_for_completion_timeout(&csid->reset_complete,
> +					   msecs_to_jiffies(CSID_RESET_TIMEOUT_MS));
> +
> +	if (!time) {
> +		dev_err(csid->camss->dev, "CSID reset timeout\n");
> +		return -EIO;
> +	}
> +
> +	return 0;
> +}
> +
> +static void csid_subdev_init(struct csid_device *csid)
> +{
> +	csid->testgen.nmodes = CSID_PAYLOAD_MODE_DISABLED;
> +}
> +
> +const struct csid_hw_ops csid_ops_900 = {
> +	.configure_stream = csid_configure_stream,
> +	.configure_testgen_pattern = csid_configure_testgen_pattern,
> +	.hw_version = csid_hw_version,
> +	.isr = csid_isr,
> +	.reset = csid_reset,
> +	.src_pad_code = csid_src_pad_code,
> +	.subdev_init = csid_subdev_init,
> +	.reg_update = csid_subdev_reg_update,
> +};
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
> index 5296b10f6bac839a3faa1039bdbf0fbbbe9456ac..0c8933d564b495403d4f8b1949049ff53568c8df 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -154,7 +154,13 @@ struct csid_device {
>  	void __iomem *base;
>  	u32 irq;
>  	char irq_name[30];
> -	u32 reg_update;
> +	union {
> +		u32 reg_update;
> +		struct {
> +			u32 rup_update;
> +			u32 aup_update;
> +		};
> +	};

The anonymous union looks confusing. As reg_update aliases rup_update,
can we just rename the field reg_update to rup_update everywhere and add
aup_update as a plain member?

Shawn

>  	struct camss_clock *clock;
>  	int nclocks;
>  	struct regulator_bulk_data *supplies;
> @@ -216,6 +222,7 @@ extern const struct csid_hw_ops csid_ops_4_1;
>  extern const struct csid_hw_ops csid_ops_4_7;
>  extern const struct csid_hw_ops csid_ops_340;
>  extern const struct csid_hw_ops csid_ops_680;
> +extern const struct csid_hw_ops csid_ops_900;
>  extern const struct csid_hw_ops csid_ops_gen2;
>  extern const struct csid_hw_ops csid_ops_gen3;
>  
> 
> -- 
> 2.34.1
> 
> 
