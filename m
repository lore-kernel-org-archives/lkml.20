Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E704A0EEE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533698; cv=none; b=mOJ1Ccwl9hheW5BuZgMZu+niaVATf0zV0dlRzxlBfU5iqibW3MErGsk2Lw2PRS+UGEIdr/6ajVCsvZjIlI6eAWds6FedV0Ghe9D3b4YhkcRRfxAq752V99xL4spPWDwi1rINr/kK05COpVJWEiN5gmt5uR2z+G8SlkRXJzx1fo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533698; c=relaxed/simple;
	bh=tw3o8L/Ww5WvITfoCOwxS7zP9rGFEqpVzq93fHL+pzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6XKvy3/meoiqm1u/s6+6io/Xzdsgq5roG4pi7uExKqlmzzdjQuLu6LAhmNhYNxfzDjpjiVnAvmtaZNjRX3E05qZQulyb3x11BcNSi7DTBvttncKY5upQyik87UDhN6m8FNNrA0h8xim5GKWvJUURh1dUh8H8YLcmC/OPJcknUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D078rgMG; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D078rgMG"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c7c656b000so15404e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788533696; x=1789138496; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B46jY7pDsSOgAsSWPgzfJoCgRMQsU/kFbgxSGzI4vaY=;
        b=D078rgMGWa0t8wxmPdIzxiblXUSqTA4NC0gRZ/6WgPd/FSQQtzaxZPCYmxROXJg+A/
         +A4/eTggm6mpWOsdmUnFAZ7LEguk6quO6y9jXpzIaRPHsi2fTtnDZ1ZBxn3/g5kc5ugQ
         rTGgQxapIYf021/UGIEsN6anFgs7ak9Q0p/49KcunFPSLLnCGqdjw+LXfKE7toG6PE8z
         oAXxDPeDE7leNcD2RfM5E65WDrDQCHbmD/ZE5Qje7w2VTd5LmgVhZKP4ENI/bpw4luVx
         5YFyD3j9Ka5zRi3iTCVkSeX6Wqxqy8NUypyKdVNcaV4v2vn9APB430SzOn/osnoli1Fn
         O8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533696; x=1789138496;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B46jY7pDsSOgAsSWPgzfJoCgRMQsU/kFbgxSGzI4vaY=;
        b=anAwoRpo/zmY9pMx5iEgGjRU8cOG74r+deHThHNM8/pHYrtjOhCNkW48JwFp+/KNX0
         7MUhv1kibde2oyrs45HNL0z52ay+MXIbAUB+23MxiAa44I6vmTuar2UStxymVh9XHXYg
         cIhI0cjkYn0N6M9ndmhkM7jH1+lstBgQZDx6UOYNMCwJ6ld8DTeuytqcSI83oKbPCUIq
         HEuq9pUz40+Nf429IGR/om2Iom9muwiaiVisXAPR6LRUoz3cPnyAQAx6pf4uQIvDVOu0
         5WXL6dWu2J7XYi/5xg6FmwRRY/eCsjSQIEl2NavdP2nsj4FBcIunHpAx9kW+dOVKITQH
         BN6g==
X-Forwarded-Encrypted: i=1; AKwUvBzLzhPbWA8GHDa6ebzjLoEPwFpDWk/hgACgG59dVGGz3x6rCpreTzmT0Cd0GZNSsNeryp96qN/x5b+PUDM=@vger.kernel.org
X-Gm-Message-State: AFuF++nl/In92yhmBznToBz3IoeJJ3G1ZruVtCf9vle31aiJDKrxphNH
	JUa4yxldx4DYrAciMezoSqJiIoJHHDx3JR14OgTGmZ8X1kLcHb89Sakf
X-Gm-Gg: AYBFou0vDo16uvENcuQipQLsh/jhBMwmu5UTxqrX4HA/VXA4HQBvAssYBTRrTg454hM
	snmEU9IporKXEKqk8pLWYEKzdVHc67F/Ee2SErc/kahIalUKBlBPalPjFcoO/A3Mr36ZyIHyE6+
	dUf8ZMyerKN3w8gkB1htVAShHI6CUiSVpUMEZqtMmRUN+YDwZ9YYz3ayxdIy12HBju9C6CEIn6Y
	8zVgjY43sXt5lSm4Wx9zTkNb1XsMq2Pd7ys0NA110T2N3gbtmrAE0oYgxSp4Z9lGcbABQpw+NQ0
	Cg3LQ/Srn12QaTS8YpOeoD+JMhBOVP1jk6sXFRLEGW6EhDlgXZosVGaRy6a9RJxQMUJBa2FMiqX
	nblIR2x5uZUghWLyw3oQLjTv6Y6sdl/TQSG+bvqSEO9O8D+Ri9C6qlP1Gqm1RlDc9gqEAGSjDa9
	lJ12bjk579VZzcIjnFof0rLNBlxS5E+iZgWVZdMOl+cfuDf3kUkR1nCXEvrERj9PPOTcEI27DDg
	s0d
