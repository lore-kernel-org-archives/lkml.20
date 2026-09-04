Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC620483BD4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524316; cv=pass; b=trjk6e0klKoz3kEQZ8sLCTGV+pogttNcjNh9yqEFO0qF9tKwU7UPcFcTfyE78Wf8tR4MNVeLF2DwEcl+u78YeviuuVxtXBRqjVYqUf6+gUzYlUMcDSkFjesBrxoNuDd3NatvpnYZmda0U99bHbeBZy9Ej9q6ojMrJnzmC2JwGVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524316; c=relaxed/simple;
	bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YwfkOQUR12yvr5tVC2QxmrkXwHbsNsyRi9xSRRq468GND/r9TNNin1nLBx1PYw2iGhUcvfSShEYeFdFNcg8OkYnCjxf/vgiAiN6VJQI2leb1EdxeYg5RS1lnacHhY+eoQeQVxIUA9B0KkTQTOYzhhgECAWwvh61uyztnhIJiHt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMNauiri; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMNauiri"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so108948a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:18:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788524313; cv=none;
        d=google.com; s=arc-20260327;
        b=swngQwdk9DuoRy2DRbKus8OAWwhVjEU61IziKHMchj7q8TK/SfGCUyuge8yCbbyE66
         jMkzG/Yj6YqnLk5Wuj5j02w3h338NEuuYV/EZ+gqjbZyXELRd/XUjf8gLO6tOXCq+tP5
         givAma2d10dxaqeGUNWAQz8RSbKTrbjSKOJJ/p2qAeZSuQSNR2L2UQJJF50Qkhqzouxk
         uANjp2KMKUHehaMHpr4vWYpR75cie37Pr7SAvEdqsh54QQYy/Ve7gHaQI7Qtp1SP6msM
         5z6cV6RCOhVDiAVdzEqaFxsdP3DWhG88Db/TdC0K0jgJ1K5+Z/O581NGMRFe+vd8LtwE
         saDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        fh=SQqhs5KObo/Qb6ZghMXAnZqZ6rXYrRFfH82ED5dS7Ms=;
        b=XLB+pFHWi7cwn1ZmGeMGcy5J2VmHdWHfW1RkrFZYclQa3Bmw/ZWq7HMtyAVFB0zl6C
         b7ak8MSng0tHFhk/S/AWcLJXndrRfZpk1jawdDqmzFGx9f8/IzXuiVE8sunICKG4alYw
         S1qzDi/0i5q0gXUARewLPUl8W/Pcvo8vLaT0KDeH9VukBX+ehmMrLX65H7e/3kCNpS35
         itD+se09q07oVBVMtrHQY5MQtwJ4OAPkataDMTcQtsPf07ZFHDLDaWgyCwoFxMNZ9MTr
         obIzC7yZwjyBcuDZTPpqC9Om50ZXFj/XIAdDQ6/jZDykniito5RsXZhFl1QpHQsNyOSk
         yLOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524313; x=1789129113; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=WMNauiripi6Md2Q3C3KkcuWrocOGGRafMxbYDlATW6HV68aOBusr3FL4eXVoF4vhsX
         DO7Jgfmeno5zhnwRWIgfHvrvUM+3XTG/xFulQb6uxqGbEytQPlf+GGxxMKD983IfwasK
         JZ8dP4XrZbEY8oiEzvYHXjbMf5wbZHBRAbESh+IxlSqcdT149S3ok0u273lxbuoHsZB5
         x3PySqQZGNcJbPkCUFb2OKLEFffWYo+K3UUed1DYlevwTlbFIAr1+u029uYrVRygQ4ml
         OkrtFQlxk0wYKPBPPf39rZeJx4CxE/88YUpd0GyCLyKaJbRs/qop3EUiAQiviishSpQw
         WkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524313; x=1789129113;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eO4W0pBpUA1VKwgA7pWUVcs1Sx0AhhcRANb40uA3yFU=;
        b=n+spYIwDToj5kaF7dUAxLFlQHdNzSSt/3yfqkq+ONwfhSUGwAOqRh8ZnFrj4eREAki
         dzUpEItUD+fmkCE6q/6HJ1IX5kZYk0LCHjivYWqLhZ/r9Pwj4dtswC2gLB86pe/97I/b
         xxZtsXeZpNKHFiTqN1g9Lz1+Ra1yBXhrlE4SCYZH4lb2JA62T6jwbBusrw8KGv1+mlI4
         QyhcJ+gt6wHgbBdETqlqaN2RKij6xtSDt3Yoa1T20VJPEdUem0cHX+mu4+mibxQhx0H0
         YZQbqbl1vf1qWxOe9xksB37inHC1XAhmTPdgBIu0w6QJ6qUTqu9LmcjG+4GRaiwmMTc3
         Umfw==
