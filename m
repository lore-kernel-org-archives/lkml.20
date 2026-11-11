Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401946;
	b=xHfSokhs6P9D8gm4E5yCQiXdAhhlbnc+jyvcaMESaZjn2kBzYlRn1bmQ0ZLIxkGbp71G
	 XXZ1GE3nVNe15gllLlb13rxgnrp5H2DI91UiKAj+F5z1Ir206tjaDoc2IiCxRuzcs7ue1
	 eQdqKRkknnS0ZtW5JmD1qoqsd2jp/pOf7B1ljDw0723GB9Xa9zKdNSWIRg8Jl5laHUXmm
	 6V6Tjy9qeMzM2Qt5H6UNXaFzQLEjBfHiLJF8mJ90ThRoHHmsv1HMST7q9R1Ct664Zwr1X
	 f3a0sGXSn420qJ4GOqUQ2dQm56S7YFvBHqVTxRorh6TPyXrlr+iyToOkIfoLoXltTGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401946;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IFNXUO9Jr7TJnTM4pI8+RXJ3qfoW4xa5qsBB8IRLyHY=;
	b=KJCwqHdXIfuW9RSZ3omaB95cLS/T2OUqHPEhYbAwyt5IDDnGPNvaCZvhKRzTA+UiAXL5
	 W5DNjRpvYdoBMgydZSm1xE1aXtOf9kXLN9OBP4gMOoKPnvqcgtXR1MxpGqZJ4AkA9E/jf
	 Dqj/p4Gy+c941T/3zZx4WO23V0ZSSoRrEdPlCyM1J4Ds1usZKPminrI5Qwd9NDDZQR9LP
	 iL5RzXcC9rQwxbBzmtd4Sxm6K58hWEX3PrUtkC9dnlLCQTPcgQrOG6NGjqEjih0E6BEBJ
	 VuORAk8OcfKqiLLN4ImDT2LDa4ZxVYlOJl/MfDKGXIRGljd9y34ZqYPJf7luBDDkqfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C0DwQSOz;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7910F60A2614;
	Wed, 11 Nov 2026 12:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7910F60A2614
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C0DwQSOz
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97E801576;
	Wed, 11 Nov 2026 04:59:00 -0800 (PST)
Received: from [10.2.197.99] (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9DE83F632;
	Wed, 11 Nov 2026 04:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794401943; bh=Cdy/qokJ1H5l2i4X0IPSgmP/Ge5RQRh04NlGw7FyG/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C0DwQSOzO2O5bcR3VXJlOpuuJ9TPGqBenmbf9NmpLIwifpTSmMIcrDyG/aS3Od6UW
	 IzrdOYaRBSikSpe8Z2mfLYIo5U7T/YAlenp3b3uPY1XJX0TrjklvzbGzlUVHjHpv7U
	 2qWTdIvBOwzT18Unl4VGC1N3sZHgfGpA5pC2leiY=
Message-ID: <14c0956c-904e-4a6a-98a0-882514d77b08@arm.com>
Date: Wed, 11 Nov 2026 12:58:59 +0000
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
To: Rob Herring <robh@kernel.org>, Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
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
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20261110154643.GA4159803-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2026 15:46, Rob Herring wrote:
> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
>> The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
>> two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
>> forces the device onto the AMBA bus, where the driver must read the
>> peripheral ID from the device registers during probe. On several QCOM
>> platforms this AMBA peripheral-ID probing fails, so the traceNoC device
>> never probes and its trace path is unavailable.
> 
> But it works fine on some platforms? We have a property to override the
> peripheral-ID which would solve your issue. That would be much simpler
> and avoid the ABI break on any of the working platforms.

That is true ! Sorry, I didn't think of the quirk.

> 
> But this is already applied and it's not any platform I use, so I don't
> really care.

I am happy to revert these changes and let the DTS be fixed.

Cheers
Suzuki


> 
> Rob

