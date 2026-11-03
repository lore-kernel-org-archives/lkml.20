Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793722286;
	b=3PLkDfmfUclvd+fJddAQwxyh4YySz0TSRpd2nWbnXdpu4MisblDDqUu8BN1kLFvYwvpQ
	 eL4cEpwYAj2lTjpWXUT0Yuea2zsVogD+Go5BvlGLO5yV2Ug75GmMHNFrquQk5+mcqSSsE
	 2F8kRS/0jkDmLM1RYeU46lZVnlxBZAgWnf3+7g0o4J0O071ERL8in03iErna7iCKGLx0t
	 rGa/ABqIENcV0NcEuOi60MYm7XEwbYS0MQIx0mcKGPqt6aKA9vd30XA4Ua+4+D9l747NE
	 +n9gtWdAAC1XtrjtOUCpnThWYhtsrK88hJ+9IwuC0KKSS89uI+xbBX5S1V4CXvQvp1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793722286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
	b=ASscaMlJvhUgJWueS+pfOE033tuonVttvMvPnsexqpWTC8WnLWW9GDX1odikzvFhgPXp
	 cn/WtSTpyyAybYKTG6TqZgbVRTODKuQ5ZzrphVKaBt1T0fZfm4ILACFYLz+UTt1Osl2OB
	 xwkksiIoUdRlvFVqzNpNIP1fPpWGNgi8TK1VDc89/PHnxwspG1FUkf3SmNrLY/WO/TYHR
	 evG9VpDgXUBlH5RzURbFlbCr4bo9Hu1ywhekuMl5t+WNYNwtaX2r/dtBIAXF1kbZ0IIrb
	 KruyKOrMWPOSU2N3KYdTl+kd7lheYJn9iv8XxM9siGpvTjYMjlF+O4cfSm4lGGZuPqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OisoyWl3;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17B96083628
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 16:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A17B96083628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=OisoyWl3
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-53ec9237600so2447672b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 08:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793722284; x=1794327084; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
        b=OisoyWl3dq9YmaoVmW7pkYvLeJC3unuO2MXG97Um3OIJbF0VRqLl8qnUMllF/pheoz
         XK5mkdphNHCv9rH8FJfdFbBw6U5IrgklVV3X0Hxp/Q5QHwoKsgXrGVzan/6PXLGZKxw9
         wUw+9K9nBJWwbEJD9epkdIvI0sKWwwT39AxSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793722284; x=1794327084;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNwvKOCdTYC9J02wHQU8L2xZ+KavqPuMAcm6uI6YuYg=;
        b=fH4BaLHOOYQdKV+OdivTjQ/VEAIAdQcDvzIOU1xQKnrw4ie8t/D5JdWQkGF6PIooeu
         4Twl1uw1Ct3BF6k6iALpkig+lAYara3n4/d8DJ9/nWijsaHfEVry6QsjN56ANYXAWedi
         cE5GD3Dx/5Zo1WoV/FWRXt1UqKEqRFZhSO+l0JErdQFDSsSs4g8IC3FTl3UPoWj/6ukF
         bNPStBFOMzM3oBhbfntCGeO5lUmmSUtDf3wZqoHMFdU2XbKUJo5n05IFKJCD1PVdGwLV
         gS5fndgwzFSZeZlPa/lEjixe7YcyMAR5SuK4SPjAR3CYo4rXj6WI3Ur8jhgBdDwX0v5j
         UKZA==
X-Forwarded-Encrypted: i=1; AKwUvBzLCNuhF10wtp6OSE5DDrucUMbluWPVs2DNSZqvxC/CV1kqbVOuTushUCLXPE3njGZEWG5E6dwh0ERPBoE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OWsSkM+fygzRL86RjZjwjjFvxa3MRVyljfiTnQc8+kpATR8Qq
	A/7x3PB8tBVAGNvvQih7o08iZr9Tmlp1CYK0EGoqz3t+Y/3KIHaBkX+hMbBOIpooFw==
