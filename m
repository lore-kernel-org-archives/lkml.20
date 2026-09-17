Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B123CB57B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669870; cv=pass; b=fd6W4qiuKri/SG031xSLFxebY3kwA5m0TP5gLm6QJ3+EIjRsETUTX1QjsqPeXKO2MUYeVU49q0dVl1E7HZ6aC1YVHPIcO5cbMf0jBiNj6NC0DW+nBfgRjf+MFK3md1vWAheUwC693xjya/vCzI7E3VOInsKTiE0V9OegvVlKtdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669870; c=relaxed/simple;
	bh=138OEEzPVhW7R6poFclN2lrh07EbWFqx3lenQ5fTUck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jYaGkLrR272uVqR1A0dIDIIm1hKNuJYHv36w1M1G0rimV93gTpJI3BGGNfahiNk3yFZLI/OLR4hIMTDrqbeFQv3hAq+IoeQN4B8zcRRX7bb3kUsoiPP1JH8r6pKt3ZLYqCMdfOnlId06ZaMMCr6xeiCxQyZ/Mq/QBaEv6Bdt2EQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pP1HzVky; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pP1HzVky"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so1930403a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:31:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669866; cv=none;
        d=google.com; s=arc-20260327;
        b=Kq/vux8eJw0t6KxRlolZJ6RB8Z69R5HOxWHxuvOT3oMIJF3+TtIPe2Sud3tGO5j3li
         jiMt2uEqxrWvq25Q1LKpvwcgE1/aqjNCMw8YQ275U9jOS+R4QlTGbtmxtM8i+pXGJOFe
         Zzf/4UtBE/Z0V+0hkjV6OUkDWqBT0tg+8SQV2ls/IZmhzMEvdgc0EP72Hj2UgCD+2d8T
         VbZJLzxU9ST00wD0v4IML7/+SEeExLU47X3czJ9kPoAUxpcIlJcJzXMWr3oJ9wK7Xe4s
         m2iwlofJKP5lfMoszk4zq1dZGkYO1Zau9gN8hfLgOnYVebI9PtPqZJczFNQzWVHuI3nL
         bAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8RPolM8OKTa75H3M3WcXwbohWQYOO0ChjLhp3KZb1ss=;
        fh=DWb2ObzpFPoFbErMh7pBVoRkSbABVGkOE2Q22j5nGcU=;
        b=oQ1Tdc4bTGzYJozd+CmpwS3cEKAJQ5m97qbziMYI480Zsah2DHzzzXIum17OxLuuYi
         D01J8XGsdHiPQiNX4M3vhyvz6lvN4WJD1ebN8Jj2OONSH+LpIMCidngYbnPCy3TaHOo6
         sR5BKvuU4KDG/aCbt/PK71+OxmuKKAEALYo15V+sXFgOxjMN6mFaGRJN1pwGyHE7bto4
         VwYjoeDxrnNSsIROU+wWw1epwWnifFKieZ0rK92/5mo/ohR4HcHB0WW7K+ZHVbf9Wwbh
         EeIAKUv798qFR9ubPhjjF+nwDnzWWXKb8V/2xvH6GDW8+8jM/SggRIvKaXtB4paeVauS
         3CQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669866; x=1790274666; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8RPolM8OKTa75H3M3WcXwbohWQYOO0ChjLhp3KZb1ss=;
        b=pP1HzVkyRxlQOnPuchG3cd3D/zWIrCa844olT4ZWSYL1w4NVL/oh0GOpPIXTn2NByF
         7zwj7chJyK99OJsWmaA/M3M7bKXlDrE99budWY9RwxI/F11chrS0RKGweouHIT4SFb1J
         H0PxOLsNfkUfIrPXJB/pqfP4hEbAHdB/5lr+Qaef3ICed96RW0xj0FZn8oEhCTPvWZ6v
         o7LOQtiHuaI9cuy6VkeTyLm+glzmyI9Y7xZ80QxlzpGsyvXhrd2ZjyxEWTq72Tdr8i0i
         sGabUHu/2vZbuAhUspflSjAlQYhrmeLnXawQmO1OGNKiT84KFEm/lSwIYZOYUiLHVvoR
         P4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669866; x=1790274666;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RPolM8OKTa75H3M3WcXwbohWQYOO0ChjLhp3KZb1ss=;
        b=MW/YKDbq6HqEN6UIpNcSUIEoVUJPD7KcFBz/oUhanlIpt5Eu0zkzJ0gVbVIiOBtJrC
         sx4+wnH3d2a3kT5aVQlPjM+7LXUsDPnr/17FsdFT7zy3UwpGr++INgUTG3IvebIYtZne
         f31BSE1pgGLGQNCFBVSi+kdnabN2vlVTABh6B+JFROvXmdaiO4aNiAljw+w9BUN2P+iu
         SeIrNd1+FLU0kKJGo5XpRzBu1OfQ1itOPK9Oz8bxXMJQMCuHFSBtNeH0ugeswzmq+b1R
         bdEFJKpgofh4aSwyhHa5NuPqQ60MocxUxxJUNOUu4FVJutPreNUYmOUdcdPMjLjepBQL
         KGIw==
