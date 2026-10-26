Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793039489;
	b=1cHSRP3wOqDnvYN9aatwyy8ap0UAFHjCcOII35vniCctHB5e61j0CPxtf7UQ4BYgu0d0
	 bhU9myQu9UjmBqcHHl7DO3RIwVjZgB/6iNl6mCJt2C5q2gWnCkzvhNgyGeNg9tgGpx+ID
	 kFkENNlVtJaWTLLGZcc9APYcMPF4e1vCZgWVBpRF9EXzvbJDmfNNbibefVed//8fkdM3R
	 hbP26bKVm4D9sRZs+yDbJiZr0MsDOpDbDA3BvVQrD2kMbkoS5FRXe1fcJzMylM39pCQMr
	 aRHOGZcpcuj0HILd0/gWvYF5Ql1n1RZ0TkLM7uRfvYRlVrhwqey2nfVURf9tyeFaqWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793039489;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=0gAsj6qI++VbCo88r6Ynjuj61Kc1LdhSuLSo7guQzmE=;
	b=FsXn2rYvK1Hj2vg9u+W9XHGA4JUI+WoRrtK+2ilZ9aUZ7Oo4Krcm0NGv5EyLoqNVjgxm
	 V4Uy25b7ChdoDBvy/QnGhrizUcalPgQH4RdstvEIJhNnrQRRIiyAyZmeeYJ3X1cVtZf7V
	 XDKYSvGL6FHoLCcdIUVU48spuA0cSWMHLbln/MeYv4y1wJxQVczGpuDUxpfKasfvew2Hm
	 vNYQ31nHU0bFQ4CFMxLbEhT0BflMfEc8ZaAzNzxood6Nv3xi2ZKoPMR/kxCUw/pUONgIg
	 Rvjl1te720syLzu2N75OjcxdL/HRcSPJG85WOVlPE0ilUKhDoEs4O4oB0bR6/WpgAGA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="g7H/vLy+";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.177
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93459606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93459606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g7H/vLy+
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-8b125371596so2125447b3.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:31:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793039488; cv=none;
        d=google.com; s=arc-20260327;
        b=PJWlHk05W90cHC5H7qkSFU/bwKFLDZeYnB/whhCzp8r/04YlqEZsckLZBoL5AKZprL
         pseHyNEWXzqFb7tYguQeGvMAnsHipzFdP22RmOxIKKp3s0ZGPgihCaXmxqqr5h490PuJ
         0QAa3Yecrhsa9Yspz51miP1du7xPwNIV+q9WDd9UwdaGKqEm0TaMcWGb2UH5mM4wLSzc
         rgM1IpsSgXjwungtArU5Isckxj13Cv74vgQILz208afGbAct8L+NTqwmiqreZn3s00P4
         trPISkoU83W3RmpXsmpg+UlwaWmYrwmz1UNeEOUqHeSuL3Ac+KqYXHJTjlAvUfreuvTQ
         J4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0gAsj6qI++VbCo88r6Ynjuj61Kc1LdhSuLSo7guQzmE=;
        fh=tUlw618drfEHdR+xLZLOQUQZn1z4GLPb5QK02OMPUOU=;
        b=erU9EQnScA+/kbceB8/fXLTVTeEh67nBmnaOV+8UvLeKqP4gLI1lY0D0uJDpNLQ96a
         ifg91FLBETqxBC8PWpNM3IFaEPpR9U7BaXWWiSWL/PfzpD2wCB+YoyHMg83ZluX4J+Xd
         XxeCMFWiM5+l7akRluN6bncbt++gEfzuNBy7hiM5nal186h2gvFkwM1QMeIzUCM3tkgB
         DR9Q/ClJMYMqnCzzXJ2YyN4lVJf2Pm7K/V1dxQhUnYSYMZWaEfoYLY2CKPLr9FerJkrg
         MHfBg4tynu9D0n5Z55P5R66/wYy1ljbZyqKuEokBBKa/eJCgxAZysDZubqDEnvk0yc12
         kHRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793039488; x=1793644288; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0gAsj6qI++VbCo88r6Ynjuj61Kc1LdhSuLSo7guQzmE=;
        b=g7H/vLy+7ZmS+8WfdfCRzhIcqUzV9z254lfIfe0rQNmRKB8jITgDiANJUD+DBV6moO
         XmbH+kAbspDlY6liPkx9u1CG5wOQW/3w9p67CzyMW+TY5LDbnxCA8rGI6F0rZu+Eo2rV
         C1mmztc9qN/RPcKwkB3cWXK2QVNS45cF4uDXWqV8iSwHfZDlCbYWj6CksX0s6uaVD3m7
         fCfOFbEhlk48e3xfkwNMSNxmZIOVGsCVuXHM/HOGN98cyKwow7WuzU1mRsdxmRutsUHH
         LxoRfH+xg8HNmoTCDGshmFzWvdttNxqeozpYikGKk+7oyFaj5xjE4PqnkkGMlCgozR5J
         XIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039488; x=1793644288;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0gAsj6qI++VbCo88r6Ynjuj61Kc1LdhSuLSo7guQzmE=;
        b=iyJSvOyeye4gY/J8TEKw6Tp+qIZpfV+l5NzwecU1adclSNdT2WA+1h40w+KhBUXpJ1
         7YjD9TX/CK/4RUWFS0JzLo6qfTfARu0SNIFh8K5iraoF7c+WZkdi5WWpj9aCQdaSyz06
         HiI1lZMVZjxHAQtwc0IsCDSwZHXzmgl1EtUSJCEYzgcrzunodEY+6C2B8Hm+IXERhaob
         MW2Gt9T0MgGSdqe7+lqu413nigJtcA0DxyicHMynfKGnGm7+Yt9j4Rvcb+asP8umuuRM
         sySpR+EIhaPEENd4YmkEa3rOeFqUOxzSM+GgwJcjh2cmW16Z5EUyV1xu+aiz1WJIgDs0
         rfQw==
