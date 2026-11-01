Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793530742;
	b=NyM0b2NFdqofpq8AydyJ6vFNDTTibvs04jNj+QiWKCeVI5Va5S6OHn2vNpTBQ90i8Hi5
	 0qKdyGtnz9030rFd0fYgqjvrZ/78dniKD0gx6W33TOd1ov7BA/W2i4PaUlGXdxeHCPgyh
	 kiQD6hIHMQrz96ZjnyvWCKGZ2Y4Neq44j37H0T6lH5jiu8SMXta6f9+RfOOJz9CzsmmEt
	 W4L+4yq4e9vYVxK2aphVPrS3PH+KR3lN6svtd9zY7vyal5mosSVHhzQz2TQwgygAaS/M+
	 tEsSF6Msut0O1sSNC1kf4bgSHqB36/FO5C5mD7wndersu3E7RypT+T0WFN8xLiuMFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793530742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bQN46FltKWQa6o9flDUmociVk/15gU/NOC0TSHc8r9I=;
	b=xdHOWNoi8qMchBoJLCDBJ9poeSUXoLwnYBOjQU+jgWsnsuyC5+WvaEGp1KEnYNYndwaB
	 0QkM/43Q3XRWil6Sf33aXyiRG26qeB64iSvp5KG7g8kDgh+JxjOhqBzzx9Atw58VxMaMn
	 SD2VgLRyxqjAFwp757OV5pQFmpvJXRI9GBR4XJPZd8EMQ5pWgc5eRBdFTmkRO2muptB+a
	 0twS0MOPTXPjvW5Iy/N9PnxOH/94vBgmXcsFs86DZxs0GoFIkWjPGCamulupTH6XsEY9H
	 0AID4NjhGkq4hEMG2CUWy/rL0PMl4zhGtV3/FY6Dwlhb+EO+WpYXNeVHyK3/yMDDguA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRsbOQfY;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3620F606A327
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 10:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3620F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GRsbOQfY
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a75f960be3so18836921fa.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 02:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793530740; x=1794135540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQN46FltKWQa6o9flDUmociVk/15gU/NOC0TSHc8r9I=;
        b=GRsbOQfYJo7A5Z1Xd5UZpGyg9bTL7K90xbCH2Kl0QmLd1sYz2CcRW/VYUd5rJ6+2aa
         HsttAg661qFIuD7oJeyDGskDXRtqJxRBe09hlrf2uQGsjjxa76eCYCNFy1Yk/QiVmbub
         y+M+LS4xP5RtuktJBRagx34tumd3eeg3InijKVPJQxEzj8gqCqCM6a2zvQBtYuBdPBrG
         HgxM8Pv3PLG7BzXKmi+GL7iC3Hb7LOtCnRNPDwPBEPccx/UeBekov0wdJtcUaawZ0M/T
         jeUaOrlpVL0c2wdNAOpa3YqjRJn3NnTb11KTZarQP58dfIyboNFnqxIGRQU2Ic+j48IX
         eanw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793530740; x=1794135540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQN46FltKWQa6o9flDUmociVk/15gU/NOC0TSHc8r9I=;
        b=gNoAEYunJvhAHyhLl33NdXWYhkrsgxSu2G5GpJC0U+AcVWtOmdYI3N6mZnKZOQwFJd
         6hqUHPW5vWSMHnyD8YlMKxVilvTibX5tOHxRD2QbMumhuvj6kwTVvhjJzM0xfqTti3v1
         V5tvPzLSeWoKr4yrMhJ/7LxyvhGFpg8v05khW54H+E93yv5FmR4YnVZvMT74v19LpphV
         xFsJlJvoNocxR1muK30ppZomSSrcPiZRbQ2Km6Z9zevm5r3bpWnnHS3neKVR4ffVO0Td
         y2O15BQFUs56qz8ycCeED6yxTH+yesf5uBdIRDJN2CGU2NrCTuSESpz9pUTV+0j+Y+iI
         Csgw==
