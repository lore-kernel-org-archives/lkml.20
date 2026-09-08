Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED1E3D75AD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902000; cv=pass; b=TOEycQZI9QqDTDlDR6wrDZ0TQf9Nn68kONrj6aE61VyVEE/unOv/fM0HU3eldUCmjs8c2iTjnWifDkwqWcc7U9kBurLiI60+o1nXyd01llCDmDS5hn0V1K03PBHn0CWb3FEUIzQi0jEiesqz/D3vszpXzRDZbrvbtAz8WA3MSJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902000; c=relaxed/simple;
	bh=ABcg7txfjreOEvrgYloSz7dmSAX99sKg32JTqnOhFhM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG4oPeo+i/wdEa01HkpvOoMycK7a2yr+zEVBLETRc0XoEpEnLDRhsJhMgvmP8O1QdL6tpLYSKDaWBN04qcIZd2AKrbHokaMYwMvlL5K/rmjPd4EDqgyn+h6ak6kpxzP4L93roh61PEla1EvTJjKdqzFNeCElf3axe1LUJu3KXUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kPf6ZmPD; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kPf6ZmPD"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed443so1306118a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788901998; cv=none;
        d=google.com; s=arc-20260327;
        b=U4e9rqnXPNuxqP4oa8ObOfhLjGVJoq6Tvy2DWGX43rIXcpkqpfr2eOK0GjF7dcwQKp
         LEY0e/O1OLhzFprDeKC65AhKzOTC7Ur/r1cCCrkoQ7jdKtliA0pUmCAsVBNpKVpAIrlC
         5WnUWvfHYcgBRCUz6l3nbFQx+3B/E7B5X3aMjfkciCqsEuK3Ge43GQJzvh9F7QRO8GKk
         GdGGnkC5xmnLKyqxMa3mN6Grx/5Kl9+fYaqJJ0dzT0yf53ovQc27m80RY37ZQxTk+0K5
         aJNE0jenuvVStrEXsSvYQeL/+Zm3nWGq6iKU9BG4nFiF8uy/+yTRCcDSiARhoTsur2wP
         poxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        fh=Lz4/TLp1+AsGcoxDS9hytASWNSivdQvzTaIjxMJXMy8=;
        b=nYWq1JGe1e8JsJh0GPiEhE5hcpdAk/lL1RHO2yn7W3CMj6SBDKaGDfujSOrl5aw7pf
         /8UF9nfBpCuYM/mo1nKsGWpakPOb8mf6WPyrH4HDwGzsxsus3o08avmVQuGdZZu4DZXz
         Rnx0eGYpOEnCC7j8K0VQPkCWe494JWZmReP10gzMzQl0Rild7M4T4TAccVpyrTrI0lPg
         nUxKPhIcie32HtgtpLtewx6dFarJ3jc2dlej1yalVS2Fxet043aPl+E2VXa1E/ltBNS3
         JlM/CL1WFCz0Ih62icHgwW+aMgMhQGi9C5nfB6+2W1L+ek/xg/ySdrR0ocFaD5sG6Qni
         /72w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788901998; x=1789506798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=kPf6ZmPD2v4AefzfbB96CY/1Ro8ul1IcFijnGdxXVXzXHHTesc60tRNbKo2R6qNiCV
         COm6UKvfUu6Q7EJ03xDCsbtZZbD+boDtakiCuWcq39IiGKN4AWNMMaVstLpEFMUY9fs/
         fA3Ai9ETukyNfyw4rNxQfgzC3yRmNdwLUvg5cs5n0LI7BG+oMLyNjugmjmLMSwmDxeii
         iJ9ESmD+qArHzXwghsJnFKtjbvVeFcor+5i9UXIjBUduxGmJNTr6bn/S+Vu/qGuE5X55
         I4+dUgYq6dDOehzn331667NXRaNpuSHWvSLVHlvtNcNxcI1Le57wdyswdbpjKOR//hsO
         L2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788901998; x=1789506798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0fhQV0gw/THBej21ZRoleMpcrYInoRUuBgF9MHF69Ek=;
        b=mtFg1iB2rQpVklYCZZvuuOCTWcV+35IqIjeu/zIZq61vvVymjdgW5doLBcFJg2iu/u
         3EVimC5kka1EaamFbWlaAf8Py+IFleknwBv9rznJa00lPdJre70MVG0j9GjjZNLyfq0g
         o1CAnD3yrVswZGTp1RDBMBRREW3R/EgzxhHuaK0ZSOWEJ06HDDo6FHsCz8n5SFC0Myo8
         jyzgAyE/thxeNrR7tCA5oHDqfl6z68jAXH2wpcRUd0SWIdjOugLXMTOYIMvE0suhMds2
         s3tlk2pjQKiS8ghLuIP4fIBrmIyzwx7RIylN4QCK/tASQ5ZWTp9dgmGmct+5BcfWTii8
         +syg==
