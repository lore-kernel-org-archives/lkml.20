Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD68C48A2BF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586311; cv=none; b=rs5VvQu31fz86ASuMEb/FsCcnHoHw3PBnuuBAqwGe79R+bLwtNfy9jiYZUNcUHILiVn16xgTmapA9uMCFCxBzlRaKvBiWZvHUz+SgtF2KjejUHjs9DSyPN8s+FWfYOSnv7VEy/tWAyPyT7dPNW6Y6GAizoPCo6oK5wdyrjHEnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586311; c=relaxed/simple;
	bh=Dodyo73tHzWX6mITu1AXopUHn/pAmQk68ifxgr5KOns=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b72+k3zUvZGwsy35bkF/TYnzvBwWNVZ2B1YcPTByuny0q/F/sJmFBQWFEtJ/YTMQMPjgLQlc/AEKoNhDBn0+SBUGZMtSQEC286+TM9lxePgKRHx74ipkVQlB484/ZqiD/YDJqYN5+XuT2gL0fDXUxRT4sFK15+Vjeng8GgSvw9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nIHmSbtn; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nIHmSbtn"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso7504685e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790586308; x=1791191108; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lOLH8R3k3uRQ7vYYCf3t/tbfkb4DGWyK1/C7dSgp7AQ=;
        b=nIHmSbtnhxniwr6W+zhGYiyXiNweG9LpGM2fAb84diJ8frf/46wwtsnf+njZfkujMS
         zEf7EFmFkWp509IHqMvUAxziMyHl0dL/pw+Zbk1d+ZrXpjqwiomTYHXS/Ow5dlhqVZt9
         JvPzzri/7+ouyBOAHw401L0sUlNiP1fhaVRKR2DGKx9i6mcDXYTmvwg5CL3XEK1ILnMs
         upsKF2QL9spDOnF0FBNcHVdrPbqq6qbMCFJbl9koI65+inwDOxNXKFojGJkeixeFkXfh
         PxYQzdBmiIBmyvpKiI6szl7DuRn8vu2lViNYkE6GUPV9OZnWxIBeSwO2VBmUrJA+3Hc4
         Cojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790586308; x=1791191108;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lOLH8R3k3uRQ7vYYCf3t/tbfkb4DGWyK1/C7dSgp7AQ=;
        b=f9OMclbMHciUWRXH4V3HAzuzcehEp+kXGxg2rXUVEoBAgIyUW5HnOt3Qw1rn2qqo40
         RsDZiu1eHnx6npC7XyZ63DbnYNebEqF8YxMKwWJzPguv9U728xxgbeZr7yn5VGMqOfOU
         +TUKwqGCayFZ2HfUIBANK1boWCeNCWAwSxtfO7VxGdd2bCQkxKSCcYCmNVHyGpZcj0ur
         K0T9nMDTM2OOdQupbkkRX8szThnUlZfCInnTTIALUgZfLQ7Vyj/ll0Tr+DOzPJp9ai2U
         L8bWqAUZ/7QkEfSqKTNn7n329zzbWFWzRYfmuxRBI5TgPTt2qgBZH/SyaPQ6XvNIreEs
         zUnw==
X-Forwarded-Encrypted: i=1; AKwUvBwvrRilEOvlmejVcpvGdrHg0jQyMjkDJ1cKCYWbhacpoCL6nE/ANbThFQVKqowve8yEGtZ1VZJrEkMpHGw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/2vNuOZUwJtT+QWrDs3VbdFvTXDUMO/2YDQ6kQGI5iVzJlrEn
	f+R7q0HwyMFrn2xGSq1VBqNBJUKNxuRKkYED1IFHlpUxd0Hk64dxzE82
