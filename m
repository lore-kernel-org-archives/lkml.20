Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794362592;
	b=QLH9lgTSGSID7gQo0x5XMtIJSa7gwyOwFPuWqQEjhvD2iS1YIRkz7IkqAZc6PvMriHmZ
	 4bXalvHJkCnwDbAuTbTV/37gJbkNf3fl+cGH40RQaYk54Fy+oP4a8Xj/HcxGzmEVWSoU8
	 jlZGX9VVUse5X8xgtlUslc6vjLmC/kv8NNh51He/H6p5pb0mUSEdpEPR5PU5Om+F0SbjY
	 S4b4pJQY+oamyzMhcWlOOxI16YAPlHG3UkA9lsgUy4kTsS1CMicMuE/pTSX03yfy6S71P
	 GaxYRPYsLnq/05RqyZ1exte3a9pMhEcQEbsSQtEFahU233LHf2/LXerJY8XwtdFs3YA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=VBnxo1cyrBP9eH26ieZ3qEE4H0EMBAPCxXo+MXkFYS0=;
	b=jWUiMteBYe8vjRlvlMBpiDb1Gx76vF/MebdnenLBJFafnGJA/LA53NkclFWEhww3Wkb0
	 t0CAnD5PnOYh4IE+6hKCh+3ZigEqQNfpsm1iQaDa9/zaMFaJ/EuflyefoThEhjIE5643H
	 /urau7bTKfhtaKpJt7/EJo/JUoWkPA3PqtlVihkqbobupV5L3bFbm8mjcXWb6T23qPkGQ
	 BIvMn6aFE0tJhYiXeA8BB/VKDdeCO5CuvprIxZK/y40A4GMxjDqTw8mUOz2rl8pAlVJIK
	 igCT65hXTngFDXqYH4AAE34CZ3cYrzbdY+RA7+hGwKifRZTzR0YWJfPPHXClJ4/qSzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc2mvNEV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45DEB606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45DEB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tc2mvNEV
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33fb4680717so2312951eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:03:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794362591; cv=none;
        d=google.com; s=arc-20260327;
        b=cj+5A//FN8DhQsE04Vkbl6Pcv3mfiP4IRH7BNhMnP7jIqNBul/7egtqRibbveJb0jh
         AN9P1xC9aPn9gAsZbfc0V9Gq+MiIB7W4diHUQMecF6TdZmcFXulRod0Q1jmrKzhxAaa/
         EHO2TBRSofFZhw2pEPgUxVsEQWZEZ0eq7q6PEEKPNpPJYxTB5ttcTx3BWSTL9LexXbF5
         RGDRopC4EXYL6P4CRUyQAbC+QCD2yf3hU6hBGE6mvytuLGSoYy3DmCl5lEQf5q0gbHzs
         PB1JgfdLq9EuGiIRjhIxN9GBYhMjf+8e2FN13b4Uzcfu+c6Sx+INcA0P5xB+ruVt04fG
         ZSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VBnxo1cyrBP9eH26ieZ3qEE4H0EMBAPCxXo+MXkFYS0=;
        fh=wy+axy1/rLFKDyxSfqqNOgZm1sKSh7M5uo8+IyjdtDA=;
        b=Oej6tk6FMOnEGxjroR3OZPmJert1pbKJDO0rlVBegvVA36msVefVuXXEiOU5TZfc+6
         pMQkStqmryeB1+GmM0ixh9wJYNluaAdpnbpkDITFU/7aVsHJkqifKvuEZq1qVAM6XUwN
         I/dHCTWAZO29TCssC52+5Qh1qy7IJOkZWwNpYpsSTlf/SctVKdmcdm9Ke4rSEaQJFntq
         wutlv3YrkWtzQ0LVLRaJ0dxNGd8qNCwadX74oZqEFryedMSKCg9hHua88W0066pIUe2H
         feg9z/N5K0cLkwdDJuqyR5mYTJklM21CZaHWLZwcpT+7ZyUAyt4M11268jdHMv8xbbHS
         WCoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794362591; x=1794967391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBnxo1cyrBP9eH26ieZ3qEE4H0EMBAPCxXo+MXkFYS0=;
        b=tc2mvNEVIdm8B2xyfNM9PSN/LYEqHpd+CNNM5+GFrAjNJAEVehCOmZfouiWm6H033P
         Hv2o/4hJq854Uf3xuG809NW5W5Szou42PXkOPvSdJSA/g1ZA4ZvDpu84vKZA+EEp3I85
         2wnCUDAz6A9gdQ5KOyu9GEnlWDpj7eoednBRT62k6BWDuisKRR0EyAkd3HO9+61lpKMs
         1FEJlUZu1M63H2XTMlBtjVu/g8o3bsx/bOjWUHDf8hM9W3KUgYEbWZA8gWcGn2ldO6AQ
         xn3bexjLcOGgmwgeFiW3Fo0aYcsvuJwu9Ts/JCL1WSO/k6Pt/SL9RWzwZtVOpDkDOx06
         J3ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794362591; x=1794967391;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBnxo1cyrBP9eH26ieZ3qEE4H0EMBAPCxXo+MXkFYS0=;
        b=RwtVVPT0AYVQOosogd4bMmQpv3DsmHzFNeYTHRZnpcwMQIpTYDbRzuEM+r+QjOfpfW
         7Frwp7/FkQb5WUyMjpfCZNolN8bo8LdCFd80J150nwI9lWVVyY7kbWg1NihGzYd4GjVf
         eRzTqAnW/SowEcI+C3I8MI4d2jMlSznsTqxHS8zf+pCB5vk1JjpGDO6ydV4kqqtHnB+1
         nAD1UJzXrG/3GvUvA0R2dwDE5T029ldjHLmXmUUzWKXBhyFpQwf/cPa4mY1ng3J+JF/Y
         WEZ0z58ehcLLK56NWEGv+s5Vnq9xJw6KmcvjxoJrlszl5rZE/gmfKxbyNHZA9PLj8Nl4
         BpbA==
