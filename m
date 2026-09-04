Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5138751D500
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 22:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788560697; cv=none; b=fgCSj+7k8mtO7Kl71kZ8iAAj2NIirjbNSdPs0FkwQ9yik+bA3kEKXj34mmh9JljH4DMc3/QZDtn5GCggdr9cqS4SoJHOTlPheC7VfogNY5UhNsbz7sOLvZZFyp+fbOCI0zbgbTMjNqAawiE6bcadMqTWHSqlL1jZJqiREK4Tpog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788560697; c=relaxed/simple;
	bh=f5EOYNMfX0BIImtJxHv/kOs05uzApSEmnx67CtfuKrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDbw5UR1i1vnCDF/EnKDO9BZCX0EV3St586jTt6qO6OmB1BElnuGq9lDFtPIoBN+aX+uXNCz2+wnVOlP8NXiaC6oDlEoCWDIVoBObyLaH89UnLHWY56bdzZiPI9cUk16JpyaVha0xFVsXJiOXpUSkh6ICzUxmJAJRmrBmhCtAq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwj6zj1a; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwj6zj1a"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-865bdc6ed72so31108317b3.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 15:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788560694; x=1789165494; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ROm4P9AhLZ98ncBE9zHDbf3TjPOygTmfSMJu/CK7f+U=;
        b=bwj6zj1a2pBnhA0h4t5ig1hW7S6TDo1BiWsWHECdWTpDksRE2MC3w7VgPdC8o7KJBq
         rfsNOApgp/AOYHBButaxfPJ5lFd30euzM45k9+1d43kdx6XQRTeodJYDagSFNtX5iSUl
         k/5oWX+4QGhoxPN71zI8X+ZFuG0uSUN6Ad037ShXALBFPriLVEQfVPd1uAPjTSdNuu5o
         N4v3mi1ojo4NUTgma5ydPQk8VyzogRnWUi8vQcHGt/yF0sAiT7GHYw6FMJmfqH24MvyK
         pigKjTXtMrJSl7J+IUds1877RqtSG38lX8jD6kc6U8XidwSe9F5HQPiKGrB+cW41H8wf
         1TIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788560694; x=1789165494;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ROm4P9AhLZ98ncBE9zHDbf3TjPOygTmfSMJu/CK7f+U=;
        b=STVybXIBBTsHdeXHYgfBA4REW3LTkufxfbhqFrjJTAdYIZuIGyeYtyFt6JR7skNCwj
         EDaBbv5y17fGkQRAsHyFWt1JIHbwXVbHY6DlTDhJFFz+CJMn0eBXULAF9zLHYDEJgiCB
         DJLBrVlijnYcBmjCRx+1pua6LqN34YYt+T3DQj0fS7WoTpVtkQe6TlbNrIkz8jWHqGZp
         6pa3bkYD0+Zu1v8D3J8MJRyDmUFxkQFq9eGzFRwe7xpQ7IwOjDaoJ30zg4bli8L+JNMh
         w4UCSWHsPc2F1TwHnkd7RZomlWNyZpoDFc0RJv4rOtqBOBgRNtiVkRh/f1R+CgG/yt0u
         +w7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxW1h8c2lHTAJeoxvwCoZ9FtV9E1i5AryqIrNSNFRVjJrrhX+XzNO5z1qx3SxDzitD+ICW15wOs8piTNhE=@vger.kernel.org
X-Gm-Message-State: AFuF++nyZq5n7j84qOGRZO0jCje63MasdxrbKqSH3o8t7iZ1DIxCuPJZ
	ziL9mKBHfysj6XF2nojNbqn4F1MalSaobD14WBSfriLp9AFJl99JuqQM
X-Gm-Gg: AYBFou1aev3B+yhUjmKB/Vdvb/KFSclECIdqRIr8SFlMQFgYCYNnT4D2gKoZWRsCr9u
	otIyutOShVm+rCK9LovuEnO2+uiigBZA3VgdcY42EJxUNAXJJQ+tXp5En3y63QYuSx58yigAnV0
	BkViQqc+j7Tj+Ksr1tE71gI53zKjHegy5hk/K9MxdGrHwdg558b/6tjZ0TWJ9mWHgtXGY/KG/JA
	JPpSg7e5ipHN3Zxl/l6SbyWl7VuksJDhrjgAUs5qz5wz/ZJHfqI64q9usreM/pHloDgWjBCitlP
	WJ94Wj2c2EF1LjdY8UikDfGJYLVWFu1tFBNJSE/nmbKYW6RgjoZAWJ30JZ32vooFQAaies/lOzM
	TShb2TC9WKitrgIiMrRDhGpGNXc6BJ28HooDBZM4keifunM6mfkvID9GMwXSm01jqE/5WNITy6N
	piXHjoiOwh7DCA/asxunfEbs4fxVDO0aAwNHhHjJXyq0bmO06PlPD80Ez49HGKi0W+vVNL
X-Received: by 2002:a05:690c:60c5:b0:853:d1fb:2121 with SMTP id 00721157ae682-87121cc3b26mr48539627b3.1.1788560693673;
        Fri, 04 Sep 2026 15:24:53 -0700 (PDT)
Received: from localhost ([2804:30c:94d:7300:da0f:c2c1:1aa6:43da])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-87149ebe7d6sm28056717b3.19.2026.09.04.15.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 15:24:53 -0700 (PDT)
Date: Fri, 4 Sep 2026 19:25:45 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: mdshahid03@gmail.com
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
	andy@kernel.org, rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, linux-iio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] iio: adc: bcm_iproc_adc: use device-managed
 resources
Message-ID: <aptFaaWIJ_azy9Ok@debian-BULLSEYE-live-builder-AMD64>
References: <20260830170919.470974-1-mdshahid03@gmail.com>
 <20260901144030.509802-1-mdshahid03@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901144030.509802-1-mdshahid03@gmail.com>

Hello Shahid,

On 09/01, mdshahid03@gmail.com wrote:
> Hi all,
> 
> Thanks for the reviews and suggestions.
> 
> For v3, I will incorporate the following changes:
> 
> Patch 2/5:
> -Add the direct includes for <linux/bits.h>, <linux/types.h>, and <linux/array_size.h>.
>  Keep <linux/device-id/of.h> and <linux/iio/types.h> out, as these are already provided through the appropriate headers.
> Patch 5/5:
> -Remove the now-unnecessary platform_set_drvdata().
> -Return devm_iio_device_register() directly.
> -Remove the unnecessary backticks around function names in the commit message.
> 
> For patch 3/5, I understand that splitting the ADC cleanup into a follow-up patch would be preferable from a patch-scope 
> perspective.I will split this into a separate patch for v3.
> 
> Please let me know if I have misunderstood any of the review comments.

I believe the above list is correct.

With best regards,
Marcelo
