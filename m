Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B913D6484
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 15:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789484532; cv=none; b=uSF4/IlfFeYZWCyiW02nfK/SH+I6+TfgDVEZVfyfieX5hJ5sjpaZT37mCWL5mfqFXqS6PK6DhQnoshrILpKeVCvvRBiXeMd+858uOI3Q+qoxV7V/Rg9oC4ECX4Z0FLSXGe7kwvqpst23zGOCGX4ebX9P8bZ7Bv5pJiOMLgQ1lpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789484532; c=relaxed/simple;
	bh=/fHR+cBcwXjSOEnwm9YuzA0ScboREtQG9KUAT8U1sYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qhMOt1hdlFFjXJ+Slq6X2B6NvOXFsgO5A9ap6dCzAl5zyY2GFms5jV86HtgpZIzlisK4c53hoBhxXYY1zhcspzDZ8+Df4Jr8OuaVXydlmMZ6YlzLdsXYuKao8Smpb67i92YIaG1kRsmALX8c8NDeGPQycVIeHewfDXcAekUIhIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lUEhmFI9; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lUEhmFI9"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-90e9ad1a373so8202876d6.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1789484529; x=1790089329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=;
        b=lUEhmFI9hDUFlYf1OXD/Fsky0kt/I1OlCFFYz5x6l/nL4OgsnoK9Jr5PI0CUblUBHk
         J7P9dTf80WJ9sDzpBb6u2cedcCaAvGiQr3INywu6Pu63MlbYIk3/indaY7CgTNLQc0eQ
         GiXlG2f9cclElYpUF/QT5dskQ1Gi7WhQPrm+ZqIb+yc8E4tJG05lzbF5KFGUvZNnZ8K/
         1z1iz4d0+TBV7IQkI1vZVUJQhp00bkYBCIf45xXJti6zSAcK0lv9CCrOMMluqz1VpQwB
         TgxR7N2s7NDvuReQeEKosiWUbmkZbWyOkjCZKB1lEQ2r/26QvMoGuQww0Sh2PyroXLMB
         Eqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789484529; x=1790089329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=62dnS9UB1nI/BR4/ltxJuhKZokBySflA5rnVbV11GGc=;
        b=Ihr7adQTC1cUXcQCeQLc+eGzZWt1d7YLu2H0VzTTcjTIead+cJGUXgNxWE47AogaKF
         FYUgSBi6CaDGcMaAQDPS0L0r2T2Vb9g+HLwxmSZl44lXAszeiQUXRY4EwGMw/8+lRvjK
         wkATapHiokf1GqqqjDs8n7lOCirvlT3yS/V5c03i3GiHugPS386qNKJsHy9HMqmIcdG/
         FrlNZWHapr5GzZEounf/WIGXAwCqqo/261BSfX9FN2fOuc0AcK9epnmwlEDN+EEjzzQN
         77SMRcAa/h6oPCX8PuG7DklOfozYNDTLpGiQo6xyEl4vE77vLmI9C2AhMc26blbwekye
         WESQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhS5oS/Ryj4qGXikxIrCVX8bpw6zSMfDyIJYmM39EV8Ua9HcgwhU2LNhxnjtbUXhwNgAaL3OLDr9p1/bs=@vger.kernel.org
X-Gm-Message-State: AFuF++na0dpsO7DSlnhmWeadcA2V3Ce+3D5KFwFSgJ08YBFz+f2px1OZ
	iuoL6UY0T7SMib3+XHUoyhaBCDbGgQMw3ZAvm6qLXdhe5W3MNWUMNbe13YU6zBjfpA==
X-Gm-Gg: AYBFou2jAbu7VaG95rXFGgaSh1x/l/HohT7vNd3ZrfLcgm22WwqtAijqZk+wVJtqVux
	BeByHp7rf086a4JP1XyDMlpKcIulxpbx01c0mr//DN5DJ9rRvAQKYG9uFP0PzUsnhC2CAi0hzEg
	lQdYD1USn4VGJEBSIPEN0cRe9yape1q24B5FrZqg1ldBBoTVuhPQvbjBYYRAU9xKPhIUP0kCmkz
	a0aYdGcaPR1OpUo/oqaPX759CONf0wXS2OZM2+nfafI6Y4+ymSYVtqE+pDMCQZxdGiEFr7klQk0
	8U+GORC/DARP2Fw3uwSmaaZk/sFFHsOEeOWVldtJbRSPhELWdrMUEVLS5vXWtTvx/8V3wIbog7U
	2Z6RWiZXfLQKIJUY8GAKTywlgwhD7h7jO/pz60OoVMZPW+dde9UPWMf2tVIhiosK2WRh4Oepduy
	mSwarYTxz06C6ztcV7l2dB+GpH3m2Pev4bDnGpIBKB0bfvfsaAKX3Vhj7qnLaN/IbIn7jjqL8+M
	CMBng1GiVI=
X-Received: by 2002:ad4:5e8b:0:b0:8e9:cd74:87bb with SMTP id 6a1803df08f44-912343f272emr52165806d6.18.1789484526773;
        Tue, 15 Sep 2026 08:02:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9123bec51c7sm381356d6.38.2026.09.15.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 08:02:06 -0700 (PDT)
Date: Tue, 15 Sep 2026 11:02:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <e2404a51-3480-4c93-8d31-6b796879ff6f@rowland.harvard.edu>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-2-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915090223.1346-2-joshua.crofts1@gmail.com>

On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> The fail label in usb_new_device() disables pm_runtime on failure, but
> doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.
> 
> Add the missing pm_runtime_dont_use_autosuspend() call.
> 
> Found using Coccinelle.
> 
> Fixes: fcc4a01eb866 ("USB: use the runtime-PM autosuspend implementation")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
>  drivers/usb/core/hub.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 3345b3298daf..dec6d5c49759 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -2745,6 +2745,7 @@ int usb_new_device(struct usb_device *udev)
>  fail:
>  	usb_set_device_state(udev, USB_STATE_NOTATTACHED);
>  	pm_runtime_disable(&udev->dev);
> +	pm_runtime_dont_use_autosuspend(&udev->dev);
>  	pm_runtime_set_suspended(&udev->dev);
>  	return err;
>  }
> -- 
> 2.47.3

Acked-by: Alan Stern <stern@rowland.harvard.edu>
