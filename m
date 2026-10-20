Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792516184;
	b=ZvIVYy/sLfK8KaWui9axGwU+Hgb2y4k2+RSwkXf6X5JXAzxATvXtPo8F36uJYKGoxr4z
	 plhU/RxUFiCLNWATZitqYP0JXaToBQxZeF8UvJTSmMRS63fF7P7N4yZMGXZcwQU1XUnvq
	 ELtLKuFPywxDDZtXvcu8L6VYjb3Bsz56UA7DMmZhb7kO57PpMkBxd5P3WhJ85/HiP1swV
	 fPaiFMeLfs3edjqFS30Q1ve5ucWBGOoZxy4XCfgaVUWTMvhe/LNThGAMP5LMr9seD1X9r
	 pfKDCnZeVXgeO4IWw/OcUzEIBYiCVW6w4XP7Y/BUQaeloyrh8NpBKmmSH12HtwmiQlQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
	b=If6Oi0ArHnkUCrq7/uPL/u7N/S84S7s0zMMMTsPwWHxdDh1Mcn6luga0r+h7TzAqlJ0d
	 RuN/KkJbRdeKBOuoZxKkQ0am7kXJ6GjeSGAWkwsy8jb0tZjc82Tib5dKtwFty5nHNJU+W
	 41FZv4qJQM8G+lIuss87v6aLWwRzUsvZFgOd8Is1TfWFsSAcExVnZ9XgydRSwwOUwxk4n
	 a4GVHC/9uoAePtoEQawfOexqOL1Zlodk6LHI+MGLgH3htavIOtN8kVLdldSAgsW/6e1/x
	 RcyRM6Uj+NvC+zMH8+nJ3+Y8eiJ32M3E+4BHLE37Jgm5j3TcaM0peQtMAxbcfpOb6ag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE977606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE977606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GgmF2Jax
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-34c522572bfso363795eec.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:09:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792516183; cv=none;
        d=google.com; s=arc-20260327;
        b=CF2vmdXUB/nv5aH3Xu8HOpoojLCFt/qH3rZZ1vqZ6M8WUlZVM1r1gXH+6iy9NUvk17
         st8uhleRejm/BLLU0D2arjVFN/arSivKbslnh72iMOSkHPE+6Oa6RgJzmpMTM1oIQKQV
         AF+1VGDk6kTysaWpWNbQgtFE9U6+tKbM9kxp8L6U6RQqFNU80V01LBUKPirxALyymzEh
         ZA0ps8O1VsBHV3TZ8otWrajtCYD7kpXanO6VLDGci7UJi+Yr2/wIXQumfdJruUrlbRfC
         qEB8Bao5o+hC3BioO+5nk18CKatODfqHQOGkhCW2JI7VMsYrhLzs07fZ0WvwHXeLkf6V
         /VFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        fh=0ixByX2AwqWnTK1cAh8yQzwQfRf7phKXHkNfBRpxvNE=;
        b=mfmc28AFzvSyPMM2utt6pM9lyRA619q6B4SNVpKzQTrr8XDAQeem6lma5j+erzVnwL
         IeGY7ARJ4uhxmdu4IEdUZ1tkU/2fXXNVLPs+JmwRI2AMuLTNC26tBpxwwYXzz9zMgBgt
         SCPJlPvavMthdt23hCIYDMvHbcjaVREq23O747CFruiAplD+Vn261LGmTHs4EEU4R+d4
         pZzm2xtkVovU8I59qC3FvK9I/tEvnAZrqC9CORfDE+PRqUcUgM8mYP+8RBrgh3EAXs0y
         syIBP947PftYZyWWCwyK0P8kOByvv4dd+INzmKTafp4KVyEcTyc1y6Z3KSD02AULB/QS
         aO5A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792516183; x=1793120983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=GgmF2JaxWihTIKDQ6w9Iw49mFFy5aK7i+arMpdqj1xFBZLC/BS6rk5OF/MK6uP3C5W
         Jm9AVWMUFJh71vwBZX3czhYiBhPmmlT5Kac9X/v+QcHpJQ8f9DqjtSVviuIYnrEbUEQN
         HrLBLhDBH6fz6JaVN/0P8fjbNrPFw2VkAC4oSASuN5StwnebufW+K5n02y4z1Brz8C2j
         Je7MfkrR4VD6tZWibyrGI9bieSv5thwGC5hCQFe3lz7lL1hplpRFHxXl1e6ZlXE0+nts
         pLDPKbetGl6E42S5j+URmNQBC5/Z5LZ9ilfOpLld+c9Fpb3jJggJWBhJRv1wg7lcyCL5
         xQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516183; x=1793120983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=spkmwlJKILqRb4PGHq7Zl5Tn2L8ar2nsCAiU2jBiAQA=;
        b=OtiTqJqRSjvef+o0n0JUuzZWIo3qwwmEAZeY63kYiWFKSdS8Kx5qiaary4QfRJtnUG
         m+ecalnHICML/RmWDVkNtoNzQQQFV69sJu2zHpy68G2UwqcXgzw2N4aP+cHMWUC8o6WS
         Xi2D5gI3TcgYg5qHhqK0mk4gDDut9Eo5D73ZiHFB5nXxI1KQ4F9GK5WxcgRJ9k/uT1MK
         EMVz0+SrAzMrMS6TFRISDzz3nVa1CEWK/aCX8RtfNPcxNCpnbikRmnNsgPaRvAQ51xgE
         oRYlH7JpxBUA4pTT8C0qrIRgK+BD7+DnXMsf8LwYrmyVlcjk9v3isRSLgV83m/rjwLJ/
         e7VQ==
