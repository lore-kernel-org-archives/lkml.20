Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793591128;
	b=mm+fm2zgVPH+BY0+EndBhH8n0BHaMRlKufgPe3eplNpXaQGbD5DHf3HzKQ+t+kKgBiec
	 D/N0mVkSvzQmkqzKgQQIocXZHWmXLuFolqQqI0NrItPGR5cz2Mjn9W5UCmoBDfV8umFFf
	 vQAMWz/BRbRuzz5JpHzJhx6h+fM6WMbAnhNZpii4uHvgxX1zJU+kKK57r9qqYBiajx6AG
	 87z0OV8TokJoRM3o5m6zTL/7XeWjhcfSMTPwomD+iQB8xUhCSRuYgLRh3Ey8e6DVVYsRq
	 0RUrATnjU0ExlShRKiRyRSW6r6ddofI1jhAOiZX5erMHouZ87omheqtO4VPFX0c0QSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793591128;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=RgCAL1P+hSJExWchHGlbCd4ap6qoEeqYnmHJfxat3l8=;
	b=ZfvWAv/PXR52jZF4jui/w25cHrpgXM7gLstafdJxILUaHnBLj4PUuCbZ6fKJS5ZcBX0V
	 bIj1w09vYxfrDoie7W4I3t3qwqgarSNJUxBRdw1rw4TsY/xDPqmUKjdAvSHPom2vcVHhi
	 jyOIesQkjYX+rWU59+BQg1D8sArdjYgF1SJVJeFD7MxMrPy17rSFWbmTgLPDRKABORHPu
	 E3XkzEMWy08FqHzE/UtcLDcsWyUYDOxpt/u0qOR0K2iAv7FjsRb+6FVNlKK/XWJoyFyoL
	 +yIlMkbkzt7sNDrWH9p5uX6fGMtV0TBgNOfzsAvf1zGs3YYBfa8Yz+TX9mM/JSv6p/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVb5YEGq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33BE9606A327;
	Mon,  2 Nov 2026 03:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVb5YEGq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A3C1F0093A;
	Mon,  2 Nov 2026 03:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793591127;
	bh=RgCAL1P+hSJExWchHGlbCd4ap6qoEeqYnmHJfxat3l8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LVb5YEGqyOCpwHX+DPlO7ym1mPn88dOBbBfz6dgQlyictpeNyjtM48iY9O84aVCei
	 OpitKRMxq9IL2qBofn+AI+q1eBYjc8F0a0lwt0Rf8tSuzy/K0TVjBb3aPo54D85N5S
	 E34Ji4xi5z8pe88oYkdRzj+jTIh4uaA0gKPVt4/fq9rWIhrZCJoNLSfdZem3MvDya6
	 pUMb2HuNLO5l0aoC+jQRCcM6L5ib/PQ2WlMwjFYJK4KrV/3I37lc43Vvhyrla5U0W0
	 wQrdkE4cV749KMjWagAQEakMEzWaXpANLlsww87j/ZZDrf3GRwWdmrTcZS6BDVHzeD
	 Nm5hr71LVwHMg==
Date: Mon, 2 Nov 2026 03:45:25 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Scott Collyer <scollyer@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] platform/chrome: cros_ec_ishtp: report
 EC_HOST_EVENT_PANIC to userspace
Message-ID: <augHVen3nJmV9e1w@google.com>
References: <20261029203008.419808-1-scollyer@google.com>
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
In-Reply-To: <20261029203008.419808-1-scollyer@google.com>

On Thu, Oct 29, 2026 at 01:30:08PM -0700, Scott Collyer wrote:
> When the ISH firmware encounters a fatal exception, it resets and sends
> EC_HOST_EVENT_PANIC over the ISHTP MKBP channel. Register an
> event_notifier callback in cros_ec_ishtp to log the panic, invoke the
> panic_notifier chain, and emit an ERROR=PANIC uevent so userspace crash
> collectors can capture the panic dump and handle recovery.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_ishtp: report EC_HOST_EVENT_PANIC to userspace
      commit: 1236473139859a9b64f20404d9c0388930415cbb

Thanks!
