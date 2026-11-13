Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794547076;
	b=LmTtYTBUVIcppJsGziyqUppqdoI8xqbuCsXGP7IM3kuLP83JurQQDr530rwvu/y81pel
	 /JzfPRbpk9ChMXCqQnIjORymU3t5vqeDlm4P36S1+VvJWCaJrxIeP5LCjf64Z80YTKG1P
	 Jcb9XUFz4FGvUtkTLztOrrTUn8A3vG7fcqGYO2TQ75NG7oBDbuT0QTlfJ9zgLSoxombpX
	 QFrnbh330SggxtK2JLKOPKeiIsjdBIl6RRzWYBhp0nRV1LpOge8ieT0sxiObxpKWtamYm
	 lJ+I/0qvimS21e+KEjxwo1R8efDDO5Y9SLYEdQANau2fWKoLn39M7QixjpgxvZD9OBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794547076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
	b=4pd95BdM2y1aZDgupXheN7w6PmTGOBJWwqfbu5fAGYByttspuiuHJE27EFNVyQf9snYT
	 qoffp9tgSi/2p1n8IKhRAVA7xjPExGiOGijn4IN1RdPpJR5tj3seFM9z832ULCZLP9s/7
	 2euE8RluyHSs3MjsH/OCZegppL2GmBeg3mKkMLfcc04Qy2FiJj/s1joV941hG8Aj9ecll
	 iYqRXabNsaFysU1ty4IHSrlynkvTX02wDJzJ/9mPGR9ft04SYt11C/Atyt4XhMR5GygWi
	 J3VDxBvfGXcODNy+sDxunrbyuiv6zMV7Xtp4XTZX8cIt8wVDR7JCV9Nmh3ToiWvStWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XkcAxtUC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15BA606A327
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A15BA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XkcAxtUC
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b571a45a2aso4462a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:17:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794547074; cv=none;
        d=google.com; s=arc-20260327;
        b=nvyw9I2dmSj8NSD4w7lA0i0HTGEkISWaP46FUo6O3Z4t0oLBbPwI8eojCLPenbGVgZ
         BJF+vq0QwXU6+T+7ZANPcflc962fYc4RfgZyVatbx35Abi5wVJHqe2IQzkE/5LL/yAYR
         9foGKX0WReOV5b8fmNtLIGmknrkJ6ythWgaU9147AIepqKOZJS58v7ElIJTbZSNcRYVb
         2dl8w86rrflZaFyolMQ07r26SjhP7Kcl0i0hIcJkF3rUWw+EPiKFPYzVk6fJeWmaeUEy
         P57mXmwWgCWdH/az6mwi+S3TefPMVxofqlHmUEfsqfgIwSTaPPQ3C9mrzEpr6frzV1Pq
         jCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        fh=4OF2iAuRvmPqXlvesDT+4j7h0Sz4jLL32roNKtknlYU=;
        b=i0cec7QciHAYmz7g4OP6qpmfiWYjy4wKsCnWpgNZzTcLySdiZpaqYphlClYcgH/Hf0
         MdwwInpimSQ4flNQhBY76u/h+FFEhGBRoR4AuNg2Gj6qaaeMsLqhoKX9pOErWl80IrYN
         MNmdeTLYOXAlpDmzxEMHqd4Fph7kpBErG6eWd8fklL74VNIy/DtStlCvrkhvfpfg/BYT
         RKzAWQ1cEcMOl74Z7QCSK8QDSV2Bjc7LxisL2EVaOxo/HJcFmQ2nyzWwnHlqbWRlX/N/
         lHtktkq+HmjpM2OWTZAo3N/i2mT2yBbA6rb3RJ5/AWY//H63fXETPqWBNf0ma3P040WY
         HMAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794547074; x=1795151874; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        b=XkcAxtUCanemul+RicaP/aozebWZdnRnipw0ipFQorOt0CF/BrSpgOa8erBdCdQ4N4
         VLN7NIrJsbUZs5/qRbv6PVx8HdejsexGCcXBvZF9JMwInu54ZTGyLTXV4CP5Khnt6ZmY
         KtwFVLwvIbCaIc+i4hJo68hl9fk2E5AG+n1NWywpxM5HEwL/Sh5PnG2wSuHDKvMPj93c
         eS9Wdn4dxDybUNs84KncdG8MxZzbqIualdyZuYd1d9+Jv3B6t3kVQ5SHpDpkkDeOs8Hr
         TJbLqq+E4fLdgNwbW0RukXF0HL4RUXNqvH0YKSicntzdAKQfXtwzBHxp8r6Xg1qJ7l/Y
         8paQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794547074; x=1795151874;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f+W0yRPPh5LN5Rei1H2okk7m72K0RoxQKNaAvZ54EI4=;
        b=IXRTMCb35TVFLzatRqJPCDdLb915T0XUQ5EEv7+YrQQVbyHqhLv0peJ8UVDhccoQE0
         jLuE7NAHj90udD4habtZaa2TaBBDsuMuo5YWhd1qq5dpMmIp18ZA6Ern4mxapGEXgwi5
         WCd4Smq0nDyrxSs+Ac9b88YHa4QrvmQaYKj5GKwTgvWOjl8NU89FGRTDdgglrQeVbCsD
         yrVJbaY/tedou0GvSTPYbhbyUSFQmR4O21RvHjDGKd1YBa6iG9T6EkA60AqTz1B7OuZo
         WPnR4/wlb9dRbiWFA6tdy9GHDaQp8bs9L39bdWmR/6p8zKFK/Sd5IwjCgp4ClsD2Aqkm
         TbVA==
