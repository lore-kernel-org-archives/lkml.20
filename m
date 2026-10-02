Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A92AA13D891;
	Fri,  2 Oct 2026 02:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790907458; cv=none; b=HMgG89aTGFZQHuPpq/puP9U8N8lfNt59eBjd+Efvw/xtte7qKY+SjqXaA6sdzARrIwaBwMS81b+IEvJbyjEEkrvJEzIdPa/vfJADwT0+gZZQc0HQAYjlJjUO5cTgOf4ag3yHg1eKvwdhSbOMv5tGzZHxW6hj1ygP9KS4PvYD44M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790907458; c=relaxed/simple;
	bh=BxBKQ4zR4si28azbG7lLcYi21TZ/U0gmLMVd5yf4ss4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWvjJt0h8A40K0htOhS9D3KPpmjPbEywGSYc9OqS+FGmrAy2PfbruX1AbRyU1v5W8wUUMa6xdz7dYxzvVW7WSksAsP0o0ipKq8UBgHEsDfMVYOJ+FEWJc2Pu/6Bg7LSiGrQn/5aKWGP34T1X5ZohSLpSe7IPpZ+OfUkkiN+Logo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7UjAU0P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7UjAU0P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61D21F000FF;
	Fri,  2 Oct 2026 02:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790907457;
	bh=CIXW8qeLMUotVtJxGO90+62jZTDUQzb32ePEitFVgbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O7UjAU0Pgu8KP0W27oNv6PuQ7i7We+7+FS0VGNlFquXJRcsYCGpDoStfcVF/Tp3y7
	 rNpitejhoPrHbkv2TgTI/3c30Bhnuwnt/+GFcZNyPV0ZtulQHpQ/vZAGS93zU4dMaK
	 yoCzUYaa5FrH2SHyzYGPwDuUmkpAvsVqqR3ox7pjUscykCKDK/hTYJ1vDsd+Ic4xLW
	 gJv824hnr0fd+iaoUp2S4uyPJwRApl2JLVmIG4/ftdx8zu1nTUiPdDYFOa4lJNKaZ5
	 3jHwO+4HYStu+LgJOnd1wpy3mz4/l4OaktFXOQ0J6BWsE0n2eGVmq9SzCHV1nLsVfp
	 ukL9Ifl0Q9BlA==
Date: Fri, 2 Oct 2026 02:17:33 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Bartosz Szpila <bszpila@google.com>
Cc: bleung@chromium.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Validate SVID and mode
 counts in discovery data
Message-ID: <ar8UPQ4NBsW55h1m@google.com>
References: <20261001085714.1086242-1-bszpila@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001085714.1086242-1-bszpila@google.com>

On Thu, Oct 01, 2026 at 08:57:13AM +0000, Bartosz Szpila wrote:
> cros_typec_register_altmodes() iterates over sop_disc->svid_count and
> sop_disc->svids[i].mode_count from the EC_CMD_TYPEC_DISCOVERY response
> without validating their bounds.
> 
> port->disc_data is allocated as a buffer of EC_PROTO2_MAX_RESPONSE_SIZE
> bytes, and each SVID entry contains a fixed mode_vdo[6] array. If the EC
> returns an out-of-bounds svid_count or mode_count, the loops read past
> the end of the mode_vdo array or the disc_data buffer.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec_typec: Validate SVID and mode counts in discovery data
      commit: 317e7abcaf60b79765dcf35c014edac8b9d37a6e

Thanks!
