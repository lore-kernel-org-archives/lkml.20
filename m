Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F16937C931
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792626; cv=none; b=m0eJjdnyZxLiTWjL3XU5ttMuQ2QFLd8ugV7zeZ9tvC5gC25OYLI8VME7q2u9isoUK54xeh7A95mehrtinN8cDq3rPWjVFHGZzbG2tskp1FXHnW37s6sucNI4vWG/fAwVpZ4rGF2x6xZ2TOVlj5vK0QsEqX2c7/gBYGqJqZ50uCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792626; c=relaxed/simple;
	bh=NyENwqYiXjV7+pyzMIE+mVeG1/8VVB7bn3DU67F8TGE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jMOJb6ajXHWGrhgbIaPlyl891hEMZuHa7fLymgCwXbe5gSf+GCCcJYfsBR4XmAsJI2HtExvo1Fl77+/UC4s45tc6ReysO60Zwc2Hp5h72YBZ/OxI9to7Rnh51VmBILDgpe7thj/6mhxJfTXSWZikj4LrLYSb+pGJysSy+0YbjM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1AGL/59; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1AGL/59"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e067e908so3013610f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792611; x=1789397411; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxN3NGbWp4Z4cW1QqlGymMDSYp6HB/CZBR9XQu9IyDM=;
        b=r1AGL/59pSAuWS/4zlG7UcNDCsCMkKPx0T0xi2+YdzGg2lIYRcZ60tHnExibHGtKcR
         AVozaHXV9zBiBveBh3EVUDkDdYCHe+AwpvfzuBafBxcd/2vJzUrGU/WgghNH+lstcsaf
         trjqUEoOaP7susV9apOydvid9DRg1H+sMtHmcvKIaESDXOb6Uqwew/5wh39pAWts/4N6
         OD6fd9vO15474KkzQsX37QUkQei/TZ7dDBmhRyVNVX9FOy3BBfW8X6mbSAarhlaqrOfl
         4bYRZdZcM3fryEG/6UfL+p46Rv7y9ZZ4WaW/jwAdft5JqI/m774mSA9Gj/pcbAqxbC2k
         BN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792611; x=1789397411;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxN3NGbWp4Z4cW1QqlGymMDSYp6HB/CZBR9XQu9IyDM=;
        b=UE25vevr1pGqACC0kyWItHNMM4ZCGBs1G8pvMifbih3b1AZ8r4Sj/deSkYBoLaSy9u
         GHMva4er4s/Gd7OoeieT9Eeve3cU5h7u640sXxbnFsRFxB4bwVo5q/MHyMGgyX/Zs4sj
         DcPnoAjw9iVRSSFl6I5nc8js1bykGyPlgiv6jDzQn7GOKTo11R4we29r2mywK+ZchqzC
         Cn//5mAvymdaAXfgn5IjkpO9te8R65Fsk88KesLtHYflwFlKoNwI+pQrBNZrh4gsQPRP
         DuiY5CEQLWyMqvTCKtzW4gFfQzZ3v4rUmsKx+k9q6ELCXaCptMM5WefPlKsLux0hf7rT
         f/sA==
X-Forwarded-Encrypted: i=1; AKwUvBwhxrc9crTGw5Agj+d139Dcf70ZQ9qZNqS6e6xQD4r5jk+q9m4GE+l9qiTwpZir3+4oaAdnkpG6VGuaZWo=@vger.kernel.org
X-Gm-Message-State: AFuF++kA6zivNi7DjZ+T839eZQjbPPVNYu4h8m9cWM1OS0vUEQiydj/d
	8qP0ent0bGy0545PzxTZKljHytnesp37OMUnhiY0m+FPFCYkX9R5eiqD
