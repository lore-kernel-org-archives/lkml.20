Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386595;
	b=eT+rpaZrhVryyYs0Wl9DHQcRK7lwvYjBRBvIl9yJPZ5O/C8SgY31WdMTsZfrr5kdOXws
	 GAUjBGAUkCukEsZG42jtbFMJ2C3QhWx7E/d2moFZ7UkxvJVD7Qmb/f2J5mdwyt7Ms3IeI
	 3kpCsWxnv71Kxl518Tmsk3hTjV4oux7ZLq7NSBXJyb/yyKwdMQsu6d9xwe9FO/oA1gsb7
	 Z1Dr4uFQxEUf6LNU34oNWkOoa69tbJsVBo3do0YSA6VuAqgDRGHjEUg2txfpPsW6FLS4h
	 5Me22qqCOhYu6fu6FK8HAu/vBalczdU65dsFZPkibAmgHv9o6XDu8G5qmOUikixviwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=qwJWwP3g6tAfkz/cEaB4qEA59hJRgAI++mvseIiCl4E=;
	b=El1ucSSm3OTVBpE3cQ8QKxbvCgVbVTxgPAhg3PM4KLi6c0CvT/8a/NOUW/onhu1D1mR6
	 S+7rdiAt9mOyx88srYFyeIcQSiedu2KWWcvd59/MGL/0czksM6KskSn5a3R3KgnNTZ5LT
	 isak6tys4IthwUZl0BS214dh4BFkYUDwTYS1TY4b1JWDDduA8VOQZQDwdu1HuFt5q/glJ
	 glU21kaKafNGvRrAVA9aDQ7uizMC9qoArt+ciucbY8T9Xx+rhBxFUZQdG5znu5szTsuzs
	 KNrAF1uLrFlK4Ip7iDa6sQaJYCH+KM3ezHheBbLncpJpHeKaFMKFv8ls9hN7sqIPu5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=E4LRcNlf;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD900606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:56:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD900606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=E4LRcNlf
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so168665566b.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793386592; x=1793991392; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwJWwP3g6tAfkz/cEaB4qEA59hJRgAI++mvseIiCl4E=;
        b=E4LRcNlfE2+52z5vPu+T7/wb58o9xN5u1++Y0JDwp6OvubvCx6kkoQJlczlFlzKTc6
         PD7PWjfd0zRkiI//43+AP4JUbAGNTt7jzs1EeMNhUqJLG6pf4Mb2aXVYf6rjyTSWFBVB
         q5YcX+fUbUqZ42yC6ius9Mw6FyfYb5N72BPYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386592; x=1793991392;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qwJWwP3g6tAfkz/cEaB4qEA59hJRgAI++mvseIiCl4E=;
        b=XprnaCyPohsgEXR6RI5b/fvAt/1ZbEJk0Zhew3OXSJBad4gGe2OjYCEq2s7p8eKpaG
         +lzuHBgpj5skBRcVyw/vxzoJg4wwhPrLTzwMvRZF2ZPJllc863wCXq3vzwf7cJZgqY9B
         KNkHO2xdw+JVgYmmUd3fPq3TeEOi5S5nRRDC+xDpfOBl2xtvL1C2Hcp+wz4rS0Lw6Ugq
         FxbIgezZCXpw0sitLX3yySQuFmAhQAxpakLsWBPPN/rrmAa1mkWQOJkzXSf3a28pC7ED
         WX2cUZDuU3Jp/wiXipleFXlLleBA9YxznGH036Q80jFdWc4GwWD3G1YAFBG/gKRl1ywz
         5/bg==
X-Forwarded-Encrypted: i=1; AKwUvByHmL5ijxVcapI++vcODBks08SrFDAajL913Ia8ukU7e+nzr94Mg1Ss4Tk66oR1ynfwX41dbT0NrtzmoVM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLI4ZKk1An1WamIbaI5IZqjQMj09PF4SHp44PYlFP9F901Jggbz
	UXgXOsnFcsz3M0Sqe8klShD02DVrp3/N05dYokfJb/ntSLpFH41/C2/EaShcAE9BE2LXwihCfBp
	MNty8Rk5+fQ==
