Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794313534;
	b=yVEv+AWKTLHrqxFOjhAio7/tHXAj7SKBZzaZtCl4jiptyjgeyn9ZTfHMK7euSZsN+wMb
	 ye/Yzr5Rgc8iNp46HPdgv7/BHO/23tyG5dd+h9PPOKlazjAl5zdoVjvaE22qYFHLcByOv
	 uzwYsFRhVCJvPSiOJt5lJxfO98Pf5s3krdCr1RTPiMF/a7nnyG4yHAqdZ0AEpiYnJb5uj
	 AKdt1R6FD7l0BOnWKhIT+4DlweQE/jWfEJThQwsLr9pL9CJ8RT4025S+SEaZJ0c84GKfc
	 3l8/GON2eH85L9DUA5K0gX4cj77vp4iP85Do3XdPCyv6FjpxDOI+/Ohon0mikDjRBAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794313534;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
	b=b8w8CXvuhTrmeslW3a6cd7zIUkykn9AQxcuvOhRWwpE2t9tQ357K5YhqFgXBkpZ/FrLB
	 x4dVIiei3T7NKM7AAV6J8LKb6VepjT7WFr3PUVbi4/HNc31WOmNb0zOKuw/0rQcqJ/xKU
	 Vsimvgm2ZSxqWiDNWvPltMk6d6HZxOqwR4GRaKb6MfHAoF6ZY5zzzx6//S6tp76bG5MAz
	 6PKwDnQSIQiEFOOQKR+S2euxykxEgAp4avqFNAZkzmWiM2//rvtpyYQsHBx6PvugJE+OY
	 xhQw+HCpJKHvljJqxq1Oy0XvrikCvR4AT84ZjUNFYpvNeLFsvLZl3wvsO86bPN0vZiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="gXlG/bcr";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OZ5PTgUU;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915C8606A326
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 915C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gXlG/bcr;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OZ5PTgUU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794313531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
	b=gXlG/bcrmVGPnJqhLR2SCNS7fXq8XE+l4PpmiwF6t4o/BkYVvcbswnBFB4xYOgqW7Ivh8U
	0niTO3dE6umwzqqmFxDsW17uB9ENDjlvz2IwqFBa9jwMMVz6GfNJTc3KCHms+aVodNX1Mc
	y0b5+tVlKdg/y4c9v92pSKLLVYoxgEw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-uvFekjDtOLCO01qec_asSA-1; Tue, 10 Nov 2026 07:25:03 -0500
X-MC-Unique: uvFekjDtOLCO01qec_asSA-1
X-Mimecast-MFC-AGG-ID: uvFekjDtOLCO01qec_asSA_1794313502
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so1169525e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794313502; x=1794918302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
        b=OZ5PTgUUrM/bCkP1D/FUAAlfZS3NzHyDd4Ak/fTk1dxj7r9esRupwQbuFptwyWTWTM
         HmFsB3wa+Z9BcACzYh2q8cYDzIuD0MRqF4BQ+XxTFnWonPBhVcwwVvdEUATt2HR9QGsS
         0gV0PYOvwiQmIb4fuEOVZcmRznMScEMw9hEW3zMtGHNkk2U3oeEjJDx4ITiB7k1jMVAs
         rJSz/Bs6qu21SG+XZQk/Giv6yLd3PmIA7iMBexQ++qgOvaIejAy+3a5KOUXoaT52bHQ3
         Ve+liNhvCYZwEGuQaqjHKN1rtzCFjC1pjxGmZcS4Nzv0/tdH3hiAc9kCsphoICbFhF3I
         mWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794313502; x=1794918302;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQa/zF/czqRgBTE3EecGrylKNQt9LYXwl13l8Xprd24=;
        b=VZ/eSPOq2hpPJwzYXq59iFyDQfISLnDuWUiQrTcCayh/VZs9nNhjKgXUVrrSZV1LS/
         WF3v0EshhnLNvBDlAss0d8Q2LmePYlB5lJKMl3hvpUNq3/bYLegLVGokHtZlr0OQz2be
         qDdZf76IXmDF+FGM6LsyH9N5OHTuPueXR7goLiFpQG3An6B6NcDD9VU7h2xsVLu2Lv/Q
         mc/sQ5JHxzbLn7zLEovgUhN9fZOza+LGWC9m4NKpEe7RLtB0NwXG+dRDEjoqslQbh2Xd
         2tGY9+zTYSYP+y9q/z7xwHgOUuGO/L/c3SRzhoEuzj/P8xQm8L7VbheWGU9ed9kugDKK
         2WJQ==
