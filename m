Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794750039;
	b=YiwaTg6AeYl3bZYQ9SR/7jSZbV/DQFKwH5VRkyAS10G3t2Nsdm3sjIBa6w9BGf5tKkWX
	 sITicjQeifpmRHI0klGMudb61/hSGtSvuzDqxlWRQaRpT9D6gqeG+rnOJeDd9rOdHQB3D
	 jKxuhKLVQ8UgeBDnItLsMPFuDg21xlXJ/Nlsyridrby3lK3qgkm5OzzJKYlwZbwmXzUxa
	 Oj41MINfrI4Mmvo7kJ+0ntyEHNHXKIPcDmb2iiYUYuqF7uHb3+aF8ZTFU440fRQQTGkA6
	 9dI+SY9+Shsn+yJD+xjcheNjjo5iVlO1mAzxGGak8Fv13Wo9oqhP5uaup9OCEsYpMig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794750039;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=L9Z2e0KuO6yFLSMGIY9LHrayXw4tNQJoHgaVpcSQaXQ=;
	b=K2oL0v8009xjwgor5AFYMLwqIr1F0XGbX7NdH2GSr05cik37LUnEf+Pz9T+XI+lSSMMS
	 xPsSFc6kTZbElIW7NO/y/0+qwyF2BSbaI+by/PfvFtaqwkaI+pZe7oOkFraLLf8nP4c5S
	 2I6NEA0dpZ4a1bVYgt81bDu20DKE260G5u1jr9nSXVnKizy8ONxarM4dglhaHwDZP4i9w
	 nbIqoVdmQsk6Fb5ZIQjcDzmxBIS2Be7hd77m9GrO0BHx1KuMtk68kyqt9OM6fvRcMa1Vi
	 xEuF/VS9CafAmVxhfAwcs61sjSsPXj7vbhSgjTO3p6zAtIEDtCrozMlF6KG9AgcIN2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgWsEksX;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07E3606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 13:40:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B07E3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NgWsEksX
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso18510645e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 05:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794750037; x=1795354837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L9Z2e0KuO6yFLSMGIY9LHrayXw4tNQJoHgaVpcSQaXQ=;
        b=NgWsEksX/0sYm1633PJw++fnv/VFkAE9SBWZqgL49Z0r6u+NlQ8FKbl7D3VIBcWqcI
         17ANU0aAU5L8z0DEl4dWWrE+iFUqCt2LpQHVfSGlnx0TEXaDTW91gqH0Ja3e4sSWKF94
         PEgTtvnyxibKHo4BaCAIzAhIJH3o1i794DsXmXz0Odb7OxsOCdigBl7xuF9+VCHtoPHI
         MNo+vsC8o8p5vxBdtu0bCkH/oxq9k2DuuRIvmzmRvU9gdR0kaRIH42tF4W9Qn1xnFzFn
         CWehJF1YalfdmSNCFW4ZPuJY9Zztj9GsCkL7G84FEt49LEA9Wp3wxToKi5ojth00zYxz
         iQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794750037; x=1795354837;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9Z2e0KuO6yFLSMGIY9LHrayXw4tNQJoHgaVpcSQaXQ=;
        b=fdDpEoqaZpOiwNgCgwQU7otTrIoVQ/9j97OFpq7IwFrFX+ftXO/yiBfZgfXi9iOljK
         f63WSQQj1oJCHA+t/ZIw0/kk311kfcw+zkrnhHbONAGI7VIjaenevaiYoNrpv6ZG+oJQ
         +skob2XtHZ1bGKNCtGjANta2FqRVPecbXHuttooIFMOdJZNTvN20IPMRm4QypugXEml6
         mA/Jbv+5Wyi7GnerPoTPgqI4yeqURtmOXw5M/u5M8ekPnkg3coEFGvS+EpOdVaWEcWeg
         AtLinWxwzmzgQIF7A3JQ3RHgHuTdnKw1mk/8aaIG4AjW6S2FnvXgC/S8AD41wL5Y76GM
         W8xQ==
X-Forwarded-Encrypted: i=1; AL+hErH7Y1bKuZJ9+r/nruq7sunvvyxl0L/FR2OuzMA4n6LIdQzmnKnpwCpNPWFytyYsAD9rReM84qMbmMFQFQY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hLdjqvnjTL93cyZnFq4O+yulaps9SoBCk8Ay9RMmCF+thBRoI
	3qVzgdNI75M1F3z83mKQJPNcMXEt072l/1Yd1ngkOAHrgQDtTAs4cqpG
