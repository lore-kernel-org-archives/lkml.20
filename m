Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DD140DFD7
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792144802; cv=none; b=qiL38cHyETTZzo3PPgFMcTMIux+MXSUBpBt0hH1Bn7M6sGmXa42qizLRaFUhEmWa1s/dERhJPglP6QhoURNFn26X3epCa80XpmoSugGKlFELmoU3ERmpXycsp0gAyD2/xVhLUqCSEOug+bCKbjCpsLFgEJsfFILyHnhUZh+80V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792144802; c=relaxed/simple;
	bh=rXCLBIN/jE1YH/Q/y/dgrhfYI32CL1Fy8UParFypB9w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kg1hFaQzvkoSf/4KRs+8M5JYDvjOcW+v3QiKwH/d8DxW+Vxn7iKYcy+svOnZmKaRPjNOFPtQLYFWgRaFJMZ7EcSG5zSDzqwJJX9dnTFH8TKvufHNwAL91KBN9WBawQqrRpvBKvpmLoc4kHqoRVFIWiOXauFCPX+JOihRok0iUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwIEQUnd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hxl1jkq0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwIEQUnd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hxl1jkq0"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lDXA1761516
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCBtKsqjRdy4AFeNQbbx89vRA+gRim6cHkNiJULnRHE=; b=fwIEQUndRotjF0tW
	rMX8AFED8hQmKDRV+lqCMEpMMZCaKMSRy2Afwkyga2TpbKca4/l5btbcatBzyeWp
	tsf96A92qNjwVVf70LRYC/P1vdXnVROn6VA5NXHF7oXgjeDFVMSJRP3soNRqnil5
	32AsWAFtklvA7WTOKCVjFE2tUeHjT2cQ1ipDjkoDzEfpRsr1IeBEqQhl3ZJtHBfi
	O4loerINpsRyhrtUONaKVkz3lJR/wA8SVyDLTFRNvWrudp/zY+7dyYC2WGef4Tsy
	VbCePEoH7qwYDB3bMU1/2/k/nQ8ksEwt3SXM2jCCNFU2At5vT+a3ejRkZEReIrt/
	iJRiXw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbg5yrdu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:59:56 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd3b9e70f88so3642057a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792144796; x=1792749596; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FCBtKsqjRdy4AFeNQbbx89vRA+gRim6cHkNiJULnRHE=;
        b=Hxl1jkq0UfLXm7OncJicHYjydkdJsfI9FApfV6CwxPoilVpJg7VOmKqMFQWFl579Hc
         aPcJQ3ycoejdn+29psGyb8SyzmpGPfEaTIqn7g0MKmyfViyKd/JVL2tgwcEOWEA6Gecw
         L3dZUxLfs8yd3cnZlgBnhIvSowWRk/eFwnGy3rBrxgDXEJ9RKI3qPy84z4uzMg+nF6tc
         S4bbSY7DVvQXYlSoh/u4N72M2BqIMeRDlvQKweqI1Z3VqV/4HZX4jvnrJnsHBfhZyd6X
         eMl74opTG+D3JUFx/ZHQavuN2MUlVMffzLW7c7F//wb3o+t1tZKTRBTay7dwwvpOydQk
         eH7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792144796; x=1792749596;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FCBtKsqjRdy4AFeNQbbx89vRA+gRim6cHkNiJULnRHE=;
        b=HMijKBjUxq+s/9PWIukNn4LE6ZO6C8Gp3p/eHY1SZqklY1iYiK7kvfkGcy0bmsmLOH
         rDiIxjIOfNsp92e6smJoJ7iYby7FkRyiQDnrla0w7cYTQDg51HhN0Wv0rT8NcCHgShMo
         kAssKMWycDPBDUNMILwl0Tw4ttrQZgPnMeDFtvgHHYfrGVyFlJjOq7bOS3qoVf8dA8Ne
         8CWg5IqOD49VmwnVQQRCCXKpCj+L30cJbw1cmrJbd8j8hmZxjuW2WU5fh32rFnakOrVE
         mNpahYL6wqOCv2/p2jQmQX2dAynSJRXzJfs5CsUXTcbqzpEjZj1N55GQgkNRLJUmmGrm
         RYwg==
