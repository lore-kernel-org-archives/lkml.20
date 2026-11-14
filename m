Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794687991;
	b=QcfQ+IHo8N7rEaSgUpISNlyNJBzikPFlJ1fIzaYSI7h4C4/abvm521pJJ8fKrcjaOrJB
	 u01AmpeDIZpYauaXWVADhTxI7GRJYgc3r0Kl4Qf1nDQyrBAutN1Zkt9BkN2sgBwasnxQA
	 /w8nz6SgeUzXjc2MKqXqNbCzcgjaOyOH/uHaSlHufcueatCSAdNdzdrBlK+skCA0npeij
	 0LNR3jTv8g3LNkZLoFw6xPhd+bJaMbSQ+bGJYpJVuADM4VS0ImR3ojjdqU4eXA/gpDZ1Z
	 6ICQupZJ6xPFi1AJcWDmL9bt2l5YMp2LYfMF9l5RgYPtcrnPiL+KIFFHe+as3GngP0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794687991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
	b=B6fdCMLzhxN2hGluwpWwjC2SdMoLhP2jZdCFSrIyl5mmZb9ll0D8er6eclN4vQxKNCEt
	 c/xIxm5Joz5ucgtcDEzXgugca54DTCbyT5potU9Ogcd4ESSHNnIo0qxTvzmw03QUEn6CN
	 eBevWo45uX65NKR7ZadrTPkYq6tcdbs1vYsxZadT12A5lMGtr191aOs6fa9wMxO0Qdsbg
	 lclLYd/W6Ne7hgYoZe12qQEbEReLFliTbWlVsdc3U7Vhe3m6+yCfUYR1H4uPxRlaITX0C
	 6HYYRxbKzh+m9OuboZKjhahqgR2VKSk84potkfbM/FQycXnfPsNglVo/+lJsdOKnr0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ysVS/Pc2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9767C606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9767C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ysVS/Pc2
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso421324966b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:26:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794687990; cv=none;
        d=google.com; s=arc-20260327;
        b=aGJCjxMRCIqCQ0y3K4s7uHj00T+l06s9vl6abIWA45sAXV+wZgbj5h0IR8RpnlyfIz
         M1JqyXAWuPkrHWtWL9eOvi9u5P6gGIZqNeombDT6WKUFuyr8SGjOcYPAQc/LO9RX0BJM
         gPE9lsERg/wOD9caqQvuKys+WQg8KgwdfrFhb7AgzQnbDCplVhRsN6IxLa/NdyRUvWoh
         ms10kyJP4fFiQ19KeuJTV57p4g1msGYrUQMc+/DFuFoRajckWVL+BYvxEBSm01oU8+9G
         2SX71zALKAbUW5AQq4rjAtkplwkERjJv1aJDacqPmRV1muJEUoXspVI4bBgAXZhJEZuP
         Slyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
        fh=TRNEMpSoT3aA6yGW2AXbMqXpJcBvZ2Jj7zPfyZKJ1dI=;
        b=WfbdoCt7pQndYnHnpDogYnFrJoBAgNELXwQfdFrFJHCcQ9w7RVTQCGCF163KU4TYZs
         8yKyE7UoPuSRO5Qk876cvOnK5JoQF/sDyCVQTzok6N160J8UbxpHuFaHZ9Skd42cObjv
         I7hILZtHCZrPf9eY2AAR81u/QyqIRPkwqiidvRWyH1QBbqSGn19XZKkGLwMSagnOGoSe
         SSSwBFzLJfJw/YPJeArzacSzmiavzl9mUakQvGQR10ZgfvXc+hPORVC9Lei8wlOoaBU6
         mibTYkKstMeh3HVP43tV/DQhpxo9qjOCivIESkkpuE5M76bkOvGBapcN/k5u5AnKOBLD
         NN5w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794687990; x=1795292790; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
        b=ysVS/Pc2B/Ws02ekmGuPCfumWT667tLchxxPbDG1p/VWu7+gUOB/XgYvUL/BXFAhVi
         y4A5t/WN6JzoxwZCu5WECaKnxP+zBXEkv8wljUxrXydvUsPBmx8z5rB97J3bAkzJC4s8
         Cj3VL857RDu8ZqAMlJabs7KQq3kEPBE22D9/r80pfCflHl3mBXHmmeAv8UPNCTg3ty6R
         yIlRpZ9fP3Huqen5QBnUstB5ET7QtVGA2UsRtjUMmo0uJ+DGUtpusLpGy3klUt0Np9mP
         VlcgMxPfN7yJTzsJcpBpUNH+8oNAupuvvISa6HqTS7f4oeSLAdfXkG3tEjOGJfYwo2vg
         TeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794687990; x=1795292790;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xuJyCXQBwA8FBqL6zWHOSxmjnnqXS73oC55pi2iJ3dU=;
        b=mTEz4WXT/o8aIfXkZP/ExAvkWfdJx9nl6v2bBsTMjmXgSr/5qpjPROLkpGQcgLKSHk
         g9QILBZpl+F9u9PrZksNylW4yW67+hn1BYIbG1758imcVAxiHAYqDtD+Ugvx4/J/67Yh
         sNIz1VfKUYotIZ6HW4gyIfp9tgNYjigEmnxXRfq+8t3xcF0Pj55isyLLLiZZQHNgfaNn
         eWRfkJ1wUgxHD7WrNTqSi0gbevj8c++OlNA6veItkT+2+cTfmtKPKPC40alPhpzn7ng2
         7qlmYKcByK4vXcHHiNcOjpFGVh6YlCrWqLk2xF9uW6zHHqeBI+CgICIP4kBoWRZhJ9p6
         00uw==
