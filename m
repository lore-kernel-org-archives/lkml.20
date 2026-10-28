Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793154148;
	b=0rcghUJ4vc2Mm63gS7y8CZBLIPQLN1UfR25kJljWqBr9YWJx3Av6CxGAxA+uIQTJA5pI
	 gyszrmcB+0xWHeu1qDC3K+WtgooXVwphQjnn1SSH3aw2RRRogGfvx0h0m7ax78qsE8jNA
	 nhEEhIQ9jiVsTz3bZGCmgqivmjjv0S2C4uX9EkR9YJqxr5nnBoiwhwU6aMfLIcHqH0oP/
	 0HMjqbUR94TJ2n0OSDT3ca2gKmEWpQFn1gMxzHBNG7jKNvBuMDTqGD6q62zBD46UEeSNi
	 3Pth4GzH1Q+2azEnIkkPMtMwEOMzdvh1SOFlF366PO7gphOUTDIjIpb9OE+0yym00sg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:MIME-Version:Received:From:In-Reply-To:References:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=rLkAB7kZhLYtyniHu9ByUzUeYbWTwWcUmXl1PzQJPZs=;
	b=S6qpMHS/H9xp+bXJB+YDk2e9D9IhUPzl5F+XXFaJSiTC6aTwXDdABU3zdzqLZvPgOkE2
	 QdvwQY+mP51xIrE6GzFLODxtvmNSvMTp6CIKa4g9bazqxFurTXFKjNVEH8J7dVX8gVkkY
	 OkXOz69Sryeg8qxJKL2FR3y4O+sME+nBrd4i9IKnDAqWnJ8eYYv7aIh5yU6QaSz09p/Vx
	 htVYEV338k6m2Ia8FMtqdWWy+r5aoQ5ovAocn5c3uqOmW7uzHyUy15xOrKXYG4O2K6zIk
	 14zTa2tb2NH2hgnDzOH+NM1LwBe6A/tXgVCc0q3wHqN8ks0mUF7uykPp9Pk9AW6pUxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K5CDpCYn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B4E606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B4E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K5CDpCYn
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b486e1d02eso708234a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793154146; cv=none;
        d=google.com; s=arc-20260327;
        b=AKqXE5a5jRvNmlBFkdgdPb5RQ5sjSFPzCCKYO5p24VRzlrHZmavnX7RxGbg8Qu4uER
         w4jRJQlTORKAr2thXW5Q/eLrCMH/h/m58YVZ7gc93Xxvvyjahrkc+Fi3uapjLD7/LZAQ
         ISzKTgaeyDlmkDq4sbqUfhlsePijlCgbfAlrioUS0Q446aa/Az+13kqr7pSTwVvrD+fn
         6XeSSKIUghLd2e5cbaFohJY+d0Vm5y8f1Cum+kRzC9zoaKHRIG0TBCsnUF2g+NttiaQb
         /wP5BMiyCQwHgQRPxSHCLqGn4JueQEAGBRM26RpqC8SjYTdP3HNm8wX2IQBzFU6KC3Lk
         VJSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=rLkAB7kZhLYtyniHu9ByUzUeYbWTwWcUmXl1PzQJPZs=;
        fh=Fs2P5cfr95gejZETgIQxaz21jxLbn9Zk6LUu/Ki9Giw=;
        b=pw93/FrfVgpdpxl2DaMjJAefgSn4AR0qEl9ybqjSRX4hot8279CdcfLRCJJ/+g10VC
         WQEVC4lirEaiPcy5CgQroBt6UL8cuKQX7vvH7mMum3qfDUNfZNJ3MhghLlY/rJ8JkGgg
         fcDDNMKQrEGKlxCx8zLTUCwVCGVPl/XGtVJwbm61UmhnjCr9OuThsIAcSnNYViyj8O2F
         Efs/LIZbPqhIE/4Z71XXmJ4NEvRzc1DBUriJYvo13lhWcSVD2K1R8kq390eD7Ylz1wC0
         QCKTCYDbZjxNm2GVwNfU1Cpq+oYqPVnnVYPdCjEcaFOpxE1fJU0gc48WaEQd/0asI1gk
         52dQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154146; x=1793758946; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rLkAB7kZhLYtyniHu9ByUzUeYbWTwWcUmXl1PzQJPZs=;
        b=K5CDpCYnJ1qrM/VnuvwRVH1L1+xT8oLS14G0KLHi4xCdXJS17zel0z2UsexwKRUObq
         XSvGAEfefwHrWVOwCMjP27oy3Ik3cuB2RvwU/5R0Q31bZQHlwwbaoNUj906szZa5+0Pl
         gW8kOMsPKfu8ZgwuvJzuplfz0v0EFieoLRvnZ+Di0XvzVHXJXsuvy2CKN8tm+LUvWKbL
         JhX0jXQycz9/nTChRLQO9zfQxmpRQWeDku3WLIewwU1aCu2sV3LcdhDfAcO75W7SfgUc
         amQEaErRajM/BN98vstMlJ1gNmPTcmEoq/bePlnspo3D4cLXuor9SLX1h1zXW9NvRF2I
         u9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154146; x=1793758946;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rLkAB7kZhLYtyniHu9ByUzUeYbWTwWcUmXl1PzQJPZs=;
        b=a7mOCwMO79tt2fDhO1jVW2VZSwVJByjF7zu0sSyU6e/hadLpFiHqVMwqZyO8ML47wf
         ZI46MPkz5VXmIQm9+BI5ZUMlyHB+4ie9aQteIEMf/9jkRs7xQ9XgDjMWjP3C2UP92Nry
         JXcoSodSBZ6ycqFcz2/7GLBqXqbI+pX1qmo4Y5TvUhDFOHPo3ZdC7UDhjXtEHUhzgYM8
         mpT02O3rtqdxslj2XSqmgFaKTkX0Pu6ZrG/vbZzPb6Zf//9WE4Dmj56MxX/yUgL/2FKi
         Xf5GToKW05mjlWdw1vO+NG9hCsJ1wSn4x8GTd6uhVoMsAT0WDDfNrZ5PvqwutUX7rQsd
         aPxA==
