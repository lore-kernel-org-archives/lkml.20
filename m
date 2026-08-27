Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3523FA5F0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787832966; cv=none; b=W0h6H0jYTXmrcOD0wJdV5DH1h+8rEwGgVY1dyGhod+CjNp32RcP7so2j6bMh6Lt1IDjoBWJqFnx+t0ULTBYYtEiBPFcoZLLYitzRaII5vT7lgqxRq7E3ZvcCWG6xmKnE4evcffRk52tch2wzB1lbC8akdnBCTaD1IhgqfvxK5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787832966; c=relaxed/simple;
	bh=TAX8S4NqmRp+bw/o5Pi0JMPJne9BisHCOygDHDk1+n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XeqNnQt2FNyIc1iwq943qnI+rCGnt6IpqUnP0NVbF/6PZnPWco/znOc9Jtm+JaWVHBZrvJL16w0IpDusZAypZn2MIGf5+pt+zUfxwKGpwJvWITIuYs6M4eTw9xsWvZFFDsNVPNDuwL5s5nfBODCua7D/mnTYJR0/fv4Iw36YzQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bGqt8Mch; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bGqt8Mch"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9B01691;
	Thu, 27 Aug 2026 05:15:58 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 368593F85F;
	Thu, 27 Aug 2026 05:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787832961; bh=TAX8S4NqmRp+bw/o5Pi0JMPJne9BisHCOygDHDk1+n8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bGqt8MchFpcg7ATYp7vNR9CzAIMziiByExJRJoLPzCGzuSXD0XQ0ZiCAXBxM1iyoF
	 I6gcM5IQ8cNqalC4a0yZEJPphVJIMkT63cGxqlaLcjaJzZ11zMV+vtIOzVfHd5ufmK
	 cpXg62KPJbIUZWds69rxdhFLrAa75yLDK/NhDVwI=
Date: Thu, 27 Aug 2026 13:15:57 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	suzuki.poulose@arm.com, mike.leach@arm.com, james.clark@linaro.org,
	alexander.shishkin@linux.intel.com, jie.gan@oss.qualcomm.com
Subject: Re: [PATCH v9 04/13] coresight: etm4x: fix inconsistencies with
 sysfs configuration
Message-ID: <apAqfS87BY4_2Vn9@e129823.arm.com>
References: <20260725113645.57519-1-yeoreum.yun@arm.com>
 <20260725113645.57519-5-yeoreum.yun@arm.com>
 <20260811154521.GF15499@e132581.arm.com>
 <antUM71hxHaBJ_5l@e129823.arm.com>
 <20260811174503.GJ15499@e132581.arm.com>
 <antjkuiPhsfE7e_H@e129823.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <antjkuiPhsfE7e_H@e129823.arm.com>

On Tue, Aug 11, 2026 at 07:01:54PM +0100, Yeoreum Yun wrote:
> > On Tue, Aug 11, 2026 at 05:56:19PM +0100, Yeoreum Yun wrote:
> > 
> > [...]
> > 
> > > > Can we treat this as a refactoring instead and split it into at least
> > > > two patches? This would make it easier to review now and easier to
> > > > understand later if someone will read the changes.
> > > > 
> > > >  - Lock refactoring
> > > >  - SMP call refactoring
> > > >  - active_config refactoring
> > > 
> > > It couldn't since separation of Lock and SMP can introduce the bug for
> > > that patch. and the Lock and SMP call refactoring isn't meaningful
> > > without active_config.
> > 
> > Each time I read through this patch, I find it a bit difficult to follow
> > the overall logic, as it combines several changes together.
> > 
> > I have no strong opinion for this though. Perhaps we could split out the
> > support for a NULL feat_csdev->drv_spinlock into a separate change
> > first, as that seems independent and should not introduce regression.
> 
> If the NULL lock is separated, since it before the SMP refactoring
> there will be a *race* for it.
> OTOH, if SMP first, absent of NULL lock would make a deadelock.
> 
> So If we really want to seperate, we should the SMP and Lock
> refactorying must be one group.
> 
> However, seperating the active_config from there, I'm not sure whether
> This would really make a difficulty of backport.
> We might separate the active_config as a cleanup but, this would require
> also for backporting but active_config one wouldn't have a fix tag.
> 
> So, I think it would be better to keep as-is.
> 
> > 
> > > > > +#define feat_csdev_lock(feat_csdev, flags)				\
> > > > 
> > > > Could use inline here?
> > > > 
> > > > static inline void feat_csdev_lock_irqsave(..., unsigned long *flags)
> > > > {
> > > >     ...
> > > > }
> > > 
> > > I think this is much annyoing. since the deference might add more
> > > instruction to save the flags. Otherwise the typecheck is for
> > > compilet-time check and not for runtime.
> > > 
> > > So, it would be better to remain as-is.
> > 
> > An inline function provides stronger type checking at the API boundary.
> > It is readable and easier to maintain. Dereferencing *flags would be
> > fine, as this is not a hot path.
> > 
> > I was inspired by the implementation in include/linux/serial_core.h
> > (see uart_port_lock_irqsave() and uart_port_unlock_irqrestore()).
> 
> I think there’s always been quite a bit of debate around this,
> particularly regarding the maintainability of inline functions versus
> function-like macros. Personally, I don’t find this particular function
> any harder to read or maintain as a macro.
> On the contrary, even though this isn’t a hot path, adding an extra
> instruction still feels like a less preferable trade-off to me.
> 
> @Suzuki, What do you think? inline or macro for feat_csdev_lock_irqsave()?

Gentile ping in case of forgotten.

> 
> -- 
> Sincerely,
> Yeoreum Yun

-- 
Sincerely,
Yeoreum Yun
