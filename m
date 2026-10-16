Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458922737FC
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162189; cv=none; b=qYUFUA/9r33Wgyp16TejOkhuJJ1yjtSKmL5HYbOs7/Ly4GcE9RkskUIzHOgq2wPYUbfiAIbN0x/pZghuBBpbrKNGnvsbpb6fpdGbe3voZ2rhFSZIvMayQX4eDPAYA6w/Zl0xySm9t1qzyRqTV1A6mEvLlc6GHFgj5gInxQ5RRiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162189; c=relaxed/simple;
	bh=b52lKLezX/Zp+plRq3rbGqftDCBHkAneH75XPmt0u/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QTv4TndAlj85LPd4HxHE8oOjlRooXSPMCarLLmsBNaTlVInhvU3QqbKKKpKkd4ikBJXk+O59nHMCtAcDjoXtSaRFbAuRAD0kNaD++2feIeW+xWki/zXvopmwvv9gimRKPk6AHcxuimMha1gqAMiLjJ6FDHLaH/t58BVR/ZJc5lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=B6tao+SJ; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="B6tao+SJ"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-92ed3993c1eso2620285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1792162186; x=1792766986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/4e4Pu8vnMw2JP4CMxHxRT8SmsDfn4YfgSedzqtk2/s=;
        b=B6tao+SJX52vzYZX5k9Na05K4jyu+YmFBw6B0qN2plv5LKsqeGcr/lhE3C9quRU+Gg
         GKU5B+EEAZ+rEy6D+C4jrqAK6R9MXHkPMC8cYEr8rkYD57EmRlQgLIfovjn2eYMs/LkE
         vnRj4cJhvabTb2z3ndMRujQZgcA5stPs0htqdHolBL5XfLWz+RgCSpSNQceFhSPPC5Lu
         hF/YI62KUCzaXUDzoc2AnDh7HOzuu7RsVirc+cy85wzOAp1dzd4xufQcVPNk0Ni6sICl
         Ju76yQpPAsssKfa3mM2ClrWqB2RBP2O1qVIx8lBs1OOGuKvZq/dbcoWPE8ONL5yfsSIa
         l9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162186; x=1792766986;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4e4Pu8vnMw2JP4CMxHxRT8SmsDfn4YfgSedzqtk2/s=;
        b=i42xweqZqStJ3DRgIrK5SdR69MBfjE/jkGgmrzcQh0lKOfjF5tUyreY2vrSSjg611L
         4qhZr67qdW8YPzti6YLjpg4Hc2FQWh0gizYnQ+Ui/xTmLKM8NaUdbhTJ98vCZ7tgDlQp
         QjHtbGcFYLQcpXDJOhKwiT8hgykusVEohen7Vp1ITzK8WpDMz0sz4S8v/Gd2jGCOdMBr
         riZHov6RDY/j2/UpYSD5OJt+1hEEKdqYUoofAuJQHhv/i/7xejInbzIp5zViyOSVDgKW
         Y/PytItPO69pOxa9CXWIw0nZlhps/lAjIHzZ3dty5wcmTgk6mjD1VwlJomkOGzTtr9Lb
         lanA==
X-Forwarded-Encrypted: i=1; AKwUvBzXUcLhzOzmtowA7sbjdxxVi/4p4sc/DJN0+R9/yBijCsTXVvD4FnTfGZzDOgpsLuxM206zwMWfR1TAjTk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLK1FhybB/irNajK6pVMCbTJB9Bq6b4GznkU6SAZV7WnM9RZJqB
	SfEuv84Jf1JRvkKkKRDe9EYpl+4XiM5Lb/KePY5VCUybHVac1kGek4Df/6MUGB5p5w==
X-Gm-Gg: AYBFou1TE/Lc9mLXP8DWKb/ouHZQyxfNFdQBopiINu2+Zo3lFIUyRCYo+gTuvmDQbk1
	c3XsCH1AFfFI1jajh8LzdogeFw1pN/3SFgOcGftkqr6zj/JffZUH3uhgepQkDn4Ku6wfyX2cotu
	r+n02/FvGls/dWck58WyUo2WQRNsbZYDLvlE39NUtT4fxTZgCGOhbu2jMD0UYhbK9iVnC8QERDo
	Eg9oxzx1rQqKD2XHJ/MikXWj+aL6+S6x8Ho6Z+8820os0/n9hoRAvVyjtlWyj4XtQqJ8tHmKa7Q
	ncxFkS7C6rIL3rqKC3HP1D0couKA2OngTv4EYX72yIKDQ2QM0oTyBc9pjFU0HL1T73tmhWI0lbp
	ibADf42/wX8Gm5THWIZ4w1KANhksQBE37fvIgH7VeP+DJjB4WGG1+f7UTalC54vWPjKkqngYvT8
	tXrIpLJWebDoaIPRAti6C2qoiemnChwNPmlIKWOcIo1ntJZkepUlMlb9K9bahMjFX1cQJDLSA=
X-Received: by 2002:a05:620a:371f:b0:93a:2221:5460 with SMTP id af79cd13be357-93f29d392edmr8466485a.40.1792162185942;
        Fri, 16 Oct 2026 07:49:45 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f19f911e6sm231598685a.0.2026.10.16.07.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:49:44 -0700 (PDT)
Date: Fri, 16 Oct 2026 10:49:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Bin Yu <byu@xidian.edu.cn>,
	Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] usb: usbtest: prevent divide by zero in simple_io() with
 zero length
Message-ID: <5287f274-2130-445f-a67b-d12bd7ee3a2e@rowland.harvard.edu>
References: <20261016072750.34256-1-25031212351@stu.xidian.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016072750.34256-1-25031212351@stu.xidian.edu.cn>

On Fri, Oct 16, 2026 at 03:27:50PM +0800, YuanZhe Liu wrote:
> A divide error oops was observed in simple_io():
> 
> 	usbtest 1-1:1.0: TEST 3:  write/1 0..0 bytes 16307 times
> 	Oops: divide error: 0000 [#1] SMP KASAN
> 	RIP: 0010:simple_io+0x2c4/0x540 drivers/usb/misc/usbtest.c:497
> 
> The variable-length tests (test 3 and test 4) compute the next URB
> size with "len %= max", where max is the original
> urb->transfer_buffer_length. However, when a zero-length transfer is
> requested (param->length == 0), simple_alloc_urb() still returns a valid
> URB with transfer_buffer_length set to 0. On the first vary update,
> "len %= max" divides by zero and the kernel oopses.
> 
> Commit 564e69893c63 ("USB: usbtest: prevent a divide by zero bug") added
> the equivalent zero check to alloc_sglist(), which covers the
> scatterlist tests (test 7/8), but the single-URB variable-length path in
> simple_io() was left unprotected.
> 
> Fix this by returning -EINVAL early from simple_io() when vary is
> requested but max is zero, so the divide by zero never occurs.
> Zero-length transfers without vary remain valid for the other callers of
> simple_io().
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/misc/usbtest.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
> index 8759df49be28..e2f5e6be353a 100644
> --- a/drivers/usb/misc/usbtest.c
> +++ b/drivers/usb/misc/usbtest.c
> @@ -466,6 +466,9 @@ static int simple_io(
>  	int			retval = 0;
>  	unsigned long		expire;
>  
> +	if (vary && !max)
> +		return -EINVAL;
> +
>  	urb->context = &completion;
>  	while (retval == 0 && iterations-- > 0) {
>  		init_completion(&completion);
> -- 
> 2.34.1
