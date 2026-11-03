Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744582;
	b=Kjzgp7SiySva99Zw+qDQDR7xZZrADi1i+7xZtmodvVN4UyeQ0Gl6Shi+MJ1TtXudHQ0D
	 bWJHPloMIFsFCSFRmDq4OWwnFBAoEyQeuzwe+/D7wH95muPTcqBUoXOSm6OnP4arL/bDW
	 L0E/J/kSWSjF7N97k5RzgHl9yrpuTB9YzErA8+XfvqxQgbLD8NGO/9icS0YyIUfGHYUHF
	 lr3O4JXl6uGzptQjB9x+3iGySUh9EeyEFS5/bmSnAeRkqWz+dTMPKZm32nqcGikd4XlpT
	 sns3u1bqZtsrt5abmIL/tiEBGrayVYq1L0gMEIckcoGlWcLfzzD+kLKtsUDy8yhJaJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=vG7YyaR1jfJGT4Zyo7fUKW5YQdRxU04KVZC/8HRXsU0=;
	b=Hm9J/LCgTmMuJks2LsIdj5c/cZeL71h/KtopaVujGpdXtZ0sZw48nuzfUB5lnxFLBQEy
	 WGVTNvw2C4uyI19HkYuEfB9H20tMEUh86muEqFPWDsYkjP3cnQpCDpPG50sXIKSMdFS7f
	 vFSBnrzWKZ9vsgYI0TP/ejYk/OObsnODnfEISN9RQCmFIHs57eP3WpIjIy3Tm2lARhAFP
	 E3KdLFiIDTY8yZrcuKzIIGwqjifsBvpmWcs5IbiEpPvDyXaQikGQKBL044+VTPAZXQ+C2
	 YyrDlqsMWJ8e5obm+BRdIsHe85vrqU8L+QWDFq02ha7Oa/n/QpyZg8O8xgxPMsG4Idg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mWQMoB0K;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8288C606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:23:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8288C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mWQMoB0K
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1931ff67a29so399008c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793744581; x=1794349381; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vG7YyaR1jfJGT4Zyo7fUKW5YQdRxU04KVZC/8HRXsU0=;
        b=mWQMoB0K1VT+Qs08/4w1/EZaMZ962n0okVvivkeH/VyHpZt/S7I3EE2F9vs3758tTr
         dnebJ9MLlplJjZatFyvy+fgG8n/uK3SweCHTHuddXhyKsueRyw0sP9Wx6NeuiO7igq1O
         KckL+SOZCVvgBBgekcNt4p7ygVI2gei2ywWc0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744581; x=1794349381;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vG7YyaR1jfJGT4Zyo7fUKW5YQdRxU04KVZC/8HRXsU0=;
        b=nuT7mJQTKvxGklVysPs9aJhkrYRliZ5S/9i4nZQNhGHkI3vr6cjn7HvAEo2qL9Pqxp
         hSSsxYbeNpS/yihu7wlqbdwa+PTzxi7BcQYYwq+UOowGyCXv4AKiImj/EHKk7HUH5YTR
         fUUvA14xciFkQ77M9SJau8Yn8H8dCLl2DseMH4Bi1AiFrTjXou2XmoUrE01Qw21gPysz
         J5HFQhcw09ObBKrPDaJFtdzmC2Q15poEpkWUJJ+PWLuw/muLPnjVdOVryy7+BOJ4aKYh
         +odfqhEig1YMUB9D9XVt246+dtNAfo0KivKVPb0RexIU4R/hlCHQbCt4M9g6PTHGQcqL
         ZGPg==
X-Forwarded-Encrypted: i=1; AKwUvBw+9WXrx/xB9OswZwm84lhe9lGqWxiQu0oB4jd8Toe1KXkVhwIuNvB6EobmlUX2h1H7LlUUbvVnX8wHWv4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uoKO8548lo5HgyOmq8L7/Kjrda1Au/R37raenK81F2pQUFt+n
	Vwgha9VfHlJs7hSUpr+5DUwc3FlC7plTvOxtqMmGfSYzNpBxaJiAJWXol2BDUew8OA==
