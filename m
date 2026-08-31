Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA6B463B7D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195861; cv=pass; b=omBcpZNmYAfUaO1Ros8kAsqE32b/sI1B91sslrKnVcectdhMmA+Oe2bSl7XSD1n7kLTZonbLYHCrXqiV8HzznILdgqrk0nPZl5yjWXnzQ+qEMBiBLFMOdQ/Mt+7A1FDEHqYS4g+pHPpupixB6iPpcGQ7g7R1rHCxN0uY6KsMRvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195861; c=relaxed/simple;
	bh=VeIm/m6wK3h90PKRx14hlNC6hcs5cXsaRzlxDGhe2Xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IByzLlu6N285wmIM0LAobpaE7lhqMK06OCVv9qV6h77jXg42Ya5D7FrN61JuMxjl1ryMAteSoZYVatzbn4LOJbqMM0o2gFWTJ+juR9rLFix2WDjP3q/dvlhR8wmVLtzcVtHoZlh7iKLpBLPRqOckexAURoAIRjFQg8IVbDiWTR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk; spf=none smtp.mailfrom=fireburn.co.uk; dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b=I1YP6xV4; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fireburn.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fireburn-co-uk.20251104.gappssmtp.com header.i=@fireburn-co-uk.20251104.gappssmtp.com header.b="I1YP6xV4"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-66ce4a63e17so2823336d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:04:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195859; cv=none;
        d=google.com; s=arc-20260327;
        b=X4xyybjK1371f84Md73hVMpGjEnU+P2mhXIBlZYCQUPkztzck9/PTUhJmEvklvyE9e
         lfhsmQftQybSQY0SfkVlOpVhK5LX//fOHE56vh6Jx2kRovufBMzOaDHre8XAslb6YIZT
         pR8LxYnb7Yed8RppCE0+yOtDyyem0nV0fc+J/uLJ2gaXrIEbvQxM3rrgy+jZk2siFPKd
         kMtq4Db+3kBc2hJybzwXi+dwjLwhlFJxc1uZT2VC5oiDYjPM2jAIN42DG9akwLQ0B4vy
         OxAHmgCvVKLhpIuzCwalzXDok/r66auoDGRlaM9RKLef+rZqypTeRBq0n6VazI6vzAMm
         z/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        fh=82X5KrHs+QofI1So/vp+eJClOQSW6+0K1X/2mjrTB7I=;
        b=VgKF2dGCvSn6QHsww/1oj8YOnMGaWxCKwvJchAMWYUk17oHGwaXqcLGoaTTL6if+z/
         kjgmUZwVBLWXKpc6uc0EAwjlAnRVfH5AVd8UaLgPZF2cjUdxjVKv33hhOhCkuUB5HEsY
         uz5vZyvn3Xz+gNYLcQ2q1wPjibDWvGBYgiIbCfgph7Fzih3iVrrQdW4txQ179psoqM8+
         vlEo1LKM3NZqEJUVaxsMvUCPz/7LOk02cB1yD+CWxdKdoMCYDelwPzo9Up5gpXM+iZ4r
         BklBRnzPVT6Q+lIiq272tDftrLIET+1VLtucTqaeMzLzKwo8l/qe4MyG3nii9qNjyz4I
         d4sg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fireburn-co-uk.20251104.gappssmtp.com; s=20251104; t=1788195859; x=1788800659; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        b=I1YP6xV4U6qxteWKhCgose8iubH3bAkKbX7/2mdpGfnvHzQDC93razNAa4ebhg6v61
         lzVNdecNXCF9KA433PueNN3TNZUiFmHC7puJP6lhnm7ebL7zrN2BuSbkiopLp1CL0YrD
         bf9tTDVCB/9tlRcACqGobBlVSnQDe+w2F9fG3Xi21KyV0Xa1JvbAhXlVVHr+MhJdAtZp
         ZkqVwbWcpYP0N/uV3n2vNwNWqrbhebuZ1PmhTl9Hyx8IEfKgAwS8S/cdXO96qjQT/32x
         suSOhkVCCNg6uJdZ9B2zEivluzxWUbOX66Pe69FHGa+Bq8EV/gsM0nVUW0ihziFPcwGX
         Fp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195859; x=1788800659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0pq4dDUvzt7RMgM0rpITo2CMpdbS4bwmTMx9QwHO8es=;
        b=XIDk75b2CFjVBtVa9TGKAKzrFAN93YPGHV1vvPuT+PfHYdd9Lek/1KRMvRVQcdmVWy
         QLAUmjNy5pM3j8d3zyOhNKdUkU9h1qvzM0P2P4wJRe7lYwCq4IrBJA2esxDpmSbd1eBb
         7ZekMdNaTaI2fvIeBaJIFmNmlZZFgP6rTQ9pR5izccjGmxapFpg0qxNn7+nSGJLD0WBQ
         YmuOqNOyOA85zjDx5PjE1PsWPRQWHGNuiYxFg8+Z4qjoL6y1rSbk1ET9jvVtmJ9/tssd
         UVAiMeC41JO994YfDQvgX6ZB0USJd84DeSmKpR7SWwNT+TxAicgiHvTaG9iBUuTKGkBC
         8CYg==
