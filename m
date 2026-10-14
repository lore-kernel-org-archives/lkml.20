Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA1368D5E
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 03:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791948531; cv=pass; b=J1u5Vv2pB3IjVLifk4pnsNnrTiiZg5lvaE7VHfcfUHp03pvsohjeeLh1kLHY1AOW6RJlEnySQhaRTI2/4IbO2sRK0jnuIhvF8kTrAbZLRef+VuDiZ9Wxnu2jGk648ruW+mkbWp1pXqLnJrUjEoINfD+37h1z3FHR3dXuJnhmQfg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791948531; c=relaxed/simple;
	bh=uu2BgegW6iIK5zC2oRBUHQ5g8vV1itfviPQErYL/pDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kr1etXVohvdtkm+6Cm+PI8O9X5qXOIdE1tQSBDKCTjdVFJvAV9mj1SfltxBaD/7B2agE/WiUU5IuK/lmpvxo1CnqTVWfqAEPYWEJ4pRjxjaJtbg8F0if6Gsh1SH70F7eQrfh9yyj56aYa8wzgxph+JI8VIp5Q6AMkPlaN1oxt2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdHUzIEu; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdHUzIEu"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b1ab2ad719so4380332a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 20:28:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791948528; cv=none;
        d=google.com; s=arc-20260327;
        b=kMJZuHk7JDsWJwh5UVUZQvCYFSQMWRvUBJjVBbM0sP8Ybo97g5p7dmG0LKjk4ovdEz
         p95f7N8pFAZbe3a4g7tvPiQcZZlyZcJDmvqv38j3hbppqFV6jYsFb1N8IxcbkOfao5WQ
         CPfJ/xDtzj6P2eNj4QQ4iMbeou8CwJJBR5kIqRZ+4YfxwxaobA39a9ZqjzNXJ2xEaQp6
         dKDf5BDfjygFMao00qhrnODDIHRr3aJCnvx6bgOlP5Ne1+iBRtyfsxnuQCn+LyPU2gmi
         F6X68NnemolzVb/MXeEF/LP2zb8jG10qwQGNjqPm6Lk+hrjHc06RZmiTZ8TgI4DcU3L5
         35fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HnAtWY3LwsXAyH/LIq5+W3HHx9lo3GsZAUzviRy9PaI=;
        fh=JyWjDmNg2jKwNIEYxN3S+SbC+8hJwDX2vD8BjmO0940=;
        b=OtslcfcAUJQsiB2XZpfcl+Ii8xjNv8okhmTqqVkLJ10jPMSMvzgzIk/0YdlHRauFQc
         LnxbmNqRjY8O1D8y7I75DeqAGGQoYa32PWOx+Gvqn1SkwR/KRjy/7/AbTV5cozbaVWoA
         XQ4SbWBx3bNiODQTYFi8fThKtX0cc2mQyCamUkAOxMsKEeHULKxswyfTIDauq1Q32LUk
         1q8Mm+5nLrY6sBzyrGUAeWHUf/8HGL/DRJQnFkgHGLfzLbO2oLY1IqnePTM5DlA+h9OQ
         BYFakl+MY/lu8ImU/wS/UVy1ehe+djI/3Wob07M6Gmj36hkgwbdooV2Es8l07ZukkhSd
         qb9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791948528; x=1792553328; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HnAtWY3LwsXAyH/LIq5+W3HHx9lo3GsZAUzviRy9PaI=;
        b=gdHUzIEuyXyBaXFjVe17M4i4Iydm5v+SsGEl/RloS23Zjf/WIaNMyo0ATOXbKHa7sS
         OyZL/iTw6og+Yu+v839i0c9Al6uBoIB1LiX9sNEB+0Bb1O0NsYMul64UB49E9DG8UA6l
         cdtTmIaVRNHrdhwZ5UV4Q4cwR2yXbbWPK9BOdCH78OzUd1CEOS1OVqiZgWasRxnbdfyf
         rUFam7uNhE3V0/HXdsBHDX6FQBWHr3KnlspQO1JrCoM4Lr1ZM2dsQodPLmjPqyFFnPh+
         GzDyz+Z0lKEO1TQ2wN4geg/3ySMSuJoVC9O7b0oHvCoGwBfKcbx+7jEgN550I2MhYgZe
         QaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791948528; x=1792553328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HnAtWY3LwsXAyH/LIq5+W3HHx9lo3GsZAUzviRy9PaI=;
        b=inUlzW7uNMnE3egbor7sH/Tt7pn5S6eBb6PL3MRkF0pcC03Mphj2Cn8MPok1sucqWT
         8WTLYm+5YaVVi7h4ZgFuqsbJq64bUG/U9mufdZMK6OEzyAIBObtJ4kQlxMuFrt0X8zym
         w3kBKJSFaL4V0Nm3IsqAcxJtd8skzLLcN4XI3PKycFReBOwoD8FSwSkOWTwuW+3rkcZx
         0PZjq1SoGgTBawmj/dP11ecH9WG3kJFZFqx/QqIsZdb9BFG4h5u7nbUFg2LrTbI1EMyx
         3INJaQwIBLsH+ZqVdxnqnSQgjM8wmNJcqnSyJuJkrKP5UzcvDXYhumcqVHCjj4JhShsI
         Va7g==
