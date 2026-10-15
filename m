Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1448E466AEF
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 23:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106552; cv=none; b=UitxmskGoogwosT8xFQEJ114whclxt51jbn4+XWhiAn9OuN3YQPhKB2DXBhTn0eg8PEXOQYFZchopqn6k9rmClgvEb2mgNMWHgdZzhdF3ueVz2eDhZHXCdFbb8PY3Rya1a7We62u5fGd16wrSGKTKgvluTqDbMkbhZ5JQjH9n4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106552; c=relaxed/simple;
	bh=flgSKC6pMf++7DJb38js+MGdU3o8QmC+4FmYXdajCnI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMTHv4eGhX7ZpRSLyH8FgFZTd0KIQqRgMTvEhdeYDGn1+utprbC544/pFoVt2oBD0sE9NpFoLWOqLGDcUlOA3QiS7IebGGCdLOKM4BTNv8gpUqoGCdaAAwKirvggPwGeoZDjMCgIPcRqxsDkcJaTW5JqUfOaE/vtvywLnL8/sI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=hIGpUcGq; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="hIGpUcGq"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so3782509c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792106550; x=1792711350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flgSKC6pMf++7DJb38js+MGdU3o8QmC+4FmYXdajCnI=;
        b=hIGpUcGqQ7Uo/Xo7U5LZkCBLYyOBhPl2ndaSzcuNGrQm+qYkjXEFnsibtvYjSBE1uQ
         4qUaGkMtKUOjQCVKZWIDQ3Jd/58EjObsJwqwwyxaLeYXJOuu24eeqbLEq219RZdhohzN
         kNlTDgmp5xL8iiWb2fKJwdkh6R/6x804jfwYw9hO/PxbS4IhxCGdHhE3dVTa377nLzac
         lfR/DG7r4HNSigLe52/TqRxRdvc/QFA5rOiE5CzIaRSqXpUtOm2GqAa4EYSdb692yX/o
         2/DYQ8uAMpXVzST8HoP1yBpHsMjYsAl8Nt8EdH17RfZfWxFzBKEPrqKQ2T/tMZPyizcJ
         WIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792106550; x=1792711350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flgSKC6pMf++7DJb38js+MGdU3o8QmC+4FmYXdajCnI=;
        b=p8tE6Xp/T9dZa2UEl5Eoeui0ep42cOZfWB4/HjEXdvUMzMxM/kG7xRmUAT8eDYC8iF
         iob/RhIsh+S5o/dtDBrh2NcX5+YVMdVepYv0SvUsSFM+apwxyhuKLjWre7aBumQyVBdJ
         9OH6ZgEDagkztyNx1AWAAiKB8C8svURQPStJiqmm7wp84sAfhnvk8O38XyH49QAOsCsp
         CIMYV70vZuDuBhqLeUMEMTWx7W34RT7VNwH4GhEZokCoKsWf4Hlja2pWVAV2J4EaSCOe
         m9icJLJCsoFWsHi5z8HAyLnpV0Lixn1plDdNBibF4/FeCxFo+yQY7uXYF9fc8RqrlVhF
         AR8w==
X-Forwarded-Encrypted: i=1; AKwUvBz1i7A9RrhgyaMRU2YPabKGQ2E37zHHRJ7CXFbcqaajR0mpX5ld23o7VE+r+oKw8GpCzMQK1F5KhaTwTmM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwltNA3CQjIysj7sxZgElT1L7yekIfHK6f/rmXywnwP6aRAkq0
	kkzUCWcO0NK8fTorjgWPsf345IdXuzrYpM8iChymnpIfj35155oqEiuelQlMKG+LyfScTEDz2S5
	rMbWRq7TzrfiyoyU=
X-Gm-Gg: AYBFou1jskknXEY/svkoMVpnOktSC5UF1wiWuLc3Th53tPS/bOsKEMTcEpY1tUCeGfF
	vcvijf5VzJR9wHXI1V2KT91Px0T24q7liEXFwWOX5ny77S7V6hKUv4kcobCyF5OEAQss8Q+VdD2
	QhAJlbff3Pq7XYdxnmdZKwZiX9YT1tJUFE2k3e13HcdVht/8ediu1h7SmqeE6USsGjUA+XRQbSw
	wmwC3i5pEAyewgJsnXVo97YkuUxB8Hxg43K/Z6ChpfbUBntmlyBTjt6c1jlP6eKZZrgIWIpbs4T
	8BHPtoJBCqJcT65JV5NpKvcarXrfL9t9wbAtJPmv7iS8MmfvOxaDYphALEt7CsWXdjXoovI9OVG
	7SM8/I74bYUF6JUQe3tguJOSrBeB9oJYN+zZAdSeIR6Fu5ziGndJYKdBQ6ZsKTllFVVQi/KMu3d
	W1/OG25N4dViRqjS+SOOQgYp7w43keiKKlpsIVXiz2BrwH+eUDX11AJqSOyzsGcZvoXdLaiAo0v
	4Bw4GtV2qXlzPi920qN6njgybkpQfdzxPy2JEQ8Tcw9MQrhrp0=
X-Received: by 2002:a05:701b:2810:b0:14c:d8d9:9502 with SMTP id a92af1059eb24-16a5e49fe06mr29600227c88.14.1792106550027;
        Thu, 15 Oct 2026 16:22:30 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm619618c88.20.2026.10.15.16.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 16:22:28 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net v4 0/5] amt: relay tunnel lifetime, validation and request-path hardening
Date: Thu, 15 Oct 2026 23:22:26 +0000
Message-ID: <20261015232227.2929175-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013175407.947606-1-omar@blockcast.net>
References: <20261013175407.947606-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. These comments are against the v3 series; v4 has
addressed the review issues introduced or exposed at those bisect points.

The Update path now takes tunnel->lock and checks READ_ONCE(tunnel->dead)
before either the IGMP or MLD report handler. Both tunnel freers set dead
before clearing groups, so an Update that acquires the lock after teardown
starts cannot add a group or arm its group_timer. An Update that acquires the
lock first is covered by the same lock ordering: teardown waits for the
handler before clearing the group list.

amt_dev_stop() no longer uses list_splice_init(). It marks all tunnels dead,
then removes one tunnel at a time with list_del_rcu() while holding amt->lock,
and performs cancel_delayed_work_sync(), group clearing, and kfree_rcu()
outside the lock. Every lockless reader therefore keeps the real list head as
its terminator, and the post-stop get_or_create() path also rejects creation
when !netif_running(amt->dev).

The Request-only lifetime issue is removed by v4's final patch. Requests are
stateless and do not allocate tunnel entries; tunnel state is created only
after a Membership Update authenticates. last_seen therefore describes a
valid Update again, and the global and per-source limits cannot be consumed
by unauthenticated Requests.

The group and source timer workers now hold RCU while finding their owners
and take tunnel->lock before checking dead state. A worker that races with
teardown exits safely; the group worker also releases the device reference
that its timer owns. This closes the callback lifetime and double-removal
races raised in the review.

pw-bot: cr
