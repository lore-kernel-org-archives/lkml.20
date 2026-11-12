Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794479510;
	b=hojPo0bkRE339u/0ewN3zMj9EbYZ09+ecu6yM+iWx6/oyFKt/9cduywImLFVqOPK5/4m
	 nP+i6aKiR8Ctk65wrEunw73E+2iNMGnvrZOA/dp20F4HteX185Zk2HkJrZAkFKUeAfE0b
	 bcUKVbZ6z+QGKiNlDDl6XMUzoevM79PgDH+MpUIU2yl81DSk6lpmJHpapfd7f+AR9syBG
	 +10Be6q7kcb99diUUPZNC4hVpo5Cynuvk3HbXrKO/PHcM20fyU6jDcATTTo88rBkR8ar2
	 jN2Orof5k9LMVruhXxh9m6Tg+KP76l9pLaML6xtwfsO+an8NBdtZ0j6Zj1ik7/5U6iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794479510;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=yIfSSvtYFozNJ8uO5B+lxZMTaHwZDbj51+v24gVRaB8=;
	b=VB/wN4KdjjVRPZrzMn5Eve+EwWLr3ioO/dxbfoLyML0W/6wbN0Hw/iRe/zkmH/4Xb2Gl
	 6JDRz1cUbjZbRm7qxFRM5V8foPiQLxKUKlobpS2bigHjQWR0vZjTDsKxrq3fS4l3EGFOY
	 8iXgh2hD1ZiQ63pqvpoDtG5VR0VPrymXcAlzfL1Ent2B/FgmPom7YC4SVIWRcm0brz4r9
	 rR35Nz5FBTIJFL52pgr5/A3EgScUHbKh1b265VZKUGqpt9bpEEy+qlBEhEajRrdawgdpb
	 Vkd4u7BStI2F4eKbZvMJps+eccZ4m0Dtrat2I1pUB3vUfmQ5GBxhdHtMH2sHO0yBv8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlEYfjSj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A298606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlEYfjSj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4066C1F00A05;
	Thu, 12 Nov 2026 10:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794479510;
	bh=yIfSSvtYFozNJ8uO5B+lxZMTaHwZDbj51+v24gVRaB8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=ZlEYfjSjhtqLmvEQw7PdCLgA0sYXe58WHLqq87VxfpQhMCWyO+2cZFtP+yWP9ESGR
	 UEV05Co6NOYCmtxPPCDVOmb7Kst3R3QOm3MFEh0mkONM9uo9XrJBoWcW2Xkz6dQxkB
	 4NL2sGdqgYZtz9W2M+TOdqPuMrZWmzAr4e0+eY2gsp8vW6LX4p2O0hu0ZfPQm/NAk+
	 N92VPtaSW4fIxkL6ilGXDlU36+THKX9VUr/eMdomDhLSxBz1ORsKe9EJsrqZRohm29
	 oYOwrhmu3w5PjGsw29urephUKXdhV1jwLZPeS4aTgBmYRk13XXQrNq++fTe4unLFma
	 Pc9CfYHOXpBBg==
From: Thomas Gleixner <tglx@kernel.org>
To: Zhu Jun <zhujun2@cmss.chinamobile.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+0b91948d3c6b28c0d4c7@syzkaller.appspotmail.com, Zhu Jun
 <zhujun2@cmss.chinamobile.com>
Subject: Re: [PATCH] timer_list: Annotate the clock event deadline snapshot
In-Reply-To: <20261111084108.80870-1-zhujun2@cmss.chinamobile.com>
References: <20261111084108.80870-1-zhujun2@cmss.chinamobile.com>
Date: Thu, 12 Nov 2026 11:31:46 +0100
Message-ID: <875wy2tk6l.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Nov 11 2026 at 16:41, Zhu Jun wrote:
> print_tickdevice() reads next_event while the remote CPU can update it
> from its timer interrupt. The value is only printed to /proc/timer_list,
> so synchronizing the clock event device is unnecessary.
>
> Use a single diagnostic snapshot and mark the intentional race, as is
> already done for the tick scheduler statistics in print_cpu().
>
> Fixes: 289f480af87e ("[PATCH] Add debugging feature /proc/timer_list")

This really fixes nothing.

> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
> ---
>  kernel/time/timer_list.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
> index 0406bf4488e9..5f80af00729e 100644
> --- a/kernel/time/timer_list.c
> +++ b/kernel/time/timer_list.c
> @@ -177,6 +177,7 @@ static void
>  print_tickdevice(struct seq_file *m, struct tick_device *td, int cpu)
>  {
>  	struct clock_event_device *dev = td->evtdev;
> +	ktime_t next_event;
>  
>  	touch_nmi_watchdog();
>  
> @@ -199,7 +200,9 @@ print_tickdevice(struct seq_file *m, struct tick_device *td, int cpu)
>  	SEQ_printf(m, " mult:           %u\n", dev->mult);
>  	SEQ_printf(m, " shift:          %u\n", dev->shift);
>  	SEQ_printf(m, " mode:           %d\n", clockevent_get_state(dev));
> -	SEQ_printf(m, " next_event:     %lld nsecs\n", (long long)dev->next_event);
> +	/* Take a diagnostic snapshot without locking the clock event device. */
> +	next_event = data_race(READ_ONCE(dev->next_event));

data_race(READ_ONCE()) ?

READ_ONCE() needs to be paired with WRITE_ONCE(), which is not there to
write dev->next_event. And no, we don't add it as there is zero value to
it for the regular usage outside of this debug code.

data_race() is sufficient to shut KCSAN up and you neither need an extra
variable nor a comment. data_race() in debug code is selfexplaining, no?

Thanks,

        tglx
