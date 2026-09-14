Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A740EB9C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789425466; cv=none; b=AAKtlJoESChKKWw923sPtqPs6CQYzM2AAgKcmYIrGvovFiBpsZAQjdOTc4hyww7cGxfNAEpS8CWbsaI4z9lOew+kz/EnZjXWDi9pNAg92DUKyOip2ESTJf1TyzreUKnzezdqVX2gnqSZeQWa8NqGfgUbCZJ6qpb8WEaHG74n3Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789425466; c=relaxed/simple;
	bh=3pbB/cdA2n+mw9ojxn7xAJ0JjyYJsv3yomOKFEBUOog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MzJSjz2FBXlBYsEaQMsF80B9qKmd7eTi0VXO9+WK2PURyUGWfs769FW2v5drxANgpMGY3UVAqEe/EIfMoDK2ujVEN+TeciF6yc0mINBennzv7Mdm5+f4aBi5Y5FlBBdzFDGaxYKYBHHcI/jH3IiW6VutpVxDctQD74+ibsfwg3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E03Pej5+; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E03Pej5+"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9984f9adcso5153021a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789425462; x=1790030262; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=E03Pej5+cQAoTi8JIKLRpw7p1srVYkCZ+L7ZWL/fZPlUa/35ofuljFZ1KfqZ56q/Ow
         blNyBQrGBwPI24EXSyHgotnpwIqxOSSksMPa+G/21UEeReuMCGv5cy+2diW7WIalEHg6
         FjeENhgVBh26gmbPLIKT9nQa25Xg9+3mWPY+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789425462; x=1790030262;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=doHeCbdvroV7mGBSmqv1XRXXxfYTXe+sNzLZzLwqdyM=;
        b=uED4L4RpdPWL1yLI4YdX4NDHK8yND0aWmrmByUsoj1eCT8Sy51hVTotQpklZrxp2r3
         w/cEQhzuT+GtJT/SqUWC63PRpLEogvYz0ZlaoPqYlGWD2s0pX2vWk3dJroGFkU7H+bmr
         DiGBwrJ419F/+ezU7KqyUixKyLgK+QSw5ousAkhZaqzsvyHjfDXScPdHF/eDV8vo2L8E
         ydSzwRox7BEyPy8fBOvibEtUtElbdq0eH2h0V4u5GJ8YFaaOlUg8Jzyu1hiMhKnpIqi5
         5zIJh3ygjFlnaLPg+/1i1O/JGx7D7s3PAZj/XOKiI+Wa32GxeoTdekm2pACCb6IrkUDQ
         gGoQ==
X-Forwarded-Encrypted: i=1; AKwUvByEWDmjovydxecA2VsKZemj7h1auieLqT4bczcvQaJn3b8U5MMckup7VpTHvOq5PVIFcwCuk1T4B3E8FEE=@vger.kernel.org
X-Gm-Message-State: AFuF++mU7C4froBDxK1hWR31wuouvyk3cRFpM5sxVrG/jbPAo/vBjsY1
	lVURt74lcp42HDXw/pCOF5F8ZlC8cLIars/1B6FjWs3Jvw+mObfowkiMDtK/2o0RW44AUruBQQA
	MoP6penG0lQ==
X-Gm-Gg: AYBFou1r2rY1cqJYi0jO7dVE1YqJYY9UmP0oeNzFqBzMsubPpKdP1W6RaJ2UaKMMJQK
	7/KMxT/044oXc8ybFAShoFCnlOn7O6iUuxcVQ/xKXVQtgB+WP8oCi4nd0l2B7qNuYSoBNT4lBjf
	o/yjiPx7OYAKpYQ4MzAHOQszcOJkOylrc9uXlYy60ieDEFEKwj94kiOU+zM82OreMJ6Ui2U6QKb
	zJD72bOZjqmvwPBrSS9lNzV43GNM5903wWVvhYtrgqFl+q+sMeL9o+ZnxZBXg1ZrX/dY0HcHP7b
	Ly0skRqzhw7t5rnrwW3+bGrOB68aQAgl6CjWxygqICikU5D4namr9de8Agblw9f9hzwfoMgDfKU
	4tWX4KiN64VB5sUBsGvbhjezIph7i9fbCxi1G2tXrytIbskyAB5srfmPEr4JI1tPZXy9sxxMbVP
	6WD8IElFouQNp/ZM72qkpHe8lrf0Meh54uXTczDM/E1AFve2JnrJ7f054EIypyYQCIU9KFF2yAM
	PQT5q4hgGf4ZWqZsGEl3uJ8MTuNHGOLXFjqEq6HbRe51wdg1A==
X-Received: by 2002:a05:6402:5419:b0:6a7:ea53:f624 with SMTP id 4fb4d7f45d1cf-6a9f63dfd17mr2881328a12.35.1789425462234;
        Mon, 14 Sep 2026 15:37:42 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b593d7dbsm4904271a12.22.2026.09.14.15.37.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 15:37:42 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c294496989aso460269566b.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:37:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxHh+n3sl3VR0yLDfZjv40XhQmLqav+fE0QMVBhAi1t1eJ8Oi0SW1PFE6U3J67u4w1SBGrl1TEplN7iE68=@vger.kernel.org
X-Received: by 2002:a17:907:97c9:b0:c29:4415:2ebb with SMTP id
 a640c23a62f3a-c29b860109bmr315536666b.8.1789425035842; Mon, 14 Sep 2026
 15:30:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-build-speedup-v2-0-39817ec5db23@kernel.org>
 <20260914-build-speedup-v2-15-39817ec5db23@kernel.org> <aqhLhVMkNzf_4oJw@jpoimboe>
 <CAHk-=wiB9MX7vBDQ+WHTUVfSYubLhR-PbABewscqTsxRhg-LbQ@mail.gmail.com> <aqhmhmgrnN3Mw8yG@jpoimboe>
In-Reply-To: <aqhmhmgrnN3Mw8yG@jpoimboe>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Sep 2026 15:30:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
X-Gm-Features: AcwNN1UnWAKTndckmaJ94decAtfrWRGA6P58dk0oXtHcS9ajgGc6O7ZKSXjYJOY
Message-ID: <CAHk-=wj3BKkCYtmfs5sORF_+Oumv2Gc8D+YxkMp9W2-mvLS=Ug@mail.gmail.com>
Subject: Re: [PATCH v2 15/21] objtool: cache relocations, do less work
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alexey Gladkov <legion@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 15:23, Josh Poimboeuf <jpoimboe@kernel.org> wrote:
>
> There might be more efficient ways to structure the considerable amount
> of data, like replacing "struct instruction" with "struct basic_block"
> or so, but it's hard to know whether that would be a net positive.

Yeah, I was thinking that you'd only hash instructions as you find
them if they are obvious "I need this instruction", and then try to
hash them *again* if they are branch targets (and just have a "already
hashed" flag).

That way random number instructions would not be on the hash - unless
they become branch targets.

And you wouldn't ever really have to track any complicated decisions
(like that whole "basic block" thing - I agree that it's painful,
because the shape of a basic block will change over time as you find
branch targets).

But not a big deal. More an idle thought brought on by that other
patch that changed the hash table size, and this discussion that was
talking about the hashing - or not hashing - of sections.

So more of a "if it is easy and straightforward" kind of thing.

             Linus
