Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793093269;
	b=IQLcYtBACWK895jYMvr3OpSJC9uL/5wFVb0OuMIL3/v2s+mlgfFSjBkFeaMEkKsbmOfD
	 n2cNqxq16xroN1BI5O06JE6IIMh5N8q5fIxzeMQCynZLETvr3vAeFMcDf816dqNgier3c
	 GQK840dBPWL/iPcnhmMx3CZFsUOnJ+p99IeUiwLoEm+4siFEUg5A6rfWKiDBSknzEYQ8k
	 0muvLGt0Bbxex6riPZnDm7mIevjNrQWsWCDoZsTWlpm2FqlvrqVuaLcBHfyW3aqmEHfLF
	 9Vy7ZJqRMLFeLpR0YfeA4WE0EnJBPZks9A28gItr0Q4G+2hpQVLXe0hufqCPf1mDnWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793093269;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cqMEEiWYMoK/eFz0KCyctPUX1pvK6M3UDTv6SKHJbck=;
	b=xH7rEij7ECxybBhDMOE6E77PlXJy0Sdz7TTdngZ24kQQAeuCOd61ZIlSTJ6b69bFuIfj
	 zb2f6pVXh/XrLbkD/ulOVGC2idob3y166kjkjOlv/8bARLBu1lSwe1Qgvo6aj/xxpqJR6
	 TsX9CpUtL2ER4RKOZ5/3yaMM8kmJTkfvDHRMv5GCOKT+mHQwAVyVg4t8GSz97+1LYFi2W
	 Wi26o1zoYz8/ZkanOM3SczsfpT4/CA/RsI8nUkC0rja57N7c2bpU5yqNkIWYuWfbTZUyD
	 uF3MeSTlvihLFg/j+H9nKXIbALGAd3t8Hzh7gH140TXF303+pQ/7n3N8zen1bdykGow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qAezmMBT;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5300B606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5300B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qAezmMBT
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F1A4A1596;
	Tue, 27 Oct 2026 02:27:43 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE4BE3F673;
	Tue, 27 Oct 2026 02:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793093267; bh=3HTFONAtsNkglkqcovoxQq04UGMU0Xwx7v6nOz9s7QI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qAezmMBTbU/EGoNn3tUW75M1WR3VQO/nODpfQ0fRfxNtZ25acW1NbtrIK9BLhcbUE
	 hGw7le/HnI5z2mJQXHWz4dniutngUgRsOxfB4g2Rq3kwwyqeW3PVfqZ5Bt6IZLUWir
	 ux0mMQ7VdW6TM1ekRsFgC7Ln4LgkIu+lpTynQJ+Y=
Date: Tue, 27 Oct 2026 09:27:44 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>, coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] coresight: etm3x: Remove redundant NULL check on perf
 event attr
Message-ID: <20261027092744.GA769456@e132581.arm.com>
References: <20261027-james-cs-redundant-null-check-v1-1-ed9486be26e4@linaro.org>
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
In-Reply-To: <20261027-james-cs-redundant-null-check-v1-1-ed9486be26e4@linaro.org>

On Tue, Oct 27, 2026 at 09:17:06AM +0000, James Clark wrote:
> attr is derived from &event->attr, so it can never be NULL even if
> event were NULL, making the check dead code. The only caller,
> etm_enable_perf(), always passes a valid event anyway, so remove the
> check.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-c4ca0d3c-1e98-4965-aa46-da226c756b83
> Signed-off-by: James Clark <james.clark@linaro.org>

Reviewed-by: Leo Yan <leo.yan@arm.com>