X-Forwarded-Encrypted: i=1; AKwUvBxYWPG6F1d6yTmTzHzVQTy6CfDo3h5TtELsigodI+wHw+FqXfhRPyarHbYVys00tvlhRWfqGYC92sdTG+g=@vger.kernel.org
X-Gm-Message-State: AFuF++mIpahRBkOFlxWTkpI6WZl+WVheEKMh0VKRmTUjjHbPpWKF0jr2
	qwF0aRQAE0CHEJpuAYqddmOeBoaQWIK58ZdtwLLtnkYTSy//S0MhZITSdhcGQ55ccaf9p0veaOk
	KqbMHHaejfFdbyvLe6tMY7T2p9rovEzT9DJPMJ0aX
X-Gm-Gg: AYBFou3WWEymFsBFBm9/YmcJWeLaZS1oZnatFCGenJ0VO77mxl2F+kEQLTPlmI1F2dt
	kjQu/teISukseFrPriYSfnJikDI2G7kAcZVP/PVsn/XDckEtaYiziST/mkQqyTDG5d5AgZvjFBB
	0BD7A9jqHwBamzFWvBSWG0ohqzqVbA0tUR5Gyf3LPmWU/cFWrCar1Fxf4cIxYfKaCxeUEYpYQjC
	q7o8MFE70btjtzNKLxzV5o0LCxKcjZGSbLXq2SXS5QQ/6m5WzmQydN88eKSkM6izcfJXHmK+BCS
	e5HtkKhk/eTmP3S8bcUmcXgX/8ZyEhyEFh467mYOBTfe+mQ1uSZ8sVjoFPl5cRy/chIU5UB7+m2
	xI+oZqCeAd0f9e9sl8O+3D5Tbpw3suPbMNnM=
X-Received: by 2002:a05:690e:118b:b0:66f:8797:4049 with SMTP id
 956f58d0204a3-66f8797417dmr773051d50.17.1788195857652; Mon, 31 Aug 2026
 10:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826163101.4168-1-mike@fireburn.co.uk> <20260826163101.4168-2-mike@fireburn.co.uk>
 <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
In-Reply-To: <DKZ3UPVXL5C5.37DDI6DQKS3MS@kernel.org>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Mon, 31 Aug 2026 18:04:05 +0100
X-Gm-Features: AcwNN1XxcyYJm1eBwRWa78c6Pv6t6O5HEJXmbaliVctDsN19FsugaMX_VtVZTog
Message-ID: <CAHbf0-EzHGuQ720V1g84U8Ys8HS+Lpdfdu22zZmB42G8yU=dqQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] rust: usb: add revocable typed interface I/O
To: dakr@kernel.org, linux-usb@vger.kernel.org
Cc: ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	gregkh@linuxfoundation.org, colinbrauncl@gmail.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Aug 2026, Danilo Krummrich wrote:
> > + /// Asks the driver core to unbind whatever driver is currently bound to this interface.
>
> What is this needed for? Where do you use it?

Nothing in this posting uses it. It's a leftover from something I
removed, and I'm not sure it should have stayed removed.

