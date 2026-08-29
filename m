Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 442F5342539
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788027006; cv=none; b=C1u3evzv785npZKtJBv26cGZqzF5hNccZVSc4UA703Wm6+gVuAVIcuLFq4xTmyuqBMwQpWZrW+TZwwiWjPHi41gD/fyQe0n8+1EuOUivrpqDVVWbVYl+jCTSnkKVxAr8PeKvAqcICv6m4SZKIRQxOLVd/g6SGtZUKLcJTx+Iu/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788027006; c=relaxed/simple;
	bh=vVU0OpClUIp4f1XeMs9HBap3ZS/7JuhoLDquig3Yxwo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b/z5Th3skg5bHG4U6hwpyCZlqzE7Lct1w2haDPSbybRysvOTWV/fPokO8pGLM2tDatrDJi97nN9YJJZ1x6WR9bqsKEvU8MR98ptfr3BW8x7rtvGXAtJR3YYNIG+/4T4p+nf6BkGX6chKyiC2WUICZn4OLafenxBcWtLUx0sTZu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xgk6TesK; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xgk6TesK"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so17442205e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788027001; x=1788631801; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2iPoRSblvqH1fQl98XO+rNc9dHksM216Rwuk/S3Z3OA=;
        b=Xgk6TesKfwz0MGd0ZB/kfwgg0y+gXFP6gX13VcMMk+w2+o3sBZmrq0/zq70sw0Nnjf
         vkmBPsllUrG7LL5JqJtqWThYpPOLrOQ23UhvP4cRnLz7tJ6gJzl57L/sDJNrUezMzTRL
         Uuf6BNwbwihV21NffAKEQSyUd/CttAZJ+FPo17vU7eEqOI+zlpt2yBAo0WOUqsHdNw8i
         IKxnyYehgGSoHratszRrz5DfIYqGI9OugipnNayNpvKjPGC7c9VJkmgJ+yNLcfCE4OyR
         ld+SEm2RkcFBylIyy7R90aYLT3psctU0+MR0P6/CvVWmNX+X2OxKnlyCakD9Ba4AZYdH
         jgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788027001; x=1788631801;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2iPoRSblvqH1fQl98XO+rNc9dHksM216Rwuk/S3Z3OA=;
        b=DK0DHR2Q4+6WTlciLH7LuU58E4lwyjftRFKxPBCmVzJuQ9Ego92iVAumlBCLZ3JBu4
         zXvrYxIaNxEguoVS/GDolKarQlhxYAqEfur+SwBRkt4FvF5QkY54IiuY2Po1ZxkVUFdo
         HZ2cgSyxCylqQkI0HZmCy4E+Hypv7ly5eNRWVvWK8kZM4I4WHRv3eKzfdGUL9rOj0ZP6
         zvqb8CXSHpH2UInUuiniE83RPeRQadkdgzJnAzvwe36Sh3ReMCxI4qGM9bifDYps+ENN
         dQqI5lwnYkA1P5mMzHZuwWuhUZP89u+V/2aub48DkUlxDBC6SJhSs7CPskIA5NsMjMa6
         DcaA==
X-Forwarded-Encrypted: i=1; AKwUvBwxz6YOlrnDJXb2vHkQX4bxCFtDqGTtsDtce9Hr8UFbdKHKCq3v7H8E2QwHITDoL/GK2F4i7w5gvWGcKR8=@vger.kernel.org
X-Gm-Message-State: AFuF++mH2dPUPBFIJY2jhRg+AKjX59x4CTqaujXt4KYHLovRPEQfqE1D
	TLfqh/CFPfuMulVeNUfoCXp3Z4cwRG3a5Fm06Kq7Lgp17qc+DeGyIhjNjDVO0i8Z
