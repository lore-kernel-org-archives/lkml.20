Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F694D17BF
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792340211; cv=none; b=bQEvsAr73S25uXQb4cF9Ujb5x6PIUclteV3LP26zyxcrjHRdru4/+b2WhZugyiqe/aRskF7lxHCWkxpznqLt/L9T4IxkHb9YtLwS44p9aPYYBSLUmeBGmXOAqRNSd2M6wR+5KW75VJwaQ8vt+q7xazt0oR37QZc7OsoupWakv/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792340211; c=relaxed/simple;
	bh=VM9G2IU8S9PT+t8JNTFJvstcuDK+KPuMWkvaCXHk+EY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0iFwZmV4F0TP5S2o/X88g4fTcXweyJ2tLyeogw1abnEQ50vAJsR6Qr8BdY6UIzuC60njShhqIdoZJt6sAyxF8wp7d7UTbRhDRPut1U+gzmaapcIQwkYglrcG9vesy8AJxNh8QiKraNENaxsW/IheRHlWuTnVmNAteZOWeXV/2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6ih1d53; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6ih1d53"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1258551a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792340207; x=1792945007; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fc33dIGb22zLmtwbw3KptWfTKOOxa38o0ahhhSVqK7w=;
        b=X6ih1d53PVEJvbbmmi/ZO/JmJT98EAkZa5irOPMZ3+2ygBy5AiSj9846h3KmqXWZvy
         kCZvhAZbkkkacRs+pwgZE/UmR9YJYDzWT8ORtni0e4UXEgmxuHj9lOs5WgIb4HHaxhMb
         nJrTKpNotBuY8BmahWGthNemUeqsgR370/aErrsB2uTct4GCT4y1RhAuzXAULZA0zWyV
         CQtQxNasqHF6gPsckq59IiutRmi80QsRCtsGH4Sh07bptPJx+SZy4lj7tLqGhOadl4+2
         oDxr+5I6oJ8vqk3qyz4JPGh2Zuhi18S5yMFjDrQ+C8GfaaWwULo87Osyfpt5cBRom6Vh
         bHgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792340207; x=1792945007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fc33dIGb22zLmtwbw3KptWfTKOOxa38o0ahhhSVqK7w=;
        b=Pidq7o2H6+qWZkVFECMmy8GzHwr12q0g1rg0RnfirBLiwQuW2EbewsPojYtgnE/xRQ
         EOKj5MyOSoReLI80aYE/S7ojRpXmf79JhYjUn8/IH9xLRmBKOIv/8GEkCJFJsMqToOzV
         SzbLsbgEds+/z6OLBy8mAruHVgPAC8/5KW0k0bvLlQt9OaiIK2NZfFgswCDA5JaU49Q5
         dQpFLq4gEy7yAPcPdhX/uqS6bz5ftQ0ZCMxFaEJy0m6zLwx5W6zUoFoSHKR5KfioDZVY
         D26dWkM3XHWzGNIPuvrYRPjb4IsGlku3JSylBCPFqSaJdL6TRj8oNXiSl3Y/1UylAj/G
         inag==
X-Forwarded-Encrypted: i=1; AKwUvByWdnvYZubL380o8QBHTsWOMCOSZqSPAl2w30SVs/hYrl4M1WNKvkwAiddTPOVBEsbsQ3StJkoB05iCT0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIs6pvtvuoQQJkPlCD0158YOdro+VXa8L9ZikNWwMAiRtDdVnKd
	E4r3DSBA6VGLrpGq2USWSefWrS/QMcX0Ui5gkxyZ2qQVQQG41UgIaHYE5HRBjw==
X-Gm-Gg: AYBFou0wzcylJeT1u+GQI2kQCqg1UIx8jGk6ZNK9uaS0B/Nbk4zgsmphosc8eaTMX2/
	Hc3FzFeQxPoea+twNiGlxWiwRGM4efeSJmEkGUkAS4gCEQc/o67/x1J31l37gGPXa/EaTDcW+Ah
	f5vQKacvxrx/+YSospPTKa3V8QPO2yIoYma3XB/HxQEIDVT4WyldipnRWvgjiDsGh/DDtd9FJaS
	XDNwploR8lkUZ/b74MWOPvpTB4SVwR3SDT9AjwG4vzfXnNCltcx/KsUtvlTPPXHE6iMFv+iyhg7
	nONrX+F9iahOsSbP7rhaPDZCJlre9uGF1+iQH2l4f7jpem6Zh3K4CCSXEv9JMKx6JuYmjJJnQua
	P6V138+ulHU0ySILrK40FzCZspTP15luiZdXoqBWJwNERHBq3alOYW/nk33R70D2eANAS0XPk5E
	J9wfY3yzKOFQ5t1p6FWteYFgYEldaHZkzzSVHL7uOLGIMLm4ntzE36Kqu4LDCItEgliMwznxhzO
	1qtLl4e4LwnOzVl+fzcXfM=
X-Received: by 2002:a17:90a:6082:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3acffb826b6mr2070104a91.51.1792340206761;
        Sun, 18 Oct 2026 09:16:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc4972fe6sm12471343a91.15.2026.10.18.09.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:16:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:16:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Sebasti=E1n?= Peyrott <speyrott@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (minisforum-um780xtx) Fix clamp() build failure
 with GCC 11
Message-ID: <2bffbd3b-391d-492f-959c-fb9128bce49b@roeck-us.net>
References: <fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop>
 <20261014214522.243253-1-speyrott@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261014214522.243253-1-speyrott@gmail.com>

On Wed, Oct 14, 2026 at 06:45:22PM -0300, Sebastián Peyrott wrote:
> GCC 11 fails to build the driver:
> 
>   error: call to '__compiletime_assert_727' declared with attribute error:
>   clamp() low limit 0 greater than high limit points[1] - 1
> 
> The store function returns -EIO unless points[0] < points[1], so
> points[1] - 1 cannot be negative when the clamp is reached. GCC 11 jump
> threading, however, duplicates the clamp() limit check and does not prune
> the copy in which points[1] is zero, so the compile-time check in clamp()
> fires on an unreachable path. GCC 8 to 10 and 12 to 16 accept the code.
> 
> Select both limits first and use a single clamp_val(). This does not
> change behavior.
> 
> Fixes: 9d980da93bbc ("hwmon: Add Minisforum UM780 XTX EC monitoring and fan control")
> Reported-by: Paul E. McKenney <paulmck@kernel.org>
> Closes: https://lore.kernel.org/r/fda0e59f-20e1-4a94-a714-288940dcdd37@paulmck-laptop
> Assisted-by: LLM
> Signed-off-by: Sebastián Peyrott <speyrott@gmail.com>
> Tested-by: Paul E. McKenney <paulmck@kernel.org>

Folded into original patch, as suggested.

Thanks,
Guenter
