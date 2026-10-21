Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575498;
	b=bHPnWayEop4Yrh3p81zLDxUU9HK7vpvwCuuRjYmZcNegbhWT06pwMtEO6KXyKsETlGmy
	 b4xSowBlmTguF3X3B/don2X2ryWbg+qSCbVtSwmKJIX40/2OELWB2f92Aaaqoq5jBj4AN
	 SbFmzhxCRwTaS9lDP1EuqcMVmnDuIGnzSg+lqKEAfidHvBchy7XHlMS+89PSui9q9eKQG
	 MAyD5Q4twK+KWjaSuxgQDcdqLPWP+jCUhuus3I/Tx9hAyw5HZxf28FnzF6Jqi9ChDDrWr
	 Xo7k7kWYfmB8SKtunkD4fMj84CmnPkkt0fpkEef8XIGfHX2v8Nefo7jkBa0mLG+Tphw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=DMEarNjccdTmA6jkwGLogCoUkmgNrujCfqG0VHqUqZ0=;
	b=PRjsTefZrkS1TWrI/VkU1igAOQOs2WppfYEpo35SuFLzxHGCb5unZzw7V3WIgC9b5Zqk
	 I6XQVzYy8bVwdhH2F2UZpaO8pn1i+fRwkzXrxIqAH3XmydUFEchGSH/RRkhxIbfm9Yvnh
	 ZSuwAK+9f2YAbvUNi3FOhzPecCZf6prCQ0rQY8XeTzaiON9LYRxw4/lXD+OQTnDpaIcUD
	 k2gBXQL1YsW13du/QzLZtkuerO6QnUflH/tyqfvgaghjlxOSm5VsRhSbezdmijRisr4o/
	 GX2skQcSLlMGUE3iRgkGH3c0/piIKyItEhSoDKq6tJkVRCeqbzfZs5yn2fIgbKCa9IA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fsZgqehe;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7195D606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7195D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fsZgqehe
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49953abe51fso3971155e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792575496; x=1793180296; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DMEarNjccdTmA6jkwGLogCoUkmgNrujCfqG0VHqUqZ0=;
        b=fsZgqeheiv0RIdAR84vZtdUXPTLyDINb3a1D8w141uuL0dqh8VGYlH0FqG2+lQ2fHL
         t56sKssJcbTljcPyBpGjln760D1KYiq+ozTLJS3OZDSIxkvwsuLXyGmx/776ggtSa+r2
         eE+1UX0B3sZLRMbELxavrXhs9QTKoclD5xgORykE1uNoqj4gCwHol5dJE2Bm14lfmOE6
         442uChcvZY3RqdZ41GZcORbaliRWtnFDTXn6Pb0i1APjZkvAGpEJCp+f3P5Cr9dGEg1V
         E8ruupPSbmJn9qYc5RyB5Wlk1vn1JN7LWUz0ZhapMFmpu77UhmGtK60axuJEOqqx17Ye
         /oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575496; x=1793180296;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DMEarNjccdTmA6jkwGLogCoUkmgNrujCfqG0VHqUqZ0=;
        b=hOGNwkQEgBerU6fT2gNo5G4QvJgmgrK0dafDwex3EK88EIQimISOVpa5DJkLRm3BJg
         UlJSRAlm+bGIy7LybMxhb9p7nTAWkrv1+xVPhXkjUc4OgEuVsw5/KXbg9tV0KV2iX3ZO
         PbjAJRMNssR5H3Op0Zneconua7QRF29XUEvmrbvdEgtW+hd7bbly/YOzvmbNCi3lrtKb
         3VJppSSsF+mfgyQOwvEB5ZhbudKp7NuYdlXliz6AJ8mLwxPBcN4BMN3OWi4oIO/1NPoS
         YUJDILOEi+kTWFEG4+hv9elaFUYRCQ550yFSdwAIP1zn0v3KS9OEiITO0QnGRW6EtGUw
         /IXg==
X-Forwarded-Encrypted: i=1; AKwUvBx3HKuqUoBW6EXQ+Y0aQkQ+dsZuLhyl2iu5MEmp86OHMBOpH99wE9ElA+gsNNwzGGWWAJChVTd8jlM1IGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvF8l4KJ7D89y4xExk7VUIOF4/zTD7m/U2W3cSLJnhjXof9QrH
	0AC91FgxhOSkP+bL0SpjOwmxmnNZrtR4A2FwKi29voEVc2DE6+CBDJJaR8rLv74jdeezw6ZlaH7
	LjQdtv3kXqGEU7QFOUg==