X-Forwarded-Encrypted: i=1; AKwUvBywWauysvOTwFT4gcs0Kg5okmseTv0i+qNnuSF3li6a41kIehIQ3xkbUfV0WmRMCGF3QoLpsAgny8Rg5ng=@vger.kernel.org
X-Gm-Message-State: AFq9FYK9Ga9lEDaVgAyX8g1lcXqXuC6C+ee8AjlgymO8acoZo7+3kuDS
	wv5KZ50bhZPD+m0pgFk65xPDd47hsAdRwzcorQXfcZfriQFxLtGYi0MZYfQK7YPV9QizDIIJzB3
	QEcN613pSQs9jhRS+7ZbqOuLJhbJSuNQ=
X-Gm-Gg: AYBFou0fXkzF+fQlLfSRd9abXnQeHJav3bzVebe81FvM/HR8Gpk6WEhB9WkmGW43lsU
	g4H/cX3Mr+MvgZxVPhM2vkJchvHugCVyZDRzS3a1MYEOsRy55ofp0JZxs/iWcxJUaQ1tk8rt5xi
	4H4osqCI/0VN+jQ0V+k/WsMURlAOShb1yRG9kbL9Mh+y8PlykYsgVcAe7CCcd1020vINtMcKH3F
	pCumStzJtlNl593ZOxsX7P1FhmNfidOaHpsJ61lSHWEOBOAJUQ8arwFJVfL5AypeKEHQqh3rxzb
	QHypQh1ObK8JpfB3EDilL4Q9EpTeRdo9yrtuvDd9iM3qBlrcyo2+WYCliVJ8BH/PQXjM52xUieg
	MvRVbIWLb695xrR0X/lnfkdKxZnfzQfHkmBFHdrJL5Fuj63IO0hhujIHD9beIO8GxE2n7mUfnma
	HOdKRwGfmdUF+WZnt1DvuQZAmoNi2aRKeXfHmnGkxRQ5GUV+wU7GE=
X-Received: by 2002:a05:7301:da84:b0:358:7ed4:a049 with SMTP id
 5a478bee46e88-3619b212ef3mr24985185eec.0.1792516182799; Tue, 20 Oct 2026
 10:09:42 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015145714.3327543-1-elver@google.com> <DM8X51YCN6AA.1HV7J3R3PIYY9@garyguo.net>
 <CANpmjNPALPJQDZFfNAqo8v0eu_0uNvj+rJ5xqeC3ZZSvs9zQwA@mail.gmail.com>
 <CANiq72mCixHhc5tU6ueiJNEfE7yHXHXekhWDcvhFdfd414Q3yw@mail.gmail.com> <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
In-Reply-To: <CANpmjNNmnTMqxSJ_R+wYeAkFOxnJcUmwktNuG990GunjxhcvbQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Oct 2026 19:09:28 +0200
X-Gm-Features: AclHuK9D4Eg255wKZ2sPBwolmAnynFBIgoIfmMAgFcQGyxFl5TrsNoPPIa_966w
Message-ID: <CANiq72ns9P6gxOWmwL5VMAnAA8eASUjVUdSai3_iqXvM72mF=A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: rust: enable KCSAN support
To: Marco Elver <elver@google.com>
Cc: Gary Guo <gary@garyguo.net>, Alexander Potapenko <glider@google.com>, 
	Boqun Feng <boqun.feng@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Lorenzo Stoakes <ljs@kernel.org>, Yury Norov <ynorov@nvidia.com>, David Gow <david@davidgow.net>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Alvin Sun <alvin.sun@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Petr Mladek <pmladek@suse.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 12:34=E2=80=AFPM Marco Elver <elver@google.com> wro=
te:
>
> Happy to take it - but in the interest of avoiding conflicts, thought
> it might be better suited for the Rust (or Kbuild trees).

Same -- happy to take it too next cycle, whatever you prefer.

> Needs some -next time, too.
>
> If I don't hear otherwise, I'll pick it up later this week / next week.

Do you mean for this cycle? Linus may not like that, but up to you of cours=
e.

Cheers,
Miguel
