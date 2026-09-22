Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CDD51C07A
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061777; cv=none; b=pQwN10vdbg04bU51IZ9JfnEv3+V7yiUbRZn5n3I5GvCa1TLwMs/qlGufEI/qTf+xG6CeGFEHqtV7Yggnqofa17DULc5wb8bWC6kF9kah2AWN/OnxTKucjFskTpnVqTKOAGo/MJ9mBikAoHNRYVWKXPNTVAIQHUVWntgYBagWRyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061777; c=relaxed/simple;
	bh=g2Xy9jDjDZ3K6DmNsnmaoN1dj1u+mGq37X7BB/6Az8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXAH5RTIt0PcEdvgrjMHOjsS0idDZB2O8l7m+xqGPOHbysO4cf2E7liEMmRaqAsVj93EuVo3vxpstPBtZmfei8GLeOHquiH/dpCK68kwDBCUVbli0NoEwCuZA+7cM6NF5QVZbazLJKsXrhjrL5Lc9UWI9Bg9HLTx63+UViOAgDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJQ8jYIp; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJQ8jYIp"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48586861639so306928f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061773; x=1790666573; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zOpUj0Pnwod3tVYOQ3yCnTP6vZoRZm1tHkQP7O06AhU=;
        b=DJQ8jYIpkqCnzQzOVX8ElvdpMq4WB9zTxZW+N7+moxSrZW0gLFoG6CJLMljnRO4OEL
         eAdNQb4WyHZvTWaAdkEZhutbCMwg7y3MqYKtrxg8TazD1+QsibKE9YIk99JqUh4aHTn3
         haCoXSuZ7+KogBQeEj+pbpKEMhMWpPmqqhvu2kvt6ISF48yVUwyg2SaFjZnlAZ3akfne
         pgwSvrHdmvzT+0yr5D1uvdh6QE/9NDgV59lm39Bwjdkg4Xq37p4grHI+9r3pMe01C24c
         lJ2DkXx3Dc60SHVeX0AbiUrWxT79ZmbeUjft03/Vi3C9gu6OLTqz3iam7dMjhy1C51IA
         UYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061773; x=1790666573;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zOpUj0Pnwod3tVYOQ3yCnTP6vZoRZm1tHkQP7O06AhU=;
        b=p/0F8J6rgaW35rljDlCOH7od4a09IM15mNCPOZ+p3KZymcqaxnUzJ3h+03SctyRqJq
         WG+cV9BlrdZ6S341V5yLXqHdNL6rWOCenFRl3BJtoLRDjFiFhLDze6njY2vRv0O08AOt
         PLi4eS/j1zDv3w4cHwUVBjpKoSpg2xtRt38aGWqs1GFr7bDtSAr8f5JzgbEnYnFFUxRY
         8xXHqKcCej3ne7WvRGNYP/VlRPUXBJ7bCH4wxCJtDdot3zuMnTD2y70+kqXxeA48c5M4
         +kIORfOWb3itCaoJfMwQTxJXmSPT/UkAQzW3BUwtt7AHIucD3xq7+KFmRp0ESY9UEgSI
         QdBA==
X-Forwarded-Encrypted: i=1; AKwUvByYff6DE0pN35hg+j8DFyWDOvmCu4nJzMgEA1Pq9D4zWJLvTx4gQiRe3UJS3XChsfjl9X8ZleVfAAs3RCk=@vger.kernel.org
X-Gm-Message-State: AFuF++nzz9DbHXCkWULODYDYAGG7ZH8yRf5emNj/UCqjAe45LSWC5EYb
	xHfaUJDs41EwmKUobw3JcxbNZ+Waqf8vlQhGpWJCNQE2pKf42qN4kqEg
X-Gm-Gg: AYBFou14LdAfwkbpqecZr7xRs9VXrk4s2eCTlWgjU0hKmToU2AFt56nNkUB2QB9mpUh
	NxpTZE3LWUu8pPsz+RH1ghSfkEWWQuEc5hZ8AR8R9iL5GXKdb7p/Whb4GPvao+eF/rVXyuITaLU
	q1fcuWW/Pu94PgvPfVyyxLO/5G2vl6yk1NsLWxAXnFdfY+vp3KgJpPYxiy7e3NNqcy/MY/nV6Sc
	HRFSbNPmvR6z3D1OkwGqkTkfmWE1UwR7H/fmVppjYXzODRL8pBRQ7Xc91qYlhoagC9Tguru1UBj
	WMaOjvThP09P8hQCb0JmmilfkbkUSEBj0/AqYhCbYSluvsZCuf7mVmcotdf0ONErYObUo6YfLRJ
	oTJ4ILOXPWnxUzVTLBhYTIbn1n3WsxJooDSdxbWVlNJDRDNrKpV7X/F/Z3HHUGU7kDoZ/OaKYZA
	n6DDOWyE5og3DJ2+KQmT2epmdXF8Ljcxvk9EtTszZfHyG8gHn5xDoiOAn1og+BJJy+jTkOUX9wA
	mRwpQ==
X-Received: by 2002:a05:6000:41f8:b0:485:8226:c69e with SMTP id ffacd0b85a97d-48861021808mr2450244f8f.29.1790061773363;
        Tue, 22 Sep 2026 00:22:53 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862793792sm3387192f8f.31.2026.09.22.00.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:22:52 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:22:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: Lucas Costa <2000.costalucas@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: free cmap on framebuffer release
Message-ID: <arIsyPJno_UGVvSK@stanley.mountain>
References: <20260922035302.167378-1-2000.costalucas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922035302.167378-1-2000.costalucas@gmail.com>

On Tue, Sep 22, 2026 at 12:53:02AM -0300, Lucas Costa wrote:
> The driver never calls fb_dealloc_cmap() after it has been allocated,
> so when the buffer is torn down we leak.
> 
> This happens on every unbind, and when an error is detected in
> sm750fb_framebuffer_alloc().
> 
> fb_dealloc_cmap() gets called before framebuffer_release() in both places.
> 
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> 
> Signed-off-by: Lucas Costa <2000.costalucas@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index 8b93bfeb217b..92412534239c 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -910,6 +910,7 @@ static void sm750fb_framebuffer_release(struct sm750_dev *sm750_dev)
>  	while (sm750_dev->fb_count) {
>  		fb_info = sm750_dev->fbinfo[sm750_dev->fb_count - 1];
>  		unregister_framebuffer(fb_info);
> +		fb_dealloc_cmap(&fb_info->cmap);
>  		framebuffer_release(fb_info);
>  		sm750_dev->fb_count--;
>  	}
> @@ -943,6 +944,7 @@ static int sm750fb_framebuffer_alloc(struct sm750_dev *sm750_dev, int fbidx)
>  	return 0;
>  
>  release_fb:
> +	fb_dealloc_cmap(&fb_info->cmap);
>  	framebuffer_release(fb_info);
>  	return err;

This works, but I don't love One Err label style cleanup.  The label
name is no longer accurate.

The cmap is allocated by:

	err = lynxfb_set_fbinfo(fb_info, fbidx);

So ideally there would be a cleanup function which is called something
like:

	lynxfb_unset_fbinfo(fb_info);

Then we would only call it if lynxfb_set_fbinfo() succeeds instead of
if it succeeds or fails.

unset_fb:
	lynxfb_unset_fbinfo(fb_info);
release_fb:
	framebuffer_release(fb_info);

	return err;

See my blog for more details.
staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

