Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763230;
	b=bAs3VxaQN3ymVtXO76druJkyuHTADdFViElyuiUGFkREU60WebdwTXFumklh6I4BpdVK
	 1bQohsE6HeIUmQ2S5xRIxqmgweg+sX2OWV/3IybepHVALC4HgvQzy6fGYSVYJ0SaNMh5K
	 HjPl52MD/B+8dw450YtEwmtlLEzOj3uipmU5MTmnyBO796ssQ5MvZwa56b7XFSNL4CCFh
	 amfo6TsD7lULypsPBjK4S/eN5ykhrqzgyOvZhQvtzcNR5i67dFncF6MspWW1IUln5+yeK
	 o+3StH32dZHpRzEmP5HY+mMTj1wTspl1x41iv9cc5ScxKcC0DOvnv+UyPvdwhzMRHbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763230;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=pYzvLRXgRG8WlZWJ2J0+Am7rZxMX4yjNywqCpMHDWF0=;
	b=Z94oy68IWG5Qj/szvi0/Te1Hno4B1BzvRD+odxTCUaeeUDhBSvKi5UCkuSvj3bc9Zbl7
	 8RgMMsjbMYWrjGP/WbyErB4k/Rdau+z+UHKsC0XeogFWFtY6SDym0SpPG6NyCdvaHmENK
	 KGeJxrd6Yj0hNFO2WKgyp8NtFviDGJJ4TiAoBoe7mD5oVp8TzjO3CR6sJkvYE9qVrZu/u
	 9wFyv1SQZykNGgTwVHicsIPoR1sJcIBy3k6cvx9hNMTpqHpAks9SnkHQjH9TaK5zhkJKa
	 H+bH1oGB62nEQQoS+qsd9qLBjdPIQo7TAKWE+BLPJ0viJYWJsWGAT2J+RewnSzHPoPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="FQNwBS/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42616606A31B;
	Wed,  4 Nov 2026 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FQNwBS/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0AA1F00919;
	Wed,  4 Nov 2026 03:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793763229;
	bh=pYzvLRXgRG8WlZWJ2J0+Am7rZxMX4yjNywqCpMHDWF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FQNwBS/3hrsMlHVz+Li+FQbt1KfFFqVvPrPw+eh9FYBuj+VhksWIm0dBYiKuhHGnl
	 hJ5dIiRXh6J0bPUOKDLSRfLSfJk/1AofyGtvU49IxjvFOweTll/0cwDtlNHW/fRrWj
	 vwdN/xwKbWa12SBU2C7DmVoOCB5jrrGMg0IZH2WMANYR0BSXzP4xweoqJRkEkoeEaT
	 aKaqb1bVuBEL8KCEMdn/sTTSDT6/gnEeh4+WmWOSWClo3rGdiUdTG0eVfhQzU4sdnC
	 D3CUJDba5Acas4NrMwHxiBzhfQolBCRkkmmd8H8to9caYexNTIPbgDEUnD3a4iNyQt
	 ERwHv5nQp0CWQ==
Date: Wed, 4 Nov 2026 03:33:46 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Cheng Yueh <cyueh@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-team@android.com
Subject: Re: [PATCH] platform/chrome: cros_ec_rpmsg: record last_event_time
 on host event
Message-ID: <auqnmtT_Ir_HLb3i@google.com>
References: <20261103062802.361878-1-cyueh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103062802.361878-1-cyueh@google.com>

On Tue, Nov 03, 2026 at 02:28:02PM +0800, Cheng Yueh wrote:
> Transports with a dedicated interrupt line (ec_dev->irq > 0, such as SPI
> and I2C) record ec_dev->last_event_time in the top-half
> cros_ec_irq_handler(), while transports without one (ec_dev->irq == 0,
> such as LPC in cros_ec_lpc_acpi_notify() and ISHTP in ish_event_cb())
> record it in their respective event callbacks.
> 
> cros_ec_rpmsg also operates with ec_dev->irq == 0: when an MKBP event
> notification (HOST_EVENT_MARK) arrives in cros_ec_rpmsg_callback(), it
> schedules host_event_work to invoke the bottom-half cros_ec_irq_thread()
> directly, bypassing cros_ec_irq_handler() and leaving
> ec_dev->last_event_time as 0.
> 
> cros_ec_sensorhub_ring relies on ec_dev->last_event_time (via
> fifo_timestamp) as the AP CLOCK_BOOTTIME reference timestamp to calibrate
> the offset and clock drift between the remote processor's local hardware
> timer and the AP timebase. Without this calibration, IIO sensor sample
> timestamps cannot be synchronized to CLOCK_BOOTTIME
> (SystemClock.elapsedRealtimeNanos()), failing the Android CTS sensor
> specification TimestampClockSourceVerification.
> 
> Record ec_dev->last_event_time = cros_ec_get_time_ns() upon receiving
> HOST_EVENT_MARK in cros_ec_rpmsg_callback(), matching the other ChromeOS
> EC transport drivers.
> 
> Fixes: 2de89fd98958 ("platform/chrome: cros_ec: Add EC host command support using rpmsg")

`last_event_time` was introduced later than this commit, in 05a3c420eaa6
("platform/chrome: cros-ec: Record event timestamp in the hard irq").

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_rpmsg: record last_event_time on host event
      commit: 4efef5ee9c41dc7cb9fa8ed67c0831be669702ca

I have shortened the commit message (and updated the Fixes tag) as the
original one was a bit verbose.  Providing extra background context is
helpful for review, but please consider putting it below the "---"
separator in the future so that they will not be in the commit message.

Thanks!