X-Gm-Gg: AYBFou3PoaDeedsK96zEXjgaoR/SuKaQRE0Qg0TH6dHg6dkrJ1DRPdrqAmB/ZlptBGe
	Uh+yjF+2F8m8OyJwwGbafaa8x0x5M7p6auNzk5O02La2W8BXspa2E92VwxwnyN4e17nzjTtxynC
	HcyBkwehXFRSbc65BuOPpw7bRBVaKWeF/RwVWjjPqF9Q9O+WhL2118F4WBHKE0AwbFql+LTjiv8
	+geyepwCSLNuh6OoE/kQ+X8Nz3vA8P2OabAGPHxsAEUsZ9tmUsoMxKWfmbFBpcyLR11WgeWvg7E
	8vAAv4ko2uY6uuI+HGpvG+Gm3GjQS6GZezAWtSmGVSbr8GY9ZYDOMsUFO3ahjwKOtWAtnI+w6S0
	X8eWprwv1xaTMmCkmO7AHPecfmOESj7c2NuOzXxaFsMJOVAMxTdU7wy0s9EO+IVl83bzvYVKY5t
	gP/6vM7N90LLDWxCEJH2RYKWamIU9HSFMlyMuqhVZR2QYVRE2eh8eSN7ShEo0fMxJb/btCs/ulq
	EFEqqxONN3Ip4YoVYwxkGIHgbLVnv0s2w+//uHTrfmCIF7iYW+m4/0PlSMFT6vopjiCjiUTL7EI
	BFe/SLDD2BlGDRbWUcpwjuJH+Nie5fTh8KoImOV4c9hVUdZ6lqoMqZB9WqOhSs2ZsnRX/O9Avxs
	aCRBttaV0/8JNJwU=
X-Received: by 2002:a05:6808:2218:b0:52b:7641:33a6 with SMTP id 5614622812f47-5640deea502mr9137854b6e.14.1793722284423;
        Tue, 03 Nov 2026 08:11:24 -0800 (PST)
Received: from rrangel.c.googlers.com.com (194.246.27.34.bc.googleusercontent.com. [34.27.246.194])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd95dc0sm11688383b6e.6.2026.11.03.08.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:11:22 -0800 (PST)
From: Raul E Rangel <rrangel@chromium.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Tony Lindgren <tony@atomide.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Timur Tabi <timur@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v9 8/8] serial: 8250: retain DMA resources when termination fails
Date: Tue,  3 Nov 2026 09:11:04 -0700
Message-ID: <20261103161104.2449407-8-rrangel@chromium.org>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
References: <20261102-submit-serial-8250-dma-cancel-v1-v9-0-9159caade148@gmail.com> <20261102-submit-serial-8250-dma-cancel-v1-v9-8-9159caade148@gmail.com>
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

Hi James,

Thanks for replacing the fixed 100 ms sleep with exponential backoff
(1 ms -> 1 s) and adding the initial/ongoing/recovery diagnostics in v9.

Following up on our v8 discussion regarding blocking in
serial8250_terminate_dma() versus non-blocking resource quarantine:

