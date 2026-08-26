Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756E834041B
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 20:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787776162; cv=none; b=r0WozhszXi9PKS78wQd4yo4rwlPRnoDvPinAMK7TZpoRp5EEWB8WlqqJ5f/sl2eNXvC1gqA8kM4VQSxTA0Q8x6expr+yXyEqDHSIF2KvNJfHa9wttmAoOGhl0PKNFj9jOovv++nFOnW7ExtQ1qJVGwoSQt/vAZN72Dyj+c2pg9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787776162; c=relaxed/simple;
	bh=KNNL043sFJIhJVevrl/1cPd/oSJb3CTthjzkxiuE9uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIvWbxaxmh7o6jtkrdI3PBYD2D0FSB6AZC/yc6xMeDUHYwDsrNCPVWHSI/DUhJIgdMzTCuYJE3QnmRCBwAqO2+DiBahYX0FSIaaxDvYxq3wYSigwrywP5/lQf3bSZjcw6EL+N7ygO7OzjFyaMKraZDuk7sOMmF/R3k6wi9DFNNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J7/UB70K; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J7/UB70K"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2032985a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787776158; x=1788380958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8BDYxr7MU+K6rWH04B/BEOyLEHvu1ocR7jiCJ0maho=;
        b=J7/UB70KHMkUyhlOfr6J8ZCP575nL4QoDIjOVNmdoZCovzZt9TiKcGCaJgvYTxK24f
         UIZcCXponIojywlTI9E41Q9zVra5uhkwwUejHy+z+kuxs0Qz8Y/0iNcwEZfXfvm24MPU
         yjhEfDwvNW7iu0THX8j4UsFnAsspqfwVsCawI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787776158; x=1788380958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=o8BDYxr7MU+K6rWH04B/BEOyLEHvu1ocR7jiCJ0maho=;
        b=Ax79Yo33sK2r4cp/TjC+Didvz+gvY4CS0v/f2Z6sl2qRsOfUvuo9YaWOsC95V2ajjK
         dVeP4a8ceinVGbfE5E+mldgKIHl0draPBERcugUraZQAKuWqQeH6o5vWVj1iiZL+SKAx
         HS+T/70aNsolvgPV7qSzFQ3nvp1hgAybR/LfmWA2PEfTnt6D63/QWOQZxxHTy5AG2jIG
         lZ3k7fM6LIoASXJrx4ebm9dawDv3jo9VhMMQ+2Bo2sxc4DxhOWveVCfwBWhfj3SwRAje
         DLT7axAhbvhCnc0GB0r+ERFNRWt5k/9Au+Xn7odFZHBSJHW+D0XxUOFLJ9h3PC4iO3gq
         7Ubw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0L0j6miwVFOEsoQTtyWKl+dzLlq3eZqKPwXzrYlQDr20IfTIK/5Aqm6JzEvO5QVQlcLu4WJQRcQx0yuA=@vger.kernel.org
X-Gm-Message-State: AFuF++lwHOMfWRgijA62ARKnDuK4PYnB9e41olAyfjV1+NamcDvUg3hF
	LbWEtYM6HuZbvB122JgP/ZgB9Xg7SPk4vwJVF6Ls2i4wK905nx965igZzLdDp4rhe8k8QMz/YWQ
	0oAwMFmM=
X-Gm-Gg: AR+sD11wuJpvbLNHCJ855XqDTBal4nT1KtrL3I8PxdcioI6aYqLYZrywd9gX3o7B7fR
	DP4hDnECuMUh5A72h7SZNqbHmUGn6XEGOY3RPO47Uv6Cigq4bAhGKVawx1+pHEEWK7GxMEwgPvp
	ejoc3yGOQ5qpt+Nbu93ipfGK9thqxCDIKQbPh+eILpW218iB7F8ZqZ+VRySNiXN0LuSWb6GXpwD
	80WbcytNM0XMm//E2JdZls2TFXyZRMM1bnp02oNoN85fw/+Ksj/UZoendlIh3ApkK/4oNA7mE+Z
	LafM+LHFSPMpbBUK7dgpNUZpJ3aO1lj44/lCd5vFeSGi1JR5CBNDab2Z7df3GItshqnaMEAeHJZ
	C3mIrp4keBgZoQUP6jnq29BtzW0trV+8/g/dYG69KRWh8X/95blm3LbD/b3BVz7s6nLTWyOetOr
	8Wkbrv3AK82rgvXx8pKLKIjlwoAgjfDlS2h1VUG5NFUQ4K2Ck1Kvc0t80TWOsUmIsFYw3Z6RecR
	oTjWmLoiDTHYpTXCG3qut46Rvat9RXV1Y494w==