It backed a write-only sysfs file, /sys/devices/vino/remove_all, which
walked the driver's list of held interfaces and called
device_release_driver() on each. evdi has had the same file since 2015
as /sys/devices/evdi/remove_all, so it's a name people with DisplayLink
hardware already know.

I added it because unloading the module used to be unsafe. disconnect()
could deadlock against usb_hub_wq, DRM references were held past unbind
so every replug leaked a card minor, and one unload took the machine
down. Having one write that unbound everything from process context,
with each disconnect running somewhere I could watch it, made those a
lot easier to find.

They're all fixed now, modprobe -r is reliable, and the sysfs file got
cut from the series along with the rest of the development scaffolding.
The binding method survived the cut without its caller.

I'll drop it for v4 either way. The bit I'd like your opinion on is
whether it should come back later with the user attached. Against:
/sys/bus/usb/drivers/vino/unbind already does this, and all remove_all
saves you is knowing which interfaces the driver kept. For: a dock is
the kind of device where someone wants to hand the hardware back without
knowing that, and evdi has shipped the file for ten years.

> > +/// A revocable window during which USB I/O is permitted on an interface.
>
> How is this different or narrower than the device's Bound type state
> represents?

There's one way it's narrower, and that's why I wrote it. The USB core
forbids I/O between suspend() and resume(), and between pre_reset()
and post_reset(), and the interface stays bound across all four. So a
driver holding proof of Bound can be holding it when a transfer isn't
legal. Bound means the driver owns the interface; the window means the
core will currently carry a transfer.

> Also, this seems to reinvent Devres, which we superseded with Rust
> native lifetimes and higher-ranked types. Please use that instead.

The open/closed flag and the wait-for-quiescence are hand-rolled, and
they shouldn't be.

What I don't know is whether the lifetime and higher-ranked machinery
can express a window that closes and then reopens, several times, within
one bind. That's what suspend/resume and pre_reset/post_reset need, and
revocation as I understand it is one-way.

If it can, I'll respin on top of it. If it can't, then I think this
guarantee is USB-specific and belongs behind a USB type rather than a
general one. I'd rather know which before I rewrite it.

Thanks,
Mike


On Wed, 26 Aug 2026 at 19:59, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Wed Aug 26, 2026 at 6:30 PM CEST, Mike Lothian wrote:
> > +    /// Asks the driver core to unbind whatever driver is currently bound to this interface.
>
> What is this needed for? Where do you use it?
>
> > +    /// This is the narrow, reviewed replacement for handing out a raw `struct device` pointer: it
> > +    /// performs exactly one operation (`device_release_driver()`) on this interface's own device,
> > +    /// and cannot be used to reach the device-wide state of a composite peer.
> > +    ///
> > +    /// It is intended for a driver-provided "release my devices" control (e.g. a sysfs attribute),
> > +    /// and must not be called from the driver's own `probe()` or `disconnect()` callback: the
> > +    /// driver core already holds the device lock across those.
>
> IOW, it must not be available for Interface<Core>, which due to the deref chain
> is not that trivial to model. So, if this is really needed I think this needs a
> an abstraction where you get a different device newtype from the scope where
> this *should* be called from that allows you to do this and can never leave the
> scope.
>
> > +    pub fn release_driver(&self) {
> > +        // SAFETY: `self.as_raw()` is a valid `struct usb_interface` by the type invariant, so the
> > +        // address of its embedded `dev` is a valid `struct device`. `device_release_driver()`
> > +        // takes the device lock itself and tolerates a device with no driver bound.
> > +        unsafe { bindings::device_release_driver(&raw mut (*self.as_raw()).dev) };
> > +    }
>
> [...]
>
> > +/// A revocable window during which USB I/O is permitted on an interface.
> > +///
> > +/// A driver-`Bound` interface is *not* on its own proof that a transfer may be issued: the USB
> > +/// core forbids I/O outside the window that opens after a successful `probe()`/resume/reset-resume
> > +/// and must be closed again before `disconnect()`, `suspend()` or `pre_reset()` returns. This type
> > +/// represents exactly that narrower state.
>
> How is this different or narrower than the device's Bound type state represents?
> Also, this seems to reinvent Devres, which we superseded with Rust native
> lifetimes and higher-ranked types. Please use that instead.
