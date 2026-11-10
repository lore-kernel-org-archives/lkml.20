Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794340362;
	b=q8ojJcNr4sufrxrVnjwHzSTuketOPJ5m6LMXDeJRO0p8Z3dRjG4x4Z1GNVOoYshokxyh
	 eZmX3aOC+pPT4xDZ3iDIbZhKfBDU/IvZNIvqIw8Jj8kTJRVjRc8hfufBpmXbfcZZrNfqo
	 Em+tx/QWde3z4KRcrNBZA5ihkfJIELOHbn7uELkPjHi3fW/KEtVRKkwGWtVpaGS4o4Co4
	 UXrub90GI+5ChsHNiPPNhhPdOjFP2LII+22+1G+rcFa2RKJiiW0z7XJZ37H9xH0Zmi0Ov
	 FEG8mW2M70XwZ6z0VCJJEzAgrSwjVNpYcOC4n6Rw7bkK8UnQmi+R/5erydaux4liwgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794340362;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RKUUofW8j2AR2GX0hv0aDz1CJiwtMVz69tWw+0ZRcQo=;
	b=a9VN/F5O/X1loSAC/6b/91fWGYrYFvs8crKnGTECFIfi5SAbouMUr4ulPq5JkMnk1oLC
	 8FrP791mpmAHplPt47vC/6f6iXTaetm4BuQAUSEbw/qK8f2NuGEsfMQo9moWGyy14Xa37
	 yvzwTV63CBERXMBallJA4IwOsQJKWb7nsQd7bVFVCH/qT120UHDxRfdbbuSlNXdt1IhV3
	 B25b9voLvI7mtCFKb4ODCRJoor3lWHaOpIadfoa1qhv2tVzKDQSTwt3AuvHuuw+wXJJBp
	 y0gagala1S+BgXGNwLpIQSiLvLr/yghKBTucLyFw4aR61qTSFBPpC3CY9twLdRAoBIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=YKCrHoAg;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685AB606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 685AB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=YKCrHoAg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=RKUU
	ofW8j2AR2GX0hv0aDz1CJiwtMVz69tWw+0ZRcQo=; b=YKCrHoAgQ5G/IRl31aGl
	Cgk5l5DMsgewrd+DbCHkQcvHPq5KO9se4g3c0KhErCU2I0GfMZh6FlX5UKGrYLcs
	26w0t/QxoTuUYd9ASRC7Ap0bCP/gUFABb1m/y9p14vmeiqDzDSi4D0FMxYmp3yeW
	Uaan6PrN3gV2K/d4JxhnsL8PO26mnL+IJYe4y3VjGRNk6+qLQcuP65M0gUKkZO1e
	wwUlsrX+xok4ki48Xp0IhH+zVFQUBp5Zq8I4i8s9NcdycLn2oRoXoXv3pJNXuFKO
	1WKYgUZRwbBRVRbccVJAUdyiCkc7di3mgh5x+ySN1Y3vOrKVBN8vgDLnYVLpmpvO
	+A==
Received: (qmail 349063 invoked from network); 10 Nov 2026 20:52:37 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Nov 2026 20:52:37 +0100
X-UD-Smtp-Session: l3s3148p1@rSSaa/FfepsujnsO
Date: Tue, 10 Nov 2026 20:52:34 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Dmitry Guzman <Dmitry.Guzman@mobileye.com>
Cc: Linus Walleij <linusw@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: nomadik: handle pm_runtime errors
Message-ID: <avN2AtdSzB6I40Jl@shikoro>
References: <20261110-i2c-nomadik-handle-pm_errors-v1-1-ea1ac92af8f4@mobileye.com>
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
In-Reply-To: <20261110-i2c-nomadik-handle-pm_errors-v1-1-ea1ac92af8f4@mobileye.com>

On Tue, Nov 10, 2026 at 03:06:16PM +0200, Dmitry Guzman wrote:
> In nmk_i2c_xfer(), pm_runtime_get_sync() is called on start and then
> the controller registers are accessed without checking the return value.
> If pm_runtime_get_sync() fails, access to the register of the device that
> was not correctly powered on may cause a bus fault or other unpredictable
> system behavior.
> 
> Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() that
> always return 0 on success and automatically restores PM usage counter
> on failure, and return immediately if it returns any error.
> 
> Signed-off-by: Dmitry Guzman <Dmitry.Guzman@mobileye.com>

Applied to my for-andi branch, thanks!

