Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794451098;
	b=gEktqWvYs5AlM2/sDxxsTJxZ+7T4ijOjnqg5c8mI0452G2o9eVSU8C8+fXcLWL5xZaPR
	 Kt/xPnbdE6rymZ6l0ZUDYjFH7U59dInYcqp66NpVKPOJH7s8Oy/G+tG8YIBXFepJs/7Cx
	 FmCzrmAJhfWw0yieD38QFwG4zIpeWCW/hrtD1eWuxmzd+ObxbxeLAdB1vqNt3Pk4uZ0VL
	 Xv5DX3+v1EcGIGJP35CORoNv/EF/v9C43QpxmdGDlK2vmju4nlU8cGFpgtpNRU991KnjM
	 xFaWL7NfeBvI0C0XhYLhPv5J4D1XFRF+SZ70mq0rXK3hnIxWhHASnookcnMTP3SXIDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
	b=0H6W9VFhL6ETa/4q2DqZ//GorqzICJY0pfftAJi77H3+CEHkqSeh9VxHDraGwu5Va//Y
	 d3jtQM22G/NTeDn/1rWoUD1WDuxs+B89TF9rnuVXzSWpoCw4Pl2RyMoK1sSrMC19azRx9
	 mM0tv/LUyHTJLR5G73JgEd/8vkafJ/Ax44/vyB+eHAYJ5m8Y/Qmp7y25XAjfu7BjDXTaJ
	 9uOg83PfUT5kdnOcWOX2K1gPCNQ70pbakvGbjVmposHaO7jXQt6gjgMzbmxajMZBNlks2
	 qdopppWSTAgNND/wHRbQNXWs30c9pZk0SyISoiTi32PiezNw6TrUCsUTZim5bYtIOfA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rto3X2gT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456E7606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 456E7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rto3X2gT
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91ec2d42231so39237356d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:38:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794451097; cv=none;
        d=google.com; s=arc-20260327;
        b=Ezr1x7NArv+T6vjUXu0Ns36uGC1Pst7B0x6QNS78F645xB9KSujY05G3SqrVyejCt/
         r8Aq1WHUdbpavZH21aWTJkwy1Qj6Se/iNHJ2ahVv5AMuBoztuWADd+Us9CSNVHA+g1DP
         qJghN0E9d/gdDN64vqQxmhCKljtkrkQuljEDHxBwGvR0LQ1/i/k0LZJWT5N5lQpCcHgJ
         HoLAgPLJCFMHz42Vri7pfXIKtrbuyG0uu4AoIXIroZTFR0wSG0is/KdLQMdih8qSdVnt
         mb4igbb5arN5Zf0oD5Z9AZHwY+3MSfRSx6+UcHu50dpOWlx3cQ/WbOGYaM1ps0WX22AB
         Hl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
        fh=HXg7vPpCTbO+oZ62DZ4iZhJzIAafgfGwBBqQngmvBBs=;
        b=Sgshm85BTSMhmNZTio3BBA3hWFQTLRW2n9q+u6WBeUotAMOL0AMj/n6JNbqbR9f1UW
         2jdEu+b9X6+Bwm/paPTcImA317jXzBckq+gYyqmZFS4ZGr7ukrWVfn6tg1X5PCcgK1tS
         efPhGljpT8fCTQiHPzxbGFpOSDJFiZz2nsc8J4NzLAbjjvo/zjGld562nRDFvlPHIisS
         YBnpq80DUxvQKRxN1PMZw/w6GfaIHCq8ptC+1EQiCkcTBCTDw88o3gd6Qv4M45es0eNp
         dHmnEDdS+okc6HEtLY9tYcItcjoC2/hsFzH12kO066qZt+UmfTa/Da6BZuNv6QtFxZ0i
         jnLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794451097; x=1795055897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
        b=rto3X2gTCkafPRmA8ayjxjWvp5+G9QHC6JN0pCIQ6BNz+03sEbRXUWEjuBxLxOfEML
         QuqoMtj06TE3JJhsHqEmGYhxpno8/0dBZn+sw5YaIttt2z0j7zAfBHLZU58SGI+noElv
         CM2NRM7NPgXKX1yrrJkljUnJ0deKjxah8snqq3yFvi+859V6ctsMZXsUYfAP3ndYNDsy
         O7o+4h0fQ5Ftyik2omW02NagBgZyI0CI7dkNqQdKErcNCDKWlZB0Pu2YjM8mvjIEVq+/
         aDW9dD/PHad3wMoObZCRJTEL48EF+ydmDii5wLF32kqfJQEjqTveApaJFZGVN/UpK17Q
         I5pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794451097; x=1795055897;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pqLudJhoiPVgD2EoEahVlHAVCEoKHq8SKN8B7L0dVhY=;
        b=fA0enW95dLRopv9gzcirACo4dI8dmSRoPnR4icjxe2oRx19QIGtjbpg/40HtgbJmKb
         2f4BkEhGCF9tvRULek4ieSBDvOahaGNuGzVAT93K+vq1jTxU8bnOX1i6bt7AL6jpUGf5
         NTppvnD3ZKAf8QoREdj23WM+Dq9aF6fnWHFsoFQwNdF2h9kB7hwkstFYxpjK0qqcuPgn
         9R9Gxl6VOpkOi6FmIHN5b1Ucr2TO67xXIRAqRZDsrhL7X1emXfJLgsE9kMGhPhU4rMaz
         6jOJy15dmhbNEeaYlWstb3eFaf9rW/8EsEuHwwITHHuHfCEd/PtwL0H51uLSxMRnz4+o
         GakA==
