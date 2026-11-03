Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677752;
	b=DQhD7J1DxB3nbKBX9i3XFlKbTpVQ1fsbVslZLOuGtmYAQACDPUnJjxmj/Z2DbloiTP+k
	 ChVm4TRwwrnS8lypg5uNp+KTzBP13FYRPPDXVZl3mYUN4HONZsPqGmTFH/z4VBHlfOpPp
	 J/BRnHkob0gtU/1Ljv/t3sHDPZehbRcfDGMVaJ9DrMPuvbLrU+cLfPh01EK8+llb2/3mZ
	 bG3xFeE2o4od30dq7IbSVxfTT8jtlq/VAQGhxQc+Xk17eXvJuN0Y+T0vPbqoVd+c+FLb9
	 9PoNImhb9A/0OHH5O+soVSMBWY0I9t934Do1LuXJO1sM0h/0qo3yootMjhJRBxK8EHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xlANKc/hUsDyqlrzuS4pvu9SPatWxo1EtaTcINdrPck=;
	b=PNwOY80cmyk+KX/ctvpgLV2dqIm46r2sPihzAjMKWE2ONmjQlIzrYVKwQrsUkzuvRuIs
	 8mU4UfU03K3E1d/S+9E9Ay31jpznNeJQrDATRr9+5e7Z2XjysgD2Wsf+PApIflC+6WeKJ
	 2fOhRhhoQap5NPCjjaCInz82jk0uN1QMO0nr7I2IPn5clhCJ/zGxgewh8Oq2CByDol9zw
	 7O35NRY+tm4WLHFqPtM+G9KE8ezc5uR6YDmMf5T2R7fxjpvd7E8Q8vFzoF6w6j00D2KRk
	 FMUqH5ZIJ81yjY4REsepphvUQjzcPmcrVWmO+KSXbdPz/ceydYPk1cIhYTSN1bGph+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b="hC52/YqU";
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E9A606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9E9A606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=hC52/YqU
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-93f3c8958d5so451474985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793677750; x=1794282550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xlANKc/hUsDyqlrzuS4pvu9SPatWxo1EtaTcINdrPck=;
        b=hC52/YqUVgi5zyfeZsh2Sa1tBvxb6geWgwGIsR9akKn7Qd8A6Wm9GYov0aUhLX80LG
         /52Z9KUU3EBRRpekphMoymY8hS7Sni+RjFa7eVGSPoWRCG4edwqloOFBhbqs4QP8Y9FN
         WMkbYiIz7cwz2wQsHX1tAr7EaaiyvR7gLZeUVtgThYoSVEmWB+Tepx2qPTOLWSzkw4ou
         zkAMCBYwfTz6AXMrDVjtH9+GEqfybQIUb+n/Rh/dR1VeLo4Sd1cFqDF2JyVuy/coCOJr
         EWzBH76iTxP3nLEXrVp8bj+kajI3KrE1eurboGLqz55lJSy25hjdrvCfbWnX7K4cdJvp
         MABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677750; x=1794282550;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xlANKc/hUsDyqlrzuS4pvu9SPatWxo1EtaTcINdrPck=;
        b=HvPeifauzRRWFpNhhE1ZEgOAN3OkvGdNfpRfwTodVPaBHb5I5VzMKmvij/KGDZ94VF
         +dOqfkeRB4irof4NZa5JetHVl8qFhSxab85hLfTq6YhRtHgD5/PE5g9OxtxvIgXDhbL+
         ajOpoujOu8FZZ3IPeqmeBL9+MggOPwejo7TB3e1GmVcLwKt8TNi3yop9QJEmbTSxOUIt
         eaAAozQJzkAtNC/xEDsqzb4m798ibKtszNIiJOeIib8VtUbkh5d3wdaM/+AvO7wy3kgA
         6D3PhaeQcQHVJJsvQZzJ0qI8OFs9ofdjY/xNu9TeMoZWMshf6ezGMD2D3vOtdLWNjo1v
         SdTw==
X-Gm-Message-State: AFq9FYJ1JP3Xhd67n9JjY1DM3PiooeGpUmZjN+/EX2b0qYSArlujqBbw
	euNFPbfsg4Ngty1x44c8z8voRZnanwEvRmNaRnFnqU7RaRPJsJtuLHjUM4V21ldoArf9Wk6O5BB
	EFmvk0A==