X-Gm-Gg: AYBFou1xZFzy/pHGAiw9LIpoExu9KUy6TfLEP0GWpt4H7/zw0YtR+/YKQPDlWl1CBPi
	AMLdjt2cdTtMA+CT4gg6r+3drZZVVqCWvagO3d/PbetuKUyK0/JF+MJVWImmzWti2z0KskMOT2+
	oK+7/yRojyEl0gDD6sorGPNdAnJ9mpFLNh6Cd4uRE8J2sC0tvGmDaFX+h+UCUSlcwTgbJmDRoOg
	0Okp7b+amA/G4ZJv1vLo9T1XsWeoY/AhAtwWwssOV6AHmIimQYeQ+GLo0WHo2HKfrAPwp/aXgK3
	bAn3Oc/2bJxG09jhOrDHoNVsay4pqAJUiqjD3pBTJjdNuI5D8QsRQcbXC7I01p0GqyzkuLrIXYI
	oDpgMMG+93+kjo9tt4OoWYe+qZis+WsWliHUfWRuDQpzWn01HKDPYQ3ZVqMawON9smYKoZbiOIv
	jU4S+aGKUpdjYCoM2nzHHWJQ0fHx3pLIqFxUJkn6YVj5mnCx+8DKDGwP7aGGaeEWxatP2+/b8vV
	/wTPLD+TI42kQlmk0BRZyTQPTKZW3Iutf1g2dUofU+kEer412ciYQfwBSHjaaoIrDWjp+doXdbV
	QvaV3myKMiipsb4oeulAgGFUfEFiuCiFIz0vhaHydQp514HvOVoufvsn0I8cJmPs7H6uSx99PXC
	QHv+pJwdu2szRJ1BJekXU7irZSt8eo69QZdtilPy4zZj4+8NJvbuPFDYIfzGyXvNESMeI3DY=
X-Received: by 2002:a05:6000:1acf:b0:485:8a46:7062 with SMTP id ffacd0b85a97d-4858a467220mr21639400f8f.52.1788792610782;
        Mon, 07 Sep 2026 07:50:10 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885b7bfasm29695161f8f.29.2026.09.07.07.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:50:10 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:50:09 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: temperature: tsys02d: Fix state desynchronization
 on resolution write error
Message-ID: <20260907165009.0000035c@gmail.com>
In-Reply-To: <20260907085353.54477-1-salah.triki@gmail.com>
References: <20260907085353.54477-1-salah.triki@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  7 Sep 2026 09:53:53 +0100
Salah Triki <salah.triki@gmail.com> wrote:

> In tsys02d_write_raw(), dev_data->res_index is updated before checking
> the return value of ms_sensors_write_resolution(). If the hardware I2C
> write operation fails, dev_data->res_index remains updated with the
> new index despite the physical sensor remaining in its previous state.
> 
> This leads to a state desynchronization where subsequent reads via
> tsys02d_read_raw() return an incorrect sampling frequency.
> 
> Fix this by performing the I2C write first and updating dev_data->res_index
> only if ms_sensors_write_resolution() succeeds.
> 
> Fixes: 53bf4d067d51 ("Add tsys02d meas-spec driver support")
> Signed-off-by: Salah Triki <salah.triki@gmail.com>

Was this found using an LLM or manually?

> ---
>  drivers/iio/temperature/tsys02d.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/temperature/tsys02d.c b/drivers/iio/temperature/tsys02d.c
> index 3ef72347456e..f50426beacdd 100644
> --- a/drivers/iio/temperature/tsys02d.c
> +++ b/drivers/iio/temperature/tsys02d.c
> @@ -73,8 +73,9 @@ static int tsys02d_write_raw(struct iio_dev *indio_dev,
>  		if (i < 0)
>  			return -EINVAL;
>  		mutex_lock(&dev_data->lock);
> -		dev_data->res_index = i;

+ blank line

>  		ret = ms_sensors_write_resolution(dev_data, i);
> +		if (!ret)
> +			dev_data->res_index = i;

+ blank line

>  		mutex_unlock(&dev_data->lock);
>  
>  		return ret;

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
