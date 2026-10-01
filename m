Received: from mail-ej2-f40.google.com (mail-ej2-f40.google.com [74.125.228.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 273EB547044
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 17:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876832; cv=none; b=En02kcad9cw6BW3iJM2JTjNlH6qqlTY4CWKRmM0MNC2uLH04Pbo7vYLD8Q8F1BdHkSFHpm/hX081rpiMJyON929JjgF6uCMznn1LGpt7DV5nscWYXFemCbE5CP/gC6qmXRMl82GF0QrWZgjPrma6XiQhcS9bIeU8CBnAtUX6e28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876832; c=relaxed/simple;
	bh=yrsdKmL2y9lPPr18nFAgKM0SX9Dw5bHdA3om1AWFKw8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqyjxHQqLAnh+v9wrPCqTeaE9K3LJ7TNHoJzVzN9wBtvN1bKTGAde5RyjTTkIKKF8sOOGkEHExRvE4N77XC/N+HnFdMnIZS9JshoiIlbd8EuOTchpTQ8vZAY3PE/RVDYcd/xQzrQVVd4kFLw9WfCNGhLKxRhD2cbi4dLl3EFCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4jpHaqr; arc=none smtp.client-ip=74.125.228.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4jpHaqr"
Received: by mail-ej2-f40.google.com with SMTP id a640c23a62f3a-c2e417a5a81so112983466b.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 10:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876827; x=1791481627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H6z/w//LhWCZLSKNntdvRXZK6X4eFaUVprUdafE2INY=;
        b=P4jpHaqrECxfhSyGh8+WcasiSIs15/F8kZPkFbW/vZTjCMSuoGc6NFRkvkwjePixum
         /jKkW1nY1FKPBjJsYIi0s33OezquFWXwf6VbGm3cYPlApS9DtQXZkwia71WThCqazHm6
         SQuZH7bRe6x5UhQPu3xzQ92rPDjcuLW78LhSUm7hS52tsb2iBdgUYkvtLx3L1b7LoCT0
         SZ7e58zo0ab2mwVWJYLjai9ALgPhpvyGonLDoYGW9qxo3YhNA9XhFlOJF7wmhMdu30S7
         y3GPj3LtDBqsxHmLkmrxvd9g5YRpV96krU8LhwVGOGlQCRxlwsDGRjm4nSukLAdZpKIE
         s44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876827; x=1791481627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H6z/w//LhWCZLSKNntdvRXZK6X4eFaUVprUdafE2INY=;
        b=ZUwTYCJTS+N56cvG/SrJn/FAItxO85Wrow8p5vEc214b7fnv53jh1ojDJVoCl+qz3u
         FkHQm5C0aRBSrnYh0ySL1rwTdHXHNbkBAwSLZGevB0T+dXUmFtmneNhxfq2KFcYqlacF
         YuOOMpuR06mc1jKMcvK3pwqnbmcUaOql16Dgylp6KiUGSUQR0eOYBPopOkq498Cn8hNF
         snHVMamslk61thewyY0a/2coKFW0Nti1DUmgLDm/YyTBqI+EzJlnFwm2nfXMOSIegedH
         5JsIaVAsgVk55wobuHFjDUVmjqao5S3dQffM9GwKdXsu0hqRJCuOU2wCVM44cde8GQQq
         luag==
X-Forwarded-Encrypted: i=1; AKwUvBzZz4gJsRUy27pm+qHBVq7/7ggN8SywVhPbHrym74fC4r+DAfYVLYfq5yuFygEM2vVjJH6KyXeP6RZ27X4=@vger.kernel.org
X-Gm-Message-State: AFuF++kQ+Bsdi2CENSrvAEXXA0JX176m9FSpNAk/Uq/hvLxtlIHvhJjD
	mpftWz4REUjojVwSpgmkPZoMkznob3R1jYlO6BCd4/ybhkxuG8gmRst3LFoXNaXPyWyL5g==
X-Gm-Gg: AYBFou3ft8tLwkmBEuogMS4y5bAwYs9IDTIE38OR1yD4eL+N1fPhw3z7x6IlcBKEI0B
	bOSgFTrk8MrGh+ZVfArFZ02lSa8O6DwAVsZfI7VOhRhKBAQYW3xNE00GZatigDCHauFjCBBdQtT
	T2ZcFXYDVIPt8q0aJpUt+IzEjL9iZx4oFb+bbZ2jeevEFS1nLb+xn7bHvwqrgEMAbJF0Lkzvts9
	arRREr5omHu4rMP0r2DmBbymMMJgaHit3TZS3VhTuQ7gzmmPyV0IGBiUqEfGb/rzXe9XFjVPEDH
	tLX4K54wy+1IMGL+VIYNGqQ4BbTWwkLMxuha2jyikDrQDahwdFQgk+BRlPi10YOpxXDKreZpvGv
	eGAt0QB+RRkPYhW/fwYZ3WTLgnkqlb1SdFSLn+D6q77QW1Zd7hj1QLajKUKUfBh00R8jmirl0ja
	pzKHbpxBCPCc1VKAeomNIjVC9755mQXgRpIHdcW0r7j4LUxFuv8lYCM6uPij/Y/02X9flVucf0r
	eOX3Q==
X-Received: by 2002:a17:907:ea8f:b0:c25:6c9a:88bc with SMTP id a640c23a62f3a-c2e4ad565f4mr28222466b.19.1790876826406;
        Thu, 01 Oct 2026 10:47:06 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4b9b1f4csm11560766b.69.2026.10.01.10.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 10:47:05 -0700 (PDT)
Date: Thu, 1 Oct 2026 20:47:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Amirhossein Hajimohammadi <info@hajimohammadi.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: stop overreading monitor
 interface name
Message-ID: <ar6clK3N4by6EN0O@stanley.mountain>
References: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
 <2026092915-luxury-shush-6b29@gregkh>
 <ar4vH3F5lLFijgTU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar4vH3F5lLFijgTU@stanley.mountain>

On Thu, Oct 01, 2026 at 12:59:59PM +0300, Dan Carpenter wrote:
> > > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > index 4416d0ec1..8f5032844 100644
> > > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > > @@ -2158,7 +2158,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
> > >  		goto out;
> > >  
> > >  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
> > > -	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
> > > +	strscpy(pwdev_priv->ifname_mon, name);
> > 
> > But we are replacing str*() calls in the kernel with memcpy() calls
> > where it can happen, so why go backwards here?
> > 
> > What caused you to notice this change is needed?  Have you measured a
> > speed up in throughput with this change applied?  How was it tested?
> 
> This seems like a legit patch to me, although it's probably AI generated.
> 
> net/wireless/nl80211.c
>   5199          wdev = rdev_add_virtual_intf(rdev,
>   5200                                  nla_data(info->attrs[NL80211_ATTR_IFNAME]),
>                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> This means that it is a string up to IFNAMSIZ (16) bytes long counting
> the NUL terminator, but it could be less.  So doing a memcpy() is a
> read overflow.
> 
>   5201                                  NET_NAME_USER, type, &params);
> 

I tasked ChatGPT with writing a Smatch check for this and it noticed
that the "+ 1" in "IFNAMSIZ + 1" is wrong as well.  "name" can only
be 16 characters long (counting the NUL terminator).

drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c:2164 rtw_cfg80211_add_monitor_if()
warn: buffer 'name' too small user_len=1-16 for 17 byte copy

regards,
dan carpenter
