Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792741024;
	b=39qfuc9J+LrcpB9NB1QOkfvhJddfVaxZT7X6nQfMm6tNVbhMr02p1gdsiMmUA7SDERyA
	 hG8/H3BkjDgtFSYj/5cTZJctiumkDk/w9Y/DhfHULgkhOIc70LIHFMuu2fpHAdt3PK/0M
	 uTKp9eyfqeOkJU+YTF8Lzp5PY4yToQFqLWdZ0YuMsm51TDhlzPW6YQtec6ktlCMGZjxGA
	 AfMlE7dNdPwNQrPkgIh5jlFL9Pz0CkRtaJ9HNsmw5/VW7E6NuPAbzKibt1C8yi/6CGi+6
	 iY98QkuNplwYEodb2++GkAcwRAilCUS175cdsOKbKA/q/15emVRxJAat/NK0QxABqlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792741024;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DFhQB0C6W4UMQVrCTGvRQTDSz4KQqMvAjwkuZrCo8jM=;
	b=fK061Yg7KvQBL3iUmxSZEQ/8rVYdPiLLNxO0QrW73qTtuVMSSIoZY+xQ/QEpkuYDVjpU
	 PuV9+iebIwMyhVNyq0NIwJqJC7j5kwi9d6tp84L9bQN/jITSVDNzuzSLjTZI64NdXc3ZX
	 kl/epc1U0lZ+OrdG0WLJNZuVyaWfGCtmOw8Y+L6QOSaT7Pk9xokMhY3pzLqHU28a5o+Gd
	 g5CY/NTNxX+GUZF1pfpXb7V/GeY7J5rprLmwzFthGuM8wx0iK/P5/deDzOofoZBVIuWd/
	 ETZ2R9L7RidRb1VMxuSEpo5f5TZjBYHLxujXHu4F7dQ1ONBbergFMtQRSSAccir6YAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKCYtHy6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C7606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dKCYtHy6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E67BA1F01828;
	Fri, 23 Oct 2026 07:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792741023;
	bh=DFhQB0C6W4UMQVrCTGvRQTDSz4KQqMvAjwkuZrCo8jM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dKCYtHy67kM3hl9R5JxcyTct42m7rQGaAByrJxDDMTPTfs3lnp6vhtWaGJLwURK2y
	 r2Rk2nagiOfKpti/iWTQeSxLW8E0YxTj8ohBLOM8shNpc4KllyGLvwhSXZtT8BLM48
	 SFE8/aWVfCLgqeRHIR5o7Gpy5eMmJsU3sKoCahw8ghyU54iJiuVuxgW6lweAx8LULp
	 RnbUKomYNDBA0LeFU0zYC3JCybrV+ZDJOkx2tb9ahAbKSNyAwD0S10ZVl5Es8Z/eM9
	 d11ltyuuUiRhHAfrEl9vX3Wp6eusG9CqhT9wEo3giE/fREgPoZ3XGjskpQE/w880tQ
	 nf3rEcgUiPg2w==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xK9pl-00000000UGL-1kyl;
	Fri, 23 Oct 2026 09:37:01 +0200
Date: Fri, 23 Oct 2026 09:37:01 +0200
From: Johan Hovold <johan@kernel.org>
To: bryan.odonoghue@linaro.org
Cc: bod@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Amend Bryan O'Donoghue greybus email
Message-ID: <atsOnVI10aWoH2Ap@hovoldconsulting.com>
References: <20261023022913.3763777-1-bod@kernel.org>
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
In-Reply-To: <20261023022913.3763777-1-bod@kernel.org>

On Fri, Oct 23, 2026 at 03:29:13AM +0100, Bryan O'Donoghue wrote:
> From: Bryan O'Donoghue <bod@kernel.org>
> 
> Remove old email address and convert to current kernel.org address.
> 
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---

You sent this one twice, doesn't look like there were any changes beyond
the email headers, but let's go with the last one.

Best to add a [PATCH RESEND] or [PATCH v2] prefix with a short comment
or changelog explaining why so it's clear which patch should be picked
up.

Anyway:

Acked-by: Johan Hovold <johan@kernel.org>
