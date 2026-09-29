Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF872309EF4;
	Tue, 29 Sep 2026 09:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672561; cv=none; b=qDCOiYjiQXf28WkDBz7r8gd2pgPLQbSExD0zIfvcD/p6pIdQ85Eby0tNnruhyL6Y29svveyMBf9PHm/rEnTvCO9C9ls1GRF2D9DlTJIgIQVyN8UT9YlzDPP6CMXs3JAF/4yl+a88EHJbgC0bHdOnheM0CFE16mioZXdN++mS2u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672561; c=relaxed/simple;
	bh=RUzRsx3QL78miai6eHvYulrUuKI+eSUs62y5Jn47i4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wwiaa0BK0dpUQCdBW366rrdkyJdVTOcgQDlc+jrW7z5fT3U1GrSJfv6617/amN0uowMGr+4GsqxS2T2jW5W8rE9fbzaj4ke/hIdJURciW8usktnL48o5/1EGm51EGA6Mgv6bTUgIMi1Ogzjlr4LbZIfbUDewTDsC6wpkYcX50fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfyk+aiB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfyk+aiB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E91411F000FF;
	Tue, 29 Sep 2026 09:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790672553;
	bh=xvVwWEqR680twyayPe3TH6KsGKe6iAvE+JddMo7jNsA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Gfyk+aiB/tUXxWzVt/78vN9Mj/8WM5U0mbddOsHB7T9Z2w2eIdFEU4w4ckD0q7yj4
	 ijToOb9hsxaeeLUii7vciHwjM3MPCXMh9aRuznxD/z+PCO3/OPejlHnX6Jnux4W5TR
	 E0AWQZkCR7TJamYUz8Q0YbVzzrUUQdUS07YFqeMt3dJbpYcQy5Do4FeOZ//lHyy4ft
	 fIvHQQvlw39l/cK9Rnjuo+k4YPkNRUbT5iq6EUoN6qyY7DeabFil9HLYXuvXKgAMaV
	 DCzkBky/gKYt/lNX+E2ZHkjjtHHiV35cAxGs0Lf6Pdh3AWoNSJzK7D5YyR50xBiEPk
	 GU6Llhtpcj5sg==
Date: Tue, 29 Sep 2026 09:02:30 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Marek Maslanka <mmaslanka@google.com>
Cc: Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Radu Vele <raduvele@google.com>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Poll for role swap
 completion
Message-ID: <art-pgdLHXiCm5l4@google.com>
References: <20260923174420.2343724-1-mmaslanka@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923174420.2343724-1-mmaslanka@google.com>

On Wed, Sep 23, 2026 at 07:44:19PM +0200, Marek Maslanka wrote:
> @@ -104,27 +127,41 @@ static int cros_typec_perform_role_swap(struct typec_port *tc_port, int target_r
>  	if (ret < 0)
>  		return ret;
>  
> -	switch (swap_type) {
> -	case USB_PD_CTRL_SWAP_DATA:
> -		role = resp.role & PD_CTRL_RESP_ROLE_DATA ? TYPEC_HOST : TYPEC_DEVICE;
> -		if (role != target_role) {
> -			dev_err(data->dev, "Data role swap failed despite EC returning success\n");
> -			return -EIO;
> +	/*
> +	 * Depending on the EC USB-C stack (TCPMv2 vs PDC), EC_CMD_USB_PD_CONTROL
> +	 * may either block until the swap completes or queue the request
> +	 * asynchronously and return the pre-swap role. Poll until the target
> +	 * role is reached while connected, or until the timeout expires.
> +	 */
> +	req.swap = USB_PD_CTRL_SWAP_NONE;
> +	end = jiffies + msecs_to_jiffies(ROLE_SWAP_TIMEOUT_MS);
> +	for (;;) {
> +		if ((resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED) &&

Shouldn't PD_CTRL_RESP_ENABLED_CONNECTED remain set during the entire poll?

> +		    cros_typec_resp_to_role(&resp, swap_type) == target_role)
> +			break;
> +
> +		if (time_after_eq(jiffies, end)) {
> +			if (!(resp.enabled & PD_CTRL_RESP_ENABLED_CONNECTED)) {
> +				dev_err(data->dev, "Port disconnected during role swap\n");
> +				return -ENOTCONN;

Same here: if PD_CTRL_RESP_ENABLED_CONNECTED isn't set in the loop, should
it return -ENOTCONN early (i.e., out of this if-block)?
