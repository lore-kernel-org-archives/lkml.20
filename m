Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483271;
	b=nLfMMroxt4TSm881Ea1gBfsKHwKKHcq8gb6sYsLDe3nR38qyZy1E/0IqZBDCt9Z6YUFt
	 54mmNNFuJ3647BmT4eZnB8ztR4W2uZpwNSWfhtexx2u9mMEWt/09Mz1wg1dn36SBNbQ/s
	 Q+3EiIZOssJi887IUgkmlLEOciuWbqI7+qS5gSaBpb5TqKoiAfvwUQNg1SLrFXJ2hs+LW
	 JPNUmaz6NRQmoJjftLSGl4lGLSpNF+yr6juMm3v0Ip1zu2UUmS4au8AWwrfyU88kbqLw0
	 ixDlLK8Msi1tSDSBfGR/sRHA93MRiKbaLV9TJJo+zV68ln/Tf+DowU6RV9L40FwajqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=BEQrrvHcs9KsE+y3M9FCOBwSyvA+LmAr++le07P3KGA=;
	b=BWdIQKc8FM7Bnnyhp1fjsrL9oVTvmhgiXWtfNqIB0NjXgsLm/9pNEmOy7hciDnHUBA8c
	 /p7tHegG3Z2R/SvW4LIa40SZXaNhrhzpqwNFrUQ0a2CuRTFqw8M9i/mR3ZhgzhV+wiUVW
	 kg2PPwJusLbEulQSIeDpLdnjUGjwPQBP6374Ilu5RtKOikhcxhRIM7ZLi0i7dDaIzGg3A
	 qdmuwoua0+LVEJdP33QThIKYuDH+PodlC763WXfYNusLNKGG2mLNv5DwR9N+NII3sbDzT
	 3LZDwj8ocSdi2JNUKBy8bNRzb9rNRTG4f/WSMsQB9vONnpgNGDVVKJyfGV/AemQVsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=G0FNFyMi;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F07606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0F07606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=G0FNFyMi
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso25335405e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483269; x=1793088069; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEQrrvHcs9KsE+y3M9FCOBwSyvA+LmAr++le07P3KGA=;
        b=G0FNFyMiBwG8fIKhdqwpWI+lIW9XVQYOB9AszpbsbOVlC3TwlGrSSsSHR12ebxLCvi
         fa+d0Wd3qbPFCXi7atS8tMqZbchmqesOfoygMaK8aRDqV7ClQ/1yy4kdU2T6hTeNl2U0
         tsBdFqexi4L0v6mh+FtTJGAef7rwFKJDQ9FBT0b1kgx1wM/WO2adoilRzoXlf7cY0dkN
         BI5O5NdJjwkP84dSMIDTUDoXyIt/VwOrrtIMgTcJ94S0+mk0omzHErgZqDrBHGQAdeDO
         +Du+G67ZMRaeHlTHUutwdqkE2K5ejSkSMDRV0CsW7SR3rLKxtW4obpm9clc7DHPUzLyG
         yxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483269; x=1793088069;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEQrrvHcs9KsE+y3M9FCOBwSyvA+LmAr++le07P3KGA=;
        b=YazGdN/JcamTY7XCCKVdu7b4kzOB5QcxsjWK/Ia6wM7WCrch0ktkWeMHpsoSUZjHUO
         DWxqC+dBFz2iCDdtW0k/1K0+tECiRdF9Jagj7KLTHhEL9E1Dw4LL77SbKwKgvbzPKhXv
         7F426gUvwu9XFMSDwc9FfkhjIKV6EDP/nJlnX30TNhPDurcVpv/dn4MJ0l4LMNqisU7l
         xOugCHA9d+YHmU3QFrjZL2yB3+0LvQzpKQlcA5JMDeGYBL/YiJMBp4tDOMDmDvUDGmBS
         33pwHHuDl4KfZ9BGt3ifZaumKEsRouBSC1FG93ZQ13JHOiU6iW2YcSWHamUmXNvKCdoM
         nUuA==
