Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615330;
	b=u+yA2/TVwEkK3EwhZpnjKU4KbHNuWAmPzCCS18jM421jj5ZWHK7CFfgwn2TZlbxXMQxh
	 U6hTnEHzEU69fbPCbf+IFNs5ijLGAm6N5HFDMsuZzwAGoyo1HhY3wbjZ7kPc0w8I6nMsk
	 N5uKVLkd/Ds4M/fHk20gHJCEMhMzwqCDNCfmXOxk2QiO1BTNC3TFiXLIwywIltpAK8nwB
	 j/SNO7kLjocQWEhg22BryrStipQBj4vYzk1R0jgYIgS5hn3iIPcXUfFsA+RrMkp35XFik
	 7UgYpQPmAVR575xYRVeDIkRckr1bsfk0nEK2DM4BvwAGrvwnoxo5f4bfWvU0doxCMUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5c9GGJQCyHYTreDhZ6jSPC2ZxTcipGENaXeUlkAYdb8=;
	b=b8YYgMOlHzYU9NcgFbGSXUXLj0i4quoNjIIEni5f6mMLoPpUCG/X64X1Ql170AMwPJIj
	 lS9G7Nc+Kuc23w70LLO3tKUa8u7MFCpJ/ciCqiX/TeyzBU68dzJpJiV8Lyu7XmpDB6qqM
	 0ObsWTP4aeAEo1/UUFBSYGwhrJQj0yeiq3hfXyEXWQjHImj4LQz1c/s0rvOxtVohuf8mT
	 nun8ZwA/Th78ucXsVBjDlKcfCc/9PkXJXCjEOq5Ztfcx3UGm8a6AKGSjmAOG1V6EYNpPj
	 2f55ZYcf8x49px8EzPQaSlLo65ao+2KP6QdzOqHJ0/Cq5iezlLBOJqMT46gM0lgZiVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b="dJQxg/2I";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B136606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:28:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4B136606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=dJQxg/2I
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2523525f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793615328; x=1794220128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5c9GGJQCyHYTreDhZ6jSPC2ZxTcipGENaXeUlkAYdb8=;
        b=dJQxg/2IMU5xYc4vSv+8l/5Kxyv6+nYsGU6Wrprs1+66EZExrr1tHOka2y9DewbtsE
         pcPYdg3sqntL7socy1LIWWrnn5pgfqdzcKLX4hggQLmKGAUeVIemACNiDmyQhJagTLVQ
         fzmodSwuYsKlCEcDQU1EtBzQQVgewHfl9kgc+OHvYb/HELLcc6Dnq9byRs8jqQrv5E3g
         PT+iIKNgDYA/y9W0+YmxttkpVJfPpZFgb131qUfPm/4W2ttesQNsYJYKCzl2yQikwI+E
         nv4vp4SxyuX3bCp+yQIQVc2gb4X4okqpRADZ99zfSxS5se5JARGIiPCZbw7FfivyL5w3
         7UEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793615328; x=1794220128;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5c9GGJQCyHYTreDhZ6jSPC2ZxTcipGENaXeUlkAYdb8=;
        b=zEsKpspAK0Tk1CCeDxB09qT70Zb/j0huk9iBaLn1OzIO9B24A0M72EEJDi7sjltRRo
         CVOaSKBETpxcqiYKt0l94S6NnqE7+Zl/Vdh4lue0jgjjufF8AYHjARu7zOH2HuHT853W
         UQ4yAQ8CSAsl97ctkrwS6caoCfQ16a+A/VFjz7Q0lqpMKqImo8JUD//cq+ULcrVgtKLD
         nvXGFwFxxAWtI0QbkXa3rdWUhNpoFn1gUzMTpqhw67mtekYkbJGps5WDgf8kl/YZUCnQ
         piWA0dOKRuyd4fjXFZONC6LlRW2v1Il6/GUTUGZCaheQtL+zjK3BHkW6eQWLNMjdrdXY
         W7Ww==
