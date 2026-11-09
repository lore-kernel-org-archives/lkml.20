Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794242268;
	b=3zuFijyzcem4OGiLz+TpFh/aBpojV4FpygfBdFmVrSD9FPvopz7NA/SxBo+HnRYq6ViM
	 FjYFMDABZ30zyob1ZztgtozsHxs39LdAV0LRC8BPaoZJ1RfPbFmGLKE4sk1tfR5VVaOCH
	 Db6Xy0LWIlWkcY9v2HL7Hp2Kn41/4E1O6YzfpWtzWkQnj9GKSpYacOyuU1t1uU4QxNmzA
	 55FiXXQJEzifVqaH1mer74PexLBUNLNv6+LuLMZkDFR7Kf0yhZeuhnCBGIq9Mga5GGY/K
	 C3T8ttt8Hm8JDnDJj6WAdngYpK3zTb1VQIUvdYqGT205AsnTnISatmL/jOlwt0npLfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794242268;
	h=DMARC-Filter:From:DKIM-Signature:DKIM-Signature:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=vzuJHK6qfwngsXYqxUduh/E9jVfSpa816Usp9RyPD00=;
	b=rqJrlGPqHSd4dJU+E1MdXRqqAAONVsjeZQ2PGjR4CWX2TZLA9zz7QvWrpspCImmIsqJG
	 KI++uMgKzm63dSfY06ei6MdfiXyt8v/ogw17cw2k/Ed0LfoFmI6ABCLK/XLxhJMuoCLqd
	 Si8g3Ad7pF1jC1BoXLqCJNV40r3sxrW5Qnx5N7o27Ta2TQJ8Xgb7nx/RnjXeM3Re2nPKa
	 2sa+McPflToaHAxr7mXt3bwJdF4d04W6XzoBN21cKaasAwcGNiueAB/s1BGhxtbDQb7GK
	 ELPh+/eVEz+ReE7gJsSZnznUMqgVIVhjRkikl/OYq+lqxOpeWTDC1nD+AXEHQ0zrGVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=M8V6YXW4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FxWslHAN;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB55160A5BC1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB55160A5BC1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=M8V6YXW4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FxWslHAN
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1794242265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzuJHK6qfwngsXYqxUduh/E9jVfSpa816Usp9RyPD00=;
	b=M8V6YXW4s+YsAlo8dho/Wh2mRneb3S9WuHUi2Qf+jQXUTH4hZnCx8L/Uyo6J5WGEgffxWz
	K6xTeWuwPE74T/LZ4ibTSkmT4prQyHgW3+eulvGGSvy7XiJmI7H64DrGYy102tn39KtvK4
	2I4L3TKWX0MvAZRvUXHPuqCFYh6RbAS8UfCBssda9tRRg4tvVAZnBHDArlFrlwKa1tJQcQ
	pFWXXZ+9jsC1d+iUk6rHaB2QoAAJB1mSX9RPlEypmdv8TZFBqABAG4OoWzBiTkQTlE+d9H
	G2HvdoaiyscYI5SCQ5WxcdAGiLEzFVtcWBloMNz2zoJWyU9sItYwy1J+WXgpKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1794242265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vzuJHK6qfwngsXYqxUduh/E9jVfSpa816Usp9RyPD00=;
	b=FxWslHANP2Nje3QGrbukCqZvDVgQytg7PR3Ug/ah5MWkegpgvtYIwppRAHRJyLUrk6lPAz
	U/UUQFLegahVpGAg==
To: fangsz <315539811@qq.com>, anna-maria@linutronix.de, frederic@kernel.org
Cc: linux-kernel@vger.kernel.org, richardcochran@gmail.com
Subject: Re: [PATCH] posix-clock: bind the device before the cdev is published
In-Reply-To: <tencent_D7A5991BA49FFDC9706385B0D2BED254EF06@qq.com>
References: <tencent_D7A5991BA49FFDC9706385B0D2BED254EF06@qq.com>
Date: Mon, 09 Nov 2026 17:37:44 +0100
Message-ID: <87bj7yufjb.ffs@fw13>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Oct 27 2026 at 01:18, fangsz wrote:
>
> The window is small, but it is hit in practice once a driver registers
> and unregisters the PTP clock repeatedly, for example on every link up
> and down, while ptp4l keeps reopening the node:
>
>   [   50.048138] eth0: registered PTP clock
>   [   50.767426] ptp4l: refcount_t: underflow; use-after-free.
>   [   55.735110] eth0: Link is Down
>   [   55.816736] eth0: registered PTP clock
>
> The ordering was introduced by a33121e5487b, which added the
> get_device()/put_device() pair around clk->dev but left the assignment
> at the end of posix_clock_register(). Bind clk->dev before the character
> device is published and clear it again when cdev_device_add() fails, so
> that an open() racing with the registration always finds a valid device
> to take a reference on.
>
> Fixes: a33121e5487b ("ptp: fix the race between the release of ptp_clock and cdev")
> Cc: stable@vger.kernel.org
> Signed-off-by: fangsz <315539811@qq.com>

'fagnsz ' does not qualify as a proper name identifying you. See
Documentation/process/

Also please analyze and address:

  https://sashiko.dev/#/patchset/tencent_D7A5991BA49FFDC9706385B0D2BED254EF06@qq.com

Thanks,

        tglx
