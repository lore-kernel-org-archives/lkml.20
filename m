Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414119;
	b=jK8BdwbHoj++ITPRT8TrOR2loLxBtV5I6naSIU9J86tiN6FxQ/0HUm5Jt37GFW/dgaBM
	 hk4l2u2lS+vxKOlSADbdaLFwfg5lfo0I+ZK8MMyilZVdGV3Oay7l6qd53RriEnD20aFxY
	 VWlETpMc+D0cGz3t3b56xMeCz4z4u19ngHAm6tnaleLdFwMO2RDq6Y2KZz5aFTRBESaaz
	 rscq4RegiVbL9GhV9WgMF18Q+eCGi/zJXJTj7AgetozJTZdmnx6hQXZpiSCmztJP3wC12
	 kahYT7R/A77QjWGFQDuICJOKXTp0Mw2IMWHOsSgxq4w5tVV/apUHRgeMieekaQGIUnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414119;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ER7CQJLmf8a3n65haz0Sx18P2Y6E6cMclcthPxuIRO4=;
	b=AJmzipMU0ozAuAkTHJ6UHOMB9TKr/SPBBrkXe1wOjGrWbwnLyf6ZniotdnF4Jdr3ACnV
	 xWFYyoqd2juQqMhZbT8p9XlQgrt9hKE+sllLsQU/XJVcQmemIJL1vUdwo+Ihkdk9frCn1
	 5sMQ9WtjhwocE0fPD9lVGIWqemEgb1OCNh60PEZmi4f/1cBAj/ZD7CuvK/sXoJgiD53Zg
	 6UKk9+rzoxJ8Ztsi6la82htxOVe4seEgAZHgiWy04aDViuwWn1Qm8FKnDLD0wQlN8AYs3
	 ykHE7j16ri1+fBdKmhEH8ZbJN6W14WMls5/52pshSTcbjJgsxjv2EysKQJRq/U+C4/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W88VeegF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CE3606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58CE3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=W88VeegF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5733F1576;
	Wed, 11 Nov 2026 08:21:55 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECC363F632;
	Wed, 11 Nov 2026 08:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794414118; bh=wIEcp4gG3RzK9CK7Bl4yceNnesqt7U9huqJkdKCFszc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W88VeegFHLuNIGCmJW36kYi+ePaj9zkWVn2/RZB+WHKlySxcmt5Bpb03Zk8BymLTO
	 8ccvQwCTbFg/uK2HDV8+qGU1IWmWrs8DEId67UP31hZZxak8AC6Vl+E7Snrq7VJKIC
	 H54c6aGUgnwqcCdGApUoDr3nHLmtaji9gr+bE2GU=
Date: Wed, 11 Nov 2026 16:21:55 +0000
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Subject: Re: [PATCH v2 06/23] coresight: trbe: Drop redundant disable from
 enable path
Message-ID: <20261111162155.GE9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-6-3f57cf3199b1@arm.com>
 <8136ec16-8132-4212-8ccc-6aff05ab698c@linaro.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8136ec16-8132-4212-8ccc-6aff05ab698c@linaro.org>

On Mon, Nov 09, 2026 at 04:27:31PM +0000, James Clark wrote:
> 
> 
> On 16/10/2026 17:55, Leo Yan wrote:
> > The Arm ARM (ARM DDI 0487 M.c) rule RDJMDD says:
> > 
> >   | When the following conditions apply, the PE might ignore a direct or
> >   | external write to any of certain Trace Buffer Unit registers, other
> >   | than a direct write or external write to TRBLIMITR_EL1 that clears
> >   | the conditions:
> >   | • TRBLIMITR_EL1.E is 1, and either FEAT_TRBE_EXT is not implemented
> >   |   or the Trace Buffer Unit is using Self-hosted mode.
> > 
> 
> Doesn't the rule just say that the buffer must be disabled before doing
> writes to other registers? But the explanation for removing the extra
> disable is that it's already disabled at this point, so nothing changes.
> 
> The commit message would be clearer without this bit IMO. There's no
> architectural requirement to make this change, it's only a software one.

The rule reference was intended to provide context. The main purpose
is to clarify the rule remains satisfied with this patch.

I will refine the commit log to make it clear.

Thanks,
Leo
