Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792652945;
	b=47ecw5bdfLc4RDYH2UBNyW10Rl5yuarEAlel6jhKTV7s1fMZcRVVFKeH13Z3UOcxdLAa
	 KdZ37zu/iLZ3KMVYvRwkCPNSshlnZ9mV+QyAFTdvL2Qk95fto8n/9eAS7OaPBjAeZHHJh
	 Z55CfEb/FCy8EsqGrXfHBv8HGV09C0wBwtCWn1YmWtCLtzUBtS34uKLvdYDUTFaZgc3um
	 UCxR+WTV4jYCfWZBVKCT3hGeUfcQhde8uUe4KDe9CW0fYgHSgXCnlaOLTXy7OPySCvgKi
	 b347uoXYTMZf8agpQHGQ2ecSitoIBIv2hiNF/9daLWXfXJDazzgySdrXYHWrPB2ROXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792652945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XssGaeVl2OdevVN/fICXdcbv8t7nXjI9BLYiHfZ6gHw=;
	b=Q40iiBofcMjMnS+gX1bSdeJFh3kmEwSNfzeCUME0CPtsRp8AfehdyyCzm9FkDjbRNr61
	 vcJQGFa667S5KG19bl3TAJZu1evVBcUx6pAeUOqDatsUdTGiZ4KjGS/rEc2bzdr3PoVmC
	 Q+Yzn+9gbawxu1rqZKj9SE6bHY/A8pKvmuPiEpYZqgX36ETPgtV3zKguB6mc7IMzYseK7
	 PIjZiVsm9wgE5ED8Auo4RTm/K9wKKCyYRcqzUQHy2Ck6663DyE+8HndKV/yFy3sLLETLr
	 +6WC6P75Dhk8cIKRMKaxcEVw4XSYYefw+uyijP1RWnZ4V9S+UJ9PEjk79xLv2WwrqHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft7k+83o;
	arc=none smtp.remote-ip=74.125.227.138