X-Forwarded-Encrypted: i=1; AKwUvBw0rc8PjrOrJqyaSv5IZ5gfZOuq/pCjZAfw7Zc1BuxWbS7NdmoZhpdTZNX/P6ZwwgqTmU1MIN5Wyyoeg7g=@vger.kernel.org
X-Gm-Message-State: AFuF++kjaaZZPkxdUwdNrcGhOLDEJL6hRck0vFAcVsPuOyZdBc2nn2wi
	AnWxbiWU4EdprDWH/m9v7XRXScKFS+jhhuMj77ZqbUoFyQ/gMShIKmpEvGEGEnZ7kCaI/DTVaB9
	po3BQL3XJy67pJVDh29P/iPJTKeh0M/o=
X-Gm-Gg: AYBFou0WZ9YMojhl+9Cz2dWDUHZTzJXD037Irir1eAvCuSdj/ICdcCHC3y8uT4t1SrA
	kA57l/V58omkrP2Ybix4zmQc6GpYJpmq1z+fC3NJnDHDzsW5Bq+SNKHeXlHzVvr8Xajv7AUdWmN
	J9F/hbVl0KnuKyjZfDlF5v/wDNI6t+AStUi2TzqNP44HVMPXxjj7LA0aRUkMPOqwfoMJKC6VJwY
	Z1Tt7Leo6c6HGhm8Guec+MQZZiAQakY8GsQwxzLI1C4D3O68b+Cn+7JVk1lSAdpKhF6HnEg7QLX
	3U58H5v6Hv1SXel8BsXXiteExGX4C6NDm+tAsrNg4wCnbz+1K/BrlvAZkniJekwWZC+ki+vvAvR
	Z+VJRQLrMOjK7wS0/Vc4f867009nxACRcd/TwDCmtzSpBvX/+agvF1X+GtpDP
X-Received: by 2002:a17:90b:5404:b0:396:d28e:b52 with SMTP id
 98e67ed59e1d1-39b26229b5dmr5722108a91.3.1788524312944; Fri, 04 Sep 2026
 05:18:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-b4-arm64-callops-kcfi-v1-0-ce6687739b0c@linux.dev> <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
In-Reply-To: <20260904-b4-arm64-callops-kcfi-v1-6-ce6687739b0c@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 14:18:19 +0200
X-Gm-Features: AcwNN1W-BJa7t0_HMwRoOS4jQPgmmEa3lTrRn_StsdokzqumkRB4EleU3vHebmI
Message-ID: <CANiq72kg3Z5rB28H4Ck+EzqQgiRSSowBMe3YW6p_iNwOG_dzWA@mail.gmail.com>
Subject: Re: [PATCH RFC 6/8] arm64: ftrace: Support CALL_OPS on kernels built
 with kCFI
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Leon Hwang <leon.hwang@linux.dev>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, live-patching@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
	linux-efi@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Ben Cressey <ben@cressey.dev>, "Florent Revest (Anthropic)" <florent.revest@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 3:20=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> Gate CALL_OPS under CFI on ARM64_CFI_PERMITS_CALL_OPS, which needs
> clang 21 or newer and RUST off. rustc has its own flag for the prefix
> NOPs and this patch does not pass it, so Rust functions would have no
> prefix and a different hash offset.

Why doesn't the patch pass the flag to `rustc`?

(Looking at later patches) Ah, is it because you defer it to the last patch=
?

Thanks!

Cheers,
Miguel
