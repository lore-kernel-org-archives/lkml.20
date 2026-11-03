Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704312;
	b=UtsWjY5I3H9Nl+czKwGAKXwQfKrEKe6u1sfn34Sbh+76JK9z5usfoR8wEKjJukrRYGMp
	 w1qf0aywI0sL5r1/NYIOpCJ5hS97X1yYT6hbPhxAE6YcQHpijzXGWPgJgTX/+K+h8xuml
	 03JgRFNFCFAtFXw0CrkB4pMlxxldsbd1S3+MVwv7VaS6ivnxyxqGWgwaRcXobfRGunt5y
	 6eSwP48noF0mlFUVXq8NM39BFRDamXxHDdZNXjxqE1RKncm8lr4W+I3eEdnfKChJDerNH
	 Zitz1EXRIX5OXmrc0WooXRmckS/PTKKAmUq9WsrhxuSKksYXL/fLcx+2ZYOyyoNHzuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DRSP5dNsS3mHl0mDMeYY/G8SJ9kad2UxpOHnBXBI684=;
	b=QFHO/eiRfUapS/6J/5r+kXVVZpOj3eQqcNRz8iPVs2DUZR7f31kPFJXmAp1t21L1oEPP
	 Ug4t61OWw6R/f8pqNtMZHEfl/HrZZYtx6v9PLj3Pk4fgAA/a0aqxwB8xChQQfY6c7asap
	 Ouhx4Pi3jGOa7xprO4PvztEI0MLMGS97pi0CmktKl2Y3G5zJ2uzTIkXRA6j1br1GB+YQC
	 CYwMLnMKlUVpE9zOG9Ub7Atwftb3Vh1D/mS3OWA1tFLp4uUcwiBIajywicqJjytVuxqZX
	 3YeuQk+VXFg7lKskXp7igN+qUL+V43Y1NC4ZyEmKCk5hcwDig3DuK2xqudIuh3YguUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VoneIZrI;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA18606BF9A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 11:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA18606BF9A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VoneIZrI
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso2748899f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 03:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793704310; x=1794309110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DRSP5dNsS3mHl0mDMeYY/G8SJ9kad2UxpOHnBXBI684=;
        b=VoneIZrIjqDgDNQeYh6sNuFncCLUEz4sf+KffVyKU9JPgoaAuPHSaQJ09adwOf//iX
         dvPKugxOP47c6kXcmwY5r0qNnfa1PcceKJqRdFG1U9/xtwkoanCLczpPiq9NZhE899qm
         nMxXQHZGzkH1p2y4RHJoqNYuTsnWSndOXkBTdPwCT5qg39EMRe8IZPdo3kzQwBQJCDcA
         3LfpVp6B5Ua4Z11wn3xESWu+CQgFscxaE1qWW/TT7qqd6/6bjqPDKYplAQ4kv4h1lv0R
         mJAd5YRbV2vczxRExpaYmpDM8Xf1A63Sezd1/uA8XBs0oWDOVh9UDqn/mwXh6NR8xiUZ
         2+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704310; x=1794309110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DRSP5dNsS3mHl0mDMeYY/G8SJ9kad2UxpOHnBXBI684=;
        b=OdRRQJMQ9Wa+1WhK+f4MMLK3GH3otpg2E+0BPi6yuJxUBItf4QAMavFdGq03haYH8D
         e3llgJr0ArJXL4YYcOuCx1p0HzHanJb63xW45zngWygqyBMYBvuzGCULVeo0CUTQ06k3
         t0+iYl5pbYtb73zaiWnLQbfferEDvT41xZTOykdriHmyQclhgpzxAxGcttTJ96L4xw7b
         ljYR6LdE3siFTm3wdBmeRV6F2ta5+UxYFkg13ruGpMKiaSiQChiniSkruYuvfIqnCc7/
         XuvOEUfn7+UsJtmV7z9/P+pYndEzZrRgA6XDfiTxeSOhij1yebLyifSmidvyDiSIuqcE
         qATQ==
X-Forwarded-Encrypted: i=1; AKwUvBzIphvgXtBZYWuRW7IeDEnjLVMbsLyaQZNiViovyBiVjqrlIswmplTFzqNTN0xAVArRum35k0gzjckuvV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YwV3q3V1t884JDmHGoeKqTLr1EnKw/GC+3sa9e9UdzQE/bpd/
	+XutoqGURcgyqeacAWWxsoDOYGgro8VhX5bozr/VrWD72HO/kooHyB/4QA+qmA1HouQ=
