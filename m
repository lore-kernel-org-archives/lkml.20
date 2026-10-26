Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020328;
	b=xc7WChN5I5qb437vHSzD8dep6J8lXXZY5DBQ328ZK7r2OjGnPA1nKkkY/xmVE/GqBNRw
	 nP9Ynkc3txUE38e2XU3dJbvBCGnQZZ5wyGuKJCWt3JAvvE5mDpvdRYXLaYMdQx+FtNOJt
	 TG1nkWWgq5oAAsviamtuDGSSF/TjQdYug+tUMX0+dzOEYjM2MfNZKHJHH3aweofPRzSuH
	 Pi3/5FS4b59yokJBtc/SnvT4HXvy3P6bf+/Br177dkqgNsNDLZpfsyfJezx6ijC3NiuDC
	 23DXfCllyjPRzH0sXRsPvdk0NkD3KK00VKz9AriZZFf8bogbT1TBaRMd1DYE4JaMf6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020328;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
	b=kwEhycqnQuEY6z07WpzYi9okckXoCvVSIL4iqUXcIXHqtZZLQGh6yTsN23bYLmzj6gNP
	 MBV8ExuL0SIOo5jd9w+phMYASs9cI/khNubVSoFhfhfqTokSrPIygS1Pyb8/l5kjHGy9G
	 9tII7tE9QXju+kwp1Nx0vhpzowUQL1kU1vZKK7HrgoTBiRvlpkgzOPAnto+k2xcDdrOKN
	 Reul6qaUvnq/qrPbQoOS990cbLASrQmBrziKBFFhrQOpy0Es1ZD6ioWctQnjvIduhfVL1
	 VkydRqpacARkzoge/6sIe+M10kALG3/NpwuUQ59vvb42iXRZCXwApr8ocOAOMJdomTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMKFgxSe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO3z7rc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9006606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9006606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AMKFgxSe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QwO3z7rc
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt9pK3049885
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:12:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=; b=AMKFgxSeuegHHZN8
	YrT7ACUt4stSsxsEmR90KoI/4kYGEMrx0EEbKStDk+nT3aWJ379akLCm44Gy5MLa
	xd2wBglGKOnnpfoSNI7DZb+EfSvwZf6KAUpb8spcbhZX3QRKhqXecACR1bS5nVKD
	bRX+9GJq8kdiPygSOYZYB5hTFn0meW65G9iATJO7fJAxd+PnPVaHz9VOihUx6DrR
	ZTyqWR3H3Un6NSp7kHKJSvIt+JeATgIN/NXC0LzNfbJbHqLSHtZbvxy8gYZtOXSi
	rOcfHQSENP9Q0u452Km/53tCim9tRTy5PmyPuLgLS7PRDbxbh4tIG5tasth5V5BA
	s+RD+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdda931-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:12:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93edac58b24so83893285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020326; x=1793625126; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
        b=QwO3z7rctoZyNVb77UyM7lmsLgdXdgja7Y11/samwFYMM4FSAgKMbppDigG+O5t/8c
         xckpr+yVvY8GOeMKhiQn6VpllR/mPIgHfAkTF5w3oMIO+/TwrkSedjbUjcwdcRpzyBTA
         /hbgATueUXcMrZ4OkQ6f/0VqxojRNTIownqld6Sf6swvYDGOqaMLLQQZ//DCRac0Geqm
         H/RlgiTp/Q8xDxjAvcJInxlI1KyHn5dqn60G+KEBEZZA5vYf6ifhr0tMYXdsYog08xzp
         FENnCpLp5wL8JI3MCeDYx1EITZD+03+wafxwy8T1otjzPacPePLMMtjOAvuQcoRt+KX1
         sAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020326; x=1793625126;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2+R0WVc8dxQdKiFF2JNsjD/7q81uf0HwLq4bflyvK/4=;
        b=dKNlOid5t/E+aiQVwuZeK3AMiLPviv4uBcpOyh9OzIgzK97zobCrSfTZu+cS/o29tv
         +F9MoXxELjYxcd9Ev1vu3M2xxjWJSZafl1l9s78F4Jb1uwE3r8Pz31EPjPeh0CpJZa+8
         Mu/cEPcWkKQmemn6P/1N2/rOqM743P4/aO3WY8OIXFRV3b4v/3Te7MuYf3zg/hWPbs3r
         S6Yd/f+uZp35UmmS5U/A2uw1QJ2IMXWx+Zf7167tqIYpwT2mDqiK40bYXFrJcshV1s78
         SdUW8FRyyJizs2HIztLBiPB47UVD7nWqkJBRF1MOaq2yw2cl2X9mtd+SYyTL+zT1gAlh
         yAIA==
X-Forwarded-Encrypted: i=1; AKwUvBwDN+5Ipp0H1Lklj4MkBeY2A8nnxQrYC2T4SJqhxG73FqbWaE5sc/FPCMG2Lmk4XYQ6xSkSQ+19hddJ4D0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzTzHplCQp+TDXI0yEBmLXrVJ7yw1c8jkX8ewfvUIqyy5FmNWX
	oMvoMyPImBlMQXtWXVRlcFfBeruCp6vX/hWcY5r/9oHFapXUUHyQViFkO670qUq4+TGkCRf6cvb
	fOFZio4cqyxZDR56G2/sadjF/+sc7eDOuGuQDK1rmX4kl5a7ycss2x83bB1vgvZvVEZ4=
