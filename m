Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E214BD0FB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770441; cv=pass; b=fjVRuNh5WVVBlJoaBd/6+7talZClJYHqexFvY9l9+5HOLCidtzggiUmpxt1tSRQESDTySjYVpANL4FwVfYDOr442yKtfOf9gCm371sgXla1sTnZzR1hlzRR40yicRstGApLYyMgizjviYZSnx3H8Eo3DQglgagfj9TtLUNw6z/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770441; c=relaxed/simple;
	bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UnFbV5keBCqUmwvPrFOhY+iGwWrURB9gC21jXjPS+GWqb2ZajqzPuoUCivLL7hJcT34SE14MwYLUJc4sVbbUlKT2vea1GoUzUZA3XN7tP2XiT4CBsCfGvU8SJDxOZri6I/BgUlBaUKP49PH/8pLm/w9bWXEDbk/QJ6Lkf3xBv+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lr6HBdvp; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lr6HBdvp"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34ba85727b6so143790eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 05:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790770439; cv=none;
        d=google.com; s=arc-20260327;
        b=VmANkPZNHubmobYsoHPbXxD2qnqB+wnWxzf7J5ahJtd5i+6KzONN5A+vbijUYQeD2f
         sW0b8qYzuIqfYrRUTmqgjUTY+tb2vEhpjP9PqvsuicH1r50ADWVhElaVtNwpd4lUaf9P
         ln7OGoGId9n3uni8OT2rjADYcILUvMEDxNN9X6pkGo1R34Hk6W1rbvhTuwZw6ypw/KnQ
         GqUX8KfDXYRjkWEGgThfet9P1KbnROOD7B6DtjM4jiHK11rheoksqE9Wo4upOPrKaZuq
         xxEC1S9Z6jvSPZ3SIeQJl0aDKPYxLp60ZxoJ6ZhF8jp1OwKSwvPZY7b8mCG/2ZSR7Naq
         9Ypg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
        fh=7RPkcbXKUrNftIBtPCM0DTxOe+cewq63YPl1dXkRdk4=;
        b=hZQm3ut8WIzaW/20dPSrnPpLLIabxz2larXORT/LOS953Ir7J2RYIRyRQEPYXCMd1M
         kM93k2BShrDcEjOo8lSZKN8gm4gcmT1ygC5PDSdXQrCPVTkj309Or/BEE6muSLMKGKrc
         p2LRjDPVNY7z4e0RcSt2N/WCbdFdFiYsdDe0k93XVlPfOliYBQtwnhr7W4kpG59NaAWu
         6dVhBV3NuFTvocqg554sykb4a8lCGrGAq48EPi0r4hs0Ak8VkbInGzus3Ftr1Qqa3QAF
         qgRKOrOMWC5qpdd9U+AoDP7Yrps9HW1BrwQ+lc5q95plx6gEEzbvxlPZTkQyUBeFdZeW
         9EUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790770439; x=1791375239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
        b=Lr6HBdvpcK5gG3UJ90OoWJqwkSP6ZlqHmdnYLL+cfa8QgrsMSWUTgBdya7bqYL/BE+
         TL0+0tKyL7s/C09bRHjxMhn4KGCtk0j/3MsLAuW2KD+imYKJTOYHBJPsFPje1/U/7fnj
         wTP9ARh4w1acgjLpMKbpP809VU6qXT8PU6vLSnQYI7m6GZ2iQnuRrEwVuevDYuQojgRQ
         JgdbG5xKOVKW86YoRYQdWHO+mC7Vct3h2YiYvL5Lx9Ukw/9ECCGRGqlSkKgQTGppYSy9
         Cl4MR4Y6q58tyC1Fqem2oh01WjE6UxPOr4ZzIq4QkauTDulcjkOUDDRjbiqLMSQYPYXs
         Mldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790770439; x=1791375239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2n4+UnejlqYn1u6OpHJx7OaKBKukorY5gDQh8E11BEI=;
        b=TsOk/jJjkquC+mFK6nqeWfrar58rbM/YknAEjAYMNsgMBhyyDjVHHbKx9HoSplfqrR
         w6kYdIDtE+n2dOMvBWZ5RXHWJgV+zNR1WWaY48xoZk/k7dfwNyGoY8D8ugIpCnUeMJcp
         5JepwlBmjUQB2LbAZLEcR0WIAI2Yx2wLAtv6Bf9twb7Y2TkZl840CAv5dysdwxI4GAtd
         574Rwu0VNFlVYGF3q3ffnBZQ+Nwvvxt47FVQ/tf7vRnMKe9kUk/c5CvzGrCORzdrc0IL
         ONi309hCk690q4f4NgAxFPcpR2bLx83TSpuAWwHZO1J0WKN0AeXvXzWC7UmXBPqju3Ne
         ASNA==
