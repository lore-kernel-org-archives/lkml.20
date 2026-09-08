Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EA651A75A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864280; cv=pass; b=VMOXILCqVuwOhdIsI5oocrvJCXiB3qUYL4FYb2V/VSOAZYqnLS8Bzpp06u5Qw9oSO7yvbITbJMCM+/IdJ3WTnZWn2pZ7FMWFTirZXzsTmBpWeDGJ3FL5gzT+bU0b46nboPKu8abafnI/UuLI1K1HizGy2si43EH98IPJ1ym75rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864280; c=relaxed/simple;
	bh=jq6gi0uGPzFXQFJMzmHXSUyKvQOqcXHQQUSLfe6FVWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z6ORt/OaZvgA4LUmgJm2CaRIdFuml2M6HNp+Kovrr2U/ZeTsk2C1TN/Ccqkpt7xmM9tmHt95ZxAfNO/n5dRGpe0XTAKY6DNIQInDXRsvRKVK1R49JWJgfr+XHx0uIFY3a32IB4og9t2SjfDBa73NSSTGBsTF4Btj6uJR9N3qOSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nXxykQZ6; arc=pass smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nXxykQZ6"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-52de50e77ffso56671601cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:44:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788864273; cv=none;
        d=google.com; s=arc-20260327;
        b=OnPK1f3P1TqjFSqBVtE6K3uJEhUmKJ+f8F0CTvKtiN/dE3uz+xpDO2QOfjycRq3HzQ
         F4o4Mkn4SvlgirG1VTUVLg8HpbZmjjxCT/oP9s33HxC4PIoOwk3MiCJBarW5tE+wY2nt
         6lkL2GB8dU06ZwIn9VsDanBeUQ4HZE1dDLpbnJ8ZNZH1R1wS7DdtcgNS/YC9ebDm1C0f
         N9UsWoMojtK7KXYzwbe60+/cVIouT+xNYgawke5/tRmpcIU66qHMO7tA7sz2pHLyN4cd
         KjyKnVLd1cORD8YaFDWVvZqBjum/fbHhoYM9ymk0RRMXFl8nxc+k26b2MMZTADHGXqj7
         ZJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M4EEEB/zlA5ToTSxptMlKX/ejtiU2dv43nInBDoFTuI=;
        fh=JFUfL4nSK8TUePz10tMALt63Kio08VSowlPsNYz3WUA=;
        b=a+gCrGlxtbUhjrIsMhQ+QL0np13TlDQtdiHyg4KRgD9m7r5LMW4lha058dENH9Ox0C
         Ulsd+12k7BzD7SNZ7Ze8A25gkcJ6sqF+tzMU0JmS7VDZvH7/1uHx+Nw364jP1+/BdIk0
         QMeRmwMT+1gcNXyDvT1kASsC02Yc/kFkJTiCGUBl+/jZROo+hb+KeF9ny6hRv6n427Py
         QbssTzbsggFYg1z0QIECNwbrDsEmzsPFfCkeC8KlcB8l1/yBub3SR18bgo8asByaueN4
         aFKzUKcSupGRm7RfZwARjHf1d5IEFOyHNei8feRvXV5BLCxP7QgQ5Pt3pEAvcVn3Ujlv
         P5sQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788864273; x=1789469073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M4EEEB/zlA5ToTSxptMlKX/ejtiU2dv43nInBDoFTuI=;
        b=nXxykQZ6lTOFei0VsBEGnFlqtht5fveW9FUHPQVmm+ol+H2PI7RA8MHbMQe8Xu9Q4U
         fz1x/oMiHVTNHPuZI8/qG9c0cU2GUFsBca4WyhzJTIsYyjYvo2zxKGKhAnsamjWRnoJr
         yqdsUQ+yVaJF4+34sYFDcPiyhJBOevO/vo4gAMy+yQ+JK9s6W+iborh9j9s4HiTRFmfv
         n0g9MDy4EQhnb6u9gfndsCrU3zC/BtAQUj0L+AfkndFil3qvLFbIgYGILIyqpgzBW0+2
         WtjewQJK0VgOgeSFWpjltRIqYFp1uVOExA7T1Awts359WhQ40RT1TM/KP+4Cm9b5d6gh
         TgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864273; x=1789469073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4EEEB/zlA5ToTSxptMlKX/ejtiU2dv43nInBDoFTuI=;
        b=m3kKpop/aToRo8sCmDHzRXyV0553A247Vqf+LI9Z6ecAtK/Hts6w5fBG9siFvFkSyq
         SpqPz4cbESbGAL5LKLhhkspcVy/nJsObNKps37d5VmhyjariBwDXV3W45eVBk9DE54gx
         3nMXdYTxwvs9E5MBAC7B74jQxkHQq0X0Ijxp1z9biSZ20cqsa5V9LZ8I8G1hwQBMHOfo
         N4J17VBGyAfbFSIyEb2iIILqXE1PnjaAjcsxi6cATBWCVCqchAZwoh5XgJkYD0lwi1os
         VC80MdDM8usU/yN8yf7bDsOiESM7fbqIoE6wsHS9tSZwG4/VDSFcIGfznIOUGptYDWij
         BrUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6sEuQjDe333IEHauv9++7qhgawZs0lPCgqljSdKSFeYkup2nomJ14R6yFYvN2xSZD7Faia9w+6YXWZ48=@vger.kernel.org
