Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794223461;
	b=QM6Wl0Od0nrPkYcoPY1ToGXnE1nx/VW4xfZ0/dJDrdhhz678hJXmd9rBYEnL9oWZZVeO
	 iBAVh64tB4iO6udfTVgodncWEXPnbiBqLZGdiGv37QhNsWQJg3teei4oUwsSVcf+kdlsN
	 lCUF809iRfBRIYIQ/BAc7Ham1T8A5n38yREjRdI/wEQTmy70O5mHEIhoj146/efii6N95
	 /1BKysVDoaj0aSsSy5DbReC1MivXpBSNsV29blr0WNrgRiXXvtoN+bsdohjjli+SLHrfA
	 pQI7m676sLuGttMcRTkv5XEOEMGkzx8K43ai+p7ijd/mc5Gb/nkH4FDsnoVMVrFFIfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794223461;
	h=DMARC-Filter:Received:Received:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=AwNAeOOEuNDUA4AaaId5KqgQe8BRoEb1zw2ve0Lhbyo=;
	b=zu/RNsQOZUYsi98TXy6Jt2IlVvLLftzG+/lJPOtUdgAAxllkeJuHoEhj5cGcMBMy5HJW
	 UWuSW3FraJrPQ5ZuGWwCXc7abuizqAZYhNctNwFWOtSfJzzzsvvNYttt70HEonRee2ETx
	 P3K9/Dr8W2Jt58F6hNndRk7YbcFLtLu+Ip5/slFecYBTViE1O2nTneHbv7YszjxcPcRoF
	 Yvx6jUeWUNChCLXVmlxSnvF8TWOKfoVqpeG2AkASVk0sKJ20ZiegT22h5jZ8pP+A9n2Wf
	 gBnJ41hYe983Y4glUmXcbyDtGUEf7OnR/zSJItM0SfrWwdorrad+YbEUfWy/YzaRDeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="RaowZB/U";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3366606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3366606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=RaowZB/U
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56751169E;
	Mon,  9 Nov 2026 03:24:17 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E90223F85F;
	Mon,  9 Nov 2026 03:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794223460; bh=Kkmftib56f3AMxIKdYPPCjung1RFBfnihXj5m1EZsbY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RaowZB/U9NPIcmp5vOjzWHMob9hYbOyG0rpHtd+SwdV34lNqRtzbgfNdyZqgUZz0L
	 3RzdmI2YQyhWGzMSgk5JUQWAP1ayb+zBdew+kv6yNE0O6Vu27tjPlYSa0PGUxiNhmg
	 GS2QaSNACRh4RkxEo7gzuO3Wxp1pj8jWButJrNeM=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/2] fix clock refcount imbalance for all Coresight platform drivers
Date: Mon,  9 Nov 2026 11:23:55 +0000
Message-ID: <179422341588.3275439.4801778261959568174.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
References: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 10 Jul 2026 09:14:46 +0800, Jie Gan wrote:
> Found a clock imbalance issue when remove the CTCU module.
> 
> coresight_get_enable_clocks() enables the programming clock and the
> optional AT clock through devm_clk_get_optional_enabled(), which also
> registers a devm action to call clk_disable_unprepare() when the driver
> detaches.
> 
> [...]

Applied, thanks!

[1/2] coresight: Fix clock refcount imbalance on platform remove
      https://git.kernel.org/coresight/c/c2d0f71617f4
[2/2] coresight: tnoc: Fix clock refcount imbalance on platform remove
      https://git.kernel.org/coresight/c/69285a3b57db

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
