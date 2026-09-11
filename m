Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459F33E9C05
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117715; cv=pass; b=uMGe1EWW9EgaN/q3wgHzT0EEmtLTtqgsDqkwR+iV3qKl/kIC2dvCJOiAr9IWAc888m+omKoZ5YCATjqRSTEZBaVg2m6XuHR6hs/0C1OKab1pZw+UzFcEodgE8qgOKGWB3pxCAJ3RBOlzr+0y6d/herOiZ/mr7oZv0PDEThrf3l0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117715; c=relaxed/simple;
	bh=9AitBb1GHyxUD8itXAfWQrOndn4vr+DMbiE1kW67HMc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ibKZDplQCe13cibloq9Vuz8KjIw4/54fgsFqnsXCphj6LgfRaAGvHBIWhSTcbiPbYUsHNoVIAqZUpg2Nz6oIGbSEqK1UfzRgbJ9KFtKiuJkcRF2S8eUGaOATQ1k912SMJp4oIaVWaV3v15zIuS0oV4mnYnRFL+CaYFXVtcSNFL0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ntc0+0D2; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ntc0+0D2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4843e397f74so406027f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789117711; cv=none;
        d=google.com; s=arc-20260327;
        b=hHV8ulRwI6gG2K+bambOnW8F+DEeD0gt/FxlncioysnYhlryGHJYe0yRo+l+9x78lJ
         7Ue2XiBvQ/9hUQ2YOdMm+QT9BhM7Zlybesy0dVJsYdFoWqd4w0lbD2JFOasid7C2bEg8
         XZ5u3PRaPqocHrq/jnOiIAmcUfls06iMMveWrMj5w84bBs5TmfpY2NwoIaoGGLRwUl+p
         R4mvO34bu5p1XzPegAAmSkmr+MuxDBTtdKkNsTdUWiJo/CS66Ebdgz7cV3MILPuQe5gj
         W21F4jD2VuijJaAPBU8A5bkjuVuvl0OyAD/P3v6vY0A7raMjg0O1/m3EqKYkUzQ+f/ZW
         nwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        fh=31TJ3dE/gAyLcGTsYQxSBb0e9qc5fRc8KfI1iJSGzbI=;
        b=nm16zS9bSTiE0Ty4ERbgIjQcqgHqf/FsRugc4ygX6ToV17zdFu4n36EazwozO/w9MP
         arO4lWhOG3mQVTOW/kKGBdsV6YRX9p2T8BPZc8wmOyxRKUXZ0n/UGnaVQko4EHhWYcqN
         N8r5Aj7hmV3+shN0h8Vxzj1eCWoGejU5oF8lsWdDVFhbdYfITCJv8EzoAq0sN+nRkjn9
         4CT1/BRLKJqin2NPKIdeK3K4Izq17mc/FMPgDF30lEadoVqocaePHTDCAxsXo1geY+U8
         eEsRzP9zfZpIgu+/Xz1BdmolkNFyFSaUfpCnvkApptUztaL9+zAfUo/AZ5lGtJU6xDeY
         5k8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789117711; x=1789722511; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        b=Ntc0+0D23+YujkzMEy4eJ6nXRpHFOnm4AtVkxEhi5vnpCexhU7KW4PmGmKyNMt+kZa
         TPGlSB3IBPA9MiD4PQN6ttGdFWT2WqMR0/+bikrH32dyf3RHlyaDpdo24c0XMpHO5GJU
         lDTJahlTxAMonEnDUsydvsqrYYCX0kfnhBDCQrNCn+atyDFTDkDtjvAsv2M6xPLh4eMe
         a/AWqeYbYlOAESo9Wgc1GsNr33dNbudqVttD6Sl4VuL4rsbQ/aL6gINrZx4FRE2ZMT3U
         4K5dculSYJThgW463pZtuOMCZuRhxZHA32PPtyLFovJ2VLCOKrv7CixBauixl/iB/3rB
         IKCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789117711; x=1789722511;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V6E7xJ2vtTyuoasuWVTwqEDTbAd7Nywgb6H8W3xPYA=;
        b=ReMz6npHZmeQDZPzbX+8QjQd4If8/03SKqO1qdQNdw+1XX51r1mracSq0ZfrQa0OFe
         mVXFsIPTQtm1WBXU4oQlB2+pH5VYqxtNjODKDDgYSMD9yplOSKuv2Jkbz2c6PYS9UX54
         x+AMRX0761k9J2HC6OSFZ0FxbTexylUHBFeqkk08BkVPxiyf/fdGlZa4bU/5ezspMvpV
         BlgxVu9C/tGaCYziT6vBWIZasQJ4hnA1RldKTDhf3+7/tms80BXYdka7D/us1KWTiS1S
         lo5MJDWn1pZf+UManAbLzSlJamINK+FzcI00VmAD/lq7xZAdMWNLNaXeTe8V8zcx8OLf
         ol+Q==
