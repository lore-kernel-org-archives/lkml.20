Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794785247;
	b=nnfB7IktZqaqWIzblYhns6nh/m/2ITG1lfUSp+uUbfTa0tm87Nl+JGytYN1jasTOC9iF
	 7Wc7sSXVUetNdQNZNGiQVS/0y2AwcPi+oQcM4GczibjnxAEjjw4e6yX2QqOYGi0OpaC9s
	 /0kA7LGcmo4VFSyEv7DKzB9tmMoSHN9AqqFGEEhhWEmEQ4s8CDvYb0slZYq/oSky4+Xw7
	 t127uxpxLDkFOUnPp73eA47sTa+4pN3urFcgjWkxiTwP2JcPJ6xFFzkn2azJeE8OSTViU
	 D41xZC5eOwLjyXyCBKew9uRwQYyGujrBxJofDofV2R6b4YuA/Mwi4Cev51k87vrL/pg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
	b=lgZuBv8Kbw6No1D0cu5EJX4UveFYkQh5OIk9/oq/hZ5hxWvOE+dJyKkU2YQ4V0OOJ3eg
	 Kc56rPehWcqT8I24ZHaCpIGlqF9hAmu+15K0vWYQgMgFETGCZGdvXsmVZUcIOpFjN5go5
	 aszdt1PeK/aBUFOLfaLO2ryggpIV+u0j8SiW5a3ZiW5q/17AJrzGShe9Buhs2ansIx1l8
	 eCvsgANprUZhJady/V7T4mwagi/Ft9CjWPZ6T+kgXebnTe9E1WSb1NoAi/Chg7lvVWTxI
	 PQurinX1s5vHeNMCqdW+JC91h/7zTl3anjKxuMgUyr77HVj899ONv4jTVPGKGd5HfvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	dkim=pass header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=h6zgdngl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388E1606A33F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 23:27:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 388E1606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=0x0f.com header.i=@0x0f.com header.a=rsa-sha256 header.s=google header.b=h6zgdngl
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1862346c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 15:27:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794785246; cv=none;
        d=google.com; s=arc-20260327;
        b=YkNUfCT4/LL962ImXy66sWB1b70c3O+tEWyVbSARXOw7Z7HJnxc0DkTg6ynRy909bM
         S5A60lRZmMNuy9KgcoYZS/vURH0pjW1OoLQtV6ENPVxCrzxwG0t3QOkb2jouCF6cqwMj
         YO9WcN6/4Hx1QgclMEhWUUsuYAeBh22H4RV6d3U4bkOK2FdyBd5RBXO1YVygrf+hLdgp
         ZK218tF7Uv/VIq3lL0Hog8qs08CIixSVbSQRY2PrFynbvJFqrlC12187Vkxyj7zj+cSU
         D4PrBmQ3rZEPluwi1csGnjHZXGAJavOCFou9xTyy2SfIUPNxwIEpEVN1TRJ9KEhn0jFs
         XAAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
        fh=2/Qjdd50txlBXy85ND518Jw6mmIEKEUEhMEATTTdnFg=;
        b=f7YDs82dJyJaiJUB/0JpckPYSmFGQTgUKZvDcHlIspab0O/YAUqTGgCXvZyf67M8KW
         pZlkxoORRVKZFQximws+DIMcW1t5G2AI2dFdfOocakZdraulfaVr6j45kbiOQg6Mi9zj
         rcNa48dAS8a3U7sGsgP/LgPVpU+J/UyHI+GvLEwAv24zJ/MCj2NhGCM4H74bOytg52sJ
         PTJBuxDp1TMx0nFYBNE8x+JXLF6fcsrxxDxuyLuQZoTMZMQG8jt6gXil/LLNxL7DgC1A
         jfpdj+eIq3hpb9zxx2kYzYZnu5s18c+k3OkGc87gsPL2mK95wufrisNwOjcvErU0sQvf
         XarA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1794785246; x=1795390046; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
        b=h6zgdnglUWctDLujJCTlokfg7aSdPogtSs71YR0UXwFMx8nsRfvFnaSf7vMw1GZZPa
         gIZG4UbttDqxjpFf0NnH0+VkBHXkdeN7/abVog/76iEn4HfHTddy8dmT3BXS2iL1YPkI
         piw9mZWQeKWziBSDceJAVbg+zRR/MQ2qDmobg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794785246; x=1795390046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=47wTZZwmQ+jM+cYf57bWTBaV5mZlYHW+BTY5K/fBpAM=;
        b=DB1LRcQgYCm0rjBx8J1lbnWQiIjY7QjWkDXVIGKhQm1oGe3aYc2BLioGsA3PcWpwug
         Pj/WCyUkYoDOlZi88L6RxEQiglT3xAo6gh6iCP3n6Q+M5T7M/dQ/mTFQIU2f8oRSrjWB
         OpNI6OwIZhFt0j3SaDfQqtOxUgQIyxJ0sU9MeScRjQLDMW5mNuW+NuU/slkg28W3M18y
         4Tagf6jO7Q+KpxdQwL4/MxfBRKUEyUYqhtRfaDXOKuCOgVjjnYEwR9DMtf1myFv2S26V
         1mmXwDLXAS64MdRNoqb0iW1huPH4nllv7X67nThWvM/6OMzGnY1mOusdHnc3Kq0zyhiR
         WicQ==
