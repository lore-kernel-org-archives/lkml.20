Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558933A545E
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885149; cv=pass; b=WWnVwkzz0O3te/sdcqTjeg21xVZj8aVlErzj+3KutdoOx37U9bMsIWLLUoe+QexPV50T2UlEgehb+iS4ovU5RpcGDLDaEkORZ24s/vowDqkiXmawEVQOeCgVpAUPPVpmaxyihCQSbX3Z3HmZo0WbvraTk72os41tH+23/+iKv1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885149; c=relaxed/simple;
	bh=TyAuVkyMsHJJREXO1/HTkl4JIBxp9Fm42OQD2fqAPFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4zqlECUq22kXyw73s0NJ06LwEcoDcebu8Q2IPjdCBay7hxK4SydQAFQZUhkDP0HTKLL2kQpWfa00dHoo5ff8DVeZdlbmpbKzOjafgJKpQosdRqVkCEakQjl+dAeRkjMEwGKpP4DHA6PLpfXHaGuKUZEhoAhi2OqSdE+yPmENDs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OUe1p8Js; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OUe1p8Js"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3514b90bb89so5103082eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791885147; cv=none;
        d=google.com; s=arc-20260327;
        b=TPsq7W/5YA79L9wjEgqlSE+g+uNwMEV47XGv4UbusXT2mYCqxAjQwHuTZXmKoSiqVy
         aRwkdaDL7gTYSqW0TQ3UKWPYj5pBsBl9Ec/h49uxDfOmPi6FuyuUYN+refhP5i+5mHF0
         HQONSHJP8KEBLF2Ex2QgE5Rt1IrGrpY6VwFhRsB1FKqq2aRFX7uC2AuZJJcOI0K95egG
         pPUJPaAMdFSkEYPoEKBekxdh9nrMrB1CdEcQcU0Acbt2zc8MKom7RESeOFCHYGVELakG
         Gxr9SBKW1rPC84BgpumUWPxLW+SYNkF2I6swj9KMbnRt7+s3Q5qUHurmp11P1bTbueUJ
         TL1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        fh=QWPkssSJLW2WJRVWbI6QHiDEdcWt/j93It5LM9Hfq/M=;
        b=Xe/y9m9+738DHV/wA/UNytjhJW8PKIdN7v5LSKxF9rLiN7oqzGf2HijPUgbZnUlPmP
         w2fFb87QVPguAAkKX5Wr3upkg5jPV02RnAmwQyA0baqc1IRROsKCHcuEb1J60FHW/QdO
         nHtb1Z9bBsIs5NA8OkwU0I9cW1GpcE4PG+IAGSCAEpgZk+y6U12P3S9yxXZrdlBeVA6z
         cy54zTz0lm+b0QxUhwJNNQVRbeNWqW6ceg1Dcn9PUZeoS6gPNd69QjISHJLcnSV/wYNr
         q0K5IcHqKulhb0HvKHKhp4k4ou2TsaOflGzcpDoswtmiXcw3STARL0/36zTephaq9EO7
         kEpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791885147; x=1792489947; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=OUe1p8JsbeOEmdidmgAwZjuQYWObCln0UY6mN2eUEQlLo8RQwV3Wez4R6Toconn+2u
         SwPGP8b+GpqrAeyfYZLM692dVCl8k5vn4xCfNuGKRAfvfdLW4KGBVya1t4RWLKH6ELWD
         9A6WuTcdLUTdhNf/MuIce3PoimcZODZ0HtnvYu+7q5io1IQl6ksS99sdaHam2o+3ZYqL
         niW9YVjN+cw91gOGKi1XQJ3scIcybviJt/gxM/9I12iEZMz/64ksZfQ8QV7Zh7qg+gew
         8cSgZD1M0cXsfyOnBJpvjsn9WE/cAIIzU57mjE7HVw0PwvaLRqH0Jo+eujidbn8w+Y/Z
         fV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885147; x=1792489947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fhk+6Lyk+1hHxtsJDi3I/qbsbgY72hHWcOxDgEm1wgM=;
        b=1rEcHZBaWl61pd1M+5GCd1cN5tk8XhlQfbz+3jdvBMHTPPf9o2fLC5hX7GS3sznY24
         xnSR3XYPtF/PRy+TvrxO436uEW8CEzXUKgZQ0qPd/mVRf0zKGtn8JpUtJuGnm7UfvgDw
         oO7w6xV3MFA3An0Zmq5ctGRZq7HY6Xzdl6KY3OLFER2w3FWBM1URZ8UDOAHwUWfSd46N
         KJfs7CUpg9QieK+YNb2hTJn7Gz6TJEGqaUMbkdEFGl/fH0jIsCXT/F9UH3f6t79bvkkw
         yEqLInOQk3LzE0jBy5H9zhwmGbaGyEEYRvVMbkOKqZMXIHjkrfKu4HHvSrvmxaCfi8Pp
         d3rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwoSQWj07qoYug9FAOQuhk4q+tTa5TGrwiv6c7uGtl1tPdwMdyGqHy4MRiu8rNdbvHzvuEHtP80DHWUXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIbxPyHfI6zRd69QgCbZ/nm0ledVZ5TaI9aAebLnQMNdPbOks28
	Ec3RObFczVtC8+nB61aYUpx74W4lv7rdw+kpWTq19fkMmO3RUm6NojN4/82WD16UCay3xdcn/xI
	qPHKEywWXDTI64RR//CFdpcz+qGEVwu/waVOTyE39
