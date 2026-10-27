Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116818;
	b=jxc34ni2mDEyzeVRTYOdU295mN0fj5URRJDhIdy144aMDjlFLCXEc0W4nZ8at4kDNXJr
	 oz2w7CZErU0Zlb2NgAcq/jf/sFULYYX/q5l6pColKwNuGF9LplqEfBX0HVvNVE2QSeCgo
	 urKgsgxflp6TVJ1cf/TqeZy2UJuQahVr+ncpQUrWqkBcN+6K4L54S/0RRf3sT9ld/FFyg
	 gC6DueTh1Cu1naCKDPZShr4dsafeZm/LeJ2RxcpSMWgk/x3C2mxDeXHsGCytIL0mH1pVm
	 ZMHdswLcDCwUCR3xhBvRzUrszw4hfM6IyxIkFl/k3m0QIKl2P+ytKqTTUTgdNTMaakg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116818;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SK1KyAR/m8q2BSUIu6RRqk/3tfKnAt2JrHGGMOonAwE=;
	b=rmMxehm6qt2dJbVDZT5bDTpLcvYWxNr6mwdhCG0OIXthPuwCbTEHxAM/i6Itojvl/hyU
	 WtAxzB+HnC8ySIIYNbFywHMUbW80nxdZsVXJP1J8gb/PUkcCky2/o8QH/jn/sdTiuavf5
	 1k+frBCm4ZoTTkKYD4s8r0lkhjNwQl5wsrj4ZXvF+bjslC1jcRe8CUQ+tBirDPK1153/c
	 5GNUoORO/WMDLw9acL+u9cT9JuZbE4hW8lOB+GPHXuwE0jZOZYFgB42GUG4gKe93MK+j1
	 XL9WhZVEZvZAQjPnKHZMmTNyzKO+6xyxc3lVEENDVvmSFlUUAU9lakh1dxzg5afH7AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SwBqzrYj;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA00606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDA00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=SwBqzrYj
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so25380895e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793116816; x=1793721616; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SK1KyAR/m8q2BSUIu6RRqk/3tfKnAt2JrHGGMOonAwE=;
        b=SwBqzrYjxCUOQLI3dpMiQiNcQIhRE741XB4WVOyItnBKkxRKd41JBYlg5gtl8rPUEw
         jrtAttyxWgwbJvIKLvIp8FMk81nDihzaObPQAB1X3CcqnL7IuRtMaVH2zNF0R6Z0F73X
         uL8q8qHySCkhHMy5GiScEkRgFvxKOr/JUCWDxPJqaWm38qcbgNIgbSXaa/oD8jFV1ksC
         7j2qFlPgd/Q4N/1Uxx9yKz7Jsl4TR/C11QAxJn9KU9jnurSH9qyaK3IRMIUwdxOFs3F6
         rIbzZMUvnEc+rt+zs6xou29Lp5+QfeuG0nqFaraCGX0UN0LdOZTSprm/chUyQLIh1q26
         ablA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116816; x=1793721616;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SK1KyAR/m8q2BSUIu6RRqk/3tfKnAt2JrHGGMOonAwE=;
        b=z1Cawtth4Y6hBNHBgkFWFBLIQ6kGVdsJiuPN6uM9F+haWeDtqkgwIa6LPlZOyIziUG
         h21Fm5GQh1c+y6z/oHTEDPH9kxG4ZNcYm0ipPaY3FMNO6hc3sEQrIg5ycpOuY2KCQHBR
         cB2olL6TS1pQyJOwLIu2ZS7OF471/Seaen3THddo+xwei9LzggRVMCnNRkScSm2IR7wM
         +VPHIZ07/nfxE4TQotVjbuS0jwYOrPNdiEUr9SVJxdP3BgoVv04IdgYgqUDstsrxV/BY
         Sr4ni+W224A10KLSGOgk8fDpISAaO/A9m9v5Z+cQ1D8gn8hjep47cnkWGD/ebD+BzHaD
         bIJw==
X-Gm-Message-State: AFq9FYIk09A/EL0oLCGugxYutRKU6Re2SpKaVDdi1GzadbsveGktLHWi
	5d2kNYnz5IpqCqJV5BciAIozNW9WfJ+9eqpHb1rsuoKq2Dnp0sR2iAsnr7yCqjmbdf8=
