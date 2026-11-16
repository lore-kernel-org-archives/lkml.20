Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857269;
	b=zNjaoSviSH6c9rAs72SCSmW/0D2G6AWD8GuOYyIDBvCU+JrMeMuL2dFYJjIK9XDGv5Aa
	 BajugvCS98EHr2kRn8y3PKSC4kbUog2uebw5UJK3lSKnUm1E4NLdkHSXl3SuS7uYmDtI9
	 LwIc2fxsbooVdXYp+jNhZnAuAdH2hWDDtB3Ne0Yap+XFRAVq8nqTeqbJCNDUMHwCelfse
	 1eNZVIqRP1Z3CQZ/buSkyI3ngA8M0wy6MkhvKzQuSTeqSuhBo49SmhCSddjEBWmyaLmXl
	 96aWi6ETyHNI5co4qGcWze3lnN/JFbl5NkVcb4IuKnenfxWtsxMYIN9T34PqruxR3Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857269;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=69B1V6c92uxkOVI/GSaEx8ffeFLnYru6WXWWNBickDw=;
	b=q9+1bCRGTJiG+cEgEm/NwNrZy5Iv9LoYcnMIl2utkZQ6xpVXPvw/zZos70gujpM1jshl
	 o93yHennqyPrYLq7Ellb68FwSqoCYl13SAOJVGu6MLvHgsfS6wDH83M4w0FwBrZvPTKDr
	 oiXq2Nlg8hHS5+6d11aM1sPg07v16nd53iFuz3d1HGgjYLdqNU5c3Xc9bXQl5/HIGRvOY
	 L5yr4HQbSFQA9EbqD4hUkkVTnFkqdyaDgkWsWjuD/AIknrLyo7cJygMlc8iHJUgT0d8r4
	 fZOjgsGJb4QNj+xKHqKDg5BUWtsQYzCZPDnQkw8nzV0sYknO2eug/dOp9mK16WBTWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwcL+C9b;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122E1606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 122E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zwcL+C9b
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5be4fea434bso172537e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:27:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794857267; x=1795462067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=69B1V6c92uxkOVI/GSaEx8ffeFLnYru6WXWWNBickDw=;
        b=zwcL+C9b8sK5tkvLYQ0gFDmYS23SEx2+Upj6V/Dmt0bUxKqfjANqiHVVY+XgybZjDE
         s2lK7GdlC4cSNmQWVJUNB0VqOuGlU/yNlTs7aOwGK/uWuE42an4qm9gDbe9Hp0kCPy65
         DrmZoexrsiS+KTYKq1ZSmLdnPphP404R+HJqPTwoIktpEC9YF+6DtZ9UdBdiaqjkqJmM
         Olc3n9uSLZIeO5L7wWngF7SHGmOjKAdhJY8rAW64q1GSscZAbt9uvEHWmW1wgWwqEYF/
         TWrWASE5TIP1a9vUxGNwWS59gyaH+vRUSavP0j7dLDxNDdgMaZ9GqJbTiW6cCrVTtP9K
         D6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857267; x=1795462067;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=69B1V6c92uxkOVI/GSaEx8ffeFLnYru6WXWWNBickDw=;
        b=SlL4U0Ajuvgc94eie8S8XxiYlCE7Fc4LsCRprsmwFmmuREi4ovP8OriN/0vLAKu82B
         ukr82/e4JRkgl/hYSw0hqdz3BVIwIyIbvWc3s3m0sFOY/3e2Ns60KuCm3SzpFiFO4VVH
         0pdVg8oKtpqNk1R1L1r3LgQGYh+PBCNBPXvXQOZO/Y7ckWyblb3L4fDp0WTDTdXgnewP
         jkyTkDelxSRXLcAadA7enBGAROGsBWRkbE0R3ZVUAe9mWib/UdkOu+j4Hyk0F9/fFGu1
         DDj1yqDXSzOOdYkbabEB1Bte+3apmQlZ0Iu9ceEMEoGVh+arMxpMaSakEBvy+SPiOl0E
         Mjjw==
X-Forwarded-Encrypted: i=1; AL+hErFBQRuukkc1oW6Xu13oobQNICLZE0bbN/ijZd5LMHRTPrMyaAlqgjxlBwyWIgbFgkOQ3CzCu6lFiAGaUeU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EPZTy2qQdMksI6N2jEHnw4ZLwSHtNxfuR5BAKO06d3122bG0z
	hDxCNGIlqK+GGFJrDfF3YP8lki8utWAqvWAW+gpVfRvg9DviXWtWdDU=
