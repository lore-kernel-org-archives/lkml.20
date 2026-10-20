Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533776;
	b=EpaGLYRuLyVQGFCUA0xEnnN4DmRqlaoYKw100xDbpLM+PReGioAr9sVJx6HaQHSSGHDY
	 rZwi1s7VfvucjKuHsx47kT5S5/RLhiXZdDmMnERMtrJrizz2na0k4QNgW7CnE0cG+OMk1
	 aZ21wTwC7N7xaClHSR6yYJh8FZoItlqNblraQ3i0u/w6/Lv2U+gkPF5Ki91v+ScbjN85J
	 Q/bJS1pVfdMOzgC6tUkxar4Y5sRgYBnsDq8cfrjM+44ZbFvYGScMtAD/8ZkCvtSDq59d1
	 teMs0lRX/r0BvD7lNydlBmFB8y/vITOD/6t01AzuJ2coQNNEUjwcixpR2Sabj+icwuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
	b=yz5oZaQDQSlu5TH1SysBzxSIdqT13ixwdGMoTNq20hF3WEEM/mj3QZpNL6G1CH/gR02A
	 bVrjFhs5z8CqI27CDKR+gD39swBnfHNvm5l8Nji3Eh6F7Sw3lH3ofAcWvVWQEa2XnUREg
	 uWBS20Oyz/4WIuVxHQEfJxrBgDlezwcooIJUn1r3FrCvQFqpX37OCAj1vB7FsBIOS94Ud
	 zmzBArIuKguyJkpjElQTUQFuU2txr6BK8AGriE+TYKJfrHsWFFeI2WIBK8BJcszfxgsBa
	 /kOAn9wWd/vtGOfnaHNUvfBpEp+uQucXP8SxqM9LUxUD1D0bLEyAbRXCuS5Q0wDNltg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LDY8IEa6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="DyNbKyS/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D23606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:02:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10D23606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LDY8IEa6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DyNbKyS/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KKtrac3229626
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=; b=LDY8IEa6lDdsm2w3
	HqtUZtENLlOIbAWt9TMOBbwBYjuyYuMzwXJcCMlkh3d83vFKabVZ8W8dYsTlVByf
	Py7MKdIn1jF8WDtiFvYClIe1mV52trAeKPhynKB+8BaJEV/9K/ux1LZsveN4dYPW
	C+MeI/jO3lsS2tX9V6aWJUEfD9MkFM8TKTsoyFf1ImdgWS+LB3oM9JyYEgBL5JR/
	rS4xkfen0ATt8J2DUpPAOIIIgF+ufvgRt9PkHCkpT8kpePGDgE/9/s6QwMK/Z15f
	s8CgWWRZvZ0rYkCsE3Z4PYN813MWb8bL/vneGvk0vIm52NWoxo3diBEbm1+1kh5w
	a5Hdyg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nvjx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:02:53 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so85433eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792533772; x=1793138572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
        b=DyNbKyS/YQjoXyGKTttNzYfPc0lR6OGeBsuCTfbUrnhnX26AHyymskivASaJrky1ph
         sEtfTolhx9ZBuMuxr16pTFsoVTDRM6p2fccGJ8HuQ/0o4jUFdoo1lZ5oAP487/NCTc1g
         Ajz76KT4k7nNsIqXmsHncNleufp7PxbVGeD8EAkjtlDAircbstoKzDsXwErjkWkIqi4y
         Go3nzPPzLwtbg9B7zfKqDjtmG0nqbvhNcCteWhDVrM7CaHo8I+vXLIIL3j5jbtnLsG+0
         XRRT+9XJgTu4KPC6bA5Zkgl1TZeiNYQJ59Dx3gxtvTSn7nMxYDhl5QOBnnxDQHZsXT7Z
         8bcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533772; x=1793138572;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wKC3LSlwdLktv3Fue/Fi/u2yc2DjRK1grGd0eHjkzb4=;
        b=Vs+hGWc2WmSdmQLjnWn5f+0LhoV2snvZRXnc+puKvH4PJe1xB1hDgWAQ0HfhtstM0g
         zFPLTsIExw+F26TQI3AxO9Ed/uH5u2LGDHvxHDb4xQp4jOPxmdwgaKR2+rN+PnpnjjbS
         ZRRDH/IvRt62FbzvoeN398kCRs8UKWXSKQ9C781cgF2vVP/7aleCdJX97JaO2tCuebmw
         Na/MvSp/owayLDIbvRYh6r8qh42wr7nmIm8/ROZ114oQWTV8dvTdfV5O0uk17w24prqs
         xm2hhs7XeGQPZ2aOzsrzmX1nPfAxe71u0f6tsbd9RVF7WdbfKdxJHp0yT5w3bsnReTXL
         poIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKkMgqbOC26aKsnpQsgA1WBA/kq0kYL6RILPm7R8ntzKatF5e5xrwS4WeJLA5LxNP0dVbFeOgMO/+bcAo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgzbYXMNxEIRsMkFvE2tofkGAn2eBBVBKnAeJPeLVgwRr2Csub
	qnNo2MlayOwqBhyeBqw1Cs/S2/JekpYzK2408SnOVh2EK0y/ph+we8ZRH6KYLAeqHtaLWLJ8ii8
	aGBiG+zokS6b+ATZPxJpYV+g1/QyNOwjRDu4K7zySF3rKlgQfDSsNPdlAhQavebvB92U=