X-Gm-Gg: AYBFou03aMPLaUl7WhfZRUihMR/ZR8tfNPtD3H5sN9lz3EwmkP1JYl1Kci42SI0Srgo
	nI7BrtfE1+3yRUfP17Y3Bjh5+Kzhx1v+ZB1PZHCi6DTlfEHpYk58ryC7Lvi30tYaf8R/uipM0N7
	OsvHjd+2ieTs8eGpgTsh5pao5tWZ4BFpNkO/HLBaRSuOGzw5hKn2yq2DtXJ4XynwCYNAQYw/p4N
	jt78lZK2E1olclJit5yiqWqI18J8L84OkmZHp8OmlhW4173D+IiradJm2Cmu8Dz7v1OV/Hrf3F/
	gVGmxnapGoPrmPAESl978zYwYAgsc04coz0h4oIqRQvY0gXzZG4vFhUBMr28Z9Uk8wtCg2mzinm
	Erk9NyIFooQ==
X-Received: by 2002:a05:7022:92c:b0:165:8e0c:1886 with SMTP id
 a92af1059eb24-16a610c9bedmr22542241c88.25.1791885146407; Tue, 13 Oct 2026
 02:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
In-Reply-To: <CAG_fn=Vx93UmT_Pp8F-JDeGM==UicNmMFEp3RW8+stzkm5+sbw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 13 Oct 2026 11:51:49 +0200
X-Gm-Features: AclHuK_xfsOoDi6wrmohki4XfQkFak1e3ZKbYQiASZjaKFsec73Ai0xMvJurni8
Message-ID: <CANpmjNOdnZw7kgjruLikbyPK2fqLgtndMdnX5osWtShP0Wh_UQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: rust: enable KCSAN support
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Tue, 13 Oct 2026 at 11:36, Alexander Potapenko <glider@google.com> wrote:
>
> > +ifdef CONFIG_HAVE_KCSAN_RUSTC
> > +# The minimum supported rustc's LLVM supports all of these options.
> > +rustc-param = -Cllvm-args=-$(1)
> > +kcsan-rustflags := -Zsanitizer=thread \
> > +       $(call rustc-param,tsan-compound-read-before-write=1) \
> > +       $(call rustc-param,tsan-distinguish-volatile=1)
>
> Do we also need -fno-optimize-sibling-calls here?

It's optional - I added it for Clang so that stack traces are always
complete. But rustc doesn't have an equivalent option (neither do some
of the hidden llvm options work). So this is the best we can do for
now. I might want to note it in the commit message, though.
