Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15098331EDD
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 16:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788021403; cv=none; b=KAqYVLhZaAL/tdvsvWWvV75DBIQ3uKl7fCd4WrcX+KtY41dC7Ye4h6kXPjTCoT8RhsnSF4Z3aPS1r7onFdC9GBxqZeTuLvYMc7nlmCuqtnslGhaYAZPDhDGu36QKgSehIlhygy7nHG/kr3KUGNu/nr0UNg3eaMHSqSHE7KFzdvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788021403; c=relaxed/simple;
	bh=GQDdbYBhfTWwI4lw+f/HHlZvilbjL/C3vJRwmTyJO1A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JPB64+5Ms/eh57pOYSjcBkHR9fa6gqoX3kMcyflCfrh62WnWxW2RWjj+n088xiioD+xuY005R6eDottow06nsscSte84fa23oAUi6pWlNDl9ANTtw+bo9+48QBQ7M/cCRL62YszCKwJ7UnjztndGJoNg6WIoG8xlc6lWYC1Zcag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZVclHmzQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZVclHmzQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1340498f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788021400; x=1788626200; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4OSi7MMm07peXNc9aOu04WCVC9TQOGqHoXbsa8tJFTQ=;
        b=ZVclHmzQRzUyolY59bubDpUdVKrA61Dyk2BQizqDigloXP/pMchdqU4EjDX6YaRM3q
         sGO3unDNlbVYyEU/84ELgJ5OSfSkgrp3BWagHj7aGifUwECQzDF/bGRrQrz4OcLB24/m
         nZLfijxaQQe8I3KygkzwGX08mF20LeBVVbUUJac4ZwngwPyLVwW8ypYvc/AKBtp019IY
         OHDKn8vwEIgK/piOv2LkjSmA2xgI4suOVMHqs4FVPQkwaCYQpqQmpIumNGNvawQIYabB
         9qD7mdWXpDh2khU4cVHeEhxhv0J+JLSJSkolvDB7Va4u0jk96oKdVs6b1vZ97fyCWhfd
         GyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788021400; x=1788626200;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4OSi7MMm07peXNc9aOu04WCVC9TQOGqHoXbsa8tJFTQ=;
        b=GDVpWNW69IkjMc3ppDx3W5UMUaniGwqUUhPSN90lipATF11kdENRpe2j70Iz7bP/tO
         TvyRofyUzTF4rbwdQ8pCdVJNfJg80XE3Uy794NEWU6IxeSoYr/BcM0zwaDJiD+EU2oQV
         U8aqfAq+5XoiJe0tiEmzzAMGb2Nb/PqAnRLVBTdgTXq1KpYblZ2+GC+in/6MHmb6FvEi
         71SNzVj+nvjOrBY2/UVmm0WYFyGo4MWHhekuEx5h8aVAraW2MFIiwQneg/F7QFOGquHa
         Ph0Z3S6DA7ycf4C9jB5Ll1B1CU73oP5AAFek8uh4k+8pNcul636dU5l222qEw0LVnNzB
         ntbQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQkhj3EsdmNyVC83s4QevvQPquPe8sZaqVkWn8Qt3uqBBrm5SF5jXFgSNIKuWZZJlSZvk2vvQTmsEGpVA=@vger.kernel.org
X-Gm-Message-State: AFuF++ljdfvjRSvruonPaeO3eVxUDg3FNbIsxSBZYcxGiIQt/dT5kUPn
	h9FLIZqekXUiGbo64ZOJ4jnKOa5PnMUOM7K/VfRMonNdXJlT9e9+hsI706ku2l8L
X-Gm-Gg: AR+sD13Y3x7nxh8TvPcwKkfQVBd/X6O+dSNuEmtTVeTWzSj1mgQ4JT5rS+sxAW5rrXm
	E5ItzAoGvfowG9/GfMLfDLVFAT5jJZI1MxstAjuFLjNi6GlLfltfYJMTRzv8F1DyWDMNbHoBSTQ
	bRq8BY4eE89NwyH7rBGXTgV5ZCCjtLUBY0xuow+6ktiVnITHY7CAN4Cs0twmIUnixDUtQdOZxKY
	n2DVGQmRxnvXMtwP1UEUi2+77bXj7mS1AeKOk5AQomO/rRRy7QqQdmdc27kllZZPJzvtcwsaNkC
	TM6qFrCGZTUduNfemsxnoQk09eGlbDUpz9pDEv6uV4GiMCXK0dy6nr0tLKJCVnWiJijDhlYdVdJ
	68/a8o2KtXUOyPQADPAnb8hGtlTu1LmsmgeXFdnE+yj6VDovMNv5Ds7/4liXAo9qJX5CmfrGgHw
	gpurjBUpifQAKnC/K9ZfD09lm26vPZa/9iN+t8ViHpNY7AdWspGI8gUZnz/HpCbAiSSu9+dGJ1m
	YUmOvT2vPXh1GMrUw8G984BqbzJqDkrd+0/LnuI05u8H0WDKx1kc+nV8wN0Q1ea+pJTdNK+SdPs
	q5PBr9vlmwiqKEH8VSCarImp3DhUy4GkHxgufxCLVcqA0WCUAVcjEZXdOePwrBFZqeS7HKMA+wK
	IXHcHqQQl1yZnij++yQH+eYDe1l0iDgk=
X-Received: by 2002:a05:600c:1d08:b0:499:bf0e:95c8 with SMTP id 5b1f17b1804b1-49b91c2e145mr237756535e9.1.1788021400014;
        Sat, 29 Aug 2026 09:36:40 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm11662342f8f.34.2026.08.29.09.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 09:36:39 -0700 (PDT)
Date: Sat, 29 Aug 2026 18:36:38 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, Puranjay Mohan
 <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/11] iio: temperature: tsys02d: make headers
 conform to IWYU
Message-ID: <20260829183638.607526bd@systembl0wer>
In-Reply-To: <20260829-kernel-header-removal-v2-11-c67739d5dedf@gmail.com>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
	<20260829-kernel-header-removal-v2-11-c67739d5dedf@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Aug 2026 18:26:08 +0200
Joshua Crofts <joshua.crofts1@gmail.com> wrote:

> Remove the catch-all kernel.h header, add missing headers and remove
> unused headers.
> 
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> ---
> Header changes explained:
> Added:
> - <linux/array_size.h>: for ARRAY_SIZE()
> - <linux/bits.h>: for GENMASK() and BIT() macros
> - <linux/i2c.h>: for i2c_client and i2c_device_id
> - <linux/mutex.h>: for struct mutex and mutex_lock/unlock
> - <linux/sysfs.h>: for sysfs API
> - <linux/types.h>: for fixed-width integer types (u8, u16, etc.)
> Removed:
> - <linux/init.h>: not directly used in this driver
> - <linux/kernel.h>: catch-all header no longer needed
> ---
>  drivers/iio/temperature/ltc2983.c | 1 -
>  drivers/iio/temperature/tsys02d.c | 8 ++++++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/ltc2983.c
> index b8deb9aa9d48..6c4de6854683 100644
> --- a/drivers/iio/temperature/ltc2983.c
> +++ b/drivers/iio/temperature/ltc2983.c
> @@ -11,7 +11,6 @@
>  #include <linux/bitops.h>
>  #include <linux/completion.h>
>  #include <linux/container_of.h>
> -#include <linux/dev_printk.h>

Ugh, how did this stray change get in here? Must've been
a bad fixup...

-- 
Kind regards,
Joshua Crofts
