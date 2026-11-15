Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794777603;
	b=dQRvX//CNRtSOCSMgExiyCD+yCctqVVzac4V1c0bn3V1d80C4Q7Ieu1FqE85CbG2mJ4i
	 bqXUdE1+I6+o5yViirVKMS72ghqdzE6+hQzXeFDxqBmJW/WLoY7/nMgussw11wduLCs5N
	 dZf95/sZdWX5id+TaZVa93RcEeM9CdRL0A1jlygJhPz6poIvhQl5bkjy827ORVP04egCz
	 PcsXNEk00ICeDyXEOoJ2z/2ju2cbbUP8i9LL/wFO36pUoJa8ho2pTQircgR/qPkTyk9pH
	 t+VQu6Q9BCq93n6iv4Y23rzOJF0iNQFDb13y2qf5GXt3or8SHx4XABG0RcINsh3OtBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794777603;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dtbbP4pgpdzoFnLdU2E++Ne7ZR8e9rHPOR14H65teiU=;
	b=nXNRJzcFU28YCh6gfBMVDitMev0ZQvUDWEifn12tx/4KRjuc4yUJnwjGiZ8ygA8Q/33k
	 g8qSld82Vg5nuzLCqrRjGHU61qMxfcAiOOQ196Sl1T0hs1lVwz5e5JVQH8+BeUJeFL5Wm
	 sycQpL2cATaFOjbSAZ7oOuLhD7fBryOKBgEf8Dhw6+Vf+qInpF09KLxTSH/jtAbSwdvtc
	 cMGgcd0h/ShXHWVTswcadUmwWWaoPBdpfxfvldeSuo+59mPlWvkdxdRPjsKbzF0TG1B7H
	 wmw1DPnmVPU35i6Hq2sA99OZrtr/ss8vDtTZ+RfiBuuu9HtCh/VfGGlfgU7a1mqd8fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fnf/+gl7";
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1B7606A332
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A1B7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fnf/+gl7
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so631194137.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794777602; x=1795382402; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtbbP4pgpdzoFnLdU2E++Ne7ZR8e9rHPOR14H65teiU=;
        b=fnf/+gl7xWZ9bprfAV6RU0BKFYTWbIq3RLd4lh6Ec5NsoKDvizz+aqe5AnJGk+6J70
         TcilFblN6ZQ3IQAqNAuswgmX3OFI5WiGyjGX71QHhYyz7daXS8AVhzl6PwhP0+UIL4Ho
         3kRIV/C8vjlGvTd9Lz+4M4MqqZnZMITZmXn3oQQ79zfmC5clozeHczs6sJ9HL28ztpik
         8JriEjH4bIc31nG9/fmvob0xER40TpuaW1ub8jfrwGzN/vM52l436hbwngOst2Fl+eBZ
         PpaMZkcL7Aog9wHFJQ8QnTYxoix3HGvaD5ZzE7at/gtJ7x5LRkM+MyRo/fgqtNF4RfaU
         pTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794777602; x=1795382402;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtbbP4pgpdzoFnLdU2E++Ne7ZR8e9rHPOR14H65teiU=;
        b=ITjWinEuGkwQFNeFWW9WxqY9QbPPbYp3KEctX1996Pe3Z5hU0GP/vJdPFcJvSK0dQp
         oPmagUv7fpoYGLcIF7X14iJNPcjFLt6IcIMym37KRZ2mdPmQLSX7oM6X/5/I/rdl4axM
         2Kg/carjb/jrr8wBIG8y1CtNVJ8qS65TTOG+iCuAnR50H0HA9rtwY7f9A7G7cvhw39Cg
         ZI/FHyCGdHkoHMHKo4E9tbKLdvVSxL9CqdA86O/g9gJsPI/Qy8aC6maU4SG5vY6XDk2s
         tNHms1tHmRgJQxFNvCanh3G97vhUwKHUZBnfmF14zCVOx3V99gWDeK6wH/KyMQ+ErqIB
         ciwA==
X-Forwarded-Encrypted: i=1; AL+hErHBuXy/prO/+pnkc3A/8RnDm26/jUwZTTeZqBpfe+q4gD4Tojw07Ec1tIsHhsR+xTRJ/VQuJwxYF1jpvP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+k4EtnnVptCiPSiktUMGpE3fLtTH90kuFG4R2jsdnsM+PSQFhz
	VRztddGCBC0T+dq42hbPUBUptywK0iolEjve4jq1R7DV6fjXM5KLdpY+