X-Received: by 2002:a05:6122:6844:10b0:5bd:9cbc:93c6 with SMTP id 71dfb90a1353d-5c7ed1037fdmr799052e0c.0.1788533695976;
        Fri, 04 Sep 2026 07:54:55 -0700 (PDT)
Received: from JSANTO12-L01.ad.analog.com ([191.23.4.35])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee1c0cdsm1742230241.8.2026.09.04.07.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:54:55 -0700 (PDT)
Date: Fri, 4 Sep 2026 11:54:49 -0300
From: Jonathan Santos <jonath4nns@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Santos <Jonathan.Santos@analog.com>,
	linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
	dlechner@baylibre.com, broonie@kernel.org, nuno.sa@analog.com,
	michael.hennerich@analog.com,
	Dennis Heinzel <dennis.heinzel@irs.systems>
Subject: Re: [PATCH] spi: axi-spi-engine: fix stale SYNC IRQ pending
Message-ID: <aprbuZJfgKkSVakJ@JSANTO12-L01.ad.analog.com>
References: <04d51e99b8cddce51113db933d806e83848f04f5.1788313558.git.Jonathan.Santos@analog.com>
 <apmFOKpncNJtrTF4@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apmFOKpncNJtrTF4@ashevche-desk.local>

On 09/03, Andy Shevchenko wrote:
> On Thu, Sep 03, 2026 at 10:49:22AM -0300, Jonathan Santos wrote:
> > spi_engine_setup() sends a SYNC(1) command and polls SYNC_ID to confirm
> > it was parsed by the FPGA, but never clears the corresponding interrupt
> > pending bit (INT_PENDING[SYNC]). When the first real SPI transfer starts
> > and INT_SYNC is enabled, that stale pending bit fires immediately, causing
> > the IRQ handler to see the leftover SYNC_ID from setup, match it against
> > the current transfer's ID, and prematurely signal completion before the
> > hardware finishes.
> > 
> > This race manifests at low SPI clock frequencies (~2-3 MHz), where the
> > FPGA takes long enough to execute the transfer that handler is parsed
> > before it finishes. At higher SCLK rates the transfer completes fast
> > enough that the issue is masked.
> > 
> > Fix this by clearing INT_PENDING[SYNC] after the polled SYNC, ensuring no
> > stale interrupt is left pending.
> > 
> > Reported-by: Dennis Heinzel <dennis.heinzel@irs.systems>
> > Link: https://ez.analog.com/linux-software-drivers/f/q-a/604145/axi-spi-engine-stale-sync-pending-can-complete-first-transfer-early-at-low-spi-clock-2-3-mhz
> 
> We have a Closes tag.
> 
> > Signed-off-by: Jonathan Santos <Jonathan.Santos@analog.com>
> 
> ...
> 
> > +	ret = readl_relaxed_poll_timeout(spi_engine->base + SPI_ENGINE_REG_SYNC_ID,
> > +					 reg, reg == 1, 1, 1000);
> 
> While at it I would replace 1000 with 1 * USEC_PER_MSEC
> 
> > +	/* Clear the stale SYNC pending bit so it doesn't fire when the IRQ is later enabled */
> > +	writel_relaxed(SPI_ENGINE_INT_SYNC, spi_engine->base + SPI_ENGINE_REG_INT_PENDING);
> 
> In both cases? Error (timeout) and not?
> 

The error (timeout) indicates the SYNC command was not parsed within the
deadline, but it can be executed at any time. We consider the timeout big
enough, so this is unlikely to happen. But in any case, the cpu command to
clear INT_PENDING is harmeless and can still clear the interrupt if the 
SYNC is done parsing until right before this command is executed.

> > +	return ret;
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
