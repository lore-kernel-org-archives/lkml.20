Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416487;
	b=j4e5xfcBHZ3mG2DzCLI84V9MAK8y0jiOyGsfMNiEHKtBWZu4z2+gSgEfmgre0dabVyv2
	 YEsrfEMpAZa6305pt9yvB14n4e4WSpePg2lmL4JWmrWRZnF8jdpz2I/w+M/iKg0gGydZH
	 PCk92YZrePSwIcpS9kxKXdoC8eobmHgB6uxt6TO9CzCvtHIDE4WbmgZX6zbJ78cj6MATK
	 flwzNu3RpgQDOwT8EwN7QISxgLC6vMuubxjIw8LOWHNluC8PLsc0NzjfQMNj5wNbIozpQ
	 W2zgZ0ZLAguoKdCy/Drt/wwL1KVU2AuhmFdVVSwI30wTj7QJuK6yTqVk+8Q62+rM/Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
	b=NnPXEp5kyP5C/7db/Nihi5WAy3frrI7RYnu48cZMD5Tio6cCg19FiUwWowc8aXuPGBVI
	 aCI2oowtNWWOS4Qi5/MhxLJkx0oLimYc0CQFvUa2G+D944bxVm+vBC2YEvVnhNChRRFDu
	 WJGGhOQfh61t6WuQUQwvA+9aOi6VfQWpd2PZ8Cru4cbNwZqXF5/U2h+QdDmn500kRZ++v
	 clTQOvpPXJq3TR+ZqLTcesePtT4GYfOQCvpaCD0LKzCmgDCOEiNoj0KZof5GUWdwZ25dl
	 L5L5WSIxLVVXcbFIrSPvBlZ4bHrHPCUuVrBdMZ8KMyF8+F7q6fLiBCTnSuSDQPLiwYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQJDeAYu;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02415606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02415606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pQJDeAYu
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2e43ff4b4so33106137.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794416486; x=1795021286; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
        b=pQJDeAYuDCYutcyC96lWW5Ebd5D6k1X3/jkh9x6fq6+I2yCOEQB0eVeg93CCZcRTaU
         7k/lVCI5I3KGU6H5v5aK65eZY/kQP326a9uksZ2Dmp+okaU1YzCd+dM2h/OvBSg6fSqO
         lK2AFBVKhthjv4wYNGffdzihGWIMIMzBrP/b9E1tDFitOM2QBhRs2h0e/UZlKUxXsuI7
         jExk8TvQ+IwzwQ6nsOCXN1GvxQk1Oqge1Rd57mNN4QGecPQmKRRgG5z9dt+22ypZvE3O
         TOsk5XyaF+hKInLLuYiTJVsX6pSMTH6rtA5bgSnjt6id8ohMl6gQps2ZFZ2GhkZQ4ShC
         7pvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416486; x=1795021286;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNJr3c3uqZZVhSfWEr07FcVM+B83XjBK0ipGpurD8/w=;
        b=IsRq7e5X7toFXXCXW5thrSsLSFVFDBBJgegLNnrksWlu/WldA6fghw0nB4Zdj97tfD
         45g7geOD2fQcy87L2N+S34oSH3MYxt0Ba//cyD3OchtEg7UK5M0/Qa3iNuHvAy4e6QKc
         xERfh4XSRFpECv+uRCdq3wm2ONl+KnckKQQLZ3QTol5KOUeJyuTd3mJOcN2vBHULLq5q
         ONgt8rhmquX0+QbCA3MJtG0aFjl1THQM8dVPymP0Jil3tjAa9v/GVXTqNJfuM6HsvUDL
         2t9Ole6iHCy06gwekB5F84gd2zIBIkRiVlSl2YEKuWqyvXMYFTBmyDwjx/bI76HPkOkc
         P5ww==
X-Forwarded-Encrypted: i=1; AL+hErFpTbnnQWhdk7thoBmfDqPUDmnW3fc1XyCp3SA7th50drIY94tn5Q6J2eYf86DCll4n9HQZt1Fb5iZ5arM=@vger.kernel.org
X-Gm-Message-State: APuU4Z80gPenAf78xwiOXAROvoIhp17EL8JJ1zm1c+WQy+cs3XnbezSI
	0yOSdXbyknMLDyKfNtK1n1e/g3+d8owIJQfddrIZy4/p9R6IaaoedYb2
