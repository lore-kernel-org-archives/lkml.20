Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6B3AC0ED
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550394; cv=pass; b=D+uwoCqCJUePZeeeRPSfZw0U2l/04c6b8IhKru1AQxRhowCpbuk1/c/O6xwkecYM+bUTw802l0QaY0Yanq/U3mSlGCf6TMZtTNhI6TVMvWtQaCvk0Dq2BnyGBDmp721BR6utduvquAaUL6pN/u7FK2WXq/4ZOguvFLAEExF6j7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550394; c=relaxed/simple;
	bh=Z82pTd9B92P9L7FdZhm2lYoAuLSq6EAjasYSS9dt8qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWv6vBqpVSZYHwS4N/etebpf690oH/WrYrVNc3RoNhaoI7W1U9nu+h0oK5PBtVA9D2MSv5xn9nU1CisV0nBNdBmwrG56KJ2IHPZqzsW+kYQAOvx4f+4DSA2JAhlmqxK/hAWIImYlvzZ5f8LOM1+CSjIqxXqHXzAdIuCwZBR8sOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifsh87Ll; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifsh87Ll"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b170129413so1958106a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791550390; cv=none;
        d=google.com; s=arc-20260327;
        b=PVLksqxwWrzMMgjB4z0EhCRI5rVb44UYNUK5Wl7a+ngNE0RugZv1DBYFl8lLwqAb8t
         BQchiHWv7+e5SDNYlVBTeg+frRQK7+L+HKck4xAFhNKw34YQZrt8i99JvZ8LVQwLy40k
         8rmCg8mozJTGDfc+/LjFxoH7MKtzQTFE/mX2A1Uhz0wuIunoeaD5G9qwJAhh1lvozjtr
         M0hD0aEFYOl3HYA83YakiVcz3aLyTYzoFV3uP62s7Ed5QXY+byuU+lX/ldlbPJBYB+El
         WDGDD4/p5zScWNHTP/oDwGjuI9R+ZNYd5JPc0BBVTzBNubUyflYbQnaBGyOxwckPZ3h4
         W71Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5vMZXYMYLUNNQlIgyE1yknyh4fPOMVeuczGExkJ8JXE=;
        fh=2Nk7RYlsOhs6Qpf9Oqd7k3ECNOfArajNxW8lY1iR80E=;
        b=HUStkywhlkWWlV8ncxtUWW2j+vPoK+xXSJkoQumUmCevhl4leAzhQ6IDVnZT9kRKqN
         EYnpeUa9v6mAOrTUIEnT9QqQvZE8BCu+gfvZ8Y4Chlu1r37yRY7/QEwhc5l0igb7BYvA
         wlj4VbZoB8WKIYcFu7PV5xBIy+cleykiOP/By54xRfY67CznC+eFo9D9+KbsWRt6o6gB
         UlEXLRme2hQ8JHGHSyZh7IJBzzxcnzFx+p8GetamtYFLt0ZXsSDpoQFi4PDJ1Xx8VO9N
         cS2zKYJvfm0q5Fjo7FSUFaMpb/9eCLa4Z1gd9GoODQIKLsFF05Cewbvv8lkXqJjYc1ml
         wY7A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791550390; x=1792155190; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vMZXYMYLUNNQlIgyE1yknyh4fPOMVeuczGExkJ8JXE=;
        b=ifsh87LlCN3wkWRcmDkQ60dk2vICGEyqa/7HAf24ZPWmzJygOFJFEFd/Ap2pale/Y5
         RJ4UR+C34UlrOvZuK6akVfOgLFtZn2Eayw2SxxUc8y1qbDw1luHugqGuinmlChwPOreG
         k2JyIOrrVWP6y/TkPZ5UjBXweBOydjaP7guPO5yWmOUtH1ELuDy4p4r8w0itCSiXAMSe
         jQpaaoju2Wf3qFA8SjG22MjAxWmVXeEL4dL5ANOQv3ICeeMzzJsbheJ0hZLmSnJXfmu7
         goZOzxXb6LwZA2pRrhHqAxHbcdZUNN5vA7wUxbFZKT5SnAiJl216AHAf6nqCO9BZWVid
         Y0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791550390; x=1792155190;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vMZXYMYLUNNQlIgyE1yknyh4fPOMVeuczGExkJ8JXE=;
        b=YvX6jYlclBwRmFI6LFTocujepqmVlaZK0Z0OUScbRHfXfRH2KAhrL/yofOrJl2qgFK
         r2GnC7xfG8sg2xDGTW5WvCx5KFX6yNyzy8pSAy9w6QzE0AIKVBKs/6wTwFmj4yyEzBUa
         5EexbBnizj51iEJ8WH07hYuroM90FXlWY79kfrKeCOKltcbpBaz1fgDc8WoPFznq4LaC
         6lcUR02IfHo49Bb8yYKkrR8837ufw1f3UWEUvQ71ffi+eXefp5pZ0ZcrJh1zRTbJD5HD
         5J04VRUAY1xmJhP905qFKlKswfKgYn0cRjw3/Salt42QewiRcsNklmaz5mc3y/CQk96j
         7zGA==
