Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB17477E58
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328086; cv=none; b=kYBmLek2CzMZmNuNOyScShGfDKTbNhkWJ3D5sH85OOopcUN/uu8NDMjGcwGTU86sfufX0kXp1F5mivQlsobne/yeY0uUiQunKUTjK0UY2mSxo47LqY5nghrpbmEY3S9bjL0KqiMGTD9GXK1H7BHHTqRRiaw0mqDYFmxjP2R5kYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328086; c=relaxed/simple;
	bh=mvedpIxak0Fnzj/mZY4251qn7YJgCBi9zAfCHtRMKVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=URoO6kNXtB2Sl9fNGWJAhoL5oMsYqJsFu0Y43hWmlLjMQSPU3Y4TVCr7YNbBmAEHXztsz/igmsiuA3JSYlFxP4kZ4S/6/GvXmOS1kOVijKBs2sD8VUF0G0iGimiAhx2II8tJznCyjRV+vzBbw7VZ7aUbxcVAE68Z6PtdZtUc1Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fRTYy2jv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NFDGXV22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fRTYy2jv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NFDGXV22"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YWpl1055788
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:21:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=; b=fRTYy2jvZM+gocIf
	Anjg/IjTKq5zbwrdhfH419Jt9409fi3VgGXtPuFwOFCnhHnXB/O2OMFELzUd+LGU
	qidQpL17GbphNSW2n46rTQBteVN+Fd0wWNmJU82LS06qVnGSC4L5nyMtdsYiy4sw
	3hdh0/99kT4e4y2WluAK8vsczO9uDilKk1njvv9dkGBwlVJJUf8PSxf3+3G9hSCG
	6UTveLjrwCTzrMVmTNBU5IPZW9P1X2pytvwd531JXQ5yZrX4WHxDzg/oTiCYUJzc
	jvf0XzQU1Bpc59PbAptplKXqsKbU/OlGF7xlk5j97AWuBSsP2jl/c/SBJwOAv9bP
	4GgaMA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79t7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:21:20 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342217d8d53so444289eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790328080; x=1790932880; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=NFDGXV22LJtS3zJ380XsL2sMxKlYapYiicnk/oPEEt1tPpeqq3wX1cD67fgtB5HwjG
         m4xUiaOsHNI9PKW1CL3oGORisgq6P9PmdKH8X0hnunxciW6nnUx9vaIv3CCHkrO12enz
         A4nvPn1HjsaAlE6zABQLkU1EXXey+FfJmWkXpi+DadF74XvHvqv3SuQzclFSExjBOUOL
         r2DNl2GoZ+GiJt7dS3yqZlFjuG9bQE3YccO77D9CVrkyn/qm2N/PbVcQeiE7BzAd+7Lz
         fq5P2pKnx543iMcj8mlX7W1gltQO/sS/G+dfzT+fgVlZANlLccHufeauu3esKjEMHyQa
         g5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790328080; x=1790932880;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBsfdl/T6Ue4W2/aqLwt1CKH7MzyP/xPKpBBNUg1PjI=;
        b=ZZIeDiKwM/Q8KtB9f1fL8WDRluHJzTqVRh0U4WybQcu3v72t41okJ/yiHTZua2PTG8
         lwB4vhYuuAWD2EhYbiGGX/YcOgfPKmEaqpwl6AHLA00Cd5jZgquu2kd9pRmHVcPLNMqD
         EaWWx7ORfNWbxZ7mtifSBhB37udnZCTRtw45gopBIWeedvWG8lsqXgIr/U6HHWuvY6DP
         BiMPVnqkJiwz8M2WXdyxRJn4exwd0XHqn3ZWBEyTG8kcf0mVATVhNrryzPz8fZfOsUmK
         5t0TyHDpSz2UWlkkbZr8fvHtihf+FJF6/ogLp8nD8nQk1eaOvpki9NtQEoNyklN3hgWd
         BlGw==
X-Forwarded-Encrypted: i=1; AKwUvBzzzyYR7aNyCiovBaI14EBjWRkBGCISVAF76iFkvRa11PsZALsQs0RSOIqOs9286D8hWAg+79ugdGvtED4=@vger.kernel.org
X-Gm-Message-State: AFuF++mqiQ+8n0bcu40olk0Hvz3NevG658nP3Ur5K9LODHfPakZtuDe5
	xZzRtY+YsxQl99IYTooRoip5/HVp/TfR4nbN6jX/UU4mZJm8MmpUidY1wYAS7wekHNaWMDVk9ax
	wp/EEUL/2rGNAIY7izrd+iDWPaWlVdsWfwMQc90jhinOCZc/JAk07hx3scmdnuDEcs2M=
