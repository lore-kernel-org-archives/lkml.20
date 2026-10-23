Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792758969;
	b=Y5xAkak6FGPdLFZItbjLfUGVqZLUQvuF9vC8x3Vukw7n40tfndH3fSObQARF6TqnTAnE
	 PStIUGEPPthFNzyroRJGt9e7VYmctiZh1e+31lqH+Ksb59DZRYBFmHY6sSHchR5PtMgRx
	 q9NujtLZnnXmlGOqmpvhLlaZpr7OUfuAVgYNaOw9pmxnPMHmNJ1DAuAFRWXJBrzOBQ29H
	 EDsjP24nAV01+hpmNRuMgMy7tkHwAtJLBnH6r4JfcEp18YygjVAs18Td60XufoQOMtbcb
	 zLbizXd4VPEEMah8yzfVKbLlK4PwEfYl0n8dJwuWpG5PsOA9yj+i2+5phwYGtE0F2qQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792758969;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=jCwLz7Yk0IunCGqCLB2zmrV7N72LGMZmnoJIAewTS7s=;
	b=MJKTwo+PWfQTJF526XhA4fjdB8RyWMvy7izOlRPmJlmFyKvYkp4U22opUEc9WIwVCFYx
	 2n+mZIJ10TbDEE8CKKZzLvR8WuSqO55QFM+X1kJ8Vwxc4WamtzilyVBKL8qlkgXcQNlMj
	 yuZ3+hOJjtDN0hV0VKocWGtCCODuBLS+FNjQT1n9pM8/xI6Da09Wb0x0GhyAGN6BxhUPw
	 rCaEIeXFjOALh1fsYpYQpOg/3mQoqO/xSQjk/6EMd5YAik1SojqKDin8HUmQzePd+Z1SN
	 F1xUiBsbs+q5axqAuGu2wtc756mswNs8ROq7XvuWobNfou9J7uWYDgtOk4p7aX1i3kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rxRnDqd8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509EE606A330
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:36:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 509EE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rxRnDqd8
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-156cbe59524so606691c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792758968; cv=none;
        d=google.com; s=arc-20260327;
        b=Z9foJtIGvE1+7ieef6PSiHeIJO4UsQ/AnM7jwLn8Ln5t0ApikQQKZq4+11WgFP1ZpK
         6+y9PE3v1xoaBAYLP3UMM5OS65E4uf3a4GNVLxb9aNBtyz+k/ViFWned4HPnsOsjeThD
         E2Goj81a/+5hI8UmEQX1VOS9Djb4c5UzwcJE9bJ662qnllu1+dzo2phL0sHSewI9V1Cd
         +D2SnlE4VOWFg36UZ/mU1Ctdt9SbYG7ERg5Y9XuAnDgyPiY+Ko5r0za+aNiY5EIOnNMH
         s4AbrRMIRPbhL7K+5e24RDswMgqa3L7KmzUzPD1KlHCV+vfxe/UiAssSfHjGdmDDJJ7W
         9GHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jCwLz7Yk0IunCGqCLB2zmrV7N72LGMZmnoJIAewTS7s=;
        fh=DAG4E5tp2vUGvP5TcnQ7V5AUlcpFg2OtdecHMl30rDA=;
        b=ZGsDs3sfnaKYZikourApmm7RiCxBWe5vRaFre7XYhJGkxqYILPZlXxn0DZRc8BIiuy
         KXz8yY6zqCc0QaAFJg5pQ1gKGnL4qoNZIlX33AdZ6wiXafZJZDA7nrXUvuqNU9U1LHeK
         FbLODlVsiNo9UxI9Gi1nJsKjgKkUvyETpjuOHpwT/LiXoaIjI5kh3jrRX9LtTr1Ql6Vf
         r1tTgmov2AY41WlTfCYd/ehGcfR5mUIITclbpYN0YzjP+V30YNwnhpKJgGWhKME/iId8
         yLir6D1YUe79TWtli4A3ZwP0DV0fuVA0VzWsVYwgKFGZB1DjPSA2aD8dRmxQspNdTxll
         Omhg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792758968; x=1793363768; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jCwLz7Yk0IunCGqCLB2zmrV7N72LGMZmnoJIAewTS7s=;
        b=rxRnDqd8C/nJQVDxN2mKhpw32NCW8yj08XxXHq93H/0wb9JtoXPLAEFd0XYy6irypW
         S5POhuIIrdyTfiviMIm3KTbH6mVmk+0gQISkPj2ytwKfun5qutMEWCXZQ69lJzp7585A
         DmkQg0GAt8JxOadZ3XfRN4MDmUb6/ghkJWmX5ABAtF3Xx+8jLsOq45rqJItEP5dFR4Xz
         hMNxueSCHNqT4TYTQ4yY+WccWBXrA4QeJdVCWovfVtIRoWEtEjlbJ7WwA/jhhQLkyPFF
         TdLomC6z1Xh3Wfihe52eETrhDdn94/WzF6fjCkbcKYa0wyy4J/E9E7MHRrVCqtZWy3FU
         juLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792758968; x=1793363768;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jCwLz7Yk0IunCGqCLB2zmrV7N72LGMZmnoJIAewTS7s=;
        b=bbtTroqXzN4gu39fZCipoEt7d3XbhFD3eu/k4PXZJBKhEVC6SeZartj0L9MYlo05nm
         SfDXfDR3eoAj9viNE/MqosgQ5juGvPtC7xcArbXmUYmZ/7mX7MsZ1va+X5yoOt63yruL
         iGX4Rb7qRJNK0A6Bqu7Wr1E8eU9fYI6DOkslH9bMlrMWjgCDOMLOK6Troy59HobPcRyE
         +KrhuYoRqRrdftKuOcDrrGLyyyEjUu2E7PYXw11+x0v5R38RgTn+I9u4QGsOwAT15xHq
         oteNoLaFXbwT3z3AcpzTRndRvxbkv+tmhpM1f0zZAoJp0uQTAxzewOunyE58bnEGz0hr
         KQMg==