X-Forwarded-Encrypted: i=1; AKwUvBzr4LYvAhb185Ztu1TunWoTwJBVFwY64eho/yR+nBTQNu3DxC/TNJ3ZxP/YK/LbFp5FhREnKFAJFDuFYDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJqHxeOzWD3T/l1Wo/e6N5Ks52yro/sh5L1aVZiCMIZS9cWnCH5
	4LmIOXsl1vUb/mgGCrq8wgf88x4zpgw0nlob4AFar2pEFcgJZYdh5IQpgMCOvsm5Zf8AR90yYnm
	KUGtU6wAlQbX+sJFbrNyp70n9OSkTABs=
X-Gm-Gg: AYBFou3A4dJKpyrhMyyiAAYqfw3SpVLshI2Elnnqh0ccJOTNYbZjxWws4tOVsAatKj8
	+NuneJgNWsO8cUffyCOZ9gYabO1Qi3aeYzH9I6Hoi1XWMYx3N4T64znMdYd9ptOBTSs1EgW8ybO
	vaFZX27Ln3jEqGqRo8OU0CLpQdBdC2+ODnzyAjrVspsRHTR2tlHKUAb8jHNqiY8smz+STnQvJYs
	pwD0mjMg6rVHQhdBijTqOFHMunddTZNwjqe5CgAroDeg4qjf0vM3BzuHrzjeFxErfPRxGufBoEp
	+beFz9LGGnP1sSBTMFT/uuU8fAE2g0P0xR3SSDziwaCtPF0f4lBvId5dvEslVWvV+ZOGLhF91bm
	h/clTFg5OhTIXH6ZrcKHYeb1BdvL7kXs7S5RIiz7YS7iCr/2B80kgD8PmVdh/yQfZLPdT6dq6Je
	wo1yMqisPpMOBXWQYlBz6GNrL4yTtbol7Wi9UYo4ET2dHDlYuL/E8=
X-Received: by 2002:a05:7301:6192:10b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34cde6749bbmr2785844eec.1.1790770438477; Wed, 30 Sep 2026
 05:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917051147.98775-1-tweek@google.com>
In-Reply-To: <20260917051147.98775-1-tweek@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Sep 2026 14:13:45 +0200
X-Gm-Features: AclHuK-6adfLavzkp4ECmLqb4CW3_hXGJszcDPcphNHw_O5mw99JF2JHAArmZF8
Message-ID: <CANiq72nRLF7PmqqVUrAiw_M3dYZCr9ifoo+Q4SuXfBQsAFH-pQ@mail.gmail.com>
Subject: Re: [PATCH] rust: macros: allow non-ASCII characters in `authors`
To: =?UTF-8?Q?Thi=C3=A9baud_Weksteen?= <tweek@google.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	rust-for-linux@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:11=E2=80=AFAM Thi=C3=A9baud Weksteen <tweek@googl=
e.com> wrote:
>
> Module authors may have non-ASCII characters in their names. In C,
> `MODULE_AUTHOR` allows arbitrary string literals which are emitted as
> raw UTF-8 bytes into the `.modinfo` section, and multiple in-tree
> modules use non-ASCII author names.
>
> Originally, the single `author` field permitted arbitrary string literals
> including non-ASCII characters. When support for multiple authors was
> introduced in commit 38559da6afb2 ("rust: module: introduce `authors`
> key"), it reused the `expect_string_array` helper that had originally bee=
n
> added for module aliases. Because that helper enforced an ASCII check,
> `authors` inadvertently became restricted to ASCII-only string literals.
> Later, when the macro parsing was rewritten to use `syn` in commit
> c578ad703ae9 ("rust: macros: use `syn` to parse `module!` macro"), this
> restriction was carried over by using AsciiLitStr in `authors` type.
>
> Change the element type of `authors` in `ModuleInfo` from `AsciiLitStr`
> to `LitStr` so that UTF-8 author names are permitted.
>
> Fixes: 38559da6afb2 ("rust: module: introduce `authors` key")
> Signed-off-by: Thi=C3=A9baud Weksteen <tweek@google.com>

This looks good, thanks! We did discuss allowing non-ASCII long ago,
so this wasn't intentional.

Petr & modules: I can pick this on up (an Acked-by would be nice!),
unless you want to pick it.

By the way:

Cc: stable@vger.kernel.org

Cheers,
Miguel
