Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F049D59B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591580; cv=none; b=cmWVO364JoNbRquTVG19MKSs/BPwodxnMNP3W8W9tuOZfew9OOkaV/QBR5N1J1yba1GHYAkqhw5gBInfjqPSQeoVWTVlU0MnvqzAsAYBu7gvpIJSpLys7eEaux+jkSmYCANolPe5v6t7waebP36ueJy0QxLQnH8/Zihfdbb4RS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591580; c=relaxed/simple;
	bh=2XNAhu9CxceJI8vwdqpOVTsl9oWO7hi2cpJ1xfPfc28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ep2GHmJqz6FqS+/5w2LUsDgOqEkEaSezOb5ELIfnUOjWA5zjvlFvFxGjqcjBYCajWNq7I7yfgatBNeEIux1SFO5gohlW1rCMX1hIvyI2KsEYDuiJqQ4vhT6Y1ssanIEKJ8R0reYfwTb5Hcr8Zm3Japazu4gTOCWdxuIE+NY76VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7ZuDK+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0q8xq0q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7ZuDK+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0q8xq0q"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M44j322560
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxstwlbKuBUJawkY+2kMsXbkr7mK4XNxlqUWYk9+Y44=; b=M7ZuDK+7COYZxi0/
	Ix6tg4JvaZXPRQcI7YYJjAMW9atxYiiEaKdJheVVdQsM0/ONof3w3FfaH2K1U5Ks
	d7aFhL/jQOVGrZryfFZROOA74sAQO7G7KA/5/78eeazdV5E3e8EZ5W5VzvH60hL0
	Q4VdKsIfuUxGTf34swjxvZEbyauWo5uqx4niqQKFCBJPfB2iXBfxSjn31GdsHEeg
	ISBBzhX1ZHjRsdgZ183v72vbCLFLljmudOUSeELEEA1S9EkWK4x4dD6hBSsl/s7R
	bJhMmKL4gVN2WuU3sgiFDXzS04m9U1Lavjd0/DyGdAneJbaPAZ9ANy9M90hU5aq9
	ZbYnrA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1qfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 10:32:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-86a2639398cso4207802b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790591575; x=1791196375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxstwlbKuBUJawkY+2kMsXbkr7mK4XNxlqUWYk9+Y44=;
        b=i0q8xq0q5FrEoEKlkdovtSj5HmwBMAHx4ZlRjVuB+NUeAdlJXLuCBV7RkODmbRr1Rn
         0zIrOnMJEWARzEEy6QajnbScGP8251JqYZJtSkjdeKycq7ahG/WJPiSaV5wCzd/SB4jv
         +VEC/eJjMZ6m585hXIv6y1YeLbgxsWIEO+NQX/5Ij4897TkwH2ZTQz0st/8swuu8rnY/
         WqUqeHZISJ/KqxbJfbaqMGsTd2YpSYiQUbEoI7cu0DNT1TO7aghCSx8srtsKTdckrqib
         BJNPNW27zSL+P3a3QaUYfmY9zHbSjWx9CdtdW5souQj9ZLebJujAtRbXRMTqyhhYvS1x
         sL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591575; x=1791196375;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vxstwlbKuBUJawkY+2kMsXbkr7mK4XNxlqUWYk9+Y44=;
        b=Kai26KT2kDyiUkDMa5ynFctvXuAFdDhkWbqJ3mRAr3GhEBLwYI90nLJTUM9CH1H1yc
         sYh8GKj1cok48Mj2Mw/lgbFOBXJv7nQVCGOmJ9Mp/LbMC4cmkVtvOh5fAqD0d4dd0edF
         Goo1OiFWP3jTYcqApY44oMB1oOFaMdV8+KLAgyK/1dc77CQqiJRemAWOEvrhdCUzNe++
         Zn3Uk1dN2pD+mRraYBGWxtLF+WtRzDSIH7zDDgW6ReJhzGZSbGFath66EOxhTlv/qxXw
         EvGgk/QCMjMZkbQuMjat3MVJC2cgnPBstM5s/5NeZAsH18HIAehKO25fyMWIqkwuskxE
         NBwg==
X-Forwarded-Encrypted: i=1; AKwUvBwLXiabQFOO+pm9OeRbllAwWxPqVZ5mty46kQVvjC3Ljv89xzU3iUYlEn4sirEM5vf5yXLXhMYTPAWkUZQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n7lgBHPMiITazOHG0I847fksjiWeorc2xNYzAuXhvDfZKA9PWg
	oSgDvVCkGIfZOxtDmiuUOQDRwS+xQeyaHLr5Mh2Zumd+0WPrcLiwuop9jG3VaGDfbbOG0QE1vKp
	01/KnznR6n03lBRJfLq8DxxShzZBRR9Cu3xZC/GKvSabqMH/PPEaMYmY9kUAzrY5xW5eSgDQewa
	E=
X-Gm-Gg: AYBFou2nM00nELECmHNlMysr0gfP+Z3uARwL1FGVphIH5rIIOZFJSvgpg+qTlrc561c
	ZHv8gWo0S1dnCS37UjnadTdU4cejv/qrrjxyjQWQ/6cBamSz2kKURu4sA3aEM/i+TxCZ9s22E6q
	YwVF8KDYZ6Egz3Sq47fe6vnRXYkN6oSAXqWOaDnmd3cHJiZ+4fT1tqbI6eqAyrrel1xgLRo/6zW
	ggrE2Te5xtoo3acOIzPJ/2SNK0REglYZCpjL+SN7eZoiaHbz0DdVSs9x6pa4PbrssPptMWccDj7
	Mdwc8TO6AuSpP+yoyQrrFC5q0hMFlfjp91eQ+ZnHyBfXvBrMHA9dMNvQAUsUV2MHjhtUZ454bNC
	G+sD8wNufiSqpQN0TfeJ+0GDAPaNuJMSF
