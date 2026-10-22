Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675711;
	b=NKjTGf+IzoKnbA4tKO0dwS5op0j+C1PekzyIgZoIpYVEs91WYQISwpVIcVSGk4krnd+G
	 ZIseHNVGzSWaPjYbJ0FhqScdX8qyJO/lNECwS3izxXYSG9Bus6/bQK1t2RX+R6un8N7i9
	 Rgpz69B1tU1QkwkZaYAS34MaSlF0w/+IVq1PcxiRyAjWkvemFIuQTmhVkcEfhwI+GjLxX
	 p5kYPozzV/1fwiDnc7yGlEsDXKpe5N/0eX92/rx3pwdu/d9Zx8KvdA1nS69lnBo19NhMq
	 TUZ4sN8ce9HM37miwJApjzYkV/N1SlqBEO2nvRd/mo5HFnP6gNZFWe22tDkluHlIzOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=LcT+KP9K464dUVVNerb9of+gGfIt5gtSXv2jKmAZWX0=;
	b=wYmkCNJmNhbYpGgtpupCCmOURKJgbT165pk/4sjnAXNIiPd+nSsk7r11oLcHIiBjf3/G
	 36cUBAQBV+/i/WaVkhOHapfTutcCcMsoba6s2uG6omsNLUVsDuCI7/pM58MWPuESNAObv
	 Zag6BSr/MVeY1lUP9O7zCE+66BRbx03ifHp08eRNSRuyfdPBKKbR3i51+nRVMweYC3C0x
	 1MAubpoP1PBYnycC7LjjsxRjKwsTKoHsRGxWpwhq7ydCW4XC4O4afOti5GfOnsgfZX6n0
	 yeG+73wMRSoVerHHqKJp7cgWIw/zvBTe7TnHUwY4vJZDQg7XB6tsKDGk2vySR2jfBSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m68WI4N3;
	arc=none smtp.remote-ip=209.85.161.53
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3574460A260F
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3574460A260F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=m68WI4N3
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-6d290b10a35so815458eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792675705; x=1793280505; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LcT+KP9K464dUVVNerb9of+gGfIt5gtSXv2jKmAZWX0=;
        b=m68WI4N3AjZaPE0Zubwg4t8mUQyL1aREQyjpSuwgV/luMaGd6rdpsGVu8x4dqtbBLQ
         HEIqwsIOBXlJfpKN/ZXShBB/tY6viZJ3ZF2dEb3JDBgZG8vsRWNLMLGONRJLCIv6rBCf
         JY6Sa019FJvi7sHjJLkGbZAVQVS1KIlRleKRPhsBF8OMYZFvS55YtVZ8JtOy2DW0tqyG
         +uma+NkyFWf+i0bLlgc4SxNRelDjH8TZWLAdPeVq3LyFvTUd82zIGcBjDr9m9UTHmW41
         4QQxiIYukCyHgJZ2rJfnj9tSq10jQ762g86ds66sxvRxR48nEC2cD87prqr7rd767m2v
         vf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675705; x=1793280505;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LcT+KP9K464dUVVNerb9of+gGfIt5gtSXv2jKmAZWX0=;
        b=Pxgbk7v5FtWyyu2yRVcgAM7wbJRZr9bFjaEfdGrYI1SwAYQbxY8VAmr2YVNpgKiCMd
         CYwt3QWWzXK+EPObK03HHHjFTjh4Bwdd4P1m52+OYCgKSzyhXQyB6rCNIej9V9IzvC4S
         5CdcHW1JSNkVZYMrVpHfbneBRZe+8pYlLJcyvV/41FSGvcANjzRbAcOApuArTbZSplvk
         p9gkMC7eH5sCc23WeUd7PPHmsqVmIfWfbekyNj20AoHkpo+W6LPa3l/TnK4wvlnEIBGJ
         iTNfvj2b0H9jhNhJq7JA7441JVY5aiBmFWMB2kkY+gFCeZs1mHOe8vgfrgSjyrvPkAxg
         uYtg==