X-Gm-Message-State: AFuF++lkAfDBdoIheYnUtWxeUNNvNXAxLTG3OuzrJ3G3WWeTbVOQlZZM
	n0svxOW++unb0ZfJCPII8cOkJmvcwwBjT7ROttUMkxRJvoBmrRG02IO2ocuccYq1Y+5b3aZW+a7
	i0OmhHmAoAdF3tjdl/jB5wy1lWev0M8bQ+IWcMXIM
X-Gm-Gg: AYBFou008+Pm3KUycHQrhFJYGYkMs9NYopVtG8XruO0yAzY/41L0JWf1V2lg1wqa2Oa
	E+XqhuqzkypjnRjdPXkNRcohwQxH+iETGI+wkrFSBUhDtCX23TnoA9CapR/gYiPX4kpY89pHCIn
	r3Dn5ZiDo2KnF6ZypO4GWcBzilJ56doSw3Dq7v+rDip6ccpiCNBlXo0k06XRh0QrFMiboh25Had
	lKNKP4d1Q5t/De30IvbSt18EldaSAe5iQrybrWsNoqdjJAOsyvvkqr6EgfYPHTv+v5y0Q709r20
	GpEEN8xbDznJhetWXVSkZpq5OXnITLfosQ9NhbrAEmofZJEbbdPZF5tMov7Jh40jh9rYKNPqOr4
	DlemnkCpc3H97ZUIoDfIyiFQB1hBUCJkJUb4p2XJK5nlNBQkKXev2aMMs8g==
X-Received: by 2002:a05:622a:5a1b:b0:530:4155:1935 with SMTP id
 d75a77b69052e-530547c4e64mr364507861cf.15.1788864272270; Tue, 08 Sep 2026
 03:44:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906123151.1391349-1-inbal.lipshtat@mail.huji.ac.il> <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
In-Reply-To: <20260908103715.1402788-1-inbal.lipshtat@mail.huji.ac.il>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 8 Sep 2026 12:44:20 +0200
X-Gm-Features: AcwNN1XerT-wrXYtzu47uv4JMhHWAWEOektoDXmj0vTPrbUdoiK42ii9uln2MZs
Message-ID: <CANn89iLZr2K=TPkjQFqkg8Y1vx9ZRT6xOrxWeQrvfVjs-J2ngg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] tcp: exclude old ACKs from fast path
To: Inbal Schussheim <inbal.lipshtat@mail.huji.ac.il>
Cc: ncardwell@google.com, kuniyu@google.com, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 12:38=E2=80=AFPM Inbal Schussheim
<inbal.lipshtat@mail.huji.ac.il> wrote:
>
> Exclude ACKs outside [SND.UNA, SND.NXT] from TCP header prediction so
> that they fall through to the slow path, where ACK
> validation is applied.
>
> Add a packetdrill test for a data segment carrying an
> excessively old ACK. The test fails on the unpatched kernel and passes
> with the fix.
>
> Changes in v2:
>
> - Exclude all ACKs before SND.UNA from header prediction instead of
>   duplicating old-ACK validation in the fast path.
> - Cover pure ACKs as well as data-carrying segments.
> - Let the existing slow path handle validation and challenge ACKs.
> - Remove the packetdrill reproducer from the commit message; add the
>   packetdrill test separately.

OK but you forgot to CC netdev@vger.kernel.org and you forgot to tell
which tree you target.

Patches need to be sent to netdev@ (instead of lkml@) so that our CI
can run tests on them.

Please read Documentation/process/maintainer-netdev.rst for details.

Thanks.