Received: from mail-pj2-f10.google.com (mail-pj2-f10.google.com [74.125.227.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AABE606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AABE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ft7k+83o
Received: by mail-pj2-f10.google.com with SMTP id 98e67ed59e1d1-3abe4fb64d2so729212a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792652943; x=1793257743; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XssGaeVl2OdevVN/fICXdcbv8t7nXjI9BLYiHfZ6gHw=;
        b=Ft7k+83oYx8wwz21l0KLd/G/7TbRV/NMT2VZ2SfEwZA3WPyM+tGFEfDhqfRJFYX0zv
         M92D4zjGi/jH9I/GtwqRaQoEcF/P6xbeSxppXF/PDNvo3N0zC7BKMsrwr9Ram+frL+S0
         us4LfN9ML4N+GJRqsKljAVaajmbB30EfOvxkESt2vrGTgM1TuOBKg5TCWBsj3ZjegHh8
         wW76N2u2U2YpkqnWtexonzeiqF3gsTN7PyYZEfEqbGoUbPi78iii3EhWmpARwNxjaQS8
         DP7moImk6x6BQMgU376o4Rn6QYUhxohfuZnf3t2jXEQEX4O5MYm5UjpOPcPXT8vFPgXG
         7UAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792652943; x=1793257743;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XssGaeVl2OdevVN/fICXdcbv8t7nXjI9BLYiHfZ6gHw=;
        b=vip1vfq5ePgEM3yoeXFuM+ZKdNxpphWT/YkTXoLAi/kwZ4F8bHfDbNgmK5eA+xOOCf
         qyBoL7MOQwo35tWMuATQt6DGtvo+7hZ6DO/qAZvpmTm3J38SZbt39k37k3Vto8IGfnz6
         4V9taRw6s5buzqBkE9v/COPjkRYtyC8Sv1GIPiaO9RpjRdeGQMY0bOsQNY7uhX6hyma5
         PfpItSQpL49VJzobrD5MojoJOFanLkrhfktfbY2VIQY8HQEN/Lljzu0toBFKSoyFxx64
         cdjNm47LMHu8HfA5NSg3FFEmPOesvKnDwyGM8uwZUUl2jiw2dYagslpBMj5qu1MRVtTZ
         SC/Q==
X-Forwarded-Encrypted: i=1; AKwUvBw76imBXRUrbho6PlS0wyUA4xswjiCSkQvj6b8nFevaI6C0Oi9oorwIkoQXG6Yu0X1IByxiS0kzlMluD+c=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL56fuIt7bA2txPzMN1Rtqx3hzPpx7iRmaYqlVjOZnfUvhyWld
	X/KlX4Wug6h0Ija8B3nAVwUn2KKKj6qfIicGl8n5VsH8Fk6zqsq6NKnb
X-Gm-Gg: AYBFou3rZfOPxlP7yykz2NsLC4oXFaQWh8ibRu/zVBInd6Opj8VJal5aQqSxUIU+gvw
	rIf/SybIBxxo844Jrb3yyewPp+OzfUgl8PQibJ3BI2dBMrs2qnVFr1p3LEF+F81oY4EBPAiQNi+
	pPJVOYBx6kCjN1R90JqlXOwbAlVJLjSufnWaejpoSF04wp1S3DVirY9zzZRj9OhgOE3azpB5cGJ
	s1enk0pIk9xWsoq4t/lW0qHiIQtRDBo4c9QE/6By0zGl3wkfV/jFwXrEZE08/vSF54e6at3mB4B
	zPgPkWrwDwWa8azCiiriGQI6ymrUuEWiRtYHSAOWCeSYT+GC7qCtQOmaUzikZumbAANwsyj86Mg
	040GqlFzflWZm6Y++vRTwm+ig48rxhX2VCxRQ2Iji6N/kqLSsv4IeoQ3Yw7m3HFrSmX2rKRA3cC
	x4MQD3TzL+MFkegN3CVtJZ7UxQuGO4wahrIdnF4Y2mV/yhZv8EZFnDWZ2bdam9BIRGQpYmsVccb
	sWOC6H1dJVjMMV3Ak0rIF6/OTMbUki1nwy0TzfrIzNhDVYRHZ85LW0O1uwEJZFR4UrSKEj/yYmH
	Xsl5AKg=
X-Received: by 2002:a17:90b:37cf:b0:3ab:c674:d83c with SMTP id 98e67ed59e1d1-3ad86ed34a8mr3884621a91.27.1792652942680;
        Thu, 22 Oct 2026 00:09:02 -0700 (PDT)
Received: from J4f-Laptop.localdomain ([183.36.237.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4887669sm2913545a91.2.2026.10.22.00.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 00:09:02 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:08:58 +0800
From: Shihuang Liu <shlomojune6@gmail.com>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] USB: add usb_make_subpath() for formatted device
 subpaths
Message-ID: <tlemhufl7x3zatbf7ygcfnshinyz4bunroyhegmyxutgooqbcc@wtpqkldesosb>
Mail-Followup-To: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	linux-input@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Ville Syrjala <syrjala@sci.fi>, Henk Vergonet <Henk.Vergonet@gmail.com>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-kernel@vger.kernel.org
References: <20261021123146.17202-1-shlomojune6@gmail.com>
 <20261021123146.17202-2-shlomojune6@gmail.com>
 <ati7RlrVvmzMjzNr@debian>
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
In-Reply-To: <ati7RlrVvmzMjzNr@debian>

On Wed, Oct 21, 2026 at 03:17:56PM +0200, Alejandro Colomar wrote:
> Hi Shihuang,
> 
> > Date: 2026-10-21 20:31:41+0800
> > From: Shihuang Liu <shlomojune6@gmail.com>
> >
> > USB drivers often build device paths by calling usb_make_path() :and
> > then appending a subpath. Several callers use the deprecated strlcat()
> > API for this.
> > 
> > In preparation for removing the deprecated strlcat() API[1], add
> > usb_make_subpath() to format the USB device path.
> > 
> > Link: https://github.com/KSPP/linux/issues/370 [1]
> > Signed-off-by: Shihuang Liu <shlomojune6@gmail.com>
> > ---
> >  include/linux/usb.h | 29 +++++++++++++++++++++++++++++
> >  1 file changed, 29 insertions(+)
> > 
> > diff --git a/include/linux/usb.h b/include/linux/usb.h
> > index 1da4ad1610bca..c90ccea0cdbf6 100644
> > --- a/include/linux/usb.h
> > +++ b/include/linux/usb.h
> > @@ -14,6 +14,7 @@
> >  #include <linux/errno.h>        /* for -ENODEV */
> >  #include <linux/delay.h>	/* for mdelay() */
> >  #include <linux/interrupt.h>	/* for in_interrupt() */
> > +#include <linux/stdarg.h>	/* for va_list */
> >  #include <linux/list.h>		/* for struct list_head */
> >  #include <linux/kref.h>		/* for struct kref */
> >  #include <linux/device.h>	/* for struct device */
> > @@ -987,6 +988,34 @@ static inline int usb_make_path(struct usb_device *dev, char *buf, size_t size)
> >  	return (actual >= (int)size) ? -1 : actual;
> >  }
> >  
> > +/**
> > + * usb_make_subpath - returns a stable device path and formatted subpath
> > + * @dev: the device whose path is being constructed
> > + * @buf: where to put the string
> > + * @size: how big is "buf"?
> > + * @fmt: format string for the subpath, without the leading slash
> > + * @...: arguments for @fmt
> > + *
> > + * Return: Length of the string (> 0) or negative if size was too small.
> > + */
> > +static inline __printf(4, 5)
> > +int usb_make_subpath(struct usb_device *dev, char *buf, size_t size,
> > +		     const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list args;
> > +	int actual;
> > +
> > +	va_start(args, fmt);
> > +	vaf.fmt = fmt;
> > +	vaf.va = &args;
> > +	actual = snprintf(buf, size, "usb-%s-%s/%pV", dev->bus->bus_name,
> > +			  dev->devpath, &vaf);
> > +	va_end(args);
> > +
> > +	return (actual >= (int)size) ? -1 : actual;
> 
> Why are you open-coding usb_make_path() here instead of calling it?
> 
> 
> Have a lovely day!
> Alex
> 
Hi, Alex

With open-coding, a single snprintf() is enough, so we don't need to
call usb_make_path() and then another function to append the suffix.

Thanks,
Shihuang
> > +}
> > +
> >  /*-------------------------------------------------------------------------*/
> >  
> >  #define USB_DEVICE_ID_MATCH_DEVICE \
> > -- 
> > 2.43.0
> > 
> > 
> 
> -- 
> <https://www.alejandro-colomar.es>
