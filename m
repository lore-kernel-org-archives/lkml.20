Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794461589;
	b=eq02XQb+5wVjjAg3Ez8pjUKY7RnQfWbxqp1RBW3GVbdNv+ytoGn7dVbrXPPqDD57d59O
	 aF029iHdJ3IcxMbaQCdCUCkg+dE0IHwzHHXS+WlEumpN4j2lZRFQ7rI0+E9hZUW3raQ5k
	 9j7Dy7WogDnfbLlZJbgwKkmN7CqOyHMokge+JohcCYNP3mxmqDpuKMZ/ictnSiyrtWH3X
	 9CJuf7tOoNBxF1sax4QH1ZPtvL195RUdhd+WlLrBDMobZ4cKIKVNVv8mJuucSlebFNcIC
	 dApw9Nl3JBxvIjwfrx4xB9U5QjOiSmv/7QGBXJFwcqXcoVCrJcNP4PfeOe2bsdrQMsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794461589;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=njCUlLoyOIDOncaH4+djS31c7ySEziXPtaELXRIFSNM=;
	b=cjbfloijb3CZv6f/NNiQkcXjuooe9VeTL4W5+HzZwT4oz6d1lwLFq4OxlIzm2IOZRuS9
	 OQHCyPol9Reui5bkUUw2VExuyp6brzC3NWZrEp2sTXhE3HuHkJs7VsacpKgxV0kFzFe9R
	 xvvvx+mOfnHUMTpnnYT3Zv0OWF4GDx7MD1W+GY5WX1sMfxJ8+ompZvib+jA/Wly61mYtJ
	 hwqqSk5zqV392KblbQx8bNHGQrTcv0KHnNMkVqfunznwmLoa9RzO04uDbOXne1Vq7w2Vr
	 M9WF9oFOomf0AMME4Mq5aEbebyGnZBWxePqYslog3TLZrLteizjU7TesU5sFuTUY/yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLgDaxY2;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E86606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10E86606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mLgDaxY2
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so2273504a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794461588; x=1795066388; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=njCUlLoyOIDOncaH4+djS31c7ySEziXPtaELXRIFSNM=;
        b=mLgDaxY2YkILLtiwHGCnVHR2Gio060ale45ThqnikVOJ43bYrTPZNQ44scY+S5ZjGQ
         zTuJMjQBVOW2Xhk8z63WL/5dni8dOtpyVasqUms6VHHdonV5l6CHJrvdBDIbFmB1UwEC
         i5rX19Y6KuycB7iBaL4LvN77wK/7qOBJBw3qmTb7Xl6hKEZ57GqKXTtscBT72Nl+PT6N
         ko1X5qSp018CP3AfQ811dSji0RD6pX/i0ej8tDrVBzsAf4xhiCGRDrQ37MRoTI9Xv+0n
         7gA4QRaOWJlphYFzLFk3s54Jr1eNUbv8RMQxY72QX+Ce4wSZR1CpoDVbyJCJbQqw7lHZ
         zMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794461588; x=1795066388;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=njCUlLoyOIDOncaH4+djS31c7ySEziXPtaELXRIFSNM=;
        b=LdzBkOpHsUmEce4BRbhHZR8my+bGAWCJNhGHvxwLbrC0+7wZglJ7L3ba90lPWknT2Q
         x87iDhKCdqPYDLySkHDBp7wFhyFVeCQ2tJBngHASpyjLAPdc3ZBwEk4vvPFGWg76NYDL
         TgI5tA1NiL85Hhc02t2SPfO10Gr1DomkTSjq4HJ8LulHMaElNU64v2PJwj2C1HKy+wYs
         8c3TpVHco3SM5CEU3Y+HsTFu81MfjhGSqRG8RsCaqlHFaeJPmaNVOJeKGJLl3AYloyRP
         dVLS5Ydw0kMWtJiTVuYKxMN2FOF35YE5wVPovqWacRsxxWomC6Sa87tAQyRsKTVwTzAu
         eo3g==
X-Forwarded-Encrypted: i=1; AL+hErG+aCESwEmHksJbzs9+kvexLxZGg9dELiv+orU6g7/Y8wDmRsXd5Wa0tOOQCUV9KSqKjiPd14bu1EDXpMk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W0/AhO64N1sA6ybVb5qwJD3a/FLiEn5ve8gluSYc3IzH7ff6q
	OiZkEapU64VlJe4r+rMY9RyTrh1mzfvv1dlcaxyVEihGIc8lRruI4Iys
