Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2463D3CFD
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851634; cv=pass; b=KcvxTRJNyUtE7azEOqXSDa339sHQ0T/vrcqF9QqcqyrYwtTqHLdJpLgOTNnmz7FULQcDlPfg8SkX8wJXJTV4tu6gYlkZZkrJpg70FnJMU7DJ6bWnZo7AtSGliRKD1fJ46I+yHrh4HHdXeZM6s62g5CpKIMr6Bnt7X3J/XyHjxKQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851634; c=relaxed/simple;
	bh=Sk7RTOQcN4cidxedcRYIVkGub/oGpNeLEskr9NMZ1eA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPMLRhInMGdCq/S6W8WVySYvi8G6nsj81Nf5ykuSIbtXz8cjrbxL9/ztzU9t87PENYx+QzvO+kD/L3OqssraHTA5OeUpOjY5FXh+Ha1gJB2Q+dLdmN+sBUtGJDb9sEFVD+6NxRx8j9eDDvAYjQV2xKFnR5mWzuZADoQZhtTtZUc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SVLuSdq/; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SVLuSdq/"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e4e75342aso502422eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:47:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790851632; cv=none;
        d=google.com; s=arc-20260327;
        b=TtU0KOj6TqqWxV8CH4ZYvJWY5WiXDvMfEW7mzA2JKxJsp0kVy1Ql7RBCpo+v5C29Hc
         qtnnNKL8LlV83jEpI2KigiDIablFl901L5/sBcWZmCJXGylY9MTQ75D4Cud0U7XnxAoz
         Xcj2G/Nqgh6rwTN1vu7eiH2XEpTtPB8OkLgs0+Ia96i+2cjPTWjuK0DWoPh5HxhSD72a
         zsH9M6W0ZTU1XTtvIxY/YFijqvbOmZgPdqiXceTzQRnQqMxwAexO3iSE9AWQ6wS453/8
         8jucWraFVS/GIFJb2/MhnG2f/8nFfwtezYSq12TR9MWZqHt92huqCaJCnK7JWs6dgE8O
         /4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xZGQWu5F+L+LnhlrlKnJBt7Q9Qa/GJcvQeTn5kUBy+o=;
        fh=sv2dDzFGclqmMOJC7Z5/lfkD6S29rWoUznk+A7tbavI=;
        b=BfNuUny0N2pTrS+//dSIuNbc1SiWQazoeziczXvN/UpBUSwia+ovtiXjCAbKh0f20+
         8pmSGKxK8PaWV0MFIjZ2BnjnLxaBAQd28Nkuy0gN+xBMHxuwNc2KKq879qgroZPYMcc9
         PNU3q5d9g2gfiw7g0MElKtSLlxVERxl61ViqQmYwgPNj6lweJ23mPyXnLhtpVh//m87h
         pSzIRQ1OLm6eNJWo0yoy5GbMkGYS/3LXGxEvmxrKN2KCqoeIL1vifGBNkhTeKprx7EWZ
         fncDVDdnfjPW5xuBy1FRBIPAbD5Dv2OVVBxBQ2d7ugaFY2zYPwldpt/rAymiF5jymBea
         hJCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790851632; x=1791456432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZGQWu5F+L+LnhlrlKnJBt7Q9Qa/GJcvQeTn5kUBy+o=;
        b=SVLuSdq/5miDqsF3OehTAiZGkWSLw1jUF43HwR6I34Lu9xE1axu6bwF9gwcJNTA5kF
         U8vPKBE1vUqFRqsFA7AE+q1OMVuz02OkhFEFW5+uHjRa4ok/8IohGfkZfLXNBqhQlxh+
         3TZnW+atvLc7QhFxOLfUzwM/dAeAyXSLnLn0eabti8ybR2VijI9vivWhlSGusAQe4RI8
         Ak9CLyn6BjL7OOer0dA4AJepj8TIJ205/WBR6upqEiX4LzP0QiGiPrbn9fK06Luua7BH
         uHvzvoDfbEXHs2glbii7vHe7tSKb+hHy9LdvyUdBEcnYecBbZ2gk1gXQcfXpRgYt3sKe
         bk6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851632; x=1791456432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZGQWu5F+L+LnhlrlKnJBt7Q9Qa/GJcvQeTn5kUBy+o=;
        b=KpYOxWDtnu3t7lMxhiBUtA5Sd2YTWhPZvl3HW1k8QWgOWNteTGHvYjmkKydr4Vg4TA
         cMk5UVKKo4zm9zsXb7X0GdN9FFqWjOnkRgojRVucXs4gRlsLV2bJaJSUtPgpnVtCHmSM
         z5UilLFIV37Bp6PwE0NGjdlfqVSPRnO+5bY20sCK3CQZ6OqJz9VoGtXjzncMwu7ckQEm
         AlAh1lELlWMPAOslWjtm2WwCwCXHo4o6VREK/4r0h9wzVzMR5y9P272xWzHUg8w3LVwi
         0RCtQ24/8LansWJxJjgC77Rrtm702X57Mufp+RdDbVFNXMsDyTEfKbH3SeD4Oa7rGW6Q
         MMaQ==
