Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793715064;
	b=uS9S6flwiRYDiUe59sF4DyUtGEoJZJYhgiTb1d7uLRGaQsdLy+2b7j6uu7kEGSpMSUqT
	 tgTEtFTgpXHKX+/9jyfWQOx6nq1nv5YaJgitJFraTa9GqszxqR6XRSzk1t6cH1N2X+PUA
	 CgPUbLrTiooLe5U4fGG2svgmMmx/I5RenBdgL11m8KGq1Sn5/yK92M7aWNMBg568CbGjU
	 nfr+Fr8T0+sYgk42kCOTk6GS0NBWvotGMDrJRK3uoYX92ahFJGismWNaFzwYg/Ab79IGL
	 k5uQYJ1IeaQTQUCfqBtfCO+ibfo2P2nSICNqSzkwhyGY82hguUWNQ15iGWPftISZdsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=ZenQCEo5AsVMWUXOpth4eQIpq69oE3D6EXJwyyUJZMc=;
	b=eWN+2QD/cP2MD4HIKxzPzHJ+u27dMVducAfv6QBSMjtUuacFsVnQspbcm0VrKeriHf79
	 J1fx/68PyKShuigvlpGbVCnpjReeDMaIpXZEgYlvGUDCvzG4FAqOTD1UJdP56ttovc1Wi
	 8pOAUa0G+AqQsaY1eOaPSDmaCMQjcN+7HA6vFJOB9UuaX6NxtIbd+Uycl+oTt/pJJ/avw
	 aAKeoZ6CMAX1fpOjgB1Uwd+jtbXTQL0bXVk19x10xyXUKHMcIQ3uXvnuP+dTLc1XD253F
	 EeGiHSTbTWwQYxIM35Gn8Zh06qPFiSc+5stSiVtL2l3ehmhNh8iNQJaJsMfvH1QojJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VAQn8dM5;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEEF606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:11:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FEEF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VAQn8dM5
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so35989965e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793715062; x=1794319862; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZenQCEo5AsVMWUXOpth4eQIpq69oE3D6EXJwyyUJZMc=;
        b=VAQn8dM5nSnW0NdbGGU4rdqxR42DExYanqkdDwJWwC5TS+xaesLbGXFiJN3ARYzx80
         un0Iz7VSigkaKDr3D4J6WtmfS2MxAsFBBFj7xk2NEHnIoB2rkJzYahnBjBvriUdiM+4v
         hTEkQYK/QHJ5Pyud3eiyr8H2V+1EDwicj3G/OSsbhDdxGu3fJP2eSl0H2rR8/tEe/Jxl
         E6NMM+rzXwHlcb1TpQi+CoSe9DkdS9rC0iKeZy26rxMVBTZdPLZX49q5/iVQH7OtlIRv
         jCD7KSakypUEn8Jzf3DtaJOpQwqnVXGG5sleDYByz1Filidc/6gAGj//U0aaIuyIosDJ
         W5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715062; x=1794319862;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZenQCEo5AsVMWUXOpth4eQIpq69oE3D6EXJwyyUJZMc=;
        b=R5Gl4Vc8Nd5rmZIDRoy1gYSi/6Isc2vQsCSdtf8EAMZIFLGU5w9Q4Cl8jmxzYA55aE
         3zlKnqZEcU1xbHgwjnpUb/Mj0L7dDlWWN/kH+ytsqyFPw6BaPYvlk5w8iJ/GN8+xculy
         ewBN6tecOwf3BgH9c0TB73yJIkeZqq+qRIX+8gFnbvNKckALmAbmdguBfvvmayaokxhf
         Ly27abGiol3vzILbGzG0czCe+6uYY5AZVtiff31hpB/fq/Cy8Y7nr3OG/b6z6k+pk1Gj
         Hy0ZsHykNRjXN9YByzDT937eLeh2H4hc6X4K8bhTKdJPc3dOcZ7RnIdmmTwCnCSCpWlV
         Y0Aw==
X-Gm-Message-State: APuU4Z+TZEga2mvyT+lPZyET9TBCxdtgQrhxXo1cWBLTWlYOfMDmBDwH
	XB4AzbLP9GAqDMOPufLhS+WeJHzDCLkym0PO8C0gfdpAJUt3ymsOzW73B968PjEvKWo=
