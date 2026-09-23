Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8322A3446B0
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156622; cv=none; b=dghOp3D9mLTk0+OyXhMlHimbm80T7B9aOfo4n8m+YUK9ZpUL9VDqr8dRLe3GwdKphbWGKp9cm29+KlwM4Upfdp3XQxPuRchO1v2dyLy21hmR8P0uD7R0a0ej4Xva6uchctQ7QZowhJJbehBGHFS9+klgwQC0bk00Mlr/6fQA1YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156622; c=relaxed/simple;
	bh=d1pBOVvOPwQJpUNnV1NfQhYCaKulw8D4ABZ2mdyYVB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BFa5xBFdzYxJ0f4AwZoq0lJVG6PVa8wCgivwtPHY3jtWWmpEwgq7r4IFacWJcjVK3O+9gCLOzXT4+JjnSkjzkhFrFbGLBOTT8Pl3c3xzsUZkDrGnduYp1EHe7SQG2umToAmhG4llOb2hEuOyyS5/xq2MzAXr2BAFuSCL7b9KFpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NHuifBy4; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NHuifBy4"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-482f6351831so466537f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790156618; x=1790761418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NrFWLk2KJwE6h9jkffHRi2/DE7jTZ7JtngmaiYlVevI=;
        b=NHuifBy4IfkKGgDHNmbepzDH3yUSVn0KautjOm5bHty6d90T0Y9eXWiVACgT6WMfg3
         deOvxNua6TcTdbpN/i7PNcGRrz3H2Yuv5HFdt2Ko4OHhZmyz4+asBNXUn7lxZOJfW7dv
         tgoqWQL9V4X3Fg66tLihg+CXUawheFG/qlc+eYogsJlpbAoVBBPcm5v7BsvDEXizqao3
         WvOZjTGJK/1ASw2116/32Gb1vJYYMvKHF499adggSf3rDIa2PRnUBdmOf1eLbWOW4LiP
         mcxYtJLaQ+/aNS0/LHM+STeWCXM3kWsLu1rOzIn3IGX/qllIQNuLEuQ3jNPcK8BsjgEQ
         jhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156618; x=1790761418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NrFWLk2KJwE6h9jkffHRi2/DE7jTZ7JtngmaiYlVevI=;
        b=UjsIhbYiI/4oHbu6m4BdiZq+o4r9/NIyKEnYlGUe+q+pdFSHMJQCWO1eK/J5U+SfPk
         a7BIi5ox9iGIINj0q4PeK3YdWBLRFPJar3xf+ic3KM6bqRoNl7KhQr1k0mq6sRWpUopJ
         OO7xi7WUSd4AVLE2erf1W4olZ7UjTfKN7ieQpuembYNEv+zExULeP0jQXCBNRAEpvWFU
         s5bkEHU/4bMgIQJ6r9pwUlcXS7GzpjZlDQFiov7Mvh2LZLLYERMlOlqXh8xX6cJyXEdr
         s4R44d4knMRikLS0rWzLz1pnIyckMy7j5zFGPbLHcM+nYLUS68qfe4JIvajmRPROSFU9
         TjDw==
X-Forwarded-Encrypted: i=1; AKwUvBy7jgJ+iyHcsp4c/cLL70sRv6CoAugkT9Z86bpOVduzTylqF+FF83OtAKwCJom25H/onO3F57eaVzMqOPc=@vger.kernel.org
X-Gm-Message-State: AFuF++nfqK67+tal4cmXH/072TDpQMjMNElto9z0ihriSCN10BxlTtsg
	3kuCZNS1SPpocihs/+Yo9vws0rDJmEzXHlIkbGKEobIYZ/KMsg3eVUkk2xJEbWcXVzM=
X-Gm-Gg: AYBFou2AMmRvyRm+2YqInEP5eOc7NqovTEcdLXG7rdNLoJbdmcOx9zw+PNcpoMJO+Zj
	qJdU49pvo6RiN4DBjqwvdA98EtMvgwHOw9BWH9ZthGWO8j+M6ETgprfBZ5fsesgGzeDEAxo3SOy
	f4XyAhikg24DG5a4R5ZHOEb7QbE5FjTAujVONWZwLqOXbr8YRP8QhpmyWKZG7l55orNUUbX9cac
	5OQOnED5opCqCUr41LJCKNZXFzXgnnHPCLQ6oxLGvGzXF3mf1TcafjGmaJkORhD/vKoreDez0dg
	p2lpFEwjCWloPDgLwErw1532aVLA/nJ0HTuEe7FyCnAP6JjCpgmgni/BWQT5BSr+jWHcbHMBX+X
	xtgU+jjRcMc58d1/utoH5QQ03PgX6kPxF7kSTIZEMA1nGqaJyXSda/rO7PdvTyw+RAnSWbOydmZ
	Nb3tXQyTlBREI25b6YA5bmWPV2YReX3TCa7qBTY2X7PGH30xrI7+jqh7cskLqxIFmV1WyLgyaWo
	tV8rZqROT6xJA4ifakAEtM4sA==
