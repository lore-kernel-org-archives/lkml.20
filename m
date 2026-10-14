Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3724EF145
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791972120; cv=none; b=oX4i5K1U1tmlNhaTLeUcLGDDoGnrzFI7QcTfpaQ7S7gRGl6nWR3Qzlsukl1joUrOnGqVAVl+j9LLhEH3zfhSIum8UUkwc8u38HEM/pIk9mzL59U/X9fGgTVayA/IaOrCV7o+D4Xe26gmWka6scc74xM0tNlE4DYbVW3ShNMdBxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791972120; c=relaxed/simple;
	bh=bxAABMcATBGCVbIdLI2E3IV2T/5FveIz1lB1kdv5BSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=KJ/sTPRwlV8KF0eLQ0sjTlZjDvUKehvBRaaDFrxJJ086s/Hk2jl61MJA57Wj51H0exuDfeX0f/1jLZTz3/paIaPmviFAbw75Fm/RrQJtGaK+CS+RkLkNfCX/UY2r5ZwxXEmOh0A1q7GNyntAlNOxG+eP0FIabIpafzX5Quk3g8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XtRtTzbr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/tnWRY8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XtRtTzbr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/tnWRY8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9eCwD3696187
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sPkOAvHjGguK+u1bhI+1A6KtcM2Hij2aa37XKD4T2YE=; b=XtRtTzbreLbENmD4
	w9nXdbO9+ui3nKl9oY0BLYee5c0YjQhis4AHR5mDZjszR844X7av0SCOJ0JiebSN
	cj2uDa9JoFT4XZEEI3q0mp8Zn6FJw2h4P3o+YIt8BKVj+S/6wlK7GC81Zw9kB17z
	2D3bc3zpMPhDXdHhWrtJeTX0ma16AzREevUBcPO+7YcnCOPfQkm2w6uMJostm/v/
	COTWRZbM0mdvs9XtLz/CjPEG6jPQ8IR0arPxTaOxX500uhNoCLm65ItV6aTe93n2
	Pjj133XIbfbRcX105R1GCek4kOAOCOeJcDGyrudOxjDQ/y+arROsXbpw2wOaBtjO
	tPxB5g==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha7aeg302-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:01:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5e0a8f73addso4451966e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791972118; x=1792576918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sPkOAvHjGguK+u1bhI+1A6KtcM2Hij2aa37XKD4T2YE=;
        b=W/tnWRY8tdKuwCddu1XtkH6g/Qk1QDwBCYNxI5vLe4RymIg/P4HrGmJf0S9XomwU0g
         U2PAFMNpvBXR5UTO+0hHLFzpCHDr9yLY8Io6Yb9LAgn4UjCK1k52XW/57T9nA2q/wRie
         zil8qlCPNXwQImtmCj6P2E2SSvGLHkhsnNrmj/+ViVMHDDY7DuiiYT2zDX/swE0ywzvg
         dbb5I+4D8C411VMbmmXrmZDBapvOz+YdiqAQyA4pXvM244ypTQpEQfcJClx6nQggq85r
         BdzCPAovyyQ9oOCYylLEXby1vsY9/CIf3mTG/4ixhrI9RqPfox4lHXcYbRuCex2MsSXJ
         d/XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791972118; x=1792576918;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sPkOAvHjGguK+u1bhI+1A6KtcM2Hij2aa37XKD4T2YE=;
        b=gPDUVvNIWEnYwtLl9DSkGEN3mU8wWg58zITqg7OD+zf0J7EpitNRVfI3PTdT+1LijE
         MInbOX32iFbHvpqrD5ih9QQhVKdGA4dZVuypGiBGAtJbVBgNIFMablWcX6aQwNtQNF02
         otKNrNhspDr7k0ND9CVdUauWquNrdU1JrqssYEbBAsyZVu2ni1vXVT0I0qOmIy07PnQa
         mCKAG4riKjlkQbLp8sg4ZwM4D/WBfNRvMxoORYsN8qysMyN8vLUyuJo1rkz4gelGfPLu
         ydN0vsP0KIzH9bzTkyx8ub4WMOxAtYJ7WObaKlaXOGyU08sEyYKUx9TEx07bWWYursq+
         7NYg==
