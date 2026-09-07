Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEF43AE188
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762575; cv=pass; b=lD5oYUbMWbFhFzGLfaefBpGxYOWLKXrpLGMZhwOYsdpKNyurANlUe3kwzVhhXYws/P1Wt44VGbfZ3Yhoo1WytAD7A+Ifv3bv1/qYKNAvhy1rAWBzin3ef8DkgbAJAJfWiom9gBsKZiV+hZVaJ6m0xg+FjSIfsG/5ILcaE9Qs/sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762575; c=relaxed/simple;
	bh=ItFKlZKI2V0+J9zr3KnYF7nU8ra+oldkcSW3cENw9yU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWuQ2QpKBgrqn1laadAEY647VvKuJtRaSBmQWyv1xKF0RiNUoFpR9hAOMvIjmSIAFAQ3ElnaDXKX6GRWXQOePpKjfMne4Z4ca5hZP/O9fdGLbLN7vKZGGQ2Iyh6SFcg/vDtrHW5LV7W2oPxFt7BQzbl0fVyId+0PUMbINIQE+4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=zcEnbdmG; arc=pass smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="zcEnbdmG"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9399798ca61so179922785a.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:29:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788762568; cv=none;
        d=google.com; s=arc-20260327;
        b=jOF7QUuNVTjprwto5TwOBcPcEEbykBnWN8eCmqRHAQgBAoU9MqfYga/D/IFvdgZtpC
         l6PiSULW6emB77mZJ+uTCSatbe+L+1XR56L+Isqjtf0D9MXa0GnbwfmWy5Ysx0FJUww/
         +MxSCWl+neRaMEOSFDFXSp9VtqFLRdyhtXSCRAWtbjuHzldPuRQ3JvC9hm91XoQ6xRiy
         1AcW00vp3zHecWtmi7j/JE1eM/L9jH68evNXPUFnX+BfO0OdWTLLCWyW1kRG2YyqvfDZ
         Ea/6q6OamFLYJGrhPtKGyKrNn+/+/6D9E2ctiZ8bmqL5c/o4muAsnNIOpwMQw51zzgeF
         eAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        fh=wHjZMjsTJIfY6hxL9sVIHUG2PFs++gBYLe2x7u97OoQ=;
        b=ozXS6EaUGcXOiq22gq/h7GK3LH3tC9lRka32luOtHhIqVKIu5Ct9QZoPxKXhxCvTl6
         2B14ewNCmbJuMi8TaiamwQBHFvuHfLOq+iW3UF7b2TWCYFcHlwXwz8EjUcgM5dmCZsWI
         aHOBf+H7sh9LeAT2bNIxeEhK+cupNmXpC+nkEgAT17CjSUSGh7RKdLLN95/tHHdySVBb
         NL5efZ6/PxzIPkHMwbPVjHZyDZb2VJ79e1d6jbZtsh9u4eEW6VTb3+Y5PsSO6qiKq3Oc
         /JAdI0EaMfLVUf2BCNRflTvHpxfqBTTyX2NTdwFF13J+ESXZJt0iCGTWg2EUe7d6xFT/
         2JEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1788762568; x=1789367368; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=zcEnbdmGSPsDEFHGfiQ78aau/tFzwiSYO0HLvqBPVpcH1R3YFF3glszsRyDdPtvavX
         idy2PoVIZoPwU8HSui5Wa3BDYwqulZA6NMzBDobU6GMIT/VneOS9I8uzcZNFZnNMCbwx
         6zyQ8l8xOpcyOIBKq+tRxW22X9OArZn014Dca5XBWA7YFtB8VmnmgqKayWicG0wVaox8
         ZbBQdfu9fxiFgEVs7G63t6wIM/cm8CAKiJ78Uj8OlJkntXk0i1HKmCiIrEz08bXp2GsK
         1GRLdAO9zOtQbQkVPSUqOxv6+JNIFYUq0zAbqESIo26oEFX7qOQGv+mD1bsnaXhkEks6
         4iUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762568; x=1789367368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+nobZfwyZD6U2aEzKHUENEfOz31yDjT4kqI9cv2dNhE=;
        b=FX5UjrR1JSzqmuEN87OCwGRSVP+uXlDESYns//ds8ixRwS/RRpkOGpErGbClcBZt/3
         tpYFulbC+8nsb9VuYDEHthjItNqWZnu1/bPtBAljCqix0P/gyriWF+fmHG0NKeMw1ba6
         d5HF3ka7CnwfRn+n9FcOP9P8BSd6TQ4Pu4HIpiJ7kF88+A+NRB2DzyZNiERKvar3aTXY
         AXPkV6PEnKBfHGhMuXy/lgKtZCY+63U1jp8ZOx48WleXOXOnWPqMD+1keKULiRnGyfOf
         AwzpK638HsF/WGNXM0nS6Zp38x34TjXDk9iqCPUy8zbiEsbV08i+/fYACKwPf4gK/CxU
         eGKA==
