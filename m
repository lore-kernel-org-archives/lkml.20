Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793731524;
	b=cZDuR/C2WSmKCAIWRqENzryEZMSqeQmPQwGd2s4nWwnXpQ4Q0sW3fuNLVrScGNDU1LEh
	 +Qev2J1CsAZMDNL9O3L86ZKMg2wwHxPV4Su3otrSpHawv/1uGrKZWrHzYHrWHFIjFUe/i
	 s+k9MOtKAnls9o4RZpAzHwhbpbsE/nlJNja/L65pGYriaTfd+3Qw8lCk+M+IZb9NJO23F
	 yVAdKiQOvzrYPvmmTsB0jPWxMEjb/Akb8xwdGgfsuRPD7QN2kxWG2y+BTMcJq6q63lkor
	 acpA5/sAemj8VaDXwhYWMK4eWTeyuTBmWJJZQ30f/tBaONJjWP2S+eZ7YdO9yCuW4iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793731524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dxl6974/XeNGL3VGfuMejNoLR+R+5VwHaUl0w+woIxw=;
	b=QlYyMhuRqR5hdJGTeRI1nUOV+/kXX+rzc4QlWDrpig1adxPk222rcn0N3B/306ykajwD
	 Tt9RwBrTHT2BncM131fnxFdSL5LPu/93uprokF+yScpywrbDSuQ5yow5OBPJooGK1kYLQ
	 K/Z9EEzwaBCu9O3/hZuNF/SHEe+QLOHPX2bAteKiePYDcYu5MWT/p00Rvo5+jMlnRwLJF
	 iGQ3Lm94nBy8PidmQhfQAGLRJxhcbHb7QwJiN/y02MAAqSytJoRIthG1+MkWrNEbmaY8Y
	 NXuDO0ugLKdaXhA5WafLQYsPiLvlFkwRlQT20600r1Pfv2E1KDrkzlOngketuCDsusQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="bRn/Owv1";
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169EF606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 18:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 169EF606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bRn/Owv1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a18fc7a38so8649913eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 10:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793731523; x=1794336323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dxl6974/XeNGL3VGfuMejNoLR+R+5VwHaUl0w+woIxw=;
        b=bRn/Owv1Hbfs4AmSN8ZJ7uUv/i0z0jsI2n/FSJWVnU6sdNs5Vsb6Xm0EVSeeyfd25e
         s08GRHSnBiw1wt2ZJ57iKnFkzIRWVkEfnnoHjWhJR6uaMXyzdi2V1uY1dCOJnvcLcAGa
         tOl46D5H4NCfA8pH4ty8mpstLEBI841odDGE8iZL288BlhkJoNYgWzNsmV3/wZQvJ+Wd
         b1IW+EwkaujwJlpUkvjFTkIXOHtGxTisL8ZYCyaQVlXAw4Nhu+h4ZNRpfaPBcmrbx2YY
         dlot7YrLO0aHSIq4qsDCn2RGmFQI/dsYji3caC76+BjaLIBiVvV1Oes6fIIA41IYUj8V
         x01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793731523; x=1794336323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dxl6974/XeNGL3VGfuMejNoLR+R+5VwHaUl0w+woIxw=;
        b=AKFDiHy69XLnYCRVD9NjHwfCS8i5lWDRPcTbIkO4uWjO7IwjN6ly9/Z9Ill/foMHaw
         NyR68hfFKEH2h2ciC9jw6qaXGNZHJ0E9VWpjLQTpp6V8sr2ImRFemUYyBfKkGAVa4KrL
         EIwLc+16/98+9g6mrvPEb9J8Z/mVqowH1gZpbgzk4imsWcLE2UITey2EjDeLQ5XFmJ1c
         ICzgauX6WwfzYYMk0ZfVhLBw+9p8hcjw5PMfRQZyyEMDa94ljBq1hRw0hId4zfrYzdgv
         89Jvg/+vtTTifHCMx7j/8JDVO6x7i+C6JYrCrOn9VUAk8561JwR9qMKmu92SuHP/3TiA
         1SyQ==
X-Forwarded-Encrypted: i=1; AKwUvByULfFufUvU9A7j49fiRYWm5W87zPkU/a62kosh5SPJObAf0gFwgCtiaQFz/3odpGWAi0bvs7aNflWHp/Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L+7QwEfN0f2qTz80U1B6S5vfo8wGYJ6eYbLnFZs104bExZ9Xb
	3MIW9DZeihatxa439qjX1/nf8Qj2biNtvEn7MXCyMz4+/GZ7JTr8/cYE
