Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792603430;
	b=plcgujkQETEc5TOoHGc+9MabifWBxR0znRyeY7zH3HoE986AhBQa60F3GyxLNcdhk+1b
	 9wcYRrRu+GjWlVBlxvnlq1W0ArFVrBYrtUM9Gi0rEMi/b9TKqjYvIfAWKQ2Kak3yJsWSh
	 O//8HTAJH5krplvyP/IzDuDWuc7NytpvCN1IQ7yrxWrxx9W3ACM+UwLyS1Qb6UWC4EdXJ
	 B1jOtJpQwzGtAxBLSlVm4WGpLP/4qukfQXjRL6Yt2rltxbXcd1dTyZLF5ihu/kdLUGFJv
	 HelFkUvUdaU4mmlz7jDbMSoV5e5ou3z6vDTdFhcZOgf95EyE6TyCi8HYiVD4KlzNpRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792603430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Xq/Mntuw9H/QDRiWvp5bTN6HG/D1JEq1cQYOqHkRs9s=;
	b=ZqsMAY04dZsKtITz/+BJoqLgHsRY1aYDMzywQH4SznH+9SOERyWcn1WtNmm5G/pkIemU
	 05nNJocDShWcEqfGVTW+kn5G61OSpxvQE3MtE2G3cndjPCKeXePwz/Wc68tsZeYPbZ8bp
	 xAlx4jzVlMBMSm65E8+7xjsgP1zuoRW6IWnhH8sD4RISkqE9M9DxWay4OHbnkdeUVw6zp
	 JKodlrSzSJOsEskewofkyTAfVjbzZDsTjr3NTw40F/v36eoSzGXofaw1T/38L+IBtQP4p
	 KqOWzOJSukVkROoZiAcoZebn0FTT4AZoSgHnsX7f97RArfqGVhSDaRz8lUjo6wq+d+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGg2zhx8;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C324606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C324606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sGg2zhx8
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-185fd3a4ca3so401665c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792603430; x=1793208230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xq/Mntuw9H/QDRiWvp5bTN6HG/D1JEq1cQYOqHkRs9s=;
        b=sGg2zhx8XpQ8Y5VWsNzVZmU+N+t47KA2UleuuqA+pv1bdRFdvq+jMtwQ/tTGUHHEdF
         iwSdBVrtn5guZIGBqvqjI2TEM1KWoKWAafzY2dLUCwcnRt4U53jsa7f+gKX6b9N+HTd4
         SBjX6aGM6nnwgR33oZLRdcXBG2MYVs6OPxvcNIcRnC43Mr0PvcjfN2zqUYJ7AjwZqIAJ
         CcRcCll3/sl8aCkBOe6iKkQrmCH3jPlq/5YyJYkPJeVJJeX6bL1wPSFCkim1HL6vl1PF
         jJFOfHsEQwRT8pGWVKX578gxCYZFA1M0/k7THKtPhhL4s3z8EbBp9+dWN+latvtZlZ2Y
         7sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792603430; x=1793208230;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xq/Mntuw9H/QDRiWvp5bTN6HG/D1JEq1cQYOqHkRs9s=;
        b=UMteFBdphkM5JddTvCESavPl/ZF59h4oNxYRhV64rlUVyybrKpsFfafXwL7n3x+4yj
         U1WDDCki3TyPsFb07rGXJ/Pk3XTNyjsGsysLwxWSy4HmcC/g+jRFTwWfO6f6Ellemlre
         16PZed+8bWFmkIYTsdROBh17+SPMmGJpoKHOOHZjN/eJI6gdANPjHTfZLIL+Cgcp5ItH
         adkRn9lFYlJ2l8ospy/pJ9FxZ0HjHASpJfFpiijA5NySoz3itPsFgA+m+T5c5glXMtOg
         sFWDrWv73VQlJIJPw5tGyiHydrIqQHnxCZCcoBhUXf0R1JV7WVMcoTcCGd/DSJFbKusy
         xUGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgbqWUQQlXpbrRmKuZdzfTaw68TuhX2nEMybddf9swApZIzQOPH1HYwUXsFIFAFTJ38S5D+L7HsNOex+s=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8L1qso4kauhry/14PpGfX6gey9CN9Fdgi+JpN51YtvPDEUbYN
	PP0+twggwNbu6vcxEd4JQ/mcdqNxozYn3gconkmR1QwUhNoGu+tqvhYo