X-Gm-Gg: AYBFou30NG79NC+TZ6Ael48zbhRq5Rg09zv9j/tbHWh2v6MMyCcY+Ih3Zqq3m4F43qq
	Lh4SmdwCt2ggx0z/hd70j96dxc2DkKLizIjBFYnO8Mtnzu4ovE/jTPyP465LWZ1QhiybcgWUUVQ
	+rT0pbZ74UqQNxhKjBeA2t79Fs+i75MibHMb7cDy1Vvc48PleQtyiA0RzKaqmIXnpkTKPJ8hkIq
	fmpIP9J8a9yA8yOkNp7W1qUFZxhI8la3DB5AsMCwxGacDvtkfFNeqOzxb5b9K/C9lbBzSQUHKo3
	Cv6DDdNX7n5STYoGqOsT+rO/YHt06q1e3p4m8gE62fKuVe/49H/shBAg3XulCf1zyeSd9J8+aAr
	7m/DU/lwCRQH0Og3EdGW7O6VeZgkOJPg1vS2YQOwTrZ3PS+Hv68+7xsBx5vRrH9OnfQdsoyhjFj
	daXoHtL7RhchBdZxOROYYFuaHjXDj9rzMSlUFHU/R1AxdMi5UYmNpY/NMrP1Ay9Gb0RUg/2sf/e
	y5nR8IsbyLJ4I0IXoKGSZkEULhIUJMUawtHyuH3Dg32SztQGg0RPgz9U91cAS4f8t20Tompk2l+
	0Ab9xV8U27Mkv9eVCMOFwvQm0nof/17eol83aOJjH7IMJ6Z2wqr7iWHCq6xbYQCQfcQuZbNE2/0
	pn7E1yUwFvf4j/UI=
X-Received: by 2002:a05:6102:4188:b0:7b5:4700:3a58 with SMTP id ada2fe7eead31-7d64d87536emr2578575137.31.1794777602130;
        Sun, 15 Nov 2026 13:20:02 -0800 (PST)
Received: from localhost.localdomain ([2603:9000:d440:53a:ad6f:df60:32:5fd1])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ee34e67eeesm5038673e0c.10.2026.11.15.13.20.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 13:20:01 -0800 (PST)
From: Juan Agustin Niccolini <juanagusnicco@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	ncardwell@google.com,
	kuniyu@google.com,
	josef@toxicpanda.com,
	jbacik@fb.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Juan Agustin Niccolini <juanagusnicco@gmail.com>