X-Forwarded-Encrypted: i=1; AKwUvBwWQ8LvpVx6b/0jFVsFOJRJ03J9IgBd1nkA4oFzk2XmFngJN1xVjg7h2X1SUk2ErKZwK842tDCUQz91OM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfP1pXle1Yq2o+iCrJyPNX7KNT23uhmNxlEFIdHAaYcWXOB6F/
	+ISBrpFcjDzHiO7klyC18xaOJpIjWDM3eLW80FuTdZnpLxknnlIrfYg4LEehqVGAVelhf/wOp6Q
	IFZAzZkp8CypxcpCeMWM6H2C2YnfufSltJCZjEw8=
X-Gm-Gg: AYBFou0wcWGRO4yeKVK42BqB1zDCwnLEI7nnYNgmwUAJMFmFI+gkeUdLhgwb7V98npj
	lYEPDRZaJhmXSKxmqcmE7uVK0NfoPY5TGK0HBz9BQYGC4Lk7OZYvfL7DAk9ReCOkGIQKZ4cYxtq
	rv0tKgXMgPMPHu/I0rQiIBq3q11p4RnblWRORoeYqzhWCND7+dMm2YEbFQW39ZcG+iUQ7Xah3Zt
	rG1pC7lFlwXCzyYyS3JJZbQUBVJQpLPn/ygEr7JEzpbRrFh0OHgJwrvFETAUYOYopqrQmLzTghG
	9urUB/hN1VZbQYQBs1tN0WmUHs52Megq/D5YhmVcbsKj6kxr03kpaGpp5rjImxTd+2Sq5Iz/f6k
	CzREK3Z5dsvP6Q4Di47aukFoVdj7AH145oZyBFQdaQxw=
X-Received: by 2002:a05:6402:450f:b0:6aa:f2cb:754c with SMTP id
 4fb4d7f45d1cf-6b17c25d3ffmr1597123a12.10.1791550390235; Fri, 09 Oct 2026
 05:53:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008220433.965791-1-linmag7@gmail.com> <038bffb2-e40d-44bb-b7ce-53e9de32e50d@lunn.ch>
 <CA+=Fv5QvhYd7EqVBYKWVgvf92SLE=FjE8EYcZvUQ7HKdx2kc3Q@mail.gmail.com> <becc8f95-4650-477b-b1c7-cc4952e5e980@lunn.ch>
In-Reply-To: <becc8f95-4650-477b-b1c7-cc4952e5e980@lunn.ch>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Fri, 9 Oct 2026 14:52:57 +0200
X-Gm-Features: AclHuK8k--wFHWgEgasHO9Vp771hJjGyFtQegdxLzMtXg-Ear1hkFG0UCoGNSGY
Message-ID: <CA+=Fv5TU1rOUimi8f+e0R4_48ki+X3qzD_+1QPyviTnJz-irvA@mail.gmail.com>
Subject: Re: [PATCH net-next] tg3: normalize inherited M3000 register byte order
To: Andrew Lunn <andrew@lunn.ch>
Cc: pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Fri, Oct 9, 2026 at 2:09=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Is there a legitimate reason you would want the bytes are swapped?
>
> You missed answering this. I'm guessing, but does the hardware offer
> this to make big endian machines more efficient?
>
> Please could you look at the driver and think about what would happen
> on a big endian machine. Is the change still correct?
>
>         Andrew

You're right, my earlier reply missed the underlying question.

That is a plausible reason for providing the hardware swap mode:
it can accommodate big-endian accesses without software byte
swapping. I haven't verified Broadcom's design rationale.

However, Linux tg3 already initializes misc_host_ctrl with WORD_SWAP set
and BYTE_SWAP clear on both little- and big-endian builds, before
this helper runs.

The helper restores that existing setting. Its swab32() compensates
for the device's inherited register state, not CPU endianness.
Subsequent accesses use the normal driver path, and the separate
__BIG_ENDIAN handling for DMA remains unchanged.

That is why I believe the correction is appropriate on either
endianness. The runtime tests were on the M3000 running big-endian
SPARC64.

Regards,
Magnus
