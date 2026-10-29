Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793242699;
	b=thM8OUbEwTJL7RLqLm68pltsmM9on8R58y1VoRTx1z0q4s4qOLv8dQ3GHFKIdBbHhRpr
	 TejjHV8qq7gJFE/nLbnNNcU++K1izt9EbESAJg5PdNKzb9B67aOoLsSMl1z1sq63FW+zl
	 FDmV7IOFLtgiZwrrXsnff8ga4l+tDpxPUSlasV9QQG1JN4HoYg0lNqKkqCrMiUqAo8yAx
	 6UWUyR3wW0hRLHl1XqgdfFWunx7lV7+Wo0JiRWfRxcqZnRr6ntpKzMDgZGs7NSfqCPzat
	 GFMtXzMPHPLKfJgrU7gdzkV3PzD0DDef4aLF2uy0NZ6K0nRe7Mk7YYudcYU8cBU17Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793242699;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=mqR8Rw5Unc+fjqbq2PjrIaA8JGOgP2YG6ANK5uSrjsQ=;
	b=FrBMzKsT2bFYuhwFjvU+l1fhCkgGxLw482z0l8htm8TW6q1GVzA3NDqFUh3Ho2pftXCu
	 z29tPeQDAa5OQ0cuYNaaVMN8Z9w/xT+HM/hvO+vKRjrNKLqVA/XhHU/ZWFBNIx4B8ICEW
	 8BRGSf0TkiAya5pLiu2AVIWR8QOikziGFt9a1CRGAuUHqGelbswan6kBjv6c/jhNGWVnt
	 dYVXGBHgmNmMP4E3ALrWPnQgYyXT4EWyC2aA4GctDkDigH10s7KRnj1cnlEcipN626CfO
	 axPn2R+F9Smo3yuGGxoV+svKp4AnJK6cqoO7CbInDHEIMprVmj7emFgm+zHBdWtAfWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbnrAAp9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0552F606A31A;
	Thu, 29 Oct 2026 02:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hbnrAAp9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0391F01828;
	Thu, 29 Oct 2026 02:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793242698;
	bh=mqR8Rw5Unc+fjqbq2PjrIaA8JGOgP2YG6ANK5uSrjsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hbnrAAp9WwNwQG/ZBugvRYAUDqIeXgNqxO1WiJqaYDZeJqcbqX3A5R0hn97L6Y/FV
	 FrCH36zR4/F1c7kPLRDa+sYZIZW26NsBw8qpyAmj8S4K7zS9xjhQxd2CBrKvXn/Sdq
	 faNIwqsTk1KoSLRwEhfVT7/5edcoZ077yRJBVfDj3lzj3fG1RKLGG8mhIKVZbG3a0K
	 PEgindhBml/JsLxzfhGVAUHRn0/MYwQJPeaYMij9NNBjsXyv+fNYmqOvfLjLu7lhm/
	 AEi7WZ8PuJa3tUJwDX2pDBtp5AS5wSc8gpiULp9jrWPeQkvqAQN9l/F9bQMDB92Moe
	 OTOR1swq5HdXw==
Date: Thu, 29 Oct 2026 02:58:15 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Scott Collyer <scollyer@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] platform/chrome: cros_ec_ishtp: report
 EC_HOST_EVENT_PANIC to userspace
Message-ID: <auK2R5uStmMO79r0@google.com>
References: <20261028220414.1414481-1-scollyer@google.com>
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
In-Reply-To: <20261028220414.1414481-1-scollyer@google.com>

On Wed, Oct 28, 2026 at 03:04:14PM -0700, Scott Collyer wrote:
> +static int cros_ec_ishtp_event(struct notifier_block *nb,
> +			       unsigned long queued_during_suspend,
> +			       void *data)
> +{
> +	struct ishtp_cl_data *client_data =
> +		container_of(nb, struct ishtp_cl_data, notifier);
> +	struct cros_ec_device *ec_dev = data;
> +	u32 host_event = cros_ec_get_host_event(ec_dev);
> +
> +	if (host_event & EC_HOST_EVENT_MASK(EC_HOST_EVENT_PANIC)) {
> +		static const char * const panic_env[] = { "ERROR=PANIC", NULL };
> +
> +		dev_emerg(cl_data_to_dev(client_data), "CrOS ISH Panic Reported\n");

Use `ec_dev->dev` instead of `cl_data_to_dev(client_data)` so that the
`client_data` lookup can be dropped.

> @@ -555,7 +581,20 @@ static int cros_ec_dev_init(struct ishtp_cl_data *client_data)
>  	ec_dev->pkt_xfer = cros_ec_pkt_xfer_ish;
>  	ec_dev->phys_name = dev_name(dev);
>  
> -	return cros_ec_register(ec_dev);
> +	rv = cros_ec_register(ec_dev);
> +	if (rv)
> +		return rv;
> +
> +	client_data->notifier.notifier_call = cros_ec_ishtp_event;
> +	rv = blocking_notifier_chain_register(&ec_dev->event_notifier,
> +					      &client_data->notifier);
> +	if (rv) {
> +		dev_warn(dev, "failed to setup event notifier: %d\n", rv);
> +		cros_ec_unregister(ec_dev);
> +		return rv;
> +	}

cros_ec_register() already starts dispatching pending events before it
returns, so there is a small window where the notifier could miss them.
Please register the notifier before calling cros_ec_register().
