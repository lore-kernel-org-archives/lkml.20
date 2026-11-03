Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793683707;
	b=XbFmrd0T7uCgLQE0Lsq9JCQfTqW6PPnFqoAYckaFeN3XmXCQQN8fGDaI8bzz0syqZnjb
	 3SsPJ7vKaDANkSFsuy5qVUhaRkxFvRtFyD8qUmQspu7CGN/pUfJIAtN5ncuEo1tkeQWXh
	 W3YV82Q0rhtnm9yK4r5VfhZOzqgXda0Mlt7wRbZYFPmaoChmA8b+3gptTMDh+91Fm2o5w
	 hK3793mylpyS1Mon42KyMT+bbhZpwrDaAwgyR+mMngs9mdXrKWUb2V2D+LLgl6nWuM/3q
	 c6+7gfsYzW3Soql0w8VX8hgwZwF73g5T+bRLuSHBAUzTULY4iwmSbtOqiov9oyMrkGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793683707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=aMipWiH6il94+oUwDW54rQDx5szuOcXlyk5T4hyKyg4=;
	b=X/wctOVsQSGBVUn6u55TRsg61z+/oCsXsXacRM/r0DcTmN2CyxTqbKUk9CaWZC0ySPf4
	 GT42CU54DqDK0OV9lweBVObXcHaKhEayNj1Y4+eGMn8qdtcCbYILxVPSu+4+BilTdhBWb
	 +jBW+AYX6z2jmY1GKpxcYsRCNwlVOAUSCCSKaGKTm8TphsJFaGZxCvTJvS/6v3XIOFiL8
	 RtTMZ2sdGmUZJfsVmGWIe+/ssSSdK/Dn17/ekcGd/h4Inwe1/QZSUomOyJ6qm917jiw70
	 Kak8jvNnlNI6AG7MsJrcG8pp0RZyYFtin/w59J0WmAhzdIyl+UeHmBtzDCbQbn8Iiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D67W3iim;
	arc=none smtp.remote-ip=209.85.215.199
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BFF606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 05:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4BFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--kuniyu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=D67W3iim
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdac99e77d0so1591222a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 21:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793683706; x=1794288506; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aMipWiH6il94+oUwDW54rQDx5szuOcXlyk5T4hyKyg4=;
        b=D67W3iimOk/17qGhxaN/Eawx3Q2tNpJFK0LUWfdETtro3W5sr5EGCkDtygYnrx3UvE
         PtO/AIFMUKKybxavy0wGnv3amrfM6FJIKFNt14XbVqG0vopML4NPoL4HXIaCQW8Wo25E
         m2r85wLt0I2rv+glgxFJsvLAtqMWBPZm278yijwrr8OG4wgS5Pk5vLexAebxkOOIkd+L
         j1PGpV1WORgkgY/3DRz+2HvMER6SxBjqqsYdj2xoJJ5Str90PpCGDgAspN7XxAxO4Rwk
         B5ZNQ8zEg8uFh14BuOQ693MX1cwsra3iI5VUMDItTILNsN1s9vRhRN9gUHrngxfZ4+SC
         nAgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683706; x=1794288506;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aMipWiH6il94+oUwDW54rQDx5szuOcXlyk5T4hyKyg4=;
        b=uOplt9EfzAntxru+MWtkc9juGKywfrOcO08KMGEe3GMj3DJfjF5OCQ+KgIURQ73ZRR
         ncIdQPmk8Hthc4jQlAJcXL6VFUAMZIjoECX42MW4ut9uivnvkG+UBpTsZXWfXryISbPC
         SPJrdMOdDJFoBqT9/aIX8V83hzjL3mtvzkSVnF6zvgWtR+X2HBrfWf817K/m5GMvJULx
         73oxuX1i5bcz04jD24rIM7hWo0u93j8V+RAFfwfcXpzFfkQV6c1uo+pPG2eg+aghNX8C
         ro4xYvQwdX1kmUCTyiyDFCQIayd+IVCICLw8fntYDN++VXl1a5mi4R76WGzSBLIFaTPV
         XsUg==
X-Forwarded-Encrypted: i=1; AKwUvBwxQ+euMveb4MHJovtjR68/+SIryeNSs4230i2CX+g531V067kz53bcTVqKfykWBt4xuPh+YkVrSv8Rkmc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gB+3rY+f1T9UqnMVY+7UkZKHtJx69zfM5UXSYgqmUfF4xVgXZ
	JfscH0ij8ZnmGsp0VcfQq44nw+BTr7ltEZIzCodSOEaQEWB51HIUissGDpW5FeuUK3InNRYc9YA
	Emw6FWw==
