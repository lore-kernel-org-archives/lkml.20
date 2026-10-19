Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424024;
	b=uxQFLH2LPY/f7v+CHPH/jPKHCWFRfv/G33umj40P1uww/cs2JIQbY6KaISYTaT60z0Ou
	 WxaEWbe49Wd95Zn1EgB9o+UFP/hveV6vLGoeypi8bEGRfPTJ9HapqCVnpRo5XSOrCAFEo
	 7DenEHy0e0Ki6xQT+Z3T3hGrPw2FFVH8snB4RxqjCGI6UxO5YixJdKJq2Dz+Qc5c0rFws
	 RKljqmcnkXedX3a++RxsPwpsVjGVHq+xadytPU7G4yBH69TtYAisygwFLXv8YWql7Z1jc
	 J4vmrhfwchzZUlmMBWaogwxo14ErchN/CcPhBani1H9PjYvwiRh+KrG0kHkIoiWDTEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:From:To:Cc:Subject:In-Reply-To:References;
	bh=40VX55JE7I8lotG+m4tWob4wIq5xuHTD0e55HnuCuwU=;
	b=IxZl1kJ8LuZcHxO50VzKe0K0tqp22y8/M7W520IOuszNLdksKtan2RyyEGFdbxscg2Xd
	 MIzqRMiEAtKD7pR1bGlvmV7qZdtp3oPOiCWqCDQA15EQf4Sgs093TqW1/720Ts/bj6VJd
	 /rHLpCRDj7Z5oDosnzsBQ7PcXrewmfEbNiN5oYfssjHU5wFaU0m0GM7vHcYkMFM+tniQd
	 WDwqa0Gph9Sp/700GmM7rGw26Sey3YyaErLl4xNvL2hcCNHdYIDDDF3Y3VCYKNHbKuKtv
	 UFJlFo6dfMx2exln1teHQWTuU3OTqHb4QLrWSi8TaxvT1+yHKv9vbEUrZKAJMYk2j6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MOHhUoaC;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7345D60705CF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7345D60705CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MOHhUoaC
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3550dd02c9cso181961eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424023; x=1793028823; darn=vger.kernel.org;
        h=references:in-reply-to:subject:cc:to:from:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=40VX55JE7I8lotG+m4tWob4wIq5xuHTD0e55HnuCuwU=;
        b=MOHhUoaCewBDcQI7j97alFtBVMoYrtatfUH0aiOZ78clFxr65xZZB5ortlDk3JbdmC
         W5zWvxKhOuyH3G3kVkl3Tjux8i3MCzCJyeE1s6+8cJKbl1So2HT3+3pkw96zaMEpSox5
         jny7r0NfuTAxxznYCurcAD3cIfEzQE4zfnz81Jlde0acBq6aXt/0zj1ERmA1MskQXEDp
         QQYDPioLlikUR6WRWoFX2fJRY9OX66ZWYm3KrVPRoMGdGGPA3HKUE43pN7coONk6im+c
         VNahbk4fHoaddaEzh91dK+8SL6nQW2c1ex0CRB0xqs24Ub1lyjNML9O/nEJLjzPUktA7
         nycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424024; x=1793028824;
        h=references:in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=40VX55JE7I8lotG+m4tWob4wIq5xuHTD0e55HnuCuwU=;
        b=Wo3NsJlyraAjlm5hGJqEIj4eBd/+2fNSlmZ7UHCMenumSsmdK+R88djxCoFmpi4yuZ
         MiOzgjPYCYXoKqtksV5fon+m9Lxi4GyCr2kBtXVXvTi+xB6zKjKyfR2z/5TxlQ+JGtFk
         r78ruTQbw/96X9grTRAuK6pUA+RyFiZmqQxu1AbTY/QCl9RUPlJvDwi1GIJEXHDMtsjb
         D+tyYPIuz/u7Eldg09tKde2K6jmHQjikVWUC5DGGuMY0/kDajGzG6+jVH09QuUEdnpy4
         i9KLjPQSgtlBWICrnf7xEnbgx2z02G8qs3k6CFhNCcM2+Y0Khp6RJRtz0IRn2fmdPxxn
         boWA==
