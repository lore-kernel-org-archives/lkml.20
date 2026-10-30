Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368326;
	b=4fu4qknxXXggTkKALA1MFeTuhJUemDCFJyoqkQ4xD7SIJSseYeQ5Pa2QtnL1HJV4fYDh
	 LE2vT0hl78rw7dV+VxsmxDiebibVSvy0JPtVioDtxuDFEHE1hEAxAmNvJOTffb46PBzHK
	 UrGeVyygsCVnNegFg8EHhYSJ6T+fwoGI/Gyrdt67clZ/QVbnIsT31NRFAqg/grsaVeGS0
	 XmQ1j8+MCe9BhfUYt+W2r9spGZkcPaCsMp6Msc8ZKNpQ7t9YRQDRMlL2rxINqnQKt8UYI
	 G6dX4NbqjaR316NhwG71p/ZMJqrkAWNX1R86lFRo1hJ9XQ8LNbBQXLeZc3J9ZUJ4FaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=SXBe5FDUaux8CGMgkiRMsJSb/8g4y+WkcIulnsCpl5I=;
	b=w8NMncssmtb3IGspOfurT0JiAyUacG6YRl0LcnKxTvm4/jNq+7gCKZClg9OwyppnRzYb
	 KUdlvuKPmuGL08e17PBwSCfFWc0SHY00Tc0GyGaQBp5KQMu0XdQmOoxhQdnSSzwuu/S34
	 w7Og9d15rQLF2kTJBiQP66JR9duJ2gd1UITJ7QCiHO2GH7V6yrZCQ3r4gFGcWo1dhABTQ
	 Cb77HEYM0lvsXeJO/Mp58aJitMbMVSR/aX4feRxlqi0otDm4CKRCI9Cu09wNAmAXUudXv
	 n7pJWd1spIStye9iYlzQdQqf5DxDzQ4qSJmmsRIeVE6HebDJf94UHCTlbeBvAgUypKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RkokQgTr;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A98F606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A98F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=RkokQgTr
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso529055f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793368324; x=1793973124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXBe5FDUaux8CGMgkiRMsJSb/8g4y+WkcIulnsCpl5I=;
        b=RkokQgTrTTmS/o3og9U6To27ycnHGXCRnyXyCvlEvTICBJCmqazJch6Zc6UZlJayQ3
         70KQI9dCoCwxJ1bMatKTmpWw6v0K6ZM6VEFFI+pTXfWU5faHnzA/IiQSuSvFjpj9QPIs
         jvSNJs0Z3LOnWPUdYH4Lr4NcpQSyzlQ5g2Eo5Cbix2NoDgPiPKPQPM5WevOZ4vo/cgwp
         I8lc042KQHJiU9wAAIWadCXtntL/h6ueE/8XR1eYFxvguEUs5CdECdzgH5loCh4GvnoK
         +FEw+1EMMASN8KWH6piunt43QF8dAKAsdIHnfqlZ9WjLz7cSJSHHRJJVI/REIW3jTqc3
         LKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368324; x=1793973124;
        h=in-reply-to:content-disposition:content-type:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXBe5FDUaux8CGMgkiRMsJSb/8g4y+WkcIulnsCpl5I=;
        b=ZNVTsYX3f2WLEDJkqh3i/xDHFZf1fUw7XrTEGw+cKV1NuPiIvDmvX0/wxM8pMSd/py
         4L447plQdTMn2NKIdz+ojRj0EwYM8UBSCCaKpBPMJh7DcSiXrdB5CdpZgaL/a+n7dJnv
         rfPMJiN14vakpPS4mymYukSRYcWKvS76hsNKUVDiLxBGzeSkCcfcAyu4Nrp3FcgTrxBM
         ih/FP6K4TC8bQsSXUc2iK4qT8lm+wLFu6pjUSqENfI5XcWDpUe2vgOOieS4qyLam/5EW
         cBSctsHVm8zBCwfXIW3erkSwnzKe6AbMfVxl/ODtceSnAE9swdeWT4PdTOOvGPSFZjvC
         fnMg==
X-Forwarded-Encrypted: i=1; AKwUvByPbHoPA7Pa7YmsnrcLyFcrfzy3UkWApiS7KMVaMUsYvw33qfW2vhdiYW6kIZMcZF15esYLfvTC/bgmKqw=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8CpYwsAFW58At+RB6ZCtkWAZ7RyYBsjT8j29sN1d7M4R9kaP/
	8I9Qry1RmABHgdthTF5RdlKKBbjWlJRlfzximFUeNB5L/oAqjjzAnNAHwv9U/RGtXSo=