X-Gm-Gg: AYBFou2uhbATe3wTPchJpDEfaKS9dKsHChJZAJ+65ciMRYNVjkwyZh9PCX6rDQ1O3FR
	yC5mqWKsVhEx6xSgvv0R38iD5ltVUOfgaAca1a2QyXZIMDUzZWCnY6UC1uI3c5rGyxIYEyhr/4g
	voMAn+CddYHefCdQNfKvl6tJnPD1RJjLi59pJftuO00TybI9wfLdLPnypMLJW3B8B+s0csP8XgU
	cl18C+nVQwpncBKdW9rDqMrp03/w+0LYsX0FkYCTixlIVnhOU10loqQkls5pT2ouDF3slpSt0Z9
	GDOBqR8jkJ4REfBf1PDEgrvOzfgpwuhXbIXRGkR1xkhgbJCxfjAu8E1tMqiyBwLV/F6NfN6pxIw
	zsJ55VWfyb5TQ5Aq+VHmSsA==
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1205342485a.6.1793020325971;
        Mon, 26 Oct 2026 06:12:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4e84:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-940ef9710femr1205338785a.6.1793020325533;
        Mon, 26 Oct 2026 06:12:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984c99sm3707047a12.28.2026.10.26.06.12.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 06:12:04 -0700 (PDT)
Message-ID: <f0ca2bd4-851e-473d-bf21-678cf964f854@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 14:11:58 +0100
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
Subject: Re: [PATCH RFC 02/16] clk: Acquire resources for clock transitions
To: Jerome Brunet <jbrunet@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
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
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-2-3041b788e9f7@oss.qualcomm.com>
 <179275170360.4070168.11650113664838519061.b4-review@b4>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <179275170360.4070168.11650113664838519061.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QPZeV8LBsnW4qZZHxnxFbglM7O27QmpE
X-Proofpoint-GUID: QPZeV8LBsnW4qZZHxnxFbglM7O27QmpE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX615OfWliM+n7
 t1C/c8vbzLa4d7jrz7cHjSQ8i8knUMO305EFXG2gCWHLb0xPUlJTAY2DrKI13ZNhUcb2tM/iWJp
 3+DEM5n1kfdTpVusL91ylPTgPstFSCCOGKJqSGDFgUmE/KqninCJFvL/sRmOoENLGCznwW1ol99
 LJTwHYhHQPHia6WWbdhGSJ7cezbUo8NOfRtjaiEmgZQckeiCWqsHAh7d5qBFq6Fl/mVxR+UewZb
 cN46taGCQU5igFGEuuFh2dOKAdAqHD6CgbwVk22PUvwS/WlEFYf1dGvkkygDtl1Kg51IUdtkwDI
 J+mOVY9k0Ab42304Q9fdqoHMDb5TKqIMXWJUeRIoZv6vO8F4XVg7y6MN7ZqFZfvhx1xwZ/5suwD
 CcUSwIu1V+hj1TKYKPuHzO2jeI1Q4UUq95XbouV0sPPv28VxKjlvHwedRd9x0rkVZmZV97ZF1Fj
 o3I4X4qkjVEWg64h5ng==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf51a6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Hc6wbZxCDKPXCg-kSLUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXx7r5oY8GaPFh
 lEH8pLPPTKFtX6yLfJWmeuY1/Ay4DrJD1cjYU+As0XVB7ds4nRIytJG90LIb+TpgycZ3mX2oHNU
 Com4iuZmRW4lAy2Sc+6eNfllnFluzy8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 10/23/26 12:35 PM, Jerome Brunet wrote:
>> Preparing a clock protects its current requirements, not the resources
>> needed while changing its rate or parent. A transition can temporarily
>> use both parents or access an unprepared clock, and a parent rate change
>> can cause other clocks to be programmed too. Raising resources one clock
>> at a time leaves those operations exposed to insufficient power.
>>
>> Failures make this worse: hardware may already have changed when the
>> operation returns an error. A matching cached rate is then not proof
>> that resource reconciliation finished. Retaining a temporary enable
>> reference without a corresponding prepare reference also breaks a
>> consumer's normal disable/unprepare sequence after a failed reparent.
>>
>> Make CCF acquire the affected tree's and parent paths' resources before
>> notifiers or programming, and reconcile them only when the walk stops.
>> Keep fault recovery independent of rate shortcuts and subsequent
>> consumer reference-count changes. Require explicit recovery of an
>> ancestor's uncertain parent selection rather than reporting success
>> from a descendant request.
> 
> I don't think all this is necessary to address the problem described
> here and in the cover letter.
> 
> IMO a new provider API is the wrong layer. The framework already has
> the hook a provider needs: the rate change notifiers. What the core
> should do instead is fix those notifiers, which do have a few issues.
> You are fixing one in patch 1. Another fix, about setting the parent,
> was sent recently:
> 
> https://patchwork.kernel.org/project/linux-clk/patch/20261021-submit-clk-parent-abort-v1-v1-1-2936181822fc@gmail.com/
> 
> You want to act on some changes before anything is programmed. PRE
> notifiers are the right tool for this. The user of this change in
> patch 7 could use them AFAICT: PRE sets a temporary vote, POST settles
> it, ABORT drops it.
> 
> Also, what is acquired here follows the requested clock. When an
> ancestor switches parent, the chain of its new parent is not acquired,
> although it feeds the whole subtree after the switch.
> 
> With notifiers, the parent fault state is not needed either. As it is,
> it blocks every request on or below the clock until the same switch is
> retried.
> 
> Could you tell me what you need from this approach that cannot be done
> with (fixed) notifiers?

I'm a little worried about the ordering there, since some device
drivers may also be registering listeners in parallel, so we don't
get a clean split of what PRE means ("has power for sure " or "may
not have power")

Konrad
