Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794300488;
	b=GiUl9gMwmfgC46DEHY5xJZoSbQG41I4RIWnfW8ZnEVu5o8hzM9DBiVmI2RBUsW1mmQG0
	 5hxQgixOKH2Vo+9ibFJyhzVu0JAy7XyHqp0I+ZGDjA12IdOR4kPs94R8QF4IAlHiRb6SH
	 4ki9530IfpRSJny3ttEK8CAOl3nMAetg0I2pga7Tk+JnxSWfyBFlexsmJgG3wffMeWkVp
	 qO+e8u6skQ/CUdysnIvq95+Y+V3EevAUQRmlM2Jxgzb7fHLyWI4kUqLMq1zkdrKJh2MAl
	 Iy4Hgxd/oxroii88XowzJjqADiTUR3hLIcPVNUPhNUKNvVQ/3R0uIXFF37H/mTSmb5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794300488;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=gdWtCqOrHd/hpqiy5fnAanl9VNsFsqG9lG1bU+R/JFU=;
	b=TPMh41bYVrfaw/2yqlK0GGoOKSZQZJdU6sWSRhKCi+LguQkdbnpkL/DFo8DwWclgtx3F
	 nG1yROxgc+0RIfWhhD2bkNGxaT0h3a/bUydRNpmejOFKj2DY8SuyEKrZ0W5sOiarXRknj
	 YvjGobAtCSFlfMY7fqMAQBmNGAGXJ7ASKSx7+nUN0IamY/Ja5hdiysFJU8FPkZnEFYcwN
	 bPVOUNYm8bGAinzA0xnsH4mNCGaq7QdmoGwYcqvD2YbrxyxF1Szvrv0aynLYdJmAX6eN5
	 c6K4QaTmOcD3hzRanmWR7qmiXRfJIVLf2p+/8liQaup+sy0HxK4M4IigtmIvCJ+3MSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jBkSM0dF;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A258606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A258606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=jBkSM0dF
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B4E0E1516;
	Tue, 10 Nov 2026 00:48:03 -0800 (PST)
Received: from localhost (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5451F3F85F;
	Tue, 10 Nov 2026 00:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794300486; bh=D6cpUVH7ysCqLH5BEhpKUszzrMl4AwrMKiUXrthyWfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jBkSM0dFRGyhVC5aY24nwEDz041CoShYhuFpHaOy8BQgFV4TR3I+JGFH7gUorBGnl
	 IyQhDj6NMKfailh30sFCTRZ7tUJhDQ3fsi0A8/wWulVqhmMZJytmNOOIOfI8+oNHP7
	 E3q0Zo8f7Knm9CkrDCZce6DWTj3SNYNWOBVi865M=
Date: Tue, 10 Nov 2026 08:48:04 +0000
From: Leo Yan <leo.yan@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tamas Petz <tamas.petz@arm.com>,
	Tamas Zsoldos <tamas.zsoldos@arm.com>,
	Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org
Subject: Re: [PATCH v2 09/23] coresight: trbe: Clear TRBSR status at stop
 sites
Message-ID: <20261110084804.GZ9176@e132581.arm.com>
References: <20261016-trbe_enable_disable_irq_handle_refactor-v2-0-3f57cf3199b1@arm.com>
 <20261016-trbe_enable_disable_irq_handle_refactor-v2-9-3f57cf3199b1@arm.com>
 <a79a52db-2361-4303-9d43-87837f349f48@arm.com>
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
In-Reply-To: <a79a52db-2361-4303-9d43-87837f349f48@arm.com>

On Mon, Nov 09, 2026 at 10:51:30PM +0000, Suzuki K Poulose wrote:
> On 16/10/2026 17:55, Leo Yan wrote:
> > TRBSR_EL1 records the status of the buffer that just stopped. Clearing
> > it in trbe_enable_hw() postpones cleanup until another run starts. If
> > AUX output cannot restart, for example when AUX space is exhausted,
> > that clear never executes. Clear the status in arm_trbe_disable()
> > after disabling TRBE instead.
> > 
> > trbe_handle_overflow() can start the next run without calling
> > arm_trbe_disable(). Clear the stopped buffer's syndrome and status bits
> > while TRBE is disabled, before attempting the AUX restart. This also
> > leaves the status clean when the restart fails.
> > 
> > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > ---
> >   drivers/hwtracing/coresight/coresight-trbe.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> > index 26e7554d6bdd31f8a55a8bc3a7b6d4c49b984b9b..dd9c9330bb0c739795f300dafc6ce34e72fbf280 100644
> > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > @@ -655,7 +655,6 @@ static void trbe_enable_hw(struct trbe_buf *buf)
> >   	WARN_ON(buf->trbe_hw_base < buf->trbe_base);
> >   	WARN_ON(buf->trbe_write < buf->trbe_hw_base);
> >   	WARN_ON(buf->trbe_write >= buf->trbe_limit);
> > -	clr_trbe_status();
> 
> TRBSR_ELx is UNKNOWN at reset and if we don't clear it at probe time, we
> endup running the first session with unknown values. It is safer to
> clear this at enable_hw.

This is incorrect. trbe_reset_local() is called locally on each CPU to
clear TRBSR_ELx, it has been guaranteed when the first session starts.

Thanks,
Leo
