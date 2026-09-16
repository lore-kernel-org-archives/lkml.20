Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34846E000
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545934; cv=none; b=l6FLYsbYvU5E4NKHPfYMWLhFZMlEaqFiIIDq8WNgYa0RIigv8S6gCMT5E+VcUdgsu0rvTxBo+1nVHTDH9PEsAqIfj8e/YXDhyTtLhuSiy40zWMPrhuu9Lk/KYz7tbMnYoEiAjJWjZzKlFrSr1eVcn0mG7Qx1JAZbkj3wGCnTTP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545934; c=relaxed/simple;
	bh=PcoDdCIrr83oRm7NwUejbqInnkYFw14JsuggRsrAzaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L0MchNcpPWnWU5JJXYqGi806MKqk5toFZt628RBen5liYOeTjhFJ5gPGvPz2J9H6TyyqOJeP0ZgkrysOk6/kPHwbX4iOTjy/23t09JImzJ3VnE+Dlb9RV+GmjElOe0S9vsSeIRglCzE+sb5mTcTOf/3jdm+LEe229x3lebZXhps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RnKS+OX6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f52TdmhR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RnKS+OX6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f52TdmhR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G68jt52264841
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=; b=RnKS+OX6LY6NAIDV
	eTAXl2puL2Z+1bukV8UZufyeIOEq3wY96Me19W3U7ezAvYd3PwQYrWqY2mR3oX/d
	XdWxreS2yeXYCJGP7eoiaWlJzFYojxZNEHyqEhCelupeqTKrc9kw7flPfIAfDSXI
	E/LX9bGO7fAoofS4Cj531erUqEPL3+J6KWUwg/k+LtOJUCW5zTif4BGNqmT4buYw
	mUzajS3SKVyg2MWhPs4PHG5+UYkeqiJ6L5CPmuTgVkoY482HktOIELAgyRBNcP3R
	TrJqfHpTREoqbWnQF224ivLyloMpwQ5G0xt5+JIzcZZsTafrhgCgrXbZ7/sNYFE/
	LBWBEA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftuhqtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:05:17 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6c1b7981b4eso4099446eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789545917; x=1790150717; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=;
        b=f52TdmhREVAQIQVYsakemGSkHBvpMSi1Z5Zd/sdxi4SyiNQJdHB6X3xiBGc3D9HMzd
         aoTE/OVZuspsGJ9207tcCIBqedXOCuS6Ix0jLYmayJWR4duj6Ezjzz8lP3QeZK5rWnU5
         yI0Fs31q0KjZ325Vodwfgv5Wrtd1AAQDy0Dd1VUgpLyW7Idnepf6OSwzk1ztfEOls53q
         eO8HtjwqocLjFhrXrgMdk6mGoC6LV2tAJlxzcJmBaqyGiJ0SM/Wk9IyKoI2d3nzsjDal
         JIm47FPXCZmObbyeVYkpwU914kTYqd0uMBiY8hTL6S2J6aL1jmSD77rtW4AAfwpBHlhB
         qzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545917; x=1790150717;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tMtG0dE9KOzOS0Ul5d7vnn6cTO8RBI5Lu4clV+yWEr8=;
        b=MxbKxDcx4PHQl5GaNh7kle4kzTgExITFM+X8D6zLgo8Sochy7bNpVK1ecFGxnLXmsd
         gabIZ4EhvQBRhna77XlONG5egyRzuz3b7U/kUy1nudx4TUcwkllI2oyq4v0ljm/3U9cQ
         FZsbjhqYE+4A7qoGair4ViZnzLVCtgTfwyHAAnq3VJnjJclJIJphB57hytnjA/2bNkZD
         AEwvIHt3fN8KXkjndv9P2tdrveCeWHfW0p473RYkYinF4HbHawcrFcrbEKhMpwSibNQW
         x+c4tjIEjykOiiheiOEngEeJizZYQB72S7xgTM5PXKeKzyzo1FIWKVrcQQ91pxDs+0Lo
         l1sw==
X-Forwarded-Encrypted: i=1; AKwUvBxopFXZVx8r6cGGwv3jFbIpTnlb7xN9KucOiFlWCi3/HoOL0XzmdUUNFVS87mkydw3LNo4tsgQhFx6GQX0=@vger.kernel.org
X-Gm-Message-State: AFuF++lv5KgXXbENNrnNAwmXMB3tIsC2Mt7VOQbfxONM3qHcsyIMeMqX
	1wAp5rE7BPja72EC6NXFPuQaOVD8LaICcNb5i0kXLtsk8zIgPOvchtzfwxAtl35OsUYLcIyJ7jq
	cR9zGxrrAp9atkusaFNzGJ2wRavWKJcYPJVJp+wcA/3d/yGCHRKE7JYs6Zf0mbLjYjs0=
X-Gm-Gg: AYBFou3j87MOOEHr++xLjS/6+Hby+r9L8qX5xvIBMkUAlFBN0ddnpbdwh8tUlA+7CeB
	rKG78+jG/7QC+oN6Rg/OTC5qGU50YoByt+1T0gwKjroQfUnPtGFAfd6MJMC/3hpa/6lFEiaVoRb
	cs+Dw48eIjNiF8auET7E3L8jtqBp/q5Z49BgJ++KLefyxmu6+btaJNRokJdItsAIM9228QrsrkA
	bR4dJeFrU+EQSWOziBNE9w9lYCJEa8/UulMRfYqP5RUwUXUERrZf0pPqQr3NhV5aQCedTLenjXC
	dELbokWefk4fKVA9jo189uNoaABWTKVnJ0xriMxdoGfv4VSwDp5X87nMFTLfW8p+3KuhDCk8c4C
	FrFxh6PedeyWWSpi/xjczoGL1wtxdRQ==