X-Gm-Gg: AYBFou1kO3S62+Ayy7NWNuT2ClMpTeBOzjRY+s+wtNUxXsOFuVH1tMqFU/QUM+Vei/N
	RggsDV1BnQPAnvrbOC8n9b9xQOApWAcKClDmbIuF3XQBmDcEhtv9rppcIyZsuFHAfe4mvuYmtam
	UoBiSlwEqVXpw3boMQy4QgZjvHJw7Igg0XkJ4SrOi0B4RXXIwwTwQjhin66Y4wytxXscDpnLEc6
	z6z+qPhYkpyILcy8T0oX93hCPcJ9yjJ8fsXJyrf2YnxFC2Vojtu0xyF/Nyd6P0gJue9FwmN1a4h
	rImCdtacnSjq791wV9nOb+GfdEvq89rr0EBkoY68/Fy9wO7q+T8aBxclJzuWn0AIB6XVDCchBAB
	9fAaOYKHY1aLMxy5aBj0u+/BQ5lohhJf2hJYxE+Z4LuP+8dSx5/PL5FT2fAbvEQ8eLNpfoLO/8B
	xL4GmHYGFm9bIyJZNdpJCvm4JOF6RhuE32JKQkqgAlNv559hv5HXcRcyKGYgtJcuRClZXYZvJKU
	jYmLc6kMJpULhxFaCT1HqvDheW4DK6vkOxjPsIQgYi+jXKG74DtlGXfxfglkwBENSFvkyzGuAml
	+e4WH9orP5PzD3P808Xf4sOn39tT/oXMlHaSKNT5O4kBp+cbUDNUoNCftZIp75IgWA6Ci3Y40t1
	DBw9axW6UhrJfREI=
X-Received: by 2002:a17:90b:4d91:b0:3ac:8897:7baa with SMTP id 98e67ed59e1d1-3b182efdd48mr3779419a91.40.1794461588456;
        Wed, 11 Nov 2026 21:33:08 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:182d:659:ffce:39a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c42c11sm2678324a91.2.2026.11.11.21.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 21:33:07 -0800 (PST)
Date: Wed, 11 Nov 2026 21:33:05 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jingle Wu =?utf-8?B?5ZCz6YeR5ZyL?= <jingle.wu@emc.com.tw>
Cc: Yao Yuan <yaoyuan0329os@gmail.com>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Vishnu Sankar <vishnuocv@gmail.com>, 
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Phoenix Huang =?utf-8?B?6buD5LiW6bWs?= <phoenix@emc.com.tw>, Stanley Chen =?utf-8?B?6Zmz5bu657at?= <stanley.chen@emc.com.tw>
Subject: Re: [PATCH 1/1] Input: trackpoint - Add new ELAN trackpoint device
 variant id 7
Message-ID: <avVPRySmoH_KKHa6@google.com>
References: <20261102130836.11863-1-yaoyuan0329os@gmail.com>
 <20261102130836.11863-2-yaoyuan0329os@gmail.com>
 <avKBsi-E7IeUgsSY@google.com>
 <TY0PR0101MB4786C8CF42ED66617BD9DA1EDC722@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
 <avMcB0q7wF9oP5X8@sapienza>
 <PUZPR01MB477458CD012208A31DE60068DC712@PUZPR01MB4774.apcprd01.prod.exchangelabs.com>
 <avRttU9N0EZeq8nY@sapienza>
 <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TY0PR0101MB47865DFC765932B9E6C3E1C0DC702@TY0PR0101MB4786.apcprd01.prod.exchangelabs.com>

Hi Jingle,

On Thu, Nov 12, 2026 at 05:26:46AM +0000, Jingle Wu 吳金國 wrote:
> Hi Yao:
> 
> Upon inquiry, it was confirmed that a black TrackPoint stick (0x07)
> underneath the red TrackPoint cap corresponds to a vendor that is
> compatible with the Windows ELAN driver.

Are you at liberty to share the vendor name? Or should we mark it as
"Elan" or "Elan-compatible"?

Thanks.

-- 
Dmitry
