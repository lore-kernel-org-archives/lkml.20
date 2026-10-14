Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97555D86E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791995749; cv=none; b=OkzlMiHb0b8XObTkVvdEY6TMxUSkEGIjedEQPzH/R1MgwXtSSkeDt7N7smcdky6UnAwFwU1IrdDCA3g4YwfTJfE3ZqsZum65BfTjlylcOemB45ZBe5g5yTFduMRHokIpYYAcd068/8OxFDBsZ5lkL7Tk8iV1wOMI/6peBOua6Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791995749; c=relaxed/simple;
	bh=X7mKNHor3cLzTX4RTHI+QUppUjJFb+b3imTL4fc0ThA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbXgckNofue51mN42/6bk7zawA/VdtFOkT2GPWalOjPlWmumN7t79nNaWMweZh9fhPqham/ADFHx1dfJOTmVr1/eccEoqpN9AYht+VQYx1ul3gfkW2F98+zzvpWWMKVHRlBpB5dILHfBYA/tyP7eJ8ZARFn+vNQ/n5ofGENNzjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ct5TPH8N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LPKGg5rR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ct5TPH8N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LPKGg5rR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbRvO3813089
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HpmIVHID1TA1uCqcusH2OmX1
	9l/wk4ki8tc/4k57N84=; b=ct5TPH8NgJ+6hz9IIbYXlJOOpxRT8n5U7uAB9ouK
	COsMrXkI4FmK3lof4Mz73RkJFJtTbOh/zK8swqvWDTo+qdZSZTHFUDviu/5609Xa
	qpeHhbtPHsSnjFifl16byXoQ7NC/sByLV+EtHqNAHOUzZ0voS7TjkmGb6mTzN6CC
	EwmQG2T8PPptEvr8aTIcwHokuJsb4Gl7RsCLEdIGaZkZh+7oAl+88uIE4m6tM5Ot
	r+OfbYLPMyMNilHf/HHSPxkZWM6oYjHdmpSXYtOYbIHkbtQ/8yv4wqo/IXf/s7oN
	Cn+tn12kZF5JxLbHEiPQcoa53dmWG1Vk15eZehqLBoTRBA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha46u2j9k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:35:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91064f6e75bso152341876d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791995746; x=1792600546; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HpmIVHID1TA1uCqcusH2OmX19l/wk4ki8tc/4k57N84=;
        b=LPKGg5rRpjCcgUaaNSFkzMk4CigG7cWS8QH+NolbnUltP26tye4FuBflfA7pp45ER9
         x4Jp1HDO86LkB1mieUMCVNrfEpwBn6dz87qbdORs07awhs3ZiYTqltxGBXZt/xWOPOxX
         QbbBVEYR5Rd52UsgflhpR5a1QFR/n/y2bSMBBDyH06gjSiTuuu4WCHo9sR6zF6QkorJg
         x4Q7wK+F/tN9KUrm0hBEFzmuhVA06VYlEbtjOhJPD6B/tPh/mYO4HjXimsNrt40YuqaN
         LJEFuU2iwvujzzl80jlyOX9tn+5EFFK7Dd/0Z/movPsQ9bc21JNvPn7oahKSTEJ9CSDY
         2pUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791995746; x=1792600546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HpmIVHID1TA1uCqcusH2OmX19l/wk4ki8tc/4k57N84=;
        b=iWPCNnffFiJcmQ03ZPuu0hswTJ+Ng1hO0Vv1hFCjTzj3ZEaVIdMru3SmcHoJFt3Zp7
         9eAw8TQbfW3qe/CYHSyHosL5stha6cRpAi1w/i9FkolLYRnsI331pT5bjGp3kipvLKvU
         fsEzjCkEkrCBKVUfdOe7K8D7ODtEmXDBuy77t2LHkG7SkeXqBBFAmczg+uxDfC72gKvv
         /bXJOcXZKPFtMl8bw9BcCbGPvXYENHpNUhKb9B9M/fS131upWG44IR/AlX4mw2ZGXVCq
         pgm4PkRPMjYk09Wl85afVwwHvW63GzYmL+YIKVF4zpUGh9NM+nWaoxXU34clEaQQlG8f
         ULEQ==
X-Forwarded-Encrypted: i=1; AKwUvByfbCpG2u54fQfnb9NjxiFmDt/sw4SRNATc7TJxUKCh/q1jSEMxdOXng0NEbXcdfKJ0yavyGdeYU6ICaTU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6U7CnX6tqqw2ha+INRxGFd8j0LL5PwP3B0PfTROE2BjpMZmwr
	VlBrr0a00CtU3zODuSkhkQjgAsPtxSJ+Q0PT6y73y/NXK/NtAVmnOnzo9p65z7bvW3gU8tnvvej
	mtOD55+ggWkIytuFAho8KHtPKQSOuEk++aEDmGRVS2PDl7WIeEbQIK3X/GBYOxmICKvg=
