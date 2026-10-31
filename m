Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793463216;
	b=cO6rpDN319q3s3zQI83boMR2dClGR63Vm2a+nlJP+7uoapoycsTVo1Ddbex3fXaXpLXj
	 dYG7r8qOsmEMZzcBbDUMx50yJDzScM6cZBBD0tBu+M31v5FBkVACDBJ1dM5aWGSW6gmWV
	 1dFROJBzJtex9K8H2D8fmO+wl6ruWBsnhXS9AGBVo6xlliDOlEKwZ8/qv1Umo8Rsvrzi+
	 R6ATxPk6JsJn1651WLUjoFrUs8urh2jF6lkPAdEVw1H0wujurjEvwRTFqooaT6alFl1QN
	 iZKXhqlBpiGp7L/rSfaoAb6OwAxuIzIFbh1xfTPLXFzX20gSYjORdZ78Qr3r7RVHa4A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463216;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
	b=guQkdAd32dOOEpgHD8UUWX0vWYRsHtrQgQ3kZRl7SEwz3IITPP8WQnbBsuD7g9ys27Ev
	 Ohw9nAiv5RSVfZqhHe3efeKWOE4tALNwI1yqlHCdKCu9eLWI3azMU1U1+WThffBZ+I0wk
	 JQdH7lUBv9BpeJMX2sQAvNxxFHIIqAOW4yQHXKWwCTXJNLeT0LNlQD1+RHOj9kyhYqvZB
	 ffmTn1DhEaWAoaoZcPMa3VBqH4c9+OEtDFiwaHdIbzrHNeD7iyxrPCQxbuHQ2o4k23flh
	 PquhM508/6c6eDagd/v9xenGY3js3bAis72e/GuwVOuaznGs45/AAzeaKl8N+TB5QWA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oXnQbY19;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E524E606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 16:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E524E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=oXnQbY19
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so21705385e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:13:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793463214; cv=none;
        d=google.com; s=arc-20260327;
        b=PfuqyJBBbEMbh6//mah32+POuvO0Obyd80InMnsY7n5BsXYiN5aAttxpeTFOowWzBp
         8URE4+5Iq3Qyld6cwqAxZVPRES/rJ/5XjuPIHffur7gif4Ec8WZbjRtOe7Lsr9U5WwNh
         S/b2TTUc3YGSD11IeUHf3zDcFQqbaC37c3AnVPRsVDzWdprZ0+Kft+T740bKN9jk95cB
         eG9+BfsrBcS6b7LOkcMi1qawXREsGjlktj7RHl8Gby5dGSN6om4pg9Lz5Ip9wgK8C6Gk
         p1sYqi5x1JXguppHyVTHbvYmUuOE5m2hPhYmQxP1EjXO+LQYFG7114g3h1tjwCeD0Iox
         5GKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
        fh=EHdMLJARxRxp1E1pi5ZKqAQsKTU7b8eXSdJ5TWoxzSM=;
        b=n5YdjK9P8hB6LRh+u5aYlhMxkgGxdPjMRrwg6hcpnl5bHdW7+/wTLUeB4XD+2OkErF
         f88ooKQgnRijloinqOr/ZzP5acU45J+zloAaycI8upRKeqYRNBAH4wokHMiBrkLuGH1N
         7187RNzkDVAYYB+YT9w6Wny6SOWwALrEgCFoUbhoP/cqkD5CooLyPXJMMsB2I4dUkZWf
         +9ZDKIWolBLSpG3wOuKXuDbax2Z0r81UhQn/b/ZcIrnvwc8z8wTVKDFeTWrwDRmPiym9
         orKQQC6uY3UefaYBiKsJWJh1Cm2pVvVWIYlk2P/V/2ZHFSJZner9kDgnVSskhdEO2Bbz
         oUug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793463214; x=1794068014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
        b=oXnQbY19S7mqPdMforuEPHv9pzUoIcdSwcm/soYtICkrQFY6YieRL96mpvxdrzy6h0
         Alb2LMED/LNMuw2OYEDVd993QpgNLhTdEUo+DK0shsFb68/3huXLkCtMpahatYBoN71e
         96EsbiBY1gjv9x8s4pOKAs8HjOEVjUnpBro3m7uF98DFk/Y86DAUThoTSNfS4IGUmX4X
         xfxwwtn+P/e1bnjYvvCMhcfkM1VeptQwf54SJQPYZZvx4gRJxLQr9v6NFSyxdGfs8MG7
         CqkAQ8e8zW1EuxXPzjSGK8y/vcU5sGssPAaIFwRbmDTIg+YmehDQwuvmd9XgjNfJFOII
         A14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463214; x=1794068014;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3Q+PHIl6g5HMUOSg7HIWkgIuqu1qjsAvPL0iC3aVE4=;
        b=cbiiJUNwVajMt/OaBmN2J8idnNeyk/UEqKrSaw1qRQNA6nEdNpLZ7Mi/TPG0S9g0ph
         6bKJnuD3NxPSddAXmzbI3pQvXCB57+pCuJ6DEIyCGZ73cz143+qn1RNQXv5H6kHdwdAK
         fhi/xhIS2KV9nK9ZhqIb86FiEaDaKb9kiT29kvI9LeGMtlAXaiAKQV7L/mVw+3Ko6dAr
         mGP78z1KWFz+Sf/Adsu2PdjGDOJen0a5XZcIqre+SC6gbWov8HFwN2kF8G7X5k2DH05B
         k8LwDMHHoLx81aC20cPiS0zMf70+v3zlXF5So5lcTQUkOWpG0I4cr3qRLx4lrX/KWO0U
         LZbQ==