X-Gm-Gg: AYBFou292Ma742e4x1hNEoB2kkp/j9n7rX8LuqSJ/s1z23vnQoRHClmTe2kVavPJOb+
	C1Y/gBoJQgNjvf7satVumoy0V4jg/kiL813nWBuP61NYZZsICKdlhJFu0r8ymKCI6o5SNc9FKXy
	QsUFwRQ+1zhEK4aPHOT9MoZc66jEYFU45vccfsGD8OMGyFn8Jm1OSyTBQ3QUXY+pKdHcCSGe2+d
	FLckAI2TGZSLgZ2WKx+vSg7pGuBW62QjfMe833Gj5+qD5c6oCjExiyCH24Kb61Fl2udU8Kgqa6Z
	ZomLc8b4XSr3s/9vPwUuwYsFTsPM9x+1Rc3iMVKOAXTuw9ZrOsoyV6akxC8xRQHGxKH2BQM3sWO
	Gq3+gpJWC5TE+bLhBQKpyfozRN1u584rgt4dJ8a81f1GnFwZh/joC9M7bQcAGO2lyKmhuXAKanR
	lOuOstlJECvycA//mP2qLGPWuGkl38bSI4+qzOPMHZX6BKd8nqfGDfFji3NCD8/qs1EW7abpu2L
	qUC042jbUrVw3kCrmvVTB/UuRc/d3IaFVJiJV6+6OonQfoqDfTx6mJCLA9NSeiV5l3RARE4/jvk
	YZ4N3tF0HwsQJ7D5lEaNwx+s2xrnO8hHi1+QepXVcXw6KPRdc05Qs8vThOe+CB/w5y+Jre5jA4z
	TOlJjuouZrJ+MyA==
X-Received: by 2002:a05:7301:648a:b0:369:d793:328d with SMTP id 5a478bee46e88-36c9dd475camr1585502eec.31.1793731523122;
        Tue, 03 Nov 2026 10:45:23 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3788bffsm102648eec.1.2026.11.03.10.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:45:22 -0800 (PST)
Date: Tue, 3 Nov 2026 10:45:18 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Guanglei Zhu <zhugl3@xiaopeng.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	liuc63@xiaopeng.com, stable@vger.kernel.org
Subject: Re: [PATCH] Input: joydev - avoid an undefined shift in the legacy
 0x read
Message-ID: <auorp8LgmW8Fr9tY@google.com>
References: <20261103084135.426629-1-zhugl3@xiaopeng.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103084135.426629-1-zhugl3@xiaopeng.com>

Hi Guanglei,

On Tue, Nov 03, 2026 at 04:41:28PM +0800, Guanglei Zhu wrote:
> The legacy 0.x read path shifts the axis values by the calibration
> constants that JS_SET_CAL installs:
> 
> 	data.x = (joydev->abs[0] / 256 + 128) >> joydev->glue.JS_CORR.x;
> 	data.y = (joydev->abs[1] / 256 + 128) >> joydev->glue.JS_CORR.y;
> 
> JS_CORR is copied straight from userspace as three s32 values and
> never validated, so the shift count can be negative or wider than
> the type, which is undefined behavior: the shift compiles to
> whatever the architecture does with an out-of-range count, and the
> compiler is free to assume it cannot happen.
> 
> Clamp the shift count to the width of the shifted value.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org

Why do all these need to be in stable?

> Signed-off-by: Guanglei Zhu <zhugl3@xiaopeng.com>
> ---
>  drivers/input/joydev.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/input/joydev.c b/drivers/input/joydev.c
> index 32459fd8a7c1..4740099599bf 100644
> --- a/drivers/input/joydev.c
> +++ b/drivers/input/joydev.c
> @@ -353,8 +353,8 @@ static ssize_t joydev_0x_read(struct joydev_client *client,
>  	for (data.buttons = i = 0; i < 32 && i < joydev->nkey; i++)
>  		data.buttons |=
>  			test_bit(joydev->keypam[i], input->key) ? (1 << i) : 0;
> -	data.x = (joydev->abs[0] / 256 + 128) >> joydev->glue.JS_CORR.x;
> -	data.y = (joydev->abs[1] / 256 + 128) >> joydev->glue.JS_CORR.y;
> +	data.x = (joydev->abs[0] / 256 + 128) >> clamp(joydev->glue.JS_CORR.x, 0, 31);
> +	data.y = (joydev->abs[1] / 256 + 128) >> clamp(joydev->glue.JS_CORR.y, 0, 31);
>  
>  	/*
>  	 * Reset reader's event queue

Thanks.

-- 
Dmitry
