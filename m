Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794352379;
	b=fIreiYeNKyb/0caqK67HskjP4ztXWgGZm8DOHSrfSuRSVhDn7bltBb8THNQ1FStGjn0Q
	 avAjtpnw8jRsYyBIy3USyH9b+NyU2uxhGR+LusoBK4PyuTECOc4WmZAYr+//QFX9Jj9tM
	 v2NiHf5ArKG14Ew99tKS4Vyh5URAdStWw1e6TiAHTHRsnZBcdaMpEp+eyki3mtnP9mlcW
	 gcIEparExewjg9s17+cMrCTpQnv3PNhO7AL1cJSOB5aoMwSK6fUVTs3lY5z7zKIMFkEyS
	 ILenYVdDTFmBzZwl0U3KZfcKcVpPupavgh27+Fk+Sa6UR5CmN3dv5iueuph08aXp9Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
	b=WQ3Sq2mwLA6do/nrgvHA84kESZpEWiXyB6P1e+XlZXsgXkPdKPRQnsoLCapYCJ11b5Dj
	 pf2jcGQ86DLddJx+TS8+1q3WDzpULSL3J9y0esbvcd1vr6uLCuC/X2Z9h6m/GPhf77n7V
	 g2O/4Gx22v3enhAWnght7iKBg+3p8I6NEEK6UIH3ccacMzBQ2iCcvoK7rLdhS0nZBvTtc
	 FgMTBftNQeWxVbO8vHV1G4cVr8EXOuaMM7b2riRyN8AgzZEuICbm4iw5g4rb4lEgnHcC7
	 +5lK9ta+JGzclSQcPiWA/e3+RkKXwDG4k7WG5gmwaFGTiHHsF+cndfrxwUGAJA+LcMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSjfrMQ6;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:12:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B05F2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSjfrMQ6
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b587591414so3023631a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794352377; x=1794957177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=WSjfrMQ6WZyK/eFatX8b2LNTKZ/XnuxzCh510KuaKVgVgCQn9g9qyj1sJLNK0/RhVv
         7rg9SrKUW3ppElEMW5aDhwR4gzK26wdIpWLzdwAPNx+uNEzX2dn/R/Do4QuHQMpNLnlv
         WWe5nwsK2pz1CZGwC+MZIfomaJ7MNQ1toqS5J1Lx3GrZ8wjNbQm5/sDD1yBjDb1Sz5vx
         8coLj1xbD3T4wOlr9v0QIEF5XtmkY/gaSDsQbWEzi6MUHzeTMgUlsHwc+GQKoag3VaOp
         qBk4jYQ1e2Ap1H2WVEQk3N63dp4pvuYYneOj8c+IlJeZOerqzNVu1vtjC7SVdqqKph10
         X8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794352377; x=1794957177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNeqLz5KhPE320r25YtgufZ8qCYzgA1u0TPgeMKulgo=;
        b=uDLog6YuNb08VQ0kgujfBhvY0sEJE1cAS3mYKwWeY4PftZmsEetF2ppUsK7xqi5Zrr
         vhWxqv5g+ntyQrrjunRDlbGsVrlhtX9hNTWYr7PniJZlf1UZGIaZKxO4GqpUQ04HCIFh
         LBdpH086Wd3v0emIvEGaHCqTXWaJka+rGgUIBjBUIlU5OwNaZDj7A7RM3oQPJpDLz7Np
         menuVll2JKYTqw9WbwrrTXNwaPbRH9lOLz+DJOEjimEb5bin9XvkgmBC+4yegtkOyKEd
         fxa3o5eFy7hs+hCuvo60stYxVI/NTTchBIiL8ycBP0j9xU+maASOSP1TdT7ypJiFlJNU
         +fPw==
X-Forwarded-Encrypted: i=1; AL+hErGRWWYNlmDq2PXReBTrDw1z5hTf+UAI/VWtvewH5Ujtkhd1Pc1C6HwWy4JXUPb/UpDBhBv6wooldiODZfQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9bdPw0NF1GbZzOaK2/nY/14bxB5qFdVrbayQthmv930S27fes8
	3kfBeI02bGQ6uoEiGLA3yetEBf4fzx/cxoywNrGf7pGk4QJZ893EYEl3
X-Gm-Gg: AYBFou2Em3qBm03HA8iGw2QC0yqN6QLL/uyel1/kKqj64/LYQygwPeOijcljAALcg2e
	RNRjO8eAfh7FAix2M1ZyZMgDvvPRYbSJZhUOFhnhqgQDMb3oe/abEQrFhrqyjVmzhaxZ4z8yaj7
	e3jdgsMV3Y45bzZn8kse8v8dRqFjc3wgxex7/dc4XXRA/6QmBI2ooxCQ3ShGTO+pveooi36FzlR
	S6QC81dkdGbHT1dPdN3NDoS/pq9cs7d9oBhWHzsgHoGQ6ypUsS0VTClK14VaLrW1mxS1nKoBB6A
	CJntQf0dMqey20M6g5uJBEvvy6848oiGTYJnSw5978IbeqsTRy77uhzABHXXV2I27BDg4dEvi6U
	B6CJAyjiiHBpNTqrUlp+r3qenI9GSwBUvyeoKBwxKmz/7c3OP4op8rpDhuF7BIHEFjS45A6NF9m
	7V5ZMt1U0tfi4w7qrkkVhX382h3cDKGOk18qaBuRLmnoY4UcQSaWR+h5cEVgFr+c35lSi74Jcom
	++b9Y46txPrNQazFRjOk9aWUHBkMB0RldJcQoZQPExDHfyy3lIKxU0cZJssEq6x22f40fScb8Qb
	o5PaVniIJzcM49vwLwHbDo+YKDwwRYlcJiCB5esvBqQ7Cpa9pEy90E8=
X-Received: by 2002:a05:6402:4506:b0:6b5:7886:c450 with SMTP id 4fb4d7f45d1cf-6b77781b377mr528054a12.40.1794352376981;
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
Received: from localhost.localdomain ([2a13:e746:396c:c600::31b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b75790353asm1750018a12.31.2026.11.10.15.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 15:12:56 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: dev@deq.rocks
Cc: arend.vanspriel@broadcom.com,
	asahi@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	j@jannau.net,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	marcan@marcan.st,
	michael.reeves077@gmail.com,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH 4/4] wifi: brcmfmac: msgbuf: send the flowring delete without waiting for tx status
Date: Wed, 11 Nov 2026 00:12:47 +0100
Message-ID: <20261110231248.206892-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-5-dev@deq.rocks>
References: <20261107154810.89780-5-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 07, 2026 at 15:48 UTC, Andre Eikmeyer wrote:
> The BCM4377 firmware returns the tx status of queued packets only when
> it gets the flowring delete request.

The same happens on a BCM43684 (firmware 17.10.188.75, an access point
with about 15 clients on two radios; this chip also needs patches for
its BCA firmware that I haven't posted yet). In 10.5 hours the wait
timed out 23 times. 2835 frames were still out when their flowring was
deleted, and every one of them was completed later, at most 81 s after
it was posted. No pktid was lost, so the 100 ms wait did not help here
either.

What I can't tell from these numbers is whether a tx status can still
come after the delete response. If it can, it lands on a new ring that
got the same flowid in the meantime and decrements its outstanding_tx,
which also drives brcmf_msgbuf_schedule_txdata(). Do you know how the
firmware orders them? In my tree each tx pktid keeps the generation of
its flowring for that case; I can send it on top of your patch if it
turns out to be needed.

Kordian
