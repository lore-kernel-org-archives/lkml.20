Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83A4E36C8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791984932; cv=none; b=VJ5HOaRU9lCD397afGz69ry5rCQCIcVbRbZLbF/AriWckTDURgBtAYejkKOwCpRO6wV2QbGduOyu8T70B3thL/c3aloCSyXc3ZS9FsgvGqvY+Wstb6+MoSCsSjZfWsLs/lsQA7vEkuQG1Nf1+zogAmSiAuyYRH+d49Vzh7zzz1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791984932; c=relaxed/simple;
	bh=IlpqbHrz26EweNTVebA5NYWFDrcc+dfp5s1FMniEugU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfInNj2dLsUMcmrYbVm+LA7ih5cQ+1zRfgQofvVv5OT85ONEM4E+8VA2i6epzWSLnvQM3XvFeqmAjSbGG2ppXWPHylQAXQeHE+gkKuM/Sr9CTnehPhbIdOkqQfP7NSu9c1DIXpY81oMxO+qaZ264MOAnTvKy9yYkrMjOKZ6ybFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YSt/rCap; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C6jgNpt1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YSt/rCap";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C6jgNpt1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EDPbG73018180
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3oJjtNP80ClUlRJQPIJ5xMzy
	E/SdWULvgaeOPu3tEZU=; b=YSt/rCap38oBSiDonvSoUHWYieDW7AA788/GQYdp
	XLSfI7xGEpPtB4boX8OLXzQDk+fVeGUQ7VGylvdw5mgsvd9T/NLoAD3NtZz5ZzP6
	3wnXds0whZCrHtYV0mWJeCYyHLhzb3sCEgiXlkbBhTZoxbvHWKcUQx63iEvUjaZh
	F/V7B4RRVZgCvCVQY9FnsUCjgsEQ19i9Pnp30oJncktV7Z877VVQlLA1zzTtyGVs
	faOK1oX1MzhSSMddM/HEB4wZF8JNZe87v87lecWDb+i1UKYMjSp/BC2bNZmk5Mpa
	und//Lrbq3Z41nSs6BTvUMWOv5BqGngNkO1wphfdKQe7cA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4hpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:35:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9104eedb5b0so12868586d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791984922; x=1792589722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=C6jgNpt1DWcLNRj4vqBChWiM5uMqjGW3n964BSYPPd/HvSoiIidMFNCVV3yPjInPDU
         CLp1WRvOH2VEv37kDSOfUEHXoTp6zjL8SwU/cWqdkJXRh7fim4KHGD87PjBFuU5Pqf2v
         odQLkQuSof9aJ0vFwtMbC2XVucu0Z3YpYhaO8XiANrIRRk74LKYQpfpaJG/1K+NHWcXC
         PWzw3VljDykEEby+dYb39YVz6nj/G9D3rVsGhOPROLoCxJ348HHtxCJNNKslCy+NdhPf
         fro5zB/UmqOglw2CM0rLSGPSHrAybyGEyZtGF+Oem0p78BDgYEF3LNIbOJ/n+nmddkAU
         ZjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791984922; x=1792589722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oJjtNP80ClUlRJQPIJ5xMzyE/SdWULvgaeOPu3tEZU=;
        b=UD/9cOVeZeIDpQhyk4VPFDJqjMjLVFN8BSjj1LJTpYimZ76nI1WKDEB3mqqHQCdG7A
         C5cGlzVoNYJmJ0F70yCQElbfDXAyditaLkk/jVOUP8YAUB5+mFaHNcJBBzK5mbBiilgt
         hlWRexKxh97h4h1kCoMVvTjaDnnhr9SwT9tqQ9nr30O1HmV3796ASWtrHos3BoIYula4
         6hlyjFqXIH32FiEO+jEPNegXcPxmdUm3RJNl48HOC92aSuXBCw7wPbGGTIzpUq4z6LD+
         a8AL1Irhn9CKqLoWF301XBxtzcSeJCOFM08bg5w+enah3APwdv0CwrYvCEP5wLKvyP90
         zyRQ==
X-Forwarded-Encrypted: i=1; AKwUvByevopcn3MoR1Ug5K+eZWbK8ixPUBEHsH0QI/FOtk5TI2hmWy/gyBdxcH8Cqsr5pxVhTFsur2qI6i8m6H4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXNye7DWDvW61RM+gMXYEvQS8/Wm+Yoo5jR146bE2OGkM21RN8
	iGZsq6ew6cp+ryO9JNdY2FKSTtxRqBhq6qH9RPMsgWh0X7WsA9uBnBNlH2arA0vfapKdXdMQTdB
	SvFr5KiBSx9piLhtScxHEzETg9Xcg31fQyJwUw0wwaTLJjkIfXcQm9NHiBWFEdkYchsY=