X-Gm-Gg: AYBFou2QSYVYOF/z5gih+bNYIfMrWIAJqVw+/B89rpajC1qasi9sOBv2WBY2Fv6UktY
	C209eAewhkfTDoFs80IQor5y3MVM268ucKMlGrUJvoQez5Ur3cQ9C7lpj/6W5f51x6FbfHPmA5N
	LAkSZg2RhMFT+gPVv/pgBvdjbKvcXzhLp10nYx0ickb1aUG9ObjLEm/lGaWVElz1SFEV3By0C43
	ZhT1o2ZsU/UqF61s3Bca6PiHi2elVrYlkXu0uwOJfGhmwJh2Y8XsqrYrzxjDsWYybFE7+ijcZw4
	MQyBVsW21Ik04sD0QX6HXP5vMwY3+lLfJUKFucjuzNI9Vxt30N3zN08GnF6e9/M3F9DPGxgh9zA
	3R7oJkL9gv/8AfEHO5x2rjLGSFZJd5CuSY2rlObcoqIaTT3TsUHaMuK0OrtHx6DcEBrgf3CkVEd
	8/rzxIDwZPTFV5zG+Oz+xSJVPCA1unEE9+QjG2XdKLsTQ/oxf73f2EtehRMmVuxS0m1aEADh0Gb
	454BGunWVaYOQtDQ9kA+D0YIqTIL1CTBxG/vJCyalW9wzAC01P+pyi78ZtHX4AZNITODMK8+JIS
	/KE1Y3nMKWD+1pCjOL7pPcxTDbAMWvf9Vvz0ss9ze+aUiHj/abY=
X-Received: by 2002:a05:6000:22c8:b0:48e:2c2f:59eb with SMTP id ffacd0b85a97d-48e6e303c74mr28712071f8f.12.1793704310107;
        Tue, 03 Nov 2026 03:11:50 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78c10sm24062838f8f.25.2026.11.03.03.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 03:11:49 -0800 (PST)
Date: Tue, 3 Nov 2026 12:11:47 +0100
From: Petr Mladek <pmladek@suse.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>, Naveen N Rao <naveen@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/3] probes: Use trace_printk() in probe handlers
Message-ID: <aunBcxXXNhXDd-U5@pathway.suse.cz>
References: <179360345418.115681.193455787480210412.stgit@devnote2>
 <20261102123408.0fb950bf@gandalf.local.home>
 <871p9251ve.fsf@jogness.linutronix.de>
 <undine-1793671566795563056-fb7169cffcc7ac3c@undined.local>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <undine-1793671566795563056-fb7169cffcc7ac3c@undined.local>

On Tue 2026-11-03 11:06:06, Masami Hiramatsu (Google) wrote:
> On Mon, 02 Nov 2026 23:07:41 +0106, John Ogness <john.ogness@linutronix.de> wrote:
> > [ Cc'ing Petr Mladek ]
> > 
> > On 2026-11-02, Steven Rostedt <rostedt@goodmis.org> wrote:
> > > [ Cc'ing John Ogness ]
> > 
> > Thanks.
> > 
> > >
> > > On Mon,  2 Nov 2026 16:10:54 +0900
> > > "Masami Hiramatsu (Google)" <mhiramat@kernel.org> wrote:
> > >> Here are patches to update the probe sample code to use trace_printk
> > >> instead of normal printk. Since the fprobe and kprobe/kretprobe handlers
> > >> can be called from somewhere where console is locked, using printk() is
> > >> basically unsafe. Only the unoptimized kprobe on x86 is safe because it
> > >> is ran with NMI context (in this case, the kernel uses printk_deferred()
> > >> automatically), but optimized kprobe/kretprobe/fprobe are not.
> > >
> > > I don't think printk() is unsafe in these situations anymore.
> > 
> > Since we still support legacy consoles, it is true that printk() is not
> > safe in these contexts when a legacy console is registered.
> > 
> > However, the printk_deferred() variant _is_ safe from any context. Once
> > we convert the legacy consoles (including boot consoles) to nbcon,
> > printk_deferred() can become printk() and still be safe from any
> > context.
> 
> Got it. But since printk_deferred() is not exposed to modules,
> these sample modules can not use it. (printk_deferred_enter/exit()
> are also not exposed.)

We could export it if it would be useful for kprobes...

> > It is misfortunate to add documentation saying printk() is not safe,
> > since the problem is converting the remaining legacy consoles. But we
> > can cleanup all such documentation later once the legacy consoles are
> > gone.
> 
> So, until it is done, this series is valid. Please let me know it.
> After that version, I can revert these.

I do not have strong opinion here.

It just looks to me that using trace_printk() everywhere is an
overkill. It is true that printk() is not safe when probing some
locations, e.g. where a console is locked. But these are locations
where you could not use printk() even in the probed code.

I believe that trace_printk() has a similar problem. You could
not use it inside the code used by trace_printk() because
it might cause an unbound recursion.

I agree that the scope of the code used by trace_printk() is
smaller than the code used by console drivers. Also it is better
located. And maybe, the recursion can be even detected and handled.

But still, the point is that even trace_printk() is not a 100%
safe cure. So, maybe, instead of proposing trace_printk() everywhere,
it might be enough to propose it only for probing the printk/console
related code. Well, I know that it involves also some less obvious
areas, for example, irq_work, some timer and scheduler code.

That said, I do not want to block this patchset. It is solving
some real problems...

Best Regards,
Petr