X-Gm-Gg: AYBFou0o3BNjmaDTbkWyfCEDOIID/CUiPWdIJYaQ8+R5FOAHOrnTUE19AjZpU6+OAyR
	81TljIMI1xvnyUAG99Yjc1LW7D2As9mX2qGFRgDvEzFbS3sEMQxVY8h4aeK1iGtZRqPdex5qV4R
	k7wKc9QdTZXdC+zgyq9x0LE4yzKH0re/XLTkRAABjjpTPEPTse445ndVap5ORh13N40CS9rmBmg
	+i2LKYkrgVO9mqVd2igyMjCIkMTjZ67RwGqOGMRc8YWKeMYSSuvLcSa4XN+8F1pHJB0/CpI2kAc
	DvjcfVsgxgoy9nA21v283bZ121kSd2/rN2IJ1w9ABbXxmhhRt4NBwxZ5IsuvUutTmawpn55Nqk6
	zlMMfC13wsfMZn22XDkMF9CDc0xyQe00t04A5OpDP4G9u1bou0bofU6i7yewpN/Nf7ywGAocqvx
	eVE65V4OTUbCte
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1967088685a.82.1791995745853;
        Wed, 14 Oct 2026 09:35:45 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1967085285a.82.1791995745377;
        Wed, 14 Oct 2026 09:35:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33da271asm764183e87.81.2026.10.14.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 09:35:44 -0700 (PDT)
Date: Wed, 14 Oct 2026 19:35:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
Message-ID: <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
 <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX7hqAoNJ6VY9O
 3jmfKoD9zQzPEj/Al4quT8WjmBbcGPsWPDvN+94sUNLHZggZgYHQoh2TK1ab+RYnFqyPxMhOEbC
 Q2jbvvMu9k+Mt1Ux0mRi8LRBI+BSCHk=
X-Proofpoint-GUID: aFRRhxjE4wq6LoiIPuCn3xaJ4UBT16V-
X-Authority-Analysis: v=2.4 cv=Y6ttIReN c=1 sm=1 tr=0 ts=6acfaf62 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=N4fB7MosYFnxNERqB6UA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX2ISjwChX2FGm
 BfVWcDP80OJjXOBYypQ+FLd7qlM4wBv9CN4j+FQtQ7IZR4Q3NgCZakPAfKCcdZocUDZndEV+CD4
 +60RuNFbxfhpNiAuy5FAccMtYYv6z0axdXqO2Bfzd6izZqLoC7i9vk+qG60usTmi2IrsjjTL0gc
 b2uRcKplg6jrE5g658KMDB1/ugaCihH+Kdozmmj2DWrWIvYt+K+A2rH11P4YHQiA9ozd6TP/TK6
 YScktGUvoZHaDpM2TqVIu8SRS48P167NMdrCt0jygziKwhgTLnFRgQcfteBwzt3HDG6f4htCdtP
 AO+YFGDLQT5wt6bGVQeiTJyrkLzi9hJphm7uxpvBenmyhbI0FoLeAFqtneRCQIcrskMlwQhNpBO
 w/H6PfVXPEIPOUlrSucdy4EiF9ZGUDFBQBerFgFyPKTNUhLeiytx1/xx39mZ7IhycA2Ny1X7/4r
 9EcB2AU328pAa2YVACw==
X-Proofpoint-ORIG-GUID: aFRRhxjE4wq6LoiIPuCn3xaJ4UBT16V-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140066

On Wed, Oct 14, 2026 at 05:22:40PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> Make use of the clock-dvfs infrastructure and fill in the power
> >> requirements for SM8650's clocks to ensure the hardware can operate in
> >> accordance with the specification.
> 
> [...]
> 
> >>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
> >> +#include <dt-bindings/power/qcom,rpmhpd.h>
> > 
> > I've commented to the cover letter. For me it feels like the layering
> > violation.
> 
> I understand. I still think it's okay given this is a driver only
> for a specific SoC.

Then soon we will get MMRM submitted upstream, which (currently)
randomly imports a set of the clock ids and asks consumers to talk to it
using the same clock IDS from DT bindings. Doesn't sounds like a good
idea.

> 
> [...]
> 
> >> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
> >> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
> >> +	.num_pd_indices = 2,
> >> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
> >> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
> >> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
> > 
> > And does it actually have the same vote on both MMCX and MXC? I'd need
> > to check the clock tree.
> 
> In this case the RCG needs VDD_MM and its direct child branch
> needs MXC for the flipflops.

My question was "on the same level? Or on different levels? In the OPP
tables we (should) have 1:1 between scaling PDs and PD votes. 

> 
> [...]
> 
> >> +static const struct qcom_clk_dvfs_data cam_cc_cphy_rx_clk_src_dvfs = {
> >> +	.pd_indices = (const unsigned int[]) {
> >> +		DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MX, DT_PMDOMAIN_MXC,
> > 
> > Three domains... If we want to have three votes, we really need to have
> > three votes in the .rates array. But then it starts to feel like an OPP
> > table.
> 
> In this case, yes, three domains, same RPMH level for this clock alone.
> 
> Konrad

-- 
With best wishes
Dmitry
