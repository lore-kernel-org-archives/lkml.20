Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9545B262FC1
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 22:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788820674; cv=none; b=torjxeum8YHJgw0sI/o6tV+BxaChkbwUZvuTryAvrl9dO+IOZxvAIZPF1QWp7OoS/JI3kmkJMnQwuGl27wkeOon1LINrhXfYSxdBrEnc0XLiHwuGGPcNhKJIurwo/jJEs8K2dimCv3hauevFOKdjfKWlNrH+Ig3E2WAfb3OEZkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788820674; c=relaxed/simple;
	bh=TZ4DWrxjbgCOgZGMyUgrWtEjIm1edbnu1qkrI7QgGP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KrBmTvcnX4ttC4DM83IITYiMGPT57AslNW/NXw1TlDNOB0LACHutcAfOlpt0l1JKU+AXZjq+ljGM8YZ6NlB/4iTBOMENTkP+ieMWy/yj1wEFM/k9Km+Uz+95XT9ohgWF2Rm5rQNgEkM5up7heByhynUIN8/Kiv2HEBvRUKzemLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UKFgZ5l+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYSgASjI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UKFgZ5l+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYSgASjI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687KlWGo443137
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 22:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	66fvz1bKKpOHQ2hALp4KOX+2R/2+zrYNIxixzBLxwIs=; b=UKFgZ5l+J5A92JZC
	QyHm2GiOwoLt9px5CfUWrMjodF7pGpxHu+DHd7MLQEEa/rtZ4bNRu/WIQUXS8eYW
	3aXtbovulB6iFiUEUfboe6A1r+UZqILk5ZyW0sac87nK1A4J+pAqRNHi1ndCslQm
	xCPm2GKIVfxKVpo1FDiX+fnInZW9XST6DRxguxXBlS9R4L6Eo2BliJqDQ+xlVGx3
	K8c6xjGM+9665n50GEOiJnzaW3aLiGT8xIk2XsZYCrtcwlwzHeHdQorbC1VrXUCj
	rBXhDcHg6Ns70cU+nG3f4FvODTys5SujfAiH2YlMr12Ta0KSNTuXgh1vt634yRN1
	WzPO3w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtfx2hwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 22:37:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so740663485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 15:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788820672; x=1789425472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=66fvz1bKKpOHQ2hALp4KOX+2R/2+zrYNIxixzBLxwIs=;
        b=VYSgASjICD/OXD5a4SrEmgNDL9qGiJH7fHUO/azPAP7bdWbIy3/yZw26vRhKnk+e0B
         h35FpdIiQu0MczTH1/XTTTpQ1ZDMJn8JxuRTV6zdqZrcgkmPDhbPWvzx/0do91bJoJqu
         H5GqQhWFT8EXCOx/NTNfxEFub3XRIMoy6RT8lb7K36p9Ku1uSPSKKAKnuTJuhk7iLyiA
         BC5XBeSwYHb+snAza57GMmbKiAZ/+3W7mlFbU65ImvO+k4s//sPZvfT0WXpqMvpZ0I+g
         4TgEx1E/4el0f/Vrg/xCup1qqeoOHqtWasU/y1oLMVIUfIJO/0ruqlFxazfzJgiNzhtS
         dpZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788820672; x=1789425472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=66fvz1bKKpOHQ2hALp4KOX+2R/2+zrYNIxixzBLxwIs=;
        b=fj1Llco3s0Hc18fFGPlgmnYl+yneuNcq2A3STOkIKPSwGloaqcHTDPcS7mgK0Lf0zv
         SA4wBZbh5BnlEX6/ZEwuLrDvcDK5kXpT4kcdIplvRVTCHBSbfKNr2DcCb4FMEjIZiqmZ
         +UDOi78JuzDGex33zeSkJkZZJ3h3kRpsWQP0qyXzNMK8C1w2TB/Q6TlXwlrUJRY+FIp6
         ciY7Ef1xa8kL3yXPV0k64eu2oyQYbN15YEgN+CDJUlsijhWxYCLcmY33D9Xx/os1qoaB
         iry3bVFBKTrE9M5/NYxpIzwNlG64XtEPJLNbsC4aAOXlrJIzZBU/OSkL87JPL9x1WiTG
         rRmg==
X-Forwarded-Encrypted: i=1; AKwUvByy8GD07njrLE88He4E7JztM7D/p10qHJMwC70O+RycZ2uJhwyMH4ylxOsptqg4kQvgQvCdoucfaolF0vU=@vger.kernel.org
X-Gm-Message-State: AFuF++lfoSYcUl5Ya4k+7izeY3DVkaOSRNnSP34P+Bzy74vq3faYDHgd
	reIr58+c6msoYNyhbh1O2mVcZqSpQ+WwRbzyKZuu00bk0qYpi+G9V943JLy8ynTRRFAMIzqVDkx
	M0CTyJfPEeSZmP9H1R6DIc4bU0DJkF1DW9AMuJiQNFZfDDRK3X2vyRQFnKbrvt5b+EZQ=
X-Gm-Gg: AYBFou1Qms0k9UvkwmuEyzKBaR6DCcApdGMP4xwP76kZzNN3SQM4i/OMSve6qx+9ovE
	dr8uAMJ2ssyzKrH5pGhy04ucNa67yDBqJdzgPLcLnnTfcl4G/O+WUOIgto6F4mzdPMIvhRuXHVr
	lep+6IIB/cHX3vledIU3iAiwxmjHDHxxH3vo/zcytT3NDDuCGBJD8jj8AwgDjZpCaM8cbPCyVl7
	in2gUjg55wGzhijqRjz9ndI3yJFzbXKRrHcw/fqf1jqE8oBdmXplKqDtIzP7a8G4zakgMYOaPg2
	Jjf+rVcYbz9Spv+oQpkS1PZcgaXXCllKU2ME3VXYb3q0CzSkm6ZnA8QEggmNIxXJ4Iwn1aLxRgF
	ZjoGsyFLn0x86geyl/EmGLBQv8oo=
