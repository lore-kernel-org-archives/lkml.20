Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF104E50AE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631412; cv=none; b=IR+B3IhJsuqP7EZVFFXbpTFZauCkvHj2PlGblDSVzGIzwY8GmqeGPkcV/T/eRsIysO4j7zxC1xtraTehdM9FC2/qwWbywgY3YNWPtpWqwGSDlQfF/XVB4rohTt6WXS71wgyLolysVeMpoFqyinjYRNM4AUSprfXyXQLa7Jw3bNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631412; c=relaxed/simple;
	bh=aPr+Qi0GqWk/BrztXPdzLLv2v1LWbUl6I2/UmOUxrGU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UL0qF9MVwh19ZmyUi8BqL8GBQpTf5qeiKlskJFv1wDzukBrIvGibpr+oveLfEnBXae1+tNighEuTl5qyHZwxvMRayoSSLrpXALPvxDF0Tz+kET+aMWgvX4COyNschTs0UXV8eogUYjEh4kwmi16kiYvGMIbsvj+y780yukD+tmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPz05s+Q; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPz05s+Q"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99c5de614so703083a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789631409; x=1790236209; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qQsMi3oaSJScdRbutpiL5WH0Qa1SNOuUKKoGIIRm5XQ=;
        b=KPz05s+Qg8PcmgTU4cSKSG8cVtvjiAp8mgG/Igrws6ctO/GfY2zcv9WpIo6Ewojb+D
         qSs0bQhvB99a1jpIPpDiX7cJUTBTBanrEEeaHlFIB1ef74g69fVty7zPHSgl0Dhp5Gny
         hxex6AzvtZpkPgPQccx5OqQl3iU0XBRyeL4X1aZRHn+kT/5/p8QwCeJ66jw8pMLOzUIp
         fcWH/HVJlW7ob+EnfmyE5buhPz0OAQZTs1NQngsWqNa+uSCnsjs3kYc9cgkrQEA4M4DS
         1ouv4mZQO0cHnoikhfx7AHKbe17qL4WgIEZ2DUpWyMeHnGJ7pMjDRVCH+AaFpJoQAAKI
         jgEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789631409; x=1790236209;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qQsMi3oaSJScdRbutpiL5WH0Qa1SNOuUKKoGIIRm5XQ=;
        b=DW/LCurhYBeoyuIHFGjAiNdvigbn3Y7i6L/YDQgaz6VxfJ5toeltrnX2M3S+aE1J3x
         zGI6fAUjBb19/y5WiKvO7eDLkWrsLb78kF86K6kgy7cNhqAEZ54rC0jVm1SRwyOJRqFV
         oHNYbCXk5XZTzgQ+/GVCh2XEDHMdU7YjjLClveRKHo4KMUNPX3NJHHqDpUYVfgNfQJAm
         Lgy0reGSyq/X4KMKg3df0CEvBwgtLPR9KL15+l7rsHpDHrGJ4XWaSh720VwKwHos/ANH
         uJ0IyEFhbQwXE4o9fQTlOo9iD9u47+Y6l/ow0251sYr9vjSCiqb1tPXIvV55pDvvPZ7m
         GAYA==
X-Forwarded-Encrypted: i=1; AKwUvBwMPxe1Wce0227HToTVtgN3jCDrMaxfzyDT9lCSpJBykP9NAxOrQYdmAA7TAuWsICOYrs9ZNsRNkFnOeno=@vger.kernel.org
X-Gm-Message-State: AFuF++mkidVy30c7+52OUV2JdINFuhxRS4cNMTJVA+nNjO4sPQin+AXn
	l9sZw8KE3KbDL5jCePBQk4a6LwtFzCaGtKBvYEuv45bag88c/pxHlnM6
X-Gm-Gg: AYBFou2IyinMTfQhZi551/x/dxUibuwTUvjvseZb6Mm3yjQJHjw5nrKEbtC2p0bcVom
	WFdZW19cQwqj6bCgYMV/WNm2KTxKJjqtpCSUK4Cwjv7wO2Rsdpq1UaXTpA4NI2+n2SIxc6JZb62
	zLljbhwis6TWv+nDc3HFXKYN+LgYn8HcPJASQ7+0pE4RB7ST0oSLDVJRUYJtYYQv4neyAhaO2VM
	FA06Sx76Y7pyBsCreFD3ZPDGij8k3AK7Gt1cvTn8T2CZn6vbfS6bg2LvpTmhHV48jmQJyyj+uYj
	d+KvDHlk5C1MjfbJGQg5Lic8Ovpi4CgI1IFzKztJqJSHb1ebKDZTxM92ipse4244mXa7mGWRjjZ
	A+I2VXoa/FtrbqTKiQVq7IUt7KY+urJ1nCWKURO6NFo0sDwyPpaZ4MlFchSVeXp9TMO2t+6RXCZ
	pjjIFEX1Ly9hhJEtyzpkcZkkxZgKoWG6OXGoaqrbLHuYjbYuyxFvwDIU0hbYt6JGCR5TU=
X-Received: by 2002:a05:6402:5d4:b0:6aa:1cf5:6076 with SMTP id 4fb4d7f45d1cf-6aa222624b5mr8120998a12.1.1789631408370;
        Thu, 17 Sep 2026 00:50:08 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2a272dsm3101894a12.28.2026.09.17.00.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 00:50:07 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:50:03 +0300
From: Dan Carpenter <error27@gmail.com>
To: Omer PALA <palaomer100@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Message-ID: <aqubqzKGtpmDkX9W@stanley.mountain>
References: <20260917071931.8063-1-palaomer100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917071931.8063-1-palaomer100@gmail.com>

On Thu, Sep 17, 2026 at 10:19:31AM +0300, Omer PALA wrote:
> Replace msleep(1) with usleep_range(1000, 1500) because msleep with small
> values (<20ms) can sleep for up to 20ms due to timer tick resolution.
> Using usleep_range provides a more precise and consistent delay for
> hardware power control operations.
> 
> Signed-off-by: Omer PALA <palaomer100@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> index 448611ad8..1d3262413 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
> @@ -561,7 +561,7 @@ void LPS_Leave_check(struct adapter *padapter)
>  		if (jiffies_to_msecs(jiffies - start_time) > 100)
>  			break;
>  
> -		msleep(1);
> +		usleep_range(1000, 1500);

These kinds of changes need to be tested.

I don't love this checkpatch warning because it we reject almost all
these patches.  If it were new code, presumably the person sending the
patch would be able to test it...  But I guess it serves as a kind of
lesson to not listen to checkpatch and also to search lore before
sending stuff.
https://lore.kernel.org/all/?q=LPS_Leave_check%20msleep

regards,
dan carpenter