X-Forwarded-Encrypted: i=1; AL+hErECu8qXFVoSVzideHsSALMZpNjWdp44ASNDzS5otnNRy5EzEc5ABprn+osijBU+T6Vq3A0Hs32hmsaehEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S3SJC+9Cpl8Z9ggoWsQm+NblroenMAhetVVkHC3C/83XOx/iq
	Z7MVpPFlOxzz1vt561xFSr0TbFxRUvv7R1uf3FV1+bxSo+2ZKM292ToDCK3LB0V35OpbEwjpGfr
	4A8D9jpEIWqVlLwBe2njuXEgXv2NUvHT0Fw8haLj35w==
X-Gm-Gg: AYBFou1g0bL2fZ9oDAxJCuDduQ7y/nRZhesdRhHRGB24AL37FdjWGIwPLUPdRnMTs0C
	y9NIRHxfLPIAxKPnDqUhiXJ+fZGDhGSbkYmpThJO3X+n4jDPn/LBdHSChq1d0ED9tFnbetDg2XG
	D3s+xJ5a3OOjSE4AUVs/9PHqbhFgXvJakUOx23TKouhcq8526azOicHQUlleQZzoXUmEA88IYTB
	8ILKqdh+E4hiMs7qz4KuqdrikLtbKccxYHU1V+lFtXE64wY3eMGBO8eJ/LV8yy+4k8+Pa3d4Kdg
	x8MNdn3FqEAcHxgH0wUSXCR95AuPnBnKbIJVqz0miSBO0fp0tS+55xhEM6sguHereT7uQTsyQH0
	/YrZONS4CNCwwom6dmCAbqQf58HQxLpeI8ZZZdoVzr68cNRHgI7nqBCtVQ/WpOH0e0fbJsK0=
X-Received: by 2002:a05:701b:4354:b0:195:76af:b810 with SMTP id
 a92af1059eb24-1b5030bb5a3mr7686006c88.25.1794785245934; Sun, 15 Nov 2026
 15:27:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
In-Reply-To: <20261113-fix_deadcode_elimination_for_tt_ram-v1-1-a6aa8e7cb90c@gmx.net>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 16 Nov 2026 08:27:14 +0900
X-Gm-Features: AclHuK96fOtxc3NSBV_5Qd-n94tUSXWtAwifyRRI98RC4kg0CcyPEhqjiRVPeTY
Message-ID: <CAFr9PXnjcZBac7jmdySkZNd0p4a5MCNnAFGOqOgDM1_wW+b9fQ@mail.gmail.com>
Subject: Re: [PATCH] m68k: Preserve fixups during dead code elimination
To: czietz@gmx.net
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sam Creasey <sammy@sammy.net>, 
	linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Sat, 14 Nov 2026 at 18:16, Christian Zietz via B4 Relay
<devnull+czietz.gmx.net@kernel.org> wrote:
> Fixes: 4fbdd56edf1f ("m68k: Enable dead code elimination")

That's mine. I wonder if this explains why one of my m68k machines
would not boot with dead code elimination enabled. I forget which it
was now :)
Your change looks correct to me.

Acked-by: Daniel Palmer <daniel@thingy.jp>
