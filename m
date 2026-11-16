Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794804999;
	b=MUjvwmq2tT5vIv9M4RxFcgfVlgjKK6YGyDplG26ocAagIRxE80qbn7/TOxm4nGSOxhwE
	 h3Iav3qIFLEgjv9uUGZhOzKIRa7Sc1B6VRuBjzXxkzet090BQuD1oGdIvuhfo9CNvxhPq
	 K0ASU5tQj3CQW9pKFyKV0JAdK1ECnx8yR5Rc4YzpPV+9IA6P73TocOF/2N8c1YdFDfl/l
	 DIPsRT/8A39nWF8YmEatnVFuVxP0bS4erxnrUGOH/WzmberVzgS2Q7E9ncVP3tTdF2fhv
	 JyhLakYZyPxTKUKcmcxflWivaw88B8wnDiMLzMHQnlGxR4UETNwerqwux0pTbPMqv3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794804999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
	b=GTILf47f9JxH+U5RN/qHZ9v3fc0K370Dg8YOKO+zgrobHQpfv+SUGpAEBnXkOcOE6NTp
	 nzBWgSJ9B5jPLYbrPNaq5Q2OCGJO6PyM/3/L6OTHz5KCJF2sBfqoBcKwTSmGMOSWf6MLR
	 YUShLstnPzOU1umU8EnidxqhhLQL9IEvV2jhmLIU+hGRdBTJDxnJ2Yox0NpDNaypHn+fd
	 piQMBlmcKXhk7F13dluTLXnt7xO/3HiUn7UN1+X3IQQPeu3qe0jvrduC7dyVyJufSTl3t
	 04M4ZFRARLsfSqzs2i9wW2X5PnXgEbys/TeqoJ6BxLj7MEidazi77ipnZBBPxYH5hQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1zJ5RDQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F69A606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:56:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F69A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X1zJ5RDQ
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-99e0d9b3438so188444241.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:56:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794804998; cv=none;
        d=google.com; s=arc-20260327;
        b=H5WoHxdAOTiJgd84mg3fx4ocl0MDjO5NFY4PRYdQB1VZHzzA++9avw8PGHNwvrEJWJ
         k0sybjyboX6GsSjjpHfcwISqEQUiMzAgo2J2fGe7jzcD2goiYNa2mMHrFScKSRAUSImb
         iiKnUKIUajSzrnq4xwQbyt4OCIbLms6/PcWgLTDtA9iaIykBNXnC9z9y3zBtF15HnDzZ
         PfWePJi8Zn64ZAhMgG9EAlUpXTi7Dn7yuo07DZLf4FojjIcypGDp1KYUjwHpgk2QiABR
         8wuun3x6wBPW9QIoyMyfCULz4Ryr2Yo8/LOxOGacWfVpr2plgCjBu1txsEzPW/EAkptm
         ilzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        fh=InLlEu+yNiGJ6KbLGdq7ByiOXvzm8cs6VeraN8fgyNY=;
        b=qP2IwIY6S3OAQ4det7xSau6DyZ3xkojoTZ39jx5VFnRzEeFi+ewu8C6svUZ2ZoLVl+
         4zBhLdRrgLj7tl50AtQeP0GzxsPEHgaN5KgXc1tY/FMZVFF7iBLOsQoWbv3TI5y3RC6x
         qdlSc54RQ4WlM1FJpVqMx+LXV0rfE6DEmDYvHSWZcAFZDcSTSHeYuIbfHh2idt8c1vBu
         e7KfRMTaqWCKLEvLCKl7vMFppNKV5PV5xfqSIe84rkVx1saI6XTLpDl10uM/IG8l3MGU
         v5TG+uT8insErFbgd1duDxZd0iAHvLj+VYxT5WktfNpvZN3o784jeDt+6ZyLzsvOojxy
         OBeg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794804998; x=1795409798; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        b=X1zJ5RDQeUFDdGphkWM10fgrRC2oV9rjQRtmNdqgmqHFizwwAWCJepUCRD3U+gWzZ5
         D2t/kh4W5ZyJQhMXltCOoJCkiLC3xwuN9rRcX0YSjuK5K+5XEq313NsYPeKJdIswB46Y
         oENFL6IkfhC6ya4ZdfzbMzCjfPw3/gEzl80e2+gdRcKuF1fJLNDJ9Tc60WvjaV2nZzJR
         Mlq1viJaqDPNbbHcCDd7Ty37h+it+P9ki8kaGstWVYuMIhzUR2m2lw+c/K9SijlmRsiu
         Ib0ACPMAn7DUyW4fNs31OcmXhAY6/4YSnGnFh7rsH3W6N+v91bW2AWT9KunhuO16PM6X
         SYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794804998; x=1795409798;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmXn9RNdrABzPTMtJd4NSRaGp3dYOUZF4LR0v4t4Fa4=;
        b=nZ1Bp7kU1g6BzM0Iu/cEgfSz2wCfZdyi1uHkdq6x96AzduFkfcU1Wc2P9bbSyk/Yq/
         /ulB6bmoGJS78gTUcmlcLhWCqrLMi6vVbwVOU3s/QlY4MxmJ5/70WoJI3IPtN0hZcYXc
         hTKK/goEyhCtpus9KUH3yglTiHdQOO9gKi28gUUo//ktFpb/Y7Z7zBytc60wa1uZbTaj
         DSrfnA9Gc5wITcz8Ry32f0MgwFoJGVD0L+TZ60QmbenxrZa1Z8/4NUpIl4s7yhEgrhZZ
         iwIt6v8TTLoasXX8THaGw007xC2r8pKqWkZFgTliqfLTmGOQ3/Y4zsi04VFNz8V6djBG
         0Edg==
