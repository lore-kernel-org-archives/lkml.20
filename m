Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920F81F12FB
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787963849; cv=none; b=XIiqjpKVCLqNojsQFUGYwJKQonyXXNY6++2eScUCvQ4wQlbtTF5Etyofi3fuE2KakB5774KbdhzNY8e1DDac6kktkRNAnDaOPZUGQX1PDc4Hpta0wdApyxiAGLjdwhqTjWwAchnkjJ6uF7K7QADzjTYRZjo3F02w3a9VRDUB3sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787963849; c=relaxed/simple;
	bh=OtxXdRbEIGEUvC22NlhP7/3e6oEXzFZ8KbdBRC4HXds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3TWeoLJnGyHBbeqqoXXxr8wEEnRRpbkwKluQ42k0j05mB1/eLuTLsqr9Izj5goVVEc3OWGYMMQ96rzLGlzQi0TmCiyKI40NaNc8MA5io7N8BUO9Ph5vTAb/i9Nnu7y1FELIaCDGUWaEQw7P3SWBORddHgaqY1nYPcSsGy++oh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pDmMrTlS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pDmMrTlS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d3b440b97aso26265ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787963846; x=1788568646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9wbpSofY68EGnEexQqy0QFzqyttXM3qSmfFpYwxrkcA=;
        b=pDmMrTlScrDby58rUTwtKnYdPsuM5DDZdq8bxgP2zL9ZC/q46uc5nFl7AAtXc1GlEI
         +2IooUHEgA0fyp5P+1WdJQvofq0qsA/NvLXK+nuBhEpoNQZrN9U5wo7nFaZq5xkGDzZp
         7NUjv6Pma/L0/2nntZvYo3Iqos3S7NhaFJ8RtkfBptLR2ILyl3RXFgmnJtxtrCN9LrOk
         eHxn1nWEae43DhN+EDGh887nLLG+BpZGjF7Uq0mstdrJ84+EGpLWgsji3cUPrPdsnTsB
         9zlu+/p0ySdmVd2dtFZe0RIFZapoWmOKGa+GlDgyq0BsgWwERm26FXrOMBGGDnFfinmg
         WicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787963846; x=1788568646;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9wbpSofY68EGnEexQqy0QFzqyttXM3qSmfFpYwxrkcA=;
        b=NokFHpbdPhPYo6D3+mhb08vmFBGqorXOE0IhP8xSAvkppiV0wnP2IE/a+S6A32t9eN
         K5jSLSWrfU/bLtsbTnsDziRKEW17uGaG/1QSFPPe2OF3LaDMnwB7rgwY0simBasWYbiN
         QYeFB6535vXx7C5CjdWo6mOSXFZl2ggmq7+dBLeHu8s9ND9Zz7E1u1/e9tD5Otv7tgsg
         tB4lUntaO8tMSsl3/ghT2GYKXcY3u40J+jctRAdDKlbLcGM5feRvy7SbjbvQ0svikYMH
         kwKJSeNgj5b2aPQdL1G+fmc8WA/ds9FtPqpns/N67WKiy6N+rBHxUP0mppAlvG5jbO+y
         LuAA==
X-Forwarded-Encrypted: i=1; AKwUvBx/P5eD2OUdR0PVenBeWWV8I7TdTP/asMo2Py8a45Ym2n5WMrQvYOrMZ2+J9kGVGzP46uoSZ8yVEb9Lwck=@vger.kernel.org
X-Gm-Message-State: AFuF++n+bQRxYh+KIFBC2O/CQUFMb6GoyFtv9ULczcOTEAx0qiplPGJ7
	qg5BkqMLrUZ5+1ro6QjW0cxKWc58eWqs3BlCTM7YB7cL3jYKpzzqhhfQkoAl6A0a9A==
X-Gm-Gg: AYBFou0VNTJyE72vuI/e8Y2mlrQWt6cIqPIGSoAnCsqmXdg8BrnJgMXXpt0WKWMsy0+
	ehZrC1Xj/PNm4awWqnlcTAikKU6tLjGPrJ3MIi1QpFdxzDripkgy+xM5XWXc/oplDy6RiTzpobQ
	90RDud+to/zZbI10xyScz7n76y8CjOwOYATgFixHXA1e25aiZgOZnm3heubFBWPO2uFzuysjxBb
	Cwnw7mkVsaVck26jvWCjyH6CTtA8OqyhrEoyw7uZ/g1PH2D+6+PvPce+jeDHiO3V+TIXjUdMM+i
	Fraw1CDPWOmPg47ksr6/3mTJVoTNbwGy10FJ52ptru8J+r9OnZrOqBWL8Xg+HZBPr08TVqh0tX4
	Zcz4aFq/cFaipLlFEUwy83yCt+CmZQBngumzInflMifK/WEYnkGUchc8fn7SZfD6kGUYTcx4onC
	t9w7sIlMiMSqM6it7gr9D33kM4XdWODTzplzFm6nqPXgoL8TV335gDTj0ScJPSvC3hFlIcsQyNK
	nxDxFHBz5L98Y9+Pa81oLFy90QR9+g=