X-Received: by 2002:a05:6820:6ad0:b0:6b3:6236:6fa with SMTP id 006d021491bc7-6c7d1cbf597mr1540866eaf.21.1789545916586;
        Wed, 16 Sep 2026 01:05:16 -0700 (PDT)
X-Received: by 2002:a05:6820:6ad0:b0:6b3:6236:6fa with SMTP id 006d021491bc7-6c7d1cbf597mr1540838eaf.21.1789545916104;
        Wed, 16 Sep 2026 01:05:16 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395bf6e8esm4914471c88.0.2026.09.16.01.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:05:15 -0700 (PDT)
Message-ID: <5ff87d08-c263-4b9d-a18d-c8da8fc0de1a@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:35:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] regulator: qcom-rpmh: Add off-on-delay support
To: Mark Brown <broonie@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, robh@kernel.org,
        Saikiran <bjsaikiran@gmail.com>, monish.chunara@oss.qualcomm.com,
        nitin.rawat@oss.qualcomm.com,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        lgirdwood@gmail.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        krzk+dt@kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
References: <20260127190211.14312-1-bjsaikiran@gmail.com>
 <20260515111647.qg75thdvcbvvjpoi@hu-kamalw-hyd.qualcomm.com>
 <06a264d0-6a14-4b71-b783-82b771f04411@oss.qualcomm.com>
 <oa3okt7mdhoqmrebwim5yswarbcacbmhpwfvqbhtv6ib3cwrwi@ddox6mw3uhmy>
 <0d4fa333-df22-42b9-b9c2-ccb43ac4fac3@oss.qualcomm.com>
 <3pybhkqdvve2ct6burnhav3utis6nljz7ncheqcrs7v55ullz4@nek57empeoca>
 <086f8e7c-0afa-45d5-bdb2-54ac5f79eefa@sirena.org.uk>
 <xmjovrqonged7m77zlx4gbz6xvfksygbw7g4vgv2stlucvqoy6@uie3qdhdtkoe>
 <aqg-JSTrbg-xR69l@sirena.org.uk>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <aqg-JSTrbg-xR69l@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfX6S+1m9j0g1Fl
 JpRL8Eo76yXifLRj81sYOi8TbfFzCu4PMN644lYPIZcvq+GRhjFN7sjKCsMoiekYdw2e3qz74a3
 sgvvTFMubx+0/Pspuh5xXGgfDAH5f8g2ibS+Cy+9IyS9LJUhJIU7qkjfq7X6NKcOU5SWMd1UHt+
 x1wTFIZ/8QwAa6883ao2ErQf8kF00HCO7goRhorfovrOcRsweD3GHPSS8dK9+VzY3jfxBZA9XEb
 /n4NYl5heZW7oaIUnmXiDesp+hCiyajU6FoMnyOvPPprVftbipa3PowiG2NuQooN18/ga65p5zo
 tfaK/WJY+n0rB64csEcaP8gUAVf1Ya3+Od6606e+WCLTuBMYPtwZwvXi1BtTZv6w3L7tSxquGOu
 LTVta3yyBqlTx42kRScUbReN/D00/ERRgxtC853WxNlDXCJsZkO16GLjfhM6jGT/6wkU7m2mnz8
 A1JS5oVH4EC4WqvtemQ==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa4dbd cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=_IcSBqDZdpl3-7frVEAA:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEwNCBTYWx0ZWRfX64LsS1WBI/jN
 mJV0lAFIbpgTwvBVhlSo1d36Q68Mt31gBjdzrxWidd+lDJpDDvLdOJgG3PTMamgTo/ba60gC182
 hK41Ld0v2tJWBSpxpSGrV0HCfnrDvhM=
X-Proofpoint-GUID: ooi9tZYG3hQloXBOwi4Ft7pHsYDtZcrK
X-Proofpoint-ORIG-GUID: ooi9tZYG3hQloXBOwi4Ft7pHsYDtZcrK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160104

Hi Mark,

On 9/15/2026 12:04 AM, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 02:34:21AM +0530, Kamal Wadhwa wrote:
> 
...> 
>> 3. If we can avoid turning the regulator off itself, so we may not need this delay
> 
>> point 3 - We evaluated this for UFS - but the problem is that the issue happens in
>> the defer probe path, so if we avoid turning off the regulator, it leads to long
>> error prints appearing for the regulator being left ON. So we couldn't take that
>> path.
> 
> I think Rob might be thinking here of something like the runtime PM
> autosuspend delay where once the final reference is dropped we wait some
> time before we actually implement the power off in hardware, thus a
> quick power cycle would never actually get implemented.  That does sound
> like a good idea if we've got issues with quick cycling, obviously the
> actual delay would still be needed but if you've got quick bounces
> happening routinely then a delay like that would allow you to avoid both
> power off and ramp delays.

I'm working with Kamal for upstreaming this series.

If I understand you correctly, instead of the approach in this driver
change (only setting the existing variable "off_on_delay"), you prefer
having a sequence somewhat like this:

1. Regulator (if configured in DT for this new behaviour) gets disable
   vote from its last enabled consumer
2. Delay timer is started
3. If regulator gets enable vote before timer expires (quick bounce),
   clear timer and return without touching regulator HW
4. Else, disable regulator when timer expires

Is this what you meant?

If the above sequence is right, where would you prefer it to be
implemented, in the regulator core file or our regulator driver file?

Thanks,
Jishnu

