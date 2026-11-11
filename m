Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415736;
	b=Qq+uBe7NcaXdcM6wjL4oYEh1duNHkbuFri+d/8NpkJfm82fRuu5bItBvbEkfsr8a8ZnB
	 ZEuj0Sg0WO4yDYf3iCkOwkRhE/P/CyU+w58NqLViP7efVsVAKAIk3+RaAShW+632O660g
	 YlxLXf9tM1HoclRZeWezJjaP4ifUkc/2JzW1/U+N50p6Gi2DvH69YTdC7fkNgO119SLuc
	 mhkpFYXpsMONBrFyKvXJrrYrRkfRXhhUMhbZQfn7C+ggrWgR7+wLlQsgd4LyxAksV2HYs
	 A0TJeDvASvT0AWxEK5w3CI+u5y5DfViuk9rZj6Bm6QjYdsh0KZDRGhdGziMzGp7PLWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415736;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=hIh1oJXmPJn8/bufJnOWwv255cbPbO6RJV8+iEpFNQw=;
	b=KWDfEDOJZL/6JqGm22VefryrTWJIME9Hc0FpCHu9NfVKnuzGoB47NLWjkY0MH3KjJj+x
	 V5ijGbX9Xxa/Lmv0mqRRApKwuEC14B8pJdnJbNthGnJv+sjGC/kAOJeANC1428pegxDnS
	 PIPTG2dhZea4Yj8F22imymKphtIh1v30yh6+MQFNOKZ17N5Ipr39BgiP3O3DmQ/xDCxLC
	 mfK3AB+jS+XLea6iVSeXsO819MV8/5tlvIBeOLZ/AWmdubprg20cF7TBkGBtQSuSE1ggb
	 M41t9xUGdBXmt07zNpu3ipP1TUqndTo2WGW3bxf17oAK0TbYpQSP0RfcSzFnjmPQ+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=pereq.eu;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B502606A335
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B502606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=pereq.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-490a0e72588so1875870f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:48:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415734; x=1795020534;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIh1oJXmPJn8/bufJnOWwv255cbPbO6RJV8+iEpFNQw=;
        b=UOR3VBScnwcxb5KHxZsvcxRjM++QY70hC/uI8tiO6Kz1OlE5VvjogmKrNetAerxHQm
         9Ik5CrGtIv3eZ5PIv56CqzWU9lZcG7CJujzMW0nhnBEJ8HKm4XY5zj6/piZOzLBcKPjJ
         GJs4lKCiEzEZcoJ4OGrer5WJfMCORc3182RJ0OmQWOLeWNzRTLaW2g9OWBz35Nna3VuY
         uGK3qQ8wTFwV9OKOrgVhsq+FTpXHHkenZn6Rl32UjuExMHgRHCxz5IeFPXr5TyMvbbg5
         ++IC2XhZZYlXQ582SDlwr+3a2KmAAWJ9TYEthsQBfUu/XIyEYeeBYQskfXR9jxb4vnto
         RTng==
X-Forwarded-Encrypted: i=1; AL+hErHVirEE+UrKPhHQmKvGMGe+SjvqqAUv8dn1Be/C/ItwwWzF5FSCgTOgWLOvuqFWwYUirNBOoEkJsonG7c4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8SM0VFkSH52XzFLLxv1q4CXCLdj2ya7bUa0nNTYyxSf4TbJtvS
	3aR+lD84pD8rMK+xNAopaH56cDsD4X/BVRONuy8uGra/LG9bIqA3UP6K
X-Gm-Gg: AYBFou1+Y2Vn092LzYpNccqZOkIYXz5PfaXCU+lArAbU3cJUQfLFlmnYnzNWziqiDiC
	Um5e1Wcp9QXESbfsTKEKeB9j9XTwra3bF+86X6rJEq7SIanxSdWHC1HiYn3OZ1BrmjgMxhVPHd3
	Zwp0UPEoKaiTr+0u7tKW85gF94eRpQ3aFMhZE/kshg67lt33sti0Oxb5OajOs0JGelFPwkYW92D
	6Zedmz10G9uj4+OKHOEDhqAmEO15oxgmandHRyS6jKNDvTLd2dVhqV2MLNi7y+11OaHWle9RUjm
	LYQhjqghbVr/JGzyQIrnR3z8NlAqWWePloSYcU6u6eRMQEnRxnvTwy5KhsR86ZnIbdDzd4cMYXj
	nIkriQN8y64cFAsf10Iv8zRlYJXXZBshz323B/HPJVsSGB7p+fsnBsP9YByt+GIYFO/dir3FjQV
	/14mNFMsUU+jGcjq4JuKqJz9p00mQkN4CUZCOKV91putjoZfZW8r9+w5/meOLXNq3GvH6hvJGra
	ZeFCpyF6G1cBNjKbeuJYy8jkammIvVWKM0EYVHNofa2XEue8y2L0Lz1pYKg/2/1aQjcswM9SVjc
	hQ2t6pwZxjTUQPh+5pBagI5lC+o+IhmYa3xdwYw12f5TEl4RS4qG3tGoTZMhmyiK0kHAeS2MRQt
	G12Qv6bsEvW8gAjELSMq+Imk7zYyETWp/2tqewL3Gqblk1n76tVmwN16k/q5M
X-Received: by 2002:a5d:588c:0:b0:499:53b3:39be with SMTP id ffacd0b85a97d-499c8d5bdfdmr5249070f8f.51.1794415733801;
        Wed, 11 Nov 2026 08:48:53 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49944d646f9sm8244842f8f.32.2026.11.11.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:48:52 -0800 (PST)
Date: Wed, 11 Nov 2026 19:48:49 +0300
From: Dan Carpenter <dan@pereq.eu>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, error27@gmail.com,
	cenzhang@linux.microsoft.com, dennylin0707@gmail.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v4] staging: fbtft: remove unused fbtft_init_dbg()
Message-ID: <avSccSGIsu1EbwnN@stanley.mountain>
References: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261111163819.143147-1-himanshu.bakshi478@gmail.com>

On Wed, Nov 11, 2026 at 10:08:19PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> The fbtft_init_dbg() macro is not being used, so delete it.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Dan Carpenter <error27@gmail.com>
> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---
> Changes in v4:
> - Add Reviewed-by from Andy Shevchenko.
> 

Collecting the tags is unnecessary.  Maintainers handle it.  You should
do it if you have to resend for a different reason but otherwise just
leave it.

regards,
dan carpenter