X-Received: by 2002:a05:6a00:9095:b0:857:7337:5dba with SMTP id d2e1a72fcca58-8802a7ad603mr6283594b3a.24.1790591574572;
        Mon, 28 Sep 2026 03:32:54 -0700 (PDT)
X-Received: by 2002:a05:6a00:9095:b0:857:7337:5dba with SMTP id d2e1a72fcca58-8802a7ad603mr6283581b3a.24.1790591574117;
        Mon, 28 Sep 2026 03:32:54 -0700 (PDT)
Received: from [10.218.31.237] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea88a1a2sm3854645b3a.25.2026.09.28.03.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:32:53 -0700 (PDT)
Message-ID: <ca3c86b6-c837-4298-a1ab-4fc61a2f8a0a@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 16:02:47 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 0/2] net: wwan: qcom_bam_dmux: Add restricted
 DMA pool support
To: Stephan Gerhold <stephan@gerhold.net>,
        Andrew Lunn
 <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
References: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
Content-Language: en-US
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
In-Reply-To: <20260920-qcom-bam-dmux-vmid-ext-v2-0-ef5ca2178378@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -gnUNGgfyRkWiw-SPiyEpdHFNJ1-OhEg
X-Proofpoint-GUID: -gnUNGgfyRkWiw-SPiyEpdHFNJ1-OhEg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX8LsW0XFwULXZ
 AMWXZ8dPlq/JVBM/mzHr2y97sSMmRwhqCCQyWaWwLjPK6PemtWVCA+vWldD4OYv6s0Y2KDDVZNh
 lvMWK1QG9xktjecgZGHG4dJ92VPgB6w=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba4257 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=farQdCg5IzuLFFoMD6QA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA0MSBTYWx0ZWRfX7jjlAmv+cauP
 2AZ/B43pAIRjr8KRHEG7V6uMSW3NKxCsA2cC3fUInktr0nbHi7Yy7TKGBWK8rzFMD51fgxjn7Hw
 S41gp1e0T+3rVNXoo83x5tF8ogYEdf0ipTBlIvTANA3vFOZSHQvfYCfRp79OIeSP1UjjZXPE5wn
 iwZbKMru3VmctCMi/WiXBsO5qRhWtUcjD1qOlLtx98t3gX2H6L8u3HFxRlrctW3S09cEri17l7D
 ZnjEPYrUOfh7w9B2wthPxlkRDtz+6ZIWXcLk5TwzK3bvhstNkoY9F+UCf9XlyGyKC3aZvzqM3CN
 6IVk7O1URT5QGRlJaTo6Cyn/QVFvKUaTZzRmmTSQ4tLA6LWh/en5gI3EdclXEy4E4zECm5mcBJX
 GHYWnGvau9eacV4ViNynQrnJc8cV7EJRvS7eG056K5sQCQ7c2iDxfzX0UMfN5dJ67dXvDHe+hsW
 lY1yRxm1pV74W9G3tDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280041


On 20-09-2026 08:32 am, Vishnu Santhosh wrote:
> Some Qualcomm SoCs, such as Shikra, run the modem in a separate security
> domain with restricted access to system memory. BAM-DMUX DMA mappings
> and BAM descriptor FIFOs must therefore be constrained to a designated
> memory region that can be shared with the modem. Accesses outside that
> region can trigger an XPU violation.
>
> Add memory-region and qcom,vmid properties to the BAM-DMUX binding.
> When qcom,vmid is present, the driver SCM-assigns the entire restricted
> DMA pool to the local and remote execution environments before requesting
> the DMA channels.
>
> The restricted pool then contains the BAM-DMUX mappings. When the BAM DMA
> controller references the same pool, its descriptor FIFOs are covered by
> the assignment as well.
>
> A related binding change allows the BAM DMA controller to use the same
> restricted pool for descriptor FIFO allocations:
>
> https://lore.kernel.org/all/20260920-qcom-bam-dma-vmid-ext-v2-1-4dbbff0e57c8@oss.qualcomm.com/
> ("dt-bindings: dma: qcom,bam-dma: Allow memory-region property")
>
> Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
> ---
> Changes in v2:
> - Replace the Shikra-specific compatible and coherent RX allocation with
>    memory-region and qcom,vmid properties.
> - Use a restricted DMA pool for BAM-DMUX mappings and BAM descriptor FIFOs.
> - SCM-assign the complete pool before requesting the DMA channels.
> - Validate the remote VMID and restricted DMA pool configuration.
> - Link to v1: https://lore.kernel.org/r/20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com
>
> ---
> Vishnu Santhosh (2):
>        dt-bindings: net: qcom,bam-dmux: Add memory-region and qcom,vmid properties
>        net: wwan: qcom_bam_dmux: Assign restricted DMA pool to remote processor
>
>   .../devicetree/bindings/net/qcom,bam-dmux.yaml     | 38 +++++++++
>   drivers/net/wwan/Kconfig                           |  1 +
>   drivers/net/wwan/qcom_bam_dmux.c                   | 95 ++++++++++++++++++++++
>   3 files changed, 134 insertions(+)
> ---
> base-commit: 8830e65ed46de41f849eefb8ba227d4852c460f6
> change-id: 20260714-qcom-bam-dmux-vmid-ext-d9289db310c1
>
> Best regards,

Hi Stephan,

I followed your suggestion and updated v2 to use the restricted DMA pool.

Please let me know if this approach and the implementation look reasonable and
meets your expectations.

Thanks,
Vishnu