X-Gm-Gg: AYBFou1dVowVkLRKPtcmKyI/DKCbm9c/SCxgfei4GNJeb+69TTsHZX6IkafPU2VzMq8
	CCJIPXmgANOnE/Ff0cIToz97ypzZYkuezCRTL+aLki2GLGhRILq3BZPurl3hSJaDwbwjf+zm7EO
	NVYFpXBXvgvK/9G0IXoFCnWeHviI40QBpUs3BRhm6+KvOvkFZZrdp1FmROrvqJz2HzRdFy2rm7R
	I6bLYu235jrrgQlK3+fSafn5eC4PmwBEfEsKxjT8HBvtkAHQouh4QnN+3dYy+YdoHs5raBWgpoK
	h4VZdSLr9nUjAuKTyCyDeb45yUjECeaGFtMmG4hKngDhefkkjUgXhZasO9QEA/LRK01cr+Kqtg5
	qpSVSZ1y4jVffyapDQU+BDEPDwj+N96ZEZYRlPU2xSIfQaXMz9DilYUk/ruF9+SeEk2YCIAMIhZ
	DmsH/EXIi+rG1ojBMb3iTaTCdkMbW12h9ogsNKX9Rm3UeTbSp+FfVCr4so/r8LS00+NrPljZKah
	fGJGeokWhP/cgSQuiz/wcimnvRivA1BYkwtLM1uiZYqIyG39HLQyG7Kim8jQjxnZizyWYtHBVTF
	KdraYu2fUy8oYV1CJIaKmmjyYWOhtUeAX1mb08Hk/RlT1VwqUNo=
X-Received: by 2002:a05:600c:3556:b0:4a7:6bc7:f778 with SMTP id 5b1f17b1804b1-4ac1932a355mr284608655e9.30.1793715062277;
        Tue, 03 Nov 2026 06:11:02 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm26842325f8f.34.2026.11.03.06.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:11:01 -0800 (PST)
Date: Tue, 3 Nov 2026 15:10:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH v5 0/2] vsprintf: Don't leak pointers
Message-ID: <aunrc5atzlyf0TM9@pathway.suse.cz>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>

On Fri 2026-10-23 18:46:22, Sebastian Andrzej Siewior wrote:
> It is possible to leak pointers via %ps without KALLSYMS enabled.
> With KALLSYMS pointers can be leaked if they can not be resolved.
> 
> The tiny series has two patches, one for each issue.
> I do follow the %p format instead of printing "(unknown)" since I care
> more about getting it out of the way than the actual content (as long as
> it is not the leaked pointer). Last time the discussion added the h:
> prefix to a hashed pointer to identify it as such. I would like to keep
> this part out of the series since there are few users that expect a
> certain pointer width and adding two extra characters would break that
> (we could strip the two 0 on 64bit but again, not related to this
> problem here).
> 
> v4…v5: https://patch.msgid.link/20261019-vsprintf_kallsym-v4-0-ffd3c012d00c@linutronix.de
>  - Use %p instead snprintf_default_pointer(). This might recurse back to
>    vsnprintf() if used by '%ps' but it already did so. Suggested by Petr
>    Mladek.
> 
> v3…v4: https://patch.msgid.link/20261015-vsprintf_kallsym-v3-0-c175c27f38b7@linutronix.de
>  - In symbol_string(), !CONFIG_KALLSYMS case, use the 'value' argument
>    instead 'ptr' to consider the '%pR' case. Noticed by lkp@intel.com.
>  - The kerneldoc for snprintf_default_pointer() must describe the 'len'
>    argument instead the not existing 'size'. Noticed by lkp@intel.com.
>  - sashiko noticed that the string isn't properly terminated if the
>    input buffer is too small.
> 
> v2…v3: https://lore.kernel.org/all/20260821152614.2202196-1-bigeasy@linutronix.de/
>  - Instead of "(unknown)" the hashed pointer is printed. This follows
>    the generic %p flow.
>  - In v2 I argued that it is better so print the actual pointer instead
>    hiding it for post-mortem analysis. After looking at some backtraces
>    with invalid pointers (not part of the kernel image) I realised the
>    the PC is already part of the register dump. There I changed it back
>    to what %p would do if it can't resolve a pointer. Again, following
>    %p flow so it can be overridden at boot.
> 
> v1…v2: https://lore.kernel.org/all/20260814144854.746840-1-bigeasy@linutronix.de/
>  - For %ps and !KALLSYMS no_hash_pointers is used to decide if the
>    pointer should be written or not. This aligns with the %p policy.
>  - For %ps and KALLSYMS, unresolved pointer continue to be leaked. It
>    has been pointed out it might be useful to see them in backtraces/
>    crashes if the return address became invalid.
> 
> ---
> Sebastian Andrzej Siewior (2):
>       vsprintf: Don't leak pointers for %ps without KALLSYMS enabled
>       kallsyms: Don't leak pointers for unresolved symbols
> 
>  kernel/kallsyms.c | 2 +-
>  lib/vsprintf.c    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

JFYI, the patchset has been committed into printk/linux.git,
branch for-7.5-vsprintf-kallsyms.

Best Regards,
Petr