X-Gm-Gg: AYBFou3v1E4MQs/8lnLwa3V2f4AmvHGtXZOT89XWqjdye7edW6d/RMxpgzsF9Cv8/Rv
	AsiFG4OtDBQFRpftwzJsN06aMuAtBTXFf6lIbDQIVXnAGIqbkGH7OpmECVeKQ/G/LutybwHNijn
	K9IWVkBF9cZyN+ztl86Xb3EqyX4s4VqHnLOIUz8D8gs/yvDEa1ra9ge89UY5GmbuiTL56yHgiTs
	WVjZXsZ8D91yJfbJHI30Jg1p3qo4yCCQDL2kDspdKV+YQWAoOpH7Fvk4gdwme67TVY35eD3b3HT
	ZyOL3l3Y8LOeLCNUEig/f15sgVTqLqO1eChr8z8nhQg6j/rFtFwd/iPiXh0j0HXkE+2Rbxg84jx
	qryYmhyvy5CY4vUBKDnMf8eMqmaVjQlDRhmKs4bYTmcu8joOTLaeQDwQy5CrfHt/Zq/WvUjt3jb
	BdzPsVIdIF28YNcSK6tulFF1pqfziFd/aavgI6/O9m9A5j9RlQRdVmPyDRqr9SkKzj+aKocXA4l
	i2rBFHEDnjx73JWDK6iPBPR7aA6UIFxQk5LZyaBJbJG3L3d3Rb7MYtOLvsTBQmo0a+nl+Ojqceq
	FvuG44NParKIt4/Mfzca3czKB2tKmyytBGQ/GY5J1Dne92zXdgEi6kTQK1QZodNAEBfr
X-Received: by 2002:a05:7022:b0c4:b0:144:eb46:c3f with SMTP id a92af1059eb24-1ac560219bamr19881274c88.2.1793744580537;
        Tue, 03 Nov 2026 14:23:00 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ab71:b3df:693a:fbf2])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b245b86fbesm1926506c88.1.2026.11.03.14.22.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 14:22:59 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Fabrice Gasnier <fabrice.gasnier@st.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 0/5] PM: runtime: Improve autosuspend child to parent propagation
Date: Tue,  3 Nov 2026 14:14:38 -0800
Message-ID: <20261103221717.3840215-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
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

v1:
  https://lore.kernel.org/all/20261002230714.507921-1-briannorris@chromium.org/
  [PATCH 0/5] PM: runtime: Improve autosuspend child to parent propagation

See patch 3 for the primary change here.

In short: today, children can resume/suspend without extending the
autosuspend expiration of their parent. For parents where their activity
is largely driven by their children, this makes it easy to experience
"premature" suspend.

Many .runtime_idle() implementations seem to try to work around this
problem, and one in particular (stm32-adc) documented their problems
heavily in c537d3457542 ("iio: adc: stm32-adc: fix runtime autosuspend
delay when slow polling").

This is an attempt to improve the PM core, as suggested in review for that
change:
https://lore.kernel.org/all/CAPDyKFp=KTf8=zGBSzPYqhjnZpY8xwvjCeM1e-WTKT1QLSxaDA@mail.gmail.com/

This will make it easier to simplify many other drivers too, as a
significant use of .runtime_idle() is to simply extend a parent's
last_busy timestamp, as a proxy for "last activity performed by a
child".

The changes:

1) Preparatory fix, noticed while making the following changes

2) Because the last_busy mathematics get a little more complex, I have
   to change last_busy to use an atomic64_t type

3) Propagate last_busy from dependent devices (children, consumers) to
   their dependencies (parent, suppliers)

4) Add KUnit tests

5) Remove the pm_runtime_mark_last_busy() workaround from the stm32-adc
   driver

To follow on with #5: I believe almost every other .runtime_idle()
implementation in the tree can be removed after patch 3. (There are a
handful of drivers that should just use autosuspend. And perhaps 2 or 3
other drivers that do other non-trivial work with .runtime_idle(). But
most are redundant.) I may work on that next, if this works out.

- Brian

Changes in v2:
 * Update comments to explain when/why rpm_propagate_last_busy()
   performs the update
 * Minor kunit test improvements

Brian Norris (5):
  PM: runtime: Only queue an idle check for RPM-linked suppliers (part
    2)
  PM: runtime: Convert last_busy to atomic64_t
  PM: runtime: Propagate last_busy from dependent to dependency
  PM: runtime: Add tests for last_busy propagation
  iio: adc: stm32-adc: Drop runtime_idle()

 drivers/base/power/runtime-test.c | 99 +++++++++++++++++++++++++++++++
 drivers/base/power/runtime.c      | 30 +++++++++-
 drivers/iio/adc/stm32-adc-core.c  |  9 +--
 include/linux/pm.h                |  3 +-
 include/linux/pm_runtime.h        |  3 +-
 5 files changed, 132 insertions(+), 12 deletions(-)

-- 
2.56.0.398.g882cbad275-goog