X-Gm-Gg: AYBFou2HUfKv9qHdmkvKukCNlol9O0i6gDgoqYrEpY486Nq1HYk8tPMiHWTQUs8q7YQ
	OsG25EM+mYaT79cqBrn9upinqQ9SsUxmG6I8sZQxDyBnbql7WmuQqtJX1fW4Q+QpwhqjkMIvdsY
	63S0jy362UsH6Ux8IJFpxE2J4isRtTNZ0T88ZG6D3MheAv5QO6mw7tU+UAIqZnWnIId/+F8KB22
	I5hzY/Pdw098Gj2aW7V+w0MYa7uRPHe1xDvpJ7aUiN9/k/ai+DgorCe9f8xb2Itdg6CpACUI5rE
	r/hDrxgApP3dHNIhsI51Earkx+U8iEC5IUV49q/KTlym6A5VEe2KjWNPzUiADEbEeNGa4JE9xFW
	LOMYsTRfBvHLJDSaK83zOgANq4RyiKpXRPZKqXQpVli80Co0NVDbZ+b4i6LmP1jQiDFM2HhJnui
	SJ03HtXnx/CkmoQLqLTyEf7H7YGlEnKZ0bwObmBDOI2v5jWbmt2FsaAhTJ4oxeW+Bobfdu6EQw/
	7XG7+NcdoNKBVtBpfqdq1E6VAfbxVaQ8fkJhkv7LNDSBCFYZwHPGwQ2nuMN277odlfxJenm1yS9
	Wjfn4iXX8tf98CbBjlfeIgNVnNjYyuKQpXS9Cbx6e79wx5iBjafFyuNFFwHALdrBV1fLsMK/U4H
	ht0h5eT5tbjEtRb5ryEuh
X-Received: by 2002:a05:6000:2510:b0:483:ca4a:6b9d with SMTP id ffacd0b85a97d-483ca4a6d9cmr8743130f8f.20.1788027001191;
        Sat, 29 Aug 2026 11:10:01 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32ce2sm12442751f8f.33.2026.08.29.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 11:10:01 -0700 (PDT)
Date: Sat, 29 Aug 2026 20:09:59 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Crt Mori
 <cmo@melexis.com>, Puranjay Mohan <puranjay@kernel.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/11] iio: temperature: tsys01: make headers conform
 to IWYU
Message-ID: <20260829200959.09e58aac@systembl0wer>
In-Reply-To: <178802625991.2637008.10673317877221890998.b4-review@b4>
References: <20260829-kernel-header-removal-v2-0-c67739d5dedf@gmail.com>
	<20260829-kernel-header-removal-v2-9-c67739d5dedf@gmail.com>
	<178802625991.2637008.10673317877221890998.b4-review@b4>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 29 Aug 2026 18:57:39 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> > Remove the catch-all kernel.h header, add missing headers and remove  
> 
> Seems some fixups in wrong patch as tmp117 stuff in here.
> 
> Sashiko shouted about that.

Yeah, must've been half asleep when I was squashing commits.

> 
> > unused headers.
> > 
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
> >
> > diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/tmp117.c
> > index 25bc98e64e48..96252627613f 100644
> > --- a/drivers/iio/temperature/tmp117.c
> > +++ b/drivers/iio/temperature/tmp117.c
> > @@ -12,13 +12,12 @@
> >  #include <linux/array_size.h>
> >  #include <linux/bitops.h>
> >  #include <linux/delay.h>
> > -#include <linux/dev_printk.h>
> > +#include <linux/device.h>
> >  #include <linux/err.h>
> >  #include <linux/i2c.h>
> >  #include <linux/limits.h>
> >  #include <linux/minmax.h>
> >  #include <linux/module.h>
> > -#include <linux/property.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/types.h>
> >  
> > diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
> > index 14de67ee8be7..3c1f5b6ac156 100644
> > --- a/drivers/iio/temperature/tsys01.c
> > +++ b/drivers/iio/temperature/tsys01.c
> > @@ -8,12 +8,14 @@
> >   *  http://www.meas-spec.com/downloads/TSYS01_Digital_Temperature_Sensor.pdf
> >   */
> >  
> > -#include <linux/device.h>  
> 
>  | sashiko.dev <sashiko@sashiko.dev>:
>  |
>  | [Severity: Low]
>  | Does removing <linux/device.h> contradict the Include What You Use principles
>  | mentioned in the commit message?
>  |
>  | Looking at tsys01_probe(), it directly dereferences struct device and struct
>  | device_driver:
>  |
>  | tsys01_probe() {
>  |     ...
>  |     indio_dev->name = dev->driver->name;
> 
> Looks valid to me.
> 
>  |     ...
>  | }
> 
> Jonathan
> 

Yep, all Sashiko issues addressed in my series locally, but I'll let this
sit for a while before resending.

-- 
Kind regards,
Joshua Crofts
