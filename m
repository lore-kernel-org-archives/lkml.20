Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4464C10F5
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890212; cv=pass; b=cLub7L189LMiyZj3vJQ2deI6sg+Z+7ysZf/y9Zd0i675tVLYumFGXl7kSsrMRB0lYjIR+WGV8XVj30l7rOXEO4FihNf+FyHucjI6CHU6r6RpDLty869eJHt2z49V6MQ0Rokagh9SFH8hUYK8Q+V6a+SXkjSFM31dzHo+3Aix7DA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890212; c=relaxed/simple;
	bh=rc9KLx7EvkpoTqaPj95lDAq+Pysu5EXwOszhQEsLWbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TiDTemCl3MNAvqRseKC9vBR0Q4ZdNoIbx8l6oN8lz8hhMOTaCIJ+9aNwXlyFHYhdQFpyYaxC6yKSpDymkfJtAkeNfhc5LV6cuyffRPjSbvsurbQw3te3D7DTlnWOFXJcrXc/aBbKuOJ2Hgoet6V860tKFg/MID3mqyOitWYexcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A3ZlYpbr; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A3ZlYpbr"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-14394530ec6so1599710c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 04:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791890210; cv=none;
        d=google.com; s=arc-20260327;
        b=QePNzofuxy41MTRUWMr7VST5ZP2hrxVWN2qNOzyxCHlcpj5lSGTHELK/KbcPaK8x1l
         1VYGqBRw4fJ3c1zcsgtDQEcTDxWdYzCps68uUoIoi+WbgSNm7RipCbe1uZsYMkRZT/Ht
         A4agXW8Bs3XkzVJTR0PuRrRMNbR3lzVkarXT6FBuTw9MJAEDEgRXswhVkcsntcIkIHxd
         f1G8Z7xoP/4p8xtx7nblzHfj0Ag7/5RfDnPVg4DRlxrkuijaDirtcMXouL77zLbhHPww
         ExruZXfCWtWRLyuJZl5A6HVCd9xwZZi3p3ZThUrhBTf5TW+bmkvFteFfaolKpJVWHoX/
         0c4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        fh=fC5JN06AWHHCOy+SniqNiaCr0PJ2zuXdO77aUBX55jk=;
        b=L+PpZzfsAi7zAJQ0dyFTYlz9iuvFsv87U9NbORBSkR1wCpKZ/bn/Jmi5vTrR82Uete
         +ouWFFEurvJo5K+vqa+9bTNsHbZsnlQ4wBnkcQvjqQ2+AkntV1OR9VHHwTK9snbrHnD6
         LU7a5XTVNlTcZM2ziM04lpfRf9DRiddE9D5wtRaYxcy5abIGRbrRlpLbNMQqJRcVKcqv
         oqVTDETCaPwbZywAgVD4+eUnHnRpDSVXgyuHqEeUCvtrdaudRxttlExWb7Jl4xjXuR3F
         oG7E5rmlDtO25lbg+34Ukk4EhBP0iRdrS+ZYD5nixCMRBeKqJlXahrTHS3040qIiE67Q
         G8xA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791890210; x=1792495010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=A3ZlYpbrCMhPs5+cCvMHyG4Dt/GJNOSkar8RTlB/eYtos4nF2wpMS1UCuqjKTnHVJj
         zeJRM+sfSBzkl1cA8brd97RyiXeyHGY1pUI8wMNAG0JH+N9fSkcoG7bF9kGGq221BP4t
         Hkiq5QoArAlinOIdSCY8ND9zOYpvpuhmfcNq98ge/eIfBt0nH87mTlEPsBYjQ/xCrloU
         vCeSLYikfo7Z00MdQtd1JUW+6P4GQb/R+ZI9FSmmXowwHldsG0WbOgvyEYUpM95bJRGn
         WwD8Z/7C+bEeOvnAuP7YwIoX5GH7G2prBYapdc4slS5neEVGihIvYBlbK6Y4yqroW0Of
         poAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890210; x=1792495010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Pk1PNEkQwFyLoSgGMUVJrjEgd7crJB7H/ePjfgBSkQ=;
        b=yyzW0uUZ6tPtL+XTpOHAnCEqvr4EmJDaLofc+QDLSSVbksac+riWKDaSnjyPG97TdG
         21NUvPueR6eL1DETd0xUDzMt4FgKXk4x+n77h4lwzFVnQlTZJTvFqPkuxZEAXjYyzVP1
         LbjF5d9AHY645scwRHWA4MBnNUVVIwplwahBYpqvFfAjvTYPDdhgL/YCkLWBolojBENO
         YwU3LpfHZvm4dr3SlQepwUfvlDTdBGYM1OBN5BGyRUjnhRQRH0s93dbryRwVraubwhi4
         RYB6pydn9x8j4iYTgBX7jF5DmpbK9SUSycvmrqOKmGS1jsywGgrhyEoASoPU6WFlESQg
         Zz/g==