X-Forwarded-Encrypted: i=1; AKwUvBynXKXj4KWbCD0bEGkmD8lOj8IzQsKC4xNc++nCMlhp1w/BlpLKWbIev0mx0PyDX1+7PlzUs9eHtL9XY0M=@vger.kernel.org
X-Gm-Message-State: AFuF++nqxbCUMd1TBxypFX4+i/fo0DfbmQgDjpk0RIob+gEn2srF7a4C
	2forkjw4VXDB9X4huSWjRsybyN0X3dEUL66wSXt3tn2pZsb/mdKUlslnwXUyY+4inJ3wdTzgDjK
	1NEgmNlaVwqC+I3N2xDCRu/+h5xMBCK+BB5LASlDZ
X-Gm-Gg: AYBFou3r7acQ7WumLn8n2YIAd9QiJL+IYJkz6ZTcXb0fkHXZKf3wZsXmiTkFGtAVWzs
	hAAEheeG0P/sUar+GkECJxSjax3aUAx3++xCY192bRYBLChOovk4ydVE9H4b84lOfT4HXmQTiyR
	UgTXa7LJOlfHXzyW0Ewdp+RNykQey0vdfN62EqM8pe4w2/Wov0Y6HE38qNzhdotzWQhGXUmspsU
	1r8ahmPZugxfE1VaUbidAMLJeayBE+bXxprL6vWVFqhQ8um+mceCQTiUF9+y008blHtO1ycuyc4
	v8uxqjtEoSmvFhZdkSDNtQ6QkSPy4zllGrxCjTvNldaD3trsVKq0we8nhLjRZ0wvP+kPwllDMlg
	KhHX3dAuinJtTa82kiRKZPjgNZPP2sjo2uNeHxKC1mekG1zaNRa13yAD+mz6h5BK+
X-Received: by 2002:a05:6000:46d0:b0:485:8226:c691 with SMTP id
 ffacd0b85a97d-486e0f6ce92mr8157059f8f.16.1789117710377; Fri, 11 Sep 2026
 02:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-4-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-4-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 11:08:18 +0200
X-Gm-Features: AcwNN1Wcpw91RcC64bgI4fLKPGdY59qIT8O1U-qjeWGvrNCV-tRUtkCYbazUk4w
Message-ID: <CAH5fLghUQW5urTfLCCDT4BhuqoFVoLUAG46TS-SxaS37bJcgWQ@mail.gmail.com>
Subject: Re: [PATCH v21 4/9] rust: rename `AlwaysRefCounted` to `RefCounted`.
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Oliver Mangold <oliver.mangold@pm.me>, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> From: Oliver Mangold <oliver.mangold@pm.me>
>
> There are types where it may both be reference counted in some cases and
> owned in others. In such cases, obtaining `ARef<T>` from `&T` would be
> unsound as it allows creation of `ARef<T>` copy from `&Owned<T>`.
>
> Therefore, we split `AlwaysRefCounted` into `RefCounted` (which `ARef<T>`
> would require) and a marker trait to indicate that the type is always
> reference counted (and not `Ownable`) so the `&T` -> `ARef<T>` conversion
> is possible.
>
> - Rename `AlwaysRefCounted` to `RefCounted`.
> - Add a new unsafe trait `AlwaysRefCounted`.
> - Implement the new trait `AlwaysRefCounted` for the newly renamed
>   `RefCounted` implementations. This leaves functionality of existing
>   implementers of `AlwaysRefCounted` intact.
>
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Oliver Mangold <oliver.mangold@pm.me>
> [ Andreas: Updated commit message and rebase on rust-next (7.2) ]
> Acked-by: Igor Korotin <igor.korotin.linux@gmail.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Assisted-by: LLM
> Co-developed-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This has a lot of safety comments of the form "This does not implement
Ownable, *therefore* it can implement AlwaysRefcounted". But I think
the safety comment should instead explain that it's okay to create an
ARef<_> from an &_ for this type. The fact that Ownable is not
implemented is not sufficient argument.

Alice
