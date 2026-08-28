Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E696463B66
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928128; cv=none; b=r4rlVCAl1awUsxGtbkPElSZmx3Jtsnco5l6WUW+QU3Xf8L3iAbqkeXAd85JVNvhxMgDmAN3HblyItDs+A27qFuZoGMnZnDiXGGiwKlTzXLjMmEUGY12BD3fyTE3KZtCL8Jyu8f6DBAXFvxaPtDXnzXlW1cjOpPoK8+dVP272K34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928128; c=relaxed/simple;
	bh=GN2uy6iphrRPt9umv93rau235m28F43BO7lg6PkfF8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K5srZHPnbEW0jpEFsZ7+/E+dv9bdZYMFg8jc5F36QNJ+FOU2CiaB/92uEBcmbWV3lAGSOXPAsgkDVBgd4ShM/ZRIYvoSq/0HpRP1dEGHSbWeJZV+NE5S5Ov8136QMBHvDBbmasY+eryQo8qEofm58KgASZ/LanCiPRgqDxBz9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JLVHD6tr; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JLVHD6tr"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-ca7c1176317so880972a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787928126; x=1788532926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J7+8WQoYJgQnu5rmrwx2XwchVjnUqtezY6UYgVCUmKM=;
        b=JLVHD6trOZ7/nMAs2It1yK+5GCO8GT4JkPOPS3jxB6U+Du5/EegWAV1QOkzUDawemS
         FlFHI4DRG0FtWG3Aa1ViVwv0IJwX+F+E4bwVUrsJemLgDdOyCRx66228jfNket8MCg5z
         XOBUGp/bp6WehdpyrKbjbATPDhtRkG71s9ocGO/TGS8QZyPrDwLEo25f/3Tjt7SWXJlF
         o13OlZl1bsNIovP8clohDJ4Eh1xD2p+YO0mbCN1pZJNdTpsVR/IykOvMlh+0fhHNQu41
         BR3ljZ8QobPRo9vewp4w4NlxXNRVCRna/yFwgpvpe6DEULpRRecAOor08uo/3y+sojqs
         sMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928126; x=1788532926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7+8WQoYJgQnu5rmrwx2XwchVjnUqtezY6UYgVCUmKM=;
        b=WUKcyDQB6NwzpaDOrnUul8oJkGrNpJ/969+Ur42axNg/cVMHpWxUzX0seC6nCBby0K
         wj6svqqt8Q70RBm8XQQX8+npuBAZkU65x+uk2M+d9c5LNCe9tMhpZlc/k3bsIew4xsQQ
         FhiCyFBsOFBviQbpK+6DAGLxhZlfB3S3Sy5zHEs2FVWPij3nnTS+7WTo6xQjZ+pAJaFY
         sHFIOePmnNtSlEDbh6o+7+uAZUnkuX3uvXewPQGO4k4zZ99Aw0DGKFIftcXX4QZjm+/s
         eNo/GN3mVt5dZhSjMxqys4UWNt06z8RDuycrVdlyEHjLWnRXnETqSa2qa0KpGWddGsoG
         XuJg==
X-Forwarded-Encrypted: i=1; AHgh+RotgEF8Sk9hbC55D5P2anjYiOmjtLnfS5q7QT4Wm5Xa0DcnCLYNfmHcQ1feB0lBAHeAjw0YjHbgKhURRjc=@vger.kernel.org
X-Gm-Message-State: AFuF++kfprQJvbwfsBWmeulVGHDBz8vOqIMOPHi+tNBkIgUc6+7dVdDa
	F+U+ju4GV5TeKm8IhhYhHrxN2tYoHKoa/j3MteM/cLViZzxDxSJEe2o0
X-Gm-Gg: AR+sD13yozjauRDRiJ+o4giim66UebOqgUDFmIQeXIX3eR29CMNPCf1PZDbM/soXAcm
	zAQ1dDlp5q/H9ZgNrX+/FKoTBQ74snajeA5rgCBhw85qSp1JzzsSzgpQ2JZRnddO/09ukaoTQNv
	/WU/6byUnFJMgH9f4HWq4GkzMH1D1d5/QBlCgJE59QQ6eKcjz0avP4LI3SbjDtXU3RZn+6qLBme
	W5bm78CG9FA+lEE7iXqb5ttHcGOSHOUakVqhnGlmElxNzsdcvB+5EDlkYL9tgXjytE7hIt3ItM6
	Qv33CdKqNr4Q1wamiAp2vTKU8Tym6B/fkiv9vVTW9mcP2tKntGiwmwwpc+8j4YeODvqeJocvILK
	kvJBpZ4e1v3CfOBwbuHNiGe8pf0AAPxzo8DnR8SJxaovF8pac/gV7CHssKrO29tOJVCN5GL1UF7
	E+n664reuDegOMvWh4m6Kz5ZO+nruvZtMGsAsmPwlB3tHZxtf1Taa59iTmU1RlW5X0clM+3r1ro
	w==
X-Received: by 2002:a17:90b:184d:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-3989c003c3cmr564861a91.21.1787928126303;
        Fri, 28 Aug 2026 07:42:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f9e3cf8sm6766462eec.24.2026.08.28.07.42.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:42:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 28 Aug 2026 07:42:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] watchdog: msc313e: Fix NULL pointer dereference in
 PM callbacks
Message-ID: <666397f1-ac63-4644-9de1-9f675d2a7f3a@roeck-us.net>
References: <20260827044700.554333-1-tzungbi@kernel.org>
 <20260827044700.554333-2-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827044700.554333-2-tzungbi@kernel.org>

On Thu, Aug 27, 2026 at 04:46:59AM +0000, Tzung-Bi Shih wrote:
> msc313e_wdt_probe() doesn't set the driver data for the platform device.
> As a result, dev_get_drvdata() in msc313e_wdt_suspend() and
> msc313e_wdt_resume() will return NULL, leading to a NULL pointer
> dereference afterward.
> 
> Set the platform device driver data in msc313e_wdt_probe().
> 
> Fixes: e9800b799464 ("watchdog: Add Mstar MSC313e WDT driver")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

Applied.

Thanks,
Guenter

> ---
>  drivers/watchdog/msc313e_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/msc313e_wdt.c b/drivers/watchdog/msc313e_wdt.c
> index d962589e2c55..f69d66971c41 100644
> --- a/drivers/watchdog/msc313e_wdt.c
> +++ b/drivers/watchdog/msc313e_wdt.c
> @@ -124,6 +124,7 @@ static int msc313e_wdt_probe(struct platform_device *pdev)
>  		set_bit(WDOG_HW_RUNNING, &priv->wdev.status);
>  
>  	watchdog_set_drvdata(&priv->wdev, priv);
> +	platform_set_drvdata(pdev, priv);
>  
>  	watchdog_init_timeout(&priv->wdev, timeout, dev);
>  	watchdog_stop_on_reboot(&priv->wdev);