X-Gm-Gg: AYBFou1CP74e8tak94kzmvFVbp7LZw5+T4DwlrJgdLKBlbTWtSfHdr0Rb2RTcSn8IF9
	PSRKAj3Jf1exLYMTwY3UxvHl2+o4qasV5yFupHJ9vtzqTaZAtQGczjE1bGh0UKo3XNtCahhbrCo
	gCdAxEk4CFop7FWJgn/KgUs/zdwqq1vxFsCYTBY226//PE+Z3IBqjWc7QAt2Elkq8V1Sv9VcWsN
	aEGmJzZSLRvRF87cOBTO8NpZrrcb62N+ISIpZ9RagDjC4/BFZsKn6kxVTz6kJuFxCQed/RkkukW
	j1+cz16TZ5q2BhvCjkJ5OUzHJ2C395ph2db3Gffri4Vhtlexrec3+drSL+/wIWW/sjuewf+yhph
	6dh1HWu8phgVrEytDBuBq/OF8Dfvwwf37tfITzq8/cE5ui3F355+4AxbKyH9sbzXSiyscL4lX4/
	AAzfr3imvJVnksOTfuo/g/KMjltLcMTKafwqV30uJ6CmjPs6H+Hd/KaH5PeiX2qf0pA2Gyu6+Ps
	1io/QBJzhC1940I3Ku3UCnChdtV2NRs4OMKfPf6lwDIM5VRBHuW3AqOLzDNVgwC2IGdgm7ukR+P
	TwkJfOHLIJemmCV0EdH0akYWNci2i/gXJvK8KxwZs/8=
X-Received: by 2002:a05:701b:4517:20b0:151:70a0:6bfd with SMTP id a92af1059eb24-190a6239183mr3020964c88.24.1792603429511;
        Wed, 21 Oct 2026 10:23:49 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903aefe90asm7430112c88.9.2026.10.21.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:23:48 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:23:45 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Hans de Goede <hansg@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] Input: soc_button_array - convert to software nodes
Message-ID: <atjzqdtaduFV6B7M@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
 <atjypFBUGPzWv083@ashevche-desk.local>
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
In-Reply-To: <atjypFBUGPzWv083@ashevche-desk.local>

On Wed, Oct 21, 2026 at 08:13:08PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 20, 2026 at 06:50:01PM -0700, Dmitry Torokhov wrote:
> > Convert the driver from using legacy platform data to using software
> > nodes for registering 'gpio-keys' devices. This allows us to
> > transition away from platform data and use generic device properties.
> 
> ...
> 
> > +static void soc_button_remove_swnodes(struct fwnode_handle *parent)
> > +{
> > +	struct fwnode_handle *child;
> 
> > +	if (IS_ERR_OR_NULL(parent))
> > +		return;
> 
> Isn't this redundant? Because the following has it inside already.

Maybe but it really is not obvious whether the latest flavor of some API
handles error pointers or NULLs transparently or not and whether it will
continue doing this.

This is not a hot path so I can think we can spare an extra check.


> 
> > +	fwnode_for_each_child_node(parent, child)
> > +		fwnode_remove_software_node(child);
> > +
> > +	fwnode_remove_software_node(parent);
> > +}
> 
> ...
> 
> >  	const struct soc_button_info *info;
> >  	struct platform_device *pd;
> > -	struct gpio_keys_button *gpio_keys;
> > -	struct gpio_keys_platform_data *gpio_keys_pdata;
> > +	struct fwnode_handle *parent_node;
> 
> Can it be one line down, so we keep reversed xmas tree order?

Sure.

> 
> >  	const struct dmi_system_id *dmi_id;
> >  	int invalid_acpi_index = -1;
> > -	int error, gpio, irq = 0;
> > +	int error, irq = 0;
> >  	int n_buttons = 0;
> 
> ...
> 
> > +		child_props[prop_idx++] = PROPERTY_ENTRY_U32("linux,code", info->event_code);
> > +		child_props[prop_idx++] = PROPERTY_ENTRY_STRING("label", info->name);
> > +
> > +		if (info->event_type != EV_KEY)
> > +			child_props[prop_idx++] =
> 
> > +				PROPERTY_ENTRY_U32("linux,input-type",
> > +						   info->event_type);
> 
> Make it a single line, you seem use 100 limit anyway.

OK.

> 
> > +
> > +		if (info->wakeup)
> > +			child_props[prop_idx++] = PROPERTY_ENTRY_BOOL("wakeup-source");
> > +
> > +		/* These devices often use cheap buttons, use 50 ms debounce */
> > +		child_props[prop_idx++] = PROPERTY_ENTRY_U32("debounce-interval", 50);
> 
> ...
> 
> >  static void soc_button_remove(struct platform_device *pdev)
> >  {
> >  	struct soc_button_data *priv = platform_get_drvdata(pdev);
> > -
> > +	struct platform_device *pd;
> > +	struct fwnode_handle *fwnode;
> >  	int i;
> >  
> > -	for (i = 0; i < BUTTON_TYPES; i++)
> > -		if (priv->children[i])
> > -			platform_device_unregister(priv->children[i]);
> > +	for (i = 0; i < BUTTON_TYPES; i++) {
> 
> At the same time this can be transformed to
> 
> 	for (int i = 0; i < BUTTON_TYPES; i++) {
> 
> > +		pd = priv->children[i];
> > +		if (pd) {
> 
> 		if (!pd)
> 			continue;
> 
> ?

Sure, why not...

Thanks.

-- 
Dmitry
