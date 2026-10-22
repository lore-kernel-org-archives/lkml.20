Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702810;
	b=E8nbZ8718RjcrZrVUQ+NgnFNWKr2SuMkj4IOkyQky63cuuLizZFrmE5sQBcV0vmr25At
	 tAzVzKCTQnDK79JRlJOE6WW2aET289/X/Ty6ZmAs54JxFQd06vtAINio3/Rn+tQLEZBz/
	 iEpSVKdL7ateVD/feEjZo5zW//OIED+8Rj/SM0f0BgvxKn/De5HbUs1m3c7nWbZwzUp8K
	 oEfx0p6xrR5B2W8DNS9MjhkiH9ejoihBkON3LxzesaHkaeccziQV1YYBGDG5kLwb+y5yT
	 1Wj+bMRqW3CcXWUqcMH4gwK3ZuSZlodYRHZV+sopEaEw720N3B5Bo4FtYt29lRZ8jEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=a+TVj+4Eo0cuLbImvgKBU3zCHqSsK0fiVALfcKdKlGQ=;
	b=DRsI2dQPWZbVgUyIMAKeoYl64+Fo7mPsAg/tTSEs0/NT/5UCTm7xpo7G26QbTfTRwpNb
	 ursgga1rh/LG3mwJ3/yFUEzrjc0Kjbw6qUPf8JvV9plwJAZodqz1vCyl1rwYcXI1ftknF
	 dL434+Com0QNdwLe22KUetNRwibqkG+Kis2Hnhr8f+PUL+aIUtSS+JXppqGHjHplCyeqi
	 z7uxlvdcC9PNV0xu929nibyGTHEurxPjwVnhhEafZPRkKAUdZyXBWXlKMcP3pOdlnGZZW
	 JzAywZFC4Lfa0UV0LsLHLah+nNJTktlUlAnKIQnRAIK3GlKxRI7HklHneSOoVRkJr+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bqMtcI04;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F05606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83F05606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bqMtcI04
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1905265e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702809; x=1793307609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a+TVj+4Eo0cuLbImvgKBU3zCHqSsK0fiVALfcKdKlGQ=;
        b=bqMtcI04Pu5MSW9kbxQGcCWePH2OxfIiXtLBYdnh7Seuyo9Ha7kw9yZyibB5Rp8p+8
         +uJJX57c4HZiUPJwPgqsh9QF+bSRsy2A6lJRFVN76J5sGZQOm4l+/O2Q4yKLoDg6hOKG
         K3Mo5geiAHPki9CxUGGiOwGbUxHUVJ+B4j6CfSmk6IZJ2FtFyU31hYNw7fyRt9j6Bezp
         f9o3/IoCKyfDj7NAn9jR9Y1pLBeHGdR/RNW4Rbe+lr7SM98dYCf3avjMvhIYJP1Yk/I5
         HfiVahpE7JFWivhrx9+BRGdO3ccbDi7iVo3n0TeklgMs1i7WbTuW+QQIQKS8wON0TVBA
         kVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702809; x=1793307609;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a+TVj+4Eo0cuLbImvgKBU3zCHqSsK0fiVALfcKdKlGQ=;
        b=C4teLfHGDNVqrDGO5IX79UFwnoNPFJFHYgoWx0c3Bjhb9UiZy8ACBoyrozUlLK6XuR
         9wIuswi68HcJgFK4ZKYOXbBj76y1rcjYTggdpk0fHX4x6xl/Q789gwKbrSrU+sDkfX1H
         200FRV+Bt2gcnRY3Oz/tBm93ewvF3+vl4hToEKCBXkiUi31rdDR2v0a1Ajn8NjhQ5L2A
         OWEqOGUMIfICWfFcO/qmwJz+fIEOS/rjIctcgHaULenZNkllF/I01Zztp/ByjSodDJru
         bVm3WsQ0rHuSGTnzZ4tTJ3dJ16B5+e1svwGsmptQPQmTG1qoy2ljIUIoVvHMkNyDObx7
         mFWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXSZKcJDKjlPaj0o3IyosS2Yrl7G0QNUGDGc6Uj9r8z2VyV7rQXNdUCkmy02MmI+wSYESuWdBBmV9UENU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKMShqktbJnOSguSnxerElfdTm+ZbQPMenCXKqsqV1kxKSPs20I
	mfyAm4Ct8lY2LqbuzjNnTPRS+vKCEIQGluBFCt8YTbvXmTnDy2Ggd04p