X-Forwarded-Encrypted: i=1; AKwUvByJNKHfSuzGgbVnhIpjX45DxLgS/Wu0nY9ohPM1eSbFPGYHsaGcqyX0TEtZsSxWhmoKDYm311WhHYt1ZwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKl9mkTnyatMTsok3iNn/8cLeCluyx9HXWCB8cNK2baYZT+ZGWV
	VveqfGide+NIfKCQv+7tjG5t/C+P87iEAjjf0+U5/7e7L1uPDG0tq2h3qcbWs+3e0+gvCY2Brwz
	+AF9/a4r6f0FYk+b3ig==
X-Received: from wmbid21.prod.google.com ([2002:a05:600c:a195:b0:4a1:b4c0:10d8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:81c9:b0:4a1:ac66:6ac6 with SMTP id 5b1f17b1804b1-4a1d7612994mr191651635e9.26.1792483267890;
 Tue, 20 Oct 2026 01:01:07 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:01:06 +0000
In-Reply-To: <20261019-b4-gpu_info_intobytes-v4-1-0bc04df46549@collabora.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-b4-gpu_info_intobytes-v4-0-0bc04df46549@collabora.com> <20261019-b4-gpu_info_intobytes-v4-1-0bc04df46549@collabora.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020080106.1742330-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 1/2] rust/Makefile: add zerocopy and zerocopy_derive
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 04:25:59PM -0700, Deborah Brouwer wrote:
> Make the zerocopy and zerocopy_derive crates available for use when
> building the bindings and uapi crates and their tests.
> 
> This will be used by the Tyr driver that needs the traits IntoBytes and
> Immutable to safely copy the struct byte-for-byte to userspace.
> 
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> ---
>  rust/Makefile | 24 ++++++++++++++++++------
>  1 file changed, 18 insertions(+), 6 deletions(-)

`scripts/generate_rust_analyzer.py` also needs to pass `zerocopy` and
`zerocopy_derive` in the `deps` lists of `bindings` and `uapi` (similar
to commit 3c847e17225a ("rust: add `pin-init` as a dependency to
`bindings` and `uapi`")).

Without that update, `make rust-analyzer` generates a `rust-project.json`
where `bindings` and `uapi` only depend on `core`, `ffi`, and `pin_init`,
so `rust-analyzer` fails to resolve `zerocopy_derive::most_traits` in
`uapi` and does not see the derived traits on `drm_panthor_gpu_info` in
`tyr`.

With `scripts/generate_rust_analyzer.py` updated as well, a subject
prefix like `rust: add zerocopy and zerocopy_derive to bindings and uapi`
might fit better too.

> diff --git a/rust/Makefile b/rust/Makefile
> index da1a7409d984..f59815fac293 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -361,12 +361,18 @@ rusttestlib-kernel: $(src)/kernel/lib.rs rusttestlib-bindings rusttestlib-uapi \
>      $(obj)/bindings.o rusttestlib-zerocopy rusttestlib-zerocopy_derive FORCE
>  	+$(call if_changed,rustc_test_library)
>  
> -rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_init
> -rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi rusttestlib-pin_init FORCE
> +rusttestlib-bindings: private rustc_target_flags = --extern ffi --extern pin_init \
> +	--extern zerocopy=$(objtree)/$(obj)/test/libzerocopy.rlib \
> +	--extern zerocopy_derive=$(objtree)/$(obj)/test/$(libzerocopy_derive_name)
> +rusttestlib-bindings: $(src)/bindings/lib.rs rusttestlib-ffi rusttestlib-pin_init \
> +	rusttestlib-zerocopy rusttestlib-zerocopy_derive FORCE
>  	+$(call if_changed,rustc_test_library)

Nit: non-recipe continuation lines in `rust/Makefile` use 4 spaces for
indentation rather than tabs (same for `rusttestlib-uapi`,
`$(obj)/bindings.o`, and `$(obj)/uapi.o` below).

Alice