X-Forwarded-Encrypted: i=1; AKwUvBwMHYNoGVx0ISY/+/nR9y5WHHc6sY3LDdDr8ydEYCa6ZP7siMHTkJ/KgDpy2BF3X+IqUOXGpxF7mi7BhhU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+bYOeqzh4MpfndsA1eZA+WsJepwlCsBsoQdoeQ4yqhIMg7opYk
	Kn+he3e/gehhX85c+7uyxo0v0qft/LYZbko4kgrYi9AY0cCv9FSevLcdG9e5dpBL5GY=
X-Gm-Gg: AYBFou0bqDPREs3IaRe3SSHKFg3ipGp6grCyodWKNM1uQyp+X2fQwik9VypJYbbN6K7
	sjmw1RUhQQrEn9rVruzLWJjHFsOGEi052w/0kxWkcJw1mhDGD1Lotryeh2TbQutdJtSqeBtQ7Ii
	6ucDhlyLmixJFQSnVwSlaOioSaMNtiSq23KWIZCR6EDhLczbxuP5reMsjEO2p5v7uMWZm0P6WlE
	ZBMzqvQMhrKOPNXPq/fXUW+KjmmJhPIqLqdeNBIsx1vBzcQDT3xiyxKzHaflYh5Ig7fpE47odIE
	wVuOdXoQdQv0tltZErlxuY6/NwjnBBHWBsukwlF60I6+NpvzXK3W5dRbFVsSupdZy3BK5rHfxOc
	ACKHkTdF/th7FuEtMxDUrAlI65REAoiZjK9WqsbMKLyX8b69GH4GarJsi51GfVR98mOkcyKMawV
	1xlu91BNMkHB/SkBGTx0SXm9LggaY/hxLtWdVmosEKoUEkwh7h8OStjhbc6Y6gAnxLFEYOEm9Tu
	F7PdDvrKB45Q20U/omCyEv6x16dvDXMJ5wwxYcqSMjA3wuOzXHtQlJaU668RUBuxuXD207JKfrM
	fPvfqGZavIwS/HFb4kk=
X-Received: by 2002:a5d:5f85:0:b0:487:21be:dcc6 with SMTP id ffacd0b85a97d-48e6e5008a9mr21203224f8f.21.1793615328524;
        Mon, 02 Nov 2026 02:28:48 -0800 (PST)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80ecbsm19687731f8f.35.2026.11.02.02.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:28:48 -0800 (PST)
Date: Mon, 2 Nov 2026 11:28:45 +0100
From: Petr Mladek <pmladek@suse.com>
To: Breno Leitao <leitao@debian.org>
Cc: John Ogness <john.ogness@linutronix.de>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Rio <rioo.tsukatsukii@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1] panic: Flush unsafe consoles before panic reboot
Message-ID: <auhl3cdwrHt4Vw7U@pathway>
References: <aqqU3I7d9lMAjSvy@pathway.suse.cz>
 <87bj8kkfwk.fsf@jogness.linutronix.de>
 <auHNz09oyGFJPTKg@gmail.com>
 <8733tphow9.fsf@jogness.linutronix.de>
 <auI40MZlSYO0oAAS@gmail.com>
 <87a4nwyiaw.fsf@jogness.linutronix.de>
 <auMmQjcy1A6E0eUm@gmail.com>
 <874ie4y5mw.fsf@jogness.linutronix.de>
 <auNaD8LELWok3LOF@pathway>
 <auTaBZlNbpm3jgvb@gmail.com>
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
In-Reply-To: <auTaBZlNbpm3jgvb@gmail.com>

