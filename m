Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65B71FCF41
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791895219; cv=pass; b=t78t8PGgD5Z6YuzXDlyWcwPHjorIaATQuWamBcgEWnkxHtyf0LyZQvYIlalQnnBOP38wA1QKdHawnWJUG1hUvNo3gmRXjXeoFx+uqUSYzO5ZyB5vKBRqbVWHYHJcgVPm6zkhDjnOwFOX6ZhztTVsmGED7X1uBOnl930P/mr4b54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791895219; c=relaxed/simple;
	bh=2xcKVenmsOkTL/dR7a9UaRkSdDoYvwvb2hQq8wsPR50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oiUKUUjG9ss7LigCBx7DgfzkTzWsX5+1JkoqVX8WZWABwPcTrWyWY0Czw18fnGBmN2513kxAiQC1NV44v0+Vp03eW2oYUIrLAWiDfP1rPVlPKYkO8grWjE7bMLss52785g1Ku0V4+bQJBYep+wirrweIX3COILNxtWehnxy4nvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L8DrU4pZ; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L8DrU4pZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso2069368f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791895216; cv=none;
        d=google.com; s=arc-20260327;
        b=VHHtM4tArjYk9l4VD+0sETcL6a4GcI2NiRJ89MiGcAWH13nrA2jFM4piatXx9S8rbf
         Q4OVdDNFIesZT/Xwfvm6EsmlijTmgnwbS6aWnwpllnerybw1LS8q3eZwFA5500bROVKG
         km/39MbS5NOMeW9XTZ5rDvFxz/ev9C7FT/QIxtyI5G0hChhG6BG6sdsMtwELOo/Y163d
         qE6CKKsOxnYUNO5CzJP6xDclZjpI9egggDwPtyZfOidcXzfabC9EFNZvRoSnWkLHMGO6
         wQmjEgMOy+8uPva8NMYlhKI1NtjEuPR258CwJ6M344c0xcW1GZPZdqyw2UUtookSzS2n
         1ciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        fh=w4lNzeaf8+u6ZV35OUJIpDv/WJZsvQwAkLGymVNDZ44=;
        b=KyVQiOXSr4AeBJfwXI5piPyPQe3f2/c8nC2cpdzxudFyaWNKXLtXqN/lSnXi4sYBns
         zMnO2f0sDtokjXXyOX9XI9UI93jvFS5DlLRDWdU3vS09zzZBhe/vgT9bcqa/5QxYDYZj
         wVTvNtOKwu29nXaTvI3INWyA0+WFQ3QzSS1x1O6gn0LlZ/881q4ntntPocoo2fZPuAe2
         fHD6378lrgkOoC7K4yAzaPihCUKduYNDTSOmgtD60hHLispfmcU3K+zwsuCA9xxPYUDU
         Rr3m9VA8Arh3eJB2qIfwK5h9CqwlepzMlLTKmDUKew27SldvfU2gVgsoQFxolXWJwHX5
         QgdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791895216; x=1792500016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=L8DrU4pZy6lObZsY3CcCLNFY6pLCfmuKnb5MhJbhxEbXnEtHWeVBDHA/xYQ6FC4TGL
         V5XNDn8fJdNx/uI3DEUeswYU8Kolgk7PP8Jfz5PL9EDloPkBgLKpL2UHOxWv4PmG0LOk
         5T8mw6OC03YMpzP/Bu22TpMc4b8HYLJcJwHEXWKXyGTtTmAvoxlwCfHV/rsgAPAKu5Bj
         WkBrlHdIBl+eclwY7V97giPr9FpbVb0wVkAEJxHwM7JI1YsENcXY0LUXsFKnzKGYbZXy
         INifoEBz8db9sTW33xlVj6OnsCVhVtIyZx3x71VRWhc4Xnfc/3oytpCoro0rd982wx3T
         Nshg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791895216; x=1792500016;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eOfUWl1R3SOwmQxh1GQ80TqhBtojSwu6T3aXEwR1Vo=;
        b=WhvirEP3C6BOTvdKPsACugES5x2KUUsAApH6Vapk0y2/Ypq87Xb+8e1FtTsynpvr9K
         JLZg5wnInnUEmTHXvHeHZImmSUV97bgj93G7mxzQys0Qp+yPCBm6rUtEbG9fNHVHFkSm
         nBUfFUu250LM5ME0ooWkvadlvFc7sdEkZ8UJQSDE943t91QahWl3PcRllL61pNVxi6An
         MA3YXZvkLWjzgreJDf2Fz+X8TvVAi5RTeU6ZtFvbX9RQIRfshzeSkyuBJ+cLh3Hc1oNf
         Ap6c10dr/OiY5FvKNcvyuZjyvjpQIoH7IXflSJVELLmO3tIv7CVSYRnIGHET7/l6TmPs
         aUTg==
X-Forwarded-Encrypted: i=1; AKwUvBzhjhNlNi2k4waXboxdYRwM5eHja1ZVxQaK0MRRehGM2gGzHTDdrawjpzlsbY0tMypJFjX48r619QpBv0Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPuXMn05ZB6mXgD/FB+bSpSqIIocT7KVIzFDWiND5VnbeS4ciD
	RT4IytI08f+kPO+XWxBBtGYCHH06oQniIZ/dDvoJCBvXLYXvkqVzyRc4nmVBgCU06eh0B7NYnTR
	wb1ffKk77iYDTi+1n0GIVrRsOfw98CoyJYH0G3o9z
X-Gm-Gg: AYBFou0xp7EFway0XnSX5G++ZgXxJMZc99gk7y+ipxRNms6KdMWWPeLLTi/uAmeNNLt
	16efUn6SIKuLpmS9I0qIRik1aOD0+zwZ7dcA6Jf6St7YiMGjj+9dSHquhgXTGKgAH/O653dfHBJ
	n570k9eAXTYhLktYatRJ2vlqKwB/iJaqfRZQgsrqRCvYxDWf0sUWI3vNkO13fMWEswcP9wt1FXg
	lBgg39A4jz00vDxV7SqU1RiaWhHDWtM4e8h5RUpSt6fvSmI6JW+kHJvx7BYd5Ttldb0f/ZNFRt6
	f1pMqcwHskOYcy1V87wV0lCMlztYFbmYwq37izQbbuzPpz6EEz/VXQJHQsyJx2hBvfS85opnWeO
	8Y5xrhs6KWRroQ5uo1+fncTQ=
X-Received: by 2002:a05:6000:43c5:20b0:487:27f6:a4df with SMTP id
 ffacd0b85a97d-48dbad3c1e2mr17146863f8f.47.1791895214991; Tue, 13 Oct 2026
 05:40:14 -0700 (PDT)
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
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 14:40:01 +0200
X-Gm-Features: AclHuK-baEW0UEHM2ney0XhOi65COv0qWM-kqnIhtWfQmlen933Tf5epqt03if4
Message-ID: <CAH5fLgh=TkPnycdZ8_yQKaVeufN1YUS-MTo3EoMVhZzOdpKwYw@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:32=E2=80=AFPM Miguel Ojeda
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

I was actually working on resending that workqueue patch series, but I
think this particular patch should be split out as a separate fix, so
I'll go ahead and do that.

Alice
