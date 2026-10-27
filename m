Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084059;
	b=AUaquUlFq1cyr/z4CCxK42ZLx5/dgG4NSc4ur2B0DeTMFxKPOhybteW1w0T03v4RQJ8a
	 nZdRAK2QrsC3ZG8Tkk1kFa/K6SDmzA2BMN7ivh3uUDl1qIyOfeWwG9IT1Hjso+/c6ovJ1
	 S2eWXb7dxi95Ntlok0MHurlpQuMcxwAQnNU7b+C127/U7mjF88u3m8dKk6I7McGJx39WX
	 A7dD2AbbY56fb+n7mbuzy0evy40cEQfH2lXV043K6BYwFqIAH1HXEGpNQlqxmkrgHurdw
	 3j/mHYIbhCctzqA8freh8kViPSWmat5DpW6vU7J97JZrkT7qwxv9E8hK7mnRn2P4icw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Bzi/nzvXhzox11rm3/brp68+yJUnNUbuR0aBy7BPR1M=;
	b=ToiIvXxxXwlBAhAJK41wiFRmYTNYCoCaoVsB7CYi9Q13NNnYhrdlqXUN1NTrfQGV+/0d
	 CHZTyVVVRHAwBPpUhMJnjdcApOzmABZnptbzV3xggE985xfM0tRyM73XQILC72U8YGyCU
	 VBmoI40+PXqdRfly69jQX9zfXSNcpYgbUjOKzvSjx69VXe+ojix7tnp23LfZMSR2Ti6G0
	 No/sJ9QPqMrJy+I7ME2ya1twGJ/2eZCS0ZUNz9w+e/2CrjRhpsHVaU2QwJ4SXD34OPbsn
	 KMVMPo+qLSvHUtJCaN+0v7S8fmUBbJJJZT8CLPp5E0ot73o9eiqm3/2s07QD5rZ3gWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdTkeEtL;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD3606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 06:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BDD3606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdTkeEtL
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so19179645e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084056; x=1793688856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bzi/nzvXhzox11rm3/brp68+yJUnNUbuR0aBy7BPR1M=;
        b=YdTkeEtLL8Y1nyxDjIKjLsf/YxluDeSEZ5d6kdlAWCIbzAlWEKnDbytZuv/smLkWBi
         xNi9V99FLlNwMWaPKaN+Gntqh2AawHuOMDUnL1YicLxV5ve2whO8abtEnPdq+lF6j/MG
         dNa3HV+fWdTQJupDLPJ0yiKrgH4PV2pVmDQwAMyCvIw+AiiSQLzPSN/YUfBlx/yhJrhM
         duKxU9864eJda80HVDcv2dHBVskc4qsLEqF5TQIKV6gfdxzCQ+9EkInOoaw+hUxHb6vL
         RPAiWNu24DYqNRcxYRzUv7/sDz7AN89CrKUFjqQqNzANUD7P7QaACJ+I5jTdhifdLkA+
         kxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084056; x=1793688856;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bzi/nzvXhzox11rm3/brp68+yJUnNUbuR0aBy7BPR1M=;
        b=kW8M67CPaR3hsrrNHRtovZ+1RF8/gBsgjg7QarxJ7rSHyZjp/3DEC5iErUIb8fz6uC
         02tbODUq4kdt8Mjh5L0gNh5AYgSHgOuuy2/ILvTVBhycOsTsRVyJQwjil9iznhfl0HKZ
         RMdy5FymkUrY9I723LfFAf3FRYIy22drWJL+p/E1SI9NbO04jiLSpf7HC9t+5lEbjQOc
         Fd/e7zDaqjdaLoBV+PgWZbkx2kcGS8RFtqYiD0ocCJQaTdca73rHhv/X+wLNwZ1h6Uyx
         DkatCSYbYPDC8xLGOXUeckkXSvjaaoghzyZPwomfNZ5hoHIGUSpbt+U23ffCYTxTSzIo
         JJgQ==
