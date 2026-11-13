Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559025;
	b=2aPTYG/WgBfR9gVhN8iVyYW4VmkMy/av1eHVKMIRdTeBFwAyDvRac2BhFEizM3H+HqVN
	 gul+SySQk+6i22nJXD760g9nmwfqZ8nb5JCOMeHrBcg0dnptTl6XjXZmIfvUKMaiQDwGf
	 vO0bH2jX5erWB5Po34Wz/W2ESfHf/jd7o/KABJ79O0ZFXPNDjWP3H7hQ2zimMiERswKOt
	 4ODtZoKDrO8T2/D054B32vDg4JLJbeCwZufJRSWCg2rOboEHdj78DyoNSS/at9O8wo9zx
	 pW2kpS3iBZJ4Tz1M2C/m9cSvGNUeFvwDnMUISUA0VUosljNmVIP2unv3chHoAUiYLag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559025;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=TOlR5TLM959EjV+Tl1kFJWd+Kt4GG1AJI6ZYw3eVYKM=;
	b=yj7D9eUd/OFuuYLBL9dSocx6scyXEm0S+/gEBkvy28CiNoQOtP6EMcI1SrmKj/kjtm/f
	 DSjwlt2ie5sN+vVFNFejN2Qhf9R0IFyoqnZ8du0BH0oMTZReq0g05De6ACWwrFWSnpOLV
	 X4NAjkTtEgKr7PuNDLVc9sLIDSeL7n92ZDd3LFbuiXRs2fV979s1xCKRNJ8yab7cFFJiY
	 gV5FAawdWHeBJc/MmGyWw65RAx0efq07dZ+8tQn1u/PrEizQAyL6ZvrCT0P+DcYkrK00J
	 QQGpNWjJgBSrjdqyMOp2tydaZOY6oYLpqewWlX3x2tPpzMOFrsrnFv+Q4j52c+5HNvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vn9MROCv;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36DD606A8BD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B36DD606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vn9MROCv
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4b61fd3dso734306e87.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559022; x=1795163822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOlR5TLM959EjV+Tl1kFJWd+Kt4GG1AJI6ZYw3eVYKM=;
        b=vn9MROCvuEiH+7iw29UiR47jK9n08u9V9/N6OsGS8apFoILOW8SavY5S0ROJCq56s+
         Y1fxtDVPR954ZwhMYkjHeqxYl6g15XGdHYRvidhx5zOYfHWfChfJ0p/7YBCwiKyCgVjN
         WdE6tgme7pnMEfr39/LMCoxg7z++liRKwiW8jWO67wo8YwLbme0gdXzyClI9++hOGUjd
         GVCTnEqerhjIHgbGvZzsMVKDtYacVJ3nuQE0voYdgDhPHjJeLgO3Oajey7BVh7Kzr5TX
         UwOOS86URPDNVPwYv9qS61iBzA/dFOxZiC4JeHr1nCoPbHmODKVq1tP/yAhsQZ9V78YR
         +kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559022; x=1795163822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TOlR5TLM959EjV+Tl1kFJWd+Kt4GG1AJI6ZYw3eVYKM=;
        b=TccuntHRlocZNyK7b3wCmvttFqXa1rtCDhoDLnHr3dXVNa+ywpeZlxT7KAGPhxUGn9
         6bbFyZyadtZs0rmV9WSImU5hTS+X5r8ilCPsTzECTqfT9Saztp0ryAG0IJuOO0ZBGll7
         DVKiMVDCJ3vMVKzL4gsl9yJEnW7kzvTw6rbKWgxkFHMZ3jTuAE/aUKspIguJJxUpf6TV
         fsDRuxRlw6lRHFTuXB+xqqEXPErWf39vHzsQnIovpxdp67waHsTt4MzoesXLB9hhkU3L
         fYlcMfaGjP8N2KBOvlufe3F36Sl7DUi0NCndC722TJ4/1Ud3Dy9hexBmUF4fKJASyrqW
         Iicg==
X-Forwarded-Encrypted: i=1; AL+hErFzs7G7ujtcvzzNeuzy4zlsSNu5w4ESy4tP1yq2QAN0GLMg/fseUFtE9PieJge8tqb8IU75TU23/9QJgeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P7or5H/B7RgQBb48D1Ih/wKcr0TSbZTxbDFXddobIOpubXZRp
	ccUVrznjqnswJlzYBoX6Yl6zMO24zgbcftO2o5aIy/lOj7QCtvDn+XU5
