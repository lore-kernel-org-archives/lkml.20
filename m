Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83456449992
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787919305; cv=none; b=VHzrXLKTLraJeCefABKpZZ95NppwQw0YYgYr3As+05oe0VFtejwvtYpBbQHBZwvCbHjoRtLu4vCR1x9WvLTRsbKGmM4NuyH34LO4gWuf0TwB5pgklN3e28/9xg5loUVafSat/6WIdBnGGBcxffZ/JEyMrx6p39SUzKNsVvxM0dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787919305; c=relaxed/simple;
	bh=4K/ktbnFtXxUOiRHBzpkXjxxs9uGRvk5jen0jEuoCt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KsHGVmIHGVsmjhJzpnNX9iSx/JFSSvjhsHW990mgLcLxrnAJv3hsOe0qm2jRHY8mEHo/JJT29bn4v4BQe0hHxBarhKTxllJMyhRdKmcb/rYjApWZyUFwgjpUS7S4dTJkFgtwbidGRo8rZhG/8BBMsabRGp0rEnReL2JR31J/YUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bDVUqtO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfNGPdZ8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bDVUqtO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfNGPdZ8"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7RG52061305
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:14:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xH52WhtMhlm9EBJU0K2TWO5ErvgRLEO02V2yZlYd28w=; b=bDVUqtO9YBGTJi5T
	2JSarYqcIOAT+XIQ1SwdDfqpcMPbg0/WXY/ptB4WfMZ74bUOuzTKIaydxkxyXnM+
	valspoeotA50tTTUfi1nEfGgFzFgcfbCuZUxALvBbhm94XJf6BVAUE4dXC++MO0C
	QqgWFzhz5PfmV/Twk64zTBOyzBNwMh8vdUjRYdx4GoTvcMjjTUczkDsDCarjMvmY
	undo7pHT5mSZk1AXIC3bufnyofABZrz8KmdT4BElntX2FPoHZRjGc1nwZlYkWHva
	LAZ1AURINuqIcAecMuEufHoDvUriHQ4XkLgQjv0HBfPDAUag9qwOWhK6P/787cKg
	znPzKA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mu9n4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 12:14:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c9d953b71so1801451cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 05:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787919283; x=1788524083; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xH52WhtMhlm9EBJU0K2TWO5ErvgRLEO02V2yZlYd28w=;
        b=RfNGPdZ8zV/3znjNzqNbztiFdCwJsWLhkLwIfozfS1vRvomnJupD9QQg0gAGn2GEhg
         Hr0Y1QISCgAQxHBNImXOxhRB+B0+qH4eEKD+0XJghI1VHPY4cboClVdvrRA9oXrtV2x/
         vdxTwNb4DiP10KXV0nxkn8wKOpVvgSolRjMQf93OR8dSHBWRuVhXUqBW3Q7qdNJoiPKW
         Ih+Tpr1Ha/H8FjQbl5L7B48wTXilQH00oPQc3OQlUdIDqkKrpbyRm5bEjFhsUw0uRlub
         DkMRc634a7esEr9abKTml15YtPWUo+v4UG0q5hT5se5Tggs9si4PqcfBmEg3wHUTIa9R
         B70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787919283; x=1788524083;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xH52WhtMhlm9EBJU0K2TWO5ErvgRLEO02V2yZlYd28w=;
        b=cvyr9cCWa1MszoiLJJYSsBuhNvpO7a6NML6jh1pnm+/u4hCWISXcuE/M2scpENHr+O
         wN/M2mT23HOdZXY/f4yYgiBSCe3X9fJl/MwkeVRotr/bMp1OHAw+Xov4YkeTw+WN4tk0
         Gnend9dgvUacznyqT5Ir12jvUCaKp3eH7MBIg5wee9/1OuHJsVNquKRZnhDnnRg+xhAX
         8wcGiu00rPrVkA0Yckh9cRMib1DkQU2UCcywUgLxIXKzMMkb2PsjeeIq9VyXiGsNSjKS
         s7p1Q2Enzs69WTLj9gFJIS87qBm6a+zvpfx4bJAkI5jLmFCPoSKIx8XGf3RQNt7zkw+q
         rhYg==
X-Forwarded-Encrypted: i=1; AHgh+RpL7gXQP7H/+heC63X2Apunqu0kgjvfHKXk7ooRvUAc1Qcvl2ZIWPLCJ9Q0l+bfjuDtdGyNrxy1WhCbSjc=@vger.kernel.org
X-Gm-Message-State: AFuF++l05dsedntUrxSfl8W978fURm8Io0bfmhXPkp4J3UtiwAZvN6IE
	hnISjI3ISbfn7ioknUMYFP7RYhPz9llCwkL/YnMXhCDj/H/GZgF4UO+cKwmN9mi++W03tQAzxzE
	2a/lCEG+VfEgCkTeGv5l+/N2q4arugn3+TQMESEk82DgmNX4JwRRVkQE5NYFR57Ue0C4=
