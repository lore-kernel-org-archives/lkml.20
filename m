Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794666590;
	b=bYx4xigvvy8MT9rAFfOw1f4kiJRCmJtkZGU2Ni/qfpk+/boEVRxfjfugadnLyi8rC2em
	 +41G4EEZ/Ny8nAfmMN35XsgoxEwmORdbCIkkdVDAcXw533cVaSf57NyrFctMpJymK2wF3
	 wKJ/LoOhaufoJ6Cxl11DpLUyLtcn/FVk8IY7pb/BqT0uUUcni2X5c/SiSFtHB2CMYnIEV
	 l5tyndCm+FGEy3puwS0cW1HZewprT93VPo7evX43e3C/w454JKT+fCPuaa2rTUJjB/G01
	 ma0eUr7edHuQMKS/3WoDSHzOctTuW6AfpcvyYBYeAREQWoj35WerNbWgJAyYAsL4hyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794666590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
	b=Fx82Zxvp3yHrc2ulxiSwCU00VPvhKf9/krkukux8owdqtTX0W2PX7W7xdrP41g3bIVi7
	 MlPWrYh29ZyGcWwmAeUt3HSNPiptZEWGXGQoUd5LVXbrB7dwQm2pY+wwFFq+bOMz21yFG
	 0N9kLb8HbDrGq65kP0Ie8m9u08ZaUIDhJxKHIqAp4rn6/M0dcog3MHRydk1L1+hBPBHJ0
	 KeT6PSmhe/SuN8lp85NQbYoXT7oUKYzunX5h/yRrhpSy0mEBt5UzH6Wec2gYE6nES+98I
	 3iWhGozTZjr/gwG3afqzkQ0dlsK+6F31v2RVOz8wv4vzD2FP/73MS25leDweKI56XKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpXUScZA;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB35606A33D
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB35606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HpXUScZA
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso5095415e9.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794666588; x=1795271388; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
        b=HpXUScZACECxG4WhYK9jGinw4ofm8bkHLlHgC0rBsHtIayapJcUt8XtJ9A4FyTa+0R
         b11ZZl2iA9Rt1NDyvpXbeIbx/vRd5ZvFj5w1jFmYZeMLRs9m5fVvDbY3vrjzhSfID396
         mOAkiNkyBVDYGyFsa/NpUbcwMPhaFxsa1fLW7EweVi5rQKuP7G4cM2ZTXVJdeTpTeBAD
         SRDgnS8P+coEsSP/TyqY71F+vuh57tkCCTVD0a4jCahViewn6GustfvWM28hVIWR8R2j
         nj0/m6qQQ/P474IGCzI1zcrvTFZEhdaRMpal5S55MO7kkJ3J/gu/oezSqKL6jJNz3bHr
         Chnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794666588; x=1795271388;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f7HvEUVX2tM63yR8jJepOym4Rh82WzMm5BKq2XP3tdo=;
        b=rNHh8hnzRyYOm7i7HMFDM4vCTdtLkZQWoEc2ohlVuN0OQfxVGKG7N13OvKooOukC3Q
         KVi8/0raibOixUDp9LCdnNl/MIl/cEA/aivmZo8UnRgofK+n7zYKXHwpLnyiWEu6V3G8
         NGFfsEQ/46wnkgnt/gSrULbb1nD3DuuAQDp0iQxUrEXiX1ieqIpHkEOe3jpAAXUAu2e0
         VOMXc9LPjlLswjS3Jz2okeGAgqtTWI9Dp2bm137+FIwbTfuM+rBPVJOOZ6RjwzXaVmJ5
         zb1PMmfvQeGpDR6ZIcIgV+UydXEq85PC4AJih3a9D8aZTobZVZFuCR9YCzTuc98p4I1u
         BD6g==
X-Forwarded-Encrypted: i=1; AL+hErHSY5YpvPRA/fnyl/cUcFHv2D2LYY3h5Sfqi9R0hXbkP5mFsDS6PkWaQTwJ+97J3/087C2YpINpsVo3/sM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cHJxEHE+PIU7mUxkiMqYIY+CCIWpEtV0khGdRw1E8IrJ8JkSv
	fKJ38utDD0gyk6ZOdFwbaf67C167j37yWJTgpCSjFOquteEMmIigH2aN
