Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100780;
	b=coClO3CnlqKMrKuFd+lO3FWni+CooXycEDlou5UwL6YG5JrqBtCCau4L7BtL7PokEyDm
	 oDBclvZ78VBF65yosYsLN7Pi4C1KXLAHM7Gb2EeytAQ9nbiPSPr3QdKd0BPHjoBBh7RKw
	 UvqNCZhu7EHL8MpwiGqfhu94KEpiOE3Zk5N9TgCFVKRMBjrc0/RkqBpsOMTXurhpe7BgB
	 cG3NqKkOB2jr2M9KySxkowtVYqBGhx1VWMsbXhlj+GhZ8fraNv/mqqT2G/tZf4/eJEduQ
	 tAy8HtlFfrwnJXFBxPGQ5jzmPYDPTIAj27TK+eoLZZu73nyfMU+JK/am89mbAcsWOSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100780;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
	b=vTPM79yHk+4cp2S0ih83opo7PPK2TCB721CDLI1mKLZwGV80/HoTXCTucWwFmdagvIC4
	 0+PGtRunlQIsYe4EPaPQMqNVdaZaj3urlhu/sIQV4UknGWtJ//rb0xB9iHtNSMaiKLnqy
	 2czzznVByS0KHpvmI0urj8i7RZgQEDmizzyR2temD27H2myYHXWbn+vLvXBtXGcRUjndp
	 95HYHc29xK6OTtciw7nKSvCB79N7yDY5lUT0aQpahSq5jONIB7bktPYOzYqTvwO2qXDXq
	 OiA8UCDTEzBT7F7HJ/pswPm3JDayptLYIh6mSnH3LyctAHf3L6z9U5h7k0ChPIu+PAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3460A381D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06E3460A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ELzUjXm4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EfQ8McQv
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdsjm1973260
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Ve9ui8PilMxtzrantty91Ae
	ttA4A9wQUP1tdJP+4uQ=; b=ELzUjXm4v7MAFja4JJbXr2MTcw/RSuWKkdJ+hy7O
	MrVDaMZHhSshavS3nj33YkeKPqWV806SwcXtqRqdXBAVAKjABVzQCstnCH/xEq2p
	XEFrLE/vwZXnCQidU0ldxENnTa99RkTMdSYYniz8Y9PDbENnMvHjG/MhfpxOw2HU
	Odplci2IeCh9CdxfWjQgZmTocOeGm4PhwoCAfUUH4WuCpVt1z7q707GLs3MoezAK
	W1UqYhv9zkbprhdgzAYtii8SccjJnM18nLKo8CMj5B8xJFVRAbsY0nBY5TfEgYQ9
	nGx6WbEm/IbX83ERcKSKLlBTiwSOjinbaz1M3Hg2QZTf/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1gb09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:32:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so827678185a.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100777; x=1793705577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=EfQ8McQvH+DSDyFI+ak9B8ymsXvLPmTU5h06rgn2Hw4SgSTajH3f8rDXyTIOH7eNuM
         weMsyWmscxbSYcFZ29ankI9sMVZvYCX4xMhTHzddpvxWrNkL+gMwDrTh7daFlDaFdsAV
         GcUBogQZ37vrPLzmfqSbeo/kWy7YlZAGKE4AgUfjDdaNRAl/4S26ArjWoBs1i6srI1UZ
         BOIH1JLsLCe+v3Pkg5CllE2vS5qXnp7Bf+NHYRdM24Kv4Sz39ldCmstXM7ahoyBxd9KM
         AN44H9RD/kqOalLxwE54T0wT8/9QofIScvG+G6s1lAVwwFrDjDYNYcvQgUGb37PIBwIo
         aB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100777; x=1793705577;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Ve9ui8PilMxtzrantty91AettA4A9wQUP1tdJP+4uQ=;
        b=gucVkxlrMG8etqDxWdZxF20+4sA4RZrtLvJ98AyuIJmasQ4UNP+R9bDa5CVX1picsU
         j4DvHgrCbg3FExmGYdDO7lugMbnAUhCHKMYPB+1/2vQaUBRfvEfTCD/kYqZKHlk8+inu
         PkppQMdocZNPpjpco2CyWT7zNSfMxiN3UuRUavZu1LnQGwYpHP5OANzuzogG2JFylkjg
         krWsbVGXdoyf6OzK4L1MTgN3jxiuw9SKSW+GFMqFWsSVqTIdLTvu0NjK+mTdszuc16Ae
         10V4ntrn+ZOG1FjvtKy1vfnLcGSWZmM+X+Cxv/slw9oL7PFcABKOlaOzny3WBnUnZvPB
         WRtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyv7NDf9CcN2Uw1nez5GlR4Rbd264KWCeHxmfLyCrqr/EaeR0pF9aC+CQiv5tDLxzgRzEmG9QkPdf+2GM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKA90paCMn3KiNKY0Nz8EwYMXUajLUBbFdGZtRwYlztSX65Zrz2
	npjMyVxcEiT5wHrIXZsrKUN7UmViH2KaH3JU18NfXZfzzRvscqK4eJj9kz9SqPXhzD/8O+VUO5p
	ancjjgkhlLlpSwefs+vGcoUIIZ4G7+6a6EQrtKVhsmeIOX4kei5i5yPlZtfLb90POQ54=
