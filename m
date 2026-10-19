Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B433A70E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792382631; cv=pass; b=AzmD6iOHC8JE9OxUQ6RXyMHsdAzMpmmcFrBsKYu8aA06DRExmLSGewLbYwoY49a1iMkUhelKyGnkPnRf4jUl77pZYuvEaDvNOX1eXrYqMqHFdDBqF0SRshKmNTKIYCax3/pbVZ+jJo5wyYJlQPYYdOi66bXSJUSntPB03cXWxwE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792382631; c=relaxed/simple;
	bh=CIW+ToTVbqQoaNVdlwiwfKJlcQBOE+geoDENw1qF2M8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jGHTlx3DZTi9FaxTwwQWhzTIxgfwWe5/WiwP0tHtbaP034kCj2glK/oBdmNQqh9H6ZNOdOkL3IDsfAzj7cLNXITtBqp0POZyQMMlwmWzDiUZ/IexXgMfZLD4YYg3mkzCaldOxCCPVS5DtR2BSQh3OQeMklSBfDHUXfRsE2sGpmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqSgv3s4; arc=pass smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqSgv3s4"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-48ed188ee81so1022814fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 21:03:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792382629; cv=none;
        d=google.com; s=arc-20260327;
        b=XtOxJ6SBH5m8LKNVaZm3IS/JuCqJkt8o08eHRsq6b1klGv12ajvjXECYO17UIiEaXt
         AI2BGH+TESI0uxvW5jA6e69UqerpJSO8jG1bN9XSU1qJm0psfL7y1zjL35+pEmSCQDP9
         HK+W95AYuirNeMhcXeKSpIlpEBfc5oQDO2O1zbY9bzeFH0u1rhhCgwqXkh839qA5BaSD
         iQyraV+4bmG1HrpdIyfi0oc9XgQgHvkB5Min8mDzkAaynz332II9Piq8Suy71AVmCQkx
         4vwmrudsv5D4RtL69dCOdlvjAfvqi+zebxBRYc9TUgNK5qPToZVAHtLw5uNcKXI81sHb
         1IwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CIW+ToTVbqQoaNVdlwiwfKJlcQBOE+geoDENw1qF2M8=;
        fh=8vj98POJYhRj+joJcQWG/WNVhGx1jZRULbBLbS8EJK8=;
        b=O39dM0w1Y4JqaUluokyjPatr4NJpWL9s8XjzQMBqm+YsfeZ5NS1uiHH6j0ThdOKRoU
         qYsW/zk50AgOdpOAwh80l/efj37374BFqxCPTV3IKnwcGleRscToNyCvrill06ErkUOt
         AHzkZ7bpeuSa0xu4mGvLQk4JZyt5F2qDPxQ0oardg3BR7XXM18ffhWoJLy7GfQijwvX5
         XiemxcUWD5xmGRvzTc/0QDO18zOv0Srmvf2rICPKh3zD2GBt0U9RGKfs3DjHH+tApoWv
         +22wwP5IGrX7FEaUMGs7/87NAQHEfcnrtVTIGxu9oYEah5PqSXKPgdw/83awRb8e1hU4
         yYdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792382629; x=1792987429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIW+ToTVbqQoaNVdlwiwfKJlcQBOE+geoDENw1qF2M8=;
        b=YqSgv3s4dSUP0vM4KZF89nMkcpCECDRnwk0k2waM6RwPPDH+gmvtTNcK4dCjjt2Hkb
         4Wj577mpQAWgRog4dYC+1ScnrwY4rvZc8P3Vqszovz5OLqMbjvqrAR/3Cl+012bXrfo6
         5OTMaGj1n3J48NwDX3O0MMjiMLIghr75tbnhLXkA2xt1+D4BVviuq+bzNZ1RO8wdZHDL
         zAwn0rexXIoDs+z8GJPclP9AIwclx5iKiNHuYXwDOWgTIURbiqWGnhuC9ljYl+cM8WPi
         nlx0En4SuSj/QcmiiSZhj+XzjlNlhAHAZ1cIUfY1VCnKUq/IIYby8jNwZ3StCOAtGNC9
         8RAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792382629; x=1792987429;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIW+ToTVbqQoaNVdlwiwfKJlcQBOE+geoDENw1qF2M8=;
        b=MZJC46HpQPQ9Q1/KFVG/MQ36lKVXnrZaiNECsWFekq/ExT8BBkbP+URfD035LpFL15
         OPlOFhQ1w6Sa/EsKb4tQWj+nEn8C7vV+k2WqQh8j7Ksi4epfwKW390gIdzVOrFnxS8bt
         kcy/Wvyf38k1HdzoTmOUTQRwp6wbwQhubzHuKAacevQoN8o5rF7ZZqxmKhZVSheLYJbA
         mfIS/ONXHBzYZhB8ZeAzYD2NCf0e0f6N5clO8ILiY/yINjEqJ1hH1ezm70ZKi9OuAR2p
         U73GUc4OW3e6xy69XTPmZjbHjptVr+jA+QkC3V8o515p1TFvFEU9hOVj4Mi1nAQ5OPXE
         gpnw==
