Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752676;
	b=qCdjnoK9GzKwhVEmACM++5J+L2U39H0Ic8RmpG45oHIFfjjqs7jI8XGll/wigvOXkZvI
	 x33VCzNlprdbCJ6YQyeqSKgqwa09WIs9OT5nOcQif03dihtS5MEuYMo/+6kBgl0nTYDsL
	 IJjpW26OyC8KUoRTcaceu7A62ocPnQglfpfXiHymqGbjmapTEgbYyVY8cb/3gU8ZQ0fLT
	 sr0Jp3ZmmZJq23IuqGP9FjhRjp6fKAHI5gHlg/VpRF+tO+FLPj0MgC5tHzpVwrvAHMo6b
	 Go6LRn+BnBYMuYRTYLt6glg8thtAUem4mEUcDYPI9w/4T9gnvJbAVRiPgpbCDKmzvUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
	b=sMfjdAsE/cpT+JhN2xIRicTHsbIVj/HrQzSmq/piKzePy79edyJeMJXWrhLBJfQ1aS5X
	 88d1N9YXST0/GSX+RSExSQIB0NyEngWMAv2HwW6tZ/ea9jbXpIr89G9YXCZtkRrow98xU
	 hvBQfPS4yWEfSIID/VrIZiReXNfgXzgFOxy9G3E/WaignG62SOY8I7oFxXevRUWwuXR7R
	 F7mKxx2uevapnoeAKgIN6HfgcRna93h4tgt7xoWyGdPuev7s+lvDck+KPH0InaWbvo7VI
	 2pezWXrl+uFJ2MeM6FoICAsf3fOQgCShBzjl0blv9ckIboafHhikCuqF8Xgh5Llve9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxVes4fN;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8F1606A8AB
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B8F1606A8AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxVes4fN
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so20251675e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794752674; x=1795357474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=jxVes4fNS9TSgGvlHsTT80+9II9XinvC4prossPItwxQmdIh/ly0jdC/cdyT55vVR6
         dxr87FlrY8HaEzKWL1k6AkuqQTejZzqNuP03IkWn/1QKMcHCGusJm7Uzh90VmKNatLHN
         /Ur+ln5v7C1S9XPfNu7fKUrI1pDdBwtHp9o72Tv8ddrZYc02/UP04z5Cj9qKvnMUiuBc
         AKlR1i85YUHuEqLhR+nPnOGxB8gyhi3BmtQiXq42P2XoLdScRFWDqb++9b0P9t/EHP1y
         PjbWv5kEkbF943EnXhorY4a6wJ2J69Bqn/WcjcubzUA5IRKt9NLekdoBKWqKwl/hWu6c
         NQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752674; x=1795357474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=NT6sleVFUslZZ43u0Hqu+sI3uCcUzz70OCDaOTdHA3gL62roWfZylle4dMMPNPZrt4
         ZEFCrZu7+ZESMC6mX7phcnRI4flomkXQ2+CxBgpsvQsrhIEpjwgmJUgD/UJKhFZuv6Dy
         1ol/z0ACDt6s5RoPhXIm9jyMYZEJFxryicOxwazQ1tqhVY3vpNDJfMPpsZDzAZx6BuW/
         wh6Hpu7eFpaq3m9zb0tFtfeNwhAHsPoERTxtdCKnr/ZQJbVXISd8e4Qvv7kTNLGlCcJN
         AwxyYlLnPyFL4omjxFYgyZlZ6+JueVli6Gl1uga9ivdr0FX865v1nwuzceppxXzDvs7a
         ejpw==
X-Forwarded-Encrypted: i=1; AL+hErFVry8WCuSfjrMvS4fVtM+9GjFD9rR4NjQiOFZzCPvL8dDp0V5OGa1ECCWJ1ev77rFwSXNUVxrvyKQ5aCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dKg3EhqxzudkGVhLV6JqrI0u0c+WWI8cyAOPFnbl93oRqDfhN
	jeRuGB1iExLTDu+mFQVkInX06nmdZf/57xLwvr0oFSpIrWlHaJDIHxlJ
X-Gm-Gg: AYBFou1AirtVBQr0/L5OCgaoBPNXyTj1aE+Nzb3I4vwiSvqgfyQuurY6s9VpRs1nAta
	iFmzuxsIyJLr2zWAoGUYvtQHtZUM6D8KlLEgaiu0i0iqw/S/JgW+dl5+p3nR28cTsjL0NEjSl8+
	FJOPWnWeNUmFA/ARako9WzgsxLLsNATaUC825S9YiVW8WUqfcPtKGiS/fsKV0HolVsGgF0fG824
	IbFNUFQRuZg6g7HiqtTqGlVpZX24KQo1jm1QNzJl0QMZqBGR91sV7P2Akb831wEXmbpIefQoMaU
	f8xKXCfjmuGJRsZHbfHOugjm4joMY47B5S4sIYRKnyavReEnybllMjcUWuJkXHTyyqVgesYhsuv
	1ajEKnu3RTS3p3FqYNTTAEdjz4JeT58BTyQG1NSka3ig9NNh+ZXikERciLNSKXOMjfGokxMO/Zf
	kPEhYxJFAD5fDnw/Fq43MzvWG4fWLJhIYIwi3Uji6rkPF0z3ibLpKla9h/If4SAA/vXT45r+SG5
	BcFpuXkBigzbYFB1GuRFcJc9Nd8BxYkqFrNPV9PWeDhe7BmlW9tqLOdcJazfPVKbbAq3XN6LVCZ
	RqjdpDrPXusqAbxPW2yW2zOisnIa9yEEipDj7YOSPbLZ0iE4r6xkMiEn2y+Inlf8yySdiIx9g2h
	IOptHNz64WS4=
X-Received: by 2002:a05:600c:c0c5:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4bb55a6602amr130912825e9.9.1794752673813;
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm318854915e9.15.2026.11.15.06.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Date: Sun, 15 Nov 2026 14:24:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 14:12:45 -0800
Samuel Wu <wusamuel@google.com> wrote:

> /proc/kallsyms is the primary interface for userspace to query the kernel
> symbol table. However, resolving even a handful of symbols or addresses
> requires reading and parsing the entire text file, which is often several
> megabytes and takes thousands of read() syscalls.

Separate from this, I've wondered about separating out the /proc/kallsyms
code from the code that actually handles the symbol table itself.
The two parts are pretty much separate.
IIRC it uses a static function to get the symbol type (which does most
of the work of getting the name - which it also wants) so it isn't
completely trivial.

I'm pretty sure all (well almost all) the changes will be lower down
the file than my changes and won't cause (hard) conflicts.

I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
in userspace for testing both, but had to cut the bottom off kallsyms.c
to get it to compile with a sane number of definitions.

David