X-Forwarded-Encrypted: i=1; AKwUvBxdxYMKf3F8BvOJlShCj7lXYhPCLlrtRiH+hfNqCeI8lEuqKZTkjObScIbrnHfh2a2s0tjg3TF61u20sNw=@vger.kernel.org
X-Gm-Message-State: AFuF++mjXEd+X6CcvYx0K32GBz4jop/eiEAr6KwO99y48Eoq7HhbALoL
	ivvSpoUBNwp+S/tLJlcg/6hBFFePV/8zAuPsw2XYwaOAH2oZAHHSZXmw0ESU+SfEy1ogt4M8nvv
	JbeP01yocMvJG5t4swrlENmbPs6Ca9A8=
X-Gm-Gg: AYBFou28XbpfJtjJgMIMmF8O82SkORlhE8dUW8/8n8YfIg7uvgTZiIu+P7Du5lZbNdv
	ONWeGL34c4/1SfgCg/AcUG48FSf33AjOg/Qo6adUMP/XzZeVZYiwEXCYF70sJ+Dz8i0nuKUs9KH
	mOa1e4z4f32/DaDWBwcWp5+JfG9EklPX5hY4dI5839ZpvNxi7epTnJGlK3kDBF8DWEhOJvx5fiw
	VjA0dKFqeVvO/yGu07XxG3NEfzeSj2TJZNen7ayqn0XD0EcmsNRbY2/AcDbc8lwlPGQKIiCu7G/
	yke9cOjy3KSJd6m4Ynhz/osmCBYt5gqKWvdLRNBaD+5dwrQVoCc9lKPGX5A2WEMT/6P3sUFEm/Q
	9d2D1e3gakR1dYsife0q6gaXKxSzAR1zKYtr0uWfS4Mmu5/r8EWpCIoXePAjB/BJ3X+ii/MFjpx
	19Os+aaFRQpjOiOVFXjqO4Yb7Ud9CGVWi/B6wACoeGJxGoj4rNXXlEqZwSKAa/mQ==
X-Received: by 2002:a05:693c:8085:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34cf1818b1fmr7262875eec.1.1790851632033; Thu, 01 Oct 2026
 03:47:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001042942.109012-1-chenhan0017.work@gmail.com>
In-Reply-To: <20261001042942.109012-1-chenhan0017.work@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Oct 2026 12:46:59 +0200
X-Gm-Features: AclHuK-fHM8iJEVkEzuvz_ovqF_dLYt_Qxw_QJ6A0Z4myKEgiMjsoUcH2rpEiKc
Message-ID: <CANiq72kjGWVk_9hR-gn4vJT-pgBsGWEvThMd9dF6-+GfBZseOA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: time: make Delta division and remainder fail consistently
To: chenhan <chenhan0017.work@gmail.com>
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org, boqun@kernel.org, 
	fujita.tomonori@gmail.com, frederic@kernel.org, lyude@redhat.com, 
	tglx@kernel.org, anna-maria@linutronix.de, jstultz@google.com, 
	sboyd@kernel.org, ojeda@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, tomo@flapping.org, 
	georgeandrout13@gmail.com, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 6:29=E2=80=AFAM chenhan <chenhan0017.work@gmail.com>=
 wrote:
>
> commit. Correct the rem_nanos() parameter name to divisor as well.

This seems like it should be a first patch.

> Link: https://github.com/Rust-for-Linux/linux/issues/1254#issuecomment-58=
69573842
> Link: https://github.com/Rust-for-Linux/linux/issues/1254#issuecomment-58=
69925737

The discussion is small enough, so I am not sure why we need the two
Link:s. They can be useful if you want to reference something in
particular, using e.g. the square brackets notation [1] to point to
them.

> On the MIN / -1 safety question: div_s64_rem() computes a quotient even
> though the caller discards it. V1 already checked this input before the C
> call; v2 keeps the guard and makes the representable-quotient condition
> explicit in the SAFETY comment.

Yes, that is fine -- what I meant is that even if we had the check,
the `// SAFETY` comment should still justify why it is not UB (please
see below).

> -            // SAFETY: This function is always safe to call regardless o=
f the input values
> +            // SAFETY: The divisor is non-zero and the quotient is repre=
sentable.

"representable" is a fine way to succinctly put it, but I wonder if it
would be better to just spell the condition.

In any case, safety comment need to explain *why* those conditions are
true, not just re-state them (otherwise, safety comments would be a
repetition of the `# Safety` documentation of the function called, and
thus not useful). In other words, the point is that they explain why
something is supposed to hold.

> -    /// Return `self % dividend` where `dividend` is in nanoseconds.
> +    /// Return `self % divisor`, where `divisor` is a number of nanoseco=
nds.

"a number of" seems to be added spuriously -- please try not to do
unrelated changes, or you do them, please add as new commits (e.g.
this one wouldn't be a fix to backport).

> +    /// The divisor is an [`i32`] because `div_s64_rem()`, used on 32-bi=
t
> +    /// platforms, takes a signed 32-bit divisor. The dividend remains a=
n [`i64`].

Do we need this in the public documentation?

> +    /// Panics if `divisor` is zero, or if `self` represents [`i64::MIN`=
]
> +    /// nanoseconds and `divisor` is `-1`, matching Rust's signed remain=
der
> +    /// operator even though the remainder would be zero.

Not sure if we need the "even though ..." bit.

Thanks!

Cheers,
Miguel