X-Gm-Gg: AYBFou2005i/z4hd05iBHTX7ghbdpLvqJYbOz61qJz88C7PpZNiVbBx38UuUw4EoD+t
	T/k52s4N6AM9TvnzPX66b/UYGf6v9GkNRVbJndGMcpQr8Sz1Meb5HqsZWquL/x/Dh1cGVvDXnHG
	FCl/5Z5DYFSA9rHilwPvXjMA9++6p82BydL07ep2ILXPw4Xh2CjdpJ5cMO0L+m34sZ7mLX1D1ov
	6MD+U3TDCTCN+r5BdSrlONSXpTLRpBCq94PZTNYjLAbfV0sEhMDnRFZtc+ib0VomJGipi/kxoz1
	QJEWSK0fRSKF2CjwhFsonsr4r+1wzHpAcUaBCBkU80KZHEAzeGHJCdwdY5uceHapjqbcLFMmIB8
	ihAELMrYnftlFRSqD18EO8wsRI4Gz/TDXDD5C2IQvysVklOuG39uJpEt0
X-Received: by 2002:a05:701b:4286:10b0:16c:6459:35b1 with SMTP id a92af1059eb24-190a599b411mr185233c88.28.1792533772130;
        Tue, 20 Oct 2026 15:02:52 -0700 (PDT)
X-Received: by 2002:a05:701b:4286:10b0:16c:6459:35b1 with SMTP id a92af1059eb24-190a599b411mr185196c88.28.1792533771462;
        Tue, 20 Oct 2026 15:02:51 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903a180ca2sm1154475c88.6.2026.10.20.15.02.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 15:02:50 -0700 (PDT)
Message-ID: <8ae43c5b-b99b-43ff-a56f-19f4d5dbe176@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 15:02:49 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] phy: qcom-mipi-csi2: Add sa8775p D-PHY support
To: Bryan O'Donoghue <bod@kernel.org>, vkoul@kernel.org, kishon@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
 <EKfYfLCfqnEg_PLe_TsBkAGryJgP_tA140u-0ZYSL9q5kInrAtoRCiugYV3C2PDDvYjxaeejuYK3gqzAT4FMXQ==@protonmail.internalid>
 <20261016235502.2274268-5-anusha.nandi@oss.qualcomm.com>
 <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <392642ad-3bac-48bc-9199-8c3923c588c2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA4NyBTYWx0ZWRfX9Ml3cSGAbWV2
 lUIdhl5EifIXT+2GWAXYET/jRvjz3D1JpK7q74gmmWFASGwtMBAGUXZ2NzsVZ36KXmHdm6OT7ra
 1aY2rLTaQ4SJzs2zkOYFZ4PVCtB33bc=