X-Forwarded-Encrypted: i=1; AKwUvBwry90N6LQ0iotp5m1ComurAufodjsPllDa+RFUgkGpEj2VX8AqyUfaw0CL3U0ToDaMs29msYFwxYGOsh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuszJDMEDED8CB6v07WbGL2HK7o2Y+zdfLXTbM93SPqMcxXhx5
	bxqNeWgO0RC2NbLO67dkFNCow1x3e2xuMijNzAYbgR7VwwA7yRG+r5emy/34RwmF38WU0tpvZQK
	KFutEyw/PtIV0igk4ICADXm8zknN7CrYr3L6T+OGL
X-Gm-Gg: AYBFou0AacuVAHp302gQXKB8LJi2HDLiVAufxslqY1cRYPac6oeMTYUvtmYab967lQI
	9JslZPZ3O9vMIvtn897+VyUm/rZKzpL7iFoq8X05RsQj4TYxNNGZcsFPZyQsoLWjhKZrjIjkW4r
	59h6rwr8g3yLSuqHnlnezFp5t83MUqLkCYUEkQOhZN7fx1T+Z1xFcg7umR5WRiucAS2y+72d4H5
	cCIia0BylGte8XF6g3OBZmfprP7XAXvSGx7CpPaevdo7TkFWjj3xAubuEbgaQOH8yig6tsR6bTD
	ugK9eClV6ve5Io6UmO2kRLLFMY82rKPfROO0Cz8PWncSwdAnUKz2WZW50kG+Cc3L2ij40nlnznA
	y/2jEJnbI+3WzXljiAomS4wFO1ocSI3a3xo6cTLUOQ9EEMqXJ8/ODWpB9w5bS9JXSbFCknpUD6n
	tJskO7sRYjavvU7f19abXwT9QjGp6bmh/zyQz9
X-Received: by 2002:a05:600c:4687:b0:4a2:10f9:37db with SMTP id
 5b1f17b1804b1-4ac16fa4dadmr127607515e9.7.1793463213791; Sat, 31 Oct 2026
 09:13:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031030801.4100693-1-jenhaochen@google.com> <20261031150909.3807811-1-jenhaochen@google.com>
In-Reply-To: <20261031150909.3807811-1-jenhaochen@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 31 Oct 2026 17:13:19 +0100
X-Gm-Features: AclHuK9cQssAXrj3fEwvmCJEbC0IXVvertX9-PYXintpQHs6O-tVHhXTY1nDI9Q
Message-ID: <CAH5fLghJG5x3G34FHFDswp8GxuPuo322Jk9fqcW0TKX8Wzt43g@mail.gmail.com>
Subject: Re: [PATCH v2] rust_binder: use Atomic::add() in BinderStats
To: Jenhao Chen <jenhaochen@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Qais Yousef <qyousef@google.com>, 
	Ben Wei <benwei@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 4:09=E2=80=AFPM Jenhao Chen <jenhaochen@google.com>=
 wrote:
>
> BinderStats::inc_bc() and BinderStats::inc_br() increment command and
> return statistics counters on every Binder transaction and reply using
> Atomic::fetch_add(1, Relaxed), discarding the returned previous value.
>
> Because the return value of fetch_add() is unused in Rust but must still
> be produced by the underlying value-returning atomic RMW helper
> (atomic_fetch_add_relaxed()), the compiler is forced to emit a
> value-returning atomic operation (LDADD on arm64 with LSE, or LOCK XADD
> on x86) instead of a non-value-returning atomic add (STADD on arm64, or
> LOCK ADD on x86). On arm64 CPUs with LSE, value-returning LDADD requires
> a round-trip response from the L2/interconnect to populate the
> destination register, whereas non-value-returning STADD (encoded as
> LDADD with WZR as the destination register) may be executed as a far
> atomic without waiting for the old value to return to the core.
>
> Switch BinderStats::inc_bc() and BinderStats::inc_br() from
> fetch_add(1, Relaxed) to add(1, Relaxed) so they lower to atomic_add()
> and emit non-value-returning atomic increments. This also matches the C
> Binder driver, which uses atomic_inc() for these statistics counters in
> binder_thread_write() and binder_stat_br().
>
> Reviewed-by: Boqun Feng <boqun@kernel.org>
> Reviewed-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> Signed-off-by: Jenhao Chen <jenhaochen@google.com>

Acked-by: Alice Ryhl <aliceryhl@google.com>

Greg, please pick this up, thanks!