X-Forwarded-Encrypted: i=1; AL+hErF9++AmP9lAyRTwuNy9lagd9lhJ8E12UQHSzJTMgXlWlvf7W1VUOvBZ96jyX3H1YVU5n0Xs/JgH4Pn33qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/PY3IPGdu2c8tCHBqP8ipq/jWtgn5QdfjK5IRr5oypCYWq4dpT
	QJbwtCgglAiN7KKPtwzURQDQbvFK2zyWjdCQRnHa7CUVn8/VhgBFfEr8bJ6XztXRQgJdu8flDPc
	Tc6o+hDWR9RUIlSnzrEunb7Qe/gIheNwLnLflJESfqQ==
X-Gm-Gg: AYBFou0RmUr6EVw13qamaK1UA56FiF3AX9WEPO2U+DpuLoFOwvObF144F2uJDsY8Drq
	dxk02by8kJy4xV938VI2CbDd4ZrSgfjmzm01ZPxsPZH1XuyBTnk92LE7d/22FUuHuAGz24x/+ck
	+hz3qAoQV3SKsCNUuVujnyyUObB2g8JCWHl7ovb0GmXgAtnhIZXW1C+SpN//xGUH/pJF0+L5xaf
	QDXiYHHyMWhuA1FkGqwezbNf5/GAwgCSym65WVPRTrW+E2Es8/sxlwrmJhu3ZcMb66bXIVSIA6S
	Ct5xuc5a1voAQwTtehLURIjf2Yxk8CoLwTbziVTjWtKI6K/RllrWzkJ1Mh6YOHkHPSw4WZkX55s
	d+qv9iX1UotZkZWpxVU/N4aF3Ud0+MTHK7K3H
X-Received: by 2002:a17:907:60d3:b0:c40:4f39:22e8 with SMTP id
 a640c23a62f3a-c50963d3237mr547794966b.44.1794687989782; Sat, 14 Nov 2026
 12:26:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-rtl8365mb-dcb-ingress-v2-0-f8e6fbdf8c99@pengutronix.de>
 <20261112-rtl8365mb-dcb-ingress-v2-9-f8e6fbdf8c99@pengutronix.de> <CAD++jL=EGaGXJCMGoTX-R5YU+OSU26NpbO3MBbr+yWBO0q6-yA@mail.gmail.com>
In-Reply-To: <CAD++jL=EGaGXJCMGoTX-R5YU+OSU26NpbO3MBbr+yWBO0q6-yA@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Sat, 14 Nov 2026 17:26:16 -0300
X-Gm-Features: AclHuK-opAqBbnVl3SMbicdNR5dV_cuAzme9VQuR9-JlWqPoWq-RhUXkE5AY_ck
Message-ID: <CAJq09z4rKOPb9DdMmOq8LeRjZr2HysLz4waFOcNntR+xUYSX5w@mail.gmail.com>
Subject: Re: [PATCH net-next v2 09/10] net: dsa: realtek: rtl8365mb: offload
 DCB apptrust
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

> > Wire up port_get_apptrust and port_set_apptrust. The admin can then
> > choose through dcbnl apptrust which ingress classification a port trusts
> > for its priority: 802.1p (PCP), DSCP or both. A port that trusts nothing
> > keeps the port default priority.
> >
> > In the driver's model of the hardware, the trusted priority-decision
> > table is switch-wide, so all ports that trust something must trust the
> > same selectors. While another port trusts a set of selectors, a request
> > to trust a different set is refused with -EBUSY.
> >
> > When both are trusted, DSCP must come first. When PCP is trusted, the
> > switch classifies an untagged frame by the PCP given to untagged
> > frames. A PCP source ranked above DSCP would then hide DSCP from
> > untagged IP frames. Refuse the order pcp dscp and any unknown selector
> > with -EOPNOTSUPP.
> >
> > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > ---
> > Changes in v2:
> > - move selector and precedence validation into rtl83xx-qos.c behind new
> >   qos_get/set_apptrust callbacks; weights and -EBUSY stay here (Linus)
> > - use one-hot decision weights; in the driver's model, the v1 linear
> >   weights could tie PCP with DSCP (Linus)
> > - define the apptrust slot order once (enum rtl83xx_apptrust_slot) for
> >   the shared selector table and the backend source table
> > - write the PCP and DSCP weights with one register update, so a failed
> >   write cannot leave the trusted table half programmed (sashiko)
> > - check that all apptrust sources share the one register that is updated
> > - rank DSCP above PCP and refuse pcp dscp with -EOPNOTSUPP, because
> >   with PCP first, untagged IP frames never reach DSCP

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
