Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6E33C584F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 15:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792339023; cv=none; b=U4kpVRiyyUXQlac1ZeTtKpbDD2Xi8yXfSPyqEY9NP9fZkYqUvvYwNI7hwDBMKDyiNkXd9ygXV7+gbt/ix0jIHII6MJwJ1qAedcg+B0lCe6kiKcgDiPWdIbHzJtUqEJTWVqQwHE3+khUBK5cGVzFCeYiSzFIGUuuXur197ywNSkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792339023; c=relaxed/simple;
	bh=SLE0vQJ2M6K8ctX/mg9oXEftWttA47Y1KWQ41gKo/w8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLyP3X7PNTUb6OxoBda+H9j8vXjqwqZHeSqrYSF7bFB/8fU+HIIBgd25Tvh9rKGEIc0ovU9oGJ7UR7BZyiYe5SazXtTdPtNfqFswUwSFghAAzfieQeo2Qzmduwk6zWXlezkmLGFaR+zL1LXGrc2EOpMqYkOft+BPjKbZ1u3Lr7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sV5vMJj/; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sV5vMJj/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-35c76e9614aso2524189eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 08:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792339022; x=1792943822; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dxx+ijzHhCY5cHrA5/2xGHaNDawtWTXufjGNfIveNyc=;
        b=sV5vMJj/60PkPHj58mdRVRbaQ70HYwn7XiKtXauGCO7iEJCP85WzlI+81c/hyu4+dW
         ePtHp7o9os9FMnkt3jiXyZnVm2kwXsO2ctnM1eQ/olk1dAOC2eKEdlfWN4hHPyaI8JHU
         AhkyYSQVJm7rhr8Bhmut1rKi/y35iEk7BkWuX1N0s8tZY4HC/pIqIHccEVZUsITvWuWO
         XBick4NIl2YeOA3jj8VmmQEblsujMABKuVQ80lBbBr+Ah1iPm+G25RIbxyY9SMUQbxv9
         9d9P+jhd/fbwH5htcKJ5nYbipbPgBn8mszUsVu6YEm961qZBTQh05sWRjqG1L7G91+nM
         dSHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792339022; x=1792943822;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dxx+ijzHhCY5cHrA5/2xGHaNDawtWTXufjGNfIveNyc=;
        b=l8OvcHEiQOvvAQOy6kgm3SW5cTxLkdQz2YDhqk4NAv6l8yy4gbJmILXBcE9jru0cts
         82dJLGSvrM17WjGXwecdmmVyTlzpf7bUOg9klP09ZSECMpVno4D8jzWa3QV0aIfHw8eL
         aVmJNm3FtGPRlBvvBHD6OV5jAYwMuzedBaZCshxdnhBzxHARR9CUarx+7qWusVhlIoRE
         Hr11mkSNqXQmLHQNZB9AVCNOIlEqgOC4zmiBMXwNRQXJRJhHkxzwBf2X88kndKVV5kty
         RolOi5/9uoSv3ePnH2H/Mbc5GDRY90Bj6aGGhvmt9UHGI67hq1D+HnGBAagac6NJmh+S
         PmVQ==
X-Forwarded-Encrypted: i=1; AKwUvBz2zmKXqKJJamFvLRzcHF+tsCGXdwvGU/qW8YWxQA0P6mWCTTsZJM5gXWCrQWUWirFJv/WoGvf0IpEhREw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKYabjumHLV0o0MpPlhWMVjYocqaGD9Whv1pphZSynsB4h23dko
	FrSbhRf/6cHGj0lOJuz07ui6wLHNztShynUXdbbcFtwVxFoZiJIxXiZOunx6OQ==
X-Gm-Gg: AYBFou3fO6C0zoHTDZw2P8txhvdXLJh+SduVX5nE/TY2G4L9K119oJW8Xk4rT6lYY7C
	U+g6IyHJ2KgiOmrIY/eqXZrmKfprXTYy4RTiI10vlTWph72QPHefJ4KZRWJJtOPYXl9He1bZNoS
	Pz0VuoCQowln8ZWlhqA/6YkvR6ihxeMeYmfJLA0UohhT8qETayAYudy8GRG/6xoK9QQ2hNXsC/9
	c1JgFPdW+Nw4ljrSo3ypE4RrLoAjYVn9h8UKQbA7FElflz6YFlq02etpX7GGYEnjSW5JFVog4fC
	prnDIioWojyfzHHPkFne2AJQO0/KMQcKSnXPYHtXZMXfCZQ80YSI/lXpD/GJ0ZKbUmAUxkP76zO
	VToJB/Z7FOlyCmNT9WodsQbkoZIOOIr/UWIBAxy1io+q1W4dQ6jD7rYSYLr0hsqm53FzL3s1r2A
	WRNqy9SIay4wUttMhaYn8SrgsCjII3LxZWE44RE2syKyQfsYgpqLL/cAo+fwIXXDQf4HithOOSF
	9P3jX13+nNQ
