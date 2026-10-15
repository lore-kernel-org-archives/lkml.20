Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEA451DDE5;
	Thu, 15 Oct 2026 12:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792066496; cv=none; b=ZifLDheDKquZLHIpD2YoTMRtKnFAOKVNCncyPVK0uXv5jwmEINm9AXxQBGU/me516s7ik4/ip/1oAxuzw3sx/bJMOPnRONzScJsVlVDOtpEa1DkeF8MHLWUXrNtG86Z1CgCIBtLlJbwO3EK++1MzLhRzC6MNNvytDzKfKXL1t28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792066496; c=relaxed/simple;
	bh=aVMOjs4CGisNH9eAdkQ2/laJ7oHlj88qJKVyEMJh4Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNBRahxiE51M1TlUcBOB2D+tp394fBKTH1cE4uYkCdzb5kMn0VJUKBkw43jnu0rBIcZg8dfHcY6P4uG5Z9eq+zomAaKCMP7HX/c8T4lyMgXyYvTkBar5evhjj5m5juWtIKztwTxQRaBXny5ECENwUvYpZhtYqcVlyHC0Nyxmki0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJRKWoOY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJRKWoOY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749651F000C4;
	Thu, 15 Oct 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792066493;
	bh=8aBnZHe5U3Z4S1mXZepQK3qSyEwU8Dek27RXv7bBvBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eJRKWoOY8xbwqJk8VXjr7512Ox2SXp9BN4kdk8DKS50TlW1QqcoiEVoMQ4K3RrF+E
	 ZATDde0agnZg58TDk0dCjjPq9MmzHUjRg8UbU9hDGwS0Kgy9MDrbRkurwceMWF8goj
	 dOEvytZUuVr3lpy+scCvTdhWtyjTyY/16XsmfUeXTj/bhcwBtKDGzA26U9ZIz9tfDa
	 b44ZoAhW2PyK2m2f6sK6Yt/HOMMWmgfGmASODb0IQkjmAH8MHd9zj1mbwDWKDHlwU8
	 paEL+ZfQmsPDadfwe+lJ/EsrVrHpVPe8QlQFe3CTW0MDWAw6NPAKom9EH8L7a2WtbL
	 5lAB44rgJdxOw==
Date: Thu, 15 Oct 2026 12:14:50 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Jameson Thies <jthies@google.com>, Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] platform/chrome: cros_ec_typec: Reorder altmode
 registration
Message-ID: <atDDunhd_1mucOVh@google.com>
References: <20261008134056.3816556-1-akuchynski@chromium.org>
 <20261008134056.3816556-3-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008134056.3816556-3-akuchynski@chromium.org>

On Thu, Oct 08, 2026 at 01:40:56PM +0000, Andrei Kuchynski wrote:
> @@ -406,17 +406,6 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  	struct typec_altmode_desc desc;
>  	struct typec_altmode *amode;
>  
> -	/* All PD capable CrOS devices are assumed to support DP altmode. */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid = USB_TYPEC_DP_SID;
> -	desc.mode = USB_TYPEC_DP_MODE;
> -	desc.vdo = DP_PORT_VDO;
> -	amode = cros_typec_register_displayport(port, &desc,
> -						typec->ap_driven_altmode);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
> -
>  	/*
>  	 * Register TBT compatibility alt mode. The EC will not enter the mode
>  	 * if it doesn't support it and it will not enter automatically by
> @@ -433,6 +422,17 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>  		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
>  	}
>  
> +	/* All PD capable CrOS devices are assumed to support DP altmode. */
> +	memset(&desc, 0, sizeof(desc));
> +	desc.svid = USB_TYPEC_DP_SID;
> +	desc.mode = USB_TYPEC_DP_MODE;
> +	desc.vdo = DP_PORT_VDO;
> +	amode = cros_typec_register_displayport(port, &desc,
> +						typec->ap_driven_altmode);
> +	if (IS_ERR(amode))
> +		return PTR_ERR(amode);
> +	port->port_altmode[CROS_EC_ALTMODE_DP] = amode;
> +

It deserves a code comment to note that the registration order dictates
the priorities.