X-Gm-Gg: AYBFou2nheoKkBFNPz/5PULgKLudQ5zuCvM2HPFCJicl0hPv5yS5YMc0imxu0k2moZi
	+r8lIlu2jzIXL7D6pqGOM6pIx/NgreYk6yAogXlkMq25LX5vNcvdPMitLDAJuGA8w693OpvJFGi
	TuIBkjmDC8dEo5fG558MOMrtjIzvehwIIeHLrIZetEULmOBnbKpxW5k73E/pKJ75V81vPDHLROw
	DF9pn3phHoUKtag4LCrQ4slRINVkSY/Jzinmauxbf0rW4Ll+2Q6qw3xtPWdwAKzW/zHuMemFss2
	dkbDybOKQJo1iWQIrahm6esydzKVLYPjlOzLetIlQL4MToPSOaNi57ZiqIJLbP/B/kqnT3VGC1a
	FjHsXaCAigYkekKvQBq1AU5IwcHvkiW99YWF1jd7j7S2QK9cZGYwkbPCtZ/Xly1cWQdehzI19dD
	Fp5i6SyhJY21BRd1CL7bc/sqL7WgYU65t2hVX+/s6fkUbX+1KIQrjh/U+ySodXV/w1Ev8DmModg
	gsWFipy4nOmqrv7mPAcLH5iZxK7Z0Bdd1N2mLPmPakhQqXmxMsZi0M5YtBgAYRXPXt4z0nzl9mr
	1BY5czJuKktvIO+je/jc
X-Received: by 2002:a05:6000:454b:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-48e6e2bc9c2mr3892543f8f.1.1793368323808;
        Fri, 30 Oct 2026 06:52:03 -0700 (PDT)
Received: from pathway ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba4ac6sm3514204f8f.52.2026.10.30.06.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:52:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 14:52:01 +0100
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Derek Barbosa <debarbos@redhat.com>, printk@lists.linux.dev,
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH printk] printk: Avoid multiple unregistration in
 unregister_console_locked()
Message-ID: <auShAQbJAwSqI6gu@pathway>
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
In-Reply-To: <87y0bgwm0y.fsf@jogness.linutronix.deq>

On Thu 2026-10-29 16:48:53, John Ogness wrote:
> On 2026-10-29, Sashiko wrote:
> >> @@ -4471,6 +4493,9 @@ static int __init printk_late_init(void)
> >>  		}
> >>  
> >>  		unregister_console_locked(con);
> >> +
> >> +		/* Changed console list, may require printer threads to start/stop. */
> >> +		printk_kthreads_check_locked();
> >>  	}
> >
> > Should printk_kthreads_check_locked() be called after the
> > hlist_for_each_entry_safe(con, tmp, &console_list, node) loop in
> > printk_late_init() rather than inside the loop body?
> >
> > In kernel/printk/printk.c:printk_late_init():
> >
> >	hlist_for_each_entry_safe(con, tmp, &console_list, node) {
> >		if (!(con->flags & CON_BOOT))
> >			continue;
> >		...
> >		unregister_console_locked(con);
> >
> >		/* Changed console list, may require printer threads to start/stop. */
> >		printk_kthreads_check_locked();
> >	}
> >	console_list_unlock();
> >
> > Because printk_kthreads_check_locked() is placed inside the loop,
> > unregistering the last boot console sets have_boot_console to false and
> > immediately attempts to start printer kthreads while the loop is still
> > iterating over console_list.
> >
> > If kthread creation in legacy_kthread_create() or nbcon_kthread_create()
> > fails for the console stored in tmp, printk_kthreads_check_locked() calls
> > unregister_console_locked() on that console, removing it with
> > hlist_del_init_rcu(), freeing nbcon resources, and invoking console->exit().
> > On the next iteration of printk_late_init(), con is set to tmp, accessing the
> > already-unregistered console and terminating the walk early because
> > hlist_del_init_rcu() cleared tmp->next.
> 
> Geez, sorry. Obviously printk_kthreads_check_locked() needs to be
> outside of the hlist_for_each_entry_safe(console_list) loop. That was
> the whole point of the series!
> 
> I will wait a day for v2 in case there is any feedback regarding my
> comments (or lack thereof).

JFYI, the comments look good to me.

It is quite twisted problem. I have got lost again when looking at
this patch. I am not surprised that the 1st version was not right. ;-)

Best Regards,
Petr
