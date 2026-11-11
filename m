Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794394645;
	b=3daL9WvtNwlSCnK1tpkeE/d+Wm5FHpi4SWqXsPblUZrItDkLAHOeq/5YL5dcsmDC1Gv0
	 3kMxnfHsFqoC0EXWh99fSuIHTGwZHpYmVIk8bcotdNNAy6A+69tlovt1S9AkJjjUyGIIf
	 OMxwyC3K642ixsENbKTzNeJ8Mu8ouAwr0r346ZPo0/W2ZbVPLk7Hwmdy7SAdpxp1+DN7M
	 efVTd2FvEQS5oveHdikfPUim2+o/5ia9v5JQ9Q05u/bHDLP0PaG5mUKm9hYGRNY6u/owp
	 RTSibsB6Vr6kDbifr531SSSRzucKIb7NWIb1V8vcSkJvhHg1Zyl4ODQ0K71dE8x5Y1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794394645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
	b=iG/rXyt0xGqMwgBg/zFlU6+uTAmGfkH9ggQjy8r9rU0z4XoZA9H1fr3W8qdUIJm1oeb7
	 WBzt1Gya0nzoOAoxkXnbiAFN5/og7ppaT8fLPOJ+fc3gKItFheAwq84p2teR5tXk66D1f
	 JByuMvCzZDscrxusqWDnfax5HH94WwIimbBPpwBgZbBMRsDQphQeAqG+lxdXA61wknGZs
	 Kho3EDQxa7+4jmZdgZWT1ERDegT1aeOBIkoch943STrfM3XctiWJkOdrkh1FUcKUE5kpT
	 6Xhm8zs4hEYM+S19o+5p7JkbjWWB9Ym5/OiNbQAn2J7PURca2oHhgpYQSoLAvYtmufQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWEcqNGe;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A72606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32A72606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tWEcqNGe
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so5150659c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794394644; x=1794999444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=tWEcqNGetUUFbX9sbTlXI5m4t/N02Am5f+1T4kUl+PmkIpAeb6yQBIxYOWkBVUj56S
         x03CnRFFeZMhUqPhotD3GD97UsBGKlimDkNhf4mSj/1dD6G+pQxOIBKP6YAeD3TZivoy
         ut3p/eru4XvP1prMY0pZE663Q2T0EsgcKi/7I3zOLdm+3bijmp7W71rN9GuSgRJkKRRX
         0hwTdD6OorC+8ggZP84Q5yMvRYbuORXPUUN5b3q9HgwEejwWuAjaqyYh73KKzJrBkI7a
         9OSN5sWQyDPZFJpkvS8UQktpkn5W/e7D5UaZ3kjsl6BzMZOYgcJtIjh3uxqJWqiYnKNA
         541Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794394644; x=1794999444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yKYud9p8+aP8cT7V12zkUbmCop1ErkdHEczU+hWaU/k=;
        b=qCSG21aQRuI+j2NL1PQQNMHrejUzxBKcisjvPsjyqMwe6wBWFuUNVcs1cbvl8IroBK
         p3yHdglnkItArgIWkfk6nj4U/Bh/uK0qU5erdpc37U5c8+SaL+gpDrvZC2NuSwCWlBi2
         Yl42WbDvIEXXJlTot1R5Mx7nzW+ETN6e18ttVbFnjU3QVpU1Zlot6plr9dKd6GVIt4gk
         Um/fzsA0qwKzo9+ynnwv1U/MdtXTs0wcgvY4TwXP9E0OXfEIDwreIa+sF8DZ9XnX5UlH
         amSn5Y7y5t5RIj0nvRm4PdjS/tbQ113xW2R0rRWdEfh0cYnXDaB9J6XJXT6vYNVq/VIw
         h5CQ==
X-Gm-Message-State: APuU4Z9YbAKILzm1VxUCYslvxYFYzDPrnIkk+l9aFtl9YbptlqaeBamp
	22xiGfERv3alCzr0iq4BerkCc5uadFUy2wgI2uqhgRUbS+vJRsww6PCk
X-Gm-Gg: AYBFou1ZDnchyMGdEXahpRDIDIu69SPZbf25W/OvIM/+UtNCa3/K0T2yQ0umfb2UZVY
	M3+RRksWxtg1yQ5UVzJ1rwZbiOqLXn38k+3XWH/BFO/PgXwWMNIaBVHpbBm53+xeeFXWST3xqv4
	QZqM6PNwuTSp7gffYmJGX3m6QirYbbcvVbCQVeoRrNdcKSKCSdMNsBs7t3cFOP2oWiJUiZIt4Me
	ZlARqAJfVFTs3YHgjDNMdPjTif/BJW6R22Y5oW45+KAzcUXvjWXgF7E7fbtcussdsWd85FsWrqY
	rKBORjXrJaAkQI0fAkvnTwXt3ONFHQvDVgb5ojl8t9eaQ5Mjyq0hQOmTyu3H5Fa5R2v/qNArZoe
	ae+oWsfXYctl1ptRG3N/h6q5a6thk/xKYy07r0MbW6tIesZNrWBZm7OAtAlnDFbY5qlQj0zBHeV
	AGkv0ntfKen5HYvThdbWOpCM8krf8hBKvZhZVYVKfDZ/PRl46Q3sfuFG3RSDVgbI+DijtSzMRl1
	W5ArcjLKRqn/qmTlLpYjrx8nWHsLh0FH9EEL2MPhGqwe8qY3LLoJitQ+djmPmBufYGweR1B3dj3
	XOTSfgjyJrCbeoRkmw1m2L/QZ6v767JwUiRm/dDfkAe9ORjSunQ=
X-Received: by 2002:a05:701b:2905:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3c036a32fmr1764521c88.41.1794394644232;
        Wed, 11 Nov 2026 02:57:24 -0800 (PST)
Received: from localhost.localdomain ([103.178.205.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm15261710c88.9.2026.11.11.02.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:57:23 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v5] ALSA: control: Fix parsing of numeric fields
Date: Wed, 11 Nov 2026 10:56:59 +0000
Message-ID: <20261111105659.2557-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <871p8tvv4z.wl-tiwai@suse.de>
References: <871p8tvv4z.wl-tiwai@suse.de>
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

Hi,

Thanks for applying the patch!

Best regards,
Sreeraj
