Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344535;
	b=MUtUjhquQ7PUzz67NGot/3pim/ssfXke+JeWAxDllrTf4XRz2FG2gvs86nadqsgA1kYG
	 nGUsUWVo4sh1P2vR542LIKS7IcQJ/f35lnmDbj6ilrcxO1C5r/+3FrTBzYHgzT8QA3hJ/
	 YjUrQgc9hRw6q0vVV8AqQW4ccJaLJlzb4cUhjqgLI0vFxw1IM3+JL+y599uv+ndv9VDum
	 urlgIiNqFJQgdUSvTGMmNQyWGoZ+g6lVG9K2KNKu9cpvVx+RmqYeqsJ/maJrYbr27xYSM
	 u52hjQMY/fCR0s/ug45afqr0DJmV8Mt4y7WYwG/9k9myVNo1NbdyA2y5SN83unL/SdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344535;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LyTvhcJtY/hqbJYI4KH/+07DZKBe5dmpcgqrAQPdyX8=;
	b=aAhHaYcBfZZkgn+pBavKYcZDrzkyBHAe2nua4UUgm68BXRYDw1CLj/fdHkYGtECEG9ci
	 W7gW9QDmf2E+jq4vw+6e41tCsINT+WnCSpKyPNIqgy0qNoGfdHS2yBV1HD2T5XetA9IHi
	 sIAinG4IvBuATBRrhuHSP6q3c6y9cCJxAN5TRfoxJCp/otCyNA4XLAhwsA/FxM2IGtLY3
	 KYcyQgIryVbO9a2qVm6K4koIikEn4KkfgtJNE6rKIbV4ZmhcP26mdYuY3PVPfX2Rgp01w
	 8ODFlrZrhuL997ctHNYSuzGvzPTx0VlSrwZ2JhOkoco6YUMq9XxyRsCix3VoMfToZnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=onEK5Wp+;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34AE606A334
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34AE606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=onEK5Wp+
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso4702957eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344534; x=1794949334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LyTvhcJtY/hqbJYI4KH/+07DZKBe5dmpcgqrAQPdyX8=;
        b=onEK5Wp+5b7JsC6nGEK1Dz3jr7ngICTy3rNhYCUe/zLLW1Jvm0VZ7AwukO7vfo7WvH
         bCyWkTK+JU4z/srxFjttLg48PSpQCDzdmWFv6Y87SCepGLkbu2QJXm7Dzw676wiISiWc
         FojYGowDEYHLVTEupTaUd5xwCOOlBMA3Y26FCyUdgZ+m+UuuCD06hRxr4CmUjkOgaUX9
         +Pxq+8z9Q5ZInwBmaZBw4HwO4FeIrsUqncykloG+7aR1T4pYMzbZ+VY/R7pmWjl1JEwJ
         cXPOV7Qcu2HgdVgntiG+P9GUpZ1OGQ7aknTCtiYR11N4qMSy+J1vVOTFq+R78vqTQWKf
         hVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344534; x=1794949334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LyTvhcJtY/hqbJYI4KH/+07DZKBe5dmpcgqrAQPdyX8=;
        b=gs5R784lh2KTJFUhI4hVizNSua+UMTlmsVJ8FlFt/4o/1GIDFmzd5WQJcBl9h8e8VY
         0j4+kWcto4R7RYIV6aLzFHUp5O0msDrNOKAkjiidr/n4xabQ9+fr1eS73HlY66o9tNJJ
         y3577rOMTfDbB2gPJDKac1ZfLYBR6qRiyvuMIxFc9siJd/egyU9+7YxhuINLq/Oj84aJ
         8GS3Eb8cJcvjtOw+Cqe2t8TmHYoByhDGglWryDRhiOBVmV/Lh+S8OjdMNs7OMEsa2qpv
         dh7dpz87/dwjUPztypFd9achS5CyqRlNsVgby6qEWZV3irUF00ZFW2ABfxU4YUJsPt//
         Xs0w==
X-Forwarded-Encrypted: i=1; AL+hErGaFnd8TWNXdIDDCOBjcxa/jrYYbmtsazrlA4byjzezAQ34/r9nPrpc4sTGPrAbDQ/dOqArro1rTbcL/dE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8AGIqHJH8RIRxRIbRUygOxNbEJud2fIS3zSn775UG+WrjgiCxT
	bpHHLpY/01Gnznk4KaThjfqvubt/OSTDzjrRo4sJ5ubyJKLvuOPEGBKQQPd4JsqJTGk=
X-Gm-Gg: AYBFou2BiaXgg5wi/9M53DOwsUS3X1g3HfSum1X7dbQGO+0RkWnAK9os1omRqA4jBQq
	krvSvbhoP1fsdhDY4RztdVeMODzuZtcn3ntLFkZOry/J08+Fx/V3kqjze+3d1WmktrqETgu69qT
	sWohh9rSj2D4qRLoxpE8YGzKiexoR/VCwSoCPuOcE6zdmBKg+4UA+Uw8w7hOu6DKu8uOe0ZfrrY
	RwPe9y+khS6evOFgEzrfnOogXvgRIu44VsWP23SCeodSdjBfYzo0GCraCEX9TXMFefQTvURSvS/
	lxx3coOl5VoQpjGykR6eAe3kbcvAobu0iO++habCO2KAHMkmo6mjSAalgmFFLk4ZoXdXYQhK0sa
	6+0Z/xBNdX/aIrG1fq+/c9VRDfI8UhAFC/GdzO02gzGsik+zVmtkSwQDOyO0XpSf4ifuakcatTm
	S4nkv+jDdjpFwbBSpptGvjIqXlkt71+FNdZaqQ7GslV1Ekb4v5RvwpENPtNBwYnaHlrrG+xFk8W
	anawSQnPpdBxx1amr8K8B/BkZ2gLC7JeoMOSTtAl9lvJ+T92PJ1NhzYbFsVz2G3bIF7o5lfftOz
	sVT6SgR14V3oRLH4avODU4MqDJcPbgc7y6dynaVZeSzRFNjTPK7cxR5ERmnYJgo5sMMoYcE=
X-Received: by 2002:a05:7022:b052:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1b3c032fc24mr87106c88.30.1794344533792;
        Tue, 10 Nov 2026 13:02:13 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4ecccsm7919469c88.13.2026.11.10.13.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:02:13 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH net v6 0/6] amt: relay tunnel lifetime, validation and request-path hardening
Date: Tue, 10 Nov 2026 21:02:01 +0000
Message-ID: <20261110210211.110139-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107004935.2627329-1-omar@blockcast.net>
References: <20261107004935.2627329-1-omar@blockcast.net>
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

Please drop v6. Patch 2/6 still lets deleted groups pile up on the GC
list without bound between periodic runs, the parked-group pinning
Sashiko found in v5 1/5 (now v6 2/6). 6/6 also needs its per-source cap
derived from max_tunnels and its changelog to state the MAC expiry,
replay window and key seeding changes, and 1/6-3/6 need corrected or
added Fixes tags. v7 follows.

pw-bot: cr
