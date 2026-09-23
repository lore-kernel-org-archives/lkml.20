Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45F045D92D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790155805; cv=none; b=KwHFn0LQ1d+fCMzxLwmR2A7aQRmVNLrqib8i+1LiUYH65/16zkaN1gjXcOZLXRjHbrNtzjiZzJotEKoiJNsjvo+U94TG6pQz5URTybNqn7aOvI6le0YTrlwPO9O4VTMY1YNH7SbkJxbefqWFK5DQQnUWN/fBItfbO2VorZsn9cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790155805; c=relaxed/simple;
	bh=eWLeqpbbXtrRAv+whCfpPs+DG5cjmoOBUDqsuCtZP2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=InZFa7vWdnGVMo9LUREigmRdG4OBheeWwv23NS+NyQOk8vzXgWKsgVUJXyffNiKWCErGkBIqT8+vwj3XONmDiXA4F9Tyd6uc+noUH+adpzGTsUx1g9rTvkmQoqZYuzrs00klZDkoe0K+Q9mE9UFafHlcCsxdJ06Ln2srTMplqyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HPhhJM5n; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HPhhJM5n"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49d097b4939so3510195e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790155800; x=1790760600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j85Q0Due/RmRnLWXRpqKRsR1ZBPGAvBYI24rxRoo9rM=;
        b=HPhhJM5nppNeWupr6AHkaQ50W/Wibrdr+jAxhN7jmUjHfF79MJHIa6Z3PE9uOE7Xo0
         V/A+2GrPRwc6TA/1zmHtfqHZGK6k9gfebPxmIULJH+HUUdUGV+57CyQYCxj0BDEvyVg2
         V0Pn6QXRCNC4mIk77IPAYQsoOHaN14k3IUAz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790155800; x=1790760600;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j85Q0Due/RmRnLWXRpqKRsR1ZBPGAvBYI24rxRoo9rM=;
        b=MAys56NUpi4TPuXp1mTHAuSAxI1zT8piCwUZ+TLrLc8/t1FG9vdbwiGMgdW1IJxlJf
         MxddtIqfeVoO8EB/eYDFKFQp9ARhWWi29XmKJ0e75A6b1R7A6a7hIqOI8sdxY/jS5opP
         rIO6SZlL4lB/O1kHxAoJ9fKXHNuwXJuXPuHPmN6v78rdyoaWtiaQjFdB52JOKrSFg75W
         SNMfac8rE2ZvcTNk6xY5UloZIRithxTUbcuSsalPIIkVzfjQ40dE0PWM+9t1cBUzNMvZ
         SWN/SfitqNKIb8PGRBencsCxUSK4NSzdCebSvluJM7mRN5ZVR1aa/6DA5P5N7jVWLimR
         sLvw==
X-Forwarded-Encrypted: i=1; AKwUvBw7kLwTZpWZSB2tgifFtp2PYGQlPoSY0cbmMKGNgNCDO36SPtGNm+dO1dkzyMh1+z9xsvtXKWGQz/zIXtE=@vger.kernel.org
X-Gm-Message-State: AFuF++mqP9M7MB9AtpJlGJI1gjbHhim9Idu/9E+LdbJx+L5m8Yfj8m4s
	vhPlSXSOPowDcXsB+19UebUdwD2f2eTp3yGm2f0IJLVevL50bNIKrXdeAbDJ/KQr/luWTr1wtXG
	MRYT6VANJKQ==
X-Gm-Gg: AYBFou0rz65PJJZJBVAm7Pxmy/dIzLdopxXBThEJmBKnkLo74wVX+AVFdLYokzqkbcL
	IRs7sEqYyfEtbqQvhswxfFHeoEx8DW8d/gARHIRRrohHiMUXaFUuC9Mz8AttjFyeKXj/ISiI2O+
	sddj6GpeCpFfkmEn0dDWnGEmaNPlyLegxTzhRrQ6mHL3NY2QAOrTwBaDZv99CZFtqnGNennynA5
	Y0G4HmS9vRrRobHq/z/V1aklTOnIkLc8EfaBmORsT+NWutgeB3m21jMhQ+qndcyyJUUtUSLVsMD
	mcj33upEbUIW4WL4DN2IgvWukBSILbfDFh2e7iUeifqQlL2c+l0XfBeZiDRxzasBriiZeVuQql8
	BopUtrEMce6KfeTCM9kD5ZeGAX6OpbGo36XiK1vi+58GvG0BSnlGRmiOGJT/Iv0Zd6xYOzzawRb
	Az8vmQTZd7L4I86cHFgHQOmAnUflgOuBKvPz3+NVLO0wagOBejT9HfKC10XVMX5y/3bBcDVm7US
	oe4/2muX1KOdYSvcA==
X-Received: by 2002:a05:600c:1553:b0:49e:81a7:9fbc with SMTP id 5b1f17b1804b1-49fdf13a117mr21651785e9.24.1790155800017;
        Wed, 23 Sep 2026 02:30:00 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm58177785e9.7.2026.09.23.02.29.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:29:59 -0700 (PDT)
Message-ID: <c80ca0bc-1398-4f6f-bfcc-c49089a51082@linuxfoundation.org>
Date: Wed, 23 Sep 2026 03:29:50 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: stub: keep URB array state consistent on errors
To: Weiming Shi <bestswngs@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Suwan Kim <suwan.kim027@gmail.com>, co+66c3f58096d0bde8@bugs.sh,
 Xiang Mei <xmei5@asu.edu>, stable@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260912083925.587987-2-bestswngs@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260912083925.587987-2-bestswngs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/12/26 02:39, Weiming Shi wrote:
> stub_priv_alloc() links a zeroed stub_priv to priv_init before the URB
> array is allocated.  The error handler may therefore consume the object
> after stub_recv_cmd_submit() reports SDEV_EVENT_ERROR_MALLOC.
> 
> Do not publish num_urbs until the array exists.  If a later URB allocation
> fails, clear the freed array pointer and count before the event handler can
> walk them.  This prevents a NULL dereference on array-allocation failure
> and freed-array reads that can lead to invalid URB use or a double free on
> later failures.

How is this problem reproduced? Why is this a problem in this code path?

> 
> Fixes: ea44d190764b ("usbip: Implement SG support to vhci-hcd and stub driver")
> Cc: stable@vger.kernel.org # 5.4+
> Reported-by: co+66c3f58096d0bde8@bugs.sh
> Closes: https://lore.kernel.org/all/J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7%40bugs.sh/
> Assisted-by: Codex:gpt-5
> Signed-off-by: Weiming Shi <bestswngs@gmail.com>
> ---
>   drivers/usb/usbip/stub_rx.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d9..33058fb05b2f4 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -534,10 +534,10 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>   	}
>   
>   	/* allocate urb array */
> -	priv->num_urbs = num_urbs;
>   	priv->urbs = kmalloc_objs(*priv->urbs, num_urbs);
>   	if (!priv->urbs)
>   		goto err_urbs;
> +	priv->num_urbs = num_urbs;
>   
>   	/* setup a urb */
>   	if (support_sg) {
> @@ -641,6 +641,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>   
>   err_urb:
>   	kfree(priv->urbs);
> +	priv->urbs = NULL;
> +	priv->num_urbs = 0;
>   err_urbs:
>   	kfree(buffer);
>   	sgl_free(sgl);

thanks,
-- Shuah
