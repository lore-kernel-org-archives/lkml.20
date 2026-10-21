Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573690;
	b=uDwIEJoPg6stc4BsQRZAW4Ed0wdAZDGdVS8l4KRWPTV+JSMu3esRzKXUyVU6OnSRM7wp
	 NozDciDZzUhZ4Yned63qkYhJ2IA/oltDxhh7QL8y9Y12RvHmMI17+Br939d91IIagahjF
	 6e2eMn1tPhyeLikRNciNPGxSmL2d1CRQtvX4TqkaJj6dnj6vxhe5sHv9SAvJw8oKKCyTG
	 a26BRpMM8pEpOe/g89M3JTMKKDPVoTJc+TtwZsp0efo32EI4lL8/4Kp5VcfiKquIDfJeX
	 Xr+3XT5s37YsJ5hVRwIWdzwkqVsruCsTR7tnJ2Gq+25PEXfgRMnhd+d0De25TTRWf1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G+YdeE2DDW/sG/hZRTEma68Ws9O1RV/eZD4NKv++fSE=;
	b=r1WICVKcIlsdSzMtgKfHzb/OLa1jL9JcMlSx/r1Xfjs3PhIRKTW3nNb+om2NXMVcEB1J
	 BxzcB6vnDAWn2id8fFAHbc2CuAG55jZYA/lV46SZfgLz6xJnTvNdRQd11RY2Rz9b6hAFD
	 Gq2y0kOtOk8MRisGQgA9Mc4IDg/8+KswACx9iQQSH64o6G7S8buvgsALYCLRDGAh/FxxC
	 HCtA+/9Zn5FJkXzlQqop2MxY8OMpZQM6vfS5RLlaI5M8scsf+I3PlacU/uEL4etnSDh7F
	 1TLb4eWJ4gMOgwqEGI6+qbGRgTb18myLIrXoLJrL9VGNYPgqJDHNkixg6ahr9WJ31xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X8jdiDtV;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50ECF606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50ECF606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X8jdiDtV
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso3746265e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792573689; x=1793178489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G+YdeE2DDW/sG/hZRTEma68Ws9O1RV/eZD4NKv++fSE=;
        b=X8jdiDtVWw7z1fXMCdPITt4sppvby/X8rOwKYiGl9SwuRJ7t3xACyq4L8Y2Yqupjys
         jBzWwYdCAJhQvL8EvMt0udi3cqtRdx2zddI30f3048qq4l9yLm56nfbTkTxZzMY64Qub
         zNilY/8hryW7gJdSCUNQByUKN5SI15AiH3porNbvtoWbmns1eblE9E6/pzzP9E24iWH3
         UD3/IvIwl8TAUGLMrNqAzdAY3GXuKtxRmtvSPWXzBeDQVI39hi7zauHx1d5fUqQuetkm
         UCA9Xo/k3mcZPf5guX7OB+cVPbjvnlEtC4HgP4p1LR1Z2XcMttYI6DKl1O3rnxspMNnR
         vMQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792573689; x=1793178489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+YdeE2DDW/sG/hZRTEma68Ws9O1RV/eZD4NKv++fSE=;
        b=rWpFQdTwX/+FVwdTr7L1ABBBIBi346pHnraMBi+HA7P8YKtC/ejhF2Z1dpn3pltNn1
         zCkGchaCI3G3beqQryrRjTGhTl3yT4cMC78Aw7qw7q4z9E747UNnaBkr4K91kqZIFdv8
         EgvUIg67zThQlBocHCw2y4glP8QAXPVCDxrk2okQf0U+biv5OzOANSoKpIz88VxAox20
         Rxb02cHu0XzODshH2MbNP7Rf8+18KWgDGDB8KMNiHqfgPcwQtGxgJnzdEj6QmapY6gGc
         PMq5+Zhg2oNQ4idoJgF+RKaqnfG9lPRAc+SVZQfp5VDj0VU3LKv8r6OAvV/DGESnXa5k
         2J4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzspFDCzs4lS/GkR5nRjn8Zo9u4jnpGEV/iS+50zBW4gsiEyYCD/utBxotAQgxR2W24liJSXPL+hYgNE08=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk8d0UIBcmDRxmXh7MlkZAwEWzhK9Z01KL7k2KOAb3k+zPTjTK
	veM9P3aMmsgtLI7+J0atl0tYZJHhNZNw4VqVWP/LrkB9E8UJbIEgu4at
