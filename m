Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760990;
	b=QotN10S50JVN8qAJpWHEKjR6hDA4OSFB/mN2h4d6vYklVox5SCwAC8J6aMMXjIvvZ/oc
	 Ky7lzgHt26PLUqOM4uaaxfiRCdHiyYbMZlMKHOurG1b7ENuavNY0udTI0rV00OViBhxEn
	 KiwwIgdBG4BOzgmUfIOC7Yrk9Y5Ep5GCGR3NuKAAB5u0cqhPbYDxKi3Nm4PCWSfIc8eNc
	 PCGRJ1jz9SU8Hu70dKCGOfi+tRzxRBxQCLZnb0m1s9BVCehu2bzq2lEEJE+OqDCxZZzWU
	 0rW9uAjctL+89rG12+t0zLCnGVbT7AKaFAJ7PlfflX//cwbplTcL5hGocOkv1/rtNzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Content-Transfer-Encoding:From:Mime-Version:Subject:Date:
	 Message-Id:References:Cc:In-Reply-To:To:X-Mailer;
	bh=5TstXJPrDePm/oZp1iHWoslySj6snE3j87RkioJk/dU=;
	b=OLNbOsLtpUZef1Wc9oGAAwK5cFhdu3S26wcHUkF5kyzhuzfp5O3la7dvL2/5jhrC/rc3
	 6vVSR326livIoNKtjW0HjdR7zlF7JaDiqDEI7d4YTVHZXbEJ5dsrBZKz3fnRk+223GAbt
	 nHzpBie8dx+92Gu2W+TELvZZ6qgElgnc1tmC5MoIRxXYPKn+zuLxULGxIEBqFPUA86yZA
	 lbuNuYbSkFvuWl9BcfI+WC+qe98RLPpAb0fvereRpkbf7G2b//kOlr5tmj9ASJ8GdASZm
	 335ThHf/PocUhmqK7GiWYEkdI9ZUJC7mZWsVAaaL/AqS8o20eAmGS1xvwpKKuW7geqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XmP2HE+x;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147E0606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 147E0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=XmP2HE+x
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-37f14feca60so305768eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794760988; x=1795365788; darn=vger.kernel.org;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5TstXJPrDePm/oZp1iHWoslySj6snE3j87RkioJk/dU=;
        b=XmP2HE+xtJUA+X7Df8vk9lur7AUkt4CHsLiCcwxm3jS56RYZhsjvMMB0xIXgg2vc7v
         AVuqCTcZdm8hS3DD2zVWaDQdkqRvTuRZ6itEzJ8t/yFCUQGJUr0i08HuWk73Ov8RFVKe
         LPQ9Gndp+f8zd/4AN9DmmQZHt3XKWHGaDiv1GX3TTQ4J7zs2rfkvuxdRMcNoH43hw0z/
         lJngHAPSLYXSrp03kPq7kOp1OM1HxagaltXI/zcoci6BQmVDPzroPAJD8wwgssMnGSKc
         uoQ81eAmViuk2Y1QM21u0aEFs9/LiLL4VjrM8BWN9rYHEmSsF+hRjj1ji7RG9dNUvB3d
         Z5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760988; x=1795365788;
        h=to:in-reply-to:cc:references:message-id:date:subject:mime-version
         :from:content-transfer-encoding:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5TstXJPrDePm/oZp1iHWoslySj6snE3j87RkioJk/dU=;
        b=Fx+ObVGnfT28SpTNZWiLM9BUFQX0cjk2Yyhj03aKHXkN5JnGqyO6pJxRGOdxdnLsOQ
         unOSlKcZwwwZGsnmvAc3MavjFQHSawuX/u2lTz6obMAtJQGUL/BwZdcB4u/7n/O8n0WD
         rw7g3jTK4jG1JyhU1dN2jNOf49Naoo508DmnnzMqyrEh80yAlTtHH3qY0S/04PIEP8Bp
         ebMCIFCnnzZiEuBFEZy6/CnGXSVv1WLz0hBMf6IDIjRY9+XU20qVuVMjhVafcdmpj3XT
         YFTMubb59v6m9HrLum8wnNWgfL7rE6KNrIj6fN8jt6gnOmDVKm1MMY23ON9CRokbeb8w
         hjMQ==