X-Gm-Gg: AYBFou35jX5O9wFqrmveiUpyBR/i7CTEMZTnRJHk+zZ8Bq6DuASTBIsJtIaDtod0EQL
	myk3AQNpCEag1d2J/TlHGxDKATEPaeapL/3qGSOyAtNa7py55D8MZqu0H5MhAS8XQE80/KThlCF
	5DfGTPb3gvBo+GdWoKJOikNu4I8gyH4jkJ7IdQJ8dc+qwQ1cS0DhH7OlTD+YJFYMUFBOIfWD5MK
	6V8rGK4bLXVHhv+WJBit3E5ikmQ8VwT23e+S8wSf8YUwvRLZ/WYeAwS5Wr1RQAeGLveDGaFOyUc
	oavgkMqSU0iLc6HB37myGFIpTKLHylsmQCp5rAn+8+sg3xdavQ65kP1goqFshcsoLjpIsdE0Bfc
	A14RlgNoqMzOKg8mOKg5tw2n/KuNGroSJoH7m6HmI0SUTmUxPCsDd+0Cz+LkcZg5N7QmIisWi97
	rbxEMtLy16HYl769acRsaurJKBoaC/TdIcmlrtyXQfXpOEnldVOSEtKxANCGEzXnmTg+9taPtdU
	/wRcEPdg21MceHaDyZbNW7sHxshcKxbKgk=
X-Received: by 2002:a05:600c:8b82:b0:49f:fefc:7d01 with SMTP id 5b1f17b1804b1-49ffefc7e4dmr89811365e9.15.1790586307457;
        Mon, 28 Sep 2026 02:05:07 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a001906c5esm125927285e9.12.2026.09.28.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 02:05:07 -0700 (PDT)
Date: Mon, 28 Sep 2026 10:05:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: "Ivan A. Melnikov" <iv@altlinux.org>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Francesco Lavra <flavra@baylibre.com>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: tools: Use proper macro to detect _Float16 support
Message-ID: <20260928100506.7ba18d8b@pumpkin>
In-Reply-To: <20260918161305.1161852-1-iv@altlinux.org>
References: <20260918161305.1161852-1-iv@altlinux.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 18 Sep 2026 20:13:02 +0400
"Ivan A. Melnikov" <iv@altlinux.org> wrote:

> __FLT16_MAX__ is an internal compiler macro. GCC defines it if
> _Float16 is supported by the target in general, but the support
> may depend on the exact target options. For example, on i586
> without -msse2 I get the following error from GCC15:
> 
>   iio_generic_buffer.c: In function 'print2byte':
>   iio_generic_buffer.c:141:17: error: invalid conversion from type '_Float16' without option '-msse2'
>     141 |                 printf("%05f ", ((float)converter.f + info->offset) * info->scale);
>         |                 ^~~~~~
> 
> To fix that, use the public macro without double underscores.

Assuming float and _Float16 are both IEEE 754 you can directly convert them.
If I've typed it correctly:
	union {
		uint32_t u;
		float f;
	} converter;
	converter.u = (input & 0x8000) << 16 | (input & 0x7fff) << 13;
	printf(... converter.f * 0x1p112 ...)

That handles denormalised values (near zero) but not infinity and NaN.

David

> 
> Fixes: cdd445d4b2a9 ("iio: tools: Add support for floating-point types in buffer scan elements")
> Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
> ---
>  tools/iio/iio_generic_buffer.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/iio/iio_generic_buffer.c b/tools/iio/iio_generic_buffer.c
> index 000193612aad..9ea93984e0e9 100644
> --- a/tools/iio/iio_generic_buffer.c
> +++ b/tools/iio/iio_generic_buffer.c
> @@ -131,7 +131,7 @@ static void print2byte(uint16_t input, struct iio_channel_info *info)
>  		printf("%05f ", ((float)input + info->offset) * info->scale);
>  		break;
>  	case 'f': {
> -#if defined(__FLT16_MAX__)
> +#if defined(FLT16_MAX)
>  		union {
>  			uint16_t u;
>  			_Float16 f;