X-Received: from pjbpj10.prod.google.com ([2002:a17:90b:4f4a:b0:3ad:6c5f:feb0])
 (user=kuniyu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d83:b0:3ad:85fd:711c
 with SMTP id 98e67ed59e1d1-3ae89736495mr10727525a91.28.1793683705855; Mon, 02
 Nov 2026 21:28:25 -0800 (PST)
Date: Tue, 3 Nov 2026 05:28:25 +0000
In-Reply-To: <20261101061331.286404-3-jiayuan.chen@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261101061331.286404-1-jiayuan.chen@linux.dev> <20261101061331.286404-3-jiayuan.chen@linux.dev>
Message-ID: <aulw7Bfq65l738px@google.com>
Subject: Re: [PATCH net v3 2/5] ipv4: fix shift-out-of-bounds in ip_rt_send_redirect()
From: Kuniyuki Iwashima <kuniyu@google.com>
To: Jiayuan Chen <jiayuan.chen@linux.dev>
Cc: netdev@vger.kernel.org, stable@vger.kernel.org, 
	Fernando Fernandez Mancera <fmancera@suse.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>, 
	Joel Granados <joel.granados@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Willem de Bruijn <willemb@google.com>, 
	Maoyi Xie <maoyi.xie@ntu.edu.sg>, Jiri Wiesner <jwiesner@suse.de>, 
	Zhan Xusheng <zhanxusheng1024@gmail.com>, Gerd Rausch <gerd.rausch@oracle.com>, 
	Oleg Nesterov <oleg@redhat.com>, Chia-Yu Chang <chia-yu.chang@nokia-bell-labs.com>, 
	Wyatt Feng <bronzed_45_vested@icloud.com>, Yung Chih Su <yuuchihsu@gmail.com>, 
	Hannes Frederic Sowa <hannes@stressinduktion.org>, Flavio Leitner <fbl@redhat.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sun, 01 Nov 2026 14:12:00 +0800, Jiayuan Chen wrote:
> ip_rt_redirect_number is the max number of ICMP Redirects we send to one
> endpoint; once we hit it we stop. Before that, ip_rt_redirect_load gives
> the redirects an exponential backoff:
> 
> 	if (peer->n_redirects == 0 ||
> 	    time_after(jiffies,
> 		       (peer->rate_last +
> 			(ip_rt_redirect_load << peer->n_redirects)))) {
> 
> n_redirects grows until it reaches ip_rt_redirect_number, and both
> redirect_number and redirect_load are plain proc_dointvec sysctls with
> no upper bound. Set redirect_number past 32 and n_redirects climbs past
> 31, so "ip_rt_redirect_load << peer->n_redirects" shifts a 32-bit int by
> >= 32 bits, which is UB:
> 
>   UBSAN: shift-out-of-bounds in net/ipv4/route.c:949:6
>   shift exponent 32 is too large for 32-bit type 'int'
>   CPU: 1 UID: 0 PID: 1845 Comm: ping Not tainted 7.3.0-rc7+ #364 PREEMPT
>   Call Trace:
>    <IRQ>
>    dump_stack_lvl+0xc1/0xf0
>    dump_stack+0x10/0x20
>    __ubsan_handle_shift_out_of_bounds+0x1d1/0x390
>    ip_rt_send_redirect.cold+0x2c/0x146
>    ip_forward+0x1ddc/0x2430
>    ip_rcv+0x2b1/0x320
>    __netif_receive_skb_one_core+0x16b/0x1c0
>    __netif_receive_skb+0x21/0x150
>    process_backlog+0x37e/0x1200
>    __napi_poll.constprop.0+0xa5/0x5e0
>    net_rx_action+0x4c0/0xf70
> 
> Bounding redirect_number instead is not an option: 0 disables redirects
> and -1 removes the cap. Compute the backoff in u64 with the shift count
> capped at 31, which cannot overflow once ip_rt_redirect_load is
> non-negative, and clamp the result to MAX_JIFFY_OFFSET: on 32-bit a
> backoff of 2^31 or more is read by time_after() as already expired. This
> keeps redirect_number as the limit on how many ICMP redirects are sent,
> and the shift can no longer go out of bounds.
> 
> redirect_load on the other hand gets a lower bound of 0. A negative
> backoff never meant anything, the old code only happened to treat it as
> no backoff, and once converted to u64 it would turn into the maximum
> backoff instead.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Reviewed-by: Fernando Fernandez Mancera <fmancera@suse.de>
> Signed-off-by: Jiayuan Chen <jiayuan.chen@linux.dev>

Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
