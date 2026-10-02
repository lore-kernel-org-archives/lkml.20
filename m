Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D7385D61
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790974489; cv=pass; b=JNBqKENMegIADRnjMxU+PLTvpqs4m2LfgI0Ef2YQOzretRY/vKS97R7NCrifBCMJYoz2OMRlTuqlD7vcLhXfpjZBAAPgncoOazFYXA4kI8moAonuVn8ZF5/TF/9tZncAsZyWVM7uqBylFeV797NzxYH4y/RnJmnhAiwrWAFK5TE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790974489; c=relaxed/simple;
	bh=FPbM1GDy5LalmHteF34OI7jIXHHeFNiVKpeTr9QKEI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rv0w7IHYHbXjY0cLh2TJ6+bwAYAXx87lyV8zWxINY8bHpWIg0R4y7XXE2RuTZHYKxfcvGaGJGrI/Hr9D85GXAxDkiInzeVrM0c4R4S3lz+gki42usHuo1r16BaCTIWIH4gOnDCRykYxo5Vw6YZ68NIG0ZHO5Wk3NlLl6d5z1Uj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b9GCGsfN; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9GCGsfN"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b010e8c94so1283eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:54:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790974487; cv=none;
        d=google.com; s=arc-20260327;
        b=q2oq2N/64Ye4VJqWWYNS0PmPhtkjtBHw4TbqL8mere6R39uv3ccGeXMpJxwmKNa6uY
         Uxq27ef4zGwfvQG+vL9QaUrm86xirQ7FcsRXGn4JSc/1RL3uNf7EJrbnSqUgIJDgSbkF
         rwmND0aJDKAuVXRqbH6qG6lVUOnQaC3SQU1He7nSu9RB31EKZQ6b/JhACwoBq9aCHwjM
         lAuhRGeT34RV46Jv70LtfaL6F2WVuqjA5oM+2rcR6k6zoKspribYHTJGCQmosBNKHLUJ
         yNFGvyOHMj6UzjlYEedU/XY9VmpZr5/uC95b04nK+ONXLiZ27ShXMMNkUDMXzLCW11Os
         syvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qim/NL5w2hLnRP4b+wyeLHALC1NasDXWqntplgM4oTw=;
        fh=GLte0WxvavwfxDuwc2Psw9YqtgjBzit28HwarnmSFqk=;
        b=IplnD7bOu0L/a48zQTuLNS4eQi0GUo/W4uMggZtiVOt+KbkdG0VjiL/kAJ0ddP7bXb
         MWIzTffC9uidY01xpWzE6ysPSmxiMvDkFPcnqlbXDwwttvSKlYgotV5tN7tww3l4301L
         XftHjietebQg/Cc0PWiYcGWF9s6Nepn+7UN4f0KN6hi+IH39IWtJONDz5oHo/m43WsTw
         vVbF7v7qLW3d9ktPKOlT7YcVxuWGi1U0OilrdP40TmPV4zPy8nytlq+8oTKAcQPyuEZq
         1fOW4FDByDh6QPiA4BjZ3LQdtDvpfwvnnhkptO8M0U8wo5kvTDJ2sDp783dITMDb9Nu6
         gGQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790974487; x=1791579287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qim/NL5w2hLnRP4b+wyeLHALC1NasDXWqntplgM4oTw=;
        b=b9GCGsfN8ptSi6lIVdHTMjXIwv512M/JyosLVqfgikv5glQxBkeOMG9S/NzmH2i9ht
         75eZhIAq/D2vlEGU5pPfkXuYmu/AfJ0DkgazNsNhptU9IpHlFD4nyTQWQIC8N9jzBQAl
         U/SDoW915SEJ0+DZE9rLsrrNHRXfbgCj0bS0pG0SuwvU2T2JI6rKc74Q/dw9rvAtbst+
         woQWUct47aQHFySIObHGiGD4OGdjPeOYO9q1xanDJoOekaaj3Pst04vLaQhWXKvjx/xn
         SOI6yeIkdDZUr6jZRy17EriJbU3v1GHEK9kNsdgAt9zWFlvvnCjCZtIfK/zv1wthFOc7
         YorQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790974487; x=1791579287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qim/NL5w2hLnRP4b+wyeLHALC1NasDXWqntplgM4oTw=;
        b=QT2rrGbiqTqup9nI+HL+KZoVdWFpW6gVH9NVtIpUX6Fc1IkGPg5433g9yNW54zd/Ln
         N/Ngju9pMNOCTZKKJB4oySF2HOKXgzE7p7+sp/wTWz3P6IPXucyqfwmsrNFeeqDPEkAS
         FwH18QM5BEC9SRIPNyxVg7NOsAVdhf7T6tDNI1kNXYth6x+xrhWMvFlWMkSHjoX9YjVa
         5c+FMDenJUoWVf8JMLrIhp+GGVfaZIW1iCr5qJVXYvidMBt817Ssmtqs4bwIwyImRipF
         nypB3+bja2eo2MRQNJWduspac6rjVYnz7tiEAp9gmcHxlkrC1Tnge9NDH8r7uc1PiBvf
         faEw==
