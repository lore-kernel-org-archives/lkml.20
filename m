Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354EE560AA8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996165; cv=none; b=PpPBS4Xvgc8ijcZEb5u2nKikT47PmVrtveLas+R/kk9aea5+Qw1VMCLPfJ3D9Q48/ZXho9omTya9QuimXgsQ+eo6qwwHcxLf07D7GI4MxdVuvQaL4+Thk45nQhWHoCHlJpPkJP1xC5nRNn3xZNgKbg7IOb8/tAEdHJBwY9PlN0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996165; c=relaxed/simple;
	bh=+5ByLKIjfqCvrkCU7NEJqSiloCHsqlgCQOrg6SvYrXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HXdtFpM/rY56KuXsk8fpeApBgsIwIHyrr7zlg7+D9urtqLycRLczBAe1dti2Bhf+i3PutaYZVGhYTMR+U1pFClANMDD2zNlH8CyIQMIUrmv+S2cf55vWfbQlWQKKTa5/uINAiDCS3q04dAY9EEZm3Ze/41EjQIwv0nVX6cgd4Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymax4bHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6ARyZHJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymax4bHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6ARyZHJ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EFpbcV1672259
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=; b=Ymax4bHa2o9Fs8Xf
	oMzFjI+CfReWH8It+9q8IN6PxA6f5+p0ncSJ4+4NMHJDIt/uxsJV9pNkr8m+jOxq
	kF/DppZiKZoHtI0Fi30rbnwUgBBQ3wEaj1NItVHcVoD1V9kJk3Gclv1VKZG3DKFr
	8yxS5GfvB8AXfa4IkrSbg9bC4SG9Fxo23kYZk8MXEkIJKa3o+hPWTI15v/Bh5Auk
	PbtzUApcWGg74HxQ+IS3YM/8gpAj9OPlbnaVhj8RdScE6okKFXifLoCmthjEbKzd
	8npKdrjMF3ed0tuGBLHPO1dHRRNQMNl0mQL9edtvK5l3HRbqeqCfUFRa29MyvOdO
	X8h0Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hacrh86pg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso64202385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996162; x=1792600962; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=;
        b=L6ARyZHJXpJGY8JP/n/M7AFL/gELUm0g8OOz15dWxLPNw2UzBHdUw1vMK9+I96QRh4
         IAYxj7XTQXkgUxSPZgqOn5NEMdxYSmokMrphRTIXmwBluJgoyIYmqNp+WICaAkcft3HW
         G24+DFKuhAPGsx/D0ssz01TfrLjDxe5ADMRKhM1tXWaLVV/bz7tkRntJlzY843ZrI27H
         44j+Ek/SVUc08TG6qFFaNnCzn1NR9GQ7awrpox8S7qqRNj0Heiv3el0LghNJKVTZgXgc
         WeeilyYczZCcFD0cSnkgklH2Ww9gVhuW7AA/Q7iaKHXiuBp1KAs3aYvAeAc58DX4yAge
         3Rdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996162; x=1792600962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=;
        b=Wyv1yNe42KzoWRD7ZgD8KSzinK73YpshNm2MVK3i4mxNLkTC1aOILfWUXHnux/VhGy
         g8hPUWFGmac6FDtyDB29FulRZD/ZBIhl0LkK8QB0tgxtV0vaXt0bBn64WYXe/UWmoXLl
         8ifw1phgToI9OdiJogev0OHRL/d2cob8J1qrAvHzKQ56il8eUocKEvr0VqAYwVZUPrhG
         16gs1EnpCa+z5tkH5oJJFMAxeiLU0umTlJTHZFlUfqcPDeKMlsj9yURcVxUgEiUel4vX
         zzBOIuEOSnAxK97tajEeyjMN9MjCY6Yhmd0uVF1ijz2xaB3qgH4MosTZu3ffe/bibzCV
         2V4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxyF6FGnM8zkATn4dleqHwNW3RjnIm2cviY6uDe5DASVUl91qJ2KfCPlyZwwuBbuylRVXwsR2MMZ2k7F/Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYISn9qr5qGBPuV1i8DcxUF79eF9O1OnUMbMJk2fFm5UBjlz3OLr
	oCAIbVSd/6ajgOoyPAp6wdF0RHESA3/neLD1v0T4n/z+qHJPklgbK2OfvXL/ZCGWslWYtZK5rzq
	auLIyPkHoMalPxSJIr/jO9nrQ3RzC0FoznaZBZZxk+EhOvSH9E7l/SlbrvOq0cuGiFWM=
