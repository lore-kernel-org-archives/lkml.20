Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39813AA50B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272509; cv=none; b=meu99EudelW3j/AIGngrSjo+mb+1Eztv9jtrQUPCN4cJYqjIn0+R5w+8DMfgo2o0Nq+dWgbMllyxyGCJszv1vUrMpgyfqfKQ96QEcrzbOGaWW3NZZXGR3KVBc0a/2q1wCzOlLvDIbIZvGO3UxBw3c7K+VEf5XZaO56mYka0eIEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272509; c=relaxed/simple;
	bh=lK07nJooOXrUnR/T+SY3MJcWCkqipmciLNKYSSDo4M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RjWtHLBDWYQkBgLGrSaw6hilZ7nk++Fq0swKtwRjH7omrZAXT77rTgR6imtmU3HNNRSFzjRpreHCrreqkbJbUQEYfmeAYMuLPBz2lsi7tV+lUPUImO+816hp0u3ish9qoxLxbwamknMqyHLC/4v7hfi3swnla9st4wObbTtZ9Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dqp522Lt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFfCcs+N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dqp522Lt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFfCcs+N"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8lgc3913902
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P+rS2sPfhETZrCJHKuB2Ca39
	aAmRCaMxY/CpKlOj7wY=; b=Dqp522Ltz0XxABpnoLQXB5ww21Fyb9eOc8goR3W3
	c3BT6sRpS5XwAahdlXPBpG6vM0v3Y2MOG3FJhwjySTzxLN40WBDYhxfajflLitLe
	6hqeNuP77aVS13YXYUjK5REKmu1RxLEp0+F2ZZ2s0nuir6rXLdzFReSTbGEu+hhr
	PD3877qDP+UVn9qvOiprpiynE/Z4HlIkOR/DnuAwETm26OW+eRory1+pMJ7Bkv5O
	BMg+rtAQ60d46mg8c4w0ELeo2ATyKIz8qvBUEzv5+vv0N0UKroQsDYZPwfuxEk+T
	NfsybzdUp85hpcCbNDIRcpyfbCfZ8s5gvgCQLdZD+rpHIQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu20ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:21:46 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c79915791eso264595e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788272506; x=1788877306; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P+rS2sPfhETZrCJHKuB2Ca39aAmRCaMxY/CpKlOj7wY=;
        b=FFfCcs+NlYW/aN5pElNm7xxcM1vNf2XzgA5HSLrGgSkAHhUnjD3urpNM5axZxA3bOr
         P7QMKZl3tQgS8EWN6U9s1VZl2D2sWywE+KlhbAvP3T/g7xiTcpNPfmXYgILDFYUVG3ut
         gx3TUXkfmvDzPKYdZskBxyBAmcpqYc2xohtGmineQREfLPyVJovqDs170V1QDi8lASe+
         AtnQylQB6t4QYkVcaz+tKwz7muGKXzJtODsNkW+Wp14T5Skqe2Gpo1SY2OfKDONPqBSQ
         phehPAuXNgwOjtzWC/dmtLEbCq4KyizXLtkfrGkfeuQ9qgyJaMezZVEwz6iivP2z5PCl
         Y9qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788272506; x=1788877306;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+rS2sPfhETZrCJHKuB2Ca39aAmRCaMxY/CpKlOj7wY=;
        b=ptVqstOz6ZSAfWZKsvf1P4B4h+oRpm9n+feRDJHasq0jtoPghbtZZrVecjY2v4LgXD
         Y5IglO6272eU6e7Z4e6Vfhfyj+Cf47R8t9x9sTGu/e5xA6pnGH5ol3F1/ACRK0b5M/Pe
         Rg2gqpl2DWYRhye6phJZesq5hbLCkNCisGXoF4mikKNzYrRUhdMtki44WQYOd5jvap8E
         uTKBWX3Nbp9Y5p3BRC/QNeybvn8TZnpKA2FaM9nKZKzp8+iwHhATMJAQbZt4bQJWjQlj
         B8fAuASgnE9gMe92bPsRrHxEwbDEKXOQuYyuIe43+3MMgR75WCQdzMIyI9Tne/n7CrkE
         OdXA==
X-Forwarded-Encrypted: i=1; AHgh+RpG4783QHnCn8HHSuFLno+MVcEMu6BKDRPOINvYKBkn2VDyiOHlQWKe+N2lgtL3ZeDii5oAWbsRpbT9cHQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kdBsUG3JFbEFauATa8Rk0x4Qz96IohZ9EDAGm9qzE8G2ek6nSa
	ZqbB7h5vcMcZiP+YYFWAouCSMQ/XjjvyupCPq4G8myI3Fcz8nAO3L4t6h6ITz5a73obcVkt9HzD
	7VFW/AUbcpTCR6ViIRh3Jfh+2comfC2RTYmtarGI2GEPxD4EWffMoQjnf9QHfE0/3N+o=
X-Gm-Gg: AR+sD101oEUn0vXzailx9jh8GYpgPvpPWcQHayBVQ7WzoQHFnRuNKH1ECLWzTiH3SVi
	ZicOYM0Ih39AM0j8nOb25+OIwii92XMQy+j6EiDesuAeuukLguOuyy1Rqda+IbQbFzaLrr8G5XB
	2M60uqE2Nt/YL1tBTS7ztJMGdsNdy98QSV5kSur12lfgcqNw2h2EvGzO0gJVKV6XBN2+VVGnVHY
	ZYAj3TfKozyusIEH1ZzQ6uarNb/xy/zdtfcohYnTu4WLSofbDJciN0uKEBAq1io3fRjUe62Y8dG
	Epd4xS5NARaV7XGrrkfUHxT/ljmLvPYJe+1MGCRPKaV0FNcQyoBI15xxy2FHdaP6qEz68A7D8gw
	0ioa1iHgHjFqfNg==
