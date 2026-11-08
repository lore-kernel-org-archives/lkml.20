Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794178732;
	b=TJ7FtZDToIWoCdnZpP71ZVde5Fcqw4DDHuYLiI3BoUVy33OxqJNEeolSbLZNoNkrBtaM
	 AQA4wXJpkmrGOdOOTzWz9gi0sXWQywjwfMqgPI3B1UuZ5wgp48GK3JQSadupVwYt3x/Su
	 qKfZ3vScPaSO3C2H5l6nAeDrHFxFyotb2HdHR1NEvmTXDh/MRVztLZwuWVjUt+XwKuKPQ
	 iwSHXt+lBkxPkI0K8uhYOt5u/se0YF3ULRGx03zLcat1PWxZTeWmf3o7qO5zt6qROSAmh
	 sSiceSPGZJGYz7AtdD5t7BBZaQ0YjtUEIsyOy8XI1rQVI2/SyutxJi7w0R2kBAR5HZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794178732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=DxTzr5aT1f8Lw8XRh0X2JPM4X2Bt5RifhAKn6+Pv/lQ=;
	b=tv9KDYyyF8awvxaYr5k8JhGqzgEgN5liW8GEX4haPa0qnz9rGPFS2pTfW4Ly7JZflAmP
	 EYEdBsO5DQHhz+JwhnfBqKsZib9NriJAoF/tNOv2IDnXb9lTdDHHhEEcE/t6UK27X0bBB
	 NVRnZnryglBKz8dBf6G+iGE73TPdXxvdCjkPFM7Od1SnTzhOs6udIGjLkyaR8Cm+B5aEa
	 olTJWAyGRc7vlJp9CCPclbD3iCshR9VDd1I0lOdX1cy/BzyaSuycZT8W6IOMDSaiK2egc
	 pQP357wjcVk3J0XRbX/2/waKBQyJgjXyp1R8FafQniUPLd9OQcJodzrKSho8jZwAVsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nGGYUsOq;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1119606A320
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1119606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nGGYUsOq
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso1858635e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794178730; x=1794783530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DxTzr5aT1f8Lw8XRh0X2JPM4X2Bt5RifhAKn6+Pv/lQ=;
        b=nGGYUsOqCAi7nyhlUesLxwkHAJwWVIyZEbq8vB3ed4VGGR5oCRzrHboA6v9WeXVs3c
         soQq7xAMq7qIsYzwHfV48+impk+meRs61hBv7/1QIluY3Hvcp3R2YXspMVfMY1AkXhca
         nePk3pQd+O8NvFIdzhAmVGaat0JnwIhyHnH3YfOx0w2bHeV/wrhVnt8bivyoDLzaMJfs
         o/snciFbEoDZ75vz8m+CRIIU21ikugckMvVEagCjLYmZku2+VTgLfLsou91j6jBS1aCr
         EQPc9KxcAPb5hPgzWZGVA+a5fw66EQqf6Ffx54PpZHD5t9pED7/ymWuG1vx9Uswmh5QO
         W2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794178730; x=1794783530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxTzr5aT1f8Lw8XRh0X2JPM4X2Bt5RifhAKn6+Pv/lQ=;
        b=0TvweoufoJwZEhMXM20Hb+FtWnsn5W/bvDswVICH3eqEV3oBCja8vsRfkYJV1Uui5/
         T0O/I1VF+3iePFb0cU/AUUep3Dv/RsxL0DoOmvdeWCXE5SyKTj6KpkgYh8/N/1GXKVLe
         6ZSy4q/5lHhkW0gOw5NA0C/PBjhZuFIAxm+qbn+r2s1v/yPek+bfXGQA99aMC9WHaMbS
         Yt1TMBDFKo5c+aePPtBcbNuLKg5/EhcHuzTIoBiHsMAM03yzE3GgotMmfaeRHz2vb0h8
         Fy2Y6oi11Hu1Y3mytOhgBMzToe834E2NN+xynRtYrwIjYsRN4zMb8N4QS7ncSSD8AvTl
         yeXQ==
X-Forwarded-Encrypted: i=1; AL+hErGb2gytv2UYHbvGB0ogTcCpSwsXOTje9Ccu9QeBeJuMxepg4OVLgUdJ4baKinMnWpS1V7IEPDcbM1x/u64=@vger.kernel.org
X-Gm-Message-State: APuU4Z/e3xG26E5M1TaWTvU6f/w9tXsLdAg3HowZE6z2s/b8xjBiYNQd
	xkl44nn7Aj4lIwZqYV+WYoFIu9eguluu9gijWYpBv+/2FGwoNU4xNzDVQIV0hkHf
