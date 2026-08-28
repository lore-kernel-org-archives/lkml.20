Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0872B3DDDC0
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904812; cv=none; b=q1Q6LVdTkGBsRU70+O/aFKWNOB0iwp0H9woyo+GCR3Mv05jGadxAMFpZC/AMzDIya/69kgJgnLjBuvOTdw5/cMFfUJ32BCnhU32U76dlrKg3CPFlta8UfxuEJeCf9COnDApWjxgJ7ZMv+m/G8blVJvNG1RSG25/gaDVkqH4CKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904812; c=relaxed/simple;
	bh=QViZsmg47HQJ4/jUsnVWVVO+do9phXXzYkVs458jkYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZet4Mf6oGYPeOjxWHY+BD12ZJa5yNL8GTv/s4oL+Lm+0DR4BnkKLUCMRvtP9l+2FvUXUUD/OojHcn3cIv2JZKf7HhK6NcTlwGvUNVlL1gvty7ShruAKiAuZl5E2E2zXzIqksXVsGDs+9zKiwTdgiXRsXsleQ1JMcmb8+0K3jGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oW0iHDyV; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oW0iHDyV"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso924952a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787904810; x=1788509610; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zn9dRUGxl7Mv2CZKE7zCoRg5bKyvyI0ggT02COAjCmY=;
        b=oW0iHDyVZfkho58h1jkuIDc5z5ZN+LLNunysq5Ob5IoUnAGZNeWzDZKTE+GgAm+aqG
         AiU22yK1tsmMp6o3Jc9GILJ/AZkgc3hL6VHprN1dYOvQXf2YIZ1raMGx+eWYPVfaLr8P
         bN8s6DYi5VGD1+3fWXlCPBbkk7jr+Zv4cKbHxoJlZt+OyQ10vxtR16A5CcFeL/aruPKW
         D/awDECFUh3EX9p3CHkeUn+cO017ng3ooMDqOS6bf5BjCINsll5SA15H2NLbUZX8PRWz
         yIRzPAW+N1CyaxwLti+IL9BpKiSIoMdO520dbG7Lo11CGlbDup77lCKJxYZq2pug7aDQ
         R3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904810; x=1788509610;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zn9dRUGxl7Mv2CZKE7zCoRg5bKyvyI0ggT02COAjCmY=;
        b=SJxn4fVbcW2oP6Fl6KLW4kSbJanOIDcGjAedOvwMT2de+LTroj4Ysy3XgnqjHfEtIM
         WxIxojmK5kRD9jaMptVNqlSJPzxw9HZHX9vejXnwC+7Mfr1qaCWQwIEb+6fWMTgEA8n5
         7dxVlG6rX241a86nAfZbXgRzZl57SLNxuG35Gpaw2mcDI5aEaJMcOFQ/mUZ1aYK/VA8f
         yVyl0aOjpiRtlkZVR3g8+Z8tQqoWlbEuIxJRBOtIxrDUO4N+pEffXZlF2/j9Br2vyjki
         o2lNOdvmV2bp9lLZN0clILVDpvPnt35VdO+9oYUQIFT1TJLn0u//2rDvvHx1JLWvFCID
         8m0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rrj9LEIK4pmtek5iZxR3cvp8H7N9zwfWyQnHWvCEH/CPxZCa7y1t6GvwvwBfpDeivC46T+4hI8mSDltcFI=@vger.kernel.org
X-Gm-Message-State: AFuF++mrthOyrifrU3LYqzHfHpQW5/VO6NgZOL3rvF29KSGQ1K221l1G
	Hx+m6LFvT6+8BOl7ov8eO8ao4jrVHKiFhupbqVNntnZRfwZRfZblYWob
X-Gm-Gg: AR+sD108zw3/+r/eMhDj8cgeOrVI9XudGDYtuSSJNylpkpTWEZZ91xOLkBpl80WCEIl
	pAUzNH0dh3kFlQaf5FaJMbkmYYv6UteTvOQjIeIH0ig1CXlwlvqRpCfTamTGIw62T2Yfsdrr2xk
	TJu17v/fTy7/q0+d6W0Pg7AeK0WHq2U3kO/8fID7CH7fLaiN8oXGESVCi7yPPjep3P80KzbnUyG
	tj3mSPaAaIhNIu0Ub7vGhqA0Bv7bT7lFf4GBZgerIhVsBsbsjsICoaZYej4yHkJqI+vIpLuvprV
	7ctlWmO/HOLS34MZ286ApSUMavH2AuSikT4oVtsGw9cR7y10+i66zj8okypOISRoO+45zhuAyKw
	TX04QCv40onSq5cO/NDn0bCUpxdQh5Vrby3CZTJjb+c8pVwbhfrU14JAxuzElyJ+CEOV5D5dzSm
	ZKLE/I4jDBU94Ab2MlIBunPa/tfdBvNocIQSzdqamKnI1HjF8Jt8w37GJF/+KrMsLkvmrX5VXHn
	LXYUOlDfYmB5JiMBK7TEQ==
X-Received: by 2002:a05:6a21:6004:b0:3d1:9166:5c68 with SMTP id adf61e73a8af0-3d265f403d0mr11879224637.8.1787904810271;
        Fri, 28 Aug 2026 01:13:30 -0700 (PDT)
Received: from localhost (115-70-157-242.ip4.superloop.au. [115.70.157.242])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e41837c6sm1054606c88.11.2026.08.28.01.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:13:29 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:13:26 +1000
From: Tsz Shan Chan <tsz.chan.dev@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Tsz Shan Chan <tchan@jacques.com.au>
Subject: Re: [PATCH v2 0/2] iio: light: vcnl4000: support shared IRQs
Message-ID: <apFCbHvhf5I9AMYe@fedora-1>
References: <20260814-vcnl4000-v2-0-9b771290cc1d@jacques.com.au>
 <aoLorPM301oeipKz@ashevche-desk.local>
 <20260822032957.15e3f3cc@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260822032957.15e3f3cc@jic23-huawei>

On Sat, Aug 22, 2026 at 03:29:57AM +0100, Jonathan Cameron wrote:
> On Mon, 17 Aug 2026 13:55:40 +0300
> Andy Shevchenko <andriy.shevchenko@intel.com> wrote:
> 
> > On Fri, Aug 14, 2026 at 02:30:41PM +1000, Tsz Shan Chan wrote:
> > > This series contains two changes for the vcnl4000 driver.
> > > 
> > > Patch 1 makes .num_channels match .channels for vcnl4200. vcnl4040 and
> > > vcnl4000 channel arrays have the same size, so no functional change.
> > > 
> > > Patch 2 adds shared IRQ support. It changes the trigger type from
> > > falling edge to low level and adds IRQF_SHARED. The IRQ handlers return
> > > IRQ_NONE when the device did not generate the interrupt.  
> > 
> > LGTM,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > 
> See sashiko
> https://sashiko.dev/#/patchset/20260814-vcnl4000-v2-0-9b771290cc1d%40jacques.com.au
> 
> It might be wrong and there isn't a race condition that ends you
> with that condition of stuck level interrupt.  If so just reply here to explain why.
> 
> The one about even disabling is a common issue - the IIO core has
> not explicit tracking of what events are enabled so it is up to the
> driver to quiesce anything necessary on the path down. I didn't look closely
> at these reports though so they may or may not be correct!
> 
> Thanks,
> 
> Jonathan

Those are valid points. Will fix them and send v3.