X-Forwarded-Encrypted: i=1; AKwUvBx/Nm/clZ3r/oN5sPVo5tQq7c7M0A2qwi3nTMQnzuQIYwarO+DdfOxZzRAfk4A3owa4w9YKcJcbVshoi9g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKyLeu/UVKjuQijjdEvWReX4PSDotLcFcIKZ+pbB2jRVGsmUDsu
	Obp2cOoiFvY9XQ8BNKiprAsllDuLEBJAJKaPr+ykC8FvH8xPL079iPQCRZZiGH7kvIuVLM6hYxb
	83VBArCRzsGxWp/lJcfk+W5wPdlT48UxTKOeIAgYgXASRVIuHb4lU+E245sscZZZXezI=
X-Gm-Gg: AYBFou27uMrsaB1FNfzMUUP1JxIGwaIp8xT3BYPlsL9ggNUwUvl4Klku/pO4HEGD/j/
	w1kbGl+n4f08sQJwsTe579/BHugFrywTPyCO6NdmcQMVFMB/aLFXh4vZNy7K6d64w4fi2t+nFG0
	Yt+RgGaUuXIyUFcHIqDPjN68md+C9m1aU/xYVvJNTNUqf5iLGlSXDjfuXlT0n89zYYdzUuuXQiR
	R11NVI/SXFT4U4tVXfJcN0hHRRBBFjv8v3XrGMzYLj44QQwVt3BXaCm6xhsZDkCdNezHWw8snMv
	6LKGBXkDLjnwje5VHGT3kJ1F4WHszNGceIuy74LpCkzFqDM4klPAAAWAkbj0lNyc0LS24VGVaNX
	9jkW2yspDnZsn6f11St/5GLx+99w=
X-Received: by 2002:a05:6a21:1f8d:b0:3dd:a197:ede6 with SMTP id adf61e73a8af0-3e1d0694e15mr9348331637.53.1792144795580;
        Fri, 16 Oct 2026 02:59:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f8d:b0:3dd:a197:ede6 with SMTP id adf61e73a8af0-3e1d0694e15mr9348312637.53.1792144795020;
        Fri, 16 Oct 2026 02:59:55 -0700 (PDT)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549db75asm831808a12.18.2026.10.16.02.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 02:59:54 -0700 (PDT)
Message-ID: <bd13910e-ddcd-45a5-a7ce-7e6e74290955@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:29:48 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/4] phy: qcom-mipi-csi2: Add C-PHY support for
 X1E80100
To: geocausa@gmail.com, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vikram Sharma
 <vikram.sharma@oss.qualcomm.com>,
        Suresh Vankadara <svankada@qti.qualcomm.com>, tjose@qti.qualcomm.com
References: <20261015-x1e-cphy-rfc-v1-0-1f3fa9af940a@gmail.com>
 <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <20261015-x1e-cphy-rfc-v1-2-1f3fa9af940a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AVNff6dZo54vZ6-AkrksOharZ4pH3qm4
X-Authority-Analysis: v=2.4 cv=M+HYuCws c=1 sm=1 tr=0 ts=6ad1f59c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=IZGhc8DrnXKEOGi_IpoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX+txFnRbfZLTT
 /3b/vfMfOVHJscVZGgoiId7JOqNnlovn48DsITvH9gZ6nBOZ73LpTKudMgkls9XluEsdizS13PX
 6TxMHUDhdLt6Is33bzLuE8Ki3T/s0O8=