X-Forwarded-Encrypted: i=1; AKwUvBxVDSQDsOLxmtRo/b6URdP/qpJHguq1OZNC5U81B433wFCoczFXxPdwfx8DXmlK/lLNCm+4QyGEZs4sJSk=@vger.kernel.org
X-Gm-Message-State: AFuF++kRCxlBZdgfNpUjO/iBiJ8tv0FIHLjOqn9FKIpyG18zyDwzIKJR
	BHj/exvxSk5Apiett8C06xEFVWq87uIerDbgQ0H3SRJvcF6IQpd+RYmwaP7WkOajweAT7GkHTfo
	6EH4nWNKFLG2J6lSZJhbozEa7cAWU9Ml2/MUP6XteEKNZU4ReUfmphQU=
X-Gm-Gg: AYBFou10uoS6AHgiu+ttHF9xBtRcDVzjWCye3Yp9T3A8X5LRFWKxLzSClWEM87/s4mj
	JTjsxWvdmFyw++whhYwgdKTo5NWligPKyhSyNeVVY06lTlGDJai61OIai77FeGZM6TTuDDwYy+6
	VLUoswqa/qBrTuBRc+r1QBMIRLGKFv01BY/X7WXqdwNQsq1gf+72dyvb5svDE2CxFhnlGkE1BdV
	sGjp1MXBF70O+mIcASLKZ9X2lpYTxNW32AIPl5jyvm/qRodpP5mb25SCDJS1+A+XRzyU/cfnIXz
	EXUoO0vHSH07QNsMJbRpBWMqrw4Ha1s0a3yoKCDk6eYnBT5K3NzqcjDG0HGWlcSxsQf83ryhCC9
	rIIw=
X-Received: by 2002:a05:620a:3943:b0:937:1097:feb8 with SMTP id
 af79cd13be357-93980426539mr2131110985a.24.1788762568248; Sun, 06 Sep 2026
 23:29:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-acpi-dma-v1-0-0fcc63d65d4b@thegoodpenguin.co.uk>
 <20260904-acpi-dma-v1-3-0fcc63d65d4b@thegoodpenguin.co.uk> <aprZKXi7h1prHZft@SMW015318>
In-Reply-To: <aprZKXi7h1prHZft@SMW015318>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 7 Sep 2026 07:29:17 +0100
X-Gm-Features: AcwNN1UZJqTHPp0gVwDMba9SMPF841uiWsVn6TpoKEJcXyrTZ-unWt9lXJsg64I
Message-ID: <CAA6zWZ+8=sS1JE4JJORYu45xt6B6VWsf9YXBi4okk_2TdJNUuw@mail.gmail.com>
Subject: Re: [PATCH 3/4] dma: qcom: use named initializers for acpi_device_id
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Binbin Zhou <zhoubinbin@loongson.cn>, Sinan Kaya <okaya@kernel.org>, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Remove "While we are at it".  Unify the list ...
>
> and wrap at 75 char, check other patches

Ok thanks - will do this in v2.