X-Forwarded-Encrypted: i=1; AKwUvBzDSkXX6vfbte/Ndb86nlgdiuvHupjLYif5dYI+m6BF765HXddTaSqN8kDyXY2MLHD4e/WVND0L49f+AcI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIsh3eD6rYzL0eZU7LlU+WfDvBBDFf6lSGtPS3VV6vypkM7jvfX
	yZGKTTp+3kO70HMNIALVOiZdEnKBEBPfQ3jA8lO+XqmwUaXNS7a4iPFgO1Na4E/AvdBDD2tzFA9
	iP37hRVTRCDkIvayIdG26IlXc5bePt3YfRPz/LA0=
X-Gm-Gg: AYBFou3r9jIGlzAVayOzW5mw2Olh92TMSiYlAjXX7cN1Op4xqXzCwgve4dgE5Mq218w
	pyAf6jXECuXCShp8VliDKiG9AW5aaEkW6if8I2IF4rC9m07hOnTrlqMDaPppqikqouPhDE0EPaG
	aXBhRFi7ymQctzzxpYKv3vxIka6Dp6uHGXViwIhRkJ2c3enLovUPF3D1gJUEAsYNR83T9iZDZ2g
	onTO3mvcKJ2yFha4tBy5IznyYaFI1/2PtTSa2smSJeyPwOV59uZWQa1ZcajJL7AKNmk5lGqJaW5
	rShFmFU7HVK/7yKDFBvtCODikhXeOPfLulp2JbQ5/t7ZEaYTA94IZr29
X-Received: by 2002:a05:6402:3241:b0:6b1:c355:c7aa with SMTP id
 4fb4d7f45d1cf-6b1c355ce43mr4215020a12.0.1791948527663; Tue, 13 Oct 2026
 20:28:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010102813.25460-1-qiang.zhang@linux.dev>
In-Reply-To: <20261010102813.25460-1-qiang.zhang@linux.dev>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Wed, 14 Oct 2026 11:28:36 +0800
X-Gm-Features: AclHuK-V8vTFUQbxf7lHlHszzHIzi2AYahgPeKaVtg8w781-TTWwAZSX2kI8ohU
Message-ID: <CAN_Opa9r3BiT+=gE-sR8A9xmAZfA0AKZ0M05_+JZ7hrcXWR6=w@mail.gmail.com>
Subject: Re: [PATCH] doc: Update recent SRCU API additions to whatisRCU.rst
To: Zqiang <qiang.zhang@linux.dev>
Cc: paulmck@kernel.org, frederic@kernel.org, neeraj.upadhyay@kernel.org, 
	joelagnelf@nvidia.com, urezki@gmail.com, boqun@kernel.org, 
	rcu@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kunwu Chan <chentao@kylinos.cn>

On Sat, Oct 10, 2026 at 6:28=E2=80=AFPM Zqiang <qiang.zhang@linux.dev> wrot=
e:
>
> The commit 'dab06d6f9379 ("srcutree: Add an atomic Tree SRCU")'
> introduces some new APIs:
>
> srcu_read_lock_atomic
> srcu_read_unlock_atomic
> synchronize_srcu_atomic
> DEFINE_SRCU_ATOMIC
> DEFINE_STATIC_SRCU_ATOMIC
> init_srcu_struct_atomic
>
> This commit therefore update thems to whatisRCU.rst.
>
> Signed-off-by: Zqiang <qiang.zhang@linux.dev>
> ---
>  Documentation/RCU/whatisRCU.rst | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/RCU/whatisRCU.rst b/Documentation/RCU/whatisRC=
U.rst
> index e6767baff2d3..75c50f2f6d79 100644
> --- a/Documentation/RCU/whatisRCU.rst
> +++ b/Documentation/RCU/whatisRCU.rst
> @@ -1209,11 +1209,13 @@ SRCU::
>         srcu_read_lock_nmisafe          start_poll_synchronize_srcu
>         srcu_read_unlock_nmisafe        start_poll_synchronize_srcu_exped=
ited
>         srcu_read_lock_notrace          poll_state_synchronize_srcu
> -       srcu_read_unlock_notrace
> +       srcu_read_unlock_notrace        synchronize_srcu_atomic
>         srcu_down_read
>         srcu_up_read
>         srcu_down_read_fast
>         srcu_up_read_fast
> +       srcu_read_lock_atomic
> +       srcu_read_unlock_atomic
>         guard(srcu)()
>         scoped_guard(srcu)
>         srcu_read_lock_held
> @@ -1229,8 +1231,11 @@ SRCU: Initialization/cleanup/ordering::
>         DEFINE_STATIC_SRCU
>         DEFINE_SRCU_FAST        // for srcu_read_lock_fast() and friends
>         DEFINE_STATIC_SRCU_FAST // for srcu_read_lock_fast() and friends
> +       DEFINE_SRCU_ATOMIC
> +       DEFINE_STATIC_SRCU_ATOMIC
>         init_srcu_struct
>         init_srcu_struct_fast
> +       init_srcu_struct_atomic
>         cleanup_srcu_struct
>         smp_mb__after_srcu_read_unlock
>
> --
> 2.17.1
>
