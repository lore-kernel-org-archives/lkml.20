Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93778302CC1;
	Mon, 31 Aug 2026 21:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211908; cv=none; b=T3gGud+djERGi9vgc26Tstig+Ag0iSfvLseJLV/5/L8AS5wcktps2FFJaTx7yLQkAsHBDE8UG3S6W/bQiK3rT6piPULnYUmFyzpd7DTXsSVcrXVNEo8HA0FjKCGNV7wG/vdqDoQNV++6oRA6do8VugouSw8tsz0KhxcQ9nMYyvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211908; c=relaxed/simple;
	bh=ltErsniDkrAHSZLzbLO7X8FYihZrbYHXAcudIyNkAG4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qThK7CM70mJXxZnbHO4IPddjuC6GYTXP6tgCkmfYYEBQA1EDrxJjqyp8PobqCQ0PPb23DlysKHFvu9hTZQmpk+XT1LOiXvjMW+U4uy3AzSR3Mp85AkoeDCWgLdq7wnXGz9rBOf5cv7YDiG6OnNAfUGu7mZDDvk2CaI62aoHO/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=D49vVP6n; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="D49vVP6n"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C6583408DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788211907; bh=vbq8Wp95Fq041TDiD24cQfSQ2ScW6Hknpvb0WJhr/1Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=D49vVP6nr1D3+74TMXM/bmHXpG9btEYtk9stFxdgkmwafvAtcYTPrl8gR9LhODeC8
	 IHin7ED6bvJSFwGkxS/hBNz6lEZNaOAUgzdyvtohaaPjtZRHyMZfTaeMC3fR2Tyb/b
	 avdKaLD7ORrTkUQCZ3loCZG3VTkULgOdeDKaEQ68Zh31FhH7L3NoxS5JAqBh7xttgj
	 pfBudHveQ59L/hdZ386ENAHcPrFha8UDP6HWr18fDetXsELtNQs1yVSCwBxEe37MjO
	 1bgEceRv5ZpuKuUlVaJ1mg1w/Irni+fzK16ApgI9QZBGdikqZ8FD6m+utK18jBsizb
	 Ridw0NYTlle6Q==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C6583408DB;
	Mon, 31 Aug 2026 21:31:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Karl Mehltretter <kmehltretter@gmail.com>, Sudip Mukherjee
 <sudipm.mukherjee@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-parport@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: parport: Fix FIFO Kconfig symbol
In-Reply-To: <20260822082248.89651-1-kmehltretter@gmail.com>
References: <20260822082248.89651-1-kmehltretter@gmail.com>
Date: Mon, 31 Aug 2026 15:31:45 -0600
Message-ID: <87ecfegeny.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Karl Mehltretter <kmehltretter@gmail.com> writes:

> The ReST conversion shortened CONFIG_PARPORT_PC_FIFO to the nonexistent
> CONFIG_FIFO symbol. Restore the full name.
>
> Fixes: e095f0711b49 ("Documentation/parport.txt: convert to ReST markup")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/admin-guide/parport.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/parport.rst b/Documentation/admin-guide/parport.rst
> index ad3f9b8a11e19..4aef45262bd49 100644
> --- a/Documentation/admin-guide/parport.rst
> +++ b/Documentation/admin-guide/parport.rst
> @@ -273,7 +273,7 @@ If that works fine, try with ``io=0x378 irq=7`` (adjust for your
>  hardware), to make it use interrupt-driven in-software protocol.
>  
>  If **that** works fine, then one of the hardware modes isn't working
> -right.  Enable ``CONFIG_FIFO`` (no, it isn't a module option,
> +right.  Enable ``CONFIG_PARPORT_PC_FIFO`` (no, it isn't a module option,
>  and yes, it should be), set the port to ECP mode in the BIOS and note

Applied, thanks.

jon
