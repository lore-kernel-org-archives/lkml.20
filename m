Received: from mail-ed2-f32.google.com (mail-ed2-f32.google.com [74.125.228.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062BB37D11A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 10:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790848815; cv=none; b=GvKevLzYEQijIGjsQis0XI5Al+fFBzOE/8ofADn1mW2RTJum1gDdVkc7EX7RKjyGm3Y7saeJsSMR/yKXaCgONtdaKEMQX1fKYuireA3Rfpz2IuEY4wTgaeUewynUkKVDan1V8EQa2TdSfGSSex0p106fMgnDmkSsSs0mXN80sYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790848815; c=relaxed/simple;
	bh=lVdGv+ilr9WlNpGBFEGFcM/RnLg+9ZGrF4ALyk+UVls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJB5cvZ6JIyRAez0Rbs96HmM41zmc08v7v7U51dOVoui77qNKmKqblCNHy5mHyFjseVts/GLBgu7xkZF9DhYKiimOK7mjtJiTy7mXIFztQPml2jRVU8j3iNwi9nEG9Yj5+R8gpIq0CRYrSDLgGh/W3BsHdUG5+FsAu0nSJ8DOnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHkpnqfd; arc=none smtp.client-ip=74.125.228.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHkpnqfd"
Received: by mail-ed2-f32.google.com with SMTP id 4fb4d7f45d1cf-6acae8342d2so4882561a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 03:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790848804; x=1791453604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tLtKrXyBLHYLDfJn7C9+9PKs3haoxGqRb1SBGI62Z74=;
        b=IHkpnqfdaJDYH7QKqMZhfuG+EwH2mA0FiXM5aeTvtK+Kyqfdl9ZvfPXAiVcSmMM637
         u/2GuLEKeGBt2ZEbIR8sx6RNuaW93syxtTzzeEsm0wuko1o8foD/wfGqiUS47xdcUvMb
         e8Pv2BUM6W4TOxhobJDOnyIS/XU0Rp3lapWTvgfZYtfk6wpfDQ2f20XrNBdCrkqZkQBV
         aQ7K7gKUyWkdnrat2PeBnM3ci8scMGrHTOhMzQ3Rb8lTV4ABMagVNnNJS0PEZsYNTUTB
         ZO8v2OSa3yvnvKFnxH96kB/fkyB57GllgvrXmFV2N1eYeVlIMx5XqfuEi5EwlQW26HbC
         nCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790848804; x=1791453604;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLtKrXyBLHYLDfJn7C9+9PKs3haoxGqRb1SBGI62Z74=;
        b=xppdUpkwvlmeDDDrnfi5PwIi6VHI7xxpDsnQNRni8I8zoU+3tQdmtyzhfHDwQSuiT1
         We0kzeCLUxJO6XORilPuojK/dNGfbPDx9XaloKadIOrdv1L+VRxe2WMJgHbGDMi6WSOd
         hcwGKeaXDm7PsjHm5fLrYyvocmICTIE174ZMjIbxm7OBoxIUlg6Gsatt4VGKf3BRiRRA
         6HnG+x3OcrKeyIpMZGAUXiMoDdF18Po7b16pIwZ+vsvabxNVgGsFUfQbzKgazD1SPaBo
         5GqRAimbBkO20r3+6v5n8U/eBM4bmYEh3KN2qR5SAL6DBmAAaMiLBmMpQbqFG9jfNx4X
         M7kA==
X-Forwarded-Encrypted: i=1; AKwUvByKYnvLmzutixNJl11SgRUDvXpIIuTZEOJyLC/NqvV/WibbX0yQlAd3g1T80MCaI7Sy5POd41zyuWUSgxM=@vger.kernel.org
X-Gm-Message-State: AFuF++l0o1+NuWxUjJeF64laYD2EP6aWnY6oUzqmK+yE7euQAQDy5Zei
	sr0WGLR+H3kSwvntxaYNkKZhsg0nCY3swfHn7fe6+efgnKgjqOvgSM+c
X-Gm-Gg: AYBFou0rzBvxkZSpupoaI6Tr/NyjaosOHjTzoLiiJvLRcVUfk+k8cjVblr2FVZBW0Q8
	7goJP5ms12LF8YHVV+T6v9nqJs9vIkTeLJVNjKQHe4Z3eXZDuu/XOZBTTS4JiW/b58d4sURiChJ
	fxe+aM3CeGobfEQ3+eZoC0iMDNP2bnd3mAMye9a2TzCmXlJK6izHbC6d6W8qPcLMRttsrLitXsv
	wCh8E3xdLZjDiusQw2c2mmXhUPQ+sHHVwigsoaqOURaUJg53ErLYRh7YCQPYlAd/tUolJCHoT/+
	IKy0CP0RNsOLfBwhyqi6wO4jXXdo9wAhfvXRd3qQhnpxsECBezM/WKMpsDeApG7upxnXSbBuGYu
	5c2i2wB3Qj2zXTiaK83flhinXs0IqO5iIvVxYcHQrmYren1YhCs8UZz2RfElxf2Uu84ywsbsxKF
	pPksRjRPlTJvh74awxjBHAFLSz3F0hcqQ/gVA6CjvYN3nq+4SXkGMYcQhEYq+Ab3XLxC8=
X-Received: by 2002:a17:907:d90:b0:c1c:3b06:ed03 with SMTP id a640c23a62f3a-c2e23d5fc90mr371870366b.23.1790848803545;
        Thu, 01 Oct 2026 03:00:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e451fce88sm4087666b.74.2026.10.01.03.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:00:02 -0700 (PDT)
Date: Thu, 1 Oct 2026 12:59:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Amirhossein Hajimohammadi <info@hajimohammadi.net>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: stop overreading monitor
 interface name
Message-ID: <ar4vH3F5lLFijgTU@stanley.mountain>
References: <3B4B0B72-4DCE-4E40-9E87-732DCBAA4EAF@hajimohammadi.net>
 <2026092915-luxury-shush-6b29@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026092915-luxury-shush-6b29@gregkh>

On Tue, Sep 29, 2026 at 06:05:12PM +0200, Greg KH wrote:
> On Tue, Sep 29, 2026 at 07:18:11PM +0330, Amirhossein Hajimohammadi wrote:
> > From: AmirHossein HajiMohammadi <info@hajimohammadi.net>
> > 
> > cfg80211 passes a NUL-terminated interface name. memcpy() always reads
> > IFNAMSIZ + 1 bytes, even when the caller supplied a shorter string.
> > 
> > Use strscpy() to stop at the terminator and bound the write to the
> > destination buffer.
> > 
> > Signed-off-by: AmirHossein HajiMohammadi <info@hajimohammadi.net>
> > ---
> > Changes in v3:
> > - Add an explicit From header matching the Signed-off-by identity.
> > 
> > Changes in v2:
> > - Send the patch inline instead of as a MIME attachment.
> > 
> >  drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > index 4416d0ec1..8f5032844 100644
> > --- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
> > @@ -2158,7 +2158,7 @@ static int rtw_cfg80211_add_monitor_if(struct adapter *padapter, char *name, str
> >  		goto out;
> >  
> >  	*ndev = pwdev_priv->pmon_ndev = mon_ndev;
> > -	memcpy(pwdev_priv->ifname_mon, name, IFNAMSIZ + 1);
> > +	strscpy(pwdev_priv->ifname_mon, name);
> 
> But we are replacing str*() calls in the kernel with memcpy() calls
> where it can happen, so why go backwards here?
> 
> What caused you to notice this change is needed?  Have you measured a
> speed up in throughput with this change applied?  How was it tested?

This seems like a legit patch to me, although it's probably AI generated.

net/wireless/nl80211.c
  5199          wdev = rdev_add_virtual_intf(rdev,
  5200                                  nla_data(info->attrs[NL80211_ATTR_IFNAME]),
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This means that it is a string up to IFNAMSIZ (16) bytes long counting
the NUL terminator, but it could be less.  So doing a memcpy() is a
read overflow.

  5201                                  NET_NAME_USER, type, &params);

regards,
dan carpenter