X-Gm-Gg: AYBFou3/4PVr3FV64mXPz/LDs2/JIigInbyxQLjSMbALLpMF3ifPKMnEaUIiCoTl7BK
	pVPtAstkIWbsVh9RPOgMGsjQ/Yzf2Na7rmIVvup8it2EruUlwIWhA89BV5GvZ1So5Kz6yKL7qiW
	6PmclSYORn+l4WHoLAT4K/xbjxeheN5L/VrfrJEzUso2SUyW1W0JMOerqf34+e6qVGLvJ2lDsFH
	K4ThGYreDrtOVL8yGn7vEzFRAvd70oWT9EOTArE/QhO5kO1IUTnOY12t4c0lrxkJgIq+WZybO0B
	Rq538JCxpZv5JbXUySTBQDeCdClL1yN2Wy3ZA56QZhhU0RTwZjf8YuX+yysgq+SarXY+oFdilsd
	Zctuj4ihYCDFRpu6gEhMN9A==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr3053026585a.1.1791996162187;
        Wed, 14 Oct 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr3053021385a.1.1791996161600;
        Wed, 14 Oct 2026 09:42:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cf98sm4760366b.13.2026.10.14.09.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:42:40 -0700 (PDT)
Message-ID: <85f24f78-9b30-4394-9899-65e19eef1b16@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:42:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
 <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
 <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dqf5NTXndhpsQ03vcrqwG-JNXqZ6bCHo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX+3iy+db2wXZr
 +340xgRVN/5XJbfHGxN7SiRi4W0aOtYP54EmKDjguBmNKyby4iVLNtwzLWgugMJT028jIBotXBq
 K6IxsllYVLFmuBLcYOYDd0HLl/1SUTY=
X-Proofpoint-GUID: dqf5NTXndhpsQ03vcrqwG-JNXqZ6bCHo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX2SMAvS5eTx4C
 naiwewM5enOFIA4yNwQ81ET1t6w88xtudhfUUzynoMUNKMRptY/yGwMKOlW+W0KeLuU2SoZ7Blv
 ox47BuHmY0OIvh4lwlyTzf34pv364m2MTXEELfcn7ObRbLiR9ruzkiAT92SeiMPcnzwvoSBF0Rs
 vCsbVv8XI8/38vIAhWU3uwZtbtnyJZ9BOGd8SIDwY0nI/eS+mMNQIqqxsNdRpwMvvrvBpRihIHO
 k8hOtdnG4t8QiPVSXN+Z0LgIQZB4yeJIpYR/KmplGO14Atv+knFSwn6Seuhf6KKk+mvGE0RXJIH
 RziuqoHP+eDd+XQG+jzr61iDkziIlj2X66OWOXwUnPd2ORWtt/JiH1zKr6thjoYXqRdvAsBUvjj
 VYdEhvc6ZQtOlCJYkqYv8CWFXnl+vrE1E/ajXBkqnse74rfUZZXcp6fsGT1grAaQHi1uwntKTnj
 sZvK+PxUUgfXg4DfnPQ==
X-Authority-Analysis: v=2.4 cv=SYZi5fRu c=1 sm=1 tr=0 ts=6acfb103 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=lNqPBwARffoA8ln7mLoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140066

On 10/14/26 6:35 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 05:22:40PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Make use of the clock-dvfs infrastructure and fill in the power
>>>> requirements for SM8650's clocks to ensure the hardware can operate in
>>>> accordance with the specification.
>>
>> [...]
>>
>>>>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
>>>> +#include <dt-bindings/power/qcom,rpmhpd.h>
>>>
>>> I've commented to the cover letter. For me it feels like the layering
>>> violation.
>>
>> I understand. I still think it's okay given this is a driver only
>> for a specific SoC.
> 
> Then soon we will get MMRM submitted upstream, which (currently)
> randomly imports a set of the clock ids and asks consumers to talk to it
> using the same clock IDS from DT bindings. Doesn't sounds like a good
> idea.

MMRM is more or less clk-powercap. The data it grabs via DT (power
numbers) could as well be put into the clock driver here, in a
similar fashion.

>> [...]
>>
>>>> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
>>>> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
>>>> +	.num_pd_indices = 2,
>>>> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
>>>> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
>>>> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
>>>
>>> And does it actually have the same vote on both MMCX and MXC? I'd need
>>> to check the clock tree.
>>
>> In this case the RCG needs VDD_MM and its direct child branch
>> needs MXC for the flipflops.
> 
> My question was "on the same level? Or on different levels? In the OPP
> tables we (should) have 1:1 between scaling PDs and PD votes. 

On the same level.

Konrad
