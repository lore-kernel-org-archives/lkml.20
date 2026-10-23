Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759737;
	b=TB8BuSM1uoGq9ELAwqnZx2Kgnsk5g2Du02IfU/crtkaF5SxvcrROivK/ezsM3q2zgWMH
	 b10ndcVSd14ubiWoxu1JbqciuIEEfA/hoonwDdpUHrxiUzWqNAqOs3NBtu/qwRNjrecXJ
	 3WFKzA67AMRa5iuUlrA6Wvb18wa8hCsWNvd6IiIbSxMmUOY1hGfx/sawdOXa3MCwyufOL
	 maKI0TG//2Vs33DjC88sRYK3FBH1ynj6pE6+nOfV657xZImHJ3mAB+oaFTZPjoIFgI8LL
	 WmaCfI8QdttZ7/LVunwfRFcx6p1blofv6BDRpxONs12x+rur+oXcZX6mbtOq+CryCjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=AauMIhJF1QGD9945xyHgO/hlfJd5Li+gb8s1bXigGyc=;
	b=XoHkX8MBoKNdWjQN6LLiXsnq0EXOhb5GDc0WXuiR4wC34pbxFVwRtgU3mlyjLcGbHQoC
	 T74m8ZxJnAdxeApZZ4E7suDWsVP/zZvJlDiKIkBqMC8Oh5FdCik5lrZkOsnvzQ/6b9YBz
	 Q+LUliB8VehLao3k6zfT7vN3aS5+aqkJdr3Ye926YhNbyTbsmZFnzmJ9bVI0weh1KxJjn
	 vDrLrweuIy1TFmMwh/2+cA2CEPpkjlbUsM08qcS4eQtLCducO/Rg0liMytpQksZ3wZ7TO
	 ulfYiunYkfYk1X7xiVsY6FmvNQOGfVk6uZ6PF40UDkSIP8nr/L4jkXTSsw/ytYJBBGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=XF9u4sox;
	arc=none smtp.remote-ip=209.85.210.42
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D359606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D359606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=XF9u4sox
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f432ac553fso777091a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792759736; x=1793364536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AauMIhJF1QGD9945xyHgO/hlfJd5Li+gb8s1bXigGyc=;
        b=XF9u4soxGXFA0RQCyd++WhRmRj/0BJiMXQEhBhgD48Q45N9CLU6LSHl0hd9lX2Qs9l
         pZ7kYEm+htyFqJM0gFg7bjrVJszrcwcW8ev06Hogn6LmZ4uC5x5gF0Tb33JvTcw0HOLz
         gl8KalXbUYpN1ENER8lSQXL7OaEMCTnILuW+4z0Vk2Kj+SVEpuA3zSV+muYjVYwqORtb
         a5Mf/4R7q+mVzcb1x6ftmTzttUWuhyfso34h3geMNOYuzxWHL7o0McBcyBeLmJDbtJ6k
         6sJz7lfO2SYFq4P2EW1CTGDQAjiGNHj1HbFPZQG59MkDkCMROXZseuIHrlgIezZVjSUm
         OhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759736; x=1793364536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AauMIhJF1QGD9945xyHgO/hlfJd5Li+gb8s1bXigGyc=;
        b=aXBGOrQ0q54wFk+/S0VzOsP+YNy/m6s+AbcEPxL4oVZh4ZiqLi9iRULnQ5wVmWGeXy
         lbv1t5aRf2/ysVObzaF6o8WJM3DeDLg3B687ZwOCw9z2DRwcmnauTtUM5QRoRUSuXJHE
         SUhulgHQAqH1sdiXAAU8UcCzRMteSMpykj6yUSaHKvVKKwAl0hO40GhuI+eB6qvR1O7T
         4BfyBv+dMbBuEIFkIaYMT8hyxVQPr9bk+mAxQjKvXctyURy0H7em2OB6B2ZqchQO/zfD
         BgeyOQtx/FHXbiFH/sZjOG2p6Mb8pfeukarYJjbXSurkc5S35vbGqM1I5oLJKjoBHDBj
         IeZA==
