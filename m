Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796964;
	b=Od4xd4008XXS90AYwOhygOUstBvMIavcg3IYZUwHihA3gLxgWGen9vwDg/bDxoZQgnxk
	 DLhbfEZh6vueYP+wnUGSWK1HqHfSdTVp4eHzy7iNdFSbL2T10tyt1TUZfMNhU5V0+jzTy
	 DhpX1Not5hThUAlqJxs2Z5v47zT6c25Ag+PsPKpfvd5cnqXrj8AwwiSD3yz3BMEKY+Raa
	 8tgH3jwOVg5ScWMA8QetuvGZr9lrwYz7Pqtb1ZGTOjrui04VLNGFJJ8yS3iXuNNDzWbVL
	 Da6+F3euwUj98tPjeveLekZlY/mk/ffZaJvWXwUsaCxjTsrFSF0X3T6Rt7mItmAcPZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uoEnPk2N+gQYitO597o0wAoH9pQBtCJ92lVVx6ToIg8=;
	b=myNwBkLgt2TpwfEi/y558xpS6hXBZlloCdCbNwwkcr0NvB3hTuVnmp8AYtd68wXxoMAd
	 I8J1V9xM/U4937ix6PIhplv6BFeg90Oo8shuGxwIgRmY2MWRrSQ2DMoVUQ970k0AwitSE
	 q1fB9gkeIqmZ+kFcxaarHp5dxA65hhMEEksk1+HSR84x3r9xhpr9B16DuXL9NcV5nQRi/
	 OCFHGb45pGWrfJl8B0z4U93pCTgv7VTePkXAMyO/6L4RFEft6javjAWwpYi0ZDaYLF1pn
	 kCpSTjCBINGsXOt2HYFA2YscSIxPDfWo+vS0MKewh98q97n9ZMioTU83l1hEPmqCbHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DSa6yHke;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8E7606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE8E7606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=DSa6yHke
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso5971755e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 04:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793796962; x=1794401762; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uoEnPk2N+gQYitO597o0wAoH9pQBtCJ92lVVx6ToIg8=;
        b=DSa6yHkeNR9PPBq0uk1/zLTAEp5DmGDJQ54MEVkb0VSd1t8cxoMwI2I4S2Kxi7dJzt
         NAWtDuJOmeVATpqHjZZlw6z9DKRxA2EYpi+tLQEZlipiWpxV2RLWBJsDbLkQLmmMG69m
         ZOnuCZHog6zwvXaxISNKpf9kQ8iVcAOzLvp0lcmXpJkejlHcSR2SAN4dGMAU7+4zei6W
         CpQ6j1mweoqSJwAqtToiJB8UgIFsiimRdjBJR/lY2j+h+dTxrnMhwZP293P9bJOv3S3c
         d0F5SC/vLcduK7oDMCERi8ztoodrKFHI/h+qpQwWN4XWdF4N/sgEdbePsIQy3S1I/JoB
         G18w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796962; x=1794401762;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoEnPk2N+gQYitO597o0wAoH9pQBtCJ92lVVx6ToIg8=;
        b=P0BGpI3DQS0ZQ4Yw2QqRho4ZoiIzpznvIhhc75I/hK0EoQ0pqY+r7+ayYW1rShJLA/
         kkgbmz7/Zwc1EgknQqvjh3NDSFz84tmeCvNiG7ttBP2JGVNRrw3reC6lv/tMDZeOAx57
         7nYk0fDCJfYdpZR83ZfRAFI8I2WhxkNp/mlOoXwz3OdymbNwAampBudAdvAuUPD2ieIg
         pL034lGvVGHC3iLpJ2LTunV8RQUjgG/BZeEeQole9YUN1sXrxusAeaFTLN/7crRnEPGf
         5q8Q3NpPfhF1oI7V1QC4AsHgrskzZM2gJPNXYDmiNF661QAUavJKUp6cfmQDGPkduaVh
         yypA==
X-Forwarded-Encrypted: i=1; AKwUvBxUhHJeBPT/5zBXh8JFPLMpsk3oHTEm2w8Je4u8e7C9MRl6FJGWxThEnabR/3VgASUF1uC3iTZzRfx189s=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jpQ0TM5fTWxMrj+mAa1sg5WFui8i6nre6sAwuHeefykhYHYtZ
	wuJI7w0awg/UQ0F+hmV+7H23gfVpo+e6mW59awZILRR7RX3bol4ybFo76nrGp9xWX4M=