X-Forwarded-Encrypted: i=1; AL+hErFc61WGIhty1I0XxEczT2cElVOzrJ3C34NjNZNCWqsXh9QgIfOOQTYmSXueAobwD/hzYRthKJYJMfoj4EI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/BU83TftFr68ajXQx7RjucYgnEN98Hq4IT0sTVFrqrNNXV/7SA
	r0z8RkvSiHSLqdoZTB7q73zFfua7t8OMbyhtVH9UY2Ba1bPIT03u+/zolzByW9Mo8jzM0homMv3
	4+Ne7Ihi2rt4+pzhotk5i/Ac8Cj+MFGQ=
X-Gm-Gg: AYBFou2VgsfuMeob4crShgHaFdJ7+FYxV4Nda17LIi9PN4MHGXB+Kmyn6kxh7oOIfIf
	+bmciDyu6gXDYJtakfdKIN69uZfMlqfv/702F7KfAIM0dAl5FbD1Yq4ipbb23BpqxDUPCKWo19q
	bvgqBtvjoTtjt/xCvGH1p4+z37b6eE3xSng2vTufPu6hzUaIZKowBfG81106TUvcgyENh6edEmh
	XGoZqh+jLidysMuYOF/tIDJsOpsxaucwrF7rY44SR1sRRIToi2FN+kYJ0rOzuUrOPAmoQcfZJWx
	Mogw/pivP9qPLFqiwivwNwuiYiqcPXfeBG23kVqsFZRCGNVZRqxv5q8HAhin2r6uSOl+bMp6H5M
	U7KI5sd/7lwswUQI5JqgRxzw+/kuBQyWN5vyn1a7ATZc6LRSutTeN59fScW/uHgpDHR7bFNMaMW
	VwLoauiR5BAx7hl0iw+tuilz2uQ6TTNO5JESbruObr1SuPQXwebRm9ibwkFlB1vjhJlKooAC2ey
	Gl0qfwpjNiRdhUryfWawvhNaKyLbA==
X-Received: by 2002:a05:6102:3eca:b0:7c3:6466:3155 with SMTP id
 ada2fe7eead31-7d64d8da06cmr2426406137.33.1794804998470; Sun, 15 Nov 2026
 20:56:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115-submit-acx00-phy-stats-v1-v5-0-ed81a7f54373@gmail.com>
 <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch> <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
In-Reply-To: <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 21:56:26 -0700
X-Gm-Features: Aa3M54pfgPpl22QOYcS9U-YpyBuFQlb4VrEZUDEBvkJV5vCHfNjijzrmfafBS4A
Message-ID: <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Oleksij Rempel <o.rempel@pengutronix.de>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 9:39=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sun, Nov 15, 2026 at 09:12:35PM -0700, James Hilliard wrote:
> > On Sun, Nov 15, 2026 at 8:25=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > On Sun, Nov 15, 2026 at 12:45:46AM -0700, James Hilliard wrote:
> > >
> > > > The generic PHY receive-byte counter describes successfully receive=
d
> > > > traffic. Some PHYs instead count bytes in all received frames,
> > > > including frames with errors.
> >
> > That restriction comes from the current kernel-doc definition of
> > ethtool_phy_stats.rx_bytes: "Total successfully received bytes".
>
> Yes, i found this.
>
> > Should we instead clarify the existing rx_bytes definition to include
> > errored traffic and use it for ACx00, dropping rx_bytes_total? That
> > would leave the existing packet counters unchanged.
>
> What do you mean by errored traffic?

Specifically, frames with an invalid Ethernet FCS. ACx00 has a
PHY-resident CRC-error counter, and its received-byte counter includes
bytes from those frames.

We checked this using PHY loopback with MAC FCS insertion disabled.
Frames with a software-generated valid FCS did not increment the PHY
CRC-error counter; flipping one FCS bit did. These observations came
from the PHY registers read over MDIO, not from MAC statistics.

>
> Think about it.
>
> If you don't have a MAC, you don't have FCS.

There are existing mainline PHY drivers exposing this functionality.
The QCA807x/QCA808x drivers use qcom_phy_counter_config() to enable
CRC checking, and qcom_phy_get_stats() reports the RX CRC-error count
through ethtool_phy_stats.rx_errors [0]. The IP101G driver also exposes
a phy_crc_errors counter separately from phy_symbol_errors [1].

This demonstrates frame-aware diagnostic functionality within these
PHYs, rather than something every PHY necessarily implements.

The generic byte counter need not require that functionality. My
question was whether rx_bytes should count received bytes without
conditioning the count on FCS validity. ACx00 could then report its
hardware byte total through that field, including bytes from frames
which its separate CRC checker identifies as bad.

[0] https://github.com/torvalds/linux/blob/v7.4-rc3/drivers/net/phy/qcom/qc=
om-phy-lib.c
[1] https://github.com/torvalds/linux/blob/v7.4-rc3/drivers/net/phy/icplus.=
c

>
>         Andrew