X-Gm-Gg: AYBFou3MlND1Jh34PT74nUfFHu1Q8AdUp0/c13LtUMtomy+BlysHaSm1Ls77L74n0pC
	By8i6KHFg7aOTiglj0XMGIo/jqKyJgop1kvHRHWnohz4yyXqghXMRhI1qdRZaAbSOVB1dGa5hEw
	YNfsy7Zx1qa52Bo48TEjOkMhQSIEIE+43M2sSAiqyrazMENX8/VEqdrRutBZh7qebln6OKyr30E
	psZIF+apu+Iu2zC+YOGQyUOQAZ445VPiZO6rTaOAlFdLmEh6ccff9rm0dP4ZIJ8/2KJFFcX3Eve
	VG8XfkTrxSQq4PDr5SAqMyuMGDMODaMDoOtaDyVJY0BxTBuIZOtNS2gr/MVdGNZ+6ZY2RHzl5Ka
	wmlh4HDIv+o2LeDITnffgJOF4XZx53Gu+rWLfFTsl2vwRL0yAek4rOfyseEzz7HNsrsRwOpGDVq
	6mMNn//YesZyoC
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236550685a.67.1791984922422;
        Wed, 14 Oct 2026 06:35:22 -0700 (PDT)
X-Received: by 2002:a05:620a:471e:b0:93f:5ac:14b1 with SMTP id af79cd13be357-93f05ac16cfmr236544685a.67.1791984921806;
        Wed, 14 Oct 2026 06:35:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d857d9sm662845e87.49.2026.10.14.06.35.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:35:20 -0700 (PDT)
Date: Wed, 14 Oct 2026 16:35:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
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
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH RFC 03/16] OPP: Retry failed default single-clock
 transitions
Message-ID: <xkiu74kv2biofdix25gimmxxzqfqyocsq3wvdriqj7zscpynv4@us3hib36vops>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-3-3041b788e9f7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf851b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=3h-aFR46GQ2hTHGVm7IA:9 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: VyF3sJFf6ERKB9oUhsWPFdCkoeJb0zVa
X-Proofpoint-ORIG-GUID: VyF3sJFf6ERKB9oUhsWPFdCkoeJb0zVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfXxZpIms1bAuZi
 zCeG64b9CJa6myIUCFqUOV0yROtlGYVwURhIvjbUZhc4LXVqEhP83Z8T9HJA/hxRDDl9FZk/HRJ
 d4kOGw7Sost6w7x6kPsd0YKGKNNzCNpRJvpwQH4CauBIHQfvJGRxM42XSXg0fi0WQdMz94dIO/8
 v4Dvr4KUxiyzF3Jciefy1SP05ct2gzjaSw8ThI3FlJ7x5zJMewLRu6vTtA8xN2jY5N31VIyzuRW
 Zjz5TkD1uunz4faX+7nowlOR/GIb4iGlS+xcOuc7Z+w3gofvAShOexKo5wYKfvGBLwMxyf+XNR/
 3cZYJclkc1G24DcZjSQf9KPZ68R42ZRAMVQgYPoHyaSBjZPVDYjdWnmUpfqANPBwKQimwYQmcWo
 lalym1NVuu/yPiBhXCJO4+tw4lajS3j5LyS5nB8qov9+zGRp/FRmr5aHtwqFcKdX/m3il/qKxv/
 z2widdULLiKn6B5C1mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NCBTYWx0ZWRfX9bPwcTSabZI8
 6A8QqbjYNSnp2fJAIg6+65xrLYvhIipuWow+K6F3YyDC18pt16Nmx4Td3qiLDOkTkQQvmwKi0Fk
 xrGMOKxEZKlGfIiHiEHpK401S5V5/tw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140054

On Wed, Oct 14, 2026 at 02:19:03PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> A failed OPP transition need not leave the clock at the last successful
> OPP's frequency. If hardware changed before the error, the default
> single-clock path can subsequently skip a necessary retry because its

What is a necessary retry? Shouldn't it be: try, rollback if it fails?

> cached OPP matches the request. It can also choose voltage and dependency
> ordering relative to the wrong operating point.
> 
> Treat an incomplete transition as dirty and use the observed clock rate
> to establish retry direction. Do not trust same-OPP or same-rate
> shortcuts, or allow table disable, until the state has been reconciled.
> 
> Limit this to the default single-clock path: custom callbacks can have
> additional state which cannot be recovered from a clock-rate readback.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/opp/core.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++-------
>  drivers/opp/opp.h  |  2 ++
>  2 files changed, 65 insertions(+), 9 deletions(-)
> 

-- 
With best wishes
Dmitry