X-Gm-Gg: AR+sD11/Am6Tz+rf3d8L+EJWuP0a3C/kQiCmPNGRaeKRx/a0wzUlZVqGI8WKzHptU5N
	XW7VuxThw6ivxKClUYXFa7SJx3gI/l+OMyCQavyBOfJJK/GvKb+JKhFEVELL+pSSb76O2yzgsp6
	R88CwqAIkC2oQ2j8BWE2O9D9bnAx8RD7Qv9TXGwmkXNf325hjjwIwIhxd/fL1Vjw2WEHZavaRIW
	LC4aLZi1j5oGslkfFB/HRPTliHB/bt8TX2CMI4PCFMqpgy7GnbXJz0y9dF5ZIjGfWXZWuS7CNha
	4ox3QnDhPCgqE7TZhoOJkzYIQw4WryPOwXk0GHhSBbefMEg+IyEL7VTJBlJv5NCEs2XBVvsiTL4
	sBr+aXFGzOGA7weAyRCfZtPM=
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48349591cf.3.1787919282702;
        Fri, 28 Aug 2026 05:14:42 -0700 (PDT)
X-Received: by 2002:ac8:7f4f:0:b0:517:6162:daf5 with SMTP id d75a77b69052e-52fb95f4e1amr48348971cf.3.1787919282051;
        Fri, 28 Aug 2026 05:14:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b2074sm74098266b.38.2026.08.28.05.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 05:14:41 -0700 (PDT)
Message-ID: <afe45689-7f32-4a15-a7b8-1f8e855104fd@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 14:14:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] phy: qualcomm: qmp-combo: Rework DP PHY runtime
 configuration
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
 <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-4-8e73ce7c4636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbMt8MVA c=1 sm=1 tr=0 ts=6a917bb4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=lS0QMqM3BESs-n2QcPcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: ObknIEDHrK7yC_C6Uj5KQp9DyTSnoGIQ
X-Proofpoint-GUID: ObknIEDHrK7yC_C6Uj5KQp9DyTSnoGIQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfXz0m2rmnWOCea
 Rz9+T6rr6UeIevv7LmmqCpt+Q4ysrxcV/WvlHBCAs1XASII12BPT/fbIQptvUQ/UbjImYBN9aFh
 9KHwrCisXZ5SpXBsRypYsdLDg+cZOtM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwNSBTYWx0ZWRfX4+jYxck2KmP/
 akeSAiMuRec4jJ8wjMCFmomYgIr3+MtFtVVH9/PUlw7K5RNHMPz9pHjuo/yDE1sI7yNH1jxhmwB
 vbcn3Ppsz4rs6BRQv8upbkiwToah5/f+VglsUKxFfVQxL2gxZQ2fAYObOD3yZv/SslrZmS03/cG
 hPCJgiwmFdCAcVccmARqNx8q3a35pzIiLbb9TcAr1sX0efmIfiN3xSh8gfmVEKGxn2CgnI2Zc+T
 DBn6vm9GHerOzETQpQ4fgi/QJMWrpL/utnJTimKIr10e3ENF1Rywkkb5kdYofImjhV/BcK/RoRT
 QO8LFfNzPjYBf5ivUADfEMVQNgjfNhMWYeDKocg7uHWnpA9hUzzQCX/zpKAhRMA0eFphj98oMLw
 cnaKvspe5lzRUCnyI0INUTWkBkaQ34N5Zi0ONsNuMfuzcl6X491SDVMsuOrvT5gYKoJN9j5UJgz
 ehfXdlkfWQJlc2QsPzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280105

On 8/28/26 11:43 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Rework the DP PHY runtime configuration by:
> - Extracting common DP PHY initialization sequence into
>   qmp_combo_configure_dp_phy_common() function that is shared
>   between qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy()
> - Adding dp_aux_cfg2 field to qmp_phy_cfg structure to store the
>   hardware-specific AUX_CFG2 register value
> - Defining named constants (QSERDES_DP_PHY_AUX_CFG2_V456 and
>   QSERDES_DP_PHY_AUX_CFG2_V8) for better code readability
>   and maintainability
> - Adding validation check to ensure dp_aux_cfg2 is properly
>   configured for all hardware variants
> - Updating qmp_v8_dp_aux_init() with corrected power-down control and
>   bias enable settings
> - Modifying qmp_v8_configure_dp_clocks() to add VCO divider programming
>   and update auxless/LFPS timing parameters
> - Refining qmp_v8_configure_dp_phy() with updated driver enable values,
>   TSYNC override sequence, and additional status checks for proper
>   PHY lock verification
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---

qmp_combo_configure_dp_mode() needs to be updated to ignore reverse state
on Glymur

cfg->configure_dp_phy()'s return value is currently ignored, let's fix
that too

Konrad