X-Gm-Gg: AYBFou3hZubZ+7UGUAl5Z0kO4KOiCTd5L8Kh1isf8L4wtx6zljpPis1oXy3xIQdoGDa
	ylsREClUW4jBFaqvFa6TrnaqjKjFk3EeyNbpim+Rv4r1EbKQVJJjDZL3PpCQkxR/WPpLpnOjJBe
	nykRePhnkDlWx6Ilqq69TvmLRXRnqcB5ig0ATHRw8LKL+LAQveGDg5UM/0s9mW+k98JXUwLcets
	pzEjq6Vwk7krYH73f5AzTDTRHmm9kB0WchJ02j0zdTPyNu6551aVbc5JMV0IwpldmTs7iRwBepN
	o3D5euMrqf+3J3q1DeyWm4mlfNeZs+x3s0lJTARF2ySaFPmRJS8ETr8KKfk+wseMH3pp1UsiU3l
	I+T6CpgLH9lLnq1IvZMvVzb8FaE8wO2nD4Q7osp8i3dnfoG3eF7XuW1kF9NBfkDaLRmIi9wdyHS
	MloLbMeBgrLg2cvi0XLIXmBW4Zfh6bSoI12XKMllQflNiLoPLKyc54TA5wFMuYyjSzJYXWzcrT0
	H42rVrAY4wyNrxagi6M12i/hOyfA3PwiISSOZzTlAUKYS9qfOrbAH1B3N+r8Y9WL+W/VEvaJ6VJ
	q/yerg5p6YSDDerg
X-Received: by 2002:a05:600c:3111:b0:4a2:1a:a128 with SMTP id 5b1f17b1804b1-4a211ed7ec2mr3619535e9.19.1792702808835;
        Thu, 22 Oct 2026 14:00:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a211b89beasm8702815e9.5.2026.10.22.14.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:00:08 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:00:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 14/21] leds: flash: Avoid divide-by-zero in
 led_clamp_align()
Message-ID: <20261022220006.6e066670@pumpkin>
In-Reply-To: <20261021123406.3163547-15-lee@kernel.org>
References: <20261021123406.3163547-1-lee@kernel.org>
	<20261021123406.3163547-15-lee@kernel.org>
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

On Wed, 21 Oct 2026 12:32:23 +0000
Lee Jones <lee@kernel.org> wrote:

> If a flash LED driver leaves a setting's step size as zero, writing to
> the corresponding sysfs attribute invokes led_clamp_align() and triggers
> an integer division by zero when aligning the offset to s->step.
> 
> Clamp s->val to [s->min, s->max] and return early when s->step is zero.
> 
> Fixes: 7aea8389a77a ("leds: Add LED Flash class extension to the LED subsystem")
> Closes: https://sashiko.dev/#/bug/linux-9d06d7fe-310b-4aee-8b16-0fb49550c287
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>  drivers/leds/led-class-flash.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
> index 181dfd49c6ad..16b3b6b9365b 100644
> --- a/drivers/leds/led-class-flash.c
> +++ b/drivers/leds/led-class-flash.c
> @@ -375,6 +375,11 @@ static void led_clamp_align(struct led_flash_setting *s)
>  {
>  	u32 v, offset;
>  
> +	if (!s->step) {
> +		s->val = clamp(s->val, s->min, s->max);
> +		return;
> +	}

Why not just:
	u32 step = s->step ?: 1;
and then use step instead of s->step.

David

> +
>  	v = s->val + s->step / 2;
>  	v = clamp(v, s->min, s->max);
>  	offset = v - s->min;

