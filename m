Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3526E3B71A5
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 15:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788104483; cv=none; b=FSr22AzRkBlggTrQWrRIamWSR2TFrAhjawnaEnPmBcD5nU4bL/NTfrmasuZdeQeiNgOP7VvFTXElclOXbhVYCbQ8kySWXnTEESKBRRG7u41n7yDZv/M9ab/XPUImTyKMyT3YCK68O0it6W32jEk70cGopBlKoDPmOzX6FQIWbT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788104483; c=relaxed/simple;
	bh=PjGV4Jk66b8cMrt+IX6LqNDWzzIRRf0S0sfwVy3VWs8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mBMRn8iYkANTit9kHjlg+21QLGsKBEKAFMSE1klZWtAp7CIutGkMa26WmU0ngbHW1C3szK2HIg8yA0aDK3SOzRHg7UNnU0pGhCp0xey8TetBrCVhjh2lUBvZOW+IeMy38De5GJfkJr20Ypg3xXWEzejMHMNuk2H4iJrM7LrNRYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMQFhgnm; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMQFhgnm"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482dbe4d247so706246f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 08:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788104480; x=1788709280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VP78R9nLvzYZIJLFwPGinwgsl4vkolB7rEthwCZKiSk=;
        b=eMQFhgnmpvdEzuQwHhkNGoEEoVcQ6mt8EO6DMgJ/OjzQJY7XVmQh8xo5E6LvOpFxhV
         ygSxn0Q/up17ndX7bm7Tm2Fub2jhujFU7dHPd3OMlMcpETjl9jbK3zViWomwNsTplFYk
         wzpK2UT/ygoE0ozVGOyCCeRcqCleRg1loTtcC0G0wV625V3qimux8207A7IFb2YkQXp7
         9b7S7zW6q65UpPiKOyjwm3AbAkis+k3ZjDpYS7Ks+PanV0blIwZpUenFIiD2+9nO/cSW
         2dQP74q0OzHzobnHc5oN5aUKc/9GGCK/3tMY8MNZXYQyzD8KZ6y02rXFgkytLNVVSDFS
         RgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788104480; x=1788709280;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VP78R9nLvzYZIJLFwPGinwgsl4vkolB7rEthwCZKiSk=;
        b=oSgwQakrNylK6/WaNPRbGqjMsuHk35YMzGh8fypEnIKefCCezYSJQunoJGUd8kIZ2x
         5AKWj/L4BzdY4xi/6fYT/NSINfcGjHJA3K4M/XioFHyLHGPof/iqqiE/yusapxMAzS5m
         l2KqV/KPIFKJj5TypQPDqtfDm79j8RBJBBVCh5du7Tz7SZzTzMUU8to19+FMj59wZcIh
         cHsMtmP6XTPLlFPllqzpfSNvnuEQvSrdrC8nv7U3thza2VNSwzNM+qtabZ1reVHPAY4b
         x5Psgrs19Cd7O1gi8jOrAqSjkC32xFUzjvJK9xXVG8d9ZwZFWCItFDmrmInOscciwuuw
         X9gw==
X-Forwarded-Encrypted: i=1; AKwUvBwRisQSrlrUsnq3irOjyqpsKLAEjFlIofV3A5R903BsJhAA0/6+G1CMJVzF6HBuzPxswgobEhd6l5+DbR8=@vger.kernel.org
X-Gm-Message-State: AFuF++norIE2YKnnDlMFtS4fldok0xJwNomZKn0o00KUOak4rbLhjIHo
	xNP73k4Otl8sheLpbsnMdzh3ju/V8GcGFC//cw3VqqHmOAqmj2rc3cQv
X-Gm-Gg: AYBFou3uIZuRZ5RtkolUHZW2bc3Fw5WwOhgIjG/cbe7HN28uPPpEfYJ/+9UaLfZCa8s
	AFWEmLIGCgLGLe+il/w9Z8EZj9iN8A4oYzLSEKbWd6ZgexvQiudh1Bq+bkdShmmctrPYF4h1kX/
	47MnZ9VIWWLHeL0bMKr+cpmM+SgEHvLFJ2mS32M6g0uZvKrXaS1la8XFHsmeCgGMxlotmA8VTor
	A9skFcA10Yjww4VWmdxswk/MqP8EcBXopMwMYWE5Wi796c7J5zDe/0X70mAuYB8iqL6WXWL7Lc6
	bGoznCR2aVsX+J5OghJQW2OTVgimY+yKXpQyxIPyGzeGz34jmFpUG4VVEZatmEa1bIb9t1ytwys
	sBb9zNZ6Rh4sLW+VYZtiCfHgAzY6vCWIxzjSdNM3AJaavmc34dYqZdEwfI5m9m++DrXH+db+1NB
	88RUtdASx5NdQDQvq5rjdWYfwJ1tbve5ULmLremMybKffkPbjwLD0WXmfVSBP/e0Yel2WvSADIE
	/clNiKNJM2VDlWJqxuMAjU+fnQNVJskF1oSNgoekN1wi9qmJjqOnhCO73p+3BxWS5OtlBtWEpSY
	vFGtkVq4r5Yalba2e5nULG7wfwDW1541lecO+9OLsNwgQig4RPdgXzSQPHy84dqNLDLS+9h8kIR
	VF+gy8mZ2vdUMFR0YI/w9yg==
X-Received: by 2002:a05:6000:230a:b0:484:36c1:2881 with SMTP id ffacd0b85a97d-48436c12978mr8886652f8f.2.1788104480124;
        Sun, 30 Aug 2026 08:41:20 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac8e61sm16507294f8f.13.2026.08.30.08.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 08:41:20 -0700 (PDT)
Date: Sun, 30 Aug 2026 17:41:16 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: light: vcnl4000: use sysfs_emit() for near_level
Message-ID: <20260830174116.36fccbdb@systembl0wer>
In-Reply-To: <20260830054237.2147950-1-donggeunyoo.kernel@gmail.com>
References: <20260830054237.2147950-1-donggeunyoo.kernel@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 30 Aug 2026 14:42:36 +0900
Donggeun Yoo <donggeunyoo.kernel@gmail.com> wrote:

> Use sysfs_emit() instead of sprintf() for writing to the sysfs
> output buffer. sysfs_emit() is aware of the buffer's PAGE_SIZE
> limit and is the preferred helper for sysfs callbacks.
> 
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> ---
>  drivers/iio/light/vcnl4000.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/light/vcnl4000.c b/drivers/iio/light/vcnl4000.c
> index 336468d59ea7..dac235dd6220 100644
> --- a/drivers/iio/light/vcnl4000.c
> +++ b/drivers/iio/light/vcnl4000.c
> @@ -1504,7 +1504,7 @@ static ssize_t vcnl4000_read_near_level(struct iio_dev *indio_dev,
>  {
>  	struct vcnl4000_data *data = iio_priv(indio_dev);
>  
> -	return sprintf(buf, "%u\n", data->near_level);
> +	return sysfs_emit(buf, "%u\n", data->near_level);

You should also include <linux/sysfs.h>.

-- 
Kind regards,
Joshua Crofts
