Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794489676;
	b=Ru841y3TCmWpN9ZNVMjNRlfxu6ZaRUmIjxtq6UXkMYJwRGs2HSwu/jumInmq4fjVUjrK
	 fOeCxFwXpomeFiBMRUPut1PGcElET0WmbMELm36k3EM6LLCkLh31/Hu4syimYhTkABaCC
	 U/LufvLaT7s9pu8EZDBq34o5YHXZDVh60XGCmFejnLIaSGXLiGMhVJUxajz50Vi8vbcAn
	 5IsY90t8Zfo+cXFBXOAJC8aY2dpE7GqxUQzxljy5KDdcYP2Umpy6FUhuRi0geoHfCZCcI
	 c8IC2n2oFIumKUIuf6rovQvjGH/SyIAFtOiyKX+2TPk+SzezRkuFu9p0+uISYqaypxg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=8xpDDYtNnR4aoubqNFgyzZP7ndEXc4ZbJtRWR/okbkc=;
	b=eslj6vEJJtTPMnNXfAjMKmVNK9MYkDVzxQF6aqEyKbF8zE49zELo0nYTtsS9BqhQT3LN
	 E8rM7d1AN26HhTgRHZOypyorTeuxGOslfu16JhI+2plQ00s8J1QABxVwho3k3K+9F+wUC
	 g5I2P2Jv4kBeNVsEbeZp5WdBmwxdQFxfVbLHOUPzPxmfYQOQ4r9177bV5SYvXrS4iF8ib
	 SrO0kiH7E7ylAZ+x/yPzOj3y8M+TtSgP373VEpy8H1loGbcliGPXX6bygxcfElj4+wqw9
	 0L719kj+OoAg42SWHTQYITQoEcweZPRwzh6KmqPBceSZiOt4092i8AwuzROS9VnTEqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWkY05Zm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCB3606A897
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FCB3606A897
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bWkY05Zm
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b757029223so3325132a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:21:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794489675; cv=none;
        d=google.com; s=arc-20260327;
        b=ExJxQoeB9or1taF6C+AyUQlR2om/mTkzlVDfTQhu/QEokFukaqONaqFd2oriKVBWcB
         USIr4iLTwLpFoWXYXWb7EHcdbAqKJ5ydgwuljpCeIBYEuN15rTRR2J5Wy8A96Cl5fIPe
         pcQYuwxTkMCZzKw4E6R3F/Z97XCruB+ZYVThB1n99JAMljrNMZBBcNp896uCw3BC6Hw4
         MN7H6hQBOfWUpWH7QjeJQrH0ijoasAn+8Xha0XGNt77kJuBv2G5bmrRWjSFgfcnubwOp
         U6/fysxXee+FF12WdhEDucIyFdUt00uWBkkUrFvvjj6jl6VGA9c5B/vA0L+EdBk7rudq
         0LHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=8xpDDYtNnR4aoubqNFgyzZP7ndEXc4ZbJtRWR/okbkc=;
        fh=fLm6uxFgyaOrrgTuCPpTdEPbhM3lPC22HGW0T/9sePA=;
        b=c8FXYEIdgF3boglFVDYH7sZeS6L/GuFt2GifpPVpysa8Anr+4183ukHwOd1skD40JL
         bcB+Gk6qVf39uHfOZ6X6lEWQg5/+oyvmD5hu3WeIr1gFmj5MwGDM52zZoqhFJZ4/goZ3
         vcLRDOOFoOPeK706VVIOzG9vEg61QSHLbmC1dD31E/faQEKsG8tnStg2bb5rONjF5KhM
         Dr1JVOj+Xhn5/G01pRM8VT+ad/eSsHyJ6MotgHJ2rqkYfTuY/Vro8q3JLVdaYwMScU1z
         6y/PWx9DB8V0Oh2Bycw+Y/b77vEYsLQllJzdALy/O4Rg6xeCemRIcFqeqOw1GZ7VGWVg
         Jw0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794489675; x=1795094475; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8xpDDYtNnR4aoubqNFgyzZP7ndEXc4ZbJtRWR/okbkc=;
        b=bWkY05Zm+4Ji3lpgLQHZzBS1LhxOm6Edqx5AQNdzdhkUYGakxIoCc9C6XZtdt8P+qe
         fl44R1s9HzqS9vhtDtJa16X3X4g3tTNtDFh+4soV+5NG0ebKZRx22iG5h8IaPbJLXgu8
         ANESjQZPMd2jGgxbRSnp6ciDQagEEYX1fMeeQu6lKHY8LcUbykBCVP7D8XjdQGm1S1JU
         LwZovkG8gNRmvBqOoxh/tWcFLFAFdIub3p+i/19TyiqX4OBhvg+c7QYp3F131+21pLV6
         p+lch4/T7JbNJG++Qth1BGNYS3JViS31mITKXq2KIsXmO7Ouk2i39BrsvgWNErZLfYCt
         ZNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489675; x=1795094475;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8xpDDYtNnR4aoubqNFgyzZP7ndEXc4ZbJtRWR/okbkc=;
        b=t+MXoBpD36qoXuP6Y3eWFrcjF08n0t0cB16IfHC9mpl2O7UvfMh5sa1iVhzH8PxgQ/
         /pN7PuxydFIlQXMezqLrwQ1lkktBlHHYFOtQqSy07UDPa8dl06X3A4CIrM7VuJFlmubq
         QYxR4o3K1yf4XovIBjcvsAjgVFUZb19qzV6ZtTb2aNJwGh1o6iAWB/7WBeSRRF2ptSU9
         /X/AYsAZ/h6Qg/B862sHprVNk+/W5cfJAK5wBfb/H+4hoVaEndUuEwHsT6z//WRP079I
         pIjwmfBs2zgm/AyoQcXjcIEks4PR+s6KuMepNpXaCiOX7hiY9zJswnO9/wL7hiQjjn9y
         AiFA==
