Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65423DA5C7
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787749634; cv=none; b=CdMONTTjNFbPkaqDgcG2sUGnIGsG9Ftfj2f3Zv3maG9cDoqsOFoKctwq+IINgqSMzFLC30JSlEZ2Y7j+3EtZLsLu0riLcGyx0YJcc6/gg13M5TUUx/YTWyNPy6oD/xuti67yIjcV30CfP+Xgmj48SK2hqwGNWplifzX6OCxp4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787749634; c=relaxed/simple;
	bh=LiZoxw5u7OkTtmxFcQ5+LUeZikX3PH8TbD4TDRPPn34=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQY1OxqK5oe2qSGthKCULhMTHOO45Hoep918iv+owDlYH+7CRJTnBGQl4tTkp2I/awDmcrCcPER8g+OUFu5rdCS0a+8nO2+gcnRpFJK7B+nnj8fNHAX8fjLEHHBmjN2msBn3T4SFuf2xAwVnqlSXi+E1VSKTuTRk7Ql+Dh4CN4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cVbTFTRA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGCwPnmt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cVbTFTRA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGCwPnmt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCCFx8882034
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z8ZCL6UB+xi0N5gctLw16/d9ULv3ZvLsxlJFre/dyo4=; b=cVbTFTRA/0lJJsRz
	1IV7KZRvSOcP707QMxiFBDWZD+bzVxbypuiePC1uTTRkmKqETUDEwn9XxGilb6pY
	nRuU9fKpMbKGrcjVsVzzh643jTiVHuUF16XEVgFG4M94fzO4W6GBwUnRmEhruP0w
	PZtGHsyaaFb15Pd8eG1wAoQa8Mj162q4fAXkPWdGWNIbNJXYfT7HDSkKPq5REeDD
	yhFKk8BUoueF/HzJ9yKMbqs+3FAjLLq8jJMx5yqfj7auX0FamTYxWUHuusLNwd4+
	b3b7eFpusiLHNVzlA6RQFl3DBqwbkLpvjIhmoDRvwt5aEX6drirvxoQp6ujPpWhC
	EHsyFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k28b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:07:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848568a6f62so1032423b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787749631; x=1788354431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z8ZCL6UB+xi0N5gctLw16/d9ULv3ZvLsxlJFre/dyo4=;
        b=bGCwPnmtiqaBiqXoiYADKtbeuz71hizGVlwLXL9FWM2C5rSOL/FS2LwI1C+fCpY4V8
         DlSqCeU/TnC2XaNnwPVsaAwSRPXOkzsjwf7DbfKfJkh6IEdI+9Ec+7pjTU2NG77mk/7J
         33uwfe/h6zYgCdAftV59rfb7Z4AC0Z5mMhTWj4Wf9SMwGMtIcNpOaQPBNqCdBrjBUoAl
         HwPDkBsSoxQVKJTKqnjRTDv3WfthtpCB98YaBTsefWXKIvyl4YKiZ31grdsfbSpWyh8y
         B50RwV8HRCLBZ4W8nmPvx2ZuyEKr8ZYnh/F3FtKlxhOaZJuyCzT4LrC0U1bBtTHIDU02
         yLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787749631; x=1788354431;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z8ZCL6UB+xi0N5gctLw16/d9ULv3ZvLsxlJFre/dyo4=;
        b=WCmp1hyP/YRAJRI3dzvkTj24inVSEGiSOV5pSvXNcukIE+rvIa4VtZeB7fZyXsXLmj
         9y0Kdlo12e9UceUzuh6EnrScHTMP7B0zKkZUVEcsQEM21Bk0KoD7qrVKKV/edBGJvLTR
         b+2/QsBgsVE0vD59ZHugS423oc0z+oaD7gopoo1yC1StaOZNdVO2TC4dI+32SQwq0qJ7
         4kWdeQ2yScnvp0dVCn4h0BmBKJVtsg+xQ9GD75CRAH2RAckrNnszmHFqVb4Hp92lPl0u
         EgLW54If9JYZmmnERi0vKLSUjCIeaUe3H2Q5Kep1WonFoXgm9PElrCLNuF+aOihsoiCi
         uflw==
