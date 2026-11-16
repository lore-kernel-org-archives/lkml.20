Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845799;
	b=e3OP/fKDye0JF/NYi2y0gwL2rPHrLx9AOYrDFallixMGyccUhv5azPP4/VTTfUDOEq6v
	 VYNulWy1JQv426Z2eYh39u6316lCTt98673PYbs0jXVjcjeTR0KrLGqT+MiLdEqiNdM14
	 +JLdVQ/o9MPzj5lBQ9ItT2P97B1pqsbvMCZblIVnNc1luoJRx0aTIPNRH2se+VH4r9ATm
	 P4A5Xh2lg6lhAHTWWpvXi5YFBtCCT3u3yf++oLHuWsEQ7rTnZP29A3CmmdRQg9GzE51eq
	 JCCbZ3yHuneltUe7ySqWaCnhW/LMTganioGaIOpmMHCaun9Jn1bGaBIuP0C38UN7GPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=x0v9e+wZHiAwxkDeqQfkfA5SYCnl901hHKw7lpsX06g=;
	b=4gVv5mHQmxqMDbc7VYwmDy2dM/BT5iOu3drYpji3ju5P3wxYaC9p10UkmLps+Z/GoZi1
	 YNBnyFOOp+XqNRYUSK34jFmDyvEckmItkdOvpo10D0kIh3lE9T7qO67ii+NOTVv/O3W/D
	 MIgiOdq3QcjEqCQbsUTgvAtUHTM2BEmr1YCBp+Ha+8cnNwFMFhF2PRvV7MBc56Tp8x6G2
	 uE8gFyJL+QFFx7cMrrXs5IMXKAaHcGFUJDWjbC2o+AgZL1/ap2YZX7HgqL8b7cngJ4xde
	 uJt5GD6QeIugEoHYvuAlrdh8wRTPXeSOCEw6kMfnN6LXnzIIJkzVize68gUtCWBUVKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HyAVpQgu;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E439C606A338
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E439C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HyAVpQgu
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cdb684859cbso2618238a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794845798; x=1795450598; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0v9e+wZHiAwxkDeqQfkfA5SYCnl901hHKw7lpsX06g=;
        b=HyAVpQguoF/re4y1dBicLWQ52JiDRweNeuO6DSXlmN3DR063h67/8SJm4gQGce8Jf0
         NL/56kojhiaml7BZLbgn6AOPSR5W6qKQeHYYyNjn9U3Usejh1bT7eRGQlVs/bxCjl3y8
         J6RpSAH6230fwUn+FAcrjiVyqTglTEhfApjt5rIWMNzp4bmPaKy/jIBAwt9fKSmNdxXb
         9Nb10PjhyCuVx/XIuXirJ/oUJnlnRZu4sOSP+RjPDZQMl8TS4g6Mt5W0kwRHAjfAD1XE
         7v0uPt3sbpJx5Wy4IJHrfbSKBcuzNBWaAIhw6OfYJesf3un5HvAoDmFUsF+iHu/kOkzk
         64Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845798; x=1795450598;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x0v9e+wZHiAwxkDeqQfkfA5SYCnl901hHKw7lpsX06g=;
        b=b2PPWaBZcNGw9Zamtof3nbh/w/RKX87qIt8b7/FdBYKX4WkrtO4kxTZogVOjI6H/QT
         xwhmNE3nZ5H6k3FCj/caotyMFOyTTEOeIUbhPonAy5UkMLRWW4XaIUPqizqMZWjmadqc
         nKLdwelOhRCbG91bLEP+03ZQL5Dfy5qmQ5lAfIpmZxanAAMJ0YKYkGVdKUEIVYgAvtD7
         ypz1qe2rrW/3D5R8CQxZnSxXKXxVaVmWvjeB5y16KMhCoLpgElvU9xhJMkWig1RotuyT
         il3P/e3GfPSBfBe/NoOnc1xycNRwqrZsbWWRlE06jZmJ003CfnnYJP2qq6F14atFZEEr
         bS7g==
