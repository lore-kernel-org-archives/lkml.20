Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792764017;
	b=DcanKzEu+4bmAGm0poXGcXnwmFk+eAy0Gyl8EOopwV+nBcQ5DiZihzP+kt3PxrZhWKTT
	 nw+AwTk3HAVHxqsJf7id6xLe4UVyP9k5b54r0eOI7m2xD/AiGgdHWgqCCWEAuZJ4lbjK5
	 cz92JjGRRzYjceRbtvC7zk55Q3iQhoJ1/X7ZGdtqG6uLlIUNhTXhziNCUM5R9/mlCrdRY
	 CvMv1fkTMuj/QgMKP3UJ9c8QkasflRpDPo/mSfCmICIQTK6TNh7lPR2eT1xD70InKGdGj
	 NAhji5rBoB7w/OOsW193KTRFblidQ1/PphvqkCa83GUXLZ+mzBE5vToC8uP2PidHNxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792764017;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=7T7kd87x0lCdwlmdk5J8PfZrtJwoJ5GFmRHEwdyDdq0=;
	b=Kavvg00nWHiOxVRoMn7f8eZEhyDst/RVMnk+ojt5EtiwCucEb8twss27zGH0t3o34KDM
	 GpjUBM0pLj3XpeOyWJ4JIZpj83440j7FisQ7Ls1nZV8JQtefeqLfjX6uVi1uSd7pSVygg
	 9TI76F70sdTK6/MW73D0StMIi5sC9fmENtctOzYeuUOXQqu2ONr8fHbI+Z57r4SIuf2RK
	 WnnNzy3NXPtvP6PyvayRHTkm7b9lUKSWQXQmul6/3y512AF81iK/vVFPlkEHUcPNLwJMd
	 XjaS+Dw5w6IR0Tmj04nxbJ14KEo22j6xaj54QGfrBmBnVfxmxMxDuYWBny6EP2SKo/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q3Hcq4sV;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7E55606A31B;
	Fri, 23 Oct 2026 14:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7E55606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=q3Hcq4sV
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3CAD1C00;
	Fri, 23 Oct 2026 07:00:12 -0700 (PDT)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B91B3F673;
	Fri, 23 Oct 2026 07:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792764015; bh=jDuuA52OKdaceJrZOXhYdj0GY5RdsDJoWvfCSCKFrG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3Hcq4sVEcSdBz0n1dXGKQ0Rle/LBvWVdcAXAyMkZLP2LXqlL7dem96mWVmTAOkqH
	 akm/4/OKq79UikWvGY1FIlXhImj4Pifi8h1EHNQKhwqfggzjJa5mQ8jemw2YedCzPF
	 KQJDL6pYu6e/1QC5GpwYDwNOsT5NkN5uFTa/dM+0=
Date: Fri, 23 Oct 2026 15:00:13 +0100
From: Leo Yan <leo.yan@arm.com>
To: James Clark <james.clark@linaro.org>
Cc: Amir Ayupov <aaupov@fb.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] coresight: etm4x: Report the external outputs the
 PMU counts
Message-ID: <20261023140013.GK26205@e132581.arm.com>
References: <20261012230527.750567-1-aaupov@fb.com>
 <20261012230527.750567-4-aaupov@fb.com>
 <20261021164332.GI26205@e132581.arm.com>
 <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>
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
In-Reply-To: <024bc6f1-eb73-4f01-84f3-738bf68bdc93@linaro.org>

On Fri, Oct 23, 2026 at 10:49:40AM +0100, James Clark wrote:

[...]

> > >    * a device that matches one of its classes and has all of its capabilities.
> > >    */
> > >   #define CS_CFG_MATCH_CAP_MASK		0x0000ff00
> > > +/* trace unit external output n is countable by the PMU as TRCEXTOUTn */
> > > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT	8
> > > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT_NR	4	/* TRCEXTOUT0-3 */
> > > +#define CS_CFG_MATCH_CAP_PMU_EXTOUT(n)	BIT(CS_CFG_MATCH_CAP_PMU_EXTOUT_SHIFT + (n))
> 
> Isn't this recreating what GENMASK() and FIELD_PREP() does? Can we use that
> instead?

TBC, are you suggesting using separate capability bits to represent
TRCEXTOUT0-3? Why can't we use a single capability bit to indicate
whether the feature is supported and caps->num_event to indicate
the number of external output signals?