X-Forwarded-Encrypted: i=1; AL+hErG9ttn08Z1ivPn95TAo3FJQUKrRRxXmfiU+dWFiPszjtUU5JLK5SAggDhM1LDUNHyyEipgDmlXDdJq3haw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vuHMXG12GQlnkvQylFm7ORikdMbHa3nxRzMIA5AhuzwOhTiRC
	TFjtZr+X21nSUiI9pJaskz0gRgrB8DiFB9v4iLJ4z/pK36b0T0tPCGABpHwNh/G5yCcspeNOUnM
	nndKk2dtWLB5ydSO6bAAHg6GgA2vmX8PoRAbvt5qF6ljzlgRFbyFDkAf0mNCMIxk6+w==
X-Gm-Gg: AYBFou3w/KKYMKIYHYXt+5+WoOB+ObT6jOhaLs5U0JClq/0AHciWNtPfjklPat28UP/
	JARrt4UHvQ8Nln8FVbagqen3zPvo46PtmMAAeg8k4LPulBXAFLMxxduf6edhrjLVExELfBGIp3u
	Qftpwmxp/X37Ug4ABLRr39xRss9E/FH+fnMt9WWQ+8dzcUht5RVzNoWgj3vMPtKyHsEm+nlDH2/
	bhqHgXayUCqHljN2JsZ4sqQ0fLAf/4bCmpBCKvdTYEjuNHaCVY+jNLEl+EOGtVih+Fg8ehZPb67
	WYv/IkZMOOchzyMJpYuCOz3pJAls1N9FH5eBGh2n9Hpc8J+68tfboVmBc357Fg/9Wc8ogSt+/Oj
	XdDwQPeyastthKFFadddX8xr3iDOfPkKgnEE=
X-Received: by 2002:a05:600d:82d3:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba0234ff73mr46627545e9.26.1794313501875;
        Tue, 10 Nov 2026 04:25:01 -0800 (PST)
X-Received: by 2002:a05:600d:82d3:b0:49d:1fa8:b266 with SMTP id 5b1f17b1804b1-4ba0234ff73mr46626915e9.26.1794313501466;
        Tue, 10 Nov 2026 04:25:01 -0800 (PST)
Received: from [10.43.3.161] ([213.175.46.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983585c5b9sm4681271f8f.9.2026.11.10.04.24.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 04:24:59 -0800 (PST)
Message-ID: <42c9a0b6-0828-42b6-ba9e-cd49fb9ef4bd@redhat.com>
Date: Tue, 10 Nov 2026 13:24:58 +0100
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
Subject: Re: [PATCH net-next 08/10] dpll: zl3073x: update locking comments
Content-Language: en-US
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Min Li <min.li@microchip.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
 Grzegorz Nitka <grzegorz.nitka@intel.com>,
 Karol Kolacinski <karol.kolacinski@intel.com>,
 Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>
References: <20261106121005.1327603-1-ivecera@redhat.com>
 <20261106121005.1327603-9-ivecera@redhat.com>
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20261106121005.1327603-9-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/6/26 1:10 PM, Ivan Vecera wrote:
> Callbacks are serialized by the DPLL core domain lock instead of dpll_lock.
> All channels of a chip belong to one domain, so what the comments rely on
> still holds.
> 
> Signed-off-by: Ivan Vecera <ivecera@redhat.com>
> ---
>   drivers/dpll/zl3073x/dpll.c | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/dpll/zl3073x/dpll.c b/drivers/dpll/zl3073x/dpll.c
> index 1cdadb8e46fb2d..6e5e2bb41f55d6 100644
> --- a/drivers/dpll/zl3073x/dpll.c
> +++ b/drivers/dpll/zl3073x/dpll.c
> @@ -349,9 +349,10 @@ zl3073x_dpll_input_pin_ref_sync_set(const struct dpll_pin *dpll_pin,
>   	if (rc)
>   		goto unlock;
>   
> -	/* All code paths accessing per-channel reference priorities are
> -	 * serialized by the subsystem dpll_lock, so it is safe to release
> -	 * our lock here before iterating over the other channels.
> +	/* All callbacks accessing per-channel reference priorities are
> +	 * serialized by the DPLL core domain lock shared by all channels of
> +	 * the chip, so it is safe to release our lock here before iterating
> +	 * over the other channels.
>   	 */
>   	mutex_unlock(&zldpll->lock);
>   
> @@ -2401,7 +2402,7 @@ zl3073x_dpll_changes_check(struct zl3073x_dpll *zldpll)
>   	mutex_unlock(&zldpll->lock);
>   
>   	/* Send notifications outside the lock to avoid ABBA deadlock
> -	 * with dpll_lock taken by notification functions.
> +	 * with the DPLL core domain lock taken by notification functions.
>   	 */
>   	if (dev_changed)
>   		dpll_device_change_ntf(zldpll->dpll_dev);
Reviewed-by: Petr Oros <poros@redhat.com>