X-Gm-Gg: AYBFou2FzMvz0f81GG+eG3YaiPZavHF1ln97wcElcIiXSqCntcoJzOgtYDVm3NS7HRw
	jXZ/bISzunxnmukv0+JrCCruPQGhatkcl1a1pYrwJw2+0APD0R5qeUUbYMZTUsEWklacTEIWs25
	ig2gSVQV12/xtdJ5J1xDLdwl2LVO9BlzNEFIlTD1uwDSv9wI28KHF4IaNJkLNFf4jsbnmmEOmo3
	42JQIfvMZ1eciLlcmINSKJJdxms5gVCnJWWpJZCKjLYd4FFHBX5J1EGmqxOiBdsqgnhWg3QdPJ4
	wsDeYOaiMiIBFu4plW1JJkLPQPxvcVWTawyiW6r7TiwT/oPk2vIshYji/tra7lwKG9QCYfcv4rU
	5fZ2WuQO2PC9NHHQ8skTCHmbpnJd/puCgytKhEJ8QteDUukENcIIBadhqtVyx5dhdlsCI8CqI+d
	moxtS53YatBuBdGMp1ZTkg9zXaH8ORWQuGgJNo4GpWOm5yotDGeW7Hsu7/C6kzs9lEnP+yI68bT
	yw7hm56lgcWecu7bg0GKWm3Hf2RPUhjDB++aehr8P5cIuqEPRFtTzSSb4Rxo/IK1Mmv0x3psceB
	QiWbNZ4GI5EJ6Kre
X-Received: by 2002:a05:6102:a4d:b0:7cc:905a:331a with SMTP id ada2fe7eead31-7d6316c856dmr19138137.14.1794416481052;
        Wed, 11 Nov 2026 09:01:21 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::6:868a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d302239188sm4078178137.2.2026.11.11.09.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 09:01:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 12:01:19 -0500
Message-Id: <DMSJJY9PLHSR.39PSNUXEC82J4@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Donald
 Hunter" <donald.hunter@gmail.com>, "Eric Dumazet" <edumazet@kernel.org>,
 "Jakub Kicinski" <kuba@kernel.org>, "Jamal Hadi Salim" <jhs@mojatatu.com>,
 "Jiri Pirko" <jiri@resnulli.us>, "John Fastabend"
 <john.fastabend@gmail.com>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Paolo Abeni" <pabeni@redhat.com>, "Saeed Mahameed" <saeedm@nvidia.com>,
 "Simon Horman" <horms@kernel.org>, "Tariq Toukan" <tariqt@nvidia.com>, "Wei
 Wang" <weiwan@google.com>, "Willem de Bruijn"
 <willemdebruijn.kernel@gmail.com>
Subject: Re: [PATCH net-next v1 00/15] psp: introduce socket-less
 associations
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Todd Freed" <toddfreed@meta.com>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261111005533.6436-1-toddfreed@meta.com>
In-Reply-To: <20261111005533.6436-1-toddfreed@meta.com>

On Tue Nov 10, 2026 at 7:55 PM EST, Todd Freed wrote:
> psp associations today are bound to a tcp socket when created. traffic
> on that socket is encapsulated in transport-mode psp, and encrypted.
>

You can start sentences with capital letters in cover letters and commit
messages.

> this series adds associations which aren't bound to a socket, which
> allows psp encapsulation and encryption to be applied to forwarded
> traffic. you can use this to transparently apply psp tunnels to flows,
> with help from userspace to manage the tc rules and orchestrate key
> exchange.
>
> the lifecycle of socket-less associations is managed over the psp
> netlink family. socket-less associations are stored in a small registry,
> and are addressable by id. the registry does not contain socket
> associations.
>
> socket-less associations are on the device's association lists, like
> socket associations. rx ones are therefore marked stale by key rotation
> in the same way. in this series, nothing acts on socket-less rx
> associations on key rotation. instead, userspace should replace decap
> rules for a SPI before its device key has been rotated twice. a
> follow-up will bring enforcement.
>
> series structure,
>
> 1, 2/ prepares psp to work with non-tcp packets
>
> 3, 4/ adds the netlink commands for managing socket-less associations
>
> 5/ adds a METADATA_PSP dst which carries the socket-less psp association
> on an skb for tx, and the transmit checks for it
>
> 6, 7/ keep mirred and bpf from sending decrypted skbs from egress to
> ingress, since skb->decrypted depends on direction
>
> 8/ limit time-wait psp socket validator to sockets actually in
> time-wait. the new psp actions check for presence of the validator
>
> 9/ adds the act_psp tc actions, psp encap and psp decap. in software,
> encap is egress only.=20
>
> 10/ adds flower matches on psp header fields, for rx matching
>
> 11, 12/ add drv-net tests (netdevsim and hardware)
>
> 13/ makes tc-testing run dependsOn probes outside the test namespace,
> where they currently always fail
>
> 14/ adds tc-testing tests
>
> 15/ Documentation for socket-less psp associations
>

Some of these can probably stand alone like the bpf decrypted, psp encap
helper, and timewait validation, and be submitted first to shorten the
series. That's just a suggestion though. If there are dependencies on
the main series you can ignore.