X-Forwarded-Encrypted: i=1; AL+hErEZDjOVFp255k3dsf92GpFGy9RghLtmvws3PTTBq44lEfOMKKZNLFMW8LekskoTS7LBMv195IJeGOV3y8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gPhDrLn1v5NUA7XLUkMVfWkHNjRE+b5oe0fTxPzvUtSZpr3RE
	oSSZLbBgffJdt8icTihd8TEZLP63aCPzYxCm1TI1M0l43Wc/RbIoKd6WwSM+ZT1hWr1v6MwjU2/
	HCqcqVoKoPzECrisVdK+Ip73Hk7So0d7fP2f0YyEs
X-Gm-Gg: AYBFou1LaWyv+xk+S2ISEtmXd3mf8+DsrD20vvl6J50l3Wk0PP2J/hcIYhpojAFXJMm
	OGF7d4zts6W3Zdjc3xa4VpQ0RMzeZ3QbI/EwuonnHFJenq7Oq4JYz0laHmvNS8MPEWMKgvZIWEb
	NVU9ITiBhXKaU2y5ZF8rzX4BpS21MiW5Q/9670HAqOstR195Bth4/cjbM/gcqj/2SQwS1LAnQpw
	YeBH9IqoExojA5axwHIpm/CBRrFR8c1xErYdt1uTWYbgHmZoYG9+Wz37wpzoT3O32XdRgblw0Vb
	GEU5UYQ8ZwFbJG3L7gpB+yO6kosz57Abm/Z7HJfCEUIVWRZ3SHZPhy61PovwALv0MX1u40R7IyZ
	pZZkV9N9ntfqBTync5ZqBq720B9pplmOOa+U=
X-Received: by 2002:a05:6402:160d:b0:6b5:70c1:650c with SMTP id
 4fb4d7f45d1cf-6b7c34c6eb8mr48079a12.4.1794547073617; Thu, 12 Nov 2026
 21:17:53 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110102039.1002605-1-bjorn@kernel.org> <20261110102039.1002605-2-bjorn@kernel.org>
In-Reply-To: <20261110102039.1002605-2-bjorn@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 12 Nov 2026 21:17:41 -0800
X-Gm-Features: AclHuK-EmG-vcwSjI4xi1-iRc2SNUCp5kahvZ3vW1cJ6PmqMOttCBZ_NEdrFdlY
Message-ID: <CAHS8izPnmy4W6f3dWp2NCkmNYxtP8jKm5rxjvPbQc8VdFm0Wng@mail.gmail.com>
Subject: Re: [PATCH net-next v1 01/11] net: Get skb fragment addresses through netmem
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, 
	Pavel Begunkov <asml.silence@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, io-uring@vger.kernel.org, 
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>, Weiming Shi <bestswngs@gmail.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, David Wei <dw@davidwei.uk>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stuart Clark <stuclar@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:21=E2=80=AFAM Bj=C3=B6rn T=C3=B6pel <bjorn@kernel=
.org> wrote:
>
> skb_frag_address() goes through struct page, so a net_iov never has an
> address. Only unreadable memory should lack one: XDP and BPF read
> fragments through this helper, and AF_XDP UMEM will back readable
> net_iovs. netmem_address() also returns NULL, not a bogus pointer, for
> an unmapped highmem page.
>
> Generic code needs the size of a net_iov to find its address, so keep
> it in struct net_iov_area instead of the devmem binding.
>
> Suggested-by: Mina Almasry <almasrymina@google.com>
> Suggested-by: Stanislav Fomichev <sdf@fomichev.me>
> Signed-off-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>

Are the changes for niov_shift some kind of rebase error? I don't see
how they're related. Otherwise changes LGTM.

--=20
Thanks,
Mina