X-Gm-Gg: AYBFou34Lt6ODsK10D7APU4UFQBxulDS+UVudHtRrruvPgP30f8TdK8jkUgn5eZ2Unt
	xOwB6+BsFuo0OhzXtzIFvovVgy8AJ1yZYFc2jGOpKCkxZG6o4vn1//3joUWwcg96f00slEr7OeY
	dmb8ejLlueQpZYtxFFPO1tgUrg6J2locO90gfhNXfOHqfLOxWjhr/J3/wRnfM0YpVUKyHj8juQQ
	OaDTnScg22A9ULFlMcG/Jo1w/mssiqtseR4koPcoQ5oHoYMYx0967Kd+pmCOBq6mRTf3OMrrO2U
	oHGuVvIZt0+YbGcTiMC6zfo2wTmDYjH+3KylUbTrFMdIRCouqAB974XUt++Vo3ZMgniy2Atm6pg
	p1SN1tHiRG9F46PYrYrC6V/HalImq
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810784eec.19.1790328079328;
        Fri, 25 Sep 2026 02:21:19 -0700 (PDT)
X-Received: by 2002:a05:7301:618c:10b0:341:ea04:4102 with SMTP id 5a478bee46e88-341ea0445b5mr810746eec.19.1790328078540;
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757263sm4813814eec.12.2026.09.25.02.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:21:18 -0700 (PDT)
Message-ID: <8ea976cd-b012-4ae6-a74b-b5c2dceaecbc@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 14:51:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] ASoC: qcom: lpass-va-macro: Add SoundWire
 microphone support
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-5-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: leYROTq93zNULjDCLOqC0_FwZrKZ9esG
X-Proofpoint-ORIG-GUID: leYROTq93zNULjDCLOqC0_FwZrKZ9esG
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab63d10 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ohAgsov0r_a2WbmJIscA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfXxT1OTX25E0RO
 aeESOjj2QCIkwbvsYDA7lfdVn1Y+TAM4G+etU+L4L6zUhI5ZItJN9KVrQ7yA1J9rKAAal4QvkoZ
 5NvQ6PtQfIuLxvDR2iB63FfXHk21/kPBdFSfkufIRm1B5oDXgth0m1tU69FZwbPKKC+TWyNhJOj
 xgdXkgnl9bzissOcTeLXI4xNnE+cxwn5lH7wcw0JFUGgRabh1VYOd21NpWAhL6LXINynojNKgP9
 CxIgvkH0wDoU3L8Fvd4iIGxIa2gWV/xnmX3q28UIFguj4ZRdBXUe0/OM7Hk7uVPZNFF3Dx2A63m
 reyPmkZnBjc4zitdTqCfkK+5rqHeP3wdHHi19vrFilr00sd2d90BHTDZ6AGQurVYBu7ngdHPTUB
 Ig1BckYpDh1gbLvum1y4IfcC//EL+HCSyMQMHfopWbpaR0HH0ddzABGzUG5tlh4777j5bY/wCFs
 IpG5g/3W2eSO4vhcc0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNyBTYWx0ZWRfXwzjw/YaiJsUO
 fL/PbBovuIJbC0fIEXSXj857koX0Kimmfh3M10v9n7npuB3kgCTOGyZT8s8kWfuGOl3A07KJKXN
 BqnWCgLsVyZKElgR6qrWmtY8dnFhmXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250037



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> The VA decimators can currently capture audio only from DMIC inputs.
> Add support for routing audio from SoundWire microphone (SMIC) inputs
> as well.
> 
> Update the decimator source selection logic to switch between DMIC and
> SMIC sources based on the active input path.
> 
> The ADC_DMIC_SEL bit of CDC_VA_TXn_TX_PATH_CFG0 is shared by the DMIC and
> the SoundWire mic mux, so a mixer write to the mux that is not part of the
> active path can leave it stale. Program it from the resolved mux state
> when the decimator is enabled, so capture does not depend on the order in
> which userspace restores the two controls.
> 
> Add a helper to detect whether a decimator is using a SoundWire microphone
> input. Use this information to skip DMIC-specific HPF programming sequences
> when the decimator is configured for an SMIC source.
> 
> This enables VA decimators to capture audio from either DMIC or SoundWire
> microphone inputs.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

> +		if (!is_amic_enabled(comp, decimator))
> +			snd_soc_component_update_bits(comp, hpf_gate_reg,
> +						      CDC_VA_TX_HPF_ZERO_GATE_MASK,
> +						      CDC_VA_TX_HPF_ZERO_GATE);
>   
>   		usleep_range(1000, 1010);
>   		hpf_cut_off_freq = (snd_soc_component_read(comp, dec_cfg_reg) &
> @@ -1046,7 +1079,6 @@ static int va_macro_enable_dec(struct snd_soc_dapm_widget *w,
>   				0x0);
>   		}
>  

The commit message says the DMIC-specific HPF programming sequence is 
skipped for SMIC paths. However, this only skips the initial ZERO_GATE 
write; the cutoff programming and the later ZERO_GATE clear still run 
unconditionally.

Is only the ZERO_GATE assertion DMIC-specific, or should the whole HPF
set/program/clear sequence be under the same `!is_amic_enabled() condition?

Thanks
Ajay Kumar Nandam

> -