X-Received: by 2002:a05:620a:6890:b0:930:f337:ebeb with SMTP id af79cd13be357-93980379720mr2890722785a.12.1788820671649;
        Mon, 07 Sep 2026 15:37:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6890:b0:930:f337:ebeb with SMTP id af79cd13be357-93980379720mr2890717685a.12.1788820671090;
        Mon, 07 Sep 2026 15:37:51 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49cee5d476esm468229645e9.1.2026.09.07.15.37.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 15:37:50 -0700 (PDT)
Message-ID: <c7fec9d0-b79f-437c-ba8b-37858842c545@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 23:37:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/11] ASoC: codecs: add Qualcomm Tambora (WCD9378)
 SDCA codec
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-12-srinivas.kandagatla@oss.qualcomm.com>
 <525f887e-cb3b-4e74-8b93-30c3baeb8018@linux.dev>
 <7006ad74-334c-41cb-bcc8-9ef5e75dde7e@oss.qualcomm.com>
 <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <005e3c81-778a-47bc-a8ae-fb5c38ea2e2c@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Weg8rUhX c=1 sm=1 tr=0 ts=6a9f3cc0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=D19gQVrFAAAA:8 a=D15zt_m3DPPUnS_4hLIA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-GUID: jCwM1pNO1_be7Hu4qGJnQgBoHGUMWA0f
X-Proofpoint-ORIG-GUID: jCwM1pNO1_be7Hu4qGJnQgBoHGUMWA0f
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI0OSBTYWx0ZWRfXxuMyOYeHuWoR
 LWAVYih39/X5bGEWxP4e9qfTWJa7NraJ8WbJCnoRsK3XeB1T7CuOqxzjZm5S6Aj7M5rSxr2upOq
 WzCMIk4Lvu0E4V02cNllOhdYqdH0e2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI0OSBTYWx0ZWRfX7YWuJdYXhCIA
 5mDTJNxTyjOPARUGySElWDcfIYAsW/gQoRrNurkhLzYW2q/kc1Mav0fvuecJtz8EFSJnf0D0+sP
 gwxbYpTDKfC13GNdIaZY0tzgwx6S2XXt/t95aT1DFlh80tC0/Uwk3i+83ftsdeuiKkG/l+5x06g
 pv5P+r3tGdQFYhVtID0bR90p8T88AuNm3SnsTsoF0+Mr07xeRUO0yYCD7lDOAgLCpWFHEwJ/B3s
 6kgSXfJk8hLttMxIAPOgQoLrrh5fg29o0iTMFomNm0q3UKNWsmzU71NjYoCPQPwBdBsO8LNQwRB
 uEy77zjHsozxLiWGvRZQm3FzGnnM7DXmDHjpIB8vfNETzs6Vy/XDszAgBiN329dCJcw2O/EjR3R
 SuhFmt+A+RBkdooxszRouFhlhO/FZnLgEc0ETSjja0IBdC6k2kXGGiyBrtqP4XO3IEqHAYciWRE
 STtmoOavTR4IjH+bMkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_06,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070249

On 9/7/26 8:47 PM, Pierre-Louis Bossart wrote:
> My take is that rather than encode all properties in C, it's probably
> worth exploring a DT representation of the concepts that *can* be used
> fairly easily and make the life of codec vendors easier - not as a> literal translation of ACPI.

Two things are getting mixed here:

  A. Representation: how the SDCA info is expressed as ACPI
     DisCo, DT properties, static C tables, or a firmware blob.

  B. Reuse of the generic class function drivers, which ultimately
     consume struct sdca_function_data.

Whatever A looks like, we end up at the same struct sdca_function_data
that B consumes.  sdca_parse_function() converts ACPI DisCo to it
today; populate_function() does the same from static C tables; a DT
parser would do it from DT.  Same runtime after that.

Static C tables at least mirror the SDCA spec's own entity/control
structure, so the code stays readable against the spec rather than
inventing a new shape.  They are also a byte-for-byte match against
Qualcomm's QcSimpleJack.asl and a live Lenovo T14s DSDT, so we are not
maintaining them as a fork of the vendor source, they are a
mechanical transcription with a verifiable origin.

We landed on static C tables here because the previous DT round was
clear: "if it's derivable from the compat string, keep it out of DT"
(https://lkml.org/lkml/2026/7/29/1166).

As Mark pointed out, DT + SDCA has two use-cases today:

  1. Devices that have a reference ACPI table but boot Linux with DT
     because no ACPI enablement package (PEP) exists on the SoC yet.
     this is what I'm working on.

  2. Devices with no ACPI reference at all. I'm not sure any of the
     SDCA codecs in sound/soc/codecs/*sdca* today falls into that category.

Solving both in one shot requires SDCA DT bindings that either
translate to struct sdca_function_data, or represent the SDCA spec
fully in DT and share the same parser flow.

I agree a DT expression of the *concepts*  not a literal DisCo
mirror would be a better A.  I want to bring that back to LPC 2026
DT MC as a concrete proposal grounded in the earlier DT-maintainer
feedback rather than re-litigating it inline on this series.  Because
B stays put, switching A later is a change inside populate_function,
not an ABI break. so landing this series does not close the door on
the representation you're asking for.

--srini
> 
> Putting everything in C seems like a code management nightmare to me.