X-Gm-Gg: AYBFou0x9e9KOkuOp6i3S3jDqe0Ew1Xlp5MmGHozVtFgv1CfHeQ4ZI8Opr7p9PDUwkn
	n6kvUIeTWvZ1BPH6u4RXYU4WvhNLpViMN2zz8dkn8zv4jA3RnKZ7//7GIl4apQCXbb07Tifhs8r
	3fRqVirF0PpxHorNaD0n0/ntNDh9N/+j/M/DpoIYfJYFGXYmiwEyaIHkg0m+7DLKEbSjRQ5zNbT
	ulglMbzfBP7k7QTXtpvk8z3976gERaQyCxD9vE8HZuHX8Nl2bt5mQxHpgW0az/LKw9EkpZaQOlz
	gbs89aGve4qOxhWeugxv402E8LXzJVpYym5ScZua5vrsfOQzu9066F27BqCqnzJvQtJh0O5Hi/N
	r9UW0lASQb3qlejslz1mYIH1Zv6ab2qPE//ahSowtuJStmr3gsNUM9OmaZGVr10a4ZzsUEpYRU3
	von6494PljrsEXiS5YFgVHkoLSP/axBgA2472skSm/N1ZQER2ShPn72p1HWBcYZAlB6sricCAKw
	g31t1vfiDN9fw/H50WeqZj4+yczdpAbVgHp2GqkU15dV5z3zFEN/RY6W2/FLXEn1qrgyynC6EnF
	5NscYyi19lbYBlnYeBoeaTcEB+6ammwQgAU/SU69HH0e
X-Received: by 2002:a05:600d:82ea:b0:4a1:cfa7:e968 with SMTP id 5b1f17b1804b1-4ac17ff9be8mr398405395e9.21.1793796962157;
        Wed, 04 Nov 2026 04:56:02 -0800 (PST)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43c17ecdasm77860605e9.5.2026.11.04.04.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:56:01 -0800 (PST)
Date: Wed, 4 Nov 2026 13:55:59 +0100
From: Petr Mladek <pmladek@suse.com>
To: Chris Down <chris@chrisdown.name>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 09/16] printk: Allow to override options via the
 command line
Message-ID: <ausrX9eLCY0WliRf@pathway.suse.cz>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-10-pmladek@suse.com>
 <auLyEcr_gqE3CBBi@chrisdown.name>
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
In-Reply-To: <auLyEcr_gqE3CBBi@chrisdown.name>

On Thu 2026-10-29 15:13:21, Chris Down wrote:
> Petr Mladek writes:
> >Consoles can be preferred either via the console= command line parameter
> >or by some platform specific code, e.g. SPCR, device tree.
> 
> On v4 I recall you said you would probably do the change in a separate series. 
> I think that is still the better plan: the rest of the series is a clean-up and 
> it would be nice to keep it that way.

Fair enough. I am going to remove this patch in v6. I'll send it
separately later.

> >-	 * Historically, the preferred options are stored only by the first
> >-	 * caller who prefers the particular console.
> >+	 * Allow to override options via the command line but always
> >+	 * prefer the Braille variant.
> > 	 */
> >-	if (is_new_entry) {
> >+	if (is_new_entry || brl_options ||
> >+	    (user_specified && !is_braille_console_preferred(pc))) {
> 
> This also clears options when the later console= has none, which v4 did not do. 
> That breaks at least the MIPS boards that pass the firmware baud rate from 
> setup_arch():
> 
>     arch/mips/sgi-ip22/ip22-setup.c: add_preferred_console("ttyS", n, dbaud)
>     arch/mips/sgi-ip32/ip32-setup.c: add_preferred_console("ttyS", n, dbaud)
>     arch/mips/sni/setup.c:           add_preferred_console("ttyS"/"ttySC", port, baud)
> 
> With "console=ttyS0" and no options, the drivers there (ip22zilog, 8250, 
> sccnxp) fall back to 9600, and anyone with the firmware set to another rate is 
> gonna have a bad time.
> 
> It also makes a bare "console=uart" after an SPCR "uart" entry oops because 
> univ8250_console_match() hands the now-NULL options to uart_parse_earlycon().
> 
> (A bare console=uart on its own already oopses in the base, so that part is an 
> older 8250 problem, but this patch adds a fun new way to get there.)

Thanks a lot for finding these probleamtic scenarious. I'll review
them before sending this change again.

> If you want to keep it here, could it at least only override when the command 
> line actually provides options?

I guess that it will be the way to go.

Best Regards,
Petr
