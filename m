Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583271;
	b=h9CPYHZo9FIml5qaCCBUxLMTzEmtufUa9knXQZ90StkhRy5YrqQ3Y4AJozxXAXE35v9Q
	 b+duxwWxllGOz0p1piV7mG97FQluyjm/ufvFWEhRCek0q/F7UzD0Sez9AvuURiZNmLRYT
	 /ETQ1kbXc5p05JJjRN7lGrDKDnhKJXsrsQ4+mYXpbdSf6OO9Hle2XVicwVjaGmkiTjBr/
	 N6WsAbi1l/fyO2y4uf4N+gavgMOAfknRudNnZRFhTNl/4I3XM7sMuePQNDDOVza/sUpuO
	 mXLVmz6JMzMgTNVZ9AJFik+Di0uG+m5BRbBMboKzfn9dvcnZIuFuuOmh41g28T4+cNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583271;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=OjIDt+f/7+dWlNv53r9qvEutgjmi1ked15ytPMp8nBU=;
	b=oKB5AI5trUMXlQ464YajlY62LKwlInLPkI8VSo3OQIMnksYK0gvoX0MzOEtTjT0o35/p
	 Ic0Xp3415KAU8T4jys0F4edpkXMn3GoZmQUxefh5OjJLhNhjGgzCYiLz4zmlRy3rTZeXK
	 NMoWhQnAn52P6zjbItj1kF0CToPXfnmgrgdxvkFYI5Te3V8AKfFIG1qhdGzv3CyqgBV6P
	 z0BfMA9QKcyPXv7N5SJO0xFt8gDHTqCrtqWemhf2nEjl3MoYNk4HL8r5IQv3Kj6OLRyPJ
	 xIHXLD7nfoR4KyBv0dXjN/lCeMpTHh5PdZBOa5ar4SQw2TCUOJ+Q81NcMTpQY8fgm1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5D4606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5D4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-67990a45e02so1087087d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:21:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583270; x=1795188070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OjIDt+f/7+dWlNv53r9qvEutgjmi1ked15ytPMp8nBU=;
        b=rDJn+qUQ/FmslFLsTySg7rhltWTl/2XFgVpSjUxfDm2DhoRWJRNW6hDcVJzn/yFdXX
         10C1xaUGab9wZWfJbubRJRkB1FHbdJmadbEfNqmWHqrd1rTUl2wiVvswDSFIuUr/upbQ
         i6YjeNbL1Z0F6KtDQEDg43Qm0x3RX+qNsQ6VKkQVnhCK6dklCNPiofdkYw+FfdRsVeBy
         YSN9J8u84foEcM3bXm2KSMQVOArkoQ/T8O0OzKlCexCHPQXCwmLzRf4bzWHuY+UY7U1C
         rWP3C6hnTAi3fD8cmZrEo5boA6u7I4vWELlWs6DEMA5nh9/QurvSy1083H/WehH+iPKu
         Dc9A==
X-Forwarded-Encrypted: i=1; AL+hErFwIN6ccXZsdhUoYLE3lcscndPK8gv0HvVgSofFsaXy7BuN7RQ+t1bC4zwUbkc7ZJGtfW0SPT8zXbWxRlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8REYzr4Pe/PLLAkzv835YaSEG7OuURYUDcjpoXlGP7DDu9zlWb
	DH7W73JxalGWNiy05+h441LEXCvSixZFxl5yUisMU4gBRGPjljuh4gEq
X-Gm-Gg: AYBFou1Lx6D5br9ETuWfaGDndiHuRiOaNOrxEWvP4dOJtzA/Q0HMEPUFh+1xDlYH4B+
	NS9I+9JUweCgfZeAph4/Es1X8kq/mnX1sphHSe+Bqe8DMgjCWpkLQYGNKcn9N6NxYm4iXvCTgUY
	eYjxRpnj+/rITZ2Os0EIRodN29Hx0CDUinugal8aS5VidOp12Nz0GDiCZHa0ErDhcuZbE8F8HxZ
	bWgS2fBsLTvX7kZAM6ZRabj+wSWcPwPklxr3hFyignKx0iZMGiCpMzfQ731933aL1SIFzpvYa9H
	GHeGNx9Az5MGzuWd0luwlv4WpjJmXFlyMyKVzpLri/obeHmkg8oOQEwIaUhn8aye4BOo7880nK2
	QrkZJ0xePyS9NmdcE2KqGavlVEYEBZNqA05stsKfRBnEQ6ZM9CRJxehNF1vhi1UlBh5yROnXd3v
	G0CFEV8y5wjJqTEQ6M+8iwPJZXrwkJcCgTyMjTFgtGh1ARHZMwwjBYg6nxsFX4xlQqHKqFhpjxU
	egf9Dz4Rxb+5+hDcfab4ng+AwpaJ+LcVnryjPfTCnbxxBA+0EKx3+/pW3tD7dxGzLZQiFvIqALp
	pNvsPgkYam+p0qHEqXbu
X-Received: by 2002:a05:690e:4503:10b0:67c:2b34:319c with SMTP id 956f58d0204a3-67d897f540dmr1252728d50.78.1794583270342;
        Fri, 13 Nov 2026 07:21:10 -0800 (PST)
Received: from gmail.com ([2a03:2880:24ff:4e::])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm2307745d50.21.2026.11.13.07.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:21:07 -0800 (PST)
Date: Fri, 13 Nov 2026 07:21:06 -0800
From: Breno Leitao <leitao@debian.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Stephen Hemminger <stephen@networkplumber.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v2 1/2] netpoll: use a raw lock for the deferred
 transmit queue
Message-ID: <avcqBLwy_TB0w6PF@gmail.com>
References: <20260928064239.32456-1-kmehltretter@gmail.com>
 <20260930192103.62973-2-kmehltretter@gmail.com>
 <20261001074819.gQ3w8q6P@linutronix.de>
 <ar7sTVun7mF-4nl6@gmail.com>
 <20261009155225.6Uy7b0wd@linutronix.de>
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
In-Reply-To: <20261009155225.6Uy7b0wd@linutronix.de>

Hello Sebastian,

On Fri, Oct 09, 2026 at 05:52:25PM +0200, Sebastian Andrzej Siewior wrote:
> I would suggest to untangle that local-irq-disable assumption. Then we
> end up with the ::write_atomic callback on PREEMPT_RT which will raise
> warnings. But those will appear only on panic() and as the last console
> due to CON_NBCON_ATOMIC_UNSAFE so everything will go according to the
> plan.
> On !RT the whole __netpoll_send_skb() will be with disabled interrupts
> due to the console lock. On RT it won't and I don't know if anything
> down the call chain assumes that.

Thanks for the patch, On PREEMPT_RT, the send path is clean.
all the selftest I have are passing fine, without a single splat, while
the unpatched kernel produces about a dozen over the same tests. 

On !RT, the first message triggers, but it doesn't seem a big deal.

  WARNING: kernel/softirq.c:453 at __local_bh_enable_ip+0x118/0x120, CPU#4: pr/netcons_netc/307
  ...
  Call trace:
   __local_bh_enable_ip+0x118/0x120 (P)
   netpoll_send_skb+0x1a8/0x364
   send_udp+0x348/0x4a8
   netconsole_write+0x16c/0x628
   nbcon_emit_next_record+0x150/0x3cc
   nbcon_emit_one+0x74/0x158
   nbcon_kthread_func+0x18c/0x258
   kthread+0x108/0x134

Anyway, is this patch something you are planning to send officially?

Thanks,
--breno
