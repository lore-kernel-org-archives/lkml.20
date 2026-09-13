Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D0229AB02;
	Sun, 13 Sep 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789290344; cv=none; b=X5LprcJcJUKvfEWuRoTMHSv1wXA/fQX8rkjBsQeR7tN3CoJrQfYl22yKzIe/d2jCVDZ2xeyptSr9yBJ24LV5kznXUFIr0/HkVn/Zis3YAsu44dl80AnromSvKrgi1veGhoXsgedkRhsX6z7Ca+QPcWsWI47ahTqmJKqa+HSNgcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789290344; c=relaxed/simple;
	bh=XCMvr32Njd77a0ypLWFMtgXdu2LY4CEqvCdH7f6AHNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KxqbEADfoxZzkZRhAgRh/TZmoIA53MGXjJ9BaweQ0gNz9dtEa74+L/3wxFskLP4A4GW6rhAY2h6FvD0GqhEBz+2IilGV1UVJD3zF97Kta/OnmXl5RrIguXFhvOb6GHY9NuLmNsARZArlX6dLeMs+VaHTUr47hFYiK/wNI6k+cok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J4wQI6KI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J4wQI6KI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 836201F000FF;
	Sun, 13 Sep 2026 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789290342;
	bh=WZAA9HdUMRBFZN3167CpFdJmABQMtYuRVCtkVSMDBsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=J4wQI6KIiZx4myXcRsljhzwJI1F/oQtF/OHmEi0wl86LHYyD3FSP3FX7dbHArw2Cv
	 bMwFT3PV/2HMAEe2bCNtnFyeoMxkxJAYFDbDm/PL4t8UUNGpR+SX5JS7Awfd3w02xX
	 2OgpB0n0/nlm54B1AFJfFqlrV3oc1eTKUIvHgZekG3fNgSSTwhrwKXk7CFp3mq0LYh
	 +Qp8yR6fA2ESvgGQuWeCmP90rTo4kPdPlTj717rVYAWEB67619vDuwYgvXEMTTxxVL
	 H8lII3+1mVCQccffH2zNPSOMO6wTNtuyRu70Pf2Mwwm59CD5yZk7RgxBRsCRYf96r/
	 gjLZolynVE5Ag==
Date: Sun, 13 Sep 2026 11:05:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amber Kao <ite_pd@ite.com.tw>
Cc: Amber Kao <amber.kao@ite.com.tw>, Jeson Yang <jeson.yang@ite.com.tw>, 
	Yaode Fang <Yaode.Fang@ite.com.tw>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: typec: ucsi: itepd: Add DisplayPort alternate
 mode support
Message-ID: <20260913-agile-tacky-mayfly-7a0ff3@quoll>
References: <20260911-ucsi-itepd-it527x-v1-0-14c8041afb53@ite.com.tw>
 <20260911-ucsi-itepd-it527x-v1-2-14c8041afb53@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260911-ucsi-itepd-it527x-v1-2-14c8041afb53@ite.com.tw>

On Fri, Sep 11, 2026 at 06:17:58PM +0800, Amber Kao wrote:
> +	ret = itepd_bridges_add(itepd);
> +	if (ret)
> +		goto out_ucsi_unregister;
> +
>  	return 0;
>  
> +out_ucsi_unregister:
> +	ucsi_unregister(itepd->ucsi);
>  out_free_irq:
>  	free_irq(client->irq, itepd);
>  out_ucsi_destroy:
> @@ -330,6 +715,7 @@ static void itepd_remove(struct i2c_client *client)
>  
>  static const struct of_device_id itepd_of_match_table[] = {
>  	{ .compatible = "ite,it8851" },
> +	{ .compatible = "ite,it5271" },

So devices are fully compatible?

Best regards,
Krzysztof

