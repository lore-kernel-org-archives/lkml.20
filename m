Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC1D3C37AF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024607; cv=pass; b=HESokSaD1MZ+PXYLStZr8pRow1ItiVWfA6phfZFRFMdN/AX5YpCKh+JFPoosAsDhIoir6xG2sSI0JVNord+98KBFsaikW9QQ+oS0NO5Nnu1oi7NDL7zb81GwihHpIIZViQs5abtidyRk+q2WoezHfZQMljICFhXAoLEmPfVv8Ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024607; c=relaxed/simple;
	bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4hCvspbLPsW+tnfFLjpAwplTrvz45ZZLBVkuKLftoaKq0PxGajqhrkvl1FgfC6C10PAJrw2pZtJ3rTfs/QKQmTT0T8Wn84BY/aX+tpCfrAjHYh+AcRYBtMO6QObWszKoBPHLnHKaWPV/vc3ohIXQCh2bwopWHdGA7zt9SWDS8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/cn6Iwl; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/cn6Iwl"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a20367cf82so54627161fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024604; cv=none;
        d=google.com; s=arc-20260327;
        b=FosjT1mqeYi0w63/6G6CjxV4BL8VQEyM4BysEWdxTNcjsWBFNkP8a3pOyezIerIVzD
         roSdsRHk0IqDvIkCeX2lJU49kp3gbCC5KfuIIjGHbwgnWbQKtmLsbwsn327VQr4snS4d
         EdZWJ00aMokaEp+r7QehUP/B1Mx6q5cJBfO6hR3vEfXBP5xMBThCPh62MA6Wi+htBVWQ
         rLSbGcK7pV9K12XY5bfCj/Qsf3xTV3lG79XaQadL0YQlIT1EliRwWxj0GztNEkiD+ZsG
         1n5zpZw7zACdhhXQ88eq0YlPCM+BGLgyTpFnbHeonR2fyLS2oaDXmCQWStz9HgrNhsCs
         4vzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        fh=M2yAoWr87i/cSPaWw74pD+etK+T9o9LDY23PIzd/zZA=;
        b=kftJd1voCWQjsVElUP/PNWEWc7NbL2W/2kB9qB/CPzZdHYTeOcUO4khgsK4s4HrcvY
         TqNJSxQAoYozeSjNFXkEfDq/rvmOS3kCQIZh3Sq+weDy9Prld84Ti58hOxa2nvaH90lN
         DotwmPsMh5vkTCde6KO05WKFOY1W3PzP7P9efxxNn3xy5nboAPCcgZyAUOwGyPD4TAio
         1DoyoSdtru0v6cxJrR2bXSlVtf4JvfhdOG/SbdtMkY0wCnsgeTzGXv/A8g3t/nWzHLoj
         myLS5pzt08DLvNatp4qJz5nGb/LuEWZcm9bK4iysu5fiONQuSw2+z6xZ6svtWZXNihLC
         wOdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024604; x=1789629404; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=E/cn6Iwl8/GWCIxXZ8G1tRxpm0XYE5xhRkNn+WU99GZqPHISawocCzTDDgtXCYPgwJ
         kcJQUDjpq54CfifQ6b3J6lv+tRiqtr/G030ZwEbwQJvaKnpAJuVCtuTS7zoL3j4OQODH
         Qjxa9YHcUmYIb1972AirjTRn668ntemP2xxj5hJz0768SGa/UGvwhdimpdn4cdl1LmSl
         YT6DfrpCI9ftwzTNlgPUEi6QBHmjh+MJsHJxkIzVbMMODhYi9kpKaHOMEh1UGoQs5u2k
         1DzHtCTLGkWkEvNov9n2ZyNSGDzpJE9lBTvWshK23QJIvPXY+tMWUGOWnGPyZjm+8EJQ
         Cu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024604; x=1789629404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=G56nYOqbCEIGZ8RFUwN1ez+C9CXG36qOPK1UHwgUcpperKJkEdyWxWxs45Pg9HCzp4
         YxVbpcYHZGogdaiBdjyOWdqNmYKY4+MHEARrK7CH0y5e89OnYbBfBlI9vn7RrhRMeme0
         vUeutEnY0s40WiU1c7tFUahIx/SZyYHtyBYF3cQq2KDeZ4z4nCfTr9H6C3BALBXqm/yy
         ybOBjwT8U9NcdJ7kbKPEY/zHYIU9C4Weu1TlLcaNkx0Jdn0ihJPTqsxivH14zJHo9ikN
         0A4zKF5OJ1h1Mh34E7dJbFnHnAABzSO2VeiBikH91jhSW2O5/iV4mZXNGM2xGB8gBNvF
         Y12w==
X-Forwarded-Encrypted: i=1; AKwUvByHz+SnFaOGyhp8bvMHMLbBzjIzUu4VL4E9LNdFbF8lnjUW3qRw7VYAJILmPdQ/jVv84TpLSsemsJN5WgM=@vger.kernel.org
X-Gm-Message-State: AFuF++nupNT7TE4Lch1C6o8yqZRlgnCwzxU4dTPGeLxhXzzoWAvvR1b0
	cx+PT7y46UHUC050mB0MPgyR2KOdtpXsl85WCiAEoi+norBHKM9UipnpeDx7LNq/zNCuQbQv2sz
	zHwtnIsOUfg0TPmc+5wnMZ4mj12h4Vfc=
X-Gm-Gg: AYBFou3kffvuT9Kuh0NvBtaueCS0Wouf0W0jOSA53LYihAYPUyqmZ4Bncwdc1sYU16Z
	i4oDY4vhWaJdh5F5ha4IyBE2V4vtqvzu8bmDdJWiUUEy94dhDpUTZR6d/x5+hILrQUVRV/xz5kY
	52+3S6FfgjyoiLh98sSgLo1oxdmew6pUZf4pdyh7MrR6WvRdl85bSdqWgc3SGJ9yo5tQQFctVSX
	S0IY2x7W30cE9bnafAVkMB2zvCJrkFAhm7VX5lXdbCwOXoVuldeHhH5bkJzcz1BjhnkL71aYRQq
	q4GPYRzfrRobifhHzPVfNv0QhYvYdC5wBZ+36va4AyR70a5Fn6YNNTK33ImvHb/eF6aKv5/Wtxn
	PWu8fuaTbKz8=
X-Received: by 2002:a2e:be1d:0:b0:3a4:9b64:9811 with SMTP id
 38308e7fff4ca-3a49b649b3fmr11090001fa.15.1789024603607; Thu, 10 Sep 2026
 00:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907080831.11281-1-syhuang3@nuvoton.com> <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
 <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com> <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
In-Reply-To: <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 10 Sep 2026 15:16:31 +0800
X-Gm-Features: AcwNN1X4FjemE5ofed7LBWR6jnl8AHuWB-oy0Ch_I1mQhfiWyKKr_gD5QY--0ns
Message-ID: <CACW=pY4e84hBiJxvLz09r=LD=OfssBFF_tXduUO0YJxqS3xf3A@mail.gmail.com>
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 09, 2026 at 10:02 PM, Guenter Roeck <linux@roeck-us.net> wrote:

>
> Sure, it works, because your code converts the bytes twice, as I said.
> That doesn't make those conversions necessary.
>
> Other chips also use 16-bit config registers. Just use the same approach.
>

Thank you for the detailed guidance and clarification.
I think I understand it now, and I will send a v2 patch soon.

Thanks,
Sheng-Yuan
