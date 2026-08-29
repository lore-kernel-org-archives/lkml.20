Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD362272E6D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 20:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036020; cv=none; b=MWalsQo+4MEI+mFlnwy82LkKNSA/c95Gf9z/ucuP7ni5tOG57TEB28bYER53m7kTMEjSC1g8pGlY5DhIuFRmAJr3qnwjvSzC/Jk43+8DqqBQ+wbh4T3XgMSVODCgCLX4PsfFolIebvQRGiB0we7KlG8VXHlT2Dupg6aPhqtENmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036020; c=relaxed/simple;
	bh=YotKj/n7HEJkOQ0i0HvcaTeHbL0KjtVXMNArDGF4rGI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=hGxkRYHzepxB951cQDxGgMqsP7klXSfdNuHGJRwwn4UzhPyC3bcKJjGcb0smlkeM6ciZmy5g+w8gn50MRP7NvX9qg0fszZC5U+1i1cmYQZJAEdjLMVCzAG+Wop21cvG2rCARJun3GcEvFAubSOJi8dQkkikP50vR3/NEjD+tUhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvZohbYC; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvZohbYC"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9309d4ea213so210237985a.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 13:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788036016; x=1788640816; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wy61y1y/KGjTSjj8/a8SOjbmPUwv5fxA+GFfVHJzTfI=;
        b=PvZohbYCLeeNRUBnk5z0XYG3+3F0TrNJhLpA4HV8aIbLCs4JMp1lzpl/wdvulRAYEd
         tHFG3UiwZQ9q9Qaxt/B+pi/WyOd/Axw6tulJ7t1gEXTxWMlXHhcLMIDc7RGaV1LhI423
         BdpbQnj4/zcIVcPaieN89tTRkxtypjsRGWlUlXWHYsgWzD79IFJuAF9iiMHCyWT+jbjv
         Bxy6YVbKFTVT4Sk7aBEPCBE7krFxegcYvb5HjO38CVc+DJyGEjDogkxMQ1xnfPsE6dB2
         pjqg5yi1XxR4vjlRbeHeD7JhZsmYiScCa/8C2Y0HztQKAHWpfFP6qbiP1ZS8qM5VX4+0
         G2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788036016; x=1788640816;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wy61y1y/KGjTSjj8/a8SOjbmPUwv5fxA+GFfVHJzTfI=;
        b=FUZJoByaNhV3jUs5UOZbrXa9CrM1eZuEutwamOX+E0cKNYG0fSY3NjQxt4wGib4LMB
         vwI6AYML8PIl/8khgawd3hC6M/ntcNmcT1ykTpxHJvphTu+7Cu009y7qogTO7vaT2G1V
         kNWHZS6ByqTiTUtLV2K59Y9xvXTeZfrYHjptQDedWnfMHy14uAyyqnVT+7UbnVJ47iuS
         QxTWKq3VtifLZZoACScdgbm4nlL8nR4BteVV5lfcLHV6DORAFsPP5rG/2qBD2vjb3smZ
         sgtbVw2yJWZNzKD25nIPkvVG5zLlgUN1D0nMQmYBnD024HI4ZCjxnmQNq1gk8Oh7Snvi
         kFYQ==
X-Forwarded-Encrypted: i=1; AHgh+RppTJFwl28zu9Db5msTgwOwG1Fg/BBLfkI5nM84+ebArGKlS6tm3hGSU9MWD8F9eXc9UQ7Va4JaeNRlqtg=@vger.kernel.org
X-Gm-Message-State: AFuF++nytmaeITEYjpwfWO3PJX2CU+tFsdh7cD2TfMTyuPCpzw7+xK9H
	BaHJk7kqoQ1TYQUN/OryMS4loCqhOpW/0b6QA4bb3HBoNYAbhR6WAqKy
X-Gm-Gg: AR+sD13iL51HHpliQaZK8ajtmZiD4iMgM+avC81E6Wkd7UkmMKayuoSyuOs2wwzHxdU
	tW/SlJ3hm4jz9e2pci4+VxOh4KPcnHdvpePRKFodCLm7LqOBO8RdExCJFKa0I4cJepQOw0TXJjW
	5dSrWARJNkTgxLgdTe25Q8xnIWMHDYh1d9RdxLDlULp/lI6v2Z8u5buybDU11395oFzOMuRA4rA
	vueV33msx/Gmd5gVNxXaja6nbb/AZgUoG9oo+QdksWq8OiFQDjpw0Ge+mMz8b+eKLNn1Bz6hRMV
	IwheRQyv5/l7RADFd0ZnN6AYU/9rSqIweoWUsU1UCh4Mq3JkPzhZ+dK/TJ9gFeU+f38ocOv3H8t
	Y3cuJAY+v9b9HOyQWHA/08S+vkmTCqZxFakWs4biLgqBDqJ1FHHsOezy2XHilPMIKPUX6hdaJbz
	xY9zn9pKp4x8BN+MoMK5cxcTPi2qlSaQNHMQ4Rj05/aYjn4a0VSL9ZUpoZo/16ETDL68vMFEk+7
	O3Q