X-Received: by 2002:a05:6402:1f0d:b0:6a1:23f3:26b7 with SMTP id 4fb4d7f45d1cf-6a5df67453fmr13320739a12.14.1787776158555;
        Wed, 26 Aug 2026 13:29:18 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5de8ea6d0sm6569503a12.13.2026.08.26.13.29.17
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 13:29:17 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so2032943a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrBNXVMyK1NKStC0U46uQ8Z3DXICf/ZQsQGVXtP9q6WF/RoZiLxCMGMgtcOo/baR9kT4l360oNpQBULXZw=@vger.kernel.org
X-Received: by 2002:a05:6402:1f0d:b0:6a1:23f3:26b7 with SMTP id
 4fb4d7f45d1cf-6a5df67453fmr13320660a12.14.1787776157462; Wed, 26 Aug 2026
 13:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1787771905.git.legion@kernel.org> <2391afcdd59dc43e287c3992a54541a23a35c1c0.1787771905.git.legion@kernel.org>
In-Reply-To: <2391afcdd59dc43e287c3992a54541a23a35c1c0.1787771905.git.legion@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Aug 2026 13:29:00 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjUmLrJd4KM4xvJHUN4P0r8oSu5LyvG4JipnhxizBrE9Q@mail.gmail.com>
X-Gm-Features: AcwNN1XvhSctqXF2bRaymY6qFwfBHebjYnLpgQy7KbTN3LhMyoxevh72gjlYPMg
Message-ID: <CAHk-=wjUmLrJd4KM4xvJHUN4P0r8oSu5LyvG4JipnhxizBrE9Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 17/30] sysctl: net: use sysctl_field in SCTP sysctls
To: Alexey Gladkov <legion@kernel.org>
Cc: "Eric W . Biederman" <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
	Joel Granados <joel.granados@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I detest this series.

Maybe it makes technical sense, but as long as it makes no human
visual sense, I'm NAK'ing it as being garbage.

On Wed, 26 Aug 2026 at 12:43, Alexey Gladkov <legion@kernel.org> wrote:
>
 [..]

The whole series is full of complete illegible noise like this:

> +static const struct sysctl_field sctp_net_table[] = {
> +       SYSCTL_FIELD_CUSTOM("rto_min", 0644, sizeof(unsigned int),
> +                        sctp_rto_min_data, proc_sctp_do_rto_min),
> +       SYSCTL_FIELD_CUSTOM("rto_max", 0644, sizeof(unsigned int),
> +                        sctp_rto_max_data, proc_sctp_do_rto_max),
> +       SYSCTL_FIELD_INT_MINMAX("pf_retrans", 0644, sctp_pf_retrans_data,
> +                            SYSCTL_ZERO, sctp_ps_retrans_data),
> +       SYSCTL_FIELD_INT_MINMAX("ps_retrans", 0644, sctp_ps_retrans_data,
> +                            sctp_pf_retrans_data, sctp_ps_retrans_max_data),
> +       SYSCTL_FIELD_STATIC_UINT_MINMAX("rto_initial", 0644,
> +                                    sctp_rto_initial_data,
> +                                    SYSCTL_UINT_ONE, &timer_max),
[...]

where apparently the indentation has been decided by a rodent on crack
who was given an Ouija board and instructed to ask his dead ancestors
what indentation to use.

So no.

That kind of complete random code is simply not acceptable.

I don't know what the correct answer is, but it is *not* this series.
It needs to be consistent and visually parseable by humans *without*
asking your dead ancestors for help.

And it's not just the indentation. That SYSCTL_FIELD_CUSTOM() thing
needs to be usable and able to do some minimal type checking - not
just passed a random sizeof() in a random argumentt. I'd suggest
passing the actual type, and then checking that the type *matches* the
data pointer it is passed too.

The old code may be ugly too, and have various other warts, but at
least it had somewhat legible and understandable initializers:

        {
                .procname       = "prsctp_enable",
                .data           = &init_net.sctp.prsctp_enable,
                .maxlen         = sizeof(int),
                .mode           = 0644,
                .proc_handler   = proc_dointvec,
        },

is at least something that can be read by a human and those things had
consistent whitespace rather than some quantum randomness.

And this is also just complete line noise that only makes the code worse:

    +#define SCTP_DATA(type, field)                                         \
    +static type *sctp_ ## field ## _data(const struct sysctl_context *ctx) \
    +{                                                                      \
    +       return &ctx->ns.net_ns->sctp.field;                             \
    +}
    +
    +#define SCTP_CUSTOM_DATA(field)
             \
    +static void *sctp_ ## field ## _data(const struct sysctl_context *ctx) \
    +{                                                                      \
    +       return &ctx->ns.net_ns->sctp.field;                             \
    +}
    +
    +SCTP_CUSTOM_DATA(rto_min)
    +SCTP_CUSTOM_DATA(rto_max)
    +SCTP_DATA(int, pf_retrans)
    +SCTP_DATA(int, ps_retrans)
    +SCTP_DATA(unsigned int, rto_initial)
    [...]

If we're doing these kinds of changes, the end result has to look
*BETTER* than the thing it replaces, not worse.

Yes, a few of the patches did look better. But the majority of them
only looked worse. Some of it should be easy to fix: use consistent
whitespace, and use sane argument ordering.

But honestly, the old setup didn't *rely* on argument ordering, and
used named initializers to make things more legible and robust.

So I suspect that should be what you should aim for in the new setup
too, and that probably means "completely different approach".

               Linus
