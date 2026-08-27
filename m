Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4CB484249
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 19:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787860319; cv=pass; b=hiT3WJrGcThvlLNmG58Mwt9o21NqJK1L3z4o+mMuiAeWqrrO+Roqbs0B3UNLtBLAcq36vA2JB5wyVhgYuR4NjtdGf+AYqSs9OEVZF0+6Uq6Qy2TSaPe9G45NIZ/6pQoSuu/nsQTdsDFmnqGAaMWZ7VqA1LQVOJHwFPKI5XiNrBw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787860319; c=relaxed/simple;
	bh=LgsQ2Jk6vebxd+VnjhN83g9OOGJBDaYEmZksFSbG534=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uW/Ly4hJ+X+3/KwMwh+1hpV23qZidaiUQ0QlJ2oDNIW4+Lv3BSVlLk+pPoCWz6pbkIKB7HF8aTQEBNBSq1ZY11qZTXg98ghCm9T6XIqxxRyv2D4JXCP4gNOtRjvjx42Gk2XrUNGHDyjFUx8Txd7N8XzyfyfdsvXN0kjbJl0PMyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vv+MeUpR; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv+MeUpR"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c20e70a0962so35853566b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 12:51:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787860312; cv=none;
        d=google.com; s=arc-20260327;
        b=rJHXhQUxy9iTx26BfJDByuBel9QdPaB8N/3Kur5f2A96aIU36aUWNEr/q3gRfcmGqc
         bIUvMDJdd5pTVEMR3F6ULLtJaV5zp87RD4jh+IS+pNua5VORyhnQUf9UTShXoPtJUiWd
         y0B+wonuZJ5s4saHje2SgjrGgXQNxZCftMTyJbIZSJJDHaFPjKqEeU1mT4By1MxYOW58
         2ZdkvSxzO+/5cVZblpJRrdj55C4pDLa0+PAgzVII8/lNr7wV5TIxD5yAqK6Qvw4BxShI
         sqmeVQnOQZs+ax89xlz9CuXkN5m0s5Hsits/IALQ7vHTNqLbs3OPIOefQzjNMFtlbOU9
         d2/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LgsQ2Jk6vebxd+VnjhN83g9OOGJBDaYEmZksFSbG534=;
        fh=Yr7pHsDmaBJkR3W1tdf3CFAhuiVysolh5OLneE/Bb28=;
        b=Qr2PA2W1Cj0HVLkiqp9zjRxbtuIZMiW/0vZvCKJf3g0TAsNzG4hxrn0w6FPSkeZrND
         T0+2LagUmx/P639xMg9xH29aOVd6+zNekLt2vwFoo9RTM5XsYELJNQeg0uAxYUex+6hI
         8r7f8yu/f8Nwe4wHliC3X901tlGBPIfZDU0Z+32YUcCmvSPGaDsju+qOgnUAax2zwVy8
         46JvhLyo49l0pnjwpIwYoVLd8w1KGlPKSuwsUnGe+c3FRET4n/dYJnrDXZdmJYznjZKz
         7SfxJ1TkSFCfA9I63KGdIKFyg2ba46tJmCUnQCPRlYM2RKXIi/y79HxR8fqg/NbpSNRS
         VH0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787860312; x=1788465112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LgsQ2Jk6vebxd+VnjhN83g9OOGJBDaYEmZksFSbG534=;
        b=Vv+MeUpRuWDbm8h1hXmlQOi7+RYX1gL4+xeXqhhYZuDkXjlraqXA6oaZaL8duj1PLd
         MZdRwIDjgX3u51nZ+aQb0LI8TMzX1ZiEsIZN1WhLqvTHfetcNShX1iNi2aBU3tDWvEp3
         koQeufV4iB7+H0Y+VWq9JLXALApusw5ekYTT2GVD2bbdl8eT9HlLrDGuJwsXxggojlg+
         2pbLV29VFTCz+SUMF7NDsWh7H8uQNXFiYIg6b27UwwYAFFa1xX9sxDHL7bj6QlcekXpA
         N3TXeNNpXcn7djbHbfQxn0jADQN+fNuVaLFV0vH4VUn4K1VivRqNZdZF6tvOzl22MF3k
         AfWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787860312; x=1788465112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LgsQ2Jk6vebxd+VnjhN83g9OOGJBDaYEmZksFSbG534=;
        b=mV/vb1/co/rT2B4aunWFt+Y4RjqstEII+LyJoOLzy+YU/EKz6VpbalRPiRmXdONd06
         S3tItD5UNkV/hTeuQyOjMC5RhrlU9yOlJwDhcjX7Y67jKKvzuUCAewj/bv1HIi67cxyg
         cP76O8t5hbrdGt/+0Oo01HLxtYtWeHRqq3JtiimaSZ6/DHZ7Z8tmw3a1P3h//8ZQjRUQ
         oBRfkuIHlluWu/t9OfztYECbxmrsf82+QxvbwKDC4lCBgut8INLAtOAWlK2nTPW1yoWE
         Sbmx/G7vgoUUYf+mGCxMURLTnB25JZ7NN1IPldwK4hU9WW+fVAO20aYNNbrhPlXAbEkj
         Mwlw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7NW/Mt3RW5MI8GT8F++APtfaU+yyqCAI9l52chEEm8/ELxOS7NpnOzYqmG0e3uxfYxmWKHruzcjTcOew=@vger.kernel.org