X-Received: from wmix23-n2.prod.google.com ([2002:a05:600c:e557:20b0:4a1:f553:f96b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5391:b0:4a1:d537:1c8d with SMTP id 5b1f17b1804b1-4a1fdd23e21mr30007175e9.19.1792575495499;
 Wed, 21 Oct 2026 02:38:15 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:38:07 +0000
In-Reply-To: <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev> <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021093808.1128449-1-aliceryhl@google.com>
Subject: Re: [PATCH 2/2] drm/tyr: unplug the GPU when reset fails
From: Alice Ryhl <aliceryhl@google.com>
To: "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	dakr@kernel.org, daniel.almeida@collabora.com, airlied@gmail.com, 
	simona@ffwll.ch, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 01:50:08PM +0300, Onur =C3=96zkan wrote:
> @@ -56,7 +57,7 @@ pub(crate) struct TyrPlatformDriverData<'bound> {
>      // ensure the correct drop order.
>      #[pin]
>      _reset: reset::ResetHandle<'bound>,
> -    _reg: drm::Registration<'bound, TyrDrmDriver>,
> +    _reg: Arc<Revocable<drm::Registration<'bound, TyrDrmDriver>>>,
>      _device: ARef<TyrDrmDevice>,
>  }
> =20
> @@ -161,17 +162,18 @@ fn probe<'bound>(
>                      gpu_info,
>              });
> =20
> -            // SAFETY: `reg` is stored in the platform driver data and i=
s not leaked or
> -            // forgotten, so it is dropped before the `'bound` registrat=
ion data can become
> -            // invalid.
> +            // SAFETY: `reg` is wrapped in a `Revocable` owned by the pl=
atform driver
> +            // data and its reset handle. Neither is leaked or forgotten=
, so `reg` is
> +            // dropped before the `'bound` registration data can become =
invalid.
>              let reg =3D
>                  unsafe { drm::Registration::new_with_lt(pdev.as_ref(), u=
nreg_dev, reg_data, 0)? };
>              let device =3D reg.device().into();
> +            let reg =3D Arc::pin_init(Revocable::new(reg), GFP_KERNEL)?;

`drm::Registration::new` requires that the `Registration` is dropped
before `'bound` expires so that `drm_dev_unplug()` runs and
`TyrDrmRegistrationData<'bound>` is dropped while `'bound` is still
valid. Wrapping it in an `Arc` makes this invariant fragile: if any
`Arc` clone outlives `TyrPlatformDriverData` or is leaked,
`drm::Registration` will not be dropped on platform unbind and
`TyrDrmRegistrationData<'bound>` will outlive `'bound`.

With `pin-init`'s new safe self-referential struct support in `rust-next`
(see e.g. [1]), you can avoid both `Arc` and raw pointers altogether by
storing `_reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>`
directly as a `#[pin]` field of `TyrPlatformDriverData<'bound>` and
having `_reset` borrow it via field + existential lifetimes:

    #[pin_data]
    pub(crate) struct TyrPlatformDriverData<'bound> {
        #[pin]
        #[uses('_reg: invariant)]
        _reset: reset::ResetHandle<'_reg>,
        #[pin]
        _reg: Revocable<drm::Registration<'bound, TyrDrmDriver>>,
    }

and in `reset.rs`:

    #[pin_data]
    struct Controller<'ctrl>
    where
        exists<'bound>: 'ctrl,
    {
        pdev: &'ctrl platform::Device<Bound>,
        state: Atomic<ResetState>,
        hw: Arc<HwGate<'ctrl>>,
        #[uses('bound: invariant)]
        registration:
            Pin<&'ctrl Revocable<drm::Registration<'bound, TyrDrmDriver>>>,
    }

Then `probe()` simply initializes `_reg` first and passes `_reg` to
`ResetHandle::new(pdev, hw, _reg)?`, `reset_work()` calls
`self.with_registration(|reg| reg.revoke())`, and `#[pin_data]`
statically checks that `_reset` drops before `_reg`.

Also, as a heads-up for rebasing onto `drm-rust-next`:
`_device: ARef<TyrDrmDevice>` has been removed from
`TyrPlatformDriverData` (along with the empty `PinnedDrop` impl), and
`drm::Registration::new()` now returns `impl PinInit<Self, Error>`
directly without the `flags` argument, so `_reg` can be initialized in
place via `Revocable::new(unsafe { drm::Registration::new(...) })`.

[1] https://lore.kernel.org/r/20261019133647.1279779-1-gary@kernel.org

Alice
