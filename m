Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BF038BF8D
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791645618; cv=pass; b=U2zyhx+QQwmuU2ABXwU/qfFz+CFp0t6YxVyuv0mvJn6GH36fhy20wfIzd4m23rFmqfrT64FsuFaJ4m22SciqZMvgsSeP/HivQJMaws8QXLGM3l8ADiCePloIBOctw03dQZvgpGDkaYBoH2qAKX25939iR/oIaQTOMUnlK+4/EZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791645618; c=relaxed/simple;
	bh=E7ZeHAOi/fYgjm5BKB44ZCQNyv64n2PWDJzOgJ67vCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uR6XiqcsgwPRIYiOCcmXukwaELa7k6UoeDWvB1SKgw5JryPpYqfLAitF2bsPJifnpvF43+f+XfGfLOhXPhf7v1myMahcErZ2Tgysf+ZbKDS/7kilclAEyZ81XCNzQmaZ2j+srsBxUze7k1MmKt6aTD43IdFmhBc5HTrLntFoPCg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XANPd4PH; arc=pass smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XANPd4PH"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-4f59e61f295so599437b6e.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791645615; cv=none;
        d=google.com; s=arc-20260327;
        b=ZuG3fC0J4tisXp40SnHAB2LbWrWnhBCTdFUzFEu5O3sAGj8KcSJHpEN0rozRkHUd61
         HFky1QyBAIdJz2o2kQM5j29wSrZLxt16/jyrB/O5VJ88/uTF8UbSMP58ZUdxlvfgtnUH
         gQSJJf0IXBLW8P/+/GUFTInVuOv0qnaO8ap2RCzcRRbvrEYmytkQQkaJbmShHDUbhrye
         BVT1n08L8qxbo1Ydq1uB+a1jCM3xGImOHWihK1rQKnw7VkzetlRdpvUhCxe+2Hcr8tFM
         NaP4sCLMbJl4pXmcOY5szdXb2VulIOy54AZI3RcRRRp7EfTD1D/Ew5I9d87ZIsm4RXDb
         Nx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0r8TfOvbRgQfBK9+ea8iQw89imBytAP98AivsS+jTBs=;
        fh=XMM6WqoJJYWgATiPCYEMMtV4Ou1XYhQS2b87V7Zh0g4=;
        b=h0FQrfa9cTMLmhsOVmePJuc9cSMCb8Yo4iHcsPR6A5dgMBwC0jCf7NGLzEwEALo8dB
         iVQc9L0QPd7yQyEPIzIydvUfJUNEZWkzoLWh8yYEJOukRYAILPgnmK0ZRegvYvLzER7d
         vLsGbZnF/sm1X5/aGNzA3l4b2HcgIUTszejXdwHJfUmprTI3CaFrWEbnIh1bCjg5MEVX
         CyQPWlDsNkQlYi4ftoEGsijyh05wUFUj/BjChK1A4x1DL8fLnOqLHSLuUpGZSGKLVL66
         03kLIH7Lqi0wbFIGknAvoQ1I0fE1VMIJ9vZshZ9vi4U51Ck1T6C5udS/mwvjUq+wbQni
         w9Bw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791645615; x=1792250415; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0r8TfOvbRgQfBK9+ea8iQw89imBytAP98AivsS+jTBs=;
        b=XANPd4PH7GEu0r3ldUOAhnsz4rT+nu9KC9F7qr1+ht/ufgnQChyLFwSE/nzAoTWNrz
         xLHpIyopsEXgKarDAiWIn2IPaMxCHL74MWk3Z7dTFLlMh0ZTFwmPIpSBTdXIkdP9j15b
         BJYVYqgAx9yP0JRueKMXI2MwAY3ALCqdEj1VTgUDcNyT76aG00GiGTyi8XU8ZJmqlLa2
         uryHA7a4mXJsfZN97MpVIlnWDsi0sPI/B+Chd8q248ap27IZflQZ0SK3cZ5p4JgWiVln
         5fbY/qilKqGaFWVCWM8YS73bOVZ+S3vjZ9vMdDHlHV/GuODTiLdoGpf5cWVcD+8j3Shj
         OyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791645615; x=1792250415;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0r8TfOvbRgQfBK9+ea8iQw89imBytAP98AivsS+jTBs=;
        b=VJk0NWJUiKxTMqDUkrOH6py3VLj2PvCSM4iSWwT9TP9falC0qhLQCIOeYzV3/Hb3LW
         K1qgRDYGj6dZFhdrOqi+OQ0/ucn61E6S4evZ+O+z0ku7QNLOHnvDkG8CokU2NLcSNCkv
         1niRw4NheTeIVvIltbSz8Uo4MNx/jSoiT9ikVU7HS1TEBMelz5r+mI/J7idsL0pmB8kI
         6Mf8mxA6Gs/Y8yNz6ybK6rVenIN6/yYhP6f8PqtSpsQ3o9o9KiNN44p38teRXIZ68Gm7
         U9fVMA+st2DACQZl3AbKjvR1YHxxA+rqh3aGlcHrxtTHNVFqb68SmQGI1nK1uWKgjia1
         Hs5g==
X-Forwarded-Encrypted: i=1; AKwUvByJeYbfqWZNyXXWcYgPM+GnV1qHnA25IYIgH3YpFNDTTi5wjicoIQi4fhUITEVjfbdBZfHsbDYBQEz1ISM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5HUnocJKxSTAz/gtX1LKd/wQ99nNO4t7UtBldDkCZ0jDsLVyT
	BdlPx2ea5R8asUyYxQ4TRmzzKbRPiVXr9fttWcL5vy18juIDIa43mtbwhKkTx2vggOBnLbK30TC
	h/HOoQ8a7MegiKc9VOYfAgNFX4gukutQ=