X-Forwarded-Encrypted: i=1; AL+hErEW1QrpZsgUC0tao3VLdRjchtJFgQXz4w4MHbCssImIt4A24xhcSoyvp9ADL2HN++Ymt5GisgTijrEXunk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5kNEelqdaO6guBX0uxUW1CJZ5Bs6isaQvzw2gMQ32qCmnCBdy
	RAI0HdxvuKI3zQUSvCXQuSTirtmZWR0MdjBXuOC+igRnir8QelmVlCdRVJptX/pqPMJveBXmQoa
	o+mtc+t8/xX1KVnPlgrz5nhO1SYhanpI=
X-Gm-Gg: AYBFou1fRcWNn9Lxf1JgTvVK3qOZy9NjSZpcjzqvzH3cMwTVTLUXQXZHmgNC5CRowsF
	kVgim6ZCMtSKxZqqOMGvfafY/8LIiphVHsvNACPPesC8Tb+MkC7cIzXDsrXRF8yYcyJCtGnqsJ+
	vHUZZwrDbiNnLfYIc1T8XRd1641x9e1aWEaRP3A3h/ePIOBSr6sCPv5HjP40YSbfaGMmXiv+VYg
	lvSpseQZ90oUVPA8lT8Qp+rZAa1NLxMpt9LWiFIaZm8rTFDFSDALJuw8HMeOWHxFuAMspOq5/6e
	HvIloYRc+mA6F1jihdljTK65wNIRHCAzZwTmJMK3gl/mH4X3MpvjI5fJlWOnB7nhZUgATrd9A+u
	Z73z3SqdZTSokck3ceMpSGT56nrWKMVGTOU51KqDa2TzG8bn2I6Gi9+J0jFYFsATotZ8JqYShI7
	ZVS8JyCkhxd00uIa680HK+Mo4QRA==