X-Gm-Gg: AYBFou3aRPYqlw+6bXt47zHU6LRMt2tAZOyWtlcwBPF7aq9YJjMfB03Li2TLXbx04nZ
	jgACgPD/52nThYV50ZCX17qK37hgTDx/01EvfeB2wpBWS95SzzIMv6PSS4uPY73/45FhLOnWXEM
	pGZhF+m48PTLBEqJbX4QxW91IBXdklORbOXK+gzC5Jj9gp7Muv3V5MzoyuH0Bco8O91jEB0EVgY
	NKT9CXDi6r65q6oXNbAPmLWF7jEv9V2rDH3MNXrQlMdnLo8Wxg2il9CeyhQc98lD+yx2990MMzx
	MRN/K48Zgt32KQmz7Ps/yC1lpkofaVwLvGPBIxwtjPu16yrI8JKuTvBRBaiQWOHQSX/jCgx1VNa
	4qiZmOBjwoljtSF/SR36G8KLZWIHBho1ojtwr4grcmfJVVanMHzHEuT9/GD0oJ4OdKCf8VVcIU6
	GnzoC99VZ50lIkgptOPCHxWbzqbFpGiD4LUurF78Vo9t/EtAESFOJZdBZn/cqyxv3EwuV5NRdMr
	pipBwartJbJjvOgBkjR/86C5CvExmpXW49f1j3cvxn48k3aJgV91b+nBSPy6QdBl9KE5cDT/NfG
	yzeHcDXdgSKNqYCxOo1dCMmOjgdrNwlhslHxNCcCih2yCQ==
X-Received: by 2002:a05:600c:620a:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a1fdb1a609mr23289665e9.7.1792573688575;
        Wed, 21 Oct 2026 02:08:08 -0700 (PDT)
Received: from andreayoga.wind3.hub ([151.76.51.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm35401565e9.3.2026.10.21.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:08:08 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	Bradley Morgan <brads@mainlining.org>,
	Kunwu Chan <kunwu.chan@gmail.com>,
	rcu@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC -rcu/dev] hazptr: Record per-CPU slot owner after claiming the slot
Date: Wed, 21 Oct 2026 11:07:52 +0200
Message-ID: <20261021090753.20442-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmck-laptop>
References: <20261019161852.12783-1-parri.andrea@gmail.com> <4defa4de-ab42-4809-9645-100cad68972b@efficios.com> <fa16d2b1-594e-494b-8cfc-9b8c13f2c223@paulmck-laptop>
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

On Tue, Oct 20, 2026 at 02:12:09PM -0700, Paul E. McKenney wrote:

[...]

> Thank you all!  Queued for testing and further review.

Thank you!

> Andrea, on your KUNIT reproducer, is there any chance that this code
> can be folded into the existing hazptrtorture.c work so that it just
> gets tested automatically?

Yes, though not as it is: the KUnit test relies on a test-only hook
in __hazptr_try_acquire(), which I would rather not add to hazptr.h.
hazptrtorture already has the interrupt side, in
hazptr_torture_acquire(), but its readers rarely reach
__hazptr_acquire(), where the race is.

So v1 of the hazptrtorture series will add, as patches 2 and 3:

  - two CONFIG_HAZPTR_DEBUG checks of the recorded slot owner, in
    hazptr_release_debug() and hazptr_note_context_switch(), and

  - a nest_acquire module parameter (default 2) that makes readers
    take a second, nested hazard pointer through __hazptr_acquire().

Without the fix, PREEMPT and NOPREEMPT then report the race about 6
seconds after boot; with nest_acquire=0, they run 10 minutes without
a report.  The nesting costs about 30% of the readers' loop
iterations, so it could instead default to zero and be enabled from
the scenario files, if you prefer.

Thanks,
  Andrea