X-Gm-Gg: AYBFou1T7awZGjWFl0dEaFb6OUAp7r2tL1/EjfVUF6alxjgqfv/CSHlGh9OLns5ZS10
	4mjkfRYOI864Q6vzRKG3gYGXsEGrjS7kG8o474/abQaLmFFxXM8c2kTJpPShawTtA79io5butdM
	egPk2T/vONeLwR1qmymDjiuJJ+gYYgUHJYZLh6akn/uXGOdA7pu/6bbZm0bekmkJj/Or8D2YpN7
	RI66HEFRrJ7mmtdt5TSJexNhPeEJrCCdzpTUn/VUiaxDiFIKTRxpgTKKpWOxVt5lfbH3LHHAWKp
	0xXRzadqM5CogSLZLG5OCci3fe2l2j7l9Bl/zTW3JG1LcDen8hidtOXlUQYm8PbE1r/5xK6FV1n
	csOc6JJKuX1X9n/1P
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696045685a.22.1793100777100;
        Tue, 27 Oct 2026 04:32:57 -0700 (PDT)
X-Received: by 2002:a05:620a:28ca:b0:93c:8544:6adb with SMTP id af79cd13be357-940ef8bd39fmr1696038185a.22.1793100776313;
        Tue, 27 Oct 2026 04:32:56 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb851sm19211985f8f.26.2026.10.27.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:55 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:32:54 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: patches@brar.si
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SM7250 graphics clock controller
 driver
Message-ID: <natokcic7hm2l3erd2jhghzlkg4nvy5kejms27hi6dr4xmid5h@tnhinn7yjp3i>
References: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
 <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027-gpucc-sm7250-v2-2-773056e4043e@brar.si>
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae08bea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=SYyxiif7jT7wlZCutrwA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: kRGmOCyoYGByas5Q5XtMS4Zfl6rjpu4v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfXwyMZJHXC3cZZ
 y04MsGrn0sT0yeHX5XmzYnFoktGehCSN19zwOse3Ms0iN+4BSNv0af/yzAs7jYCrO6lDz08uEL0
 ROmd49u2jWkZmBK2UHZ1txy3H0od0Sc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX0bQqyqBzwmha
 yK2mfMJC0LKQ99yQEQzSGsMr815VZbmYb6X40M126RCXNRBtoIXkCaahyE0jxfA7Q/SytEuGylg
 5+B4HTrglfLjShxfIHZhRJ1bhz7jvhvWKnsjsOIOZxCEifzg9HCdlZKJu1QvuD1CSUICOQiqc8R
 U+zHjalt2tS+pQWD5uYqZhxgGHCn3C6szOFirEosSAB2TDtpo8zA2PlHWIpKP8ORvARUWasGw6i
 wXjRwZsPJEDNhjREOHlGWkozaEl0h7z4XslGjjLIBbCP2FMzr8aqiYds7uMwpCk4gWCjsrThzsP
 +f5teosU2K05R2ibPoasHcBjCu8romXBJjTQPvn0xBCG8QtW3W6TmzR5yi5pdV5gHTHWSCMz1wb
 vNp+AFLsa/K5qvre2CPmyQeHecdwPBMYqHAr05rlIDV9/6qCK+VEIJu2DRM0uyOzcUow8U+Px1p
 pIN/XKXVrL4kXC05sLA==
X-Proofpoint-GUID: kRGmOCyoYGByas5Q5XtMS4Zfl6rjpu4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 26-10-27 10:05:02, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Add a driver for the graphics clock controller of the Qualcomm SM7250
> SoC (Snapdragon 765/765G/768G). It provides the GMU clock and its PLL,
> the GPU CX and GX power domains, and the GPU SMMU vote clock. The layout
> follows the SM8250 driver, since both use a Lucid PLL and the same GMU
> clock setup; the PLL settings, frequency table, register offsets and
> GDSC data come from the downstream driver of the platform.
> 
> Tested on a OnePlus Nord: the controller probes and provides the clocks and
> power domains for the Adreno 620 GPU.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/clk/qcom/Kconfig        |  10 ++
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-sm7250.c | 378 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 389 insertions(+)
> 

[...]

> +static struct clk_branch gpu_cc_hlos1_vote_gpu_smmu_clk = {
> +	.halt_reg = 0x5000,
> +	.halt_check = BRANCH_HALT_VOTED,

sm8250 uses BRANCH_VOTED here.