X-Gm-Gg: AYBFou3ZVVdwTzTCuSnGjg3B6NtIk3zmWs3Wk44Sa6ovHGIOMjixyyJeupWXLUGtsTM
	5LtLTtJADAbm+E4gOC9/7EMshOqmjXJjX1wDEBE00XCAe9iNJd7e5mtG7LPUsBA8ikIGR89Db9K
	Qx2CvMfmlBAfo6IjeAqMOAbO9YbLm56n2lkEzZzjbviFVN40lH673Du9/qRVDvnivaWszehflVN
	DOEmnuffh9OWEFqINgEPFL1qFeU+tL7eykzjoS3uY/jUiOmhwugs9tQKQCjV/aczMw/vtst0+k2
	FamkWl9vskkzAFdV4ZdOjujaCJtixCnZ9N5XuM8eBia6eMvEil7iz+TbrcmQnLb5QVOxvKv1XjW
	EU/wpfpe1H4qgG4ia8BBiYqVW/25utL0WLKFDjLmKgRziUY4+7jvUsz6UxWpmcbsfm4h/9Z9iCN
	7lCUPpsAW3nBdJxlLMpEk2D6tejSck7WkmfjyDw7oqTKkfHTwitFUQ/ztgobiNCoyPr6QziPf0q
	jY6DtjWXtZOPTqmnuxcfiOp3iLG61Z6xwObaBWEgw/galQFuvKDJHPdxDhy6U+v4DWTAGGpxakp
	vlJj3F8yeTXpmBvsmAtbTtUuWm2du5CpCdixOh9jecxYG81WiFUZO7jU3V9OtNLt
X-Received: by 2002:a05:600c:46d1:b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4b960d9c486mr48668035e9.5.1794178730212;
        Sun, 08 Nov 2026 14:58:50 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b90f119af9sm88390475e9.14.2026.11.08.14.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:58:49 -0800 (PST)
Date: Sun, 8 Nov 2026 22:58:48 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] m68k: amiga: Use clamp() in amiga_mksound()
Message-ID: <20261108225848.2b643170@pumpkin>
In-Reply-To: <20261108134501.404852-4-blum@kernel.org>
References: <20261108134501.404852-3-blum@kernel.org>
	<20261108134501.404852-4-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  8 Nov 2026 14:45:01 +0100
Thorsten Blum <blum@kernel.org> wrote:

> Replace the open-coded period bounds checks with clamp() and remove the
> redundant comment.
> 
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  arch/m68k/amiga/amisound.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/m68k/amiga/amisound.c b/arch/m68k/amiga/amisound.c
> index 5ae1f017b39b..5b9d265b2cac 100644
> --- a/arch/m68k/amiga/amisound.c
> +++ b/arch/m68k/amiga/amisound.c
> @@ -12,6 +12,7 @@
>  #include <linux/timer.h>
>  #include <linux/init.h>
>  #include <linux/string.h>
> +#include <linux/minmax.h>
>  #include <linux/module.h>
>  
>  #include <asm/amigahw.h>
> @@ -81,17 +82,10 @@ void amiga_mksound( unsigned int hz, unsigned int ticks )
>  	timer_delete(&sound_timer);
>  
>  	if (hz > 20 && hz < 32767) {
> -		unsigned long period = (clock_constant / hz);
> -
> -		if (period < amiga_audio_min_period)
> -			period = amiga_audio_min_period;
> -		if (period > MAX_PERIOD)
> -			period = MAX_PERIOD;
> -
> -		/* setup pointer to data, period, length and volume */
>  		custom.aud[2].audlc = snd_data;
>  		custom.aud[2].audlen = sizeof(sine_data)/2;
> -		custom.aud[2].audper = (unsigned short)period;
> +		custom.aud[2].audper = clamp(clock_constant / hz,
> +					     amiga_audio_min_period, MAX_PERIOD);

That requires that amiga_audio_min_period be less than MAX_PERIOD.
The order clamp() does the compares in is undefined.
I think it currently does high then low. (IIRC it got swapped a few years
back by a commit that said it didn't change anything!)

I've thought about proposing swapping the order and then allowing:
	clamp(int_var, 0, unsigned_limit);

David

>  		custom.aud[2].audvol = 32; /* 50% of maxvol */
>  
>  		if (ticks) {
> 

