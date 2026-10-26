Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793058730;
	b=OlVkDjAjmiLMVX9OcBHIEIaKdQ+h2WGXZEQWZBs/79t9lWDtTgBiJ8S5gmso1s4Kvhfc
	 3u6v2tewq1E0F5QW7rGBP9zN+krfSdtsqEqqgGxkTA7MBX2TOEwzWlBBVg4aSFfhw+H0+
	 2cekOb3ppnW3YQkp7quDvzEwpFDbehxLSk+C0llXHWv5yMmLJNYFS51ksqJtiBwlVExQk
	 S+qcyVk2S4o2LlM9xRn53sZ1ZCO+DE6iHjCS7nZmCHKTKUNIWf/gfUeBO/P6PHnn8eOtC
	 CmJhaqP03zWZpejhXvEbFTxjEnHQkOlQvBlvw6vpsMnJqc5g00Tej4xnkzf6LDN//WQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793058730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
	b=j4Ria877XHKZfSBbrYiMxnK6buIqCmry/rRJCdqZODkYlKzTxiaGKltnyJsXZAjsB9HE
	 jNN5Jf7H+pfW51YAGhvvwVVmq0zWg4j+KRxe4yz1rrTmwgmlZn269FrWjdNwJ+WejpodT
	 Xyox1tu3qVpEs5pXA+thZCGwKCRF/8atEYPAVrN83s7t1qFf54v+sobmYq2lLy28QL2NH
	 TqFQlQYC5DIz8HwijcK93PKCrrAY/fmCYaqsp9571fma7H3HV2LfQHWGDQIpYECRn+vcI
	 bWv513tNNhrZahJ54/NmVsuEYuBlYESk3k9oqa7D/nH7OqHihqbBXVTi+4DlTmsJPJA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IrwijN25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C26606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:52:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C26606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=IrwijN25
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c34bff61551so525173566b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:52:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793058728; cv=none;
        d=google.com; s=arc-20260327;
        b=WeRC4khsX8RGPQIuk1JMwp5u0Wu/3X52F1iun2fNMHsLyqW5qfA20DYahuQvNPEbqC
         g5bbSX2vqMz33EIke/YzrE5ktHFpy3F9xR8amA4BZIBqzskLVFOj+StbZk3GKeN0ppCk
         lB+EZgqM72jfg7wIhYx2JsZSwmGR+kFTNR1QUKvcVw87UUDk0buglzOgxYJ8FoX3iZxB
         btuGJERWplrribdUkf+PDSC7U+BPTxsbO3hr3bZ7c2abjOAMUtfQFo8RKEKa2ZpaWYiK
         bNi/FDhPl4goULC5drY+Gjv1+61RwrQc0XSV4G5ABZ9orjwuX6duLqJfZJb5Drj+Ou04
         U7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
        fh=lvbkLSy3mxOxx56TgJmKaDaG+LWq67ykC6ALC2Z6OV0=;
        b=MiKKfv3503DQbRbU9G6pR6WO0mZgDnBwhA/BQxW3UHQssB1101y9n/NMg9WDw+2JXF
         s1F2motcvn3Rjvhji6fMOv41FFXoXGIk6JDaCLso6y5GYefeOEz/hwSO6JG1MQmP66gk
         +VDWBAeURcKUhS4aK60J779rDZBCwT5HlsXDtuibo1YVOTpw0nKc7CFH8mC/y4jlnxU2
         h9vP/THiRc/gKsp1jHqtKW4sPD3ttDp5oii52+zg2cjR8NKg0OxaHnaELocNtVf6RCYs
         +vaODIm/v5es1u8vPoP0rk3fs9OTOEKhbU/0tOFUdxh7iEJsbUqPHX9h6g0EC6NsySsC
         T2Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793058728; x=1793663528; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
        b=IrwijN25Y5XuhkNoEvpxTGUzu2F8Fw7yumOC6bQX+sv9sI5cIkUQ+8qDyW8Rn0leIE
         KD/M3UgHYaJH9qxw5QEzap4cvaO8QRp4WvUy/b8d8qlbP4zjT/NLwA46mVK4rk5TE67Z
         hbcIs7JRXy3S3BU1Zp46QexhDFTfTqhgb9F5yDiJoNepIvxVOAnGlUkvuMj53pVOulEq
         nY7AospiQUxyoh3b4b1zlSlhp0Xm7S9U0DWHUHqyywQpS6V9BxBGr6qPvm7+SL/x95K4
         vKS38fvl7h/D+VqUiNNcMPjyNlpB+LfGZlaoNjHo8oTsgp0eeolgiheQhrTjRg97kEV2
         ylBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793058728; x=1793663528;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wkDgiw/AqsIfVPHoMoSGYbq8gYoliaNoZ6zCaoCS6us=;
        b=YDKtmxTStGW8vlaJqoDPs/sQKEEmzZLV5gzVzca4Gj7iTMWJ46tCM6yzPjAtGaNHjL
         rxpUwIBMx6JqF2wy6kbaUo628Or8YTrB34OEzdsYzmmWGjrXPRThYWvvE6qrk7FUhzY5
         SvtnvFa8rr42v/PY98GkCw/WIenauYZKxipGRU1j0avN7etWpGTeibztAn7fdnF97R4D
         0ReFfoFE3nz3jQfN/GyYO3sLIiXGYRZASCxBnp4M5f9AyI7iWAiykOZ4wNKFT7MDHomB
         kFQL3UlKGZRxOAU/GaH1MmPJRW48NhCsQyArqslr0xk/9Pk1mfhGNa863DRrQLqgB7uY
         2kwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzToXekLxIg7UX2OrJVNuzcDYkQk2UO6belpH7Kt1AsiLVaGG8wT+xtw+wqxWc73LONS9mLvrLS+1efygs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSxPfDLEJ6G9uFfHLQgMdoCarAsyWAYLnP8WrXtNU5EfBdU9mr
	4yjQS1nDzhghwatTI3UC81yeg7QMMRSQlr/EkURNnKyK9m0sDGZCkKgYshBndM7gEWZFEUh99xL
	prQeifSJkjpWjP3Z+AjMz6F2VFEbL/LnYlpF4U5Ye
