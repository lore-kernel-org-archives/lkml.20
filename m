Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794820787;
	b=dHeJ6KGdAKTfVLPh1n44ShLjpeEtYi0PzPTK65IJEJnkTRXzmMQ7tvSHrhyomm5tlYCm
	 VvF9cw1HOIs7L6j1gagwKRV2nvgyRl7Gtg1zlucDiNgmey7zxji5kdJfWag8Fapr2QKyy
	 3C7uj1qPG5qcKhrKVMV23h7uVbFwFtHKGhHBvNmMf02B2XUM1v00ZW8IV5VnSq/aLlrGL
	 2G1QNKZ9tfcC7Ew9WVtPMwO/ZAHzF2WFnCF2wut+O3ErWAjeP8B1XFomFRbt83pyodh8o
	 ZmTbPpA9jmnrP4M124Bmfk231w07JWYlgw7yu9kkNxqtNtIoL/O/uJ2Xk18D+5sOA/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794820787;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=CZnwncXttnoeDTUcItONMH1HUxzaUc0HeWzS8YajeZo=;
	b=ICe4Qd3XWWkQQpt1Qna1M2K7fmZZEMZU67dFZkl2Mu5CgIiMxle0wnlunR3df930WgBI
	 6aqssyqJK6OjTee/Td08q36wBE8V8XCuL286qM56obLIS4+JRVA4vTunIMf9FMSjlXBdo
	 6sJpT3wKghFfrgyple40Abgg8PkxqhwJHSbKDkjIaGSuK8rV5pQklvh0EbopEErH8TTck
	 0LZuN4S4FMBUqICC7YpTZ+Zoy0QO9drzUaqwjU305Ty1LK3s3eXeZRhRxJgHvHp4Gzl5D
	 NVuNAasE2N2ihvMZZ4Yp3vVk8QGw5lRUHIfGp02RX+prRk6KP3lPtWXqFY+KHOZV9SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MDYQ3pcg;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2391C606A334;
	Mon, 16 Nov 2026 09:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2391C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MDYQ3pcg
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 437321476;
	Mon, 16 Nov 2026 01:19:43 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCAB23F763;
	Mon, 16 Nov 2026 01:19:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794820786; bh=x48MGglr2CAwjlYCBk5Uk7nESxpqLnVRRwqaJD9EKQQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MDYQ3pcgq/fyazZWav1V8GCbaXniG47/MsXdi+L8kJg/9MnJZQMg0rd30s8dNGend
	 f74CGwzElmESwFiQFd/98nrfKDbHv7OvYnk8N0T7X/E7Epm8s30n6ECITioJzXdOOK
	 UkxLipbRfhTxaer6gx/Mmr1orXbV/YSFH8ZAp4WY=
Message-ID: <3bb22604-1850-44d7-9388-3bcb06813eff@arm.com>
Date: Mon, 16 Nov 2026 09:19:41 +0000
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
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Leo Yan <leo.yan@arm.com>,
 Rob Herring <robh@kernel.org>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
 <20261111204322.GH9176@e132581.arm.com>
 <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <e0e07848-361d-4977-a585-a0810452e150@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/11/2026 02:03, Jie Gan wrote:
> 
> 
> On 11/12/2026 4:43 AM, Leo Yan wrote:
>> On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
>>> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>>>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only 
>>>> allowed the
>>>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>>>> forces the device onto the AMBA bus, where the driver must read the
>>>> peripheral ID from the device registers during probe. On several QCOM
>>>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>>>> never probes and its trace path is unavailable.
>>>
>>> But it works fine on some platforms? We have a property to override the
>>> peripheral-ID which would solve your issue. That would be much simpler
>>> and avoid the ABI break on any of the working platforms.
>>
>> Looking back at the earlier discussion [1], Jie in v2 already proposed
>> "arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
>> mixed together. The series later moved towards platform-device probing,
>> then became current shape.
>>
>> Hope we make the right decision on arm,primecell-periphid this time.
>>
>> Anyway, I'd like to apologise to Jie for all the back and forth.
>>
> 
> Never mind.
> 
> Hi Suzuki, Rob,
> 
> The "arm,primecell-periphid" override is the simplest fix for the issue. 
> Which fix are your preferring for the issue? If we want fix it with DT 
> property, we can revert the patch series and I will post a new one to 
> fix it.
> 
> As Leo mentioned, the AMBA probe is not affecting by the series.

Alright, I will remove it from the coresight next, please send the DT
fix.

Cheers
Suzuki


