Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701344;
	b=aBb9d39hUQhWyy2nWqgr2QDoKikvQ5e8qS4djl5AkBpHqUvV2FaPgn+NYi5NstRtZ7Jr
	 P+1G20ucFHuhDL9ZFpJZuktqLtNmS1AD7Wq2u+wpFwvW51jxAPvMDS+Aoe+/mI6hg6J0A
	 rhUbqsSORPSZy1a2Mi8oEA0qTlgGJF6pkA7PmWOdeIh5mDuPZWKUZc603uQ8np8aUQWDH
	 GCxidHwzI55DnpBPTRMJnSOy/fk0nLRZgMA7Qo/WfpArDzKEddW97kScc4TkNGQad1rea
	 pGUSZtDyBWnc33PgzJCeQgsNBr9yxuSQJd8k3k7fNl1geWOVLSs3Ei27qHLAuKO6lNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701344;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=DqZqMfvTe48eJEbUcd/4xUuCBSBBnB7SwBcjX8d+fnw=;
	b=Mi2Mi9RBpM0GPe95+Oz8GCy0zsbLGMUF7ZB0kSp4qPI7U89aRAyKW4SWFfQnrJh1+X8j
	 LXSjHQ446ZVlzA964xjkhvX9OFgO0sYL+fOvlE/wjXN/gCUa/osTZINllgZhw2leCDTib
	 XxWRKa9tZz1wlvXaoKtj4ZO4218GRG6kvjbmuZN2UOZyDT9cXvLFSdFBxZuqit2of4374
	 QKzbzy5xgYQJ1IdiwwqYIegASfxfNnXR9vJn0nlF/kmPGPDUyITnztFmf1wsQ94ZyukNo
	 YScvwLfz+JndDaVPZhXT+xewhc6Ns0wLQjpWcmQaC0j2+OYtckpjTseM+axvffQruSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O+1ltU9v;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35759606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35759606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O+1ltU9v
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcb1e5f9so28152f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792701342; x=1793306142; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DqZqMfvTe48eJEbUcd/4xUuCBSBBnB7SwBcjX8d+fnw=;
        b=O+1ltU9v0JJX4ScoehkAqXJLKjsR9MGJrStOs+6Pn5sajjeuPvdJ1YtWg3hSqHgBHS
         GrAVYRhIHi55t+dNT2R3gUJHmN4wFyY6/MOWw1txLB1Zx3+Q5eU8M/k2vNKKvNWOEqqU
         kf5foTq7SK/u9TpZBvh4/zcW6GmIjaX7TMq/jbu4422oDePbFs1eJ9gZl9R0rmiBcl0g
         fxh+Vou1bT2HHegJbXvAvV8jOFh64KnWugDoy3sihPMXfR8/JULyr+gaXv7on3l3siBP
         yVzhcJIgZflN689d7U4B1G588nrYbtCKsmjBivWIDpYOF61nWi81QKUfUD68QZNo0pTC
         fVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792701342; x=1793306142;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DqZqMfvTe48eJEbUcd/4xUuCBSBBnB7SwBcjX8d+fnw=;
        b=aS0HdG41rrOfoLDRC9pqPtDEStAtfNo6qsCBDVKTZx+8UCnSGDYdIksUiNqzmTZIZf
         wzD1BbDRRl8t53CirqoMr+ERBGierr2fQTzs+SF6T32ANk6cxUXy+wjt6bEhlMWgTTst
         xB7EQpEVAsveSkQTQl2RltP0cQ2bNwZtxLKHk6kMzSpIZwR+2etsanrKbI5bJ9MHmuTZ
         XR3mwy51mEoOgOOjUasR4NTzSEPIBw9Y1VU1LUfyk14fFUT2rhN8gh4nU3NWGcnnqOH/
         rbTNCzMZsEuDuAnHCHWCS9PehOxKx+BsiGIwuB6LLT71WCCrUlUpQtkyGChfKpcHo1aS
         V3EA==
X-Forwarded-Encrypted: i=1; AKwUvBy+HtOpyUGmTuYtYj05tzWB5fzawF+gdtyRq7+p43qWssWz41pCdKb80EcZ5838ZxNSg1C2WiZWid0bUeg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIAn1gIoa86o2O4PMOzFnsIJuh7ldck7xuKrK63g69gnJYnGPSN
	IfannfEU5vXcChxSZwDX2o657ahuxK4sPaLMm/44fNaSq3oyBGdFYlhn
X-Gm-Gg: AYBFou3MqZXiSxjMsWjORZKNwPfaXLLJHs2XkRTQ/SKLlqVP5jkPjYBvBg/1CKyKiR3
	m/o/DgxtxBn2Pvnz73ItKMEZSlg5xheGbsB5vvwsX7YwGsOydV3GeOM4eZESUBNbk+eo1kjyKBY
	3/y06YdfYxJiXC31V/8QUPPRj+qNOcXW0YK2CmlhChBP0QP/4fWGSjKhWveAUY/CwLO+sTsCVz+
	jRF7pEdXC0jzaOgxJoJQBpwF6LV/vM6y1U//mZKGj0iHMNzgrLpaY0EEtHeMdu+oNeeuuAN3Xuf
	mEjc5yKtxUdnXbsdEP1jSALcRhPos1TwAGpnOFM6eoKXLlmQPUClGTnKj46I7/Rref0Y/Aua52a
	hhTSCgCmdLzdJ94RlBvXg341XwUAh5XVvrAtqs5FDSjsMumYU+35OzJNcXKyh6o4pY1Fiqxb9hk
	EQlJloBtRG8CyQ51oeVBVZq0PBTZdwiXHDqVetE7Dy215Swvpl3uKPse1iBLxBM/oGFw3BslFml
	KN2jbyrEwNgEAf6kye6ruCUpB7RTmIGovEsDQ==
