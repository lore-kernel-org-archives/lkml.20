Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FB53AB498
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813406; cv=none; b=aJKjxkK+aX+cmXCQkD8oORhl7qQRRBchGc4dL3MNHqJxT9r24EblscBJ6hR5AgIYhe9NY4EP6vZc8UoS1P3EL2c7M2IoND0xb1LxBmokBI5QoCg0B21gExCUzsE7VGKXEouWrpSO5AiL6uUs1aaIkQ0IXaTy8yHUPZ3JPXopd8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813406; c=relaxed/simple;
	bh=L/9MsltiVxDAB9BNwzkHRMxC3qXxoBU85cZrGQmQAd8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FK9b4W6ZQO3cWFLR4jvxbY8wvnapLJWdOUAtTUgRW+xPc8eYInh9g5NQrBqG1PM5kj3K/Lv2owJ3Kuwb2GvkYytl3Vkr6F5mmO8ptz3/yzSyOodQ+MRqlMRPWyeu90pdmJGRzIyRB5XRvmDKO1g1cYFFG6BekCkJxHslX7XiKwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsNBgUjr; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsNBgUjr"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1688d7769so16022335e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791813402; x=1792418202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UUYoS5AA5l7ySIMcuvHl5B+AVs8QiINi3gGrgQ2SCkU=;
        b=KsNBgUjr8dIYoHTWbojY7qIBnrpg0kRl13ZdWNG0Fr0VMIQ0JVYoJBRrp+0eoSKfZV
         e9swGtSflbmglT39C25kwXvGNRnPvVFJg/qrDu5KZ0bY34rx5CDJMlxgJXdIMFBgRzcY
         iRP6cQ6J+8zHgOIPIkgawqPPInV7bbSfst1jyQ3J4tIqGKnC8Q9564EsQ4WganWd8HKS
         DVuhNKpSiOtZSSUUtpGGHz3ZJ9jggBryczOATAahN80kfSb0W2XpAjXlr9HItM3ZChv5
         pdEX67ih+LOP7ib45xe+dcfu/7Xd/DhTW8b2xmZQgDG//jgNfJY6cOPizcHj13HvEtB5
         fzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813402; x=1792418202;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUYoS5AA5l7ySIMcuvHl5B+AVs8QiINi3gGrgQ2SCkU=;
        b=kSViOgmFbNWN7Erpgjx1xnlhu7CwGnKcjT2e7z4TsEhreAiqYZsdUJbgPlJDnBBuwh
         Gd6oUrUCDZTo7yhiiYPyRymzeiBmbDrVBaxIb/Au8TB79HjSaxWRjxltmxnwqEeFP6GS
         UIX2LUAPC7wmfeHh6b0eFQ055ymlJwaf29LgWVKcUSWN6d39Ydoqwga7Kdya9GYxVx8M
         ZIXIrflYPLND40Q0e53B8badOKwm306Br+cKNibYZF4ft4z3tpcwOdsFREMFleqAlD9P
         x1qkipa/VfYhtwLwt/+dAecNjEd1gd0rO5iIi0AnJjjP25p9UGUJ/LI7LR8sKAKo/muI
         OCnA==
X-Forwarded-Encrypted: i=1; AKwUvBzjXB4TsS+Izibep0aNU3eJXznOnB08UmJ3LR9gTbshaodzxxd6ZkUkHWPXGpq1P8wJk3CMv5/9A8kbjyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYINSNgRbYygosRHrW8kZILpBy62WcFLlY2z5H8xZjhreo8s280S
	oedJ1DNnQOO5njMc8sKfUpED7azeNYTMQzVynN6RSQxrRP9i8exmTSPE
X-Gm-Gg: AYBFou2+VQr4GxhoTA5Ukyy7oyBl4KEDpQpm76x7JF/X0MzzrPtQT88f/VeKx27ZWUr
	G3bpvgL4DsCbqdusOJYBFWLiCB5zQbqYUrC4WxMQRW0nUwQXc4tmqqjx76X850P93vtI/VKA5Ov
	Cj/SNdBLhK9UW5fDDmg+Zn40sKSgQtdNfyuxsya6Xlusoj1vOnaBT6y1aZcDmJA+9+PAtQGbmlY
	XRjMQiU8wJVW1pbMjJ2L+LmbKKtFwkVyIw3SMWxyfjfSj5SygdlY7DoMoXOsbVx8olFNzfZxCYu
	g+2pMAPvRFigVVZTcWo1Ya7X6xQt+oFXg1LOEeWq5eovHYul/lhkRutTemhdJBHOLEhRo4etU7s
	hoQt+1fUfhcFvIDw4eqOpgQumRLWaXZEpm9sCaCOghjoO+mbB+teEack9Reo+mlhGRIEDIhOfrw
	ce79EjRtytPi/MPzVxVctNSWlbN2gpVsDCdf3pdCAAB1Y8APpn9UrMSRrfS+sZbXpTuaWTg5GL2
	RKpgLgk3rf5ECjUCCDed1HZwSXHj7iEfKhlr1fFT3wca1rl59HvWvZAGP9ZefRnRQRwb1ucqA80
	y7L5Yi+m2TjOi+AinkkoaR67SXZyB77vA3vYBlu4IQ+NM3rH2yrPnwzsUEYrc34SfGsf14Q3AFI
	LETfrgrkJNS4LI15Y+4+xdbyRz7Ra749f8CLPYWpnrVPLQuc/BLU9RBMdn7/EHVoQiA4M60lNqy
	lG2xeLJhmXlt2ODjk=
X-Received: by 2002:a05:600c:19cf:b0:4a0:168f:d962 with SMTP id 5b1f17b1804b1-4a18e44363dmr178450155e9.3.1791813402425;
        Mon, 12 Oct 2026 06:56:42 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9abd574sm20255889f8f.34.2026.10.12.06.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:56:42 -0700 (PDT)
Date: Mon, 12 Oct 2026 15:56:36 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Nikhil Gautam <nikhilgtr@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org
Subject: Re: [PATCH 1/1] iio: atlas-ezo: Fix humidity channel read support
Message-ID: <20261012155627.00004cbc@gmail.com>
In-Reply-To: <20261012114553.3327-2-nikhilgtr@gmail.com>
References: <20261012114553.3327-1-nikhilgtr@gmail.com>
	<20261012114553.3327-2-nikhilgtr@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 17:15:53 +0530
Nikhil Gautam <nikhilgtr@gmail.com> wrote:

> The atlas_ezo_read_raw() function rejects channels that are not of
> type IIO_CONCENTRATION, preventing the relative humidity channel
> from reading raw and scale values.
> 
> Remove the early channel type check to allow both concentration
> and relative humidity channels to reach the mask-specific handling.
> 
> Signed-off-by: Nikhil Gautam <nikhilgtr@gmail.com>
> ---

What a weird check...

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

Additionally, Sashiko found a potential I2C read issue, please check
it out.

https://sashiko.dev/#/patchset/20261012114553.3327-1-nikhilgtr%40gmail.com

-- 
Kind regards,
Joshua Crofts