X-Forwarded-Encrypted: i=1; AKwUvBw3aHj2Azo/VZO72H1MhwCNgZUCuPdpDxp0F+axmW0skjmbEHSSybkyih8mPHrEZxJyu5ASOZ+2FKaTEH4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAuf2yb05Wx+SuqjhQSsxiJ5cIdyz//Q3z8H/jk0O7hYWhI2xY
	74mDGn8ebiEmDdTiY4Rc/tp9U6BVnnos0FWuWiCayqjM6SSfxIf0xgOt8+fMysoNhXli3YGjU6l
	c6v4LasuXtlF3PuRmEiSkD0wVmLunLz0=
X-Gm-Gg: AYBFou0xp9Z+IHDzbKPAEj2xiN3xFpq7FJH0FH/cCt6+Vzd49iUPdhS0QojNSrkhA/A
	4SXu8V7q94z3NTncqgudtkxJ9NYB7radYkvgwoY0aeh4h6cDFrN9yvMCgu0S3UUqGXFOezu/RGt
	HLpDMRtKKtdQcFZV1u2Xi6qTjRjehDNh0QWQJ2Dg3gBUHR3yflgGOVdVUhJWbKGOAUaYa282eC1
	pA9acZXrPGHc0RmBS1Pxy6d55rnJq4F0q9s/0vqsz9DjACx59eESeWxiQ+SQSlD8LUG93HERsPj
	IVnRPYoUW1VLyV2WW2/EGwMC9s5nsL2skpjjggXvexpUuPaqF1RAxBHuSAu28nhVXdhbsrLIXBV
	snJxnx5w2PjpbA0BBrCbsboa51srFlhoZZmUlrSfhnXEkVr7tIXHN8lGVdFO5AkJEYE5AavCgCm
	lVAVOw8MkIhTtXmKpUy+iGcttu/+df6WBsfOBbJGu9vwYPE3n+vb0=
X-Received: by 2002:a05:7301:9a83:b0:34c:f181:85e4 with SMTP id
 5a478bee46e88-34f14ffa69cmr6448829eec.1.1790974486869; Fri, 02 Oct 2026
 13:54:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-2-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-2-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 22:54:32 +0200
X-Gm-Features: AclHuK8p_mbjcQip1dbmQlFqSVa2-BCruxIttlWlGLaaUM11N16XqeSIiFk63iE
Message-ID: <CANiq72kCqfg_ZQdUD+dvxsKGfH52u2ydXQ-n8dK-0YzhiePeiQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] rust: sync: add const constructor for raw_spinlock_t
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> +// Explicitly list architectures where this logic is checked correct.
> +#[cfg(any(
> +    CONFIG_ARM,
> +    CONFIG_ARM64,
> +    CONFIG_LOONGARCH,
> +    CONFIG_PPC,
> +    CONFIG_RISCV,
> +    CONFIG_S390,
> +    CONFIG_X86,
> +))]

Sashiko is right, we need UML here to avoid a build error.

However, I think we should be specific, just in case, and thus use
`CONFIG_UML_X86` instead of `CONFIG_UML`, since this list is about
having checked that the logic is correct manually.

Cheers,
Miguel