X-Forwarded-Encrypted: i=1; AKwUvBzUFdQcviiRwcXQTNlqe7JYuwd/E04MQxOz26vAbymgNxlp/HjEEkCfECJBY0ZRX9dFrjGEse4RAxlGsTE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK/VhG78siide8DGDESWS0HeOy6XTFu06LRZabUOpPbVGiRmmPe
	HKMeEjQci0INOYS9rpjA+eFfi+7vW2gvOzg6+iCrCLrIUR9Ni5uSBosr1O6PmkPwU+pe+wVr5iP
	gZ9gviQQofNZhEBMLC5V87gdYjyxKrjQ=
X-Gm-Gg: AYBFou3o1/aWHs1NG1Zy2d1Ezd7cMMe4pWw3KLPCzYse5LokozNegNXjOz9bP/UOyAr
	UzLXn02P7BgSQQQMQJAzn481bh/csd/Swfl7jJWyHUR5BmJxWU0jNW7fmJ4aJ+C9UTg4MQabgj2
	No5b16+Z6hT2dgEaclmPzpYqOFySU57GJ5C86ShUoM8eEiJo63nh2oPbBEjGzAtN7thTmAdNRwl
	mlINtu2zZ0UR2k3z+2XpX2XJ9uxqJ3Sr4QYK695hnZY4B35s/5sRu9Ipf23AQ/4Q6y2sWbO2GOC
	VoouFhzaCx/7eZeJ4Zg46jRtjFEzbqh4/l1nhhJCgOTBdivH+a+vFBi6KNKimJPXdZX5uI1+nyS
	DD3lkV0daVcY=
X-Received: by 2002:a05:6870:ebc7:b0:48f:e0f6:bd65 with SMTP id
 586e51a60fabf-4a757b88c1dmr4939128fac.54.1792382629017; Sun, 18 Oct 2026
 21:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de>
 <20261002115850.962676-6-o.rempel@pengutronix.de> <CAD++jLmPfzi6FqF+xYFJoAjqz+Q9Ax9vhUp-MjUSFNTwOPAn4g@mail.gmail.com>
 <CAD++jLnYB2ec6yOF2so7W8kkq3PR-+c2kCscTSxPuGVC-L5G4Q@mail.gmail.com> <CAJq09z4KZ6kpF+VCTiezEVO5QU0fmYfdLNwn0gR7sjo2mHXh1A@mail.gmail.com>
In-Reply-To: <CAJq09z4KZ6kpF+VCTiezEVO5QU0fmYfdLNwn0gR7sjo2mHXh1A@mail.gmail.com>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 01:03:35 -0300
X-Gm-Features: AclHuK9naO_zjEXSAv6PCgSCRLxnEU2QjLcGyFLY4_gQv1lLumh-xoIf8M2jgmM
Message-ID: <CAJq09z5rWdb8SZCEpKesN1w+_7e8HreVO9aZd=EY4aWwkXtWOw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 5/8] net: dsa: realtek: rtl8365mb: store the
 egress queue count per chip
To: Linus Walleij <linusw@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > On Mon, Oct 5, 2026 at 5:10=E2=80=AFPM Linus Walleij <linusw@kernel.org=
> wrote:
> > > On Fri, Oct 2, 2026 at 1:58=E2=80=AFPM Oleksij Rempel <o.rempel@pengu=
tronix.de> wrote:
> > >
> > > > Store the number of egress queues in the per-chip info structure an=
d
> > > > advertise it through ds->num_tx_queues, following the ksz driver
> > > > (struct ksz_chip_data.num_tx_queues).
> > > >
> > > > The queue count is a per-chip hardware property, and this driver su=
pports
> > > > several chips of the rtl8367c family. All currently-supported chips=
 expose
> > > > eight queues, but keeping the count in chip_info lets the QoS code =
that
> > > > follows program the priority-to-queue map via the ieee8021q helpers=
 for
> > > > whatever queue count a chip carries, so the 802.1Q collapse is corr=
ect
> > > > rather than hard-coded to eight.
> > > >
> > > > Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> > >
> > > RTL8366RB has 8 queues so it's fine to keep this separate
> > > per-subdriver.
> > > Reviewed-by: Linus Walleij <linusw@kernel.org>
> >
> > I meant RTL8366RB has 6 queues. Hm maybe you rather want to
> > store this in struct realtek_variant and have the core
> > helper instead?
>
> Hi Linus,
>
> Right now, the common realtek core doesn't handle any queue or QoS
> logic yet. In rtl8365mb, this property is primarily used internally by
> the driver. Moving it to struct realtek_variant felt premature since
> rtl8366rb doesn't implement this functionality yet. Unless we want to
> refactor both drivers to share QoS helpers right now, keeping it
> private to rtl8365mb's chip_info seems cleaner for this series. We can
> always promote it to the variant when rtl8366rb gains similar support.
>
> What do you think?

Never mind. I only saw your review on the next patch asking for shared
helpers after sending this. In that context, your point definitely
stands.

Best regards,

Luiz