X-Gm-Gg: AYBFou2exUsqSFWCmJUdtAGEjkiqUSz6X71SiVzQrm9FM/bAJs5plE7UVzBpPHOqtwn
	+Do61GFjyWdmBE+c2A0tUo4gmP4xsX5LPt0MvrbRv9ZZAXg9+rRxUhbMW2Pr4GTRMRaY+vRVwYn
	F8dGeJ8/XCyR21LD4L0uUza2mV31zXqZzH2mdahpxVlvPWha2tDU6vm96aF1JeAGfqOYnhs2G3u
	GJJ9RE2S5dFyGv+lmWvVf2y5mIsBrqkT2WhJtAJE+iUtrKlrEL1S0lOXvMgm2Li9jEYw9XwgbEM
	CdKtS1Q/hHrbI2rSBuIs6S8cggF3EniKIFVdSm+8eyhD+0H4BjY0ZO2+pG2AZk7dcA==
X-Received: by 2002:a05:6808:17a5:b0:4d6:93c3:1af1 with SMTP id
 5614622812f47-50c5672caecmr4433056b6e.60.1791645615441; Sat, 10 Oct 2026
 08:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009201455.1904698-1-omar@blockcast.net> <20261009213749.2226283-1-omar@blockcast.net>
In-Reply-To: <20261009213749.2226283-1-omar@blockcast.net>
From: Taehee Yoo <ap420073@gmail.com>
Date: Sun, 11 Oct 2026 00:20:02 +0900
X-Gm-Features: AclHuK_7zrT0KF3tsElevHgKPz5H9bXkrlPQ5TcpBKzZvse1AQ9JsAqg6GmaQXc
Message-ID: <CAMArcTUK5vRJX8VQzv+29zVrObp6XzHkdx00Q8bBSfa4HTWMcg@mail.gmail.com>
Subject: Re: [PATCH net v2 0/3] amt: fix relay tunnel keying and
 unauthenticated-Request DoS
To: Omar Ramadan <omar@blockcast.net>
Cc: netdev-bot+sinfo@kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Simon Horman <horms@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 6:37=E2=80=AFAM Omar Ramadan <omar@blockcast.net> w=
rote:
>

Hi Omar,

Thank you so much for your work!
I'm currently traveling for LPC, so my review will be delayed.
Sorry for the delay. I will take a look at your patches in the next 2-3 day=
s.

Thanks a lot!
Taehee Yoo

> Thanks -- both are fair asks. Answers below; they are also reflected in
> the v2 cover letter. v1 was generated against v7.1 and did not apply to
> net, so this is answered against v2, which is posted against net with the
> General Query patch dropped (that fix is already in net as afae89de73dd).
> v2 is three patches.
>
> How it was found
>   Manual code inspection of the AMT relay path in drivers/net/amt.c, read
>   against RFC 7450, with LLM assistance -- hence the Assisted-by: LLM
>   trailer on patch 3/3. It was not a syzbot report or a static-analysis
>   tool scan. Patch 1/3 (endpoint keying) came out of the same reading of
>   amt_request_handler() and amt_update_handler() against RFC 7450 s4.2.2.
>
> Whether it was triggered
>   Found by inspection; not observed in production. These are availability
>   and correctness defects, not memory-safety bugs, so there is no oops or
>   stack trace to attach. The symptoms follow deterministically from the
>   code the diffs change:
>
>    - 3/3, exhaustion: amt_request_handler() allocated a tunnel before any
>      validation of the source, so Relay Membership Requests from distinct
>      spoofable source endpoints fill the table to max_tunnels (default
>      128). Once full, further Requests are answered with ICMP_DEST_UNREAC=
H
>      to the (spoofed) source and genuine gateways are refused; re-sending
>      once per amt_gmi() interval holds it full.
>    - 3/3, desync: the pre-validation lookup jumped to the send path and
>      overwrote an established tunnel's ->nonce/->mac, so a single spoofed
>      Request carrying a known gateway's source endpoint made that
>      gateway's next Membership Update fail the "Invalid MAC" check -- a
>      silent one-packet denial that consumes no table slot.
>    - 1/3, aliasing: address-only keying collapses two endpoints that shar=
e
>      a source address (NAT, or one host using separate IPv4/IPv6 ports pe=
r
>      RFC 7450 s4.2.2) onto one tunnel; the later Request wins and the
>      earlier gateway silently stops receiving.
>
>   I have not staged a live end-to-end exploit run -- the above is read
>   from the code paths, not a captured trace.
>
> Fix testing (this part is observed, not inferred)
>   The three patches were applied to net and the kernel booted (arm64,
>   QEMU via virtme-ng) with CONFIG_KASAN=3Dy, CONFIG_PROVE_LOCKING=3Dy,
>   CONFIG_PROVE_RCU=3Dy and CONFIG_DEBUG_LIST=3Dy on top of
>   tools/testing/selftests/net/config. tools/testing/selftests/net/amt.sh
>   passes all six tests -- amt discovery, IPv4 and IPv6 multicast
>   forwarding, and both IPv4/IPv6 traffic-forwarding torture cases all
>   report [ OK ] -- with no KASAN, lockdep or RCU reports.