X-Forwarded-Encrypted: i=1; AKwUvBzOPYAQXRHDOT0GP6Yz252OrmvZan2Fvt1r0OQE4vb/ZjNzu5KoCLzciX7zbmTOo0wgosUn9adClCrjPjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxu/nJ80D+csIpNlAmKRu//4Flh9rX/4lTx/kSk40c3eoLRSUL
	/Eh0BNK0naSUWk2+ErgOq5gFEOxIBh530tBiA/QyrS07D47bMJykCCzj877VkDhS+l2R99pytiO
	/YnFJ2DtDz5CExNEwkVeMRAZ6RdPBNaQ=
X-Gm-Gg: AYBFou14RZ9/k5T2jYFJnNyrOV5SqraTZvw7lBAYzCj1QBktDC2IGJIToxFCm046ybx
	V1k7bcnVEKqkgcySRWzHgJBAtDNyvGeAwRkFKi5w1W+Gdw3ocxPHHH+HusVOvJMh4h4Wohxihdl
	ZTL/sQspjAvmpNSnOVwCHnTj20xa/zQyqLOldEJf1xRje4VRmGyKpBlr8hlfKpZqZ8gJ41R/iBc
	VoAbF+/48zetGtakfY6+dBa6cl8JPp2jdC6SWRyeT4zC11euLWbFps8eWhuIJD1lZsDDXT0PcoS
	ftWbrALaNxkTigOyle1n4MIVNKjEn3AXeM2H6X20JQxAMTswH193xERXzBA5IJ1UADBur59thyG
	T1Fhg4VfWcWvz6mj2Mpb0B/DtGInbqzQIxrIya75B4zssvE/7486tCP4XMq/bcoM85SWYeBYgjj
	eE2yQD6+uaYazSZDdZ6yyYYNPouj8Mf0hQl3G+BlitSe3o2WkFrZVuTcEssISqT8IVWkU6PQnFO
	Ar3
X-Received: by 2002:a05:690c:f8f:b0:8b0:cf3d:7b10 with SMTP id
 00721157ae682-8b19c9a0081mr3613457b3.28.1793039488379; Mon, 26 Oct 2026
 11:31:28 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022211104.2091128-1-florian.fainelli@broadcom.com> <20261022211104.2091128-3-florian.fainelli@broadcom.com>
In-Reply-To: <20261022211104.2091128-3-florian.fainelli@broadcom.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 26 Oct 2026 19:31:16 +0100
X-Gm-Features: AclHuK8Zffk1z4S4WDnZNvZlsHkwBOv-M-RtH0jRYwO8NEDBODWkjFIQ0giSyGw
Message-ID: <CAOiHx=nXKnzqB+-BvYg7rgxpLq9p2JP2xk8JchK-3+fqzpG7nw@mail.gmail.com>
Subject: Re: [PATCH net v2 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps mode
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 22, 2026 at 11:11=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> The Northstar Plus IMP port uses the switch's proprietary 2 Gbps mode for
> its internal link to the AMAC.  Its fixed-link description reports 1 Gbps=
,
> so applying that speed clears PORT_OVERRIDE_SPEED_2000M and leaves the tw=
o
> ends of the internal link configured at different speeds.

Sounds like the devicetrees are wrong. Shouldn't that fixed-link
description be updated to be 2 Gbps then? ;p

> Force the 2 Gbps mode and flow control for BCM5301x and NSP CPU ports.  T=
he
> mismatch caused switch output queue discards on both copper and SerDes
> ports, with one discard for every TCP retransmission.  With both ends
> restored to their high-speed modes, iperf3 reports no retransmissions.
>
> Fixes: b6a8a5477fe9 ("net: dsa: b53: fix resetting speed and pause on for=
ced link")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---
>  drivers/net/dsa/b53/b53_common.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index 0880310c9ce3..1f4964c28fc5 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
> @@ -1663,9 +1663,13 @@ static void b53_phylink_mac_link_up(struct phylink=
_config *config,
>         }
>
>         if (mode =3D=3D MLO_AN_FIXED) {
> -               /* Force flow control on BCM5301x's CPU port */
> -               if (is5301x(dev) && dsa_is_cpu_port(ds, port))
> -                       tx_pause =3D rx_pause =3D true;
> +               /* Force flow control on BCM5301x and NSP CPU ports */

The comment is now outdated, and is missing the forced 2G mode.

> +               if ((is5301x(dev) || dev->chip_id =3D=3D BCM58XX_DEVICE_I=
D) &&
> +                   dsa_is_cpu_port(ds, port)) {
> +                       tx_pause =3D true;
> +                       rx_pause =3D true;
> +                       speed =3D 2000;
> +               }
>
>                 b53_force_port_config(dev, port, speed, duplex,
>                                       tx_pause, rx_pause);
> --
> 2.34.1
>

Best regards,
Jonas
