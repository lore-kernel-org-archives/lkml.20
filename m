Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50848261388
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 04:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788238438; cv=none; b=iUsqcSr7HfT1VySsoZ2DHlOY2V9Vh13t5311BIXcNLuP3MOVoPrqzJu1PQcKJqeI8defhD2LAlY7JcQ3fhZopbhHjBtMRgdRx20GMsgX9iAMsdj3ou1mZUlvaylQWgMphaynF/rjmDN+o11H5q6LgtIHQ+j/+fyEvbow5UsHivg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788238438; c=relaxed/simple;
	bh=qH/R/JoSagXeFNKBRkopSukPwb8kuYMYvSmTcE2reL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rzbndSdmnlvWOzNVjg0KJj1Vh4TJJEMgM2w1xpuPPSQnNhw8XItsYYBHAEKB7EOExrVyAUbA3sV2vCzN7d5zbJaFAxIF8mAulUtgahBKGjZg1nbr4KPRCq9eW7MFz2hxJZ99+nwHQ+jgrU8ivpwnW2+ZZAHd2AmiqKu+9dxZg1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehZH5OLl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehZH5OLl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB3C1F000E9;
	Tue,  1 Sep 2026 04:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238437;
	bh=ytuFL56qJYKx7je5e+O86sWaGDqpI/fCKFZZwoOb6WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ehZH5OLlDbcCGncg9W6oIgdCvOAFindu9fVC48iyVA96UlMDfjmpguYF0EgQ3yZbf
	 ONXBtz3/8dUy/YCpA8ey7um5WokGJU1q2XF3JOyyU6AlkcBuGIdnFPEuUmnUHE1Uie
	 Jz+9bhQDgZIFVrIuw49MVkfjaoMsn7XSnvG7zK81j2q/pDyxizWXGt1kiEO6FOGWKI
	 PPRwqy/oaqGLL/ViWbbFtoWjxaXJ/MQCLG+o03r789TzQWCFVSHLbs4ROVDUEw2x2C
	 /mVnm/8ytfqjZn8ttVINp3964Qb7csBJ36dthqti6n3LBEvxDfU6YKs8zdpXo2iwzw
	 eGV9aB3FXDoCg==
Date: Tue, 1 Sep 2026 12:34:11 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Nam Cao <namcao@linutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] riscv: word-at-a-time: improve find_zero() for
 !RISCV_ISA_ZBB
Message-ID: <apZVwzxBD8Ih493W@xhacker>
References: <20260113122457.27507-1-jszhang@kernel.org>
 <20260113122457.27507-2-jszhang@kernel.org>
 <87mruh5h1m.fsf@yellow.woof>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87mruh5h1m.fsf@yellow.woof>

On Thu, Aug 20, 2026 at 10:31:49AM +0200, Nam Cao wrote:
> Jisheng Zhang <jszhang@kernel.org> writes:
> > +#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB))
> > +#include <asm-generic/word-at-a-time.h>
> > +#else
> 
> Instead of this #if, would it be better to do
> 
> static inline unsigned long find_zero(unsigned long mask)
> {
>         if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
> 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
> 		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
> 
> 	return count_masked_bytes(mask);
> }
> 
> and let compiler's dead code elimination does its job?

This is impossible because the generic word-at-a-time.h implements
the generic find_zero() itself, so there will be compile error.

Thanks