X-Received: by 2002:a05:6000:1847:b0:486:e5f7:89ca with SMTP id ffacd0b85a97d-488670610d9mr3241862f8f.8.1790156618535;
        Wed, 23 Sep 2026 02:43:38 -0700 (PDT)
Received: from pathway.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm5974664f8f.23.2026.09.23.02.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:43:38 -0700 (PDT)
Date: Wed, 23 Sep 2026 11:43:36 +0200
From: Petr Mladek <pmladek@suse.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Lin Junzhe <m18667909625@163.com>, Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] printk: fold consecutive duplicate messages
Message-ID: <arOfSJT-xRcAb-T1@pathway.suse.cz>
References: <20260921050304.73440-1-m18667909625@163.com>
 <875wzzoxcd.fsf@jogness.linutronix.de>
 <20260921183000.1-m18667909625@163.com>
 <87ik3yssy0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ik3yssy0.fsf@jogness.linutronix.de>

On Mon 2026-09-21 14:19:43, John Ogness wrote:
> Hi Lin,
> 
> On 2026-09-21, Lin Junzhe <m18667909625@163.com> wrote:
> > Real cases I have seen in the field and in bug reports:
> >
> > 1. GPU faults (nouveau): a misbehaving userspace program or a dying
> >    GPU can trigger a stream of identical fault reports from the
> >    in-tree nouveau driver, e.g. repeated "fifo: fault at ..." lines
> >    while the offending context keeps being rescheduled. Similar
> >    spam exists for other GPU drivers when a fence or scheduler
> >    loop misbehaves.
> 
> There are several such "fault at" messages. However, the ones I looked
> at have other printk messages following in the same context, so your
> patch would not even help in these cases.
> 
> Please specify the exact message (file + line number) you are talking
> about. Perhaps it would be enough to change it to use a printk
> ratelimited variant.
> 
> > 2. Failing storage: a dying SATA disk produces endless identical
> >    "ata1.00: failed command" / "ata1: SError" storms. This is a
> >    classic dmesg flood that buries everything else on machines
> >    with a serial console and no syslogd.
> 
> The "failed command" ata printk is also followed by further printk's, so
> your patch would not help.
> 
> Please specify the exact message you are concerned about.
> 
> > 3. USB reset loops: a flaky cable or port makes the USB stack
> >    repeatedly print the identical "usb X-Y: reset <speed> USB
> >    device number N using <hcd>" line, sometimes for minutes.
> 
> I could not find this pattern. Please specify the exact message.
> 
> > 4. IRQ storms: an unhandled level-triggered interrupt prints the
> >    identical "irq N: nobody cared" report for every retrigger
> >    until the IRQ is disabled.
> 
> This message also follows with more messages, so your patch would not
> help.
> 
> >> printk is NMI safe and lockless. It needs to remain so.
> >
> > Fully agreed, and thank you for the clear statement. My
> > implementation takes a raw spinlock in vprintk_emit(), which
> > violates exactly that invariant -- the in_nmi() guard only avoids
> > the deadlock by disabling the feature where it would be most
> > dangerous, which is not acceptable either.
> >
> > Given this, I see two options:
> >
> > a) I drop the patch entirely; or
> >
> > b) I rework the idea as lockless per-CPU/per-console state at the
> >    console output layer (or on top of nbcon), so the printk
> >    fast path stays lock- and NMI-safe.
> >
> > Please tell me whether (b) is worth exploring or whether the
> > consensus is that deduplication belongs in userspace and (a) is
> > the right outcome. Either way is fine with me.
> 
> I am against a patch that drops messages just because a format string
> repeats. The _data_ is not the same and that is important (particularly
> with your GPU and SATA examples).
> 
> I am also skeptical that these are real-world issues as all of your
> examples (that I could find) had different printk messages following,
> which would lead to no drops.
> 
> There is also the ratelimited variant of printk. If there are indeed
> messages that are not useful and can flood the kernel log, perhaps those
> messages should be either removed or ratelimited.
> 
> If such a feature were to exist, I would prefer it is implemented such
> that:
> 
> 1. A duplicate message means contents are identical (except for the
> timestamp of course).
> 
> 2. It is implemented using flows similar to LOG_CONT to be certain that
> the message being dropped is really the next message.
> 
> 3. Records could be extended to include a counter for how often they
> repeat (so that deferred consoles can print the "repeated" line).
> 
> Honestly, I do not see a real value for this feature. In my experience,
> even if a console is being flooded with messages, I still want all those
> messages. If a console is unable to keep up with the flood of incoming
> records, I need to use a faster console and/or reduce my console
> loglevel. And if there really are printk messages that can flood the
> kernel log and are useless when repeated output, they should be make to
> use the once or ratelimited variants.

I have nothing more to say. I fully agree with John here.

Best Regards,
Petr