X-Forwarded-Encrypted: i=1; AL+hErEwlCpv4j86eye/KtneeQoYGjUhYwh/HshJu21VpcQwGw4g7n4lqsddBf09dH98PutmB8D1iGAenHfbkXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8e0fOJKcFRbjhOw9dsb+ezQbHq4OrUGlT8YSgKiegRQwxx5BV9
	pD2icHgKcz4MKnp2VCIoIP/stoJhm1fNZZQ4scaEnZS09sFLxkI330WmWQPfiVG8Cj9NedudjuW
	TXuyiUfsrO8YSDJ3mZqoXX3c8epy2KTo=
X-Gm-Gg: AYBFou0bI7qznsho1EzWIwgO9VwggxnsMYaSnsmqzCPITsf+BWy2X1MnjLofbzsGQQ2
	3v3tKXi1fK3IszBOJc83BUJSf1/M66awf3iym7Kg6FwOtEYkCKi2XY+A+a8nxjCaSroidCSDaCl
	rrPVjM0ZUWYWU8de3uEj4Gw+vLKva16jszoxi0PxdbmoScB0SuRs7AjoeGhmD97/iGu7rJGQn9E
	6a4PUxmEIoTC+85VqFLkpisGy7O/fG3KvK9PRgAP4LNf1Ey4enODIvMa14sG6aAoTFcBEd0EUwS
	3br12WnpH/i+uumtyRzrEpv6eBDbNfRuqrH+QnMJzhEzeachyjTQStW5RJ+KxgBSc9Kg4uAqXsD
	HDPIm4mZh7QJQO3tfw4qLk4NOu1L0kTvOAVue
X-Received: by 2002:a05:6214:62f:b0:91f:1383:1bea with SMTP id
 6a1803df08f44-91f13832415mr25376006d6.2.1794451097094; Wed, 11 Nov 2026
 18:38:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109134506.2794160-1-zxyan0222@gmail.com> <179423231463.488859.16977464890948797360@kernel.org>
 <20261111152012.3506cf35@kernel.org> <CAP7veT+buHRMu6f3o5RaKFdv3fABkWKgkO6KFn5js4PEeB8b0w@mail.gmail.com>
 <20261111182822.580e871b@kernel.org>
In-Reply-To: <20261111182822.580e871b@kernel.org>
From: zhu xin <zxyan0222@gmail.com>
Date: Thu, 12 Nov 2026 10:38:04 +0800
X-Gm-Features: AclHuK9rCxYPptofSIgt7EF7v4G1h1kXDVVe9np1u7jTLTpnwVCKysG5CejzHGI
Message-ID: <CAP7veTJpAMfEWQ7=Bm3iEiFC5L+WBj9PEnPQCEua6goKEP4VHA@mail.gmail.com>
Subject: Re: [PATCH net-next v10 0/3] net: stmmac: dwxgmac2: timestamp
 interrupt support + Agilex5 fix
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@kernel.org, pabeni@redhat.com, maxime.chevallier@bootlin.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	richardcochran@gmail.com, muhammad.nazim.amirul.nazle.asmade@altera.com, 
	rohan.g.thomas@altera.com, rmk+kernel@armlinux.org.uk, 
	o.rempel@pengutronix.de, wojciech.drewek@intel.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 10:28=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> w=
rote:
>
> On Thu, 12 Nov 2026 10:18:41 +0800 zhu xin wrote:
> > On Thu, Nov 12, 2026 at 7:20=E2=80=AFAM Jakub Kicinski <kuba@kernel.org=
> wrote:
> > >
> > > On Mon, 09 Nov 2026 13:51:54 +0000 netdev-bot+sinfo@kernel.org wrote:
> > > >  - What hardware the change was tested on. For driver fixes please
> > > >    mention the device (and if relevant firmware version) used for
> > > >    testing, or say that the change was not tested on real hardware.
> > > >
> > > > Please do not repost the series just to address the above. Instead,
> > > > reply to this email with the missing information, so that reviewers
> > > > can take it into account. If the series needs another revision for
> > > > other reasons, please include the information in the commit message=
s
> > > > then.
> > >
> > > You are at v10 and still getting these automated emails.
> > > What's going on?
> >
> > As for what is going on: I answered the bot's full questionnaire once,
> > in a direct reply at v7 [1], and since v10 the same facts are
> > described in the cover letter.  The bot, maybe, evaluates the
> > individual commit messages, where I never put the information,
> > assuming the reply and the cover letter would count.  They do not,
> > so the emails kept coming.  I will fold the tested-on and
> > found-by-inspection statements into the commit messages with the
> > next revision, which should settle it.
>
> Read what I quoted. It literally tells you to put it in the commit
> message on revision. How many times do you have to receive this?
> Please either pay attention or stop sending patches.

Understood, I misinterpreted the rule. I will put it in v11.
Sorry for the repeated noise.
