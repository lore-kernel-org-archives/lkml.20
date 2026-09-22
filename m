Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650F4472F8A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790088073; cv=pass; b=SqAvOyu3AeyJG6eE9Wejphiz4BorAGQj48K518ainpZeE+MV9ODSrx9DxxuRo4xoPK/KaZy9P9f9NX1uIRScyKsVbKEDupRQw0rCEdtcOsyrHywTxjl8V8WK+VGm57ZoXUcrRaFisHV+2sbp7wioeJaMXbMsEyZwcdLuUzy0FGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790088073; c=relaxed/simple;
	bh=iYkoLLjFuLaOLIFnl2IacK4JF+N4rG+CagfraarYei4=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vs7iEdyK05rPhJPeZdat2dqEZmsRtymQNgITAPGNoNkTusOjiSzCk+NfZRTBKD3BB0jGp1Us2VKQcG+muz9cL1nfQwYjV2zMCnkMqdX58+CFYZW9oJdtFVQo6YPs/qxXoiYyE1/X+UbhEMA0JzH/KNjxFQdWP2B63x7brkdeQhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pPVxjpNy; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPVxjpNy"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f9f7dbfso473217066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790088069; cv=none;
        d=google.com; s=arc-20260327;
        b=EKSS/NJnM8A9Fux2moYEMJRNKUzrCw/6urlf+vipT3hY6HmWmfeXTTKptCzOyF0F8F
         mvq0T5CHvz1XqZ2JX3M3bcdxvh9Zq02CDSgfKCT5vHCopxWIZT+nlLgYwlCJmI3WfwdL
         89csr7BLWiNzLYfO9gMkw8oPQV5RqPVXa5add3emITJgV7k0gUakuInLsp8m3DYdh/eW
         wb2cdjT2Rn6BnOgpM7ShcnM2ZSETK6N/w4kXCflQlUtqzIvWjY7rn2E4T2Ej63i5jZWs
         VkoXN3S1/P4mT7i9WCG8KOMVY1GzCyjUU7K6f6HV4iMtqqo6mlDbc8Vtis71dvP/9A5I
         At3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=aobqVTftx2RUrnHTqiqb5TNxJi/O+H0hYNwZcfYit+Y=;
        fh=8hpPPtLm1Lwfp4TbjcRIT0eF5QQy6BrI6FZRjsl6/OE=;
        b=F6o7QT8oEo6I34m6U5fj2YfEBzMMdpflA+5TRJeaE1YcwdEiNakypEVx6/P2y/dGRZ
         8nbtc3y0FyFesPK0mkBpZff5hJQW2IH2EiSYWgIg2LLwbinlwHHz9zMak+dEzfafOgSS
         Cp1yk9O0Q/6f6bx1sAG+g9iEnai8j/2PxbXoDMFoCQVvCf9y9SrVNEyus2X5vJ+4qjpF
         3YrSfIjjOdzNWMi7XRdET9Lghla9OjzFQmwR04AQg4mSd7hjep+4I9YSHg6qMtyWjDYs
         izwDH+EyzKb1wmv/6MJ6e8Qos8beYbFnj4Qa65nIXew65fhTCSxbFtXlQ3LRT6UjJJEk
         SOog==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790088069; x=1790692869; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aobqVTftx2RUrnHTqiqb5TNxJi/O+H0hYNwZcfYit+Y=;
        b=pPVxjpNyTrNK+5ZOq0PM2wCKcDZs7hZyct3huk+9SPzuvcVEW/QIcGiGOrqOaydR/5
         Zq63oCKR7m97TtIrvMEmWJUzQm4k3CDT8LPJZgbTG36I3hZ7OrUZonzr6Y/RbyFf2LsH
         LbCxa/SdUf8gJ/0mAZJ7ivod1C0S+6tGCkTLH3SbbEfEv0XaIXyukmGAjTNDQOYL4urZ
         2QyPbk4QhmyQkGIJ6t9Ib16Erp+tu0l9mpxN2nzih2QhgRmVOA3pzGGt2pTp8ugegUeC
         7NKABHf6QzukcTJtc1JR07/x+H7IW44H0PmCc6EA+HhcQ+FslOzCKb9xu4TMmMTG0poe
         BXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790088069; x=1790692869;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aobqVTftx2RUrnHTqiqb5TNxJi/O+H0hYNwZcfYit+Y=;
        b=VHABLzhEemCopSveO4r//bWHBFpCrBHOtUQswg5MbWOVOzd655UCgFeYVulazUAU0c
         Z6yqvtRG+mEkbSocBFvGeTfHL77NE9WK/DqMMVh0tueaXcmj93uWn081P/qINfuEmqKc
         Vcxh5REB27moWDJUeVwpzeLnlbDkoNYhcyRMX3oOMUBlzq+5RIN83jIvOI9r6teNOrRH
         4tnj58ad6MIXT5VNR+sh4jTdg83Ka11pxxE7bvilW1mJ8oNJJ/wPD3CKmg0wDojQeQEy
         VOO8M9Dt85U4o9jHJri811/rWhNgX65XBkcLDrJ5ARDcxmWE5IOMiHfrWUkxoCW29XL/
         er9w==