X-Received: by 2002:a05:701b:4549:10b0:188:ecb4:489 with SMTP id a92af1059eb24-188ecb406cdmr2271984c88.34.1792339021585;
        Sun, 18 Oct 2026 08:57:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm19625559c88.14.2026.10.18.08.57.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 08:57:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 08:57:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] hwmon: (sht15) Stop deferred work before releasing its
 resources
Message-ID: <cb5f15d3-5a03-4f67-b7f4-36f5b74610fb@roeck-us.net>
References: <20261016030749.3689266-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016030749.3689266-1-mhun512@gmail.com>

On Thu, Oct 15, 2026 at 11:07:49PM -0400, Myeonghun Pak wrote:
> A measurement can return while read_work still accesses GPIOs or
> re-enables the IRQ. Regulator notifications can likewise leave
> update_supply_work using the regulator after it is released.
> 
> On removal and the applicable probe error paths, disable and drain
> read_work before freeing the IRQ. Unregister the regulator notifier
> before canceling update_supply_work.
> 
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
> 
> Fixes: 251eb40f5ccd ("hwmon: sht15 humidity sensor driver")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Compile-tested with GCC, W=1 (x86_64). No runtime testing.
> 
>  drivers/hwmon/sht15.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/sht15.c b/drivers/hwmon/sht15.c
> index 7bb2105..6c5b2a1 100644
> --- a/drivers/hwmon/sht15.c
> +++ b/drivers/hwmon/sht15.c
> @@ -31,6 +31,7 @@
>  #include <linux/bitrev.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/of.h>
> +#include <linux/workqueue.h>
>  
>  /* Commands */
>  #define SHT15_MEASURE_TEMP		0x03
> @@ -986,15 +987,15 @@ static int sht15_probe(struct platform_device *pdev)
>  	disable_irq_nosync(gpiod_to_irq(data->data));
>  	ret = sht15_connection_reset(data);
>  	if (ret)
> -		goto err_release_reg;
> +		goto err_release_irq;
>  	ret = sht15_soft_reset(data);
>  	if (ret)
> -		goto err_release_reg;
> +		goto err_release_irq;
>  
>  	ret = sysfs_create_group(&pdev->dev.kobj, &sht15_attr_group);
>  	if (ret) {
>  		dev_err(&pdev->dev, "sysfs create failed\n");
> -		goto err_release_reg;
> +		goto err_release_irq;
>  	}
>  
>  	data->hwmon_dev = hwmon_device_register(data->dev);
> @@ -1007,9 +1008,13 @@ static int sht15_probe(struct platform_device *pdev)
>  
>  err_release_sysfs_group:
>  	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
> +err_release_irq:
> +	disable_work_sync(&data->read_work);
> +	devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);

With this here and in the remove function, what is the point of using
devm_request_irq() ?

Guenter

>  err_release_reg:
>  	if (!IS_ERR(data->reg)) {
>  		regulator_unregister_notifier(data->reg, &data->nb);
> +		cancel_work_sync(&data->update_supply_work);
>  		regulator_disable(data->reg);
>  	}
>  	return ret;
> @@ -1023,12 +1028,17 @@ static void sht15_remove(struct platform_device *pdev)
>  	hwmon_device_unregister(data->hwmon_dev);
>  	sysfs_remove_group(&pdev->dev.kobj, &sht15_attr_group);
>  
> +	/* The read work can re-enable the IRQ, so stop it before freeing IRQ. */
> +	disable_work_sync(&data->read_work);
> +	devm_free_irq(&pdev->dev, gpiod_to_irq(data->data), data);
> +
>  	ret = sht15_soft_reset(data);
>  	if (ret)
>  		dev_err(&pdev->dev, "Failed to reset device (%pe)\n", ERR_PTR(ret));
>  
>  	if (!IS_ERR(data->reg)) {
>  		regulator_unregister_notifier(data->reg, &data->nb);
> +		cancel_work_sync(&data->update_supply_work);
>  		regulator_disable(data->reg);
>  	}
>  }
