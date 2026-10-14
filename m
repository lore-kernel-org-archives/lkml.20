Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F351DDC38;
	Wed, 14 Oct 2026 07:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791962266; cv=none; b=aPiryETRQgoFyAUT0U0SefaoUW6ZUCo7fx07LIz80mv2p04fS5V3fOGxW3+9fFx/uk0JEit0+QOzNKI7QobGEuO4/YTcd2VttYZb1qAx3qNcOV0ngWcWgANZ5xzv9njeOER8BnCy1KOTGhiDnXA2CJHQevO/TPBolxjiyUElyTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791962266; c=relaxed/simple;
	bh=6zpYtx3G2rzwccr78vcQoPkmPD0amksoVlX8ftszzx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VITpeTtD0jp3BySLiwwXgWNDmzUZdd9G40GAoP5UDQTv9SLaCRQDmlmni7nsPWqvNjyHsfpE3wiE+EcS8C/vFtFtNsqqPgLblUOHSUgFXUCnJbg6SzTzcLwLSgMBsoNpZyl1/m4Rc3MwcdeKINDHenbUxJc2ewR1asaXOq21WC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/dGh03M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/dGh03M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF401F000FF;
	Wed, 14 Oct 2026 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791962264;
	bh=slhYDV5E8DG3ZqMUltEp7BoCNOtrZZZtBRijGupRW2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/dGh03MptIUTLpyLyYVy7y8nXFkCo/DHETU5Lx2rOlhT9Atkl0enW1TAv8WvMteu
	 j42kmTdipvDGcsnCrnXxU3NHtu5uYqcl0DPAW84tyaSg3VKyjyq3x/GIdO/wpjyOYd
	 7ZEeNpDO+dXGT76G02VJZ6zjWjXlOe0pZkeydKyEz1yJmglK3uDiES1bG6f9amz9o+
	 ehbewsSz2fgVbnJ8CMdsCTzXNPMdLJv3+ppJ7cLHnVCT0WwqFajnXD9KYxImGSkNz+
	 EByH+flt9SThHaKCaHsxSEfHH1s6HMO+Fp/S1m6d8v6vjHlOB09ZZccDNTwA631LP2
	 ob606sCanOdsQ==
Date: Wed, 14 Oct 2026 07:17:42 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Scott Collyer <scollyer@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec: trigger kernel_restart on
 EC_HOST_EVENT_PANIC
Message-ID: <as8slqeTjJYWOlaa@google.com>
References: <20261008172208.1139281-1-scollyer@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008172208.1139281-1-scollyer@google.com>

On Thu, Oct 08, 2026 at 10:22:08AM -0700, Scott Collyer wrote:
> When an attached EC or ISH device reports an EC_HOST_EVENT_PANIC host
> event, the EC/ISH subsystem has encountered a fatal exception.
> 
> Handle the EC_HOST_EVENT_PANIC event by:
> 1. Logging an emergency message (dev_emerg) with the device name.
> 2. Calling the panic notifier chain (panic_notifier).
> 3. Emitting a uevent (ERROR=PANIC) to userspace.
> 4. Triggering kernel_restart("CrOS EC Panic") to cleanly restart the AP
>    so that panic logs are preserved and collected by crash reporting
>    services across reboot.

If the EC crashed, wouldn't the AP be reset anyway?
