Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690510;
	b=ms4D0BqOVCYDLHSKF4QMjcSmjLL0LFPhaAGjLKMQIaSXT/be1NDcePYCMI2Ji0l9FG1S
	 8YuZnqGB814kLjm3TzuxQzav+W09EG3mkIDPwlsCAQdC6Hmw5jah4fpW4EzVwucX9Yn+c
	 GImHEcuUmktda1TEadvzxLRtdhSK0T38obBYLJlxQRqBqhaLAauxk8byTfzdK+LeugvT3
	 BKZEMd4vL0LNiZlpMxHa/eX+kFclrSqIo6RKZnOIfMBKp05XE//qkNv0fR+VkTxwICymk
	 O/5XpgG8ShiK6IuzHrL79uBliYr1OsnUWgXMBk0qR85V1rqKy56pXJc1VSJMY3GPiAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690510;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=f/KnB4zhJgMl+hFjknvmtRA3SG022rMHPfbeZGqIblc=;
	b=M+S+SU1a61KIvYe2i0oJI7DP7gkvdjF/BEkN1GbdS6BjAoI3bgNqH1uXNh5wBZbbzaiD
	 NjZGAGvQkW5O2U4PFxS34Jecx8gXjnj0jXl3yJ2JMAMonxR8JG7kqNZiXb1hUcrdPzSXP
	 QTtke3XoJr6lOAXVq3sn1bp914c50Vfq8Wn/Q96Gp9eF8kNOecE8lryIy4W3N1+bJ+ytw
	 aJjTD2IC7RZeS1wTKasAAW6nwWYPcCnNnXlWeEF5R21Fbb840V4S2hJm29hOQy7Sem9Ie
	 2GOU4JRumk5WX7F2Dp+Y/cYLY2R8RgFsalsScOawMecHnKlP4wxnbn79cWJu47SLIAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAc5e13a;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2293E606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2293E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAc5e13a
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so24978895e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 23:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690508; x=1794295308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f/KnB4zhJgMl+hFjknvmtRA3SG022rMHPfbeZGqIblc=;
        b=rAc5e13ajULG1v3AnfLLIAD5cCrCxGudDlVWRdaYveV05iOKHOtx6s3SmbzF4RgQfc
         ngE1LrUGF5rKL7pwoGri8s2Eb+TzsZqa77WH1ekA3cC5qiw2YKUL/BS9YypQOQDuXdL3
         wo6Z/vHxOPrO5n1kkXCTOwIi8CrIlZe4NAL4OX9ZJHC0nYOodQZu6+62QUwfYYIDmSqJ
         35pvTa60Z+HScl3f/0Aj9abXG84txnSzRtOon3j8uk13JMeC7tiyTAHQKkzdZOAl6Vzd
         okqBPoNoZDwcJaffKKCNPlMTg0H3K43ZIrK4FG91Z3h2QYGhUSVo6MXDO9WjLlMSr3Kp
         wVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690508; x=1794295308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/KnB4zhJgMl+hFjknvmtRA3SG022rMHPfbeZGqIblc=;
        b=OIjE7h+2/czXydTOGkHlpfzHhwdM+SaDwFsTbFj1WI81mM8KRP9Zh456nCvzINMwNk
         GJN5oKAXG9PanBp+C0jGVE7SpLwlcn1vpgwvkHNM65EztpjuOyu3SCjza6Zut5hVgpUT
         rDU4NvGZj+ml6jAnvPXwkjHMh6kbbjAdOoXY7ilZbQ9MY4qhAatnVSUKuabQS9nKt1uf
         7htKN3v0GfjCpCLVEuPZiuqHd/ftGqRKJ9agXv3ZvBUeJQ5PUHlmWwQ5p4yr9Gq8gi2k
         08ZHJJRfmAaI3ouSQHEjp4sBwSa3GkAk6EWp6o3c6qan5i182aVxOj2Lg28rsQR3Xq4o
         0x9A==
X-Forwarded-Encrypted: i=1; AKwUvBzU2f8FaIMG0a6tMkzu3mUgyzm4lfGZkHXy4yXJDeJsFpGrcQehPsWUfV2s39gb51T82gZVUseNUNbdma0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KjaQYxf//CHUvMTX4l89324lb/GI730wf78OVmYpQLMGF2F51
	KdJsdtTR9hcsNRMn3A5v1aOf+nXL+ZHbTsUR7gVAtUOoxUI8txysdNpJ