X-Forwarded-Encrypted: i=1; AKwUvBztZ1hQTiJDgO0ZdIUJNDcJ4Li4xz416lnyIPSfCwZKwQ/6Je0CiK2sNCk93jhao77lwVsTXDXQGw4u/Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI68/HYscn4wLifcdeAoRwKDDjomxKpL0CuCyVGC1FgobD/I7Im
	GxBl4hf/vlhlTpxqzZtVLWu598hTapYDPIoAmDMdPXYLwsm8TnFTgujzPWdKXrio3j5/5rIF9ar
	L3dVBHlAlh3B0VH5eY/QUC222p58PviD+5OFzRfgaF81oSbBZABpi9oJVjqNdUFUw9cc=
X-Gm-Gg: AYBFou35Xw6KJVsLj9ZvMQpV2UTtzv5wP8zD0gEMw39FQ0OMHCKjGnAP1rXtwqZFqpZ
	cfL0+XqobKEVwRTCMeayp/0BBx7QUwxF2N/mHJVjVzkRDpGm9xuDFdwB3Mxsk5WxdQflaPTuzTL
	e7NK7l5MkItXcgOD330oVE2NZyNtBB64ohq2ODzM3qSM8TlU80lYWaHiW7WzosQlU5hEQZbUXRU
	4fO5EaiEimmWY7VqPqwKevq+KuYaemmTQSlhZxnW1cdGhrUG2nlsHiBf7t+Dbjnu5LUK7tVDlGx
	wBGZl/f1Y3d1b0FOSBQC88RjgEc/fl7hyLKSP2I2O6bU8T1f/T7+/gBluEZ85HRECanU0Zussk7
	JKWTolk3hVZNEYdZj5floKUGVAPWJSLuggnmjIMwR4SmlT3c4neOsDsP15c4754tHtlOJ7Z3zbp
	yu9OQ1bYs0p3wBaYz7qKslDUhl3/3byk0tBs+7pi8eSPPH28lN/ahzSSxsr+NPOyCmBA==
X-Received: by 2002:a05:6122:414e:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5e91f4d187amr5598555e0c.16.1791972117785;
        Wed, 14 Oct 2026 03:01:57 -0700 (PDT)
X-Received: by 2002:a05:6122:414e:b0:5c9:a60b:e5a5 with SMTP id 71dfb90a1353d-5e91f4d187amr5598522e0c.16.1791972117285;
        Wed, 14 Oct 2026 03:01:57 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm683926066b.80.2026.10.14.03.01.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 03:01:56 -0700 (PDT)
Message-ID: <ab5c5ae1-1bfd-4fe4-adef-fb64b5b3dfbb@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 12:01:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] ACPI: battery: Re-read battery information in the
 complete callback
To: =?UTF-8?Q?Ali_Ahmet_Memi=C5=9F?= <aliamemis@disroot.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Armin Wolf <W_Armin@gmx.de>,
        Charis Stratakis <c.stratakis@proton.me>, linux-acpi@vger.kernel.org,
        linux-pm@vger.kernel.org, regressions@lists.linux.dev,
        Mark Pearson <mpearson-lenovo@squebb.ca>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <37N_jFulf7n-Z55NfKfE71C_wVPxYvZ0xD_iRUg2fXu7TypDiF5PStQ6siSfVBih6fThg5WoPes8U5ZQpfVm_teMFcUGXFxz2DdMbfSWuws=@proton.me>
 <20261012225141.13683-1-aliamemis@disroot.org>
 <fb993dd3-ee56-4e3d-aa16-573f011518f1@oss.qualcomm.com>
 <CAJZ5v0gS4agVUkCO6M=VW4Wi2y1-s+k23bpzmX9aAZ0Rsv4z9Q@mail.gmail.com>
 <044e9df4-1399-4ceb-80f8-f7cfe031d04f@oss.qualcomm.com>
 <CAJZ5v0isCM3K3U6HSdDnvXzBX41AgQMFYxqLx3KvMA0W_91-ew@mail.gmail.com>
 <20261013210609.8117-1-aliamemis@disroot.org>