X-Proofpoint-GUID: AVNff6dZo54vZ6-AkrksOharZ4pH3qm4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzOSBTYWx0ZWRfX/2j6vYBHv6Wj
 R/G1sVhYYBqi6aST6xYce/M/cXKYLRkQhD3x+Op7Cf6YO8sIotU9hk5gmmqUnqInGC/FqINkB41
 nyyO4xeqd9T1nmPsLya3KyvZwxbw32Z+iRVNh8BZcRxGz9wdlYRIfdkh9xY6JSHgln8BTGPS8dZ
 qaKJdeb9d93lzFW9U5Ruw62h4IwElccUZqihOVVJ0pG7RYBS1pEm7b31k8bHfMn03q3kyEvTw3S
 JyDw7zzUx7qjKk2B0N5xpfiQv9luwu1wInWlIOpV64sp9sx+fDfKNwkcwxYUYfbhoJiF3XoCj5C
 SvKcuxrcLguanY9N2XB31W8EIZM+HzyjSmJtYhtKtovt4wwJVivZSiMnUi3Q48Xzu3CWHrWGb3a
 UPf/KFpODBQJxo4aOHS91JUwyq//RhHsgNhxr3tKdivY9Rr/TLHiQp1Ry476o1t6R8ITvdk3W3t
 e9sWwP62CJ26z7eOutQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160039



On 16-10-2026 03:50, George Neacsu via B4 Relay wrote:
> From: George Neacsu <geocausa@gmail.com>
> 
> The CSI2 PHY schema already allows bus-type C-PHY, but the driver
> rejects it. Accept it on SoCs that provide a C-PHY sequence: up to three
> trios and no lane polarities, and set_mode() has to ask for the mode the
> endpoint describes. In C-PHY mode, configure() takes the symbol rate.
> lanes_enable() powers up the trios on the odd CTRL5 bits and writes the
> C-PHY sequence, which carries its own timing, so no settle count is
> computed.
> 
> The X1E80100 sequence is Qualcomm's for the v2.1.2 3PH PHY at 2.5 Gsps,
> taken from the downstream camera driver's GPL-2.0
> cam_csiphy_2_1_2_hwreg.h (csiphy_3ph_v2_1_2_reg, datarate_212_2p5Gsps
> and the 3PH reset exit), as the D-PHY sequence above it is.
> 
> Tested on the Surface Pro 11 (X1E80100) with an IMX681 on CSIPHY2, one
> trio at 2.4 Gsym/s, and raw capture through CSID1 and an RDI interface:
> 3844x2640 at 30.01 fps, and the sensor's colour bars are byte-identical
> to the same pattern captured with an out-of-tree driver. D-PHY is
> unchanged: an OV13858 on CSIPHY1 over four lanes streams at 29.9 fps.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: George Neacsu <geocausa@gmail.com>
Hi George,

Thanks for working on this. I also have local C-PHY enablement patches, so it
is good to see this being discussed upstream.

The overall direction looks reasonable to me, especially adding a generic
PHY_MODE_MIPI_CPHY and letting CAMSS request C-PHY through the PHY API.

