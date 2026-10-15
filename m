Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B03A51C047
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792065468; cv=none; b=gehtr2d2zP7u2PkTGaIl4xhPAQuuVp4G5PWbP1F18aCSnsBU9fIewv+Cjb/FzPxd5qDA2ZqMGW3F/n5z88+zfMg8g/fNrXGFAfqwmqa8Gm5tkmT+5Yt5CeB4Ep90W/fbRLfAIWlP7lrC5TEbtn1TM7MPMx4IDpYrnnNKitRcCrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792065468; c=relaxed/simple;
	bh=VGToypjARbE0U7psVsR+le/XXqP1p7U8tiE+d5jRnpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uC5Q53tfPgmkMsV09kr4QVf1cvba/yMKFFXtg3CsvbudhoqOrC/p4c4Ur2wtXZfB2t+WifHv15dhSjAA82+xq24rtQwKys9LyEtaIoPzUVikjej60f1TGvqFpmeniIwXkC9uT4RjRhehP/MGlEhz8uP7nK106WaBb8eZhbzO2l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j01g+Fhc; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j01g+Fhc"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a02718da81so41618415e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065465; x=1792670265; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8sdIV0UTb1SAAI8e5ZPa5eDGFk/H/3IVRF9TyC1rxg8=;
        b=j01g+FhcpU9HYCXQHBbEdJms1snarYkWtvoxDwCAiI/d2AhenTMGcO+m93LnSJrMDk
         LrfpYgNRG5bwpAK3Orw5QkyM9wlRZayNPLbmLmU2ZAkgS0Lam8pTFJqRFp5biSvAvgxY
         Ddx420RtzAD1DbF61eqWd9QJiJCPU7wY40Y9dVG1jkUxTj2Ji43QvIiaJS3UdzZCAdP2
         UTYKdmAursuTfwCTGDdcEXVQTJk2+LqRMiNAVRG2Me1wKk9C3jy1UJjM/bmmfKMIfcln
         Nlo314c+GhSUMcCeWe0dvKooUAG/Laes2sQCQvw7hERlAoGNH1+v7vxELFVh+ca8ZSVz
         E1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065465; x=1792670265;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8sdIV0UTb1SAAI8e5ZPa5eDGFk/H/3IVRF9TyC1rxg8=;
        b=vTVEdb7iiWmKkuVTzyppzxcq+HWkYyrB6AbdzMnxzcBfrn10R2DzLOpVxSGcj3PO9d
         rf1M4t/SZqev2jZAIkGfShbHGc9E07Yal8hJZym2Y38KTMXgIxHxMQkGnAU33E0863/5
         +Blqt6Gb9qmepgXfG+xZ9p8Fb/0Ado5FQXGIyKR2CS7q67cufiZI8e89zO+cO7+uXTJe
         rqGu3RtxBgAiBxEUVxVoGFEiNbgfn6KzTKB2GwVyzQC2imq/Q9+mi90gv64sAfOsPC5g
         BYp8XidqQQcC63R7XYmZqtg2ldB/Db2IesjFsQ/g+ND+VwkGgVVj3/hXvI1KDhTrQKjV
         0q5w==
X-Forwarded-Encrypted: i=1; AKwUvBxSY0nePsuVrB68qe/JtssvUkDdan9v8bNhKBDyfjp6NLE86sdd4ZRAj2/fQG6bYtuM0choPjcxo2pWlC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWEpkcps6VmU3HPE1hipTFVXaKzkJUBAZZASDFmnOCMq81YCRO
	5QEK4jTX3WeF+P4Jxg7h6lSqKs2Mgl0NZmitbyyEJfr52BRbFiCFBRhO
X-Gm-Gg: AYBFou0H5+gxYp4KCEzuj0lvfa5z0bKpSPjvsUaOvf588Xg+JQWuTK7+OYzNDnkDLqX
	okz0RVpBEzfZLOAslP24t4F4Nw9POnQbhHqbzj86WCkSmX4C2GVA9+UpCaqKJu2Wii0eYzZSu8d
	8fx+Wrf9BeF02fZrORkszE9DhvdujtORu5Ci5Oyhy8WHitNP4hp0kl20PyekL7WabuZSO4BM1Qd
	FzaaSShmfjTT4QrA9xrZvG51fOdQt9VP8z19CIqJd8YBddN27rDjykFVszFxa4vOeTtIWRZr+mV
	/2E7ZWOqBiUbVx8pM37kTK7YuUcvENY3jt10pPXraJZkymjKOTj17p6If5zfPrANS+uJxH6gca0
	V+lJ31aFz2V69XBOF4plhiOU8HQu3p5pWLqGg+GS07oSBH9aw09Rhrsb+hMrZOjW2J9eAjFqElv
	aQRaRPMA5diAnKW0SIY1tCbYkI/Pl3EF/t1lEgi3h0xdMCSk6Rg60uad3lsUtPfWQCREA=
X-Received: by 2002:a05:600c:6388:b0:4a1:6f78:8419 with SMTP id 5b1f17b1804b1-4a18e3ee8f9mr379768385e9.0.1792065464664;
        Thu, 15 Oct 2026 04:57:44 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7273a0esm14406930f8f.29.2026.10.15.04.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:57:43 -0700 (PDT)
Date: Thu, 15 Oct 2026 14:57:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohammed Sohail <mohd.sohail.biz@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove comparisons to true/false in
 rtw_mlme_ext.c
Message-ID: <atC_s6Us6nk3hRaC@stanley.mountain>
References: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007162114.138541-1-mohd.sohail.biz@gmail.com>

On Wed, Oct 07, 2026 at 09:51:14PM +0530, Mohammed Sohail wrote:
> @@ -3868,7 +3868,7 @@ u8 collect_bss_info(struct adapter *padapter, union recv_frame *precv_frame, str
>  	bssid->configuration.atim_window = 0;
>  
>  	/* 20/40 BSS Coexistence check */
> -	if ((pregistrypriv->wifi_spec == 1) && (false == pmlmeinfo->bwmode_updated)) {
> +	if ((pregistrypriv->wifi_spec == 1) && (!pmlmeinfo->bwmode_updated)) {

Get rid of the extra parentheses around (!pmlmeinfo->bwmode_updated).

regards,
dan carpenter