On Fri 2026-10-30 10:56:35, Breno Leitao wrote:
> On Thu, Oct 29, 2026 at 03:37:03PM +0100, Petr Mladek wrote:
> > Another question is where to call it. I guess the it should be called
> > in two code paths:
> > 
> >    + __crash_kexec() likely after stopping other CPUs
> > 
> >     + console_flush_on_panic() after flushing safe nbcon consoles
> > 	the safe way
> 
> What about something like:
> 
> 
> commit de57403441b601af01d92bc03bf0625338d39c80
> Author: Breno Leitao <leitao@debian.org>
> Date:   Fri Oct 30 10:08:01 2026 -0700
> 
>     panic: flush unsafe consoles before reboot and kdump
>     
>     netconsole registers with CON_NBCON_ATOMIC_UNSAFE since commit
>     7eab73b18630 ("netconsole: convert to NBCON console infrastructure"), so
>     its write_atomic() only runs from nbcon_atomic_flush_unsafe(). vpanic()
>     calls that right before its final busy loop, after emergency_restart()
>     and after __crash_kexec().
>     
>     A panic that reboots (panic_timeout != 0) or boots a crash kernel
>     therefore never reaches the netconsole target. Neither does an oops that
>     goes to kdump through crash_kexec(), which skips vpanic() entirely.
>     Before the conversion, netconsole was a legacy console, flushed by
>     console_flush_on_panic() ahead of the reboot.
>     
>     Add nbcon_atomic_unsafe_only_flush(), which flushes only the
>     CON_NBCON_ATOMIC_UNSAFE consoles and allows unsafe takeovers on them.
>     Call it on the panic CPU once the other CPUs are stopped, leaving the
>     consoles with a safe write_atomic() alone.
>     
>     In vpanic() it runs after the safe flush, when
>     panic_other_cpus_shutdown() has stopped the other CPUs. In
>     __crash_kexec() it runs after crash_smp_send_stop() and before
>     machine_crash_shutdown(), the order panic() already uses with
>     crash_kexec_post_notifiers.
>     
>     The call does not go into console_flush_on_panic(), because kgdb_panic()
>     calls that before the other CPUs are stopped. It does not go after
>     machine_crash_shutdown() either: on TDX guests tdx_kexec_finish() zaps
>     the shared PTEs there, and netconsole on a virtio NIC would touch that
>     memory.

This is the 1st time I hear about it. Does it mean that netconsole
should not be called after this point, please?

I wonder how this worked before the netconsole was converted to
the NBCON API. I guess that it "worked" because there was neither
printk() nor any explicit console flush after this point.

>     A write_atomic() that hangs now keeps the machine from rebooting or from
>     reaching the crash kernel.
>     
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -140,6 +140,13 @@ void __noclone __crash_kexec(struct pt_regs *regs)
>  
>  			crash_setup_regs(&fixed_regs, regs);
>  			crash_save_vmcoreinfo();
> +			/*
> +			 * Flush the unsafe consoles with the other CPUs
> +			 * stopped, before machine_crash_shutdown() tears
> +			 * down what they may need.
> +			 */
> +			crash_smp_send_stop();

AFAIK, the crashdump currently shows all CPUs online. And
the backtrace shows whatever they were doing last.

Stopping the CPUs earlier would change the existing behavior.
And we would need to discuss this with crashdump maintainers.

Well, I know that stopping other CPUs makes it more safe.
But is it strictly necessary? We did not stop the CPUs
when the netconsole was handled by the legacy loop.

