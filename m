Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AC4CCDCA
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 12:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547593; cv=none; b=VCbfYefA+Sut3jGvAiUrbiiD/xmoaBSc1SuT/8kHa70KyjCNz8xUReVafe+EBkbIgO9/WzSdpFKFYqhSsHLC2IPVg6L0+q5h7Wn5gVQdcQKRdQleMJ0XV9RJH50hLmxzEnvlDn0D2hvNqxRwqFgatcmDyBv0tnxZvzYd/oKk5xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547593; c=relaxed/simple;
	bh=hOv5cDWUXPtG1yahyo6pzhmnH4Ks7c65TADdBXCaVOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q4MOR9fQDkzi+zoh90ZBMpXsinbb2SJywE6j5gI7gf0qGP+8VHk2rgV1ZkFuWkLsRNEK5wMeXQdJBovdA0Vfw9uSE+SSeEWyvZkGU/ifOXZek77i/RmdCo30mWNQIwPhhDNXRoCaOOvuUFv9GHUNetrG+ewpbPg93akcXBZn8W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LlUVp8FQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LlUVp8FQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c411d6615so2685332f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 05:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791547587; x=1792152387; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4ZIo+hbBbh95/Ym6wzbahCH1ehdtPjKzs3eJGJE97JM=;
        b=LlUVp8FQ2MPyn6ZFghQagi1IXoAdvvWZX3b735EJI1KETnOaXFX1HSQiwBmgXQhBAc
         lO7mgmTX6ncK3rCjIi6RAPC+lzHc133N+3oQsaF+Bg33WJm0vjSJMZZOGFj2LFw0t1Vr
         Ozv0bmKBGCU7TE3nMFgJlWpzPQxjlwB0D2lHc+ZjXmrU0nc6IQNOhS0ZjyBe8i1Zqfvl
         1C0h2gqZ7sfbaJgJbUNUSvJxVBIeZU3WQdpqVyBXiuvrK4NLxwxsSEOgDRPvAB5JtUVo
         KO16HSMNWrFhriIr7s3+2Hez4qrhsM3qB8pqA1XZlVFsGYW2yDORNg671z6GsEz1AMJw
         dYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791547587; x=1792152387;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZIo+hbBbh95/Ym6wzbahCH1ehdtPjKzs3eJGJE97JM=;
        b=qj+gLy5M3WOZhSnNihfosDpDjM64lfBOwL0x9eNNB2AJMLdQmz+gVsadJKPhRCtK+N
         vP6avvQcyv0hbuZ1p8dtM798reYtYQ5x5o8QZMIDmBNBeA2B2uxMfu7cbIQFLk1PeZc+
         9eycH9gOI4hk/0JrY4Q+Vi982ch2RU9bgu7b8ImGQL8HYaOd6TXsShVaax4ZVpQJxj52
         9zmEoPNmU1RB5mpEY46bpz7uqhwqEV1DjlOniFG/lFqmLSJFiKjUV6Qc3yU/ATSiNFst
         IEu6+A2rI4V32xotbEmVcQYwVPDv+9lxj7RzbAPcmq1qkw+APxuidTD98yomAE/Y99zc
         FieQ==
X-Forwarded-Encrypted: i=1; AKwUvBxANVpgxRZT6PYh37M66oWhpPnUW/NxsQWDdM1y92DRn7iZ/RbhTySH8lbM0TYa8ONcsqYVkdJv7w53JBA=@vger.kernel.org
X-Gm-Message-State: AFuF++kFGnZIQh9Kncuv0iRa6wWIjmjal2jlTKRkODRYmPRGe155a7ZO
	YwNlBzFCHdGWjr/ZG1pXaQHFw6bCMY0njkWjEKZo2EklmX6xovcctpmr
X-Gm-Gg: AYBFou0CqGrToxjiKOGYvO8JKt/jHnHQ+vTKuLOaNluY0X1dVVV/+ZX0YUoxPtEEsRZ
	8MjS0HG8pKDovq+i/Blv5B3poA7qHkma+UoPJ/Yt5N7CpvVhsDeRfDWu6cFOW8bzRb0BZPqb9bp
	Pkopg9mLZq2arhgWbm2GuS1YUuV7XVEuEB9KuawUIO9SqdAUMzjWF9pXwJvH9Vr17tOezUwOMTa
	TnibEuWbrcgLMvxq2cewA8h4zcIstHEmWQffdlVuk5fHFss510WBhvLQdph6YssNrRLf4Ka0ubF
	NR/i1FUL904ykv19P3HcDPbW+283Z6bHCCOMrGBTsReZVItvGm0Ozn+9NUsj/LzEW+UozNtiJnt
	c1vjYbGAwgDESykah8mxYq8IjFw82Z5VpvPzTb8O3n9lf00mnzWzhaJ9MoTYDh6KNUyiSwpIvr+
	+4Mi4vV+4MikW6D7z6iQs+v2v98i8mhCmP82NAQeLXBqRMc90UKVQaeP8Ss/5fw/YhQEo3LiHyt
	LkHZ+oqmLQvYdAWmPROxpqEyh65dYQ02U5blmhUYMCQfnIpgFrNHNgWdfy8b+nn6MP1BW7DI2g/
	4+ECpPh4RKgWxD+MV+IekEGLjMFgFplLwtyS8Op26JjmGKmAd/PtKbUlhH9kIrc9i7ABZKV/lW1
	rSEOEe49GvaPxgQwBUuqM7QJ6MMik5FNCpiOu9tAfVmDExx3DPMsJJ5B8r4WkQ1GRAw==
X-Received: by 2002:a05:600c:3e0f:b0:4a0:1b21:2628 with SMTP id 5b1f17b1804b1-4a18e4b60d8mr31527275e9.23.1791547587405;
        Fri, 09 Oct 2026 05:06:27 -0700 (PDT)
Received: from systembl0wer (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bc6a484sm57732875e9.2.2026.10.09.05.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 05:06:27 -0700 (PDT)
Date: Fri, 9 Oct 2026 14:06:23 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Andrei Stancovici via B4 Relay
 <devnull+andrei.stancovici.analog.com@kernel.org>
Cc: andrei.stancovici@analog.com, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liam
 Beguin <liambeguin@gmail.com>, linux@analog.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: iio: adc: lltc,ltc2497: add LTC2493
 support
Message-ID: <20261009140623.18920555@systembl0wer>
In-Reply-To: <20261009-submission-ltc2493-support-v1-v1-1-3dad1d4b152a@analog.com>
References: <20261009-submission-ltc2493-support-v1-v1-0-3dad1d4b152a@analog.com>
	<20261009-submission-ltc2493-support-v1-v1-1-3dad1d4b152a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 09 Oct 2026 11:43:34 +0300
Andrei Stancovici via B4 Relay <devnull+andrei.stancovici.analog.com@kernel.org> wrote:

> From: Andrei Stancovici <andrei.stancovici@analog.com>
> 
> The LTC2493 is a 24-bit delta-sigma ADC with 4 single-ended or 2
> differential inputs and an I2C interface. Its channel map matches no
> part already listed, so it gets its own compatible rather than a
> fallback; no new property is needed.
> 
> Signed-off-by: Andrei Stancovici <andrei.stancovici@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
