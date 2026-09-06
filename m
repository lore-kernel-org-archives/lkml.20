Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB935C690
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 14:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788703873; cv=none; b=EsPHAIOVXA5l/kYNAchtRJL09vyO8qTYxJAC4XBHpbJyxFY76mzIOWzjdMxLD5oIrMOSIxYcpT1XsZGFLeyUpcyS+b8Xc7jSrjZr6LdZEUqzvwikNFb7Th/08//TMFPPMq8euiRdwPCd8KSRzvNyoTsIF8XlkmdicqLg7ILxPVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788703873; c=relaxed/simple;
	bh=nvcJJRSUOa2J+QR8VtuE7j7k9G8B5Cpno8sTQYkYEPU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mcryPwQHHlNUhhMHshA2Dm63nB8zUzOnHWpiPq1C9Le2ny/Qce9FXprM0WemsoBdVKx8XZ5OVrK3ytT4TT0AjI5MlXcUB+/ktDO8b416E31nDrbjLLMWGxQkRYchfRJAnPXqPcKCmgolfwkhxKj7qzOhXmsq8FydNOPftr+u4vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nl3KQxyd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nl3KQxyd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b965570d7so30922765e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 07:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788703870; x=1789308670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f9p7U9U8tA55nei6POZ9glY9rrUZkZ5+MlV33iQ8GuQ=;
        b=Nl3KQxydN/o6zglOTn5Un9ByvPh+xawTOcP4aiD6OMUny70dfoZsMLQoPMovzAqhoy
         xgQPnI+9xbf33TI2CEj96Pi9JBnmXDoeb7RohGzKP6ptvuVYBJhP1Juydam0JNT75jGq
         BDGZcZ0XJL5Ff9/d/O1lIrZr5moL5xSY8pPuVGUmxQqW+KTi1t1V9rBx35nLi0coBDiA
         Nw8BppYsY7VMWnmfL6KLs3hUV4cyNXvwhSQ7WiQQv6/a77m8dJI3Jx76+gwKMiskN5Mu
         Wm786GFVkVb0vkM0RVn8J9nL4Rqn33xdYOHVMTLil7ZVJAZid5S13F7whsUJeT3gI3yP
         bNEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788703870; x=1789308670;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f9p7U9U8tA55nei6POZ9glY9rrUZkZ5+MlV33iQ8GuQ=;
        b=k5nEjFbbI+4NcbP3giP7l+dMxtqOzQIa6K1U5TA48+uxV9rSwcdWWDsdHlxUhInAmB
         veqnqUXecGpeQhLNbvZ5C9HFIPNmDbBQhYO2Z5QyKAxCoIdDi/TyOvjwcsnuGCySj8un
         zReNdOZeTBxBjhi5sB4NXaxBrYctXzFwZKYTTYkSYZ65eUab0N+thbGcwSvXYSfJGagj
         VAsOkU/CfneBWUi/5zl7sgKWjZ5vAysAE5qRzzT19DlZ1m0rwFGeJt6a0SWxOANVqsJt
         Yz4mu52bcV9MKqEUDuMkk0XwEHl7/CKsneTjyuWMTzNMTsblFo/e6/3Zh3onveycm5mS
         G0SA==
X-Forwarded-Encrypted: i=1; AKwUvBwxTWrLpKwsVsh/h01nd18dth7dW6oM6I7WqxgP815VxNc2JOP90SzX/Wy9jm/y9DQhRXdGQjJgAdZBKhw=@vger.kernel.org
X-Gm-Message-State: AFuF++l41tT4p+oglcsONK02oeZPvaU9ISKHmT8ru6glIQPWk5oY7lpe
	JoRw5Heo/vaoLDwIeYh4JwsiJwp1DSIJOaqtGJ29YvCcpKRflWQoZkpM
X-Gm-Gg: AYBFou3Hobk/Sws2WE1oR4s5//8CI6wW+otZyu9rUp1Go5bAZDJZo0V2lwSDZLPTuFU
	oGCTNStMOac+dFH+IoP8eUg6f2auL4VdDl5RMQC5CjxP56sfRTbMcP21I+AJcvzxX7WBxljZaxe
	2nh/Y5qltMuJ/TwSSnlRTs2JtvEqrvD6IWfknZ/v8H5u2pCNH6mRu0Kn2LiAcozaiXTwotHLCGd
	l47ewxmYtkkPRPy7ZTUDW20tuhdDsltRCkdyLWV2xRvaZW8Kfl4CP/tDgxXoi+ruGC68O+olb5C
	TN2rYjeJArI4jXOXOwEffJt3PWjBMP/pEV+iTWYAoOyCae8QWz72V6x0qHSMtkNMYo2vlK4IHrD
	UQDgGbDjnq6/f3KQEnxaKa2j0it2Ag1pq3iauczBZNj2JDq6jqgJEamxEtpftZDEKcn902sTupQ
	v4dq/Q95yFw+MtiIYFquyUXVMOg75J6OZG6yCy+gOG7lubcQmIQ3GrBZ8jY9r+N2Panep2mpYmH
	hLijBdo68QBfr68HV7AD2TGWyyPM8djD3uuxJghWjYorL0M1AO8ECvmurTEPYLrMLzrYm1w7oWX
	6I6VB28182Hl/+ihmfyu8SmDBG8H/q1WlDWn63pbtRU4jqBRfm5qv7B9o4VhN/6y4nx2nVUSvnk
	ad6ZUfHS3Ul8RUE7aAn/eSe7rVUhh2t5B4px3d9sVASVw9zIkzFVDXzQEo0f/E+TU3M82Hv8tJn
	g+ItA=
X-Received: by 2002:a05:600c:19d1:b0:49c:fc6e:8cbb with SMTP id 5b1f17b1804b1-49cfc6e8e05mr171160915e9.31.1788703869883;
        Sun, 06 Sep 2026 07:11:09 -0700 (PDT)
Received: from systembl0wer (78-80-112-223.customers.tmcz.cz. [78.80.112.223])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5927b68sm330420775e9.1.2026.09.06.07.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:11:09 -0700 (PDT)
Date: Sun, 6 Sep 2026 16:11:05 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org,
 linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] staging: iio: adc: ad7816: Serialize SPI read
 operations
Message-ID: <20260906161105.61ac32b7@systembl0wer>
In-Reply-To: <20260906114049.32912-2-abdelnasserhussein11@gmail.com>
References: <20260906114049.32912-1-abdelnasserhussein11@gmail.com>
	<20260906114049.32912-2-abdelnasserhussein11@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  6 Sep 2026 14:40:48 +0300
Abdelnasser Hussein <abdelnasserhussein11@gmail.com> wrote:

> Add a mutex to serialize SPI read operations and prevent data corruption. Used guard(mutex) and devm_mutex_init() for safer and automatic cleanup.
> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 0e32a2295990..ab80b3a889bb 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -14,6 +14,8 @@
>  #include <linux/list.h>
>  #include <linux/spi/spi.h>
>  #include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/cleanup.h>
>  
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
> @@ -65,7 +67,8 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  {
>  	struct spi_device *spi_dev = chip->spi_dev;
>  	int ret;
> -	__be16 buf;
> +
> +	guard(mutex)(&chip->lock);

Actually, I thought I was going crazy when this compiled, only to realize
you added the mutex in patch 2. Compiling with only this patch applied yields
10+ errors. Each patch must be atomic and cannot break the build, even if the
entire applied series compiles correctly.

Please revisit this.

-- 
Kind regards,
Joshua Crofts
