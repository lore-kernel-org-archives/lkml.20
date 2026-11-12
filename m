Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794526320;
	b=INygqVMXp9mxh34Hh/L6bkT0nAVJGQJVYrDIBOzPUROcp9IHldhcIBW/7hlTcNwzh60q
	 JdZ5nB9C+voc80zYBz3se1pYDKuOxen0VoQGytDE9AWH9XHhWCskIa3T3wmUTLwvxslX5
	 a2Su85FdZU12e+TWPV/c/FpGwmYCrWAUOIvjJ0y/aqtEVc+B+jKw6n36jdVi6Nz9FkEt3
	 POfn8BEWkW1A+nL5XMOAhOf1otf1VcqRFkjimqqvEsDuds27OQ5BkjsfN+FPyymbl1B4s
	 NnTvVGmQF1DHvX6R7JpizbRYNkk3AGC7Y615brvkqpDCh6mcQBwp84jFgf8snSU204A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794526320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
	b=AU2had7rVYGefzUfhT1Zw4pyq00Wak2HCg6LvQKED7KEE2LmI008aV8SPSVaq61WNmxc
	 WTNHzqcOJItzlgnCObCrdWs1CubEr8yMheu6EXbOtSNeHSYYwpz/8KVIoyChOyeUi6i4r
	 GKb+rJr9ONtuepeeAUCTHHH2J+hOgXwcGsFjgijYb8/V4kBK+KZ4y6c/BgZITR1EFVwKU
	 xF62tQQXQGz8EdF/s7SSiSnrInM30wO1nwHvtDvJKrWVKxD8rFf3l5995gI9rmfKk1MJO
	 rPSCY0+rBBStySS54AUZAlx0fgagDorZYw+RJiKbvAAJNhWXDi14W66LhYMz/vlQxsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzWPUERq;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC4B606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 23:31:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DC4B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VzWPUERq
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8b58d6f67a5so167907b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:31:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794526318; x=1795131118; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
        b=VzWPUERqqSmQqQM5hDEsdSFki9n/UIur1VKToOCJ+u7iNAsnJjDwlsAXYeJLLJNrIC
         DRBtJ9rMTryt7Mjghelz7Vtc0JMaAAG/tOICpWH6hEIGIb3nQN7QjgDRo/z1hKg4VeWe
         8xSl1upKsD0Cn9UV1DMYg088MTCGOgpC8pQsxVQ1rZM+Dzzftddx07AoAobG2ki5Qy4p
         DUNVzKWZO/uCmXmZdr/mOrxgJcCFozcNCSHKAKN6+Q4GHfXDTYXp8whxShRhLWt/3IPp
         T09dgztMTHpowzzy9ZH/UlDTtAhXo9SGPilZraGS1Sp3RVlG24Z1EvoTJGKVX3UUyNfO
         rpwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794526318; x=1795131118;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kMzA7RdrHgK7flc6um3AlTABD686DqJETvpWPCal8Zw=;
        b=exLrOTg4nQoqu9lvcJfVZVAYmysE90K9JfF3RyBx7uysN8FE50jNgdU3xV9y3vCkq9
         C72oJrO1pdtGfI0W7YQjVduL3i8k0etAFE2yV8GJ7GDw1H3S/yBOWol9EpAwHt6fDAXy
         M1R4ny0refRh8o4o3xca1PgI9TXv7fQ3Exb7HRRvni5ePgdrT/mihNfecgUijzxqQ5Qk
         nCmMXOkTwlFrRqKUHsqUDycLr8DL/Fd+AP4zpxLggl1hYpVR1mtKzHVtzcmgMRR6mEt4
         zsRHNo+FVszGtKFiq2EitbfZMrYKKfEeU9ad4UwGYdOo6d1TnbBTO+MCFzhTfys3xs0U
         x8vg==
X-Forwarded-Encrypted: i=1; AL+hErGXyDejLsurwLjL48djf4NX8+cTxZzyQ5sb5u2zIPM5I9tO5fmOH1JOF9ysb8OdADIOYWtAw580U82LP84=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KqU2n9DqW45BimC/+Ljk1rGXt0oX49EX2RrD88VKLrY9g23To
	aVNEnabeLecTSTT5klGZoyjUdI0lroPppClIhzzSVLK9CZJgIt+SrSys
X-Gm-Gg: AYBFou2n13tUnOdIRTI3JD/Woms2ESqGMHR+D8GMid7kL0O6q8Mh5QGiUAhnMc+fr1a
	tUHF5pTpGSudQk8d7K7Zqgkcp1BxGHbHQZlBF/N7dm8VWkPesNSk0PAWXc4dt3KcOKHhVDqfgYX
	pKrIbwFb6Kdehcr/9qKa2yKtnKOz5TH45Rbf9ZcUEs0nuPATjSfIAS3jmBFSXNvyhXiF9KFlq0e
	fgeeS2vxE/B25Hb8gJ23A+oyX163kv3fbAjuX4nElp+e+3RxHHlfkeGNZOEOPLLmRyQnojBbByc
	ILYH5KK1YqfwZ4J0PADXo0Wf31jqlrd5Hbj05gNcA5TuLrjjl/Wkz3X1eBUPNIq7IXUY5wL+k+4
	1LhIZpF3cjJIYuErlLwSGkuO4ag98S1E/bvr9SFRXD9APhMZR5odp62uzitlQmmP9p6GUvVopbR
	mihoLYXLBh5umG+FfUDGyqp0iOQyrywXWC7IZazva2rkXhHxOM3sqNpwOwzgsr/Uak5YfpBPOh2
	rZF5CiLxD8FRInxYcppCcFsqLlfxzAqzA/vySsIoKM/lPxjdlPjgAfGjw3YeXaZOC3LpdeJy5ij
	tAXPUpNoG8JSpmsyJysS45jOyaHReYtUJTX3JVTE0syPBkm45QDFsS0i8broy2S9U5OHG0YYGzo
	cb77hTIkU8dNNUSzOuQSp5507JDak
X-Received: by 2002:a05:6a21:6f09:b0:3e8:b7fd:6265 with SMTP id adf61e73a8af0-3f7a72ba1d5mr589620637.23.1794526318165;
        Thu, 12 Nov 2026 15:31:58 -0800 (PST)
Received: from prox-debian13-dev.listerlab.win (203-96-142-148.dsl-dynamic.connections.net.nz. [203.96.142.148])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18adce4sm317815a12.23.2026.11.12.15.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 15:31:57 -0800 (PST)
Date: Fri, 13 Nov 2026 12:31:37 +1300
From: Patrick Lister <patrick.lister.dev@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Keith Packard <keithpac@amazon.com>,
	Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Nick Clifton <nickc@redhat.com>,
	Richard Earnshaw <richard.earnshaw@arm.com>,
	Ramana Radhakrishnan <ramanara@nvidia.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Message-ID: <avZMWY2UBFdBLrqW@prox-debian13-dev.listerlab.win>
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
 <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
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
In-Reply-To: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>

On Thu, Nov 12, 2026 at 08:58:53AM +0100, Arnd Bergmann wrote:
> The patch looks fine, and it's clearly harmless to merge as there
> are no users, so please add it to the patch tracker according to
> the instructions at https://www.arm.linux.org.uk/developer/patches/info.php

I have submitted patch 9527/1 as requested, thanks!