X-Forwarded-Encrypted: i=1; AKwUvByJ7jH4kMj4LDsWihBBdqUQpJYHCsqDrSfWCh6PvWLW9SZ5or0wuiOSYtS23NWecvwhrYh9IhkS5Ofdv94=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQLpbv/xU+sm3lzdSqn58ZeUfCfHXbbfNzFpDfNSrv+ThfOf/k
	gTPyrgj9vPuABeBfyLO7GisoJKLU7//yuEz3x4Edt1S73ws/BEZdN6KOV58J+Ny9ljwtJ0gBKx9
	hWbIhuil7v4PvSczDLvJNZbRCN6ThmRMjzVLEZ5mQ
X-Gm-Gg: AYBFou1cf5UjWJUAASTNBCnXeF0svVBUW4X7WcjqCdhhE3BAtiGtTwv2fVtpQHEGOr7
	COrvLs+YDnA2MdpGslEMXcggo5jPV+/0hoW4VAHvpcfnXWUwSQc1wI/BZyiwo3zm/hF33921+4g
	a4eFR64mO9Q+VeRpgWXmTA3MTv2NIr62PaBdERTIpI8wLZbXJM6b8f/teRIwK8rkvb5E6l22YHP
	d61cX3sK28YvJ5DGTU3gMmRWu3tM80sFWOf/Z1Y3HqdYGBhNzVIVwkunBhZhSuBqlO0lk1PiGcm
	4ExOFW5sAucOXZ8G7lM9yIo4Lu29dJOvWfqtCWrcA1/PZBG0BzX9msuHDy6zRARmIqxe6S4UyC5
	XaQ3u/WTujg==
X-Received: by 2002:a05:7022:f50a:b0:17c:393d:a0c8 with SMTP id
 a92af1059eb24-17c393da495mr248774c88.5.1791890209700; Tue, 13 Oct 2026
 04:16:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com>
 <as4DdRqFKxuJNDnS@elver.google.com> <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
In-Reply-To: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 13:16:12 +0200
X-Gm-Features: AclHuK_P6PU5CrwSXdVV6i-xG77HwukstjFkP0Kjvw_NwxgzqD24Q_xKBYjksY0
Message-ID: <CANpmjNNu6VEXtr5zUWAiAP4rPiM9jgE-1ai91+Fpxg2ABeKYFQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Oct 2026 at 12:32, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> w=
rote:
> >
> > Looks like it, and we need this patch to use system_dfl_wq:
> >
> >
> > From: Marco Elver <elver@google.com>
> > Date: Tue, 13 Oct 2026 10:05:52 +0000
> > Subject: [PATCH] rust: workqueue: add system_dfl()
> >
> > The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> > (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> > system_{unbound}_wq is used")).
> >
> > Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
> >
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> >  rust/kernel/workqueue.rs | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> > index 7e253b6f299c..e46d3acf903d 100644
> > --- a/rust/kernel/workqueue.rs
> > +++ b/rust/kernel/workqueue.rs
> > @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
> >      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
> >  }
> >
> > +/// Returns the system default work queue (`system_dfl_wq`).
> > +///
> > +/// Workers are not bound to any specific CPU, not concurrency managed=
, and all queued work items
> > +/// are executed immediately as long as `max_active` limit is not reac=
hed and resources are
> > +/// available.
> > +pub fn system_dfl() -> &'static Queue {
> > +    // SAFETY: `system_dfl_wq` is a C global, always available.
> > +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> > +}
> > +
> >  /// Returns the system freezable work queue (`system_freezable_wq`).
> >  ///
> >  /// It is equivalent to the one returned by [`system`] except that it'=
s freezable.
> > --
> > 2.56.0.385.gd3acb90ef8-goog
>
> This is:
>
>   https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@ke=
rnel.org/
>
> i.e. we have had a warning like that in one of our current tests for a
> while, it would be nice to clean it up:
>
>     workqueue: work func
>     _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtN=
tNtBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
>     enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Cc'ing workqueue: Tejun and Lai.

But I take it that the series above is not yet merged?

So I'll keep the previous interface for my test to avoid introducing
conflicting patches.
