Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221211;
	b=3pz+6GAqHJ8E+0k+PdXB3xp36Gfzyk9wMVXdjR1MwVCf8by4Cl011CAC8Ergkn8gHHg2
	 nDxOOZvSBs9uvgxjjZXcgV/e6TTebiBFTURx/FfOT0X+05HwqenQjOiSFFbyCLo9eEBFm
	 QnqcIU+CDqaTNkSFQvZoJ1VrBl9C73Gg6ZIJBDob+fxN1ISxK2go4ymT9b+Xl0OC3NUvx
	 SgK2w1T3SVZViqWun+UO5+XmjnMEXDYx3P0MfkqMW8l2vBwsQgf+5ysJDX/Fa8sfnJcW4
	 LQ16UmjDILZAzra8vy+fDh/5Og7UzNg+1dePc2i/+8shco+1qt5/WdHlc2hhZnW42Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221211;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=wgmYZSso3S5s7ntmVXft5Hjp1pkxoHbFdmgMj87YoCY=;
	b=cHCsMAN2MFkqqD/N2me+2DyhZSwpPv25IPXNEnpaF8QOhaPkaC4B1IxzmTaitWX1euVY
	 nOnXIMhaCyqTRc/6EbN7bC3GFjr1Czb0XAMgxcgMZPS5QwaKEwf0uTS/xoaNgmuVGU/6u
	 C827J8pNQcQoprkB83r6NvlzkJPFCR25uys9F/xppScv4d1RYOS6UqDRr1duUkM0vyFeu
	 YmgXU7BXIcBYjz8XbyGaODWCqZNeiU0/hUuF7TeWZbeqLpmB3dzplPAmhAqof3KtuLQrt
	 uFl5e7FktQT9Ao+pD40D5vxGkaIMi11K+/pSc2ciASZ7tfdbHHgNVeradwZqab93/Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h79isfwl;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46B81606A334;
	Mon,  9 Nov 2026 10:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46B81606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=h79isfwl
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 760C11576;
	Mon,  9 Nov 2026 02:46:46 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7D9183FA1F;
	Mon,  9 Nov 2026 02:46:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794221209; bh=zGW4Vk+oTTcAeYvgmOhuujaSbESC2vD11QIhzUqWk7w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h79isfwlJj5NA/YUWS8Ik8ho4Z0G1xk/NdkZHTI+7kY++cbuf7734EwR9LCt+Ww0O
	 EJouX7BeyT+m5P4fhTwO4x8UvN4uCSp1Up19Def4Ui50nAl5N0tzsPl2WATHSB74O7
	 BPCwwkSdpPWko5ab4dSUwtIoV7q7/DoVqO+iIaHY=
Message-ID: <dc798bed-85b4-4d47-87c3-f0e0f156ed0a@arm.com>
Date: Mon, 9 Nov 2026 10:46:44 +0000
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
Subject: Re: [PATCH v6 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
To: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>, Mike Leach <mike.leach@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
 Abel Vesa <abelvesa@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <42b832c0-5cbd-452f-a9f3-50355a008533@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2026 01:25, Jie Gan wrote:
> 
> 
> On 7/10/2026 10:38 AM, Jie Gan wrote:
>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed 
>> the
>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>> forces the device onto the AMBA bus, where the driver must read the
>> peripheral ID from the device registers during probe. On several QCOM
>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>> never probes and its trace path is unavailable.
>>
>> This series drops the "arm,primecell" entry and turns "qcom,coresight- 
>> tnoc"
>> into a standalone platform compatible. Without "arm,primecell" the device
>> is created on the platform bus and probes through the platform driver by
>> compatible string, bypassing the AMBA peripheral-ID read while 
>> remaining a
>> fully functional Aggregator TNOC that allocates a system trace ID (ATID).
>>
>> The series is organized as: binding first, then the driver support for 
>> the
>> platform-bus compatible, followed by the per-platform DT fixes that 
>> switch
>> the affected nodes over to it.
>>
>> - Patch 1 (dt-bindings) drops "arm,primecell" and makes
>> "qcom,coresight-tnoc" a single standalone compatible, and updates the
>> example node accordingly.
>> - Patch 2 (driver) adds "qcom,coresight-tnoc" to the platform driver's
>> match table and renames the itnoc-specific names to generic tnoc names,
>> since the platform driver now serves both the Interconnect and Aggregator
>> TNOC. It also restricts the ATID-unsupported handling to
>> "qcom,coresight-itnoc" only, so the Aggregator TNOC on the platform 
>> bus is
>> no longer wrongly covered and correctly allocates a trace ID.
>> - Patches 3-4 (kaanapali, sm8750) drop the "arm,primecell" entry on the
>> traceNoC nodes and use the standalone "qcom,coresight-tnoc" compatible,
>> fixing the probe failure on those platforms.
>> - Patch 5 (glymur) switches the node from "qcom,coresight-itnoc" to
>> "qcom,coresight-tnoc". This node is actually an Aggregator TNOC (its
>> tn_ag_* endpoints show aggregation), so it should expose a system trace
>> ID rather than being treated as an Interconnect TNOC.
>>
> 
> Gentle ping.

Apologies for missing this. Please could you resend it based on v7.4-rc,
as this doesn't apply cleanly on coresight/next

Cheers
Suzuki

