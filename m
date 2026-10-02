Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124254BE44A
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954408; cv=none; b=fUY9ggIv6Qr0tAUE0s+jVvfQSmbcuWNLit3eB5zpvFNFCfaROeh/IvMXNjrcXyBlFnlVSpmVgBz+QEFqKjFgntEhojnXqgTMta9umP8yeh/U/3j3e0vU5mMz+rGDfjbRqsFttKQOg4zKfASZ4FKZ77KoZ2F4zpuWYncgk7NbJKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954408; c=relaxed/simple;
	bh=DQfAhtxTAB5Vd5OAzoeWKu41Rrzc5+aCsCrCYO98NXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rMvImkDNwhmkLzpP3hmRAPXmgU9IYCQFSQTR07DXbzqgahsW3emrosWDa9DYfOBIND0MeJDS5dOZNa4OrBDQqo3OaB1jnqfbw6vyLVj7hqse28F7cdBfnbJGuU/hln42c7v2jTTpBiyUSNIomooVVDqpoC4ZBqg2U69wPxiYhAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bQsns2mg; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bQsns2mg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=8WsawnzeODFNIggENzJ5Slr+Qb9wWjZZkflOdLrLx7g=; b=bQsns2mgrSEMZu5TsQr1x6bQm3
	Q3kWUpt5A1rw3BQW5/TCPgiaZx+GwnOjBuTJO8QHDpeixQ10o++7J8RrPrx7tBLrEU6eLXNGlixxG
	F9jfbksGBUWh68DjftpJIY+9yCyrdFuQi7NUCgb+LPPbEXjITe2wLiXI4HMWMvqv0r6DOMUPV1eZD
	35NPWGr2C31Rwn/kheYWHy/ogobFSedjwG8/QOen0RP0jOFpyvGkHoYnGNIaWPcufCqyH/PZpGXtP
	21suUKvOdcoAoJptcFMEvKWkhCi8GWJ2ss3uZciPvfIUs4NnQCxxUnZa13babNuVC2YatFWV6xbfs
	rwxOk28Q==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCf34-000000064CQ-2zYQ;
	Fri, 02 Oct 2026 15:19:47 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xCf31-00000000IAr-3SJO;
	Fri, 02 Oct 2026 16:19:43 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Thomas Gleixner <tglx@kernel.org>,
	John Stultz <jstultz@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Miroslav Lichvar <mlichvar@redhat.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rodolfo Giometti <giometti@enneenne.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH 0/2] Optimise ktime_get_snapshot_id() for capture latency
Date: Fri,  2 Oct 2026 16:19:36 +0100
Message-ID: <20261002151938.69857-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

Commit 2e27beeb66e4 ("timekeeping: Allow inlining clocksource::read()")
allows an architecture's primary implementation of clocksource::read()
to be inlined, apparently because the out-of-line function calls get
expensive on x86 with certain speculation mitigations. Use the inline
read in tk_clock_read_snapshot(), and wire it up for arm64 too.

Also bias the clock_id switch() in ktime_get_snapshot_id() for the
likely() case of CLOCK_REALTIME.

Measured on a Cortex-A53 at 1.35GHz (12.5MHz arch counter), with
inlined clocksource reads enabled: the interval from a raw counter
read in the caller to the counter read in ktime_get_snapshot_id()
drops from 49.9ns to 41.2ns with the inline read, and to 38.8ns with
the dispatch bias, mean of 1M iterations.

This is unashamedly a microbenchmark but it actually captures a real
world use case: The time it takes for ktime_get_snapshot_id() to read
the counter is critical to some users, especially 1PPS signal
capture. Every nanosecond helps, and for the inline clocksource read,
the actually *complex* part is already in place; this is just using
the infrastructure that's already there.

A further use case for arch_inlined_clocksource_read() is a polling
mode PPS driver¹, which only needs to snapshot the *counter* around
its GPIO polling, and can then worry about converting it to a
timestamp after the fact.

¹ https://lore.kernel.org/all/24e8134b35cc8be26606d7472295cdb43ea6b38a.camel@infradead.org/

David Woodhouse (2):
  arm64: Support inlined clocksource reads for the arch counter
  timekeeping: Use inlined counter read in ktime_get_snapshot_id()

 arch/arm64/Kconfig                     |   1 +
 arch/arm64/include/asm/clock_inlined.h |  26 ++++++
 drivers/clocksource/arm_arch_timer.c   |  21 +++++
 kernel/time/timekeeping.c              | 110 ++++++++++++++++---------
 4 files changed, 121 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm64/include/asm/clock_inlined.h

-- 
2.43.0

