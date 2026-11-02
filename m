Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649764;
	b=Kb2PA2BW0w4gYZgZ1+ngSAD1xEoh5DOLeME0LLmqazUA9njycJ2Hgqk2zc44AKMXAqhp
	 VYlNTo5ASc98dmn5rHiIDBJtSYeDGxG9hsivKEpQQN+l9F9uqEUoLqLAqKcLNHz7vGLd3
	 FdrEkTqObkTj/sF8SMspk9woS1Tky36nhRe52I4jyANXD1v92Ll0Wei307v4ivUHAyXQA
	 9lhQjSxNDe2bdYwGNdf5CfjjVVzOwQreUmera8F29HUbpdwIpQunZ6s5/SmexpT6PPHhU
	 3iKjlV6uXc697PkV2rG3zzcSXbjYDRf8k5vKaSd9c9ayPa6RSBypBsbF/sXrrpdxpmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649764;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wMdjwUVp+dN9/hCIcq9xGMUpl6qc5IW+sxw5l5218JU=;
	b=t/sYAQhoJ0cPBzle2Ovd557D3XiqGzwp4cdogTHcXawOstxQSBhKGhlmvfoQgH5cNHvc
	 rhGnGeMyOS2P3bexiQxMmuqTO5KUeH9YnR1X5PfIjcRFeLhgLt0SqARz1xIXyLu1dfxlE
	 YUnyBN3H3z5O7lVsPzlJfCfuMAdjAf1wLXJ5fm3RfM9pc5eIDtRdJViSamsAFfXI6E+8f
	 xDsrg4QutEA4nS4pjM9PceTHyxnzcNshoAPjLLEg80800Qi9MjBU1m+hHhwOpcKzRKxHg
	 jgew9lsfWacxnxKGVsaTP7pw/EJOC8oXJrDmRpmVFHMKTLhPYnSfrci0c0nT1sXYQ9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WxXvWSoO;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232E1606A331
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:02:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 232E1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=WxXvWSoO
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4322d310e7so558550566b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793649761; x=1794254561; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMdjwUVp+dN9/hCIcq9xGMUpl6qc5IW+sxw5l5218JU=;
        b=WxXvWSoOqahUsjzdQFP2Py/9pZZXVA7AdrjOJnOipwsdEnHjIW7A+FHFNo+R6YvK7Q
         hUk2cG2ae6Ws1oeIXv20yb/IwgKoFPCdl3r5vgetnukJ1sOv2XbOKy8K9NMnNCt8WtQs
         b4zw/RV8MIzF7ds4ApU6mZL2u0XCED1zAXw5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649761; x=1794254561;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wMdjwUVp+dN9/hCIcq9xGMUpl6qc5IW+sxw5l5218JU=;
        b=KKuov0Lkhfujvsn+eP6EATdc7APNBAeeMEf8jvQ8G5sxnar8kmjLw0rzVq31W9vtiq
         me1hZKD5ryi8DrToZlU94/89B06fu3Yx8HSwjQ4+czVpeEoVRJv9EO7XiTegWTz92Y3k
         a/KtKIxWbgSoeM0jOVXKr/0vTf1hQT5gouHgqPsaUsY3x0WgZsxLU5CTHKvTAuiwfweo
         5d6A3kC69Vh3LCdxYCTCFt6CkMHvZydZC/Guo8aFaQL4P+4AMHyjlfZ/5cOdshIHQ/Ed
         fohvkrAfC9niREz6xYv7kXz0wBS63/6IljJ4Tif/gli6AusqYvRroiOOX7Z44MdTQRnN
         mz/w==
X-Forwarded-Encrypted: i=1; AKwUvBzuOdFvJC5icLYQgwoVIYuSfeKMBG8ohNArLAGHpDDh23bIs+rlDK1viSG0tK9ntyD7zfy0tPs2D9DAP3w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sPD27KndMiXvjLB7X4lnRS9vLHRAm7VPtoiYgITzSioZWGDyR
	wbuN5e34P9pAYIy5SVRwE+fwXAdoxgo8k2WJVp8UsNIUYqhDRbeWImnZ/9nehvpX7QMg596u0oP
	uFO+E51mb/w==