X-Forwarded-Encrypted: i=1; AL+hErFHEgOupRyASYN5YZtT174jC3FQoArXnb8XfqgVyQhYVn3TtyMhl28uDVvneV7Lk3e9eQNmF//6Q8yjuiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NURg6lDbQpgi5PaJOXvEoz+nUudIKbIOiy1ogR99hp5sxvKl3
	CTkY/FzqK0Rp0StDT0wYJXi2qgueF/hw+x7PtL4r43CGzEVQrfaIVLgCPGuc/6nDP4A=
X-Gm-Gg: AZFdTZcoqXyb8XOXkeoBPT7auPhZLcNHusCc8sFMfqjfkRFEMAybYfZ1eTapmdDp3FK
	5IlEAVBcxYuJYAJY68kt7D/l/n8P7XIXjham59i1qr4f+BGe2+bmhhzX/ZIIU2m6aOkO75VP7Pk
	IEUMW+VyvQJ29qTNe3YsN0TD3PGAO8qncuxSYxsI78h87cV203ncvC7NzeS/iXw39iKJSN0RjLQ
	So6I/DfiFhPctg3k04+1kqWfMHiOYTJ8KZA0a/ok4tTX/vtFPmT//kRo2wUGjvnuq4peoihwFPA
	NsXb/b/Q8ejRp0llbRAMlkBmuBO5GEZqMgp4Vot/d8H3qozkSHms5Qsdz6JsQDD1txsA8a11+Tg
	3mY471MPocOkpUIfjIjYv/GpEq8enCFr9CXixd8uCFm9eY4joslCtLF7TD1rllqmjX6+MVSRPh4
	GGgg53LC2f574oApN/xA22LY0qHs6lYCKiY+aoup5uwhegNHonNLlwuQ6+6ABx9pi+cFmx1HMYC
	tgh33uCFbetJIpI+eH1iU4CMRtZ5FhkPtDnH0BP9gR5kKwaRjRjJTyq1Hg1xSMgidKTA1TFVA5v
	sToZqEVxFKG3rjF8QnrJvWzmuIY/ueZhSShGQd4pd4B0TA0=
X-Received: by 2002:a17:90b:2ec3:b0:3b0:9781:ee8b with SMTP id 98e67ed59e1d1-3b1b09fcbc5mr10847659a91.26.1794845798086;
        Mon, 16 Nov 2026 08:16:38 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b1aec3af2dsm17201419a91.9.2026.11.16.08.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:16:37 -0800 (PST)
From: "Kevin Hilman (TI)" <khilman@baylibre.com>
To: aaro.koskinen@iki.fi,
	rogerq@kernel.org,
	tony@atomide.com,
	linux@armlinux.org.uk,
	andi.shyti@kernel.org,
	thomas.richard@bootlin.com,
	wsa+renesas@sang-engineering.com,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Kemnade <andreas@kemnade.info>
Subject: Re: [RFC PATCH] ARM: OMAP2+: fix omap_device with noirq_suspend
Date: Mon, 16 Nov 2026 08:16:30 -0800
Message-ID: <179484576805.84649.11200810551954641620.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110211531.679943-1-andreas@kemnade.info>
References: <20261110211531.679943-1-andreas@kemnade.info>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 10 Nov 2026 22:15:31 +0100, Andreas Kemnade wrote:
> Fixes cases where device runtime gets resumed in _suspend but then
> pm_runtime_force_suspend is used.  So the device is disabled, but runtime
> active in _noirq_suspend leading to duplicate runtime_suspend calls. So
> rather check for the device state directly to indicate if changes are
> needed.
> This relies on pm_runtime_force_resume being used in a balanced way.
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP2+: fix omap_device with noirq_suspend
      commit: 20ae98b360710da7db17b0d8edbf84c88ff4658d

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>