X-Gm-Message-State: AFuF++lm6oE3dcqzPVld0RkgchpUdVLVKalZE86vSvk8Nml01s3zrc2T
	Q1Fx+/x6GNfLqL5J4/m3LBWDybF5UtU7yXcRpRL8tJ5Kbe6WxOSqlR0Dfh9qEIMUEQHTeHfOdsr
	Z9gCcSUz8ITTs9ZVnxomGIw572tzJyH0=
X-Gm-Gg: AR+sD12DJTewNfYWkA9KwyQM7QE6sAl2LxR2Qj23CYfx/wbCeZuPVtF6t1UbpSK8gFQ
	bbJ8RpcnMR58P3rFUJSEV3/XjCas6yPpxmYBEBga2bwMobbJjiGsg5wdbglKeEGeVhDG1hHi/ln
	1UNX8cWb7L/MhVJC7H/CMGlqV6H6xFabQqCwEAg3LVxTnrtzD6Xf5jEwFjzoy6p4tYfFoNynozh
	5ACCLSqKyq3GMYMt+lFQdHi0gdglDuGHaWUCtaRCaJJlM5sSjMWzelptDGDJCq0daKTNqoOoBPr
	Zq6FMaUSR4oNhuSEuUmv9WSjWHru7zTp5adsZnvh5CoazQ==
X-Received: by 2002:a17:906:fd84:b0:c25:2d27:5652 with SMTP id
 a640c23a62f3a-c2557181486mr63937466b.11.1787860312178; Thu, 27 Aug 2026
 12:51:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810061612.23745-1-kernel@kempniu.pl> <6a79d7fa.ebbd881c.2cd61f.2e0d@mx.google.com>
 <anw5dJ0EqBJtAqRU@larwa.hq.kempniu.pl> <6a7c3b3e.e9cff95d.4a93a.554d@mx.google.com>
 <ao8DqOFZJkln4pvh@larwa.hq.kempniu.pl>
In-Reply-To: <ao8DqOFZJkln4pvh@larwa.hq.kempniu.pl>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Thu, 27 Aug 2026 16:51:39 -0300
X-Gm-Features: AcwNN1VL7MyL6EB5xDYfvyMpi5OQ3QxL7EIQtKmK-epqtLbXB6ovgscaDfRIm5I
Message-ID: <CAJq09z4X=RMz3-b7378WBJq3k9EUwjULJ_08TWeovZxFRz2gbw@mail.gmail.com>
Subject: Re: [PATCH] net: dsa: qca8k: Disable mgmt Ethernet for qca8327
To: =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

To add to this thread, there are a couple of other well-documented
issues tied to management Ethernet in qca8k:

1) TP-Link Archer C7 v2 (dual CPU ports 0 and 6): One CPU port becomes
muted/unusable during setup when state transitions alter the
management conduit. (ref:
https://github.com/openwrt/openwrt/pull/24011)
2) CZ.NIC Turris 1.0 and 1.1: Internal PHY access via management
frames leaks onto the external MDC/MDIO pins, corrupting communication
between the kernel and the external WAN PHY (commit 526c8ee was
insufficient to fully fix this). (ref:
https://github.com/openwrt/openwrt/pull/24755)

There are also several historical reports for other TP-Link Archer
devices (single CPU port) where ports randomly drop after some uptime,
exhibiting similar symptoms Micha=C5=82 described. At least for the two
cases I cited before, bypassing Ethernet-based PHY management and
sticking to MDIO works around the issue reliably.

As noted in Turris 1.0 PR patch, when the switch translates an
Ethernet management frame into an internal MDIO transaction, that
signal leaks onto the external MDC/MDIO lines. Because the switch acts
as an MDIO master for that internal query while the host CPU remains
the primary MDIO master, electrical bus conflict might break the
switch's internal MDIO translator state machine. Commit 526c8ee
attempted to solve this by acquiring bus->mdio_lock before
transmitting management frames, but software-level locking cannot
prevent hardware-level bus contention or state corruption if
QCA8K_MDIO_MASTER_EN toggles or leaks while lines are shared.

This raises the question: does Ethernet-based PHY access actually
yield any meaningful performance benefit (or is it worth it)? PHY
polling occurs at a low frequency. Also, maintaining a dual code path
(Ethernet management with silent fallback to direct MDIO)
significantly complicates troubleshooting. By comparison, drivers like
rtl8365mb enforce a single, deterministic code path for register/PHY
accesses to keep behavior predictable across all boards, even when we
could use an optimized path.

Given that Ethernet management frames for PHY access introduce
multiple hard-to-diagnose regressions across different board
topologies, should we consider dropping qca8k_phy_eth_command()
entirely in favor of direct MDIO, or at least providing a mechanism to
disable it? If MIB access becomes an issue, we could introduce a cache
mechanism.

Best regards,

Luiz
