Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A291E41D63F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887542; cv=pass; b=ExxWkKfySJAA+ONC+syfjwfcpisMgwh3VtFqCfbrM+jo1knpNjOMp8c3Lp3X3Ffngc7xbtm9q1lMYnGNMYh0ms04JovuKS6QTa9xsb3VcYHkz6+ovJncVR/z8yATAf9bMD2dXt8XMAeKU+lDfM1uHaXikPA2WRUx03TMdy+1N9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887542; c=relaxed/simple;
	bh=IAfkKA0U+QL1NU6vVqFogpbTbIovJwScmPrSbAdsIoU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uJg3SIxrhuPYD6FsPKUao4wFoNlBFgeyjzFklK+NJt0I0ubSZ6Pt6pCblpPzD0I3k8fj5I5iBP548S1NJ+1k+bmxufw66AcCXU2PdHP4Mr0I19Q4fBrwQ86jL7bncQE2EhpJAGNOSA9vA8JbMzxIYkG95bKEk7ovTmZErB37Cao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/tLEpBd; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/tLEpBd"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-355724d032fso297040eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:32:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791887540; cv=none;
        d=google.com; s=arc-20260327;
        b=ZO4s6WrFNLiQVEWdNQjPoZ/+2VKymSzhb0/B39Dj/bqSg7LghKE+f8z51skYSjn4iC
         bKZy3wMK6c0VXxGD+anRLIdYWxE+K8SCDUgNOGNLMS6xY6/g4ro25OSZOgsl7VSXclna
         jH6LUFx4z6GK5L4C2UxDLv0r9M+vCUHQ3pTmc1K7knxZNW7tqR+EU6LEXXzdXcd0I+Ij
         bOLaEacA3V2mWDlFZyBrARaboYR4L/8rG544Eg7mgdXM/+zPh9mrbbUBf3B8mgJESOQk
         G8nSoo4PlN8RxhB+Q+3IM9JYDkg9pSD2FGjAmSZaph97mAe3bj4K3tFPOV1DhrK68QvP
         2Rmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        fh=blwfEuuJuZux0YJQGhhCXrVbwwz6T1BBa/cAP2ahOzg=;
        b=FpsnxjG8/SeftmUtddMlXG3TWdgtR/mN1mH6i/FH5Sw/bqA5d931sCBgKa2uhE6hm2
         0bhKfz+Y07rMafG3cE6KSReRymqD3ZKg/8rg2KKFDSA8cRpE/EEVWYDlPltw9/QriicQ
         ajS4EtVBfbsLB9OqYeX/exeBb6u7PWLwOa5bqRkwnoXCOE8K69QQ22NpNbSU9tZ16jQO
         SkzflHkJARcOYNo65ix9aYUcUhSxbWM/zbcAxZ+RII7ow2qmOWVOpRvGCKAjs2JK+QiF
         AS3E+GXCz1VdhQf84hIz7aCyto8pXK917HniWRpqc7p974MBuroiwzW0a2XtGlbchGWO
         tvzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791887540; x=1792492340; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=Y/tLEpBdP24lKTF7jvb/dKv6TxqZVNFs2Pj2CuqXfO5HRD5Aw3vsmFxQcyBhBQqIYR
         6VD893zgvpKQyC6jITbu+iO/lTmW2wNinSIm3iwrbo9Bzh+Jy7pf8SLCtAkmC8UO/2rj
         1WfajpWd1PMk08oyfSh/2BRM1CLPz9VY8hyxJi+v/GzeH1q4XQ81JbnU4WwZwMMC8IvA
         s5799Wvbj8ILnxG54laGxLd7PtbjP+1QgTjRr1yMdxJAVLbyKa9Lp95VhByaHTuAZSOV
         pYSN3xFzmqHDUpvJx4c84viFlMPH8qAK71b7LVrKoNeyNqe03FpwDiPelUrxVEvFuBRQ
         jG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887540; x=1792492340;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SYwDmHP5gC698Sj67HNGApHy2r5CrxT42QNJMV7RL6o=;
        b=Uof0AeOTmUKvMVETwZ4KmqeANcbaDtItiaRMziqUVtOT0PCifuhdTUxBv6AJp+uOAR
         qNFGNVaPBwtmrNSK6X/zC/Z7JQMWaEsFDv00SMmgyNnyTwcb9ZqMJFVrXHNylkUweNke
         vyZiCleVLnWhEydVSgHCv/R+dGMXAn8DqF1XGFah5/5JvaJvsOo8BQ0NTFk7fOR9ttKh
         uzulVFPjYld/Fz8YZsEoPLM3qfOFBgjzqnXzCJvyrjHFwLXPG66UdHpN5HbXpzYg9d4x
         TogVgo+5FHt4m71PNVicwMMfDtqcXNyxwP6J3dLbkhxueRntGBVnC30gJzCmWUOVgA93
         UVpg==