X-Forwarded-Encrypted: i=1; AKwUvBxD+23YmmeTGBSeyQ/dLKcfnl2YwM8IABOqVbl1tbhtwmB9RN6cef7Qj4maQFX4xf75U7OhyVZalvfDf2M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwBbU+LrWCiUVc9TcaLdimdfSRXBu0lVCiJDmYgxhe+jXrOwV8
	8B+bNo/9XVQUx3aRPH7WX5f46yPTIS9ir3JCsWu8rceqcgyj9nfWItOjvT1XMpWVC+cXmZVykOw
	0u518CrUksbELxdVczYs+yFCUxeR0wrc=
X-Gm-Gg: AYBFou21Vf6c7gE6s/9GjGWWubSnBW/opu6vcCxmTYqrlgUqXMLvb1PREutSjBId/YY
	hthdXsZEf8fT7h79TFdKXhp5Z6yBOLJJtGsQJhGiwKXVOyRrrBrdJT9d8PRwwNSIvI95X8vw1Bd
	MAjiO6R7cFjz77rVQGuGSJ2beTOcNW/vHMIJK2034D2SyglvS8/S1kYs6cYQTbBllGsqGmNLVX0
	1wRErPIfokrJ4a/hCAEttl/isdZ2diH2+s9NoUzHCiRePoiE8+GyXDI3pIFWXYJZzqTWiacrCL8
	MqIbu7IKZxoGS2wLu323PjSZuFXX3jRG76o0Ugw2LZybwKSxIZt877N6wPnC6Kgy5D3K2X5JVk3
	zAX0e6zg26e/uki3dU/2mBC7845anFkhS8C9c
X-Received: by 2002:a05:7022:4388:b0:185:fd0c:4585 with SMTP id
 a92af1059eb24-195c7b7c1cemr4224639c88.33.1792758968220; Fri, 23 Oct 2026
 05:36:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022103821.89552-1-timur.stukan.linux@gmail.com> <atsRW-aYHeB-cEgi@fedora>
In-Reply-To: <atsRW-aYHeB-cEgi@fedora>
From: Timur Stukan <timur.stukan.linux@gmail.com>
Date: Fri, 23 Oct 2026 15:35:57 +0300
X-Gm-Features: AclHuK91YxWcztNtNuUxM5uyMh5PXCAtkXygIGDSBa7Vzza5lJegEMqSt0BPPko
Message-ID: <CAF+_u5Byu9BccKQpZ9VcXAb-fMEhpKAD9A65LktLDJ77ng+KfQ@mail.gmail.com>
Subject: Re: [PATCH net] bonding: fix missing down path on speed/duplex
 failure after FAIL->UP
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Hangbin Liu <liuhangbin@gmail.com>, 
	Fernando Fernandez Mancera <fmancera@suse.de>, Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 at 10:48, Hangbin Liu <hangbin.liu@linux.dev> wrote:

> >  static void bond_miimon_commit(struct bonding *bond)
> >  {
> >       struct slave *slave, *primary, *active;
> > @@ -2807,10 +2828,21 @@ static void bond_miimon_commit(struct bonding *bond)
> >                       err = bond_update_speed_duplex(slave);
> >                       netdev_unlock_ops(slave->dev);
> >                       if (err && bond_needs_speed_duplex(bond)) {
> > -                             slave->link = BOND_LINK_DOWN;
>
> Hmm, this issue only happens when link_state is on
>
>         netif_running(slave->dev) && netif_carrier_ok(slave->dev);
>
> while !netif_device_present. Should we set the link up when device detached?


Hi Hangbin,

Thanks for the review and the suggestion.

A detached device is one way to get there, but it does not cover all
the ways to hit this bug. In particular, it does not cover the case i
reproduced: during inspect both link_state and netif_device_present()
are true, but the carrier is lost after inspect and before commit, so
reading speed/duplex fails in commit.


Thanks,
Timur