> ---
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 151 ++++++++++++++++++++-
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  49 ++++++-
>  drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |   4 +
>  3 files changed, 197 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> index 966d79c98..e758b6755 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
> @@ -6,6 +6,7 @@
>   * Copyright (C) 2016-2026 Linaro Ltd.
>   */
>  
> +#include <dt-bindings/media/video-interfaces.h>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> @@ -161,6 +162,131 @@ mipi_csi2phy_lane_regs lane_regs_x1e80100[] = {
>  	{.reg_addr = 0x0c64, .reg_data = 0x7f, .param_type = CSIPHY_SKEW_CAL},
>  };
>
> +/*
> + * 4nm 3PH v2.1.2 C-PHY, 2.5 Gsps, from Qualcomm's GPL-2.0 camera driver
> + * (cam_csiphy_2_1_2_hwreg.h: csiphy_3ph_v2_1_2_reg[], datarate_212_2p5Gsps[]
> + * and the 3PH reset-exit write), one trio block per lane triplet.
> + */
> +static const struct
> +mipi_csi2phy_lane_regs lane_regs_x1e80100_cphy[] = {
This table is C-PHY specific, but it is being added to
phy-qcom-mipi-csi2-3ph-dphy.c

Bryan, do you have any preference on how to organize this? Should we keep both
D-PHY and C-PHY sequences here for now, or move the larger C-PHY register
tables to a separate hwreg/table file?
> +	/* Power up lanes 3ph mode */
> +	{.reg_addr = 0x101c, .reg_data = 0x7a, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x1018, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* datarate_212_2p5Gsps: AFE settings */
> +	{.reg_addr = 0x0268, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0294, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},

> +	{.reg_addr = 0x0668, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0694, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
...
> +	{.reg_addr = 0x0a68, .reg_data = 0xf1, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a94, .reg_data = 0x01, .param_type = CSIPHY_DEFAULT_PARAMS},
...> +	/* csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x02f4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
...> +	{.reg_addr = 0x06f4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x06f8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
...
> +	{.reg_addr = 0x0af4, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0af8, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
...> +	/* datarate_212_2p5Gsps, then csiphy_3ph_v2_1_2_reg */
> +	{.reg_addr = 0x020c, .reg_data = 0x22, .param_type = CSIPHY_DEFAULT_PARAMS},

Could we add blank lines between the repeated per-trio register blocks here?

The table would be easier to review if the `0x02*`, `0x06*`, and `0x0a*`
blocks were visually separated, similar to how the D-PHY table separates the
per-lane register groups. It would also make comparison with the downstream
source simpler.

> +	{.reg_addr = 0x0a84, .reg_data = 0x00, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	{.reg_addr = 0x0a90, .reg_data = 0x02, .param_type = CSIPHY_DEFAULT_PARAMS},
> +	/* csiphy_reset_exit_reg_2_1_2, 3PH */
> +	{.reg_addr = 0x1000, .reg_data = 0x0e, .delay_us = 3048,
Any specific reason for this much delay?

> +	 .param_type = CSIPHY_DEFAULT_PARAMS},
> +};
> +
For this C-PHY table, I do not see a CSIPHY_SETTLE_CNT_LOWER_BYTE entry.
Is the settle timing already encoded in one of the fixed register values in
lane_regs_x1e80100_cphy[]?

If yes, which register corresponds to the C-PHY settle/timing value?

Also, is that value specific to the 2.5 Gsps table? My understanding is that
the settle count calculation would be data-rate specific, based on the C-PHY
symbol rate per trio.

>  static inline const struct mipi_csi2phy_device_regs *
>  csi2phy_dev_to_regs(struct mipi_csi2phy_device *csi2phy)
>  {
> @@ -246,8 +372,11 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
>  				     u8 settle_cnt)
>  {
>  	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
> -	const struct mipi_csi2phy_lane_regs *r = regs->init_seq;
> -	int i, array_size = regs->lane_array_size;
> +	const bool cphy = csi2phy->bus_type == MEDIA_BUS_TYPE_CSI2_CPHY;
> +	const struct mipi_csi2phy_lane_regs *r = cphy ? regs->cphy_init_seq :
> +								regs->init_seq;
> +	int i, array_size = cphy ? regs->cphy_lane_array_size :
> +				   regs->lane_array_size;
>  	u32 val;
>  
>  	for (i = 0; i < array_size; i++, r++) {
> @@ -273,13 +402,26 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>  {
>  	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
>  	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
> -	u8 settle_cnt;
> +	const bool cphy = csi2phy->bus_type == MEDIA_BUS_TYPE_CSI2_CPHY;
Could we avoid carrying a separate parsed `bus_type` and derive the PHY type from 
the PHY layer state instead?
> +	u8 settle_cnt = 0;
>  	u8 val;
>  	int i;
>  
>  	if (cfg->link_freq <= 0)
>  		return -EINVAL;
>  
> +	if (cphy) {
> +		/* The C-PHY sequence carries its own timing; trios are the odd bits. */
> +		val = 0;
> +		for (i = 0; i < cfg->num_data_lanes; i++)
> +			val |= BIT(lane_cfg->data[i].pos * 2 + 1);
> +
> +		writel(val, csi2phy->base +
> +		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
> +
> +		goto common;
> +	}
The C-PHY and D-PHY lane-mask calculation could be combined into a helper to
avoid open-coding the C-PHY path separately.

Something like this:
static u8 csiphy_get_lane_mask(struct mipi_csi2phy_lanes_cfg *lane_cfg)
{
	u8 lane_mask = 0;
	u8 offset = 0;

	switch (lane_cfg->phy_cfg) {
		case V4L2_MBUS_CSI2_CPHY:
			offset = 1;
			break;
		case V4L2_MBUS_CSI2_DPHY:
			lane_mask = BIT(lane_cfg->clk.pos);
			break;
		default:
			break;
	}

	/*
	 * CSI_COMMON_CTRL5 is a physical lane power-up bitmap:
	 * - Bits [0,2,4,6] → D-PHY data lanes(LN0, LN2, LN4, LN6)
	 * - Bits [1,3,5] → C-PHY trio lanes(LN1, LN3, LN5)
	 * - Bit [7] → D-PHY clock lane(LNCK) dedicated clock enable
	 */
	for (int i = 0; i < lane_cfg->num_data; i++)
		lane_mask |= BIT((lane_cfg->data[i].pos * 2) + offset);

	return lane_mask;
}

> +
>  	settle_cnt = phy_qcom_mipi_csi2_settle_cnt_calc(cfg->link_freq, csi2phy->timer_clk_rate);
>  	if (!settle_cnt)
>  		return -ENODEV;
> @@ -309,6 +451,7 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
>  	if (lane_cfg->clk.pol)
>  		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
>  
> +common:
>  	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>  	writel(val, csi2phy->base +
>  	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 6));
> @@ -374,6 +517,8 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
>  	.reg_info = {
>  		.init_seq = lane_regs_x1e80100,
>  		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
> +		.cphy_init_seq = lane_regs_x1e80100_cphy,
> +		.cphy_lane_array_size = ARRAY_SIZE(lane_regs_x1e80100_cphy),
>  		.common_regs_offset = 0x1000,
>  	},
>  	.supply_names = (const char **)x1e_supplies,
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> index c0a4fa20e..892c3da55 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
> @@ -104,6 +104,19 @@ static int phy_qcom_mipi_csi2_configure(struct phy *phy,
>  	struct mipi_csi2phy_stream_cfg *stream_cfg = &csi2phy->stream_cfg;
>  	int ret;
>  
> +	if (csi2phy->phy_mode == PHY_MODE_MIPI_CPHY) {
> +		struct phy_configure_opts_mipi_cphy *cphy_cfg = &opts->mipi_cphy;
> +
> +		if (!cphy_cfg->symbol_rate ||
> +		    cphy_cfg->lanes != stream_cfg->num_data_lanes)
> +			return -EINVAL;
> +
> +		/* As for V4L2, a C-PHY link frequency is half the symbol rate. */
> +		stream_cfg->link_freq = cphy_cfg->symbol_rate / 2;
> +
> +		return 0;
> +	}
> +
>  	ret = phy_mipi_dphy_config_validate(dphy_cfg);
>  	if (ret)
>  		return ret;
> @@ -124,8 +137,19 @@ static int phy_qcom_mipi_csi2_set_mode(struct phy *phy,
>  {
>  	struct mipi_csi2phy_device *csi2phy = phy_get_drvdata(phy);
>  
> -	if (mode != PHY_MODE_MIPI_DPHY)
> +	/* The mode has to be the bus the endpoint describes. */
> +	switch (mode) {
> +	case PHY_MODE_MIPI_DPHY:
> +		if (csi2phy->bus_type != MEDIA_BUS_TYPE_CSI2_DPHY)
> +			return -EINVAL;
> +		break;
> +	case PHY_MODE_MIPI_CPHY:
> +		if (csi2phy->bus_type != MEDIA_BUS_TYPE_CSI2_CPHY)
> +			return -EINVAL;
> +		break;
> +	default:
>  		return -EOPNOTSUPP;
> +	}
>  
>  	csi2phy->phy_mode = mode;
>  	return 0;
> @@ -258,6 +282,7 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>  	struct fwnode_handle *ep;
>  	int num_polarities;
>  	int num_data_lanes;
> +	int max_lanes;
>  	u32 bus_type;
>  	int i, ret;
>  
> @@ -278,14 +303,25 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>  	bus_type = MEDIA_BUS_TYPE_CSI2_DPHY;
>  	fwnode_property_read_u32(ep, "bus-type", &bus_type);
>  
> -	if (bus_type != MEDIA_BUS_TYPE_CSI2_DPHY) {
> +	switch (bus_type) {
> +	case MEDIA_BUS_TYPE_CSI2_DPHY:
> +		max_lanes = CSI2_MAX_DATA_LANES;
> +		break;
> +	case MEDIA_BUS_TYPE_CSI2_CPHY:
> +		if (csi2phy->soc_cfg->reg_info.cphy_init_seq) {
> +			max_lanes = CSI2_MAX_TRIOS;
> +			break;
> +		}
> +		fallthrough;
> +	default:
>  		ret = -EOPNOTSUPP;
>  		dev_err(dev, "Unsupported bus-type %u\n", bus_type);
>  		goto out_put;
>  	}
> +	csi2phy->bus_type = bus_type;
>  
>  	num_data_lanes = fwnode_property_count_u32(ep, "data-lanes");
> -	if (num_data_lanes < 1 || num_data_lanes > CSI2_MAX_DATA_LANES) {
> +	if (num_data_lanes < 1 || num_data_lanes > max_lanes) {
>  		ret = -EINVAL;
>  		dev_err(dev, "Invalid data-lanes count: %d\n", num_data_lanes);
>  		goto out_put;
> @@ -302,6 +338,11 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>  	/* lane-polarities: optional, up to num_data_lanes + 1 entries */
>  	memset(lane_polarities, 0x00, sizeof(lane_polarities));
>  	num_polarities = fwnode_property_count_u32(ep, "lane-polarities");
> +	if (num_polarities > 0 && bus_type == MEDIA_BUS_TYPE_CSI2_CPHY) {
> +		ret = -EINVAL;
> +		dev_err(dev, "lane-polarities do not apply to C-PHY\n");
> +		goto out_put;
> +	}
>  	if (num_polarities > 0) {
>  		if (num_polarities != stream_cfg->num_data_lanes + 1) {
>  			ret = -EINVAL;
> @@ -322,7 +363,7 @@ static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
>  	csi2phy->stream_cfg.lane_cfg.clk.pol = lane_polarities[0];
>  
>  	for (i = 0; i < csi2phy->stream_cfg.num_data_lanes; i++) {
> -		if (data_lanes[i] < 1 || data_lanes[i] > CSI2_MAX_DATA_LANES) {
> +		if (data_lanes[i] < 1 || data_lanes[i] > max_lanes) {
>  			dev_err(dev, "Invalid lane %d\n", data_lanes[i]);
>  			ret = -EINVAL;
>  			goto out_put;
> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> index 7e55ae007..442c4d6fe 100644
> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
> @@ -11,6 +11,7 @@
>  #include <linux/phy/phy.h>
>  
>  #define CSI2_MAX_DATA_LANES	4
> +#define CSI2_MAX_TRIOS		3
>  #define CSI2_DEFAULT_CLK_LANE	7
>  
>  struct mipi_csi2phy_lane {
> @@ -50,6 +51,8 @@ struct mipi_csi2phy_lane_regs {
>  struct mipi_csi2phy_device_regs {
>  	const struct mipi_csi2phy_lane_regs *init_seq;
>  	const int lane_array_size;
> +	const struct mipi_csi2phy_lane_regs *cphy_init_seq;
> +	const int cphy_lane_array_size;
This gives us a single C-PHY register sequence for the SoC. Do we expect this
to be enough long term?

The X1E80100 table being added here is for 2.5 Gsps, but C-PHY timing/settings
can be data-rate specific. Should we extend this structure now to support
multiple C-PHY rate settings, similar to selecting a table by symbol rate, or
is it better to keep this simple for this series and handle per-rate tables
as a follow-up?

Bryan, do you have a preference on that?

>  	const u32 common_regs_offset;
>  };
>  
> @@ -75,6 +78,7 @@ struct mipi_csi2phy_soc_cfg {
>  struct mipi_csi2phy_device {
>  	struct device *dev;
>  	u8 phy_mode;
> +	u32 bus_type;
>  
>  	struct phy *phy;
>  	void __iomem *base;
> 

-- 
Regards,
Nihal Kumar Gupta