X-Gm-Gg: AYBFou0LRKI3dfEYRmLh/BnwqNSLwETZL7RkGGfyy83jYJvOQokNwbKdkYcfeVUuL44
	RjukIcRGLS8U3M2OERRSc+0Nrl5EnHL7MzznH5EnI3hQf+7FStRO5fR6L03aHmbRbrMKSrBQ6L/
	W6t72/7OUBvWbw4B+/uhc0qhcwGpzpoQFylYFuvMADa12nqBRF+K1Idfr1+V8010+ycUAYIWnVH
	bgIdlT0MXwxhoHPc4i3SSulPMbGDf3ML2AcYzmT91ZClluhH9bH55akJaelSE5CAmAFRMdu8aTW
	3NYs/+6igeF4HsZTwhGDfISFrLL/rGeCwjlhIkWuSmUacjwq09cLtZpg0rhQg74FZBkcfgV5oNA
	hNdG0/LGACkBHQQ3MIplnXXzCFJcuy2AW4vtY7fOTKqeUxPinHxmIq37zf1swgxyh4kqpP3asMK
	XGfdLrMqAT2xJRAJGl6J25l7TQNJyyTxZxl9zLUTGfxzg4uf7ftsdt+UtQGw+Fi3ZENXz5bdyh3
	joTVFoABnrzTBtpEiPRbae1z786gQAmKRq6JNSn4hs6d1mrHJMLR/Yg8Q==
X-Received: by 2002:a05:600c:46cd:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4a35ac388b5mr201567785e9.3.1793116816093;
        Tue, 27 Oct 2026 09:00:16 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a92afd54c2sm180645e9.5.2026.10.27.09.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 09:00:15 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:00:12 +0100
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
Subject: Re: [PATCH v5 2/2] kallsyms: Don't leak pointers for unresolved
 symbols
Message-ID: <auDKjGxSieq6WAmW@pathway.suse.cz>
References: <20261023-vsprintf_kallsym-v5-0-57ff92187c1d@linutronix.de>
 <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>
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
In-Reply-To: <20261023-vsprintf_kallsym-v5-2-57ff92187c1d@linutronix.de>

On Fri 2026-10-23 18:46:24, Sebastian Andrzej Siewior wrote:
> __sprint_symbol() is supposed to resolve the passed address to a symbol
> name. If the symbol can not be resolved it will print the actual pointer
> that was passed. The pointer policy is to not reveal actual pointer
> values.
> For post-mortem analysis the pointer in the backtrace shouldn't be
> relevant. In BUG(), WARN() and panic() related backtraces the PC
> register will contain the actual value. This affects passed pointers and
> callchain content since it is not part of the register dump.
> 
> Use %p for the hashed pointer output if the pointer has not been
> resolved.
> 
> --- a/kernel/kallsyms.c
> +++ b/kernel/kallsyms.c
> @@ -483,7 +483,7 @@ static int __sprint_symbol(char *buffer, unsigned long address,
>  	len = kallsyms_lookup_buildid(address, &size, &offset, &modname, &buildid,
>  				       buffer);
>  	if (!len)
> -		return sprintf(buffer, "0x%lx", address - symbol_offset);
> +		return sprintf(buffer, "0x%p", address - symbol_offset);

Both Sashiko and the intel test robot reports that this triggers:

   kernel/kallsyms.c: In function '__sprint_symbol':
>> kernel/kallsyms.c:486:44: warning: format '%p' expects argument of type 'void *', but argument 3 has type 'long unsigned int' [-Wformat=]
     486 |                 return sprintf(buffer, "0x%p", address - symbol_offset);
         |                                           ~^   ~~~~~~~~~~~~~~~~~~~~~~~
         |                                            |           |
         |                                            void *      long unsigned int
         |                                           %ld

So, it should be:

		return sprintf(buffer, "0x%p", (void *)(address - symbol_offset));

>  	offset -= symbol_offset;

Otherwise, it looks good to me. So, with the added cast:

Reviewed-by: Petr Mladek <pmladek@suse.com>

There is no need to send v6. I could fix this when pushing.
I am going to wait few more days for potential feedback.
I will queue it for 7.5 unless anyone complains in the meantime.

Best Regards,
Petr
