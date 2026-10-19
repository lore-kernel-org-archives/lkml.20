Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC723DAABF
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792379301; cv=pass; b=unJr/N7BdoS170jlKZP/4/gu9AR2mfZhLcSQe4/tN5icXz7Lh8gziWa5AhZ8gUVoWyTZM+Na9JUTP00YrhLdWBqkAOgeWd4A4v3oTXNAEVzliMl4YukvTzD6oANYTU+LmCYra+YGTUBRGPB/TuVXRuKJQgNFYYbyoV9++8TQHYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792379301; c=relaxed/simple;
	bh=nCTg2yEQ0LNZyao3mm+6GhqTmbPvZfn6W+wLrwSGvv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mXeBKh798WorJ4LMcK1g6MFUeKs7FKUeWwpna1+slDvGNZeqokf6Jepbsygh2vRbrRY+iZO22z+vo3d9AgJ7CTsvJ95MXDvIGkt3LoJQfUhcIGbJ3fx5PgCc5OF3HeUzH2uBZUAI7v3wqGQd8gk/m0xPsVDJ6ZTsIuo5F7oPPrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oXKWtPiQ; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oXKWtPiQ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso4551652a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792379293; cv=none;
        d=google.com; s=arc-20260327;
        b=MduQlhLhuHcFBjHrJMNdkCq3dEcvq2N6IwlIyGUf3HQlKgv3cu23H++7i+kvUAM1Bc
         COGK1Iz9bk71oLw+4EHE0WAJaHzwBaMz/8iWWlNnwxNTy9Bq5ySnNPRbQB49xf6E4wlk
         UHbPRgimUO8A2toNc9eB9ojdaokboDM76CfnFj1rv1JzZkSWGFAKt9sxqP1Ngg2pU4LQ
         //inTLHAk/XxkQWfC6tqSLtFouXqbg3wOHrfYfWrZ6qRtVGDau1SV0PVBK2QLoKbMKLA
         XwVeKSq8oXsy8P+XqhyWHBoZ6mxNZ+iz4OCnUZKTHrn7HejLgWlCU4gmkKfn3utPfbQN
         6HRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hKRDlsDlYO9+73nMSkDl9EUQQZlY2MbgYvZNCnDwk34=;
        fh=0Ta21+/ZkzVHqSm3ZA5u7Y7Fjy/T+yQfsthuHjwSx30=;
        b=m9WFgj6M4ye6ecrCsMpOOqa3YsCc+YHXFQRKSHVQhTcgK5N+1YpGcHTiVfGUNakyYu
         /I7ZhTh49/Tg1s62Zvop0lpoKUUG1oWA8H8WPUQHcJDfmy58GIBityNgF6Bklbj20q1+
         6Wzsof12p5eqwNvx2IN7emMo5YbZcgOMUJL21JmVT2xvCup9rkAYlzWcoc5m3+b34dFk
         q/SXsJHZ73iZ2luC6wEalmbaUXZeb335s1z+fOBWJGgxLTJMqRfwMqan/9UlsSy+HnuE
         EIZ1rD9FbIE+13bn3LJxjbg3dFZUKiWONv0kZKv7mZS4NKPhc2wNN7q7+CTVMYt9OwYs
         m9Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792379293; x=1792984093; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKRDlsDlYO9+73nMSkDl9EUQQZlY2MbgYvZNCnDwk34=;
        b=oXKWtPiQLOlJ3WbWmea0qPP3AYoedzEoMR2aEYmYe7+fJxAjLOXebc08Jl82XXgAAw
         ewPviWHz1tGVlO+PT5yALt2PNSwTfCLLROeUpdrf6FtyykWzsQUZ2NxQgKEAAzPFhXJG
         ZZNxocV1DzAI/WX9kW30Mcd07ZkQEoWtAbOkW4jFj5fOqjyRfJuW9NNtDA440jyt0vJb
         DQyD9ZID2sl5RZpX3cQQSRH2NshD6qq8Erj5t0qbOq86BtTO6vzMzgGbbJhEIHSBl8rS
         IhO7pUwkFp9qeDSsxJDdgDTsIpob9tk1qvVx8o5A8n6GUnJuAcHppW3KcEPQckF94yKM
         Cpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792379293; x=1792984093;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hKRDlsDlYO9+73nMSkDl9EUQQZlY2MbgYvZNCnDwk34=;
        b=E5P5Y+D6GGNtyFq+evokrt23XbleW1TK1UN9e9oAjZd7ptZ08yXgL80UClLhzziHFM
         +8qIkv8sSsg6iRByNTLBoaIzNyqYMiAyeqkugx/zupuft/e7y3cZGiqI49QGgGaOSqCw
         tqG6GCP96eVEk5me1Vjq3iiZlpgfPLmDlUbDGJVxyNU+4tmVKxxVTjOaDSGj/ep6vhVN
         XNL/cyKBENlTXUYo9VSau+oXfVaWkunf7r5vQ62ubV2YYPgwTC0bgtVewT6LgYWD7PBP
         8VdNRz5Xposf7hKt1Suyy3wxH9wvpXbwD+id7JopKgP4ra0nLIM6ZO+q2zDNE0DkvMkX
         sUng==
X-Forwarded-Encrypted: i=1; AKwUvBy2VKCEeMtKcwQ0gNNWIp2cqvd0z1WbdT9sEUBadE5QwLhrtYazbOA9E7/nbufSb60QkXViw4BRm/HooP4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJltCqbgv4o8VgeY0mDjNhTCAAQPhT7GhaJ8okIkxA4VB4PNXtH
	W3WJQe9ZGkfbZKhG9Gjkug9c+PngSCFNeMTw7EfNG0F8KeNKkz6hlBRJD1Dlmra1zQrpXlxSHt5
	OeS2X0oloYND9nComS0iWun0+nuak7e4=
