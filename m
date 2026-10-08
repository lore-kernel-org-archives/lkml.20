Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC07D332917
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 14:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791469368; cv=none; b=VOIluyZMsugH2LlK0h+fbYBisIbSVUPfVYSJO6ymewwWICfi913fEiEvJKKcXrM9VAqxEJ2Pdrw8rvQry3ZZDhQ5SwhtP3hbbd2mQRFm4cXPgqOl0/P6HsWFcaNshNy++lm0rERFUJV0KwHKsWMGJOMaOwt/isBmSbBAS6OLok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791469368; c=relaxed/simple;
	bh=bGvHf/Eu0Cr1bzhWZCCr+lmOp/ko/TJ9QQPm2D6QGx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwEa9IcGiqEzVbTiOZGinpwv20Lr6B2MRiBud/enhZpTtFKR5fK471gdtn1jLZQYMYlJlSMtVvOEI743ay1FJ9H2zlVuuSnH6Z4smZNGeT7ZDjep4suWoQIXHGYM312xpc3kF/pJzSvJuwK/W1aKIXxnqrmkdZjq9CKJnZ5pFv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Neph803H; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Neph803H"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9178510f3bdso38078096d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791469367; x=1792074167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9Bk5WdlTS5GWj3gecV1hQkLvdo5DtdQs/OHFj/sJG40=;
        b=Neph803HWrMHjnSfIlJKSQiDcfOIhPBVL/2YxFQKuQDFvoFxoPiL2g3NXcePc6+Xw1
         BW/iilGXZo3aSQcQ0St4YKCRtkdR2nol+lBnswCo5S9Xkt1xfjJcasElcwp8zf2MTM3N
         rqm7PuIB6OOo0KI9WKSlNo9oU6aVB6CvA7BiwfzO+6Ira810kIn2O0XjAiHY9llHDugY
         2Kv9eyKRzJIcGkABtBov7b2DBZ/tXIdJLme0q9Zl8wkX/5DV0pQcvl1AWlUIWi0ys+gD
         sX/X3ExCEiVCdonoDhJipRNsfCXaomLJduJiS3lEMASMDzZd0JTC2sWtmsM3FZtdQpwe
         sZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791469367; x=1792074167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Bk5WdlTS5GWj3gecV1hQkLvdo5DtdQs/OHFj/sJG40=;
        b=VeTm8r7vSlPAW1MT2HJBNO3vCqBiYJMv04bmpRJ79Q4isTPKJKiH/pflYX354ixhC6
         CkANZ2nhxh2zGItKuuxthL2nOcNKvU6qkAFYo2cpKzZ5j6Ww2Ze5Bks6aeUjsRsoMQMr
         EYVVMnXmg6/mca6IMBBzP4sk2AYTyaK5Tuh5DBv+74vvKk6+4vLiAHBteraGwXDPcRL/
         4ddpo2CsEFKTvvanzKLLVJwiYeQJ2reurbLEOWQhXGv0VASSr4HRoqInSzMYdCyEh/T9
         WIvJcxXICO7PH3h6ja7DzPEMQmYIOBQ3KrQUbpLEjl+Ypqsl+0MFqb6F17GuBOT9e+Te
         s/zA==
X-Forwarded-Encrypted: i=1; AKwUvByFtyH9AD7GztPACE2v1BcnWHduaxsMh3gvID03mVKhlUX8HVsAL4/igFxqJgkriw0lF0ZQq+8r1FYfI3M=@vger.kernel.org
X-Gm-Message-State: AFuF++mgRWQIRgSWiJOsMIpFLnB1suIRLZl5p9i7WpPA+vZbl2883R5M
	KqayNdZg98WspWQHVNqtDtMEpOBdpVDY82rY/a4jmoodw8X73v1/h5Lsz8BtFBuZ4A==
X-Gm-Gg: AYBFou15RtCv6ujyzN/9zd9jKNaD5r3l+oAaGWoMypb9ZVns0OhjniPWp4d4YYoZMX7
	kCX9FrFiZUrJBz/Cd6JpNK1VnwZjYttataqqwr8bWtfXw+augQQdNx/V/9c7tc8gL4ApGRiP24/
	Dkd8/EgQtmFsIg28cCPFM9JXaoXJN054Q32DS3lolsM2ezELnqy4YTf2XTkWDZ+1gi44LzfshVA
	eKVWxAQSQ5XoEuedtZJx+KSlxJrcHLz1B4vwYv1pXbOhiKoXAhncyVFfQoyXgMcK+040F+cbrPB
	Uv3cyl+yiG0UVfTghNCBn8+TKMutnsfF7r4kKEYZLMFhcGfyaJfOOjLa9JvkISe+SDqZe5y3XP6
	xoi3EM9q5XyiEdcrcJksOEh1PM2ik590+xzxzDEKyCIesI5fRZFgTvFyBFhvvyIGEWNua8k/HU5
	+mvcSKsJNE14wH31yMGrt58cYMg/W+bt2j+AkyRTn+NFFPksbY8X7FAuyGkPiVcKAXi8lRiTgB6
	0O+OmFDjXqV6YRmCWktgXNsP6o=
X-Received: by 2002:a05:620a:1992:b0:93e:9807:9784 with SMTP id af79cd13be357-93e9b8201b3mr1007726285a.69.1791469365187;
        Thu, 08 Oct 2026 07:22:45 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e991580d2sm488539785a.21.2026.10.08.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:22:44 -0700 (PDT)
Date: Thu, 8 Oct 2026 10:22:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>, Zuo An <zuoan.penguin@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: ABI: sysfs-bus-usb: fix typo in path to interface
 file
Message-ID: <45fffbff-1653-45c5-8e24-d5a580faf5aa@rowland.harvard.edu>
References: <aseApS_MWoP3Jtp0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aseApS_MWoP3Jtp0@gmail.com>

On Thu, Oct 08, 2026 at 11:38:13AM +0000, Zuo An wrote:
> A path was misspelt with the delimiter between the USB <config num> and
> <interface num> as "-", when it should be ".".
> 
> Signed-off-by: Zuo An <zuoan.penguin@gmail.com>
> ---
>  Documentation/ABI/stable/sysfs-bus-usb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/stable/sysfs-bus-usb b/Documentation/ABI/stable/sysfs-bus-usb
> index cad4bc232520..400237db166d 100644
> --- a/Documentation/ABI/stable/sysfs-bus-usb
> +++ b/Documentation/ABI/stable/sysfs-bus-usb
> @@ -60,7 +60,7 @@ Users:
>  		PowerTOP <powertop@lists.01.org>
>  		https://01.org/powertop/
>  
> -What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>-<interface num>/supports_autosuspend
> +What:		/sys/bus/usb/devices/<busnum>-<port[.port]>...:<config num>.<interface num>/supports_autosuspend
>  Date:		January 2008
>  KernelVersion:	2.6.27
>  Contact:	Sarah Sharp <sarah.a.sharp@intel.com>

In addition, Sarah has not been the appropriate contact for ages.  Greg, 
would you like to remove that line?

Alan Stern