Content-Language: en-US, nl
In-Reply-To: <20261013210609.8117-1-aliamemis@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TMDCf5cYvCsJ8t9GYiLfYf3Pu34NoUsS
X-Proofpoint-GUID: TMDCf5cYvCsJ8t9GYiLfYf3Pu34NoUsS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX8V/vq/o/3+lL
 ac2cuG0qg5aJtxqaqiXXbZcF2Be3cVqP7NELOgKDRDcSqjwCaeDXf1IJT2SxVhuvD+Ia9TINAeH
 B+PmIVn3Fpm+d4G3IVnbIcW5ongbk+Y=
X-Authority-Analysis: v=2.4 cv=NctzRGD4 c=1 sm=1 tr=0 ts=6acf5316 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VKiBM6ZALRNij_qUCYgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzOSBTYWx0ZWRfX4ZFnWz3CD39o
 BfyBHGl2mYd/kVnombofsXCO2D7totk5phuoC/2nafwzTBtuDyAmidf3znxw2Gqe3IomCNL+Q7E
 ugBdg+7Vj7pz93UIw7y/1rjMbkx7zdFT2miBzxrtDDtpCUuKFZHWsnc/izP9EmNeDYrRhOE//Bm
 RSWI1p3C/45vE3ZSUpdQj5zOtieZqvbYksjRe0Qoqb7xTZZczzx6bsvZJshpZr1fhI7erjCluOC
 Ji+DoiyJHCHBN/Zy0VckCvULadnp8kOCrWZ3pVcvbHypdlRMhjAk30d40nIUjd0SeZgw8VzHiTs
 9iYuSGwVm0Da97W2oFDP1ElrXPJ4Cd9NBMQotF0AM2itlcF0EkBS2tsDdHf4I0kuyd/TLYTYAl1
 B0eGq9p4W/UHT30wOh3wQQU8e1HBXSp5/ovet+bzFhm8fooZ1Vs2XtuZzEhw5OnPd3psuMwCboE
 Nl5nRcnaRBUmz6fg4ZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140039

Hi,

On 13-Oct-26 23:05, Ali Ahmet Memiş wrote:
> On Tue, Oct 13, 2026 at 07:20:55PM +0200, Rafael J. Wysocki (Intel) wrote:
>> Also, we don't actually know how many "bad" cases there are and so far
>> we have identified a few.
> 
> I wrote a script that extracts the ACPI tables from all 208 BIOS
> packages in Lenovo's ThinkPad catalog (370 models) and flags methods
> that switch the EC page selector (HIID) without BATM while other methods
> use it under BATM, and checked the flagged ones by hand.  Two BIOSes do
> it both with \GTST from _TMP: P1 Gen2 / X1 Extreme Gen2 and P53 / P73.
> Apart from those, NVPS on T450 / T450s does it from the NVIDIA GPS
> _DSM, which only the out-of-tree NVIDIA driver evaluates.  This doesn't
> cover races like the UCSI one in bko221065.
> 
> FWIW, the exclusive variant is done.  With it the emulated \GTST breaks
> neither _BIX after resume nor _BST at run time (0 of 5 and 0 of 1074),
> and with only the _TMP side converted both still break (5 of 5 and 421
> of 424).

As I just agreed in my reply to Rafael, it looks like we want to go
with the exclusive variant for now.

Can you post a patch series for the code you've for this now ?

Note I guess you're using LLM to help you with this, that is fine,
but can you please manually shorten the commit messages of the patches
a bit if they were written by LLM? OR instruct it to write "short and
concise" commit messages?

LLM's tend to write overly verbose commit messages. Note a good commit
message is important, but lets try to keep them compact.

And the same for the cover-letter.

Regards,

Hans