X-Gm-Gg: AYBFou2gcEOsXzIBwgql0ewo+tSvqC1u2zWyE/MQH2OPd5gi+w9BwR5y9J+y9yEWOHT
	MJNOAaP4pK1dJyE+Oz+MyY5ztIkag/LwFuwmhyvBpvPfc/+KQcZfRuS9lDPD5ydBSdZLoeoBi54
	xFjGx9QoqY2zIOGhsIfC+vTzM74/M48ogjjjANg8hFZRWrqmcsSJ2hy3jI5g65uorw4IDedSon6
	fbpUJu2wwBWVUCKvYBKrR6W7RTU9fRlR3PhFN1z6LQ7Aj3vKDthVmA0V01zKRVJVUysyw9bC/Ss
	C3YWr6vQfvtoXU2wQJSHQVK1fIrM/KE7MgMteeISwT3uCyHT53pvOcxKNM+6p7Pyse8UxbRppuD
	3OIC4Bpw0Dz/NtYly9zmgJ3PPD7uk482MwCMj5DiJsxiWd+8GGmU4hMKkj6d0SkpiKg2TN+VyDO
	o0PIya+1tSxqH7YJ1LlPRtHeQ0Szz/AN2tDuO/CBCBi4QFXdH3x8gMYopbdBKUxM6TaxF9kHb5n
	/g+5+Yu/8uPCxePbW7D+JxQ5kP+jiP1Ytifxi3L1bpRTrO3Cx3lXQq1iiYJBUmqPctRaXjLw+2w
	q49MB5urj75jS9EOWVcc8LctSVhuZW+L4BC0qlpJKAsI0xZ8lgGTleyw/2opqz9TEQ==
X-Received: by 2002:a05:600c:a0b:b0:4bb:685e:cc41 with SMTP id 5b1f17b1804b1-4bb685eccc8mr17988175e9.8.1794666587612;
        Sat, 14 Nov 2026 06:29:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f8d054sm92922965e9.3.2026.11.14.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 06:29:47 -0800 (PST)
Date: Sat, 14 Nov 2026 14:29:46 +0000
From: David Laight <david.laight.linux@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: pmladek@suse.com, kees@kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, jim.cromie@gmail.com,
 ljs@kernel.org, mcgrof@kernel.org, andrey.grodzovsky@crowdstrike.com,
 rostedt@goodmis.org, andrii@kernel.org, wusamuel@google.com,
 linux-kselftest@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@kernel.org, eddyz87@gmail.com, yonghong.song@linux.dev,
 mason@kernel.org, ihor.solodrai@linux.dev
Subject: Re: [PATCH v3 next 02/13] scripts/kallsyms: Improve error reporting
Message-ID: <20261114142946.4d696bc5@pumpkin>
In-Reply-To: <8c6f9e7d8a4cb037b480c22ba2b6866133292bbd68ebdc777e385373950b793f@mail.kernel.org>
References: <20261111115911.1142000-3-david.laight.linux@gmail.com>
	<8c6f9e7d8a4cb037b480c22ba2b6866133292bbd68ebdc777e385373950b793f@mail.kernel.org>
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

On Wed, 11 Nov 2026 23:33:55 +0000 (UTC)
bot+bpf-ci@kernel.org wrote:

> > scripts/kallsyms: Improve error reporting  
> 
> TL;DR:
> - Error message for failing to open the output file says "nin.out", likely a
>   typo for "out.bin"

Indeed - will fix (and in #4)

> - usage() text for --all-symbols may be inaccurate: it covers all sections,
>   not just local symbols

It'll do - needs to be terse and it's a build tool.

David

> 
> > diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
> > --- a/scripts/kallsyms.c
> > +++ b/scripts/kallsyms.c  
> 
> [ ... ]
> 
> > @@ -822,6 +824,25 @@ static void sort_symbols(void)
> >  	qsort(table, table_cnt, sizeof(table[0]), compare_symbols);
> >  }
> >  
> > +static void usage(void)
> > +{
> > +	fprintf(stderr,
> > +		"Usage: kallsyms [options] vmlinux out.bin > out.S\n"
> > +		"       kallsyms --sysmap=out.map vmlinux\n"
> > +		"           --all-symbols     Include all local symbols\n"  
> 
> This isn't a bug, but is this description of --all-symbols accurate?
> 
> In symbol_valid() the option only disables the text range filter:
> 
>     if (!all_symbols) {
>         ...
>         if (symbol_in_range(s, text_ranges,
>                             ARRAY_SIZE(text_ranges)) == 0)
>             return 0;
> 
> so symbols from the data, rodata and bss sections are included, global and
> local alike.  Local text symbols are already kept without the option.  This
> also matches the CONFIG_KALLSYMS_ALL help text, "symbols from all sections".
> 
> Would something like "Include symbols from all sections, not only text" be
> closer to what the code does?
> 
> [ ... ]
> 
> > @@ -845,49 +867,57 @@ int main(int argc, char **argv)  
> [ ... ]
> >  	out_bin_name = argv[optind + 1];
> >  	out_bin_file = fopen(out_bin_name, "w");
> > -	if (!out_bin_file) {
> > -		perror(out_bin_name);
> > -		exit(EXIT_FAILURE);
> > -	}
> > +	if (!out_bin_file)
> > +		err(EXIT_FAILURE, "failed to open nin.out file %s", out_bin_name);  
> 
> Is "nin.out" a typo here?  usage() and the close-time message in main(),
> 
>     errx(EXIT_FAILURE, "error writing out.bin file %s", out_bin_name);
> 
> both call this file "out.bin".
> 
> The string is changed later in the series by 317dc01f3774 ("scripts/kallsyms:
> make use of binary data output optional") to "failed to open bin.out file
> %s", which still differs from the "out.bin" used by usage() and the
> close-time message.
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/43116767394