X-Forwarded-Encrypted: i=1; AKwUvBywLBWlofausPJnoHjK1a24baIHSW6W1dc5Rem7VyNNvR8l1GS1dCRQGKvDeuKQr43b0JOhI3mxhOmWUNk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi29ij0rfJ/g3JlW/kSTWjehUuDzMN9J22wcR+Q0ZxKQm2kFGp
	oQP3sEmflvKOjjntfSjqP35oHw5bqhzIwPNDysVbuu4fO1G8QPaN9QO9
X-Gm-Gg: AYBFou2av13XHRaiMxwkuQDtvPTYehC7Gx4mFpNPr/JLgudyWhcwe1I4yNbZH447T/K
	EFXWjjV0/FOMCufbr7fclYEzwEfyj4uDhpYubyoVud7fAiEHXfjXL/vf+Z3jdFXT05rkQzxm21i
	gdQ+DtzmZv3uI4nhLicbKNXGy+rU+cUKpMUuQx/isd2hVywI1myPxJw1Xx6sU4vdslFZf1OaGgo
	u02j78y56yPjiVrpQYOgZbagimsxq/r+cqn+O3xhTeIDnvp+m3LP/ksq/nHV4m2R0Az/ZwSV+D2
	DwjLzeDSKdvKZtT5jZRASuaWHNps6oteCnO/q+KKOtsq5oOqeOCk3mDy99qpjrCf4xcNSYyF3je
	vv81iQruYGcsklGziMe0Aa2UzXSpZnM20N80cuJcoha+m/fVK8ppEWxcchIh209PxlrcFkgg9Td
	Hy1ueEeQbdnlBYWp1RwauSO0sCK494rs2H0mSaT9PzCm+GEYT1uQGlZhvJr8mF1mZTnGH0jiqWm
	3DXkCHaBOXtL6tvib6ReBjRP0HsjlCBLy8nEsOscoLbUYOml5Yt1ADFjhEH5JG7NcsHQBXusOxD
	t9HcKF8qZSrDTHV+LHjAikBc92MOE/Ym/bzxYjBKVEsVsKZLSd4eNhjjwcxc60W0qSZIWvSCqqD
	IBwo8wyzdyNWsG33k4T3sHFs4EHi4jTRQRMmYtQdbUSZZ5q1ufp30ORwI+nWBHPmgWLX2+MY8wM
	eJ6RH4
X-Received: by 2002:a05:600c:4f0f:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a35ac803e2mr199062215e9.10.1793084056219;
        Mon, 26 Oct 2026 23:54:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm26916356f8f.49.2026.10.26.23.54.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:54:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] pwm: tegra: Fix value discarding for duty and period
Date: Tue, 27 Oct 2026 07:54:03 +0100
Message-Id: <20261027065403.96505-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020133938.191013-2-u.kleine-koenig@baylibre.com>
References: <20261020133938.191013-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 03:39:38PM +0200, Uwe Kleine-König wrote:
> Compared to (implicit) v1
> (https://lore.kernel.org/linux-pwm/20261015085336.4181137-2-u.kleine-koenig@baylibre.com):
> this adds more adaptions to handle the bigger variable types, as found
> by both Sashiko and Mikko. I didn't think a lot about the
> required_clk_rate calculations, but I guess the saturating math I
> implemented should be fine.

Tested on Jetson Nano (Tegra210, 7000a000.pwm channel 0, PWM_CSR_0 at
0x7000a000) on v7.3-rc2 (5b0764a53235), starting from period = 10000,
duty_cycle = 5000, enable = 1 (PWM_CSR_0 = 0x8080003e):

- Unpatched: writing period = 4294987776 (0x100005000) succeeds and
  truncates period_ns to 0x5000 (20480 ns), programming PWM_CSR_0 to
  0x80fa001f. Setting period = 2415919104 (0x90000000) and duty_cycle =
  2147483648 (0x80000000) casts duty_ns to a negative int and programs
  PWM_CSR_0 to 0x999a001f.
- With v2 applied: both out-of-range writes fail with -EINVAL and
  PWM_CSR_0 stays 0x8080003e.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