X-Received: by 2002:a05:7301:a0f:b0:36e:9773:84b9 with SMTP id
 5a478bee46e88-37685e6af02mr1672191eec.23.1794362591163; Tue, 10 Nov 2026
 18:03:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-gtp-echo-rsp-leak-v1-1-192c032f3dfa@gmail.com> <265240b9-c9d9-4dcf-aea3-b31c460a0e3a@web.de>
In-Reply-To: <265240b9-c9d9-4dcf-aea3-b31c460a0e3a@web.de>
From: Joas Antonio <joasantonio108@gmail.com>
Date: Tue, 10 Nov 2026 23:03:00 -0300
X-Gm-Features: AclHuK-wtfZcgBU4GAq4_YpIoQqfFNcIZX-I7sEBpi8z3DxPXOmg25d0xNehB-4
Message-ID: <CAOCBhwHW8=-CLB3rj=if3MQN=3En=t1eQ3eQuVJA6e9vMgLrxA@mail.gmail.com>
Subject: Re: [PATCH net] gtp: free the skb after handling an echo response
To: Markus Elfring <Markus.Elfring@web.de>
Cc: netdev@vger.kernel.org, osmocom-net-gprs@lists.osmocom.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Harald Welte <laforge@gnumonks.org>, 
	Jakub Kicinski <kuba@kernel.org>, Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>, 
	stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> I suggest to reconsider the error detection a bit more.
> https://elixir.bootlin.com/linux/v7.3.1/source/drivers/net/gtp.c#L541-L57=
3
> https://cwe.mitre.org/data/definitions/252.html

Hi Markus,

thanks for looking at the patch.

Dropping the return value of genlmsg_multicast_netns() is intentional
here.  At that point the echo response has been parsed and the
notification has been handed to netlink, which owns and frees msg on
every path.  The only thing left for the handler to do is to release
the received skb, and that is the same whether the notification
reached a listener or not.

The failures that can come back are -ESRCH (nobody is subscribed to
the group) and -ENOBUFS (a listener's receive queue is full).  Neither
is a receive error for the GTP packet, and there is no recovery to
attempt.  Passing them on is what the current code does, and it is the
second problem described in the commit message: gtp_encap_recv() only
knows 1, 0 and -1, so any other negative value goes back to the UDP
stack, which treats it as a request to resubmit the packet to another
protocol.

The errors that the handler can act on, nlmsg_new() and
gtp_genl_fill_echo() failing, are still detected and now return -1 so
that the skb is dropped.

Regards,
Joas

Em ter., 10 de nov. de 2026 =C3=A0s 10:08, Markus Elfring
<Markus.Elfring@web.de> escreveu:
>
> =E2=80=A6
> > +++ b/drivers/net/gtp.c
> > @@ -561,16 +561,19 @@ static int gtp0_handle_echo_resp(struct gtp_dev *=
gtp, struct sk_buff *skb)
> =E2=80=A6
> > -     return genlmsg_multicast_netns(&gtp_genl_family, dev_net(gtp->dev=
),
> > -                                    msg, 0, GTP_GENL_MCGRP, GFP_ATOMIC=
);
> > +     genlmsg_multicast_netns(&gtp_genl_family, dev_net(gtp->dev),
> > +                             msg, 0, GTP_GENL_MCGRP, GFP_ATOMIC);
> > +     consume_skb(skb);
> > +
> > +     return 0;
> >  }
> =E2=80=A6
>
> I suggest to reconsider the error detection a bit more.
> https://elixir.bootlin.com/linux/v7.3.1/source/drivers/net/gtp.c#L541-L57=
3
> https://cwe.mitre.org/data/definitions/252.html
>
> Regards,
> Markus



--=20
Joas Antonio dos Santos
Cyber Security Specialist and Ethical Hacker
joasantonio108@gmail.com
LinkedIn