X-Forwarded-Encrypted: i=1; AKwUvBxj+Jz5MEc+20KRoENzqvYff8wc2+uEpGrnYfOnZCckBbpZ60784XjXN7vnqlkuFh6LZBWlILR108HrWpU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSgUeBKJU4T1aSg2Ke5E+FFpPj8whhRznB3AwSxHXonAX+mJiI
	1e2YiG/rqM2LvR04PPA04XGJcA6jil1O81nIIJIuyU4vy7oh2uKOLrC3
X-Gm-Gg: AYBFou2UwWEzmyPy6hf8Gk4DLRVqIrGs1Ot1Xz45EVaxC2GkjnGriP9RPdptAWDTND1
	o2HGH/2eKZQwy0jTN/aStqMwdpInrSMwCEEo8JjXSCJxSKWRehMCpi03KfxIfsjSsZMG+DU02ib
	Q4EpdT1M8RuWmqALrFFYSUjw45oyLgUlGz9FWsBlaHtkK2rsXe2AczDUe/5Kx+0PEDXkNt0N1e+
	Yz6uhHOGNZM0G5SocZGpfeFY5TEAaFbdHTLK9mMkXwMxkDteU2dRfthwSBUPCSGQpTulu7InANr
	iB16hLmAJYizYvNOS/0fVk2k+g/UlkWzeRrJ8Cw5XkS+MJ3vxzEfF9jgPdXFYNfpQ6fJ92j/NWJ
	Qy5LmXIP/JcOZjmW6nJeMDgDjFTVCoH/+09FBTnqyztW6zfU8GDBYz/GNP05KQ9rUdfQ3Wx6+lb
	BQ2NJmwkK8r8no82g6rjbUWX0PiTnwRUMxSY3HGVHIvSyixwLsKf79oSuUVB19Q8mXp9jrtJjjm
	AMNb6T3Tr2rwi66g0zsGTd8wyrpCXcgb9AA+vfRme7wexkku5YdDQuSQnXLFYJqnfoU4PbOmgFV
	Vt8m2zEi8V0s0tKVa8jcxJyogwvPZKlUScPlZ9FB3kxhozKCw+qavynFaqJcati3rAgt+7oAnkr
	xj/xPQrXBvb66L2ldhxKASk3Lk6yyknc4HPl/4Q==
X-Received: by 2002:a2e:b896:0:b0:3ab:f43:a3ca with SMTP id 38308e7fff4ca-3acb7a80dcbmr16287441fa.16.1793530740401;
        Sun, 01 Nov 2026 02:59:00 -0800 (PST)
Received: from yantra.. (nekmmqtbv463r5fvgny-1.v6.elisa-laajakaista.fi. [2001:99a:d7d:c300:5462:a993:5223:791e])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acbb80953csm12768841fa.0.2026.11.01.02.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 02:58:59 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: jic23@kernel.org
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: Re: [PATCH 2/3] iio: pressure: dps310: reset the chip at probe
Date: Sun,  1 Nov 2026 12:58:55 +0200
Message-ID: <20261101105855.55716-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101010444.2803dab4@jic23-hlaptop>
References: <20261029220635.18816-1-zoone.rupert@gmail.com> <20261029220635.18816-3-zoone.rupert@gmail.com> <20261101010444.2803dab4@jic23-hlaptop>
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

On Sun, 01 Nov 2026 01:04:44 +0000
Jonathan Cameron <jic23@kernel.org> wrote:

> > Reset the chip first, as remove already does.
> Why do we do it in remove?  Does it put it in a power saving mode
> or similar? It's fairly unusual to bother resetting in that path
> given as you've seen here, we pretty much have to reset in probe.

Yes, in effect. Driver leaves the chip measuring in background mode,
and soft reset returns it to standby (datasheet 4.1). It came with the
original driver without a stated reason.

Writing 0 to MEAS_CTRL would also stop it, if you'd rather not reset
there.

Rupesh
