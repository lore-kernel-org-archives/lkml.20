Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794233323;
	b=rFZBnj07eMHiD6jmM0OiQemZIGl7Z73n4kc3fqIioDFRj2qLXDdXosIPwcwEXF/pYavs
	 GT5TXU+qEa53NWPHg2w13NQ45H4dGq7GM4I8zir24HLPUjyJV66dG3RK3KQZf2ZNmdI4h
	 VRwg+mvaXtlvSyuAMn0ewBTYfX8yld5CS72GBvsYIPQtZNClY/SeKDrmg2NFUVlAkmpvN
	 R4XEAtIxREcFCZvispkFP0I1cc4lH8I7N6Yy4QfuTDaueX2HZ6O/TjCgSCRuKsQX8cRac
	 y+303ady0ke0YKC57tGtJsylt7PDHLQUEuGjiH9uNVItMxcseA/nU1KxrxPIqSRl2zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794233323;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=77wurJ380Rkm/Xg0cbFevd9UlQFlV56auT57Zyq+9W8=;
	b=b5+Yfsyc04YLdTkq66VlFvcM2Mi/bfzezhhNfvGQUPd+z8c2RKOwBWhLgE9RQQdnq5ML
	 MCgRGJP5tkFVP4+cPG/nQib4b2yutymjipRDen3Cta/Dq6jU8w6dX0Epetqhu5vnw4EeQ
	 i87fxkE1b9bpOrT5k+j1p/JUpp/W5S7TI5XunIsgc5XfRrt+hCYI0wWd2MzoFOHhGI0gJ
	 Og7X0ygtvLisvX7gFfCSpr4dHhjPJ1SMi+nwcBfBNuKtkvtdrrnDQIMj6ucI+J08lj0he
	 stUKyVxLVa+6TtlMcWDIyq77HiJ7ouJ52SIlFaK1Mr9WUfpLYh1pLjzh5e7CSL4QCnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2DA606EE99
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B2DA606EE99
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8871ada1a26so7900587b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794233322; x=1794838122;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77wurJ380Rkm/Xg0cbFevd9UlQFlV56auT57Zyq+9W8=;
        b=2PHCf4klr+obXNtsQ62SbGOL0RVkMsZgR5uY18XZ/oLsNj5N4CbN2OhGJ8X+lNZw3v
         X16v+WjNwfBoX0iCStqUDxGX22fThCbQXuBSjbjzTMsioms8nkZ4y12v7+aeCwNZ5GEU
         2Lk+SA7uJhL7TAM2MCzHmVV1FtT4cxlB/AJFiVFSgo5ZFcVh3sbBfJiLOjz2BKA6NBPx
         OFNRf8i3EnNodnIbbpLSzqWQVVHK4uk40MhISQkQJSFhm8iq3szuAdyP4ZVwM5/l5vZ6
         2ZUTs6GnB60jWG3iusqP8X+daKbes3vEido9L99Yqxzn+i8Is9o9a7555KnEFJHB33yQ
         HxJQ==
X-Forwarded-Encrypted: i=1; AL+hErGvMpnZQ6uLaAq1uZryHRC8n2sxxojKQj4MBEk34pypVQsphDBOVE+NXqC/K5NfPVjDSRN8aL6DTQKfgIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gzeog7233p7SD/UMWz+n0JTsOXXrqtA2zoEKzAdYqDKyr1/bM
	wql3kWVEYFkAHzk2/ecQvXcVjRan3+KLaLHg6et1BXWt0elntZ4w7rNx