X-Gm-Gg: AYBFou2xQVO/zzT6f55e8w8wVI8nXUb6FFsUxo+VFvlqK9K4yGQe55q2C9Y09k48D53
	e+7niOEcLvCMdd62qqODiki8hqeyri2OSsE7HJco2bBbvo0yZIS+CSUzoINW4tnncbHpYv20ZeX
	XmVUlivMuK1hw7NEbn6k/echJT6zXYzQ6dBY4i9DkFsLMu8mS6mrfG7uPPqzes++QLjvLVardzt
	MAmSZCjkWrGGibQb8L2qIj6pr0CG3jPrkBUmM2AZM/Ge4XeCL5TRjhXXMlCqC5ELad7pMS4YT/2
	TUmANvin81Q0fvCNIpGYgXox0WpaP8h/ylx4E6HsO9FYrhi/iu9uXEMM2t4l0UNZO+0bdjm9SyX
	+msaqSGkTNUBetwOraMqWFvLewk3cyvT7KrCZ+ho1MwC5floW+hB+35PFuKsfCkOpFamX9avCKO
	tRLjfsn06LgXPLIrsA2K2IAyLTIrfrS651ZQ+qcoqv6WWeeMrYTexSSVXeeNA15LEOINoBCwrx5
	OXCWVkBySQYFpW9YrHnzhzrtAduVUNiyp3mJuC8IfyyqREsuyxHJISvW/2zakL/zqZQxWqQ5hp2
	8kMUBY3WbnK72yf3CVU=
X-Received: by 2002:a05:6512:23a0:b0:5bf:ec95:41c7 with SMTP id 2adb3069b0e04-5c1a0dcba0cmr126555e87.1.1794857267093;
        Mon, 16 Nov 2026 11:27:47 -0800 (PST)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c171357289sm3414749e87.71.2026.11.16.11.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:27:46 -0800 (PST)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: miquel.raynal@bootlin.com
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Zhilkin <csharper2005@gmail.com>
Subject: Re: [PATCH] mtd: spinand: confirm ready state on SkyHigh S35ML chips
Date: Mon, 16 Nov 2026 21:27:14 +0200
Message-ID: <20261116192714.320454-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <87eccksvwn.fsf@bootlin.com>
References: <20261030203342.91172-1-sochnev.v.74@gmail.com> <87eccksvwn.fsf@bootlin.com>
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Miqu=C3=A8l,

I instrumented the SkyHigh SPI-NAND path on a Nokia XG-040G-MD with ktime_get=
_ns() and bounded kernel log messages, without tracing. With INFO messages su=
ppressed on the serial console, 512 page-load waits, 510 program waits and 8 =
erase waits returned READY on both the polled result and the subsequent statu=
s read. The pairs were 0x00/0x00, except for nine 0x10/0x10 read pairs (1=E2=
=80=932 corrected bit-flips according to the SkyHigh driver; STATUS_BUSY clea=
r). I did not capture a READY-to-BUSY transition in these attempts.

For 128 read waits, I also recorded the individual GET_FEATURE transactions: =
each had BUSY (0x01 or 0x11), then READY (0x00 or 0x10), followed by a READY =
confirmation. The poll transactions took 10.80=E2=80=9317.08 us. The interval=
 from completion of the READY poll to the start of confirmation was 6.84=E2=
=80=9311.52 us (median 7.22 us); confirmation took 11.12=E2=80=9315.24 us. On=
e sequence of ktime_get_ns() start/end timestamps in ns was BUSY 0x01 at 3881=
0096120/38810107840, READY 0x00 at 38810158640/38810170520, and confirmation =
0x00 at 38810178320/38810189840. Logging in the poll path adds latency, so th=
ese intervals do not represent uninstrumented timings or exclude a shorter tr=
ansient.

For SPINAND_RESET_INITIAL_DELAY_US, I measured three boots each at 5, 9 and 2=
0 us. The reset wait returned READY 19.68=E2=80=9319.80, 23.56=E2=80=9324.12 =
and 105.76=E2=80=93358.68 us after the reset command, respectively; an additi=
onal status read returned 0x00 each time. At boot, reset runs before the chip=
's quirk flag is assigned. spi_mem_poll_status() uses udelay() below 10 us an=
d usleep_range() at 10 us and above, accounting for the larger and more varia=
ble 20 us result. Increasing the RESET delay changes this wait, but does not =
add a second status sample to the page-read, program or erase waits. Whether =
it addresses the reported events remains unverified.

Thanks,
Vitaliy
