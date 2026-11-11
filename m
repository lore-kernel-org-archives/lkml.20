Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794429806;
	b=On6yGLn7llKN4Fdeh+HajBYufbAwEC+YA45GeLetj4Vk2YauM9xgfNV/E26v3F4w00XM
	 heb+0QpV2wzi1SXWkHGS5GAZwaMcUGoyoPJkYXZdaMfIcUbRdGb/PCLMc1pa6hcKF4zpR
	 gygZGm52y4MUGsQ5c5raVybHNymkCCyiOhlkPbx8X9yW2o0b7DKYPNqdLN5ZMxpKTFItL
	 jKas8d9tpgqojH7+wSN3j+Vj9g1i1dTRy1XxZk/b6Aic9jy8q0llwPqjx6WcqoCS3UWZp
	 5iF8ARsgmq2aegT/W4Ib9GQso7597+WClZQOX/WKfTfydaZX4eMS6azKEdpf34sDjng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794429806;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YkiuKwTzFaKxocYqHbZJaiH6LJSy5oJp9dJAcEhaIF0=;
	b=C1geta5v4tnpamtMVQEzyxHyXVJBSK1vpfgHuudaNSJgL4MTyOEP3eauDHcJ4D2k42nz
	 W2cIDbDRWAaaQha5txn05l2WN10/QYkEaciCWhG7OZDF5TABVpyWz94IZOWGyqqT0jFLY
	 NdBG1MTWh4Bq6znvvDzw8N4OvJgs0H+b9l16FsfpLdf2Ls1gEU9V+mHA0543UMCFgE6eh
	 Oh25tldA3WcoSMQhz5ZsMZufyqMwH8FplMLf/rZ4ioAGyfYGlnwH07h3pmco8HzGUfKTX
	 17295J21ZnMFEQDYpt+x6RL1B4TpoijUx9zQA2uHRAQyHdgUDmJcFzzXBtaaCVBdQAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nwawK37F;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1982B606A326;
	Wed, 11 Nov 2026 20:43:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1982B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=nwawK37F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41A64153B;
	Wed, 11 Nov 2026 12:43:22 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D12223F85F;
	Wed, 11 Nov 2026 12:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794429805; bh=mx3VbQ9/b7aZO8Gcx1adUQM+AmPwFj6BLz1d9u/uU8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nwawK37Fkk3B1Dd8xpjDH02kguU+B9x/ZRaD5YNvyMo74wCWalB0GpoJEeLPKJE86
	 31HnfzhNse3dMDQrgcPdcaEiu7fOuN33UNqHb/5GPmekgyGPYeGmqNaT+5QEIdipZn
	 FwgeBshyJewJ+AFuAZMFCFOSPHuewTnmyAlPLNyA=
Date: Wed, 11 Nov 2026 20:43:22 +0000
From: Leo Yan <leo.yan@arm.com>
To: Rob Herring <robh@kernel.org>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v7 0/5] Fix traceNoC probe issue on multiple QCOM
 platforms
Message-ID: <20261111204322.GH9176@e132581.arm.com>
References: <20261110-fix-trace-noc-probe-issue-v7-0-2f06905c77fe@oss.qualcomm.com>
 <20261110154643.GA4159803-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110154643.GA4159803-robh@kernel.org>

On Tue, Nov 10, 2026 at 09:46:43AM -0600, Rob Herring wrote:
> On Tue, Nov 10, 2026 at 09:21:13AM +0800, Jie Gan wrote:
> > The CoreSight TNOC (Trace Network-On-Chip) binding so far only allowed the
> > two-string AMBA form "qcom,coresight-tnoc", "arm,primecell". That form
> > forces the device onto the AMBA bus, where the driver must read the
> > peripheral ID from the device registers during probe. On several QCOM
> > platforms this AMBA peripheral-ID probing fails, so the traceNoC device
> > never probes and its trace path is unavailable.
> 
> But it works fine on some platforms? We have a property to override the 
> peripheral-ID which would solve your issue. That would be much simpler 
> and avoid the ABI break on any of the working platforms.

Looking back at the earlier discussion [1], Jie in v2 already proposed
"arm,primecell-periphid". Questions about AMBA IDs and ATID handling got
mixed together. The series later moved towards platform-device probing,
then became current shape.

Hope we make the right decision on arm,primecell-periphid this time.

Anyway, I'd like to apologise to Jie for all the back and forth.

Thanks,
Leo

[1] https://lore.kernel.org/linux-arm-kernel/9432df20-08bf-4134-b4b9-e6b5d618af81@oss.qualcomm.com/