X-Gm-Gg: AYBFou3DAGqYqJarcToqHn1WN76kDtDvvN+Yqm3kFqgPGu2AMrOTlU24+wVJEHCKWAW
	QVwrSIeSCZkErDF/FwYUtXwzPYjtl/sz9fUs5uvvuSqSBgHevlYrwfGbXdsCH2mjvUEKeHwl6Xc
	x/eqIpEy2g9UvC/VsGAXU8gHYjLmj1bW6OPhqZhu+I5wXYTzYPHPw+/bW35mrO6dmN25RIshmbl
	oQRabHGlqyz2iXZTQqlgr6ogqRXfXhf4WOc6hpKvyG1gebAR+SNWNa8JjaWrMRMROnmY7RD2s6H
	HxfQsnQxg1PL2uLygZ1o5Vy1YnRTsuj0WNV8i+RyaFlMCnINmHHSiQzx/QEAc2ETR/du9EneBOl
	7l9jf+DoCpBwfZy5f/wYk+Me4IyHHoRsHuASpU/llUYQo4KoyP8+z0mvXEc+mLKrCEZchvfd+U3
	x7ILc6/zA+6Ly0VP4qqL05oqQDgQfFBTYt6hjDO5weqkgx5YFVnJme9mt5hEAXPfwyB1z6B7D+T
	T0FbZjHv//F0wdlyEhNnPOoPpkU3fW5AAjTRc8yJvw8dSZISGWBwO51jyXYRoX/jX/aO1TzqPyD
	13msacryCyH6T9BdaeBDN3Xo6+ZLM9uYAz4bIGAFluSqRw6jvEVqAkcm4vvVHBeviQ==
X-Received: by 2002:a05:600c:4f93:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb55ab36famr171020575e9.27.1794750036927;
        Sun, 15 Nov 2026 05:40:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a0ffcdsm195768565e9.0.2026.11.15.05.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 05:40:36 -0800 (PST)
Date: Sun, 15 Nov 2026 13:40:34 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 UNGLinuxDriver@microchip.com, Andrew Lunn <andrew+netdev@lunn.ch>, "David S
 . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Woojung Huh
 <woojung.huh@microchip.com>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Wei Jie Law
 <98lawweijie@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next v5 1/2] net: usb: lan78xx: do not update
 statistics after a failed read
Message-ID: <20261115134034.042486ca@pumpkin>
In-Reply-To: <20261111013454.34542-2-law.wei.jie@gt.tech.gov.sg>
References: <20261111013454.34542-1-law.wei.jie@gt.tech.gov.sg>
	<20261111013454.34542-2-law.wei.jie@gt.tech.gov.sg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 11 Nov 2026 09:34:53 +0800
Wei Jie Law <law.wei.jie@gt.tech.gov.sg> wrote:

> lan78xx_update_stats() reads the hardware counters into an on-stack
> struct lan78xx_statstage. If lan78xx_read_stats() fails, only the
> rollover check is skipped: the counters are still recomputed from the
> uninitialized stack buffer and stored in dev->stats.curr_stat, which is
> then reported to user space by ethtool -S.
> 
> Keep the previous values when the read fails.
> 
> Found by code review with LLM assistance. Tested together with the next
> patch, which makes short reads fail: with an emulated device, ethtool -S
> then keeps reporting the previous counters.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Wei Jie Law <law.wei.jie@gt.tech.gov.sg>
> ---
>  drivers/net/usb/lan78xx.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
> index d73002b2c21a..76c2d98b49df 100644
> --- a/drivers/net/usb/lan78xx.c
> +++ b/drivers/net/usb/lan78xx.c
> @@ -789,11 +789,13 @@ static void lan78xx_update_stats(struct lan78xx_net *dev)
>  
>  	mutex_lock(&dev->stats.access_lock);
>  
> -	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0)
> +	if (lan78xx_read_stats(dev, &lan78xx_stats) > 0) {
>  		lan78xx_check_stat_rollover(dev, &lan78xx_stats);
>  
> -	for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
> -		data[i] = (u64)p[i] + ((u64)count[i] * ((u64)max[i] + 1));
> +		for (i = 0; i < (sizeof(lan78xx_stats) / (sizeof(u32))); i++)
> +			data[i] = (u64)p[i] +
> +				  ((u64)count[i] * ((u64)max[i] + 1));

You only need to promote one of the values to u64.
Even just changing the 1 to 1uLL will do.

That made be look at the related code.

This function has a large on-stack buffer (about 800 bytes from a quick
count). But lan78xx_read_stats() (now) calls kmalloc() - probably because
it cant use an on-stack buffer for the usb transfer.
If you need to call kmalloc() it might as well be for the larger structure.

There are a lot of stats, and two structures (one u32 and on u64) that have
to match, not only that but a lot (but not all) the code ends up treating
the structures as arrays.
It is probably worth just changing them to arrays and using an enum for
the indexes.

Oh - glad to see you fixed (finally) the massive 'truesize' bug.
When I was testing this driver (may years ago, and the product that would
have used it got cancelled) I found a bug with one of the usb3 host
controllers that it only processed one request from one of the control
rings for each 'doorbell' write. The setup code could send them too fast
and it all got very confusing - don't know if that got fixed.
I've actually got the host that failed, but I don't think I've got the
usb ethernet device.

David



> +	}
>  
>  	mutex_unlock(&dev->stats.access_lock);
>  