X-Forwarded-Encrypted: i=1; AKwUvBx32jzHwAQQUeP7FxKdA44riqG+EyWOk2g46TO7IIn/0TbkfHRhhKiW0aAsMJxLfDSqN97ItYvPDn36q8c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZX2hG0Z0BdVJtxLkLToKaGgf5oRoGXs80DLuM50tK1j5y5UJx
	0nhE/dUjkYiKbte7TjS2CuodNPh5ENCxWJtcE5NT/cj36iuV6CHV7kj8krQms3+zu0pCiiyCLJ8
	zsqz6uVG672taM/yNQSd98ZJlcemf8l0=
X-Gm-Gg: AYBFou2fKa9ROLpBoSNd+2xAvM1Gg5LSQAHjEyJyKD2C1pQEo6TKP4Ft8rDAk6NJVeV
	Uo+/NFwmbrPmzv8IifatXfhfQScWQrIH3ncgriBsrssU2Be35tkvkCvFJ/WvgJErCO9AQF5LIIU
	g0SPoJYf4tGKxBoOT0LS8S2oIgo01M9ffHxeDSgS1U37kX/AyqDIoqrdH9V6pPFigZnavCtlpXi
	rIuq0pYY/qJE9ZWDVJDCZj+ipfETKZcgBOKtpRlwXAwOfqXM7ySCKoi+6MNwcby15P81IEbm5oe
	eBZhPn0wlPzzDecWMGjeybo2db2pgxWKEdLMZNmra6lTcDfJ++L+jxMNqOu0PGI8p3yjbLzFRfl
	WkcI9N0oQ75j4A3OP1XiETQxHcjUX3l0cBYU=
X-Received: by 2002:a05:6402:2813:b0:6af:9dd5:f524 with SMTP id
 4fb4d7f45d1cf-6b49cc0eef1mr469352a12.37.1793154145870; Tue, 27 Oct 2026
 19:22:25 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 28 Oct 2026 11:22:25 +0900
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 27 Oct 2026 21:18:11 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Received: from 77377267392	named unknown	by gmailapi.google.com	with HTTPREST;
 Wed, 28 Oct 2026 11:17:12 +0900
From: John Macias <dencity7@gmail.com>
In-Reply-To: <179299947310.3134.16517017879498438401@kernel.org>
References: <20261025072203.1519561-1-dencity7@gmail.com> <179299947310.3134.16517017879498438401@kernel.org>
Date: Wed, 28 Oct 2026 11:22:25 +0900
X-Gm-Features: AclHuK_oT_wF2qyX-CGsYBb5sKWaurG9YvjMPI2pYFBFay-dMm0w1_Kdm6sT16Q
Message-ID: <CA+KzPspGRX_=MiCX47r+tTW2fx-hX4DQ7OVHG3xOw7sndGi46A@mail.gmail.com>
Subject: Re: [PATCH net] net: dsa: clear the conduit RX queue on user port receive
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Both findings are right. A revised v2 is prepared with the changes below.

> The commit message says "TX queue selection is unaffected: ..."

That sentence is wrong. Clearing the mapping leaves no RX queue
recorded, so when no socket mapping or XPS map decides, skb_tx_hash()
picks the TX queue of a forwarded flow from the flow hash rather than
the conduit's RX queue number. Some taggers also consume the selected
TX queue: tag_brcm encodes it directly, while tag_ksz, tag_sja1105,
tag_ocelot_8021q, tag_netc and tag_vsc73xx_8021q derive a traffic class
or PCP. Different queues within the same class need not change that
encoded class. With CONFIG_SOCK_RX_QUEUE_MAPPING, packets received through DSA
ports also stop updating sk_rx_queue_mapping, so xps_rxqs no longer
follows the conduit's queue number for those sockets; a mapping the
socket already holds is left as it is.

I kept "not recorded" over recording queue 0. Both make get_rps_cpu()
use the first RX queue's map, but recording 0 would, when nothing else
picks the queue, put every forwarded flow on the first TX queue of its
traffic class. Under QEMU, 16 flows from conduit queue 0 routed out a
4-queue NIC with XPS cleared gave eth1 TX deltas of 800/0/0/1 with
queue 0 recorded and 201/100/350/150 with none recorded (one other
packet is included in each). v2 describes these effects in the
changelog.

> The fix is incomplete because one delivery path in dsa_switch_rcv()
> skips it.

Yes. v2 clears the mapping right after eth_type_trans(), once the
tagger has set skb->dev and before the branch for devices that are not
user ports. With tag_dsa trunk frames delivered to a 2-queue bond, the
unpatched kernel and v1 both hit the WARN_ONCE() and skipped RPS for
queues 1 and 3. With v2, each source-queue group's connected socket
reported CPU4 and the bond warning disappeared. These are observations
of the socket's latest receive CPU, not per-packet CPU attribution;
queue 2's NAPI already ran on CPU4 and does not discriminate.

pw-bot: cr