X-Forwarded-Encrypted: i=1; AKwUvBwUfMg93MShrmTWrBmyQeh+5H4EZ9wIEZiRHJ5b2NLUFOxHsBQ81ZB6YpO6I5wrm0G0uiiQbOXqrTCJO3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8P7m7kf+zbpgz/E5c7fSHOc7BS9nTMfuik/PWw2UE4ioK79dQ
	kh8lKLPM+YyPGcoqRGX+hI0gdM4qZI4JDbmC8V3MWLJoVNFB/PzvPSmj52Mc3A6Nx5s=
X-Gm-Gg: AYBFou1ADZO7NqIory3fxOGKHXFWuirnXw5ATqLT//iSuJN/uxveDse1ZPnh/aASjwk
	NQ9p6mTG/Ch+x3z/n43Mhzyqkkwphuw0ClVdNSKXVXuJ3XaB6oWyhGGf5xL5nLI3ugRDzwlfp7Z
	TTSzDAof6XXxPiZFTKbTwHKl8Piusn8V2xSvrdDuaI5U3dVOpJ/xgWQJpZjlH3okzEINZMFsv6P
	yfVdIcfJLSquMhU8iedvLIyWKWpPrvWPYHq6nWGmSDUChy3jQwe2TdoCH5TFeaE1A0zesb2+GSI
	IO9ifaP0WiVT6Loj1+JEvsQ5t1au0WZFZoQBu41ZqVP0+E8omfdEkH+4QQrYaQBz/WVQP/vTP0Q
	45zO3U3mW16X+LwWURTJBBzqq57ioh04pmSEvrACkY3WnmWTpq17A0f5qxo5gb9XRI3jC/1+LHS
	OAOkSXws6jWYaYEFcS6FgmrZFkGADIOmi7fdcDAp+Ab1vSfvbVXU7RwN2a7UM/NNJkEwyngNq1P
	X90Omo3EugCg4kfTIbHifye4usJnIEL/rCjOJTAAwz0ZEc+YyuwB177VYEKMkPALsZzSdqJxQyW
	U38=
X-Received: by 2002:a05:6830:264a:b0:819:1804:d208 with SMTP id 46e09a7af769-84fb2906f38mr1294739a34.13.1792759736186;
        Fri, 23 Oct 2026 05:48:56 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbe66cab7sm1910704a34.23.2026.10.23.05.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:48:55 -0700 (PDT)
Message-ID: <a411ee0e-22c4-4797-9fdc-3ac11fa20d60@riscstar.com>
Date: Fri, 23 Oct 2026 07:48:54 -0500
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
Subject: Re: [PATCH v2] staging: greybus: loopback: Use fsleep() for delay
To: pavankumaryalagada@gmail.com, greybus-dev@lists.linaro.org,
 outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261022202455.104142-1-pavankumaryalagada@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/26 3:24 PM, pavankumaryalagada@gmail.com wrote:
> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> In the loopback function, usleep_range() is used for short delays
> and msleep() for longer delays. This requires choosing the delay
> function based on the requested time and converting microseconds
> to milliseconds when using msleep().
> 
> Replace both functions with fsleep(), which chooses a delay
> delay method based on the requested time. For short delays,

s/delay delay/delay/

I think "checkpatch.pl" would have caught this.

Maybe Greg can fix this up.


> fsleep() allows up to 25% extra time instead of the fixed 100
> microseconds. For longer delays, the old code rounds the
> requested time down to whole milliseconds, while fsleep() rounds
> it up when using msleep().
> 
> These changes may affect time between loopback operations and
> the reported performance.
> 
> Suggested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>

Looks good to me.  Nice job.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2:
> - Add more details about how fsleep() affects delays.
> - Update the subject to include the loopback module.
> 
> v1: https://lore.kernel.org/outreachy/c482704b-903e-413d-ba7b-5bf31c0a6104@riscstar.com/T/#t
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

