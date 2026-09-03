Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25AB4E80D4
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450234; cv=none; b=iriy5tvDVD1eHoRSuBWrMo/BBODWR3gxS2hkJ89paDT7/IsdyN3PbrAMHZzr6Pu93HOAacnO0g4u9PPMkQPrZ8HDBvh5zwZBCmIL3/pRwZqV/WTAxnHLtxrtgTkRrKtWjsFb+NgOJnLmF/ycQuNZ4CCXGr+3esB9xr+M7Nir7og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450234; c=relaxed/simple;
	bh=Cr1VOzuxeE4VILI2hx+ruBgQnAyfzuEw4v1Ifg8gbxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOTofvu919l6gkwnhHlA/TCeZct2aNHhvtWEPS8CSbkKJ8wwWnUGaQvRoawU0ldxZ3L8uHdhD03dv6X4IRRcAUcNjxs1v/jodqAI4ZUumtBMNqa85muZUdqzEYyhP6/gJB8OSFQ6gSAFBdEQdZ+1bVh9hINpVmqziJ0gFJptNQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ShR3qcU6; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ShR3qcU6"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1712a04ddaso422411966b.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788450231; x=1789055031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sGknXrZQcrgiQ0N899uoAGQuTMFJK6yez7o9faoOnD0=;
        b=ShR3qcU6TbXEkEbdOde1bvmL5qGQcP+C+52ttA9A0oOq06cmE1FXk7YtKBwoKCLOWK
         WbWLPqH3v6XcFMlx9ydyAz5KH/p0d/VMErQK+FBY89P26M3rkkw3qziJyyytzmovywqV
         Zoq7cggflaJQ+bUXPM5YSE4lSJeqHzjuOyUhQ7/kPZD7frCUWqQtEXdTLLddMJwrqeW+
         bKayUcMW3O8D9Xn9ul9kJxYwiXO47hNTDjP80TAFE6DmuoOel7JHKv4wrpiMVo8C/Da5
         0VS/9GWL3jeN8FVo/pNbgDI/jz8MiOvF1PngU8scYbipoOtofYEIMOcJWCxBQVhz1zU9
         YKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788450231; x=1789055031;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGknXrZQcrgiQ0N899uoAGQuTMFJK6yez7o9faoOnD0=;
        b=o/kNz0uAIYY9FFXCP0GB0XIgJWLxgzBe+Ulz7b3GQlKozGtxRhlgjWGpyoglFalauV
         sHa2XYyOkZ3mJ1jxOY+wdmRqFUNFQuJOwxhoWZBizFQVflffESwy/ug0HNi1tl633MPk
         GJMM/88uhOcrZrl2ZG9M7EHX8sF0SsqjHvSK+owGSqe1TXBgoPIf2vg8MrvR8N8+/Ede
         V02pAkvYWq9X4eVMCRviU7hD5tBLLrvKI9okBxAOMjSgSz7s2K47pj3EA84n467VvLYf
         A1yFeT4ssaxSppzB0LP3baE0mPvcidLO3zBB/PObRGRItB23fl7kFOzGeixrJfVcX3Cq
         FsUg==
X-Forwarded-Encrypted: i=1; AKwUvBySbnYlioyB+60DZ/pBgk0U+lUGP5eLKRadkoXwAn/DB2FSvM+8uw2hcKR4dWn5YFpZh2NjmEdD/Og+wRg=@vger.kernel.org
X-Gm-Message-State: AFuF++lUZCooANoCds+y7gprrQKf3GHvQQZ1gQ2rpKRg+6HvNQ3aLDB7
	r5UoOxAVmLy6CkhKU6+uppUDGoPh7uwr+rKZGKJm6ZGeYZYEEOOquZDt
X-Gm-Gg: AYBFou1au3kERwF2Oju3tWa4zcdvBN+TVfIeJUcq8chwl/iwYsb8z0+bd5zGz2jyzji
	1eC3+S0AOCQswyb895+3odGYA2LC5/vaFH6AVH858VIDjVgjnELbUAfj2O+jP5MdJSn44qZnC4k
	Ig1XGojemC27iJxVTvHoqp16a1uceHTTTOX4uYAFKptZDm7wrkPOBiERNalD1LyR1nU89DCb9UL
	t8gji6WagubWbDtpaeNb+lcSSxUmfw3bCPCaC/8U4FBYdaR+9exCielHf2oyt9VciIgf+u+bhsa
	NbeLDVD8cSpfI5alwHsRe8pt4USZ8Pd7HWGqOf16d3HWiUcGOc2ex/X9DnNoCdMKPSx4JW7tzgR
	iPYQrL4GyQmVvcF9qAjEwgXXByYT7Hrrc7FdYgjUoYSNjB0C70r2cSJmGCNny4PNGPro/GXR/Ov
	Dv1UasGvwhsEAKSiF/3bpWOt8VIC30qmTRnYNJ52ZyF4TakvBpbTHaFN5F8UdWtt+EDg1l1ba9Y
	S4l9G3Jytm1CbITRnbjqh9C38P3SevWDKffEYd1qYERCPN7pcTVBckhYfh5bZUYRnMTwMxvZOOv
	3paCjJk0byW9tbLAw0q8sJAdlNjHs/Kiz59KR7bbQz6QiE8GgMEqdyDmcwJsmNPVo/mz65isTbn
	9+bNCIqfuYFGZZXn0
X-Received: by 2002:a17:907:72d2:b0:c25:6e17:9b4 with SMTP id a640c23a62f3a-c25d555448dmr878028966b.24.1788450230386;
        Thu, 03 Sep 2026 08:43:50 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172032sm115066066b.22.2026.09.03.08.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:43:49 -0700 (PDT)
Date: Thu, 3 Sep 2026 17:43:47 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Boqun Feng <boqun@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alexander Potapenko <glider@google.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] softirq: Preserve interrupt context during IRQ exit
Message-ID: <apmVB5OtKkYEyskY@gmail.com>
References: <20260903112737.49551-1-kmehltretter@gmail.com>
 <20260903122017.ZRsTFeks@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903122017.ZRsTFeks@linutronix.de>

On Thu, Sep 03, 2026 at 02:20:17PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-09-03 13:27:37 [+0200], Karl Mehltretter wrote:
> > __irq_exit_rcu() drops HARDIRQ_OFFSET before deferred hrtimer rearm,
> > softirq dispatch, and timersd wakeup. This work is still on the IRQ
> > return path, but in_task() reports task context.
> 
> Is this new? I don't remember seeing this before.
> 
> Sebastian

irq_exit() dropped the hardirq count before invoking
softirqs in v2.6.12-rc2, the beginning of git history.

The newer additions to that window are the timersd wakeup added by
49a17639508c and the deferred hrtimer-rearm hook added by
7e641e52cf5f.

Thanks,
Karl