X-Forwarded-Encrypted: i=1; AKwUvByXwLV8dz7gFYfRrwArFz9vNCJJSYinz88jtxcDQ/g/dTh5r2P+zcG75SqpO45ONI3hVUpVnJG6tWTnAOo=@vger.kernel.org
X-Gm-Message-State: AFuF++kmyP3b3pL1HdPZjP35RXrhdcJjGyXNqPy0Dcw+vE/sG37tChXQ
	qoloKkeFAz8NiEnk/6KXH7HbaEcnXsBmnRKoYIRIT//jlc83eLDuiBQsdKVThsszskXwCIm27CB
	cLvFkgoeDgg9xbIiUsa+6Pi2+AmCXHtY=
X-Gm-Gg: AYBFou0npt51IuXUlobgLyZqS3Ao68TC/7WYxwanPEQOx9/+FpQypFroJ7/z23q1lVl
	gQ9+OQ6WGZIr8AqA9MQimFZoRQ8GXzcg7jxfMRv93DVFnfM5zP40gBPSWS6n/0L123KqauXEWhV
	B/jefxEWhNh9Lg42Wsi9hhtG91gvcH0Ov5rMKWA+aF5yOi8kxCaDQxX2atZFDKMGvZoOQ+Xl2eQ
	gSap2r/j/yeSXW/BSe9+0FROSbT+RS2la3r/z7iKAX5N+Jc+Tw41ShfY1AfGtVqQ0GYtS1a6yMM
	sL+FhjwJ+4PdDoWc5Wj9perDrajMLtZfOLj8iY87mEa0zXMgSOiUGomkGPjXHykIQpjCge3KDDo
	u0xPYLahjajRL5eYD6b7tllqbX4PerLvqI9VS9KCIrA9jvrnjkeqVkBWTlVg4kjCtu84tChHXT6
	s9zky4+Ka05eZJsaRfcIdJDNbmFEumRq90hBygFzPbgYRyptCnnj8=
X-Received: by 2002:a17:90b:3882:b0:396:a47f:d38f with SMTP id
 98e67ed59e1d1-39b268ce386mr30178901a91.3.1788901997757; Tue, 08 Sep 2026
 14:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org> <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
In-Reply-To: <20260908-build-speedup-v1-20-5dc1ac01672d@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 23:13:04 +0200
X-Gm-Features: AcwNN1U58TdOwuasMFef5tH_3N3xyJMe8mAu14nPZtzZCuWKC0n_7MgG3XQZVuw
Message-ID: <CANiq72m5C5tNKUWTYYerBt81KtqRLgr-S4c5XLUN1uY5n7mqiQ@mail.gmail.com>
Subject: Re: [PATCH 20/23] kbuild: rust: parallelise rustc front end
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 10:59=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> A future -j/--jobs option is planned for
> rustc:(rust-lang/compiler-team#1005), so check to see if this available a=
nd
> if so use it.

This is already implemented in nightly as far as I can tell. If it
weren't, we shouldn't add it, even if planned.

(By the way, could you please add Link tags for those URLs?)

> +config RUSTC_HAS_JOBS
> +       def_bool $(rustc-option,-j8)
> +
> +config RUSTC_HAS_ZTHREADS
> +       def_bool $(rustc-option,-Zthreads=3D8)

We can simplify using `RUSTC_VERSION` for these like we do elsewhere.

Cheers,
Miguel