X-Gm-Gg: AYBFou1V7BC8B/n8chpZZFk5gLplbKAUAukY8A5r+EyF+do97AOXgFEZnhG1neX443y
	/baV85SZO/+LHrgZcR0x6QCKZqimVfujci+yDABiPjFzFY2r6pNdkW8lALQE14BR004elqS8xO1
	em0CBibHknltC7UEDokWoYz3RZhvRcRBMF80FZ1gdXt6E3d0wve6djM0c3Xo5rsaxjEa4FQOWV7
	SLbUT5wdRGX9pI4z9NumFYrOU966J85zIJzTOux1BuNwl2Okp1NHrjD9onZs2WeEJzCD+kQQrDu
	KPWke+SgYyS4OvlXIpD/HRPosRpCQ+62LGhcdJj8ToB3JcjoOMJCMV1s4qrQOcvzmBSONhrA+SJ
	jkLLSehn7LnOBOqaqUNK10JS1Uah350Ry/2trtYw4qqA8w3U9KbWBH8Gt/CxGnbI5sD6bQVUfpC
	LaeV/aPytKYYZ7TPxvAfgTqYiHyH0vchqDXsKQOxOm0+rqEBzC4S/hEqCt8f+ZdCYh4izQ8VXkO
	zMh2QTUJ48zY5/ChOgcL74M1MdEJiTvQwFFMMg7DpSUOCVaPDv+WSA+xYaXhdOlyivJ0thRpNoU
	FUrsYDr+kqVa0OI=
X-Received: by 2002:a05:690c:b1e:b0:8b3:50e3:ec53 with SMTP id 00721157ae682-8b36ca2e629mr21721647b3.54.1794233322300;
        Mon, 09 Nov 2026 06:08:42 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b36b6320a5sm35777587b3.5.2026.11.09.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 06:08:41 -0800 (PST)
Date: Mon, 9 Nov 2026 06:08:40 -0800
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, printk@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH printk 3/6] printk: Evaluate flush policy in
 nbcon_allow_unsafe_takeover()
Message-ID: <avHTDeox8nDGLC6Q@gmail.com>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-4-john.ogness@linutronix.de>
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
In-Reply-To: <20261109123127.489676-4-john.ogness@linutronix.de>

On Mon, Nov 09, 2026 at 01:37:20PM +0106, John Ogness wrote:
> @@ -1572,7 +1608,12 @@ static int __nbcon_atomic_flush_pending_con(struct console *con, enum pr_flush_r
>  	ctxt->console			= con;
>  	ctxt->spinwait_max_us		= 2000;
>  	ctxt->prio			= nbcon_get_default_prio();
> -	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover();
> +	ctxt->allow_unsafe_takeover	= nbcon_allow_unsafe_takeover(con, reason);


Thanks for the series, I've tried it here, and I got:

  sysrq: Resetting
    ------------[ cut here ]------------
    WARNING: kernel/printk/nbcon.c:561 at nbcon_context_try_acquire+0x72c/0x790, CPU#0: sh/212
    Modules linked in: nbcon_hold(OE+)
    CPU: 0 UID: 0 PID: 212 Comm: sh Tainted: G           OE       7.4.0-rc1-next-20261105upstream-00006-g4170adac69fb #1 PREEMPT(full)
    Hardware name: linux,dummy-virt (DT)
    pc : nbcon_context_try_acquire+0x72c/0x790
    lr : nbcon_context_try_acquire+0x508/0x790
    ...
    Call trace:
     nbcon_context_try_acquire+0x72c/0x790 (P)
     __nbcon_atomic_flush_pending_con+0x1c0/0x358
     nbcon_atomic_flush_pending+0x224/0x390
     printk_trigger_flush+0x50/0x1c8
     emergency_restart+0x54/0x98
     sysrq_handle_reboot+0x5c/0x88
     __handle_sysrq+0x298/0x3c0
     write_sysrq_trigger+0x178/0x1d0
     proc_reg_write+0x148/0x270
     vfs_write+0x1d4/0x7c8
     ksys_write+0xbc/0x168
     __arm64_sys_write+0x88/0xa8
     invoke_syscall+0x74/0x188
     do_el0_svc+0x108/0x190
     el0_svc+0x60/0x1d8
     el0t_64_sync_handler+0x68/0xe0
     el0t_64_sync+0x198/0x1a0

That is coming from:

   550 static int nbcon_context_try_acquire_hostile(struct nbcon_context *ctxt,
   551                                              struct nbcon_state *cur)
   552 {
   553         unsigned int cpu = smp_processor_id();
   554         struct console *con = ctxt->console;
   555         struct nbcon_state new;
   556
   557         if (!ctxt->allow_unsafe_takeover)
   558                 return -EPERM;
   559
   560         /* Ensure caller is allowed to perform unsafe hostile takeovers. */
   561         if (WARN_ON_ONCE(ctxt->prio != NBCON_PRIO_PANIC))
   562                 return -EPERM;

Thanks,
--breno