X-Forwarded-Encrypted: i=1; AKwUvBxdHDeaVzlSBKQNjzPBYQS+vDZfyrHA14QBefHomAz2hcj/7Q1PalRgGMBIJG3kN1PtsXktEuwP2tuV6jU=@vger.kernel.org
X-Gm-Message-State: AFuF++mEhC/5Lc3SHjewt5NKHIF3XvDwTzhFk7ji/EVsHJXNrKuMIHnp
	4T92v85+KlZEvie3iLFWtZIFpqE7Y2VqzZ5sRyQZs85m3bKlN3sZjvG08qLf2toCiCNzSf3VaI+
	MVSgr3f6rpYA3wSx4T2JPdmjG6oQ9doU=
X-Gm-Gg: AYBFou39pyIkSwOIcGnWZ2VPsHZWZMnxrkQ6zcQBLgHSUJa9P4v7FzycmjbJksUDwcN
	xPoinHnR1CwtVf36VKcIXZT50wR4u+nzQ+LcXP3GYJh5ZJ7j3fXKrB2aBoIlZYLWfhcTz11tTRG
	DWn/Vgs2QiFJ90glqffr1SlEeS+eKJnS3GxZHaUSOSHzha9z3QeuveqPaozaaa4PzFXQls0zIwm
	C8xBd9ogacDh2Bo60WsoO78SmFNFmWIxnyE0Y3ZcijZWXxYOCzUWyWosT3YWMrXQ4sBQ9RGPUT0
	YXseEMg9h9NjjIf265FPDZ45dypGk0RGyDtc4CHE4VuTIeuswEjvowB+4e0YyA3EwWY9vt5Mq0Y
	GMBumiPTpsFVuZhD4QrJ8AuIu2C8w02PlzgKyVognG/AINX+VW7mzSfv97pV6acCTpv6Nx8Pf/K
	1JDTvgghoDTxivIHOCGSsrH8jJZQOh6p9pK0CedvUG+vco+PoQ4l+OWexYDC3a3eF2kA==
X-Received: by 2002:a17:907:970d:b0:c29:f0ec:1c15 with SMTP id
 a640c23a62f3a-c2a156a3620mr7949566b.6.1789669866497; Thu, 17 Sep 2026
 11:31:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916223228.271815-1-rosenp@gmail.com> <1ce3192c-d052-4936-9567-8a1d9b13f54a@lunn.ch>
In-Reply-To: <1ce3192c-d052-4936-9567-8a1d9b13f54a@lunn.ch>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 11:30:55 -0700
X-Gm-Features: AcwNN1XeGBT2LML3tEiiSJsMDp-S3xnIEwQ82RWKi_fw7MBqF0hA3sGeCNcQuM4
Message-ID: <CAKxU2N-=0UiY6COZ7pAa-q-iBLT5nq-AosedqaUYC79jvtdA-g@mail.gmail.com>
Subject: Re: [PATCHv2 net-next] net: fec_mpc52xx: remove dead resource size check
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 7:56=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Wed, Sep 16, 2026 at 03:32:28PM -0700, Rosen Penev wrote:
> > The check bails out if the FEC register resource is smaller than
> > sizeof(struct mpc52xx_fec), but every in-tree device tree describes
> > the FEC node as a 0x400 byte region, which is exactly the size of the
> > struct, so the condition can never be true.
>
> We generally don't fully trust DT blobs.
>
> Does this test do any actual harm in its current state?
> Why remove it?
Previous discussion:

https://lore.kernel.org/netdev/20260518044047.1002235-1-rosenp@gmail.com/
>
>         Andrew