X-Forwarded-Encrypted: i=1; AHgh+RpEtFDjrOFGS9LbyMSKM6QjJ19A687E1FQo9xO2Ba2Nd0Y0SZfSjPyWV/zoFYZhxZGcUfFcyUwcNYDQ7y8=@vger.kernel.org
X-Gm-Message-State: AFuF++mcGWpFZTfR0FMLcy3PezWyS1CNslLc+GHKfuJPFmNy3paV4mS7
	+OT/amjhvLAVr9ps7c9tL6GKUO1FLdSS416cD147XUV+XxlyXRnop/NkPK2jLjXOxH+s0lAgJZD
	oR/a1fFwGh6T6aoTSNNdxazfKXNJXMk6XTmDMaDCa1593nZ6sXPP/AIOk6z9DWoTrMGY=
X-Gm-Gg: AR+sD10KpYdEiRXBRtm1+hrO4mbu8oOKkFDG/Wdlh1YcMUP5ZrA2SrNOgh0yaiRNhlI
	RVW1gAzdxjkMLBY7lsjEuHZ7PUsvn6u+MumGvGE+4iAZPhMqQRlEwf2pLNQddEVw5Y13K+ISThR
	gld0j21XHHHfYYPaaaJ1q5l6vAX1dOfOiy/4HpwTMVgQS9yBn6p97hzSFo0TvZsLKOcFlJBuXKY
	PPq53HxzTTX5IthjMGhMU0GRjdlO1i7Za31DGOqh8CEVOtDfpvTHR3Yw+zAjkYRCACg9QK/oODf
	6kSRnUAhNdaSOOPl/Uu1bwVQeQ8M/Wd7yevJKopN0mU9rbeVQX/L9a6bOR0uQUwgEIfdTKVwlaj
	8VGB2DbpsB1iA5pQJpWocYfa6E72siA==
X-Received: by 2002:a05:6a00:c96:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85372ea6666mr12573120b3a.1.1787749630963;
        Wed, 26 Aug 2026 06:07:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:c96:b0:845:ce5f:c926 with SMTP id d2e1a72fcca58-85372ea6666mr12572918b3a.1.1787749630363;
        Wed, 26 Aug 2026 06:07:10 -0700 (PDT)
Received: from [10.219.57.226] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85359cdfeebsm917003b3a.4.2026.08.26.06.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 06:07:09 -0700 (PDT)
Message-ID: <23e31249-cce2-421e-88f7-1a2af66e34b6@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 18:37:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/15] accel/qda: Qualcomm DSP Accelerator driver
To: rob.clark@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
 <rdunlap@infradead.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling
 <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        srinivas.kandagatla@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>
References: <20260817-qda-v2-v2-0-69a02e9090d4@oss.qualcomm.com>
 <3322b42b-3755-45ec-ad55-345125f0d488@kernel.org>
 <10349e29-b583-403f-a89a-9a00c73666bc@oss.qualcomm.com>
 <87dca76c-851e-4cc3-ab91-68949d283b79@kernel.org>
 <CACSVV01eYr6FyA6XBG0xw0yv2dydvTEhcY-WUy07mxM8WwkZcg@mail.gmail.com>
 <318f14c2-0e87-4e07-8173-1511dca67d78@kernel.org>
 <CACSVV01T=ytVJKM7NRoBTAJm7vH+JPJNT9Tftu5X9YskGXerwg@mail.gmail.com>
 <e7b4eceb-cb3a-49ea-bed9-728c958594b0@kernel.org>
 <CACSVV03ypjBYkhRpt=TyDwOKhejKKke3x=Fi_TvxXN-5U_rCsw@mail.gmail.com>
 <fb834ae5-7113-4a86-bb84-ca5115c8d7ff@kernel.org>
 <CACSVV018jB4WRRJ_CUHQmkHXZcqauWJXWGgrzY_HA6cFQ+Q3Xw@mail.gmail.com>
 <dd3da35b-1db6-43a4-ae1f-35620692f51f@kernel.org>
 <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CACSVV01o_XYuSzaYGbo9pY=459qiA_fgL_KRHVJH+LH4RYcMzQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ee4ff cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=HVFQHpX-XFYh-alqn_4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX7Q/q5EGq29u9
 dh+QIwIhkCD6psQfT3nCRVAQ86oltyjT5IHmvcBoNZrblqEq74OVZCStMybywgj2Tu6IxvUWKNS
 4aE/0MOpkrGiRbOIjkmxEjTYv67TZoM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDEwOCBTYWx0ZWRfX2I4diIMZoCjz
 H0T6Oi9Vt7bm5CwKsK6e/SP616cIjm65bJLc6YSGih27M0NsdadtNXoO3iVjAjhzaFQaVi3xTQX
 3uwAGbs7yNosVA8Z71cnPIEPl9w7MtsMDY8m4Na2Qi/nYm70vqM/sQW1KiyXvM6t4ILLQnV5PSP
 t6why8gXFQQLa5TwcpayC7avCsWmdjaZZQjBGyqdAeHpbqTNBzNtog8SnLSjREH/Fw3FhN0z3jx
 QRB1PF7JY3C5mwzOxj3faQs8svGnf40ypyt8ba40ApC/nr4Tv0SKaIKPBpUY66/yhDHqKSn6TFz
 L0cJBJjvqdA7lekbkfEQYY5cDbLJrrpbwiDiBeBCfJgLDqq6r7g8NUd5NZDXJPhxwDd3iA4lN/N
 9RBgXNP5FYdmTi0GsWeN7AZkz7Dxm3ux+GQwzs/+peRlPT4uG7vOw5+h5t0YFVP4BR8J+ipLXt2
 U+wXAxlX/f/XsXj4nQg==
