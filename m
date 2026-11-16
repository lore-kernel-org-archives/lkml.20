Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794796336;
	b=jPHxB3U1QNKSGtPcchhbnlMJ+u8yzGun08kvRke3POZq3ymSvPi4EOjnycLNyxyT7wHd
	 alSp6dEs6DMCg6pfYg1wg5HIk31GHuigpf7Aj21kVanxEO6rmLWHRU749ycQ+vHhtqxpL
	 Lq47ewFWcSoKBj5Q37enqZqOhY8mzp2WU8F+okXswWeVak0uv2zbE9A6j847Qw0NeapXE
	 LIlRa/L5u9uRVLzus3HeI6vWT1tKcpJ126+2rJAMjk90iT3rqS4HSAH7YnHAAhD0xF8SI
	 OxWMcAR4hb+3Ex8UTXpC3b9tcS7RjFLJih0J5vjRYAkQMOctdn0WsuRPAFL/Qqmu0bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794796336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=HL9KJ6zJx0cYgN2NafMIfK7yVZJpUohcZPTXV+OQ/Ow=;
	b=cIucWm0FOn58cXj1TEwbNJPENuONc77YTNF8yMBmIkxord17NYKgd+1PdKIx2TBBteNE
	 fM0rWEk1ti4g9mH6avU7HUODmLmI5xGw3NDx0kFj45D5ESyAhwfCsdY/x1T5vChQ7U7gE
	 o2MxzOeZYd2x1dXKo9qeWU6sy0jt8Cohw8sA8XGl7J57AanTM0W3axLdlmBhcfw0cTVuM
	 m4J2hCSQ4FxKDVURbUp6hhPBGZR/WzxjNsEnPeNrL1fVT/Ja1KAIjh7g8jyokZ8U2tQCi
	 2wJYeuzuxj13o+eM1nUiT/QWtPae4JxlgLSpguvBhs4g/bGyLOadIsKzf2HRbfCddSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5qduGPN;
	arc=none smtp.remote-ip=209.85.222.69
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD21606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FD21606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--thaisonphan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5qduGPN
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99e0e774882so779677241.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794796335; x=1795401135; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL9KJ6zJx0cYgN2NafMIfK7yVZJpUohcZPTXV+OQ/Ow=;
        b=p5qduGPNWYEdMm58fmgaqV+WWGO2kO1BdwPyIACIzLv+7zdvvT129FbE/bFatUg8IE
         rjLFwG17fbP3emtXYQWIvrDJb0hqMwGIX0/DqhRD7ycbV3ROoBpYtMXibjB1rUpFA5DO
         tDG1OqWUzm/3jHdAFCGuHrGmp/nMdPeWuApD8+29AWjZH4lBoXeaCdU3f3cc234gaLbO
         cBvt/m2c77eyyMKM22rxO4YukmySjv1LXhF3e2KFUX8j3Jb5K0s5csW8K6IZDk+UUIwh
         CVwcjGmRStMNa5DoQF22nmtDqRTF86YWOEbo36vUKEHD3AWiUb8xp+hBjbkksZd1QIyw
         F0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794796335; x=1795401135;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HL9KJ6zJx0cYgN2NafMIfK7yVZJpUohcZPTXV+OQ/Ow=;
        b=JCLtSfk/15LDovdFIDLYQVd91Az42iVEiSHpqBVWTb0sQz/75C316XzjMwcrd2LJN4
         6dBuQcvlFT3DrBWKHXORmJHaDPWjNjbiTousaBCSrkwwhYHorRljNJ2qTQoI/5EeGvCf
         wZmXHQfLme7a3anfayUovSlmhbwDsNvNjuXtO+i7apWeiaLIhv4Nk/tDZTXyV3jnFUJ0
         6o0NlEOdAr/Tr0v5OVYPr0o4hvYpffDi4XtL+TmcKgBNhEI+8xKFh+/goEGTabMHMblN
         XI1q48lYBu/+PYIw/iYC5y1NDF/DWJ/f151QRc73ypjjhrGjiKgVt2YqNXnIwuY64xAR
         3jsw==
X-Forwarded-Encrypted: i=1; AL+hErGybvmAiOSNrDgnq9r02h0zNuAZfmLZUGNVmwCMzWu2kg6xJvhHpclzJfOZS8WXHLRmxsZEBCllOSgo2dQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WMLPiCeAfZb1zuMQMV/vvXgglwlyXsfkzkfNWP6PuG4Zoy+z2
	ceT9nwF/DMe9ZGMobZ1BfH2ekQmF00eJIrkqYfrquApgJBW0J+wQFHRdlRVbcHzsw/aNbZiZmCm
	yatosMGrYPkz5iR+o4IZApV2/mw==
X-Received: from uabig12.prod.google.com ([2002:a05:6130:1ecc:b0:99e:b1a:30])
 (user=thaisonphan job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:510f:b0:7ad:3ad3:997a with SMTP id ada2fe7eead31-7d64d45ce68mr3464173137.5.1794796335056;
 Sun, 15 Nov 2026 18:32:15 -0800 (PST)
Date: Mon, 16 Nov 2026 02:32:11 +0000
In-Reply-To: <CAL4Wiipd8pVX8Rxkof+29iSmfoAC5tytsOh0afnovEwaZ4NEjQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114161248.3428695-1-thaisonphan@google.com>
 <20261114161248.3428695-3-thaisonphan@google.com> <CAL4Wiipd8pVX8Rxkof+29iSmfoAC5tytsOh0afnovEwaZ4NEjQ@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261116023211.129862-1-thaisonphan@google.com>
Subject: Re: [PATCH net 2/2] tcp: accecn: initialize AccECN fields in
 syncookie path
From: Thaison Phan <thaisonphan@google.com>
To: edumazet@kernel.org
Cc: chia-yu.chang@nokia-bell-labs.com, davem@davemloft.net, horms@kernel.org, 
	ij@kernel.org, kuba@kernel.org, kuniyu@google.com, 
	linux-kernel@vger.kernel.org, ncardwell@google.com, netdev@vger.kernel.org, 
	olivier.tilmans@nokia.com, pabeni@redhat.com, stani@google.com, 
	thaisonphan@google.com
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 15, 2026 at 09:13:02AM +0100, Eric Dumazet wrote:
> This is a different bug than the uninitialized fields above, with
> a different impact. I would prefer two patches, one per bug, but
> since both Fixes: commits landed in the same release I will not
> insist.

Makes sense. I'll make sure to split independent fixes into separate patches
in the future.

> Same remark as for the LOOPBACK4_IPV6 patch: KASAN does not catch
> uninitialized bitfields. Please say how the failure was observed
> (KMSAN, tcpi_accecn_fail_mode in TCP_INFO on the child, ...).

This was spotted by code inspection (with AI assistance) comparing
tcp_openreq_init() and cookie_tcp_reqsk_init() while investigating the
LOOPBACK4_IPV6 bug. We then verified it on a kernel with SLUB_RCU_DEBUG=y and
slub_debug=P (preventing reuse of the warm request_sock from the initial SYN),
observing bogus tcpi_accecn_fail_mode and tcpi_accecn_opt_seen values in
TCP_INFO on the accepted child socket (as well as tcpi_accecn_fail_mode=0x2
when the listener sends ECT(0) on the SYN-ACK).

I'll update the v2 changelog with these details.

> I think syn_ect_snt is always overwritten in cookie_{v4,v6}_check()
> before being read, this line is not needed?

Agreed, cookie_{v4,v6}_check() always overwrite syn_ect_snt before
tcp_get_cookie_sock() reads it. I'll drop that line in v2.
