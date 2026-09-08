Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4963241DE11
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856194; cv=none; b=i86v3zgZsDqVsVnNB9jhW1VNJhaKgOLrw28zLqdFaBZRNLjsOcRwcj7ARC2Om6WGht+QE5JhIM8u5mcbQyHultsuLZpbrTjosNS+JN1TWrhN5lUxrqNvoc68DMIsk692BpXS55jQrbrTCUS2oGR6Qq+HLc2ohqMw3qzM+MXY3OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856194; c=relaxed/simple;
	bh=nc3Jt2ZMZmrZg7w2li/YMN/7RDIm51oz7VxnoMpkwnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z55MCiRqwfMfk9PW98VOye7HYRYQxAIT0XSc8QwLfT2XeGYGYbNRaXSzgRpaDCU/vFNtZMZekXxCBb5J+5I6blnLqTX1UFIWpUDJ0hIvqdHrM+uq2Ou0xKwJFTLT9evvhR6x5KMq79Z++OruhKJeuMrjDW5DfLjTdDMX5xVlRmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YOodalYL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hPaQEuEe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YOodalYL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hPaQEuEe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M3iF2363272
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=; b=YOodalYLDNLXBrSx
	vrfzlLnzdYtqwKt2iWNcG7ymzup/A3wZuBDazv/7h0Grg+YE37aU8SCeZi7hJ3jS
	+H+o/n3iqWABBTrnH5No9FCQrmK58zpdmiNqeiQ/VzOnkE1J78eEG4pa2CPn9gip
	yJEIDw3g9koUjcwQ62sQC67aPVYP4DCX0UL0gfZfBMYKtDY6ylaOLqWBPufqsyHb
	XWQ89ZIq7dSMGwAEabHYmCzdfQDgFXDIpUFBW1qhwlm4G9CQ8hKbBsq9LJ1cF1t4
	LeHK2oqaSqGJGmyJPM57cdyw/nT2hx6SpcVRYM4a9a0Te0Vk+H+9dZaxRJjl3bcn
	y1jCOA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjaguh2b6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:29:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396638f9a18so2931286a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788856191; x=1789460991; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=;
        b=hPaQEuEeuZauNZM1FzaKbdSDCdHnh7ei/OIXL/55aVdVDeP2PNKGZKy9PFHoq0c5/0
         1gzDnHiefX8W02rPRcwJaQumyl114/JF3LF8kVk/PL3CnNyYsHwPEPMDJiLajWWWnIFc
         qGSkXIHolMq7T7BmIpvRji5A1v1JQplAcgRMeIVaFhYOHpD+8bfVu3bzGKASCE5DY3s8
         T6FqHvB6P2LcaqPvIhJP6Glx28weyF/p3aFnxZSvV3TThozagU5/WjCmuThstqOhipK0
         RzLsdeeiYSpAMr6bkF4LYI9iRjR5TTpbZRHdwLK3zw4BLhYNa2v9edYPcNCka/BQOUXz
         oETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856191; x=1789460991;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1huhk9P06Z6mqd4EHk9Oqks2AFMSMZuTW6MMtKJjj0k=;
        b=gRvKaDSTungg6s0ItTH0xm4CHG/Lc6Ll4IXL6G7DlPdqtUlhCrIlN11gvVdGOdRRmg
         W7Si7ukxjoOVykJlEs1OMgq1msx16ALlntdjAeiK5EMj+ZSPAvNzqQphtd6FrcLe3QXe
         yHGdDl19a1yhRchBjI6aKj/1O0UKwMoDoe7YRdjYDzzfpRrymBaI/E8D25E3iwqPYAZg
         sP4qI4DsLJTUjGtrIp4gltw9ULn8nrQk85WWdepL0GeGmUC0Jg+Ru5HgJgJLDToT8A7A
         df67+K7C7XwZJI00+46ZOjfEtCmVnyUcuJA6rMNo/jxyRwwTwHoY7eipLhLxJD55sj92
         oU2g==
X-Forwarded-Encrypted: i=1; AKwUvBwn2BLOZmPJ105zpnmOhJGRZHMYURX2+G1yBccfxkhfLIOYAJ/8QS2vEeav1+m3EbUzeEu39XjwXLsusDA=@vger.kernel.org
X-Gm-Message-State: AFuF++kE5C0i5jMtxkxSHb74t5AHdqPKBtcotWx6pl5vDrw/ihy7+Rtc
	Gu6YHffvquhOMwbUsu9L/JAMSAgacWC9qGUWtc6S/GnmmKsIhZ8lb5UX/Qz9HJsgxG3cwMgpHZv
	4FPjeK+ygffOA0GByMBUBDONjhy/oygE6+RFCLLcONXNSi8LHD1Yq7nxjMShvSVeW/nXG1ANN1d
	Q=
X-Gm-Gg: AYBFou09xu4XW9qAtMrDPjogNCn0u8IituBtaHwcDhSDgGVz0QBx5/diW93DEaY8zpR
	NiqwnRjJDukjb1mnDIq3+UfJb84YDzdpZGLqIZuZPcYDDCR6vf71DjiU0P8sSE/8R+d+xj0Tz23
	Q2b4VQyvY1S1ApB72RQOzwxXSwqRaVGxKJyIngBrqQ7d038srWIGJkBNpqmHgJlx8trDX+5kj56
	io6NeRDXUJrHDeZ179bZYM61sPDTn9xShDtp3SI8i4VmEcslpxxzPyEP4WBrthXKLY3haWwGn8+
	1CE8ZvHxQMPU08XSiqWewQ9/SiECut9dluk/xw+yxYZb9IGaXHjR3R7ynjHEoZQN9+NWjG4YDSr
	GOjN0O6+BSiANW2bBEjB9h7kTL6sYiMfd2tG1agBmkQ==