X-Forwarded-Encrypted: i=1; AKwUvBxw+SXbIPnd136IxTBhZxa46VL2lxhezUBEq2wUhZ9jcT/S7UFVHouZ1MTk0/k5MJ2by/QyF9orIMU4LNw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzIOrxo4Jx9pvUJygFBbEXuqpRVqBXnlH3ts6EQYkZMObOMhh1
	hlNC7kXfOB9rHQh6iaN/svee8hjjBEoHDBtUY8opPpqANIE2AD3Y0X+pAiEGNtX62/Q=
X-Gm-Gg: AYBFou32Ny3veIN9nYRnNOIgcgRm9wwK0WpoyGJ6FuTRepawzYVfDwrOTDi0XzeK8vk
	Ek2W3gM4/VrVNjj5ROzrANOT9LDnlHptEmpXY3O6r8d9E4pteEZ5v9HMMnjo9folEdCs8Lw1H4K
	hG2wKILStOhio0cCBGCJ+dZi9TTM02SFq1SbFTzFw9e+0IDQtWsVLcTtNzSfkXgdsW5gZF76hj+
	VBUbcfDalL30DEeeEbMQq+HP0wlhL+K92NsPeccUF9g3Pg6rYVktl1l7VOJMtZUYD9aofjJxKJL
	f6yYrwNQRg0b6yOv+PdPG3AgyLljHu/qn4uWdeq1T+gxM+rc35n9pNkS63EMcni+9iHQlArwwZE
	xcrphSgh/icgQu7IWqRcl4hKrYEdaETmhPxgT6BIyTRZ56yPprisM8KDyy5Gg5Y9yTQyE/XnQVJ
	MeAYkt7d7UUdASsufYU2ioxM0sZ6XHw9W8qJfIc7oIhTr/sG03g7OeC+pInlHSscaBwcQwE7S+5
	2jO5fycR+qx666u+MTWkocnBCYfv4U/7jeBoXuR5L1CfxC83uedNbRn
X-Received: by 2002:a05:6808:4482:b0:4d3:9029:5ab3 with SMTP id 5614622812f47-553585760c1mr3346235b6e.35.1792675705007;
        Thu, 22 Oct 2026 06:28:25 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-552b745f968sm4259064b6e.14.2026.10.22.06.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:28:24 -0700 (PDT)
Message-ID: <6d683673-39de-4986-a593-68a5a495e764@riscstar.com>
Date: Thu, 22 Oct 2026 08:28:23 -0500
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
Subject: Re: [PATCH] staging: greybus: Use fsleep() for delay
To: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261022110238.38824-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 6:02 AM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> In the loopback function, usleep_range() is used for short delays
> and msleep() for longer delays. This requires choosing the delay
> function based on the requested time and converting microseconds
> to milliseconds when using msleep().
> 
> Replace both functions with fsleep(), which selects a suitable
> delay method based on the requested time. This avoids the need
> to choose the delay function and convert the time manually.
> 
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Your description above is pretty good, but I agree with
Johan's comment.  In fact, you should think about and
understand exactly how that behavior changes with the
switch to using fsleep().
- When would the delay be different from before?
- When it differs--by how much does it differ?
- Is this amount significant?
And the third question gets at exactly what Johan was
saying should be included in the patch description.

We want to know not just the mechanics of the change,
but at a higher level, what is its effect?

You don't need to provide a super high level of detail
in this particular change, but you should demonstrate
somehow that you've thought about these things.

Please submit a new version of the patch and reword
the description a bit to concisely capture why it
makes sense to make the change, and why you believe
that the change in behavior is likely harmless.

Thanks.

					-Alex

> ---
>   drivers/staging/greybus/loopback.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index efc69c10cffe..2fe845eaef29 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -898,12 +898,8 @@ static int gb_loopback_fn(void *data)
>   		gb->send_count++;
>   		mutex_unlock(&gb->mutex);
>   
> -		if (us_wait) {
> -			if (us_wait < 20000)
> -				usleep_range(us_wait, us_wait + 100);
> -			else
> -				msleep(us_wait / 1000);
> -		}
> +		if (us_wait)
> +			fsleep(us_wait);
>   	}
>   
>   	gb_pm_runtime_put_autosuspend(bundle);