X-Proofpoint-GUID: _J1ntBaBFBrhftbrDpi7bmBe67rCHEbP
X-Proofpoint-ORIG-GUID: _J1ntBaBFBrhftbrDpi7bmBe67rCHEbP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA4NyBTYWx0ZWRfXxw4cM0VY7ckJ
 BsnxACPe3VFbaJGW0M32htuijFLPGXAC/snY8oEBppGMuhGyJfqosw2lDg0oEOOxBrMWZA9uvEO
 J1VVAXEELAL/a4yTwvlOkVu2o9iM+BWVLXZeoYtuaXITUvOApYFzyiWVBvg9ABGeGxd4Kj0Rv41
 ZtMzPwdyYgX6YqgkMHmjMiVSFYZI6FEflacSkueQWEAiGCwjW4a3KAQaDGtbuHBIhmZMeVQOtfO
 G8UoGTZNLjji5oxeV60eZ+mItlip6UQ/tcmgepaGgeaHpUtot4RW6URJLe0J88EKoP6W8YVzBjP
 b6SLxj6BQaaNtrUmdL4GUleLAx6MFZH373h0njd/B+6CmxusaWKrp+O9wK7hl6az6+iMfB6YhYQ
 xAQRgPYmS8m2QjOv4Y0sXZHrfZLLxOImuLsn3xo3+e67UKPaoHCPsr5CkHddzFbfc9+3L//VVKa
 TPR9IHFiZsq+4zh0IzA==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7e50d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VjktAE_kRdQNXcrMly4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_04,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200087

Hi Bryan,

Thank you for the comments. Let me make the patches specific to the
functionality and make it more granular in the next version of the
patchset.
I agree opp_clk is supposed to be optional, I will make a patch for it
as well.

Best Regards,
Anusha

On 10/19/2026 3:01 AM, Bryan O'Donoghue wrote:
> On 17/10/2026 00:54, Anusha Arun Nandi wrote:
>> The timer-clock lookup in phy_qcom_mipi_csi2_probe() and the OPP
>> clkname passed to devm_pm_opp_set_clkname() were both hardcoded
>> string literals sized to x1e80100 ("timer"/"core"). Add
>> timer_clk_name/opp_clk_name to struct mipi_csi2phy_soc_cfg so each
>> SoC can declare its own clock-name strings; x1e80100's soc_cfg now
>> declares "timer"/"core" explicitly, with no behaviour change.
>> SA8775P reuses the same "timer"/"core" names as x1e80100 for this
>> pair of clocks.
> 
> LoL I had that in the last design and review said "hard code it" happy
> to agree with myself in the past, however this change should be
> standalone and precede the Lemans work.
> 
>> SA8775P's CSIPHY has a single power-domain, the Titan Top GDSC,
>> matching the legacy in-tree CAMSS driver's sa8775p_resources.pd_name
>> = "top" and the existing lemans.dtsi camss node. Like x1e80100's own
>> "top" domain, it is not OPP-scaled, only kept enabled.
>>
>> Signed-off-by: Anusha Arun Nandi<anusha.nandi@oss.qualcomm.com>
>> ---
>>   .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 112 ++++++++++++++++++
>>   .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |   5 +-
>>   drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   4 +
>>   3 files changed, 119 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/
>> drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> index 966d79c98f9b..85e89235f7c9 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
>> @@ -380,6 +380,118 @@ const struct mipi_csi2phy_soc_cfg
>> mipi_csi2_dphy_4nm_x1e = {
>>       .num_supplies = ARRAY_SIZE(x1e_supplies),
>>       .clk_names = (const char **)x1e_clks,
>>       .num_clk = ARRAY_SIZE(x1e_clks),
>> +    .timer_clk_name = "timer",
>> +    .opp_clk_name = "core",
>>       .genpds = x1e_genpds,
>>       .num_genpds = ARRAY_SIZE(x1e_genpds),
>>   };
> 
> Yes but split it up - "remove hard coded timer and opp names" - actually
> you want to make the OPP optional no ? In which case you'd expect to see
> a patch to make OPPs optional - instead of folding that into a
> functionality drop.
> 
> Because say we want to revert or re-order the addition of Lemans in the
> git log - we then have the problem of mixed functionality.
> 
> Or say I want to cherry-pick a backport - I don't necessarily want to
> include lots of SoC specific stuff that doesn't affect my part.
> 
> => More granular patches.
> 
> ---
> bod