X-Received: by 2002:a17:90b:5844:b0:398:e436:370 with SMTP id 98e67ed59e1d1-39b260ff0e9mr43921548a91.2.1788856190943;
        Tue, 08 Sep 2026 01:29:50 -0700 (PDT)
X-Received: by 2002:a17:90b:5844:b0:398:e436:370 with SMTP id 98e67ed59e1d1-39b260ff0e9mr43921517a91.2.1788856190438;
        Tue, 08 Sep 2026 01:29:50 -0700 (PDT)
Received: from [10.217.217.129] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a62be87sm29188386eec.6.2026.09.08.01.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:29:49 -0700 (PDT)
Message-ID: <17d7ebef-9ec7-4bf8-bf16-34e3bd3cd92e@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:59:44 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] interconnect: qcom: icc-rpmh: Add opt-out parameter for
 QoS settings
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mostafa Saleh <smostafa@google.com>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
References: <20260907171729.1735641-1-maz@kernel.org>
 <v2gxqazjoxe74q5364jucy4pjds6gx4gfdchgulekl5mwk2azk@we4ibolioibm>
 <87ld9c4vc2.wl-maz@kernel.org>
 <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
Content-Language: en-US
From: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
In-Reply-To: <6iixty74opjqkegpdmtytffgrllcjvrmhlsv53xtackdqzvwge@6fh5onz27p6c>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TqLWQjXh c=1 sm=1 tr=0 ts=6a9fc77f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=caKvAN_lNXawD3NbKk4A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: uEwyq3vrGMbm4Ewp9A9_JZolZlSZzuer
X-Proofpoint-ORIG-GUID: uEwyq3vrGMbm4Ewp9A9_JZolZlSZzuer
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfX0QIj36W6Lko8
 4SFv5Iv+gwCcsydbG+6jvjihmEKCrMgXZzea4Z3yY8ZzB70nrovxbA9tYLi5as/MgYcOOi2jdBL
 KUyFA4wnX/zPQh4fgTJ/y3nFG8V6lyI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA4OCBTYWx0ZWRfXzGUE9D5WpIL2
 AX9cDqtMYyRKGelDwWk7DiytmxFOTmg1vSR3T3Q5x74lSUdQ1mKBVrZj/UKqAwEsZfX4AXLKK7M
 WzNo1lGvtQI+awn4BfDH5vEb02/A65/PZQWxF2+XExCZ4KNz8BNi8p6K2PwJnhpG3G3Gru9gkm7
 2Mf34Hrxp9Y4kmevI9ZUy6p/J0WLHQZuzmrK+ag3gTL08yNX2XXoh71LdlgdOytxRjEuH6xW2wN
 LGkCQfcEQxf+o9RcFdp3VMqEVffT9eFOOTRDfLhiR8E2r+Ri3RHsKVcGiFUE2uyHqboGp+1/is2
 paxJvs4W4qQRXgr1yxp7N8D+0RhMXT85ZS9e8epRf2fvzVANvz2Ll7nCzYvk5y7UzRoNWfWE8vv
 g5e4U7BeYCWqo+MKdQl7KqUl7GAbKTSx2jzxcBYzcxJ4EgeS1ZY5MAfb1BAyBUeaWHZxCb1SroP
 lvCz3bUMudRr9sht74g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080088



On 9/8/2026 1:04 PM, Abel Vesa wrote:
> On 26-09-07 22:15:09, Marc Zyngier wrote:
>> On Mon, 07 Sep 2026 21:21:44 +0100,
>> Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>>>
>>> On 26-09-07 18:17:29, Marc Zyngier wrote:
>>>> Recent addition of QoS configuration to the X1 variants resulted in
>>>> systems that spontaneously reset at boot time or under load.
>>>>
>>>> Given that this is both very unpleasant and hard to debug, give the
>>>> affected user the option to survive such event with a module parameter.
>>>>
>>>> Passing "icc_rpmh.enable_qos=0" to the kernel command-line will skip the
>>>> offending QoS setup.
>>>>
>>>
>>> Lets not start doing this, please.
>>>
>>> Can we figure out which platform deosn't work and then maybe we can 
>>> add a quirk in DT per platform?
>>
>> We have at least 3 machines that are dysfunctional since [1] was
>> merged (mini-x, sp12 and devkit). Probably some more, but I'm not
>> going to be the one doing a survey.
>>
>> What really should happen is [1] to be reversed until QC figures out a
>> set of parameters that actually works, instead of making this platform
>> even more unreliable than it already is.
> 
> I'd rather have the patch reverted than adding a module parameter which
> users might not know about and distros will probably never addopt.
> 
>>
>> Just like [2] should have been reverted.
>>
>> Until then, we'll have to paper over this stuff.
> 
> But a module parameter complicates things rather than just papering over.
> 
> I suggest we get both reverted if they break existing platforms.

I will share a patch to add interconnect support for Purwa. 
Purwa is similar to Hamoa, but there are few port additions and deletions with 
respect to PCIe, and trying to program QoS for them can result in crash. 

Thanks,
Raviteja.