X-Proofpoint-ORIG-GUID: UoDRyn8C5EL1j6wf6CpQtOfBY59wHVhh
X-Proofpoint-GUID: UoDRyn8C5EL1j6wf6CpQtOfBY59wHVhh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260108

On 20-08-2026 20:17, Rob Clark wrote:
> On Wed, Aug 19, 2026 at 11:15 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>
>> On 19/08/2026 17:48, Rob Clark wrote:
>>> On Wed, Aug 19, 2026 at 8:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> The rule of usptream development is that we do not accept duplicated
>>>> code, just because a vendor wants to write something new. This is
>>>> basically the concept applied all over the drivers tree, where we pushed
>>>> back against all sorts of duplications all over the vendors.
>>>>
>>>> What I miss in this thread is why would there be any exception here. We
>>>> do not grant exceptions from standard practices on "I want" reasons.
>>>
>>> I agree that we should not have duplicated drivers just for vendor
>>> lolz.  But when it comes to adopting common frameworks and integrating
>>> better into the ecosystem, this doesn't seem like something we should
>>> actively discourage.  I don't think this is a case of vendor lolz, but
>>
>> No one discourages it. Following standard Linux kernel practices and
>> requirements is not discouraging, do not twist the narrative here.
>> Again, it is standard upstream review telling that we do not duplicate
>> drivers. Ever, unless there is serious exception needed.
> 
> I wasn't trying to twist the narrative, just trying to come up with a
> path forward that isn't "no" or "improve existing driver", since
> neither of those gets us towards a future using common frameworks.
> 
>> I asked why there should be an exception granted? Is the reason for
>> exception following:
>> "We want to adopt common framework"
>> ?
> 
> Possibly?  But I don't think we want two drivers to be any sort of
> long term solution.  (Ie. as long as venus/iris have co-exist.)
> 
>>
>>> rather reacting to drm/accel emerging as the standard framework for
>>> this sort of driver.
>>>
>>> So how do we get from here to there?
>>
>> What is wrong with my proposal?
> 
> Maybe I missed something, my understanding was your proposal was
> "Grow/replace/improve existing driver instead of coming with a
> duplicate"..  grow or improve doesn't move us toward common
> frameworks.  Maybe "replace" is a valid option.  If there is something
> I missed, then I apologize.
> 
> Options I can think of are:
> 
> 1. Hardware cutoff.. new hw gets new driver, existing hw gets existing
>    driver
> 2. Backwards compat chardev registered by new driver, providing existing
>    UABI.  I'm not 100% sure about the feasibility/drawbacks of this..
>    AFAIU the fastrpc folks where planning a backwards compat layer in
>    userspace, so maybe it is possible.
> 3. exception?
> 
> I'd like to know what the feasibility of #2 is, since at a high level
> that sounds like the best option.  Possibly limit exposure of legacy
> UABI to existing hw so we don't get into a place of needing to extend
> the legacy UABI for new hw?
> 
> But #1 sounds like a non-controversial place to start regardless.
> Possibly with #2 coming as followup and necessary step before eventual
> migration to new driver for existing hw?
> 
> Even if we start with #2, how do we handle first-merge-window
> bugs/regressions without reverting addition of new driver and removal
> of old?  It seems like we'd need a window of a couple release cycles
> where both drivers exist?
> 
> Maybe others have other/better options in mind?
To all, I'm seeking on the approach I should follow to go ahead here. I
can work on implementing #1(as per Rob's list) with hw specific
compatible for v4 if it's acceptable.

#2(compat driver) is something that we are still exploring as we
couldn't find any standard way to achieve it. We might start a separate
discussion for that once we have few possible designs with us.

Happy to take any other suggestion also.>
> BR,
> -R

