Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713828;
	b=19lbLB/SfgmtXP3YMNGb+j4llnRp0dTrnYjeozGyRlQJxgcVf43iP04By73y36JT6s/z
	 1g7GEOcw9as36WMfYf39HCM0zMnYrvr4ywhbRMugKEa3QLgqpGVSW5NkXyrrYz9c3YoLe
	 DwojyFC8wcFUdVyCR46aAZG19jc805q3CUowhNLKDhqHH034xQ63iWhamZjAa0ghjNtRv
	 dN/NVhMJArMRRzG18fa0G+s7vkVxQ6F7U1wc1lkwVse1NDH2lE7iJh0eRdHHnnbWfEQv6
	 v4E9hRIVG1K8SlkOUl19YZgRnjEOUfAP6hJ2EOc/esZX39GFuHWCf66NUUVXF59ZJfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713828;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3dgjpC6pDuaS5y6mKKf0Dd9vvhNJOGz9Bm42FlKdXjk=;
	b=GD/aED03aJJJ1Xtqq4JSesiOnEIbGt/3Qu2qwDAjZbyHl+0A6vEZXamQuvzo9Jmm0bTL
	 xSYN6P5tQZrj90XLfz5Kyv8sZigbe+Gjh/0x0m/ASbb/6tQDW/Lml8pkL3lVKh1+S3Rzw
	 pTBD24bPOBaFwmNeZxjyJdddjmm+jGw7CJVc3tzLr/VtbuodlK+Tb9hwDJp5zTUWbTG1o
	 q28VeEz3p3M0RNOJKx94HZnSc18sJMTLrm24kySFcvr+TzHKeSKwPWqFvCkznt9mMIpNZ
	 6AITxSE2RbBLu/OmT7ctMTzMwBKGgBRXuclMZ4UszL7rsGKMjSCdCySagV6dpBV9jyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=ShhvWdvx;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D10606D801
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47D10606D801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=ShhvWdvx
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-85a5455bd3cso2320437a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793713826; x=1794318626; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dgjpC6pDuaS5y6mKKf0Dd9vvhNJOGz9Bm42FlKdXjk=;
        b=ShhvWdvxe43+s/mZN05eyl2bIHOs+Jfh97qzUmsf7UqgElJnD+UB3ruNsVlTJTBKBP
         V4oQI/dcj0mWEsa3oXfnKaZihUK9u3jTwZlk1HRQp5AocEpTeQsg4Mo92H1rwuK0WmYc
         JcdXSPMKwqV6Co1f55dYEoZ9mvF63J+1Rlvbs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713826; x=1794318626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dgjpC6pDuaS5y6mKKf0Dd9vvhNJOGz9Bm42FlKdXjk=;
        b=WsKxwgyVdSZk8mW7kNKgGMySevjSw2QoEbPBPL7TrdqOkJevHZ8zG5BohqUeUSJEAt
         4zc9vsLAriJ99LLIgfsq4uHY3ZSCDvqwdNBO7F0l1ud+Qh4G83D/3Qh6t3SnHaBMuk8T
         QW3DCKzwjkyq3LWyFU2GA+cSDTyZT8ORYThoAQsrhFgQgnNnP4Sg2D2t0kyChwp0/aae
         +mXhc9EDKK7cjp8R0TPYvNeeLVMCR8NJ8d9enlHAGCSB+oWwPLP2qDZ4rb4oVMBOmoMF
         cG6kOUkyM89kyxG+HS/0iUNB21RAbdnde5b2f8PzcgJXuo7Xj6O3zZDnSOvn5+OKJJ4e
         +Ffw==
X-Forwarded-Encrypted: i=1; AKwUvBwqCmnEwe40xI8+njiotUSTpvlXg+bRGubH87xzPGJj/gWuUvEpSH22aFODdFIMNhy7Ef7/JseF1o1cZFI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rsZP5Krq1ZXvwmE5CMLAVGNuGOjwZXyQ4c9PWEN3dWbeAsiue
	Idp7aCIvA4oiQwzqFMmGHnbb5thUHS2tfYXgkU9t544WQlKzjx3ALq3pSG+1PKWAaQ==
X-Gm-Gg: AYBFou02uor6DSQaa9Pd4/l7oLS9n8jAwLTLEjzbOzcY5x0FM8DShI+3sUMBP9NKjbx
	K0LetJoJpkBSnLyg+hvXJd+tglIiDRSWrrQqXxgGR5XmmHkkpO/b8OpysIq60vSfPRGYaNRi6Co
	pn7ynNlzXODCRUbCIDlMdevsPEb3lX0ew1gVC12B+Mln2CPy2VXx+ey5NWdFGVL/agXfKP4GisW
	Z04Zq443Qam7JkgckRIsonXxoE5eSOXblr+G8mlI4C/LUUecawqyttavpeTG+m9iTWc1mNUuB5y
	bvk0ATfs3zFqdUG/KY3ndYrN7VvRMVrIn3Gn7nqWU31o3B1WnHhxb4aKrUCtTFn7rxmUzHtx4ab
	0pti6MUQ7s1WmTEKypejmySdOrTGQ+kxPmJICuGx2vwwMZEAfuyKSDCCjl6mjPtlfiIqpbC+Mck
	UOhSUB67vMEQ8c06bJspFamRFvDVgppN0oISV7joIT42vSlNWl4cnsv16BbMFCJuH/orJIC3IG1
	6ryK79g8mBozGljmkw1YBylrhdd9w+n/fAwspHDLXddYm1FTI2k2pIDfkGHkkKEZb+w9NPXit8l
	JE4GTF09FVKwN/oL8ilYyNQ=
X-Received: by 2002:a05:6830:3915:b0:814:8259:780c with SMTP id 46e09a7af769-85d364b61eemr8811788a34.19.1793713826096;
        Tue, 03 Nov 2026 05:50:26 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-85d3549a245sm12141851a34.12.2026.11.03.05.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:50:25 -0800 (PST)
Message-ID: <686eac0f-6ec0-474f-8a9b-9d52cf23aad1@ieee.org>
Date: Tue, 3 Nov 2026 07:50:24 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: light: use sysfs_emit() instead of
 sprintf()
To: Ken <ken3009le@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261031084648.213333-1-ken3009le@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261031084648.213333-1-ken3009le@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 3:46 AM, Ken wrote:
> According to Documentation/filesystems/sysfs.rst, the show() callback
> should use sysfs_emit() instead of sprintf() or snprintf().
> Convert fade_*_show() and color_show() to use sysfs_emit() for safer
> buffer handling and consistency with other greybus drivers.
> 
> Signed-off-by: Ken <ken3009le@gmail.com>

I presume "Ken" is not like "Cher" or "Ronaldo" or "Drake".

Please use real, full names in your signoffs.

Also review the mailing list history for other instances of
patches like this.

					-Alex
> ---
>   drivers/staging/greybus/light.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da..2689f9a75 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
>   	struct led_classdev *cdev = dev_get_drvdata(dev);		\
>   	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
>   									\
> -	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
> +	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
>   }									\
>   									\
>   static ssize_t fade_##__dir##_store(struct device *dev,			\
> @@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
>   	struct led_classdev *cdev = dev_get_drvdata(dev);
>   	struct gb_channel *channel = get_channel_from_cdev(cdev);
>   
> -	return sprintf(buf, "0x%08x\n", channel->color);
> +	return sysfs_emit(buf, "0x%08x\n", channel->color);
>   }
>   
>   static ssize_t color_store(struct device *dev, struct device_attribute *attr,