X-Gm-Gg: AYBFou2m3OdqO0bcDdq8//71RfelF3I+/JpbfNK/KI2jwcwTLM6MYkYTu7ousw2Lv1v
	J5Y/JVVhsugLcFWnesKrCovYVVmAx24lLozvDKPk+0rM4I8c/pYs4sBYwKbkZfK5fvQoSPJYedo
	FJzvi783lAUOVE0jrSzNz/97b5HDyJPSI/F25vDIUUBZmmGxlI5IAGqIT5NbNcUIrItRdHIqDlm
	YZfTycvMIORWSzBdggrrLsbqEpBdsFxSPimVRxubx45VbWM+q5OA0hnWhUz0/HVJS7w1HDPmkqA
	5e/Hj7qXOFchHqPJ5lNqV+N6gdUGZaUZjluytmeBTxgl4QFeLimjpndS0ymzWtQ588gzfgMaNKn
	krswfo1k2ZK8XC+jq3xtt7gUoxlqm5zaxO6EfA8DOE7QOHZLdvL3zqd8PSZDEl8z7IKTWvpMd2L
	10dzAF1fpGRctf5S8t/5k1No+NuzIaF0jIP1Y9oIbLfxUQ3WiFcwSLTACk37bqEoGZJUFlhnoWH
	6H5vIqwSEiJQowad5GJkmg6P6N+7Q4L0h8vRyJbBcA5vt2h5ii9EULhgWM7bCcDhBsB1V80/vqP
	S5xAoHnRrKx1APnqoZ9J1HAoNbCuiLortAcQkgg1oN4zuH8CSEe0mim9ZFS5d+wEqbRbxNV3e77
	kA8kvpgBRiQ==
X-Received: by 2002:a05:6512:250d:b0:5c1:4e6b:6491 with SMTP id 2adb3069b0e04-5c17099fe45mr922206e87.59.1794559022260;
        Fri, 13 Nov 2026 00:37:02 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133e1bdsm526954e87.43.2026.11.13.00.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 00:37:01 -0800 (PST)
Message-ID: <d12ee272-8dc3-46f2-997a-5de019ed6baa@gmail.com>
Date: Fri, 13 Nov 2026 10:37:00 +0200
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
Subject: Re: [PATCH 2/2] iio: gts-helper: fix duplicate NOTE section in struct
 iio_itime_sel_mul
To: =?UTF-8?Q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
 <20261112-iio-kernel-doc-v1-2-e382fc9a47c2@gmail.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20261112-iio-kernel-doc-v1-2-e382fc9a47c2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 13/11/2026 07:25, Oscar Alejandro Sánchez Lucero wrote:
> Replace the repeated 'NOTE:' prefixes in struct iio_itime_sel_mul
> kernel-doc comments with plain sentences to avoid the duplicate section
> name warning.
> 
> Verified with ./scripts/kernel-doc, checkpatch.pl --strict, and a W=1
> build of drivers/iio/industrialio-gts-helper.o.
> 
> Signed-off-by: Oscar Alejandro Sánchez Lucero <aleszlucero@gmail.com>
> ---
>   include/linux/iio/iio-gts-helper.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/iio/iio-gts-helper.h b/include/linux/iio/iio-gts-helper.h
> index 0c4b2e9fbe1e..3f07a46ddff2 100644
> --- a/include/linux/iio/iio-gts-helper.h
> +++ b/include/linux/iio/iio-gts-helper.h
> @@ -47,9 +47,9 @@ struct iio_gain_sel_pair {
>    * @time_us:	Integration time in microseconds. Time values must be positive,
>    *		negative values are reserved for error handling.
>    * @sel:	Selector (usually register value) used to indicate this time
> - *		NOTE: Only selectors >= 0 supported.
> + *		Note that only selectors >= 0 are supported.
>    * @mul:	Multiplication to the values caused by this time.
> - *		NOTE: Only multipliers > 0 supported.
> + *		Note that only multipliers > 0 are supported.
>    */
>   struct iio_itime_sel_mul {
>   	int time_us;
> 

I am unsure the "Note that..." serves any real value. Might as well be 
short and concise:
"NOTE: Only multipliers > 0 supported." => "Only multipliers > 0 supported."

Well, "Note that only multipliers > 0 are supported." isn't much longer 
so it works well enough for me unless you respin this for some other reason.

Thanks for the fix!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