X-Gm-Gg: AYBFou1ITjT8ja9B0vSIIOvlLfgZ3npXZ26rdcQPyaPCg6VPLaemcDwEgHGuSZ0i/f5
	7cg/Q+7nK2OlnvdilooSNWKGrfApIXrznbJsNFQN3tDnHF9hCPLr4rXstTHHM3RpxetHvLIuofE
	TtGvM9NTHLgDpOi5pFAw6lHFxEb9/gxFIrLyv/2mPFztcq8GGghkV78IDmyl0/lGtBsPvZRus5a
	/KNPun4alJduHA22Gs2w4gYbqRT2UMwIJHOwVmUbErpXOwh3K97QALqz+2zUdkFgR9b4SPPy6wj
	uvO2mwKt8PFgUQcavAhOxeZtkoJw94tRcurJp7zf1aozdTG582kXGuaQt/V7iiNdfPZrQXzxny8
	vhb7J5nrW5VnGyKu0fCbiknWicxByeoYpsgocEs85JkHQ2AKGgP6qKARHXK3oe5tRTK5M3dfAaF
	5JMkZ6dHcK4TwdjCY9oatgGhIgOxZH9LjZXCcSEdGKnrcGNxByvi2cJ1wPstwCniL5UiodJ4I+I
	Rxg65yyXYWC5sd8P74RNlFx6iJ6pnZNj3wGU7WqvbokNpaPvydZv4u6O+1DeMBTgkPOaDx3haMs
	kNaN13xs/xsCiqzpsDGyUovMBR6S
X-Received: by 2002:a05:620a:370b:b0:93f:1af1:7951 with SMTP id af79cd13be357-94421729826mr1933039785a.66.1793677750486;
        Mon, 02 Nov 2026 19:49:10 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94425a6b9b4sm987221685a.26.2026.11.02.19.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:49:10 -0800 (PST)
Date: Mon, 2 Nov 2026 22:49:07 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2] USB: ohci: ohci_pdriver.h: fix missing kernel-doc
 comments
Message-ID: <02148858-defa-4c15-92e5-0ce7029bc000@rowland.harvard.edu>
References: <20261103014710.2451967-1-rdunlap@infradead.org>
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
In-Reply-To: <20261103014710.2451967-1-rdunlap@infradead.org>

On Mon, Nov 02, 2026 at 05:47:10PM -0800, Randy Dunlap wrote:
> Convert comments to kernel-doc format to avoid kernel-doc warnings:
> 
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_on'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_off'
>  not described in 'usb_ohci_pdata'
> Warning: include/linux/usb/ohci_pdriver.h:32 struct member 'power_suspend'
>  not described in 'usb_ohci_pdata'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> v2: move all kernel-doc comments to before the struct instead of
>     having them inline insidet the struct. (Alan)
> 
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: linux-usb@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  include/linux/usb/ohci_pdriver.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-next-20261102.orig/include/linux/usb/ohci_pdriver.h
> +++ linux-next-20261102/include/linux/usb/ohci_pdriver.h
> @@ -13,6 +13,10 @@
>   * @big_endian_mmio:	BE registers
>   * @no_big_frame_no:	no big endian frame_no shift
>   * @num_ports:		number of ports
> + * @power_on: Turn on all power and clocks
> + * @power_off: Turn off all power and clocks
> + * @power_suspend: Turn on only VBUS suspend power and hotplug
> + *                 detection, turn off everything else

It would be nice if the indentation for these new entries matched the 
indentation for the ones above (1 or 2 tabs instead of 1 space).  Aside 
from that:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>   *
>   * These are general configuration options for the OHCI controller. All of
>   * these options are activating more or less workarounds for some hardware.
> @@ -23,12 +27,8 @@ struct usb_ohci_pdata {
>  	unsigned	no_big_frame_no:1;
>  	unsigned int	num_ports;
>  
> -	/* Turn on all power and clocks */
>  	int (*power_on)(struct platform_device *pdev);
> -	/* Turn off all power and clocks */
>  	void (*power_off)(struct platform_device *pdev);
> -	/* Turn on only VBUS suspend power and hotplug detection,
> -	 * turn off everything else */
>  	void (*power_suspend)(struct platform_device *pdev);
>  };
>  