X-Received: by 2002:a05:6000:2903:b0:48a:f5c5:d077 with SMTP id ffacd0b85a97d-48e38557d49mr34136f8f.2.1792701342272;
        Thu, 22 Oct 2026 13:35:42 -0700 (PDT)
Received: from localhost ([2620:10d:c092:500::6:e7ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025e0esm339111f8f.11.2026.10.22.13.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:35:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic
 reboot
From: Gustavo Luiz Duarte <gustavold@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 John Ogness <john.ogness@linutronix.de>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
In-Reply-To: <aqqU3I7d9lMAjSvy@pathway.suse.cz>
References: <20260915100140.3631650-1-ryan.roberts@arm.com>
 <aqqU3I7d9lMAjSvy@pathway.suse.cz>
Date: Thu, 22 Oct 2026 21:35:35 +0100
Message-Id: <179270133563.1870306.14879054140316608291.b4-reply@b4>
X-Mailer: b4 0.15.2

On 2026-09-16 15:08:44+02:00, Petr Mladek wrote:
> On Tue 2026-09-15 11:01:38, Ryan Roberts wrote:
> 
> > Netconsole registers with CON_NBCON_ATOMIC_UNSAFE, so its write_atomic()
> > callback is only usable during nbcon_atomic_flush_unsafe(). Previously
> > this was only called by vpanic() if panic_timeout=0 - i.e. if the system
> > was configured not to reboot on panic. So if the system was configured
> > to reboot on panic, netconsole would never receive the panic logs.
> > 
> > Move vpanic()'s emergency_restart() call to after the call to
> > nbcon_atomic_flush_unsafe() to solve this problem. The downside is that
> > potentially unsafe operations are now performed prior to
> > emergency_restart() which could theoretically reduce the chances of the
> > restart succeeding. But we are already in a panic situation so it could
> > be argued that everything is best effort already.
> 
> The panic() code is like walking on bumpy roads. It tries to be as
> safe as possible. IMHO, it has few important tasks:
> 
>   + show debug messages
>   + create crash dump (optional)
>   + safely reboot (optional)
> 
> The debug messages are important but some users might prioritize
> reboot over the debug messages. It helps when the panic() is rare
> (low likely race) and the system is quickly able to handle the load
> after the reboot.
> 
> This is why we put nbcon_atomic_flush_unsafe() only into the path
> which ends with an infinite loop.
> 
> > In older kernels (v6.19 and earlier) netconsole is able to print these
> > panic logs while the system is configured to reboot on panic. So from a
> > user perspective this is a regression caused by commit 7eab73b18630
> > ("netconsole: convert to NBCON console infrastructure").
> > 
> > We have automated test systems without BMC access, which rely on these
> > two features working together.
> 
> I see. To be precise, I would say that the primary culprit is the
> commit 187de7c212e5fa87 ("printk: nbcon: Allow unsafe write_atomic()
> for panic"). It adds support for consoles which will be flushed
> in panic() only by nbcon_atomic_flush_unsafe().
> 
> It is a big difference because printk() tries to flush both
> legacy and "safe" NBCON consoles directly in panic(). In addition,
> they are explicitely flushed by console_flush_on_panic().
> 
> console_flush_on_panic() is called more times in panic().
> And it tries to flush legacy consoles the unsafe way even
> before emergency_restart().
> 
> OK, we should close this gap. But I suggest another solution.
> 
> We already have the following functions for flushing NBCON
> consoles using write_atomic()
> 
> 
>   + nbcon_atomic_flush_pending() - flush CON_NBCON consoles
> 	using con->write_atomic() but only when safe
> 
>   + nbcon_atomic_flush_unsafe() - flush CON_NBCON consoles
> 	using con->write_atomic() and allow unsafe takeover.
> 
> I suggest to add 3rd variant, for example:
> 
>   + nbcon_atomic_unsafe_flush_unsafe() - flush
> 	CON_NBCON_ATOMIC_UNSAFE consoles with con->write_atomic()
> 	and allow unsafe takeover.
> 
> And I would call this 3rd variant in console_flush_on_panic(),
> something like:
> 
> void console_flush_on_panic(enum con_flush_mode mode)
> {
> [...]
> 	printk_get_console_flush_type(&ft);
> 	if (ft.nbcon_atomic) {
> 		nbcon_atomic_flush_pending();
> 		nbcon_atomic_unsafe_flush_unsafe();
> 	}
> 
> 	/* Flush legacy consoles once allowed, even when dangerous. */
> 	if (legacy_allow_panic_sync)
> 		console_flush_all(false, &next_seq, &handover);
> }
> 
> But maybe, this is over engineered and we should just call
> nbcon_atomic_flush_unsafe() in console_flush_on_panic(), like:
> 
> void console_flush_on_panic(enum con_flush_mode mode)
> {
> [...]
> 	printk_get_console_flush_type(&ft);
> 	if (ft.nbcon_atomic) {
> 		nbcon_atomic_flush_pending();
> 		nbcon_atomic_flush_unsafe();
> 	}
> 
> 	/* Flush legacy consoles once allowed, even when dangerous. */
> 	if (legacy_allow_panic_sync)
> 		console_flush_all(false, &next_seq, &handover);
> }

Hi Ryan, are you still planning to send a non-RFC patch? If not, I'm
happy to take over and send a patch with Petr's suggestion.
We are seeing cases in production of panic logs not reaching netconsole
because of this.