X-Gm-Gg: AYBFou0le5KSlTqAZ6khj2JWW0+N6VhBQEFUWHomEUfEuV39OPCItfeaGOdFp8alrzF
	j9ONqBsfGoU0Wvh1DZE9HWGxWsvoTP0fhnBtvaVV0uhXOJli6/IH2sjwtS60N4FmI+uhAseXvY2
	qYlSiJG3L7TmqFPLXmIxF5wZX4pf9RGWlezgNBUrWPNIJ5A2IR8j9XEvKKzLHRzws5lljP3NjDD
	1tM+9cZeR5DheLm+ay6Hqx1rJGwtUx0sDcxuLMnH3Ri7YnX8OIZp+BloiYcTyh/hrRbFo8EwsQr
	qj6bODEBuCYAS2R9q54TJXc8kt91hN1QfnxJiimRV4g/cECGbcs7vdWXvxZFmfAokCUZHJ8O89I
	Veyi08RfuzZ/2jwFhD4bnk86ot4Z8XIwPuZG7boYm3IWRg6N9b8Yv3CbjZb3S00loWaRG6ZjCtg
	x3QDjGGacpA4+vuVvvuaBsIGMFFEQ+r7OK6NnxvL5i+F48K1LU9t63QFCa2osqH/Y3PADproWqK
	kza2eA9HefpAJ5yt8NhiT4YOfCPdMks0Ub+i39UwRNWLgjm5bDqFQ8ut633D//92L54GLlaXh3U
	oN2pd0fTzOq/pyidcxpFPlSmxkglOM+DRLvY7V39KOVOfU5+TEj9G98S3vxcdeNWdNekET9jjQs
	0gfM=
X-Received: by 2002:a17:906:99cd:b0:c46:50c6:f737 with SMTP id a640c23a62f3a-c4ca7a8459cmr296339166b.31.1793386591967;
        Fri, 30 Oct 2026 11:56:31 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm102435366b.4.2026.10.30.11.56.31
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 11:56:31 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4203bbb1e9so168663766b.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:56:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBybn8gMOHYVrNQqthjbLVbgFaW1QSMYdLe+lNukD+E48WwKwHsq6noSr/ULgm8oS4X8SMxUdkzizLAnjEk=@vger.kernel.org
X-Received: by 2002:a17:907:868a:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c4ca7a820acmr296788566b.30.1793386591702; Fri, 30 Oct 2026
 11:56:31 -0700 (PDT)
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
 <20261029104938.GC1813469@noisy.programming.kicks-ass.net> <auM6mSXz-BVIjYBc@gmail.com>
In-Reply-To: <auM6mSXz-BVIjYBc@gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Oct 2026 08:56:12 -1000
X-Gmail-Original-Message-ID: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
X-Gm-Features: AclHuK_EBJ3wPAnKsa-UdINhCLjKmdtp9kbTuYP5pivJG48qq7NWVv3lpi6gafk
Message-ID: <CAHk-=wjg-mre6diNHCTYUtc=X26462GGxgJMw8cE20Wh1-5qBQ@mail.gmail.com>
Subject: Re: [PATCH RFC] x86/syscall: Dispatch via sys_call_table when Spectre
 v2 and BHI are off
To: Breno Leitao <leitao@debian.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 02:30, Breno Leitao <leitao@debian.org> wrote:
>
> With "x86_64/entry: Unconditionally use -fno-jump-table", x64_sys_call()
> becomes a compare tree on every x86_64 build, so system call dispatch is
> the same whether the mitigations are disabled at boot or at build time,
> which is basically my end goal.

You're basically saying "with that patch, both cases do equally badly
whether disabled at boot or build time".

That's not a good end goal. You want both cases to do equally *well*.

I do wonder if we could do computed jumps. It would be lovely if we
could basically do something like

      # syscall number in %rax
      leaq table(%rax,%rax,4),%rax
      jmp *%rax
table:
     jmp syscall0
     jmp syscall1
     jmp syscall2
    ....

and avoid any indirect memory lookup or indirect branches (outside of
the one computed one). And no extra call/ret frame.

It's possible that the branch prediction hardware hates those kinds of
very dense jmp patterns, though. I don't know.

We could have a single static jump that picks between this one and the
"conditional branch tree" version, as in your patch at the beginning
of the thread.

             Linus