X-Forwarded-Encrypted: i=1; AKwUvBxL5HZziVT3fMAo95UW5EVKWx/3FuLsMn2ts2kRHt4weLvd86zniY1nRnitnsv0LGCKsjon/UKqE5EZcDw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2bwWzu3h+f3GbXvlryiyWf3VGWc8/bPAu/KtqhlKQzV7XLrVF
	vRC92oyOk0B91IC7rrDy0uPhdCKckQlOgNnxWB4Cgf4HOyFW1OS84jSTqh65oSsqrP3a+MERsFY
	YwYabAjuOthiDK2jhay5gY/pv4rq9uAw=
X-Gm-Gg: AYBFou17SgS6kI1w4UbDBb/pQEdeU5+D8ezGhyc3Vjy5O/sy2HS85xNm6uaNbFdqWs7
	Mq6GPo3a65Z2moSqOHsi4w8Ysz/I6FHRLEz9zBjU91Xkg3o5jpRNZNqxEMqBcyKnYxIz9cb8GRI
	PDiEFicElL6Yt0rcv3+lNL5WQroN2ZB386okcKGAFmQSx7wcTTw3KXxn/aV1cKgl1GgOc4TcTIs
	OIIfyX/oFeW6HwGPDhffZhBNKOd+Jh//9WoB0NmvEeSlcVImMkxdleqgr/4G5DTOsv0K7j0VV0d
	BNDOI3Qrlg8F2QA5YuJF+/x4FTRuxWMKZFl/zkmKTfEbajywt5zGnK906wPjjCxChlvm5cak/o9
	Vw9ujPKipQXnvS6gMtyJv2HQyMMksqDJx3giZa58qpVTK+YCbGh4jugdw8Q51wAuzDPpTwt9YYx
	qhM0LvEM+vxFkNGBh2C0DqFLFnzDYa5bCKz1WrmEMFHfTM5XSqTiNICA7er8dF9g==
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr25702764eec.0.1791887539654; Tue, 13 Oct 2026
 03:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=UbARgkMYOHY9kbqvkCEE532_wnkKkv50H-JkuKWtCe=g@mail.gmail.com> <as4DdRqFKxuJNDnS@elver.google.com>
In-Reply-To: <as4DdRqFKxuJNDnS@elver.google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 12:32:07 +0200
X-Gm-Features: AclHuK-e9pojF-4-sUhcctzSu2Lj9dg88Qjibnm7E2u4bDLqEx7YvHBlJNvxTnE
Message-ID: <CANiq72kQ0XggO9K44aprg1yLWZFj=zb3M+T4pRKnKbBwnoy13g@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
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

On Tue, Oct 13, 2026 at 12:10=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Looks like it, and we need this patch to use system_dfl_wq:
>
>
> From: Marco Elver <elver@google.com>
> Date: Tue, 13 Oct 2026 10:05:52 +0000
> Subject: [PATCH] rust: workqueue: add system_dfl()
>
> The C kernel deprecated system_unbound_wq in favor of system_dfl_wq
> (commit 64d8eae3f895 ("workqueue: Add warnings and fallback if
> system_{unbound}_wq is used")).
>
> Add `system_dfl()` to provide a safe wrapper around `system_dfl_wq`.
>
> Signed-off-by: Marco Elver <elver@google.com>
> ---
>  rust/kernel/workqueue.rs | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
> index 7e253b6f299c..e46d3acf903d 100644
> --- a/rust/kernel/workqueue.rs
> +++ b/rust/kernel/workqueue.rs
> @@ -1063,6 +1063,16 @@ pub fn system_unbound() -> &'static Queue {
>      unsafe { Queue::from_raw(bindings::system_unbound_wq) }
>  }
>
> +/// Returns the system default work queue (`system_dfl_wq`).
> +///
> +/// Workers are not bound to any specific CPU, not concurrency managed, =
and all queued work items
> +/// are executed immediately as long as `max_active` limit is not reache=
d and resources are
> +/// available.
> +pub fn system_dfl() -> &'static Queue {
> +    // SAFETY: `system_dfl_wq` is a C global, always available.
> +    unsafe { Queue::from_raw(bindings::system_dfl_wq) }
> +}
> +
>  /// Returns the system freezable work queue (`system_freezable_wq`).
>  ///
>  /// It is equivalent to the one returned by [`system`] except that it's =
freezable.
> --
> 2.56.0.385.gd3acb90ef8-goog

This is:

  https://lore.kernel.org/rust-for-linux/20260807165252.3849875-2-dakr@kern=
el.org/

i.e. we have had a warning like that in one of our current tests for a
while, it would be nice to clean it up:

    workqueue: work func
    _RNvXs8_NtCs5lxGbhOOw2k_6kernel9workqueueINtNtNtB7_4sync3arc3ArcNtNtNtN=
tBH_4lock8spinlock5tests4TestEINtB5_15WorkItemPointerKy0_E3runB7_
    enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.

Cc'ing workqueue: Tejun and Lai.

Cheers,
Miguel