X-Gm-Gg: AYBFou3xT6m1LnjGVL+RyLp2xSduPOeyah/VQh76Eth9+M7E5ArAJmPbzjjudfVdJO4
	RQCiRl85d/iLdIk8hcTTpJ79pXHjRTr8NWcVwG7COiZebxsISMrzKG0FXhawLw4Hjf8ejcG2ssK
	nDafOt3YfdTrX/hhW6IqaRlJKlFifTy6CgY4S/jw0BO+yxvWrfM8TK6aXEAEc5lQMZ6IojvVKfV
	NOAA+3V4p2uxxLSUnZfVkplHbJWIT6oGDicIKILdEJcShfh7uLF4oDWWCPaH+CvuhSoTegA5ori
	HV3oLPUn0ODyiK7v4LTclnV5CLv20k/tyc1UBhqcwSPmU+Bjd3+PGiCjZD6zGd3bLC7frzSl6Xs
	nVVligjZV8X3Cpi8fYkw2044SscNJCL8kHQ7W8l/oXkwSMP7lbkxBg43Wm/s6RbFeD0EsjfvXAo
	JONUDbwh+p/De1ku8+sllrmXiY3eVzgXRUidkXPmreiG98an0mQVoiz7xtr0s/dvGczKZNEnHyl
	21q4CQ77AWHm8MhnYSZ2dRGIA4XN2IDEdWSZ360GbawnIGRPi5UiLqgnpKBgcaU/uA40R8qaxx1
	I3FBk1RW/+Cc1ZVtDZpUTFrZFBQC6Cx0vM33jhaFhlao3eDOJg5dylslZmqNyN6MVvpUSnmSKjM
	RhjPf5wVvnCeX+YaFVK+dB4fXiAIEIpeSycw=
X-Received: by 2002:a05:600c:e548:20b0:4ac:86c9:b09c with SMTP id 5b1f17b1804b1-4ac86c9b146mr172730365e9.13.1793690508288;
        Mon, 02 Nov 2026 23:21:48 -0800 (PST)
Received: from [10.77.100.5] (ipservice-092-209-215-046.092.209.pools.vodafone-ip.de. [92.209.215.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm43172275e9.1.2026.11.02.23.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:47 -0800 (PST)
Message-ID: <cdf44987-3a3e-41f2-a067-8181aea08880@gmail.com>
Date: Tue, 3 Nov 2026 08:21:23 +0100
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
Subject: Re: [PATCH] power: supply: surface_battery: handle battery event 0x1a
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
 Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023173215.6233-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20261023173215.6233-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.10.2026 um 19:32 schrieb Ramón Jesús Miranda:
> On the Microsoft Surface Pro 11 (Snapdragon X Elite / X1E80100), the
> Surface Aggregator Module (SAM) emits battery target category (0x02) event
> CID 0x1a alongside standard battery status notifications. Because CID 0x1a
> is currently unhandled in spwr_battery_event(), surface_battery logs:
> 
>    surface_battery: unhandled battery event (cid = 0x1a)
> 
> Add SAM_EVENT_CID_BAT_0x1A (0x1a) and trigger a battery status recheck via
> spwr_battery_recheck_full(), matching the existing battery state events.
> 
> Assisted-by: Antigravity:gemini-2.5-pro
> Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
> ---
>   drivers/power/supply/surface_battery.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/power/supply/surface_battery.c b/drivers/power/supply/surface_battery.c
> index c759add..a3fa899 100644
> --- a/drivers/power/supply/surface_battery.c
> +++ b/drivers/power/supply/surface_battery.c
> @@ -26,6 +26,7 @@ enum sam_event_cid_bat {
>   	SAM_EVENT_CID_BAT_BST         = 0x16,
>   	SAM_EVENT_CID_BAT_ADP         = 0x17,
>   	SAM_EVENT_CID_BAT_PROT        = 0x18,
> +	SAM_EVENT_CID_BAT_0x1A        = 0x1a,

I don't particularly like it being named 0x1A. Do we know what exactly
triggers this event?

Best,
Max

>   	SAM_EVENT_CID_BAT_DPTF        = 0x53,
>   };
>   
> @@ -368,6 +369,7 @@ static u32 spwr_notify_bat(struct ssam_event_notifier *nf, const struct ssam_eve
>   		break;
>   
>   	case SAM_EVENT_CID_BAT_PROT:
> +	case SAM_EVENT_CID_BAT_0x1A:
>   		/*
>   		 * TODO: Implement support for battery protection status change
>   		 *       event.