X-Received: by 2002:a05:6102:1621:b0:77b:b14e:b670 with SMTP id ada2fe7eead31-78598f4e0c1mr10247873137.8.1788272505357;
        Tue, 01 Sep 2026 07:21:45 -0700 (PDT)
X-Received: by 2002:a05:6102:1621:b0:77b:b14e:b670 with SMTP id ada2fe7eead31-78598f4e0c1mr10247829137.8.1788272504502;
        Tue, 01 Sep 2026 07:21:44 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce089c2sm70778575e9.2.2026.09.01.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:21:43 -0700 (PDT)
Date: Tue, 1 Sep 2026 17:21:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sreeshankar K <sreeshankar0910@gmail.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org,
        konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org,
        radu@rendec.net, taniya.das@oss.qualcomm.com, danila@mainlining.org,
        davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com,
        linux@gurudas.dev, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v9 00/12] Add initial support for Qualcomm SM7250 SoC
Message-ID: <as35xamspfwpmbravcz6g4miz4nfotgsmg5afchgudoh6fd3kz@kbp7kotpxyet>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
 <prxk6xpxeoebz5da52a6bjgmaaop6mj55eemxdm5cjxm276tyi@jfeziqcrxtfv>
 <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA-+ukJWFm1YOoWTO5TmuF8ymNuRGtsvOm4zruwUUEGpcmKNjA@mail.gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfXxVt0GPE2MQYG
 TdAfrsHRZAuLNVUSgFI0/kLUwM3HwovZBhv0yaE/zQck9JUq1woWAvbuLLbE6V6ZJbWJ6Dhj1Nl
 1XYI0bx1nvjTgCbtoMscNikVlq1NI3gx3EJhIVyQeBpyD4HuS+CvvYV7ICzdgnaKbHjCuCPQKxB
 6s4kf5waL+BJq65oaEXPx9QfM3hRaE/QOe7KSwPbm9AKJckxOV9J5EJYy1RaV1q36M+pZyY3RJt
 Wvfq7DpdU0MQYSQ1YYN+6hB4kdH22kJzU1ud5vecHdWoTmGLyb921UGUr77HkdT6Ahsycpo8n/W
 IM0+4+/0NdQ213XwAipnStFDIXWz28/m2DzTasKxC6OQSFyl+/vZKKSGSgVMQHx5KTzQHC5h7oZ
 deMVF9R2H84vUrJYPmvXHxf0W6tlDygqer6huTqyBsRIcc3h6Nsa/d3gsJC6I3INsZeMGjdDmhT
 4eW0tJ88K2Wh3rpKwtA==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96df7a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=S17URGUXwItxho7lnLIA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEyNyBTYWx0ZWRfXxsxB2nTCNdZQ
 CKzRi6e9JoxyzT2GabvNGMJFsoNyXFVerGMWDrANKGYIscxoVL5L+c3l0ZOtovpNV/3z2ua+4zz
 fEK54joHTyLErvGKp2lrM5y2g/XrqbI=
X-Proofpoint-ORIG-GUID: 0flQjKQ9rVL-n-dXKOKFFt_4-BCdC7qw
X-Proofpoint-GUID: 0flQjKQ9rVL-n-dXKOKFFt_4-BCdC7qw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010127

On 26-09-01 18:22:34, Sreeshankar K wrote:
> On Tue, 1 Sept 2026 at 17:32, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-09-01 09:24:35, Sreeshankar K wrote:
> > > This patchset introduces foundational upstream support for the Qualcomm SM7250
> > > SoC (internally codenamed Lito).
> > >
> > > SM7250 is an ARMv8.2-A platform manufactured on a 7nm process, featuring an
> > > octa-core Kryo 475 CPU configuration (1x Prime Cortex-A76, 1x Gold Cortex-A76,
> > > and 6x Silver Cortex-A55) and Adreno 620 GPU.
> > >
> > > This patchset is organized as follows:
> > > > Document relevant device tree bindings (SoC ID, Kryo 475 CPUs, SCM, PDC,
> > > RPMh clocks/power domains, GCC and cpufreq hardware).
> > > > Add driver support for SM7250 in socinfo, rpmh-clk, rpmhpd, and GCC.
> > > > Add the base SoC DTSI (sm7250.dtsi) defining the cpus, PSCI,
> > > interrupt controllers, clock providers, power domains, and reserved memory.
> > >
> > > Dependencies:
> > > This patchset depends on the following patch:
> > > > [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
> > >   Link: https://lore.kernel.org/linux-arm-msm/20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com/T/#t
> > >
> > > Changelog [v9]:
> > > > [PATCH v9 04/13]: clk: qcom: Add Global Clock Controller (GCC) driver for SM7250
> > >   Make all clk_init_data instances const across the driver.
> >
> > You sent 3 versions in less than 24 hours. Please slow down.
> >
> > Give a chance to the reviewers to have a look at each version before
> > sending a new one.
> 
> 
> I apologize for my actions. v7 was the intended new patchset. Unfortunately
> there was an interruption during submission of patches, only 08/12
> patches submitted.
> That's why I submitted the v8 patchset.

Yes, and now you have sent v9. So even without the v7, you still have 2
version in just a couple of hours.
