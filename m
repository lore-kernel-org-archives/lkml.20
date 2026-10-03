Received: from mail-oa2-f34.google.com (mail-oa2-f34.google.com [74.125.231.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3A23AE191
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791003551; cv=pass; b=HeK+CiBJ0YSH+LWh3ExSpgowUYqubB87n6s/m2Rs1RJ0ETC8KFzvJF/IiThrRSt1yyCy10ICOdkwa+HFDZJTNmO049m4BNsMlfoqPJVYNIoQE/ynCZRWLqyVNMxS1WGw6J4cg5hJev/dd1FFzuG0WX/tKVbdMlUCdrGzuj6mfzg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791003551; c=relaxed/simple;
	bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z/eeMTh5t7vNTilXFxknowBWWZois4N1Xkgk3JR07ibu8Edg/03rKN9cEr+bgDUc+vskMftoLPsaao7Fv+UZKqGEV7niHAu1YNHAY9F6hYJnMEM8kEKafOJwHsA+0rZXnEeY5/N5e35OmC71YQVj/OgQxlyKq4iXz2PPsSCweWw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HpQCAy0w; arc=pass smtp.client-ip=74.125.231.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HpQCAy0w"
Received: by mail-oa2-f34.google.com with SMTP id 586e51a60fabf-49dd095da1aso134709fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:59:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791003547; cv=none;
        d=google.com; s=arc-20260327;
        b=UK9wzCQ38hm3l/wcS4R7/Zor35ciB3ZmLZjnLZflfTWxgOxfzZKTm4eqy1nO45VXKA
         oldpNR6yQWo/tt8ut4/7ccN7dKRbNB9awMCZ2HXD0KYA2FaZyws9a/PuaxejQdLYeW3G
         rTohdJEnKisYpP73L9bZm8i3UZdgdEK7ukmj6Fxe4A88NGKvGv0vPkmdDsHYAevvTwjm
         ekSoLdA3RGgYW8A12idm54MkjH9fqN4jEWbfQ+0ourYlKd6K6iRESE+Wjxcq6UCUtSz4
         wXdit9BSFjH7LmAozJhcSAvOu3+Drq4gvHrmBFFU5XMKcGk2SgEAAb2QvqNkP7nhRefe
         7JUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
        fh=ALVfcPXzwSbVh+jBcNGMbUC6tqZQ4OMqms7sp4ja40g=;
        b=bucEuTfiObxBr21I9SVqw3Snmhimbqr3KMcIdyqJt3Jkpi44z9ZcHzmgS7/siglRWC
         SrxxUh5gqVGvurwJ22+a614N18IOF6kA2/1qaMZXfC7u2Yl7wMjYV3yMH/DmW1HyX4Px
         iZgfDajLCvrfEr2q1UyXr0PRrawnDcFTBhIZepeWric4XNiyP2ahH41bqBfi0L8sback
         xnyLV6aaQbRUr8PjbhrQcKY7aauVniHUIG1YEGXYaJvoZK+rjJE1k/BMZIn0Jb4bjlm2
         ITM9pECogmF8zH61gijp/TSM1L6hNYLvUCkX4o5vljs44lw9JsmqS/Tz35za0H5ayYdc
         +avw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791003547; x=1791608347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
        b=HpQCAy0wFV3TSpsMHi8rX8dXg+3UW9bYzn5YPGd34SVi9JALdhfSvF49e/IST9u7X4
         EUaQ1nbrmU3TIjrNa6EusGjlLuwNDyNZuyaXLDk8UPjsuPrEGS7az0yRpBKtRgOplA1H
         9I8U/CmyGkHRo2yiiEP8LbJRhASPJO0X1ml/o2REG3BfbzYLI9MdXPdC9vrwpm0d/EIw
         k6QeMiPdg0XOQyTlQ9xE3h7yJPvNZ2x6GwsPvhVF64kRpgmq1lvT7uqJYor0M0RzdV/3
         ZigNMrOPOH0bm6RM20uvXH3GEIocSY9wXyS1uoz+ZS8IGXtib9FuzRuVxFhvV9E9OhSi
         vl/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791003547; x=1791608347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLTE2MKfj7oX+J0YHkJb4yQZ7AHwrqVbGOY6k2lcfoY=;
        b=FiHs88dSBQfQ2bP8kSudAnGVM30tImaOfzAGvjBVt6JOVoFzt7pkQbcajTpLeTWw+A
         7gCpvdclmuMA3ASKTKo+PzUNggNXRMDq57oHPQtb35Gri4yBSCiKfsXrg37hoRDyjuui
         nGVk5zdK+zexRlyyNG9HJ/PvIi1GeBNWSnVXnDRyFgTJjxMNIWV+EC+rauyck9mbszzy
         QPrRd/5m/q8g63XPBvNovDv7nK2UHBqPZNoPMWIQoAvsOep62Oe/UV79OZ8gm1kxDghQ
         V2jz2SDz++jI/wXZMck8RA0d8z5H1u8IQkFFsLviBBVkLUoMsgz/O4raE8s6bPNoXNdq
         y/LA==
X-Forwarded-Encrypted: i=1; AKwUvBz8gZ/4/3iGUqd0lZdOYqMbAapX2HPVGxQ8LuvUPNiHLGqSHdDI8gnMpNwyS2kh0ngIG0k91eE7myWE/yg=@vger.kernel.org
X-Gm-Message-State: AFuF++mq8fg+BvgQbFjjLf1cgcTvbsN65Cg17Rj0n0CLKYxqOlQr+0in
	F71AVm/DMvjzzTuZbOXDxrPu2B5PtQYPi1Qutx2mBLToeL8HDfVLljBuO0hU2Nayxa9UOV7zL+s
	QPRVd+dRgrv4urqslCE6/GNY6Dk8NzqI=
X-Gm-Gg: AYBFou1fMNvr1G8P9Ar0T3Iap0Jx5cqfXD68BCQ44//FTH+TQ9IncmPH4tXzKR0IueM
	wO8PPNiNibjlCtpk/78BAV0ZlW0aLfjs0UggTsKdcXMiVVLuai8CHYkbYz6tm6tIIepsRbB5Mzt
	L0q51wLGuv0dp+BpgsIcmphRrXE40Dvu4fJbAjigoashVYKj82pSqtLTGHCK3TYYMJlZQj9k86C
	BTgcZQT0OvJ0uAVUNWLK5rhccgrCDrD7GaxvDeF62ogSrEfOydIzsVJUhLIV75eu8AUQxVJETEB
	lRSGz0hTU9cX/3D2FxcBaRyRVBqSa0s6rq7k0r5d2mbiEi3xM70qFEX2
X-Received: by 2002:a05:6870:6392:b0:49d:ff8c:205e with SMTP id
 586e51a60fabf-49e15e0f1b4mr4145457fac.29.1791003547211; Fri, 02 Oct 2026
 21:59:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20261002153302.5c64819d@jic23-hlaptop> <CALoEA-z6Q3YyYZfLyRixk9dPy8mn+mmVJVUrjoCZb6T7FXcDSA@mail.gmail.com>
In-Reply-To: <CALoEA-z6Q3YyYZfLyRixk9dPy8mn+mmVJVUrjoCZb6T7FXcDSA@mail.gmail.com>
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Date: Sat, 3 Oct 2026 07:58:55 +0300
X-Gm-Features: AclHuK-DJYCkVcKcz3EQyuz62gVz_--FKN6noxc3KcgVxv052URH_j7bypIZRJk
Message-ID: <CANpqX3Z5_RHPHFCCovZ1jXiQcYgkB5uJVzAKX02udzt2+KDcyw@mail.gmail.com>
Subject: Re: [PATCH 0/3] staging: iio: accel: adis16203: fix axis mapping and cleanups
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, error27@gmail.com, narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I apologize to you all. I am the one primarily at fault and fully
responsible for this mistake.

Jonathan, thank you for letting me know=E2=80=94I will make sure to always
check linux-next moving forward.

However, the important thing for me is that I still learned a lot from
Joshua's and Andy's reviews on this patch.

Thank you both so much for your time and valuable feedback, even if it
was on a driver that no longer exists!

Best regards,
Abdelnasser