X-Gm-Gg: AYBFou2yhndnbg2SsWtv5JrR3O2PkD8pTuchlsynfeIDAQXlwIeusgOX53WVKdp/x6o
	uA6faB76xJt67MhiwSGSlhsjfZv6kZIJVI5/TXWaew94tDkMzLG9iA4zggSQDhbDyR1napQQqZ3
	4hefBtaVZfn2oKJimqj9455uIwV40n4CjoaA47Rh82jbjV3Ld4uXDwSf4tX8sgFtaEDeYo1Xpow
	1MzQL/khrsqxzB2tefjl1It0d0fi+LWhdye3kFmaWCtt60NAsHIcdLPSJgsNMmrDcBhPPBJOaCA
	bilAXnOWdUEQDs1DalJhnupzvjwOYQGQ1WlKRKZejZA4thQFD+SZV7+eLXbz5P+BI2oTYNRpyvU
	3g8g0shbFiD968oZ2wf/MEVS54hZ84MQnTLZdqrd9MmQC+iVdNxfyYteyH1Q6C6oJ6Z/1wtsSrt
	v/gdGPtuZmvQhEj8zTWxeyE/ZjVpt4oH35aJM5j1gDTB1xxKNRSt8xvm/5PpWM04RZtJoacO93R
	uFAm2dHRRwuVvU1Jbqj789GKgY1J7BCkG9Z82FyA6e+QqfdYe5vQpTruW6mUjKyLozoP1Jhn+Rw
	AG/3SMLbcqRgB+G9c5uuXf4yDDUuATyz+FaUlI18UVDG+lJko8YcvRXjKqR/zEzTyiTs5XQQfFP
	Glg==
X-Received: by 2002:a17:907:7212:b0:c2e:3f49:df04 with SMTP id a640c23a62f3a-c4ca793bcd1mr889107066b.1.1793649761436;
        Mon, 02 Nov 2026 12:02:41 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf3e6easm19818266b.57.2026.11.02.12.02.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 12:02:39 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4322d310e7so558542666b.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:02:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxcQYzMpMAw23D+FMPZ971Ud3U8QS8XtvL+V9rT7z1MRD90ALci66ME/GdgupAvSHxP72xEgy/6NNbagnM=@vger.kernel.org
X-Received: by 2002:a17:907:7212:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c4ca793bcd1mr889097566b.1.1793649759046; Mon, 02 Nov 2026
 12:02:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-syscall-table-dispatch-v1-1-bca9dbb886de@debian.org>
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net>
 <auM6mSXz-BVIjYBc@gmail.com> <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
 <aujZL2d08hMp7FK7@gmail.com>
In-Reply-To: <aujZL2d08hMp7FK7@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 12:02:22 -0800
X-Gmail-Original-Message-ID: <CAHk-=whTusHLshsm+9TXmrhVrrnKGe2v+7H+v2ts-3iKXz81-Q@mail.gmail.com>
X-Gm-Features: AclHuK8so_cX0Chmq8CoJqiKpip5709cIPe4kHMQDG4wgsRmhFrlietYcPQWT60
Message-ID: <CAHk-=whTusHLshsm+9TXmrhVrrnKGe2v+7H+v2ts-3iKXz81-Q@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
To: Breno Leitao <leitao@debian.org>
Cc: peterz@infradead.org, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 10:49, Breno Leitao <leitao@debian.org> wrote:
>
> I am looking at this on top of Peter's "x86: Harden syscall dispatch"
> series [1], and before spending more time on it, I would like to
> clarify how you see this suggestion fitting with Peter's series.
>
> Peter's patch 1 makes -fno-jump-tables unconditional on x86_64 and
> drops array_index_nospec() from the dispatch. Patch 4 then marks every
> syscall __noendbr, since dispatch is only direct calls.

So I'd just make this all a generated asm thing.

It would have to be done as asm, because I don't think gcc (of clang)
understand to use computed branches. They always generate table
lookups.

And doing the system calls as __noendbr is fine, because the resulting
code never does an indirect branch to the system call. The only
indirect branch would be that

      leaq table(%rax,%rax,4),%rax
      jmp *%rax

which does the computed jump (the "table" isn't a table of pointers,
it's just a table of 5-byte "jmp" instructions).

But *those* would have to be marked with endbr, I guess, so they don't
actually end up being 5-byte at all. I guess they'd be 9-byte
sequences ('endbr' is 4 bytes, no?).

So the actual sequence would have to be

      leaq table(%rax,%rax,8),%rax
      jmp *%rax

with that nasty generated sequence of 'endbr ; jmp syscallX' for the table.

           Linus