X-Received: by 2002:a05:620a:6d51:b0:938:fe7a:b829 with SMTP id af79cd13be357-93913901128mr1397559685a.23.1788036016024;
        Sat, 29 Aug 2026 13:40:16 -0700 (PDT)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939170138eesm439012585a.3.2026.08.29.13.40.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Aug 2026 13:40:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 29 Aug 2026 16:40:13 -0400
Message-Id: <DL1PV8WQ5ZC7.1128ZBRNUPNUS@gmail.com>
Subject: Re: [PATCH net] net: psp: do not inherit the Rx association on
 clone
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Norbert Szetei" <norbert@doyensec.com>, <netdev@vger.kernel.org>
Cc: "Eric Dumazet" <edumazet@google.com>, "Kuniyuki Iwashima"
 <kuniyu@google.com>, "Paolo Abeni" <pabeni@redhat.com>, "Willem de Bruijn"
 <willemb@google.com>, "David S. Miller" <davem@davemloft.net>, "Jakub
 Kicinski" <kuba@kernel.org>, "Simon Horman" <horms@kernel.org>, "Daniel
 Zahka" <daniel.zahka@gmail.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <BC10EB92-ABB3-41B2-AB16-266BEEBE18C0@doyensec.com>
In-Reply-To: <BC10EB92-ABB3-41B2-AB16-266BEEBE18C0@doyensec.com>

On Sat Aug 29, 2026 at 12:56 PM EDT, Norbert Szetei wrote:
> sk->psp_assoc sits past sk_dontcopy_end, so sock_copy() copies it into
> every socket accepted from a listener without taking a reference, while
> inet_sock_destruct() puts for every inet socket. psp_twsk_init() does
> refcount_inc() for the timewait socket, so a child closing through
> TIME_WAIT cancels its own put and leaves the association with one
> reference and N timewait sockets holding the same pointer. Closing the
> listener frees it, and the timewait timers then put freed memory.
>
> Rejecting the association on a listening socket is not sufficient: a sock=
et
> can acquire one while established and then be turned back into a listener=
,
> because tcp_disconnect() leaves sk->psp_assoc in place.
>
>   BUG: KASAN: slab-use-after-free in psp_twsk_assoc_free+0x6f/0xf0
>   Write of size 4 at addr ffff888110f9255c by task swapper/7/0
>    psp_twsk_assoc_free+0x6f/0xf0
>    inet_twsk_put+0xda/0x1b0
>    call_timer_fn+0x53/0x2e0
>    __run_timers+0x764/0xa80
>   Freed by task 99:
>    kfree+0x1a7/0x500
>    process_one_work+0x7ec/0x1100
>
> An association carries a per-connection SPI and key, so a child must not
> inherit the parent's. Clear it on clone.
>
> Fixes: 6b46ca260e22 ("net: psp: add socket security association code")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Norbert Szetei <norbert@doyensec.com>

Thanks. Nit: I think the commit message overemphasizes the timewait
paths being part of reaching the bug. I suppose that is because the
included trace went that route, but I think anything that happens after
the copying of the socket's psp_assoc without taking a refcount will
reach the same issue.

The fix looks appropriate to me. I also think disallowing rx-assoc might
be something that we ought to do.

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>

> ---
> Reproducer available on request.
>

Sure. Let's see it. Here's one with packetdrill and netdevsim:

cat gtests/net/psp/repro/psp-listen-assoc-uaf.pkt=20
// Expected on an unfixed kernel:
//
//   BUG: KASAN: slab-use-after-free in psp_assoc_put.part.0+0x1b/0x60
//   Write of size 4 at addr ff11000112918a60 by task swapper/3/0
//    psp_assoc_put.part.0+0x1b/0x60
//    __sk_destruct+0x7b/0x630
//    rcu_core+0x508/0x1470
//   Allocated by task 258:
//    psp_assoc_create+0xb7/0x3f0
//    psp_nl_rx_assoc_doit+0x1cc/0xae0
//   Freed by task 77:
//    kfree+0x321/0x500
//    process_one_work+0x89f/0x18a0
//
//   refcount_t: underflow; use-after-free.

--psp_udp_port=3D1000

// Initialize a listening socket.
    0 socket(..., SOCK_STREAM, IPPROTO_TCP) =3D 3
   +0 setsockopt(3, SOL_SOCKET, SO_REUSEADDR, [1], 4) =3D 0
   +0 bind(3, ..., ...) =3D 0
   +0 listen(3, 1) =3D 0

   +0 psp_rx_assoc(3, [7]) =3D 0

// Complete a handshake. The child cloned here silently shares the
// listener's psp_assoc pointer with no reference of its own.
  +.1 < S 0:0(0) win 50000 <mss 1000,nop,wscale 0>
   +0 > S. 0:0(0) ack 1 <mss MSS,nop,wscale 8>
  +.1 < . 1:1(0) ack 1 win 50000
   +0 accept(3, ..., ...) =3D 4

// Reset the child so close() destroys it right away rather than parking
// it in FIN_WAIT/TIME_WAIT.
  +.1 < R. 1:1(0) ack 1 win 0

// First put drops the only refcnt
   +0 close(4) =3D 0

  +.5 `sleep 0.5`

// Second put: psp_assoc_put() touches freed memory
   +0 close(3) =3D 0

// Keep the VM alive long enough for the splat to reach the console.
  +.5 `sleep 1`