X-Forwarded-Encrypted: i=1; AKwUvBzY9FlpMY+ia7Oy+GI8Qd8wnUOWiAO+WXX0OQRKmGxhMYdQH94y41Iir56d1Dq3gjj2ap7uqwPtY4QKKnw=@vger.kernel.org
X-Gm-Message-State: AFq9FYInlNZj5zQMSWW7MSUgFrGaEzCjCx360Xj4DEbipgH6y8HT5oXL
	+WPISzx4UivesGycqqLRn25uUcRvd28a5GW/WQvztXt001GzIMcXehtX
X-Gm-Gg: AYBFou2M5ct5prYFoeK35dubJhLO79DYeQt8YbrAXLPZFs/UmtZ3EH4XgoIHLXnbHot
	YCf4jh7XiJCn6AS8hvDfwsCjTlgekOc+tjPFiCxYVM+pXAQ6L7Cfp1tjfYOtOjbj26KRsk+uPy9
	MkCJEY0SkjE8/AKAsnQZNhR1k7SZEjp0Mkqfx7MpVm8YBxfl6Ax1mYGNGsFhqLbsVukATtmvPgd
	tDos/fUezviMZRhFEpCb/fFtPjP6d5xOmivoV3oSLDBGgD+bfXjRqhxIXYESUlXYwtgeVdPe8S9
	+t9lh5lnOKhq6s9o/5pgJpo+KUtjFxhIrJ0VfdBriK1srRmYDJ0tCv0/H4xJLCJ1B8ioeKsIobL
	/zu+RmpKvLZ1LqQwbO79gTiz39Vfk2yUUCHl2UbTwMkth4sLGFMY9QHrxppTRA6IZuKe2mPtj+i
	b6GZwIQwywXsRnwaIu0lxJnBiflcuSf/Rs9Sege04EP7cz/4L8vTX4VFUjpfNGo4Q2CN3rij1ns
	61X+JprqPgrtcLLjQP3vlBglvjocJ4QGsHgR0mHjHgZz7Jf6qI=
X-Received: by 2002:a05:693c:65cc:b0:35e:9cb2:b88a with SMTP id 5a478bee46e88-361a136a601mr17263822eec.2.1792424023344;
        Mon, 19 Oct 2026 08:33:43 -0700 (PDT)
Received: from msg ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b684dsm33067697eec.10.2026.10.19.08.33.36
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:33:42 -0700 (PDT)
Message-ID: <1792424010.89978.05cf1ab60e@gmail.com>
Date: Mon, 19 Oct 2026 15:33:30 +0000
From: Qihang <q.h.hack.winter@gmail.com>
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
    Christian Hopps <chopps@labn.net>,
    Herbert Xu <herbert@gondor.apana.org.au>,
    "David S. Miller" <davem@davemloft.net>,
    Eric Dumazet <edumazet@kernel.org>,
    Jakub Kicinski <kuba@kernel.org>,
    Paolo Abeni <pabeni@redhat.com>,
    Simon Horman <horms@kernel.org>,
    David Ahern <dsahern@kernel.org>,
    Ido Schimmel <idosch@nvidia.com>,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v4 3/3] xfrm: hold the tunnel device reference across the input path
In-Reply-To: <20261018090638.55686-3-q.h.hack.winter@gmail.com>
References: <20261018090638.55686-3-q.h.hack.winter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The [High] finding is valid, thanks.

__input_process_payload() reaches the drop label from several inner-packet
validation failures, and the drop label sits after the loop that delivers
the packets queued on @sublist.  When the outer skb is reused in place for
the first inner packet it is already on @sublist and carries the cached
tunnel device reference, so jumping to the drop label skipped delivery and
left both the skb and its tunnel device reference behind; the same applies
to a packet queued by iptfs_reassem_cont().

v5 drops whatever is still queued on @sublist in the drop path through
xfrm_input_drop(), so the reference is released.  The normal path already
empties @sublist, so the added loop only runs on the early-error path.

A revert-based runtime check agrees: with an aggregated IPTFS payload whose
first inner packet is complete and whose second inner packet has an invalid
IPv4 header length, v5 completes RTM_DELLINK, while the same code without
the drain leaks the reference and unregister_netdevice() waits for vti0
(Usage count = 2).

v5 sent separately.

pw-bot: cr