> +			nbcon_atomic_unsafe_only_flush();
>  			machine_crash_shutdown(&fixed_regs);
>  			crash_cma_clear_pending_dma();
>  			machine_kexec(kexec_crash_image);
> diff --git a/kernel/panic.c b/kernel/panic.c
> index 91e48d33b7dbbd..e14b1b60828130 100644
> --- a/kernel/panic.c
> +++ b/kernel/panic.c
> @@ -723,6 +723,9 @@ void vpanic(const char *fmt, va_list args)
>  		panic_console_replay)
>  		console_flush_on_panic(CONSOLE_REPLAY_ALL);
>  
> +	/* The other CPUs are stopped, flush the unsafe consoles too.
> h /tmp/puf_post.sh kerneltest001.31.atn1 6791 atn1a &); (sh
> /tmp/puf_post.sh kerneltest005.19.atn2 6792 atn2a &)

The last two lines are some mess ;-)

> /
> +	nbcon_atomic_unsafe_only_flush();

This might be too early. Anyway, it is before printing the line:

		pr_emerg("Rebooting in %d seconds..\n", panic_timeout);

I have a crazy idea and do this:

--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -1688,7 +1688,20 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
  */
 void nbcon_atomic_flush_pending(void)
 {
-	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
+	u64 stop_seq = prb_next_reserve_seq(prb);
+
+	__nbcon_atomic_flush_pending(stop_seq, false);
+
+	/*
+	 * This is a compromise. Otherwise, NBCON consoles would never
+	 * have a chance to show messages in the panic paths where
+	 * the unsafe flush is not explicitely called.
+	 */
+	if (panic_on_this_cpu() && oops_in_progress) {
+		panic_nbcon_allow_unsafe_takeover = true;
+		__nbcon_atomic_flush_pending(stop_seq, true);
+		panic_nbcon_allow_unsafe_takeover = false;
+	}
 }

It would allow to flush the messages directly by printk().

I know that it would be a step back in the reliability. But showing
the messages looks more important to me than a reliable reboot.
And we could make it configurable when needed.

Also we could add more checks. For example, do the unsafe flush only
when "num_online_cpus == 1" or so.

> +
>  	if (!panic_blink)
>  		panic_blink = no_blink;
>  
> diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
> index 5f8afaca886650..a43143eca1a015 100644
> --- a/kernel/printk/nbcon.c
> +++ b/kernel/printk/nbcon.c
> @@ -1653,8 +1653,9 @@ static void nbcon_atomic_flush_pending_con(struct console *con, u64 stop_seq)
>   * __nbcon_atomic_flush_pending - Flush all nbcon consoles using their
>   *					write_atomic() callback
>   * @stop_seq:			Flush up until this record
> + * @unsafe_only:		Flush only the CON_NBCON_ATOMIC_UNSAFE consoles
>   */
> -static void __nbcon_atomic_flush_pending(u64 stop_seq)
> +static void __nbcon_atomic_flush_pending(u64 stop_seq, bool unsafe_only)
>  {
>  	struct console *con;
>  	int cookie;
> @@ -1666,6 +1667,9 @@ static void __nbcon_atomic_flush_pending(u64 stop_seq)
>  		if (!(flags & CON_NBCON))
>  			continue;
>  
> +		if (unsafe_only && !(flags & CON_NBCON_ATOMIC_UNSAFE))
> +			continue;
> +
>  		if (!console_is_usable(con, flags, true))
>  			continue;
>  

This looks good to me.

> @@ -1701,7 +1705,21 @@ void nbcon_atomic_flush_pending(void)
>  void nbcon_atomic_flush_unsafe(void)
>  {
>  	panic_nbcon_allow_unsafe_takeover = true;
> -	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb));
> +	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), false);
> +	panic_nbcon_allow_unsafe_takeover = false;
> +}
> +
> +/**
> + * nbcon_atomic_unsafe_only_flush - Flush only the CON_NBCON_ATOMIC_UNSAFE
> + *	consoles, allowing unsafe hostile takeovers
> + *
> + * Like nbcon_atomic_flush_unsafe(), but consoles with a safe write_atomic()
> + * are left alone. Meant for the panic CPU once the other CPUs are stopped.
> + */
> +void nbcon_atomic_unsafe_only_flush(void)
> +{
> +	panic_nbcon_allow_unsafe_takeover = true;
> +	__nbcon_atomic_flush_pending(prb_next_reserve_seq(prb), true);
>  	panic_nbcon_allow_unsafe_takeover = false;
>  }

Also the name nbcon_atomic_unsafe_only_flush() sounds good to me.

Best Regards,
Petr
