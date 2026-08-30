Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C707B27FD76
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788092184; cv=none; b=ScQhvfVSZQa27xTPvEE+/r9P7MEDQd3+z5eIWIzFken5dV9JErVFHblBAKAJTsKFyUQ+fGvZdEqWV4hgv2HLk7GuR7BTwK+qgB4eJyWoYvBVacenRIhSA5kPnTEyXQnCpt2M2KX8M+RsJZVz8Fb7VZdKVv7LsOWSyU26Bm6kb80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788092184; c=relaxed/simple;
	bh=2hPVVnHZVDE3pU3r6Dw9DK2UQYwmQlYhpfUhixFlDF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k/6EUngQy/iKY4MrJWfQt3mupfGxFmyIQvLsWJt1BbB/xSZJ99bFVIvdPW6mSaAkU8iYplOMTuvxSvIRKC2UlzjV+20dWkZ2fqjitrmglpVJZbtq6Kcy5xDaH0GwTaQDl+oNv96/IeuLjnd7az6iwS+tl4Dn/Pb899MSvdQ9qRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WoOsqyjY; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoOsqyjY"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4957eefd361so20192465e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788092181; x=1788696981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2hPVVnHZVDE3pU3r6Dw9DK2UQYwmQlYhpfUhixFlDF4=;
        b=WoOsqyjYwY4bsY0jZjAoAHi4s9IenT288gKTHz19xF2vUZPT8Vz7TpPBRt9cB6XQEV
         frn+3K/7Abe92MWC5qMtbUa0qS7w7pgkerr6scbTnz8MaQKwIBE3MGwjxHF1+rJyZNzc
         hT9kTwLNEOy8BqptE1kz6w1UPEbebXZUyWzF7o0DG6vNuIPXqvEPFXRkMZ3jKePbpTxo
         LncPn7Qw5Vi5SbufVXONFLP3IdGGtfWXvpMYlf4YWalIEp8rnrIn8Ho/XTf9grqfmajp
         hPTHeGbzHOjtTgkP+e+B+XXe1JiUW/vDgwv4xG2fM3ZOOR1cwizKvgKInwp83vykyDPD
         sEyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788092181; x=1788696981;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2hPVVnHZVDE3pU3r6Dw9DK2UQYwmQlYhpfUhixFlDF4=;
        b=db9jx/EtG/lxKTkJ9+B93e39dgl/CsqDwUvSicAFbbadfbb7X+qdhZ3BwAhTEWJFeR
         cFNq40N9pNcLcpNdkhKhan5Qd5ZFTzT+Sdi+rxlImP3nBq41qHIoUMmfmFsqAwAJpOPA
         ymGRY5gqYE4G41AxVgTWC2flWuCOlCcFf8V699688SuGyOxagaEtQSAHpk/zA/hEByqO
         9p5tqYifleslkTRZmFWHQs/geYUqWZRWMKx6uX0Kr1poZ8puq1eIplE2ZtJFwpG+V92N
         NItWfeCmqzJyRfuO5Cf+xM7csliIOvRLe255Kd9ntM6BcMm9yvjMWx55uP0axDp7mlr4
         ySUQ==
X-Gm-Message-State: AFuF++lpmz0YQ+WRoxCt03s/x2aGL30GkXN22+toaJguOhk7eXikmIXl
	hBwkOACy519FvBDbLD8i2RQeq+pBDpMN/G8gvbDbQTsQhjVClRQu9WVz3M2sSw==
X-Gm-Gg: AR+sD12UPDrJmWrQNthexlGNqpOLwv99EeeUFyxOejpY3AOAZJRmN8zi+Sdl0/K8d7o
	4GizIn9D+MxKHkS7I5lXKJPGWDXtul2YxZxoYeYaFEzXFTrSAhzzoTP7wEIS1HQuDF6yvlSDEiJ
	K4VkkVGQlJagx2pVk6hLqKIhPNfyr+AuJtpbbPMWR0YUszwnT2GDRaFLy86NC/unrFDQkDn44OF
	OUG4185MGOjXTuJ7d6BNSIqYJHBaV2rsd8ElRyTpyanI2Snw9qadE7avIe+0gHDq8FfKQhqZlZR
	c5h9ZJYR0k4aDydycAxb7j8HbYDMZ801HS49hTTJwCh8PoO9P0K4+U97LzgmivIbTC2gQzzKAJl
	y/05gUUj/49pJCvPeil9RvywR6lW1Qe+R7LWH13etgx+KieAFrTrLMJ6K0ICB6lcHP8ZUqUv3um
	Ehal//IWGmLAMGDaTNTNTUJfXGh/kMN70TCQe/aeO18b4P3CJPFO0yXa4DrfpZ6oLg6UE=
X-Received: by 2002:a05:600c:5288:b0:499:84fe:5f3e with SMTP id 5b1f17b1804b1-49b91c41014mr310827385e9.9.1788092180768;
        Sun, 30 Aug 2026 05:16:20 -0700 (PDT)
Received: from foxbook (bfk5.neoplus.adsl.tpnet.pl. [83.28.48.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc0f57sm231676445e9.2.2026.08.30.05.16.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 30 Aug 2026 05:16:19 -0700 (PDT)
Date: Sun, 30 Aug 2026 14:16:16 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: Watchdog remote CPU read timed out
Message-ID: <20260830141503.42994806.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Thomas,

This is another warning I'm getting on recent 7.x kernels, apparently
from new code you wrote a few months ago.

Increasing WATCHDOG_DEFAULT_TIMEOUT_NS to 100us makes it go away, at
least for a few minutes (I will try longer uptime later).

With a few debug prints, I found that watchdog_wait_seq() fails every
few seconds, usually on CPU 0 but sporadically on others too.

Example output below. Is this something to worry about / fix?

Thanks,
Michal

[ 4307.502933] clocksource: watchdog_wait_seq done on cpu 0
[ 4307.502946] clocksource: watchdog_wait_seq done on cpu 1
[ 4307.502950] clocksource: watchdog_wait_seq done on cpu 0
[ 4307.502952] clocksource: watchdog_wait_seq done on cpu 1
[ 4307.502954] clocksource: watchdog_wait_seq done on cpu 0
[ 4307.502956] clocksource: watchdog_wait_seq done on cpu 1
[ 4307.502958] clocksource: watchdog_wait_seq done on cpu 0
[ 4307.502960] clocksource: watchdog_wait_seq done on cpu 1
[ 4308.006997] clocksource: watchdog_wait_seq done on cpu 0
[ 4308.007028] clocksource: watchdog_wait_seq done on cpu 0
[ 4308.007031] clocksource: watchdog_wait_seq done on cpu 0
[ 4308.007028] clocksource: WD_CPU_TIMEOUT in watchdog_wait_seq cpu 2
[ 4308.007034] clocksource: watchdog_wait_seq done on cpu 0
[ 4308.502975] clocksource: watchdog_wait_seq done on cpu 0
[ 4308.502991] clocksource: watchdog_wait_seq done on cpu 3
[ 4308.503021] clocksource: WD_CPU_TIMEOUT in watchdog_wait_seq cpu 0
[ 4308.503048] clocksource: watchdog_wait_seq done on cpu 3
[ 4308.503050] clocksource: watchdog_wait_seq done on cpu 3
[ 4308.503051] clocksource: watchdog_wait_seq done on cpu 3