Subject: Re: [PATCH net v2 1/2] tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
Date: Sun, 15 Nov 2026 16:19:47 -0500
Message-ID: <20261115211947.54498-1-juanagusnicco@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179476655840.3136.16698637030692656920@kernel.org>
References: <179476655840.3136.16698637030692656920@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 18:15:58 +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 · High: 1 · Medium: 0 · Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [High] The fix still lets the SO_REUSEPORT bind cache admit a
>   conflicting socket.
>
> --
>
> tcp: Fix the SO_REUSEPORT bind cache admitting a conflicting socket
>
> This commit adds fast_sk_reuse and fast_bound_dev_if to struct
> inet_bind_bucket. In the FASTREUSEPORT_STRICT state, sk_reuseport_match()
> now skips the bind conflict check only when the new socket matches the
> cached socket's family, IPV6_V6ONLY, bound device and SO_REUSEADDR.
>
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_sock.c
> > index e56beec438773..70b8662b30048 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
> > @@ -420,13 +420,18 @@ static inline int sk_reuseport_match(struct inet_bind_bucket *tb,
> >  		return 0;
> >  	if (!uid_eq(tb->fastuid, sk_uid(sk)))
> >  		return 0;
> > -	/* We only need to check the rcv_saddr if this tb was once marked
> > +	/* We only need to check the fast_* fields if this tb was once marked
> >  	 * without fastreuseport and then was reset, as we can only know that
> > -	 * the fast_*rcv_saddr doesn't have any conflicts with the socks on the
> > -	 * owners list.
> > +	 * the socket they describe doesn't have any conflicts with the socks
> > +	 * on the owners list.
> >  	 */
> >  	if (tb->fastreuseport == FASTREUSEPORT_ANY)
> >  		return 1;
> > +	if (tb->fast_sk_family != sk->sk_family ||
> > +	    tb->fast_ipv6_only != ipv6_only_sock(sk) ||
> > +	    tb->fast_bound_dev_if != sk->sk_bound_dev_if ||
> > +	    tb->fast_sk_reuse != sk->sk_reuse)
> > +		return 0;
>
> [ ... ]
>
> > @@ -482,6 +489,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
> >  				tb->fast_rcv_saddr = sk->sk_rcv_saddr;
> >  				tb->fast_ipv6_only = ipv6_only_sock(sk);
> >  				tb->fast_sk_family = sk->sk_family;
> > +				tb->fast_sk_reuse = sk->sk_reuse;
> > +				tb->fast_bound_dev_if = sk->sk_bound_dev_if;
> >  #if IS_ENABLED(CONFIG_IPV6)
> >  				tb->fast_v6_rcv_saddr = sk->sk_v6_rcv_saddr;
> >  #endif
>
> [Severity: High]
> Can a socket that never went through a bind conflict check still fill the
> STRICT cache?
>
> The rewritten comment in sk_reuseport_match() assumes the cached socket
> has no conflicts with the sockets on the owners list.
>
> __inet_inherit_port() breaks that assumption. When the child's port
> differs from the listener's bucket port (the TPROXY redirect case
> described in the NOTE there), it calls inet_csk_update_fastreuse() for
> the child. It never checks the child against the owners of the target
> bucket:
>
> net/ipv4/inet_hashtables.c:__inet_inherit_port() {
>     ...
> 	if (tb->port != port) {
> 		...
> 		update_fastreuse = true;
>
> 		goto bhash2_find;
>     ...
> 	if (update_fastreuse)
> 		inet_csk_update_fastreuse(child, tb, tb2);
>     ...
> }
>
> The child copies sk_reuseport and sk_uid from the listener, and
> sk_clone_lock() clears sk_reuseport_cb.
>
> Suppose a listener without SO_REUSEPORT owns the target port. Then
> tb->fastreuseport is 0 and sk_reuseport_match() returns 0. The else
> branch above therefore resets the bucket to FASTREUSEPORT_STRICT with the
> child's uid, address, family, v6only, sk_reuse and bound_dev_if.
>
> One possible sequence:
>
> 1. user B, no SO_REUSEPORT: bind(0.0.0.0:P), listen()
>    tb(P)->fastreuseport is 0
>
> 2. TPROXY steers a connection for X:P to listener L (user A,
>    SO_REUSEPORT) on port Q
>    __inet_inherit_port()->inet_csk_update_fastreuse() puts the child
>    in tb(P), which becomes STRICT with fast_rcv_saddr = X and
>    fastuid = A
>
> 3. user A sets SO_REUSEPORT (plus IP_FREEBIND if X is not local), uses
>    the same family, v6only, device and SO_REUSEADDR as the child, and
>    calls bind(X:P)
>    inet_csk_get_port()->sk_reuseport_match() returns 1, so
>    check_bind_conflict = false
>
> 4. user A calls listen()
>    get_port() matches again and skips inet_bhash2_addr_any_conflict()
>    and inet_csk_bind_conflict() again
>
> A full check would return EADDRINUSE here, because inet_bind_conflict()
> sees !sk2->sk_reuseport for user B's listener.
>
> The new field comparisons cannot catch this, since the cached values
> really do belong to the child. The setup needs a TPROXY rule configured
> with CAP_NET_ADMIN, and the attacker has to run as the proxy listener's
> uid. The final bind() and listen() need no privilege.
>
> The selftest patch that follows in this series does not touch kernel
> code, so this path is still open after the whole series.
>
> Should an inherited child be kept out of the STRICT cache unless it was
> conflict-checked? For example, this path could set tb->fastreuseport = 0
> instead of resetting the cache to the child's attributes.
>
> -- 
> Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261111174704.24312-1-juanagusnicco%40gmail.com

This is a separate, pre-existing issue that needs a rare configuration.
I was already aware of it. My Sashiko instance flagged it too, and
correctly classified it as pre-existing, unlike this one.

It only applies where an administrator has already set up a transparent
proxy (which takes CAP_NET_ADMIN in the netns that owns the port), and
the attacker must run as the proxy's uid. A user namespace does not get
around that requirement. For the attacker to hijack traffic, which is
what matters for severity, even further requirements are needed.

Severity is medium at best. Blast radius is low, if anything at all.
Regardless, my patch does not cause it: the bug reproduces without it.

The bug this patch fixes needs no special configuration or privilege.
I confirmed it can be used to hijack traffic, even by a sandboxed app
on Android. It can be exploited on any listener that binds only to
0.0.0.0, which is very common, among other cases.

The TPROXY bug that Sashiko found can't be addressed by the check my
patch changes, even if more fields are recorded and compared, since
the cached socket there never goes through a conflict check. It is a
different kind of bug with a similar consequence, and it needs changes
in __inet_inherit_port(), which my patch does not touch.

Best,
Agustin