X-Received: by 2002:a17:902:f642:b0:2d5:db38:800f with SMTP id d9443c01a7336-2d8df554483mr2980505ad.14.1787963845250;
        Fri, 28 Aug 2026 17:37:25 -0700 (PDT)
Received: from google.com (89.163.16.34.bc.googleusercontent.com. [34.16.163.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a2f5187fsm545730a91.1.2026.08.28.17.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:37:24 -0700 (PDT)
Date: Sat, 29 Aug 2026 00:37:19 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Beata Michalska <beata.michalska@arm.com>
Cc: ojeda@kernel.org, dakr@kernel.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu,
	daniel.almeida@collabora.com, boris.brezillon@collabora.com,
	work@onurozkan.dev, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 1/3] rust: add runtime PM support
Message-ID: <20260829003719.GA552219@google.com>
References: <20260826131213.1820408-1-beata.michalska@arm.com>
 <20260826131213.1820408-2-beata.michalska@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826131213.1820408-2-beata.michalska@arm.com>

Hi Beata,

On Wed, Aug 26, 2026 at 03:10:55PM +0200, Beata Michalska wrote:
> diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
> index a56ba6309594..43bbf4bce993 100644
> --- a/rust/kernel/error.rs
> +++ b/rust/kernel/error.rs
> @@ -67,6 +67,7 @@ macro_rules! declare_err {
>      declare_err!(EOVERFLOW, "Value too large for defined data type.");
>      declare_err!(EMSGSIZE, "Message too long.");
>      declare_err!(ETIMEDOUT, "Connection timed out.");
> +    declare_err!(EINPROGRESS, "Operation now in progress.");

Looks like this is already upstream since commit b93fb6e76ec1.

> +/// Device's runtime power management status
> +#[repr(i32)]
> +pub enum RuntimePMState {
> +    /// Runtime PM has not been initialized for this device yet.
> +    UNKNOWN = bindings::rpm_status_RPM_INVALID,
> +    /// The device is expected to be runtime active and in it's normal operating state

Nit: it's -> its.

> +    RESUMED = bindings::rpm_status_RPM_ACTIVE,
> +    /// The device is expected to be suspended, unavailable for normal operations
> +    SUSPENDED = bindings::rpm_status_RPM_SUSPENDED,

Should the enum variant names use CamelCase?

> +impl<'a> ResumeScope<'a> {
> +    fn new(dev: &'a device::Device<device::Bound>, mode: Mode) -> Result<Self> {
> +        if mode.contains(ModeFlag::Acquire) {
> +            // ModeFlag::Acquire is intended to be used with Awake scope
> +            // Avoid mixing the modes.
> +            return Err(EINVAL);
> +        }
> +
> +        // ModeFlag::Idle is internal so strip it of before passing further

Nit: of -> off. Also in the identical comment below.

> +impl<'a> AwakeScope<'a> {
> +    fn new(dev: &'a device::Device<device::Bound>, mode: Mode) -> Result<Self> {
> +        if !mode.contains(ModeFlag::Acquire) {
> +            return Err(EINVAL);
> +        }
> +        // ModeFlag::Idle is internal so strip it of before passing further
> +        match Request::resume(dev, mode & !ModeFlag::Idle) {
> +            Ok(()) => {}
> +            // For async/nowait requests, `EINPROGRESS` means the resume is in
> +            // flight and the usage reference already keeps the device active.
> +            Err(e) if e == EINPROGRESS && mode.contains_any(ModeFlag::Async | ModeFlag::Nowait) => {
> +            }
> +            Err(e) => {
> +                Request::put_noidle(dev);
> +                return Err(e);
> +            }
> +        }
> +
> +        Ok(Self(Scope::<Awake> {
> +            dev,
> +            mode,
> +            _tag: PhantomData,
> +        }))
> +    }
> +
> +    fn release_inner(&self) -> Result {
> +        let scope_mode = self.0.mode & !ModeFlag::Idle;
> +        match self.0.mode {
> +            mode if mode.contains(ModeFlag::Idle) => Request::idle(self.0.dev, scope_mode),
> +            mode if mode.contains(ModeFlag::Auto) => {
> +                Request::mark_last_busy(self.0.dev);
> +                Request::suspend(self.0.dev, scope_mode)
> +            }
> +            _ => Request::suspend(self.0.dev, scope_mode),

In v2 you had Request::idle in the default arm. I didn't see a note
about this in the changelog. Was the change in behavior intentional?

> +impl<'a> RetainScope<'a> {
> +    fn new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
> +        Request::get_noresume(dev);
> +        Ok(Self(Scope::<Retain> {
> +            dev,
> +            mode: Mode(ModeFlag::Sync as u32),
> +            _tag: PhantomData,
> +        }))
> +    }
> +
> +    fn try_new(dev: &'a device::Device<device::Bound>) -> Result<Self> {
> +        Request::get_if_active(dev)?;
> +        Ok(Self(Scope::<Retain> {
> +            dev,
> +            mode: Mode(ModeFlag::Sync as u32),
> +            _tag: PhantomData,
> +        }))
> +    }
> +
> +    fn release_inner(&self) {
> +        Request::put_noidle(self.0.dev);

What's the reason for using put_noidle here? It doesn't queue
autosuspend, so wouldn't the try_hold_active pattern (i.e. grab if
active, do something, drop) leave the device active until something
else triggers a suspend?

> +/// SAFETY:
> +/// bindings::dev_pm_ops is #[repr(C)], implements Default
> +/// and the struct itself is all nullable function pointers.
> +/// There is no padding and all zero bit-pattern is valid
> +///
> +pub const PMOPS_NONE: bindings::dev_pm_ops =
> +    unsafe { core::mem::MaybeUninit::<bindings::dev_pm_ops>::zeroed().assume_init() };

The safety comment shouldn't be a doc comment.

> +/// Runtime PM context tied to a device.
> +pub struct PMContext<'a, D: driver::DriverLayout, T: PMOps<D>> {
> +    // Preferably, PMContext could be shared via borrowed reference over
> +    // a pm Registration's lifetime but that bares complications on its own
> +    // when the context needs to be shared across different Registration types.

Nit: bares -> bears. Also in the identical comment below.

> +impl<'a, D: driver::DriverLayout, T: PMOps<D>> PMContext<'a, D, T> {
> +    /// Driver-provided runtime PM operations.
> +    ///
> +    /// A driver implements this trait to handle runtime PM
> +    /// transitions for its device type.
> +    ///
> +    /// Each callback receives the device and the current payload.
> +    /// On success, it returns the payload to keep for the next
> +    /// transition. On failure, it returns the payload together
> +    /// with the error so the previous, or otherwise sane state
> +    /// can be preserved.
> +    pub const PM_OPS: bindings::dev_pm_ops = bindings::dev_pm_ops {
> +        runtime_resume: if T::HAS_RUNTIME_RESUME {
> +            Some(runtime_resume_callback::<D, T>)
> +        } else {
> +            None
> +        },
> +        runtime_suspend: if T::HAS_RUNTIME_SUSPEND {
> +            Some(runtime_suspend_callback::<D, T>)
> +        } else {
> +            None
> +        },
> +        ..PMOPS_NONE
> +    };
> +
> +    /// Enable runtime PM
> +    pub fn enable(&self, state: RuntimePMState) -> Result {
> +        if self.inner.enabled.cmpxchg(false, true, ordering::Full).is_err() {
> +            return Err(EBUSY);
> +        }
> +        Self::apply_config(self.inner.dev, &self.inner.configs);
> +        match state {
> +            RuntimePMState::RESUMED => Request::mark_active(self.inner.dev),
> +            RuntimePMState::SUSPENDED => Request::mark_suspended(self.inner.dev),
> +            _ => Err(EINVAL),
> +        }.inspect_err(|_| self.inner.enabled.store(false, ordering::Release))?;

This always applies the config even if state is invalid. Should we
validate the state before making changes?

> +    /// Runs a closure while holding an `AwakeScope`.
> +    pub fn with_get<R>(&self, profile: PMProfile, f: impl FnOnce() -> Result<R>) -> Result<R> {
> +        if profile.0.contains(ModeFlag::Async) {
> +            return Err(EINVAL);
> +        }
> +        let _scope = self.get(profile)?;
> +        f()
> +    }

Shouldn't this reject NoWait too to make sure the device will actually
be powered when the closure is executed?

Sami