X-Forwarded-Encrypted: i=1; AL+hErHy3/72btqiz8nHpASKMEuMjM23XtKCP0iyvFZWDNAVB6pesQfFKMGoNqox6QfEa6MJJzUwJ2vgBclVDe8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+YP+AK0SxKBMCRyF+mxei63rlT5V6pFhchP4vv6gulJJWCV0ws
	4lW5kqnXJsC0UY8enCLshm0AbdsFSkVbIdf6s6RHWlMQrh6a2fx/BeKauRV18dCzYwyE2j1wFkQ
	hv9kyO+o=
X-Gm-Gg: AYBFou3cCnVsnK7mgnsynYcQTdGLmP9FVQywWJTWRie3KB5AA1UUZatfiT7Koo45Qh6
	nJoKrKjDkDZu2nqSCvHkUD13kgeFS+SaK9HkY9ftAJDkL8UyTByQ8agzgm/ilRvbXWGtTACdo4f
	O5iGbGneJ7L+7PJnsW/62fuxvpQXIiy1h/IrtFrx2Jnw+brcFJeHhcpCdgOGBdM46xpTfubBu2P
	dEbB5OBQZzvfcA+L3l0EOuSXX4Zah3uynNXGP7PcuxEJt3Et424md6hOXOBt7+hiBh48I9CSEqi
	6htGNtAdhvnRryajvkZWVBvbkh8DdzCmHk7fSkzRNWziwL5oJboIGizAl2nlpEZRvTC1BSLR3uU
	j0FHlHrtVO4HDpJ2mA8BAKNsM+A8KlrM3hYkwDdbdTopJvDlXcraGBtP34TlrxdvnEG8qVqxWRz
	y/Zb5ZwY/PsFOuMbooQNziK7AlGN3MRRggobJG6gllLyYdBj2Er+M9rhvVaNyqPu3PApkLPivl+
	vT6Ff3lPXcFwifNoMdrKt6qkMMz7EQiZlGutv2u3Wfu2Z1sZkM+8lZIaSxRh6/LQvYDVMERbd1g
	MSRZ+T1Odqk4b6hlf+LtQE0HWvmJlY9qatbu1Z+DRGgzB6JKhpm/Kb798Cwmac/aZRA3VnoHV4W
	QZNGRGUYQHgOT0IQ5CRDdPfBeMLBp
X-Received: by 2002:a05:693c:4019:b0:35f:2858:aa4b with SMTP id 5a478bee46e88-379675fc9ebmr7514367eec.30.1794760988058;
        Sun, 15 Nov 2026 08:43:08 -0800 (PST)
Received: from smtpclient.apple ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm26571819eec.13.2026.11.15.08.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:43:06 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Jens Axboe <axboe@kernel.dk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [BUG] io_uring/timeout: multishot timeout rearms during cancel drain
Date: Sun, 15 Nov 2026 09:42:55 -0700
Message-Id: <2B793643-3C34-4AE9-8473-1E6ADFE55F89@kernel.dk>
References: <20261115163547.225149-1-teel4res@gmail.com>
Cc: io-uring@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261115163547.225149-1-teel4res@gmail.com>
To: Cheng Yongkang <teel4res@gmail.com>
X-Mailer: iPhone Mail (24B156)

On Nov 15, 2026, at 9:35=E2=80=AFAM, Cheng Yongkang <teel4res@gmail.com> wro=
te:
>=20
> =EF=BB=BFHi Jens,
>=20
> I hit a corner case in io_timeout_complete(). It only shows up when
> userspace sets the CQ head to a bogus value, so it may not be worth
> fixing. I am reporting it in case you want the check.

For this and the other one, please send an actual patch. You already did the=
 work.=20

=E2=80=94=20
Jens Axboe