X-Gm-Gg: AYBFou3GngV9EXNPQS9EA1+GN1x+nmXXrWKotF3nWuMX8xTHj+EhNj55oYirGW48psJ
	gS+J/tq2vJJLvQChuPfRoVtiFCvxtApgI9qJXaVTPgl5GA8dCesfiQR8xAA1f4uCQL0BMTP3Jbx
	u0KKRzEwjK3qSDmTgQCBobtXHcLKnQ2rMcBAQ8rHuWOkeHTXvGM1aMR/dQEWyci+Ko2hgQ5lrXe
	lQW484mLJbtggkj+iKfSpy91B4Vq2SAhIDLrbCX8If429W1IlRG3+kBveVe7JmpQlQL6oKmMu7/
	+GQ7k9PaWXsc31pbN+iE0TBPV88k4oQPAsk7m9co7X7WO1pFok0TEcTsUk0y8KiZMQ1mvYdUiTy
	c9vPfhWa8qlo=
X-Received: by 2002:a17:906:1009:20b0:c42:bc58:f21 with SMTP id
 a640c23a62f3a-c42bc5810ccmr164486466b.15.1792379292960; Sun, 18 Oct 2026
 20:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002115850.962676-1-o.rempel@pengutronix.de> <20261002115850.962676-4-o.rempel@pengutronix.de>
In-Reply-To: <20261002115850.962676-4-o.rempel@pengutronix.de>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 19 Oct 2026 00:07:58 -0300
X-Gm-Features: AclHuK9qqhhKzBJuYmeDL3jwm5xPymgETCO67Uh4ZsDvV4-HZrLD0w6CHv10108
Message-ID: <CAJq09z7GXHesthJby4e_63Sse4+ue5=kpHr9jtraKjDzpuAZMA@mail.gmail.com>
Subject: Re: [PATCH net-next v1 3/8] net: ieee8021q: clarify the tt_to_tc()
 traffic-class mapping
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin.sipraga@analog.com>, 
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"

> Document that the tt_to_tc() traffic-class numbers are the pre-computed
> composition of Table I-2 (traffic type -> priority) with Table 8-5
> (priority -> traffic class). Note that Table 8-5 is the mapping for
> implementations without the credit-based shaper, so the helper's scope
> is clear; credit-based-shaper implementations use Table 34-1/34-2
> instead.
>
> The existing kdoc cited Annex I Table I-1 as the mapping basis, but
> Table I-1 only partitions traffic types into classes; it does not assign
> the class numbers.
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Looks good to me. Please just make sure `make htmldocs` builds cleanly
without warnings and renders the ASCII diagram properly.

Reviewed-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

> ---
>  net/core/ieee8021q_helpers.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
>
> diff --git a/net/core/ieee8021q_helpers.c b/net/core/ieee8021q_helpers.c
> index a5bd5e039b47..520d86d592eb 100644
> --- a/net/core/ieee8021q_helpers.c
> +++ b/net/core/ieee8021q_helpers.c
> @@ -12,10 +12,10 @@
>         compiletime_assert(ARRAY_SIZE(tbl) == IEEE8021Q_TT_MAX, \
>                            #tbl " size mismatch")
>
> -/* The following arrays map Traffic Types (TT) to traffic classes (TC) for
> - * different number of queues as shown in the example provided by
> - * IEEE 802.1Q-2022 in Annex I "I.3 Traffic type to traffic class mapping" and
> - * Table I-1 "Traffic type to traffic class mapping".
> +/* The following arrays map a traffic type (TT) to a traffic class (TC) for
> + * each supported number of queues. The mapping is the traffic-type -> priority
> + * -> traffic-class composition documented in the ieee8021q_tt_to_tc() kdoc
> + * below, reduced for the given number of queues.
>   */
>  static const u8 ieee8021q_8queue_tt_tc_map[] = {
>         [IEEE8021Q_TT_BK] = 0,
> @@ -84,17 +84,21 @@ static const u8 ieee8021q_1queue_tt_tc_map[] = {
>  };
>
>  /**
> - * ieee8021q_tt_to_tc - Map IEEE 802.1Q Traffic Type to Traffic Class
> - * @tt: IEEE 802.1Q Traffic Type
> - * @num_queues: Number of queues
> + * ieee8021q_tt_to_tc - Map an IEEE 802.1Q traffic type to a traffic class
> + * @tt: IEEE 802.1Q traffic type
> + * @num_queues: number of traffic classes (queues) available, 1..8
>   *
> - * This function maps an IEEE 802.1Q Traffic Type to a Traffic Class (TC) based
> - * on the number of queues configured on the NIC. The mapping is based on the
> - * example provided by IEEE 802.1Q-2022 in Annex I "I.3 Traffic type to traffic
> - * class mapping" and Table I-1 "Traffic type to traffic class mapping".
> + * Return the traffic-class number for @tt. It is the pre-computed composition
> + * of two IEEE 802.1Q-2022 mappings:
>   *
> - * Return: Traffic Class corresponding to the given Traffic Type or negative
> - * value in case of error.
> + *   traffic type --[Table I-2]--> priority --[Table 8-5]--> traffic class
> + *
> + * Table 8-5 is the priority-to-traffic-class mapping for implementations that
> + * do NOT support the credit-based shaper (8.6.8.2). Credit-based-shaper
> + * implementations use a different mapping (Table 34-1 for SR classes A and B,
> + * or Table 34-2 for SR class B only), which this helper does not implement.
> + *
> + * Return: the traffic class, or a negative value on error.
>   */
>  int ieee8021q_tt_to_tc(enum ieee8021q_traffic_type tt, unsigned int num_queues)
>  {
> --
> 2.47.3
>