1. Why non-blocking quarantine cannot be done purely inside 8250_dma:
   I agree with your v8 reply and the updated commit message here that
   serial8250_release_dma() cannot simply return early while leaving
   serial_core to proceed with normal teardown:

   a) Immediately after serial8250_release_dma(up) returns in
      serial8250_do_shutdown() (8250_port.c:2474-2511, and similarly in
      omap_8250_shutdown() at 8250_omap.c:794-803), the 8250 driver itself
      clears the hardware FIFOs (serial8250_clear_fifos()), reads UART_RX,
      frees the IRQ (up->ops->release_irq(up)), and drops runtime PM
      (serial8250_rpm_put_tx(up) / serial8250_rpm_put(up)).
   b) In uart_tty_port_shutdown() (serial_core.c:1841-1853), immediately
      after uart_port_shutdown(port) returns, serial_core unconditionally
      calls uart_free_xmit_buf(port) (line 1850) — freeing the page that
      dma->tx_addr is still DMA-mapped to — and powers down the UART via
      uart_change_pm(state, UART_PM_STATE_OFF) (line 1852). Likewise,
      uart_suspend_port() (serial_core.c:2502-2514) calls ops->shutdown(uport)
      (line 2502) and unconditionally sets UART_PM_STATE_OFF (line 2512).
   c) Even if startup() returns -EIO on reopen when DMA is still active,
      uart_port_startup() (serial_core.c:422-423) has:
        if (retval && capable(CAP_SYS_ADMIN))
                return 1;
      which causes uart_port_activate() (serial_core.c:2060-2062) to set
      tty_port_set_active(port, true) with tty_port_initialized(port) == false
      and allows root open() (serial_core.c:2040-2042) to succeed (0). From
      that state, ioctl(TIOCSSERIAL) -> uart_set_info() (serial_core.c:1068)
      -> uart_shutdown() (serial_core.c:466-511, which calls
      uart_free_xmit_buf() at line 510 outside if (tty_port_initialized))
      or uart_hangup() (serial_core.c:1942-1950) or uart_change_port() ->
      release_port() (serial_core.c:932-933, 1072) can free the TX buffer,
      power down the UART, and release MMIO mappings while DMA is active.

   We modeled these cross-layer paths in Serial8250TxDmaV8.tla
   (QuarantineGuardsShutdown, QuarantineGuardsAdminOpen, and
   NoDmaOnPoweredOffUart in Serial8250TxDmaV8_UnguardedQuarantineHazard.cfg
   and Serial8250TxDmaV8_AdminReopenQuarantineHazard.cfg vs.
   Serial8250TxDmaV8_TerminateRetryHang_Fixed.cfg, alongside
   Serial8250TxDmaV8_QuarantinePioReopenHazard.cfg at
   https://github.com/ismell/linux-8250-dma-tla), and TLC confirms that
   quarantine without those serial_core and PM guards violates
   NoDmaOnPoweredOffUart / NoConcurrentFifoAccess (in 6 states) and
   NoUsersAtFree (in 7 states). Given that enforcing non-blocking quarantine
   requires coordinated changes across serial_core.c, runtime PM, and 8250
   shutdown, addressing non-blocking quarantine in a separate follow-up
   series and documenting the limitation here makes sense.

2. What in-tree DMAengine providers actually return from terminate_all:
   For context on when the retry loop in serial8250_terminate_dma() can
   trigger, I audited all 78 .device_terminate_all implementations in
   drivers/dma/:
   - 64 out of 78 unconditionally return 0.
   - Among DMA controllers used with 8250 UARTs, synchronous FIFO-draining
     drivers (drivers/dma/dw/core.c dwc_chan_pause ~40 us,
     drivers/dma/idma64.c idma64_chan_deactivate ~100 us) already poll in
     microseconds inside terminate_all and return 0.
   - The only 8250-paired DMA controllers that can return non-zero are:
     * drivers/dma/tegra186-gpc-dma.c (tegra_dma_terminate_all, lines
       714-743), which already polls readl_relaxed_poll_timeout_atomic()
       for up to 5000 us (5 ms) in tegra_dma_stop_client() / tegra_dma_pause()
       / tegra_dma_pause_noerr() (lines 389-414, 676-712) before returning
       -ETIMEDOUT; and
     * drivers/dma/at_xdmac.c (at_xdmac_device_terminate_all, lines
       1999-2039), which only returns < 0 if pm_runtime_resume_and_get()
       fails.
     (Even across all 14 non-zero .device_terminate_all implementations in
     drivers/dma/, the only one designed around a caller retry loop is
     cppi41_stop_chan() -> cppi41_tear_down_chan() in drivers/dma/ti/cppi41.c:
     652-770, which is a USB MUSB controller used only by musb_cppi41.c.)

Thanks,
Raul