X-Forwarded-Encrypted: i=1; AKwUvByl2m59hLTwi5M/U3eQ5MvHrlXTR1KlYTccWDQ8ssiHOnjtEolpC2sEz8WhZNXxuf46hlj1ioMVt7WtOk0=@vger.kernel.org
X-Gm-Message-State: AFuF++lS14BpomOmYO0u+SNmNSeaebdzp0hvF4AkS9k8+jMcteBjpDXF
	rgMQ8etJzg3jbvFGDUR/ey8HeTwQZfrKdFgAJXvGkxlaaPt0qp+n/8hsJ85D8lltE9dOPJRyuJZ
	AXOR1jocZXNIQaC6oerNxMBsU66WNRq3/ru+7
X-Gm-Gg: AYBFou1lHGNz2A7PLt54DbZT3NNdY1Xczerl3fqhZDHZA729mWzcraxtAXG5mqxD1EI
	pOdx/E5vuzn2TqYIZBNIhxozeK71qHk767yZ2RKCp8TRca/4w75jdu2bT1u+e8Jw3tejzXItVe0
	XFa6E0vFeifKzLmuqQy+OgjuVzFdXJZXSsrG9y2Pp+mdZqZVlkdSB/T/aNeQZZs/H7FmW5DqWi1
	288zI7kj555wGbwp8FDG7RQ0curgGPNe0FXILgORLAf2LiScTjhluYOmR0y0tOpddYkiJVFLgIG
	4E+UGINVJiGzuatVlnqxE8tgsn6V0J+Zc45xK//303dpB54JluOj18QVUid13RDqRZ6HWC9VAUW
	w2nJyo5x+HPQJ1rTLycrdLdeD+sUWn7T919zN1nV9oaSkijWhekzd71KAEb3SmDdFDqdMbAKdYP
	5NIw7+6coy8VP7Sbu8HJWOwF82rJZgHmFNfbaU6RZMTw==
X-Received: by 2002:a17:907:7b87:b0:c29:5a49:f8ae with SMTP id
 a640c23a62f3a-c2a156d4889mr1174425166b.12.1790088068900; Tue, 22 Sep 2026
 07:41:08 -0700 (PDT)
Received: from 1057883412519 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 07:41:07 -0700
Received: from 1057883412519 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 07:41:07 -0700
From: Zack Gomez <zack.gomez@gmail.com>
In-Reply-To: <aqpnhJyXHYrqqohg@gmail.com>
References: <20260914041221.1028092-1-zack.gomez@gmail.com>
 <aqeyvaw06I2883Fo@gmail.com> <CAErB-w3fmW4bQqRg7895dZ4ZRqkDJmfb7FSCLPvRCkwrhQzaqQ@mail.gmail.com>
 <aqpnhJyXHYrqqohg@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 07:41:07 -0700
X-Gm-Features: AcwNN1WJEk5oAzhiFwYCAEjZSZzcOxsgWSi9YoYm3E2lZNizP7dV3aoB5UEvxfE
Message-ID: <CAErB-w0sQ6mg9UpK9_YM-VXjQrf=shY+nwtkWMYbSF=zk+cSeQ@mail.gmail.com>
Subject: Re: [PATCH net] netpoll: bound the deferred transmit queue
To: Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 16, 2026 at 03:01:30AM -0700, Breno Leitao wrote:
> My concern is some other netpoll users that do not check for return
> value. Is this change going to affect them?
>
> For instance, team doesn't even check the return value.

They only lose the accounting. bond, bridge, team, vlan, macvlan
and dsa reach netpoll_send_skb() only under netpoll_tx_running(),
when the upper device's xmit was itself entered from netpoll, so the
skb they hand down is always netconsole's, and it is consumed whether
sent, parked or dropped. The drop lands on the lower device's txq,
which is the queue that fills, so the bound holds for them too. What
none of them see is the drop itself, bond included: NET_XMIT_DROP
from the nested call is below NET_XMIT_MASK, so the outer
__netpoll_send_skb() reports a completed transmit and xmit_drop_count
never moves. The existing !npinfo / !netif_running() drops behave
the same way today, and netconsole never had a delivery promise to
lose (UDP, and netpoll_send_udp() already drops on pool exhaustion).

> If a WARN is too heavy and it seems it might be, would a drop with
> a reason be better than just dev_kfree_skb_irq() ?
>
>       dev_kfree_skb_irq_reason(skb, SKB_DROP_REASON_FULL_RING);

Will do in v2, though it will rarely be seen:
dev_kfree_skb_irq_reason() defers the free to the completion queue,
and the next find_skb() on that CPU zaps it with __kfree_skb(), so
the reason seldom reaches the tracepoint. v2 therefore also does
dev_core_stats_tx_dropped_inc() on the device whose queue is full,
so the loss shows in its tx_dropped in the stacked case (tun pairs
the two the same way for its ring). I'd rather not WARN: the path
runs from the console being drained, and with a flood in progress
the splat is one more thing queued behind it.

Zack