X-Forwarded-Encrypted: i=1; AL+hErG1HQDTGyn7Efhu3pJzP07cG4ePuk6dEX+UfMgADO1/6lrEY/fAE8urnV0fwTpdgBAOs08aOahPrKi7BbE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DuYVH7f/TaADB/aENyW9egSz/0gMOD/HGgDtTf0mZXV6dqVYg
	2ZdlNNG1K/9yLB1VT05f2GTaohGPyuwKn6wCISOmpDuHsPohEBZx61Es3d+firT46e+wmuVuBhV
	DBM2HPedFGxRz9yfNdyola2Q/QQz5T7Y=
X-Gm-Gg: AYBFou3uoWh/XstqED27HJRQnXVACxdCEcuIWBJ72w7oDjSjqSKZQw25zfQ21kg5Z0c
	cs+DvTzbS6kF2WzcwOB79k30OPLYbl4++muvF9WcTW5mkP/FX/RzyXfCoA5YwTDMW4MLgml15pM
	63V13rBbw2MhwNXZWbtRg0D/JswA+bDotiCTUZyKlhUm6uDOVuGh2fFegfai1RzraDQ2MJ7F572
	3IVFuCCgr8dzudK7ePRc1BRnSMbrYjc7fj1gQJm6F4Dtqfxrmn0nrLZwe7jdliihRqqc8ItR2Os
	k6g2mhOtHV+Z1KkE9pUr9qZY6e12+1Pwem2lMjgM8uqOUUiXEtr6blerNmug5zQdnvs3KsUAYzE
	mNtgEPqPWx70FTmm/hiINQWLanco12ZRWcWAba+517NYQJiARZgf492UK
X-Received: by 2002:a17:907:ea8b:b0:c46:8b9a:39ae with SMTP id
 a640c23a62f3a-c5066b65a98mr447696766b.28.1794489674657; Thu, 12 Nov 2026
 05:21:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112130833.233208-1-skalpesh942@gmail.com> <179448901611.2168702.17174519811846942598@kernel.org>
In-Reply-To: <179448901611.2168702.17174519811846942598@kernel.org>
From: KALPESH SOLANKI <skalpesh942@gmail.com>
Date: Thu, 12 Nov 2026 18:50:34 +0530
X-Gm-Features: AclHuK-JD7-Wus2aaeNne7wraP3NOnDb65_7q1Yzj-qAflfIEGLjp_bdk0dIcgM
Message-ID: <CADYuhkoPNzrbQOo67=4qk+5MpnogwCi7CFpSSArP20Jy4ffPbg@mail.gmail.com>
Subject: Re: [PATCH] bonding: reject IEEE 802.15.4 and 6LoWPAN devices in bond_enslave
To: netdev-bot+sinfo@kernel.org
Cc: Jay Vosburgh <jv@jvosburgh.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Oliver Hartkopp <socketcan@hartkopp.net>, Jiale Yao <yaojiale02@163.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

To provide the requested context for reviewers:

1. Discovery:
The issue was identified via manual code inspection of bond_enslave()
following up on commit 9043be310c6a ("team: reject CAN, IEEE 802.15.4
and 6LoWPAN devices in team_port_add"). Commit 9043be310c6a noted that
bonding had only blocked CAN devices (commit 8ba68464e478), leaving
bonding exposed to the exact same IEEE 802.15.4 and 6LoWPAN type
inconsistencies.

2. Triggering / Symptoms:
The bug is triggerable at runtime by creating an IEEE 802.15.4 device
(e.g., via mac802154_hwsim or fakelb) or 6LoWPAN device, enslaving it
while down to a bonding master, and:
- For IEEE 802.15.4: issuing a netlink dump (e.g., IEEE802154_LLSEC_LIST_KEY),
  where ieee802154_llsec_dump_table() unconditionally dereferences
  dev->ieee802154_ptr / ieee802154_mlme_ops(dev) on the bond device,
  causing a NULL pointer dereference (as dev->ml_priv is NULL).
- For 6LoWPAN: on NETDEV_DOWN, lowpan_event() casts netdev_priv(dev) to
  struct lowpan_dev and writes to ctx.table, corrupting struct bonding.

Thanks,
Kalpesh