X-Gm-Gg: AYBFou23tG1IancWDQdjqR//jCAwbSI7Awlf0Y92MYY3Rn/91Og6xzcDkwdDej7rZaC
	SwwmvhurpFO6dpGqwzgEeaCy0l4/pqB5RlVpiaGmAIGX/kTIW7sCaKrhr+OJPxy0oqlZu/I0dqW
	753BGHWCvEhs2GOdonej2lLcV+7QlRVM3bxaTdn/MAWwiVnpLaANmPSQEqgrPibHPgJPILKUwhf
	zBgoWeljS9F2niX5Elyn/f/h9r8Bur3AdnT7Ll/9zGBUj5oqLxqj+Em3wyqlPv03HMLFo/e7N5H
	6L4/RBSrB1vnTpDSYTr6qFvUAPNU5gHleZs15MZS8vbOjYQXKA4vvoCGT1PBZmIpDhWwotSG5zG
	cASgnKObXJ1oCQDP1xnHRfbUSqNinTryHja4RsLqYrhikonf8jOUYtN2aeFJKkJZ1faAGTV0L3T
	DGEVEgSCBrEdSUQSXRK/Fm3je1Ls71yt+6qG4djA3JE5maR2BukvzY3R65bz/SazWkP32SDIQNm
	BzVqhSRkQ==
X-Received: by 2002:a17:907:80c:b0:c46:6a50:40c2 with SMTP id
 a640c23a62f3a-c46bdee2675mr943075666b.39.1793058727681; Mon, 26 Oct 2026
 16:52:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026215226.3713941-1-jthoughton@google.com>
 <20261026215226.3713941-11-jthoughton@google.com> <3b0a8fc4-d140-4a90-b810-cbc1283fc083@app.fastmail.com>
In-Reply-To: <3b0a8fc4-d140-4a90-b810-cbc1283fc083@app.fastmail.com>
From: James Houghton <jthoughton@google.com>
Date: Mon, 26 Oct 2026 16:51:31 -0700
X-Gm-Features: AclHuK-Nhf6TYTDNWSq0v6hReecRKBdo5ExoV8oZWGVCIO9BK-126Jv082Kq0QQ
Message-ID: <CADrL8HUZ3t8RdMEeBPfqsy1_1rN0Ty9B2c4iP6OzNS12te6vOg@mail.gmail.com>
Subject: Re: [RFC PATCH 10/10] uaccess: Move the NULL mm warning out of line
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Thomas Gleixner <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jim Mattson <jmattson@google.com>, Jens Axboe <axboe@kernel.dk>, 
	Pavel Begunkov <asml.silence@gmail.com>, 
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <mkp@kernel.org>, David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, linux-mm@kvack.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, io-uring@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-btrfs@vger.kernel.org, bpf@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2026 at 4:03=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Oct 26, 2026, at 22:52, James Houghton wrote:
> > uaccess_without_mm() is inlined into every user copy, including every
> > copy_{to,from}_user() call site on architectures that define
> > INLINE_COPY_USER, such as arm64. Each inlined WARN_ON_ONCE() adds its
> > own __bug_table entry.
> >
> > Keep the NULL current->mm check inline, but move the warning into a
> > single out-of-line, __cold function, uaccess_warn_without_mm().
> >
> > The trade-off is that only the first offending access in the system
> > warns, rather than the first one from each call site. The stack trace
> > still identifies the caller, and the access is refused either way.
> >
> > Compared to the base of this series, with defconfig + KVM:
> >
> >                      inline WARN_ON_ONCE()    out-of-line warning
> >   x86_64 total       +5,884 B (+0.014%)       +9,714 B (+0.023%)
> >   arm64  total      +40,948 B (+0.10%)       +24,609 B (+0.06%)
> >
> > On arm64, this removes the ~16 KB of __bug_table growth, while text
> > size is unchanged, as a call is the same size as the inline brk. On
> > x86_64, the call is larger than the inline ud2 and causes more .cold
> > splitting, so this is a slight regression.
> >
> > Signed-off-by: James Houghton <jthoughton@google.com>
> > ---
> > NOTE: This patch is included for reference only, to show the cost of th=
e
> >       inline warning.
>
> I would suspect that the growth is larger on architectures that
> don't implement __WARN_FLAGS() but rely on the generic WARN_ON().
>
> This would mainly affect 32-bit arm and mips machines, some of which
> are very memory limited, most of the 64-bit architectures have it.

Thanks, Arnd! I ran some build tests on 32-bit arm and mips:

arm (multi_v7_defconfig):
 - base: 31,913,726 B
 - patches 1-9: +64,816 B (+0.20%)
 - patches 1-10: +23,193 B (+0.07%)

mips (malta_defconfig):
 - base: 11,830,177 B
 - patches 1-9: +61,168 B (+0.52%)
 - patches 1-10: +25,881 B (+0.22%)

I think it makes sense to include patch 10 with these results; cutting
>50% of the size increase for arm and mips seems worth the trade-off
of only WARNing on the violating callstack. Let me know what you
think.

Is the increase even with patch 10 too much for mips or arm? I can add
a Kconfig in that case.
