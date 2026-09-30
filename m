Received: from mail-oo2-f40.google.com (mail-oo2-f40.google.com [74.125.231.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61724BF92A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.231.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790768132; cv=pass; b=Gl4dr0279DU/uZ+MTABQ3SY4JLG2aWFxAK0aQVJ9bjfMtYdVN2+E/ntewcAcbOowHPHvhNcdlBzL+z4qU3OES0UyYlLrQfbmU11Z4yBewKucoo+TCuihgr/SHsloIA6yoAMKj1IaGEYMDd7LN2EV9W5rYp3/ruiw9m8/S61kUdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790768132; c=relaxed/simple;
	bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDv9vkV6URRf0Db5NL9jxXDh66RQkuZhr34Lvr8FxTUn4s5QoJoyuQV6clTHqyzTyJaKkuAz3NpSSwOcgEPfnmrrETyb8bdJrqiEjtBZcHBtePC9Y4I7iNV0GwGrqUekck19gG7qbm9ejhOBhhlCktJFczY0leg11VLfHtIeMH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HdddWs63; arc=pass smtp.client-ip=74.125.231.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HdddWs63"
Received: by mail-oo2-f40.google.com with SMTP id 006d021491bc7-6c2613d80fbso3123296eaf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:35:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790768129; cv=none;
        d=google.com; s=arc-20260327;
        b=A/UTPey8lodb+Ovl6tTiZ22GcXex/RptIKnaeeEk8plccnCUFXBLaEn0HJdjqgUlE6
         l0lECPR96Y7o08Uvr0YgCE/U3SrOJy1E7bnKh45gE91qhQKCE6uQqfZloTcJB3BhU621
         2KFobaVo7PoLpfVvoZGhL33OQBXHm5A7DL2fGL75XqW8GAQ++V2oY+jlTjx/1uyhYA1e
         sEeNR/Z4TL8RhUc59fE+3U0wrI0yQ+yw83gjipnR+cMs77b5SfGcmfasM4uqJsiKY0ws
         vvbdarUQkRcnn/EN2rCx0wDNCMzAjmCsZF4wQdRbDuBMpUanu/UgdmuP5FcgYNh81I0l
         9+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
        fh=PoYK9nxLBJf+9btWBUFtgpvT0/Kgd33Q3gaGxR/sksE=;
        b=YdIdcIxL5B5kk4Zft93v7cBdslBZkAdUC3c7AlVa8AMUsAQHDJg4spNXQ1JJaRNbtt
         JA9Uxt4RRFbhMbH02XbprKAG8rmK2aDjgc1DK9FSZcIXWT7cDmbn+6NYTfBvTgQSHYGk
         ORJ12Ee5m7gRloEGKeoXJu22OLlW7m/wKRgj6uBRS71M8+p7C6NoTnuC8U9/B/0M5c6p
         CZvWTh+Q7m/zjS8v3e5Jr4ixp1s3CA+5k+w+ehKFXLpkzyCd5v5aNwYrxXUavwvZHOmP
         y4tO9GFrudcpUHYsGewdep0CrJOQqzpi0Tky9Tl5Dp2H6ktZNA7WqZXkcN3hWQAt0WxH
         iTkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790768129; x=1791372929; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
        b=HdddWs632Rj73PqM+qaWPqerAlxbkA7jCCfT7PyN/fSPH1zqNwLYIKTgFVXaFuTVos
         fmotyEKoR1KMjKh/1NJZw1q15XRCC2EA/H+yJeI3s2OO0JHmZLcSrghRoF3qSPzV9s/i
         p5wfiklKsQtDW42GxqF0XoCTj+lTpui3g+0v/7GtDZ6Hfc1Da/CdWrBHYSo0RyHal+oI
         pGzo64gUftbPOBmyLIlELJ8dcJSlTuG96KZlA2ydJEWfkjGWkGlfIab7de+7aKRuRbGv
         rD3gQ8k/0KqJ2t7+Phaa5wAyT1BwWqmqFpmZ3wf25AZyGvtZSfo/l8EbI2L4ImTo22hk
         G6yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790768129; x=1791372929;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ai/Jf8BwEUO5H8StrVs1vR9aM5EMKcYU9MwuHF4t1kQ=;
        b=ve5pJ0EreTJKLZ4vGDXMO6sIVMWWWbGe2gPPg2/jQ1HO6hKZaVKQ4rMFRNZcg4zwDQ
         qbSezNx8RqcyS5Qe7I6qdZABGYjokIMx9aBcQbME+5rYYYLCwD7MZOCgdf6l9QJpPBLS
         iuz2RC0wtEa9kDxUm5hZze3huDdZkte5ZReoYK7GaMV616MiiYB74ojB7gcGfZuOS5ov
         B3V8P2SyUHt5zW/H+uj/9qkchDDjRMqe4jVzk+YN1itm+DNz4RouoIjtIUOj6rjMFrud
         owBSLPumNPu/rxUNgk5AvQO1YRBcM6JC3xvywwhgU0MJOQQ8OaKDqJki23ywYmxUgCky
         yLIQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNy86bWe4UdZDiXGpHEtt901r8UEViDoCoU6enmQFMQjrrEK8UPN8MQ3xCLf3AFMab9OOVPq355a4Hw6s=@vger.kernel.org
X-Gm-Message-State: AFuF++lZoKrnme+svlip0d2908A5p47htJeVlaD5UaFfx3bvXcH+bEZd
	AFdKRrmhSdJUPBC8RQJY/r3PyYO82zm6Wz81FUTLbmQqkehgHJYJSOBT7a7IcUt6PjeMlrF7ozw
	bVvHM10jx70NeSSAI4moRe1H3YZiPf3o=
X-Gm-Gg: AYBFou0JA3Dj/lfqj4DDGv9Ub++XaehKQL1t4YDH/4H2S8bkyhn1hyS0d874enuqMHB
	lKkPpGzmrzkrT+Re3Q77WNUFVvLY4yRy7aFQZkR9HMhxF3ubtmFWX/SiGzOMRV4jfjab5tgzqOg
	c+Zg+8qzZDw1DrugDi85aIi5TMb3kg2j/WNlnN3AwPRTKc7Jb+fsa4cVy1ytBlVSNxrSvWHVUS+
	TKHw6IVp+fBM+WC63muSXnqPx/aeU08+CiiasQQ+vJo+AVnWXPg8VOLDSYInXHDRAy8TSFexXRN
	iaA/3YdqxV3cbV9+YAnuR8XJ2i8gjyWYuha47VzYlUDY36vbQLrGurGUNw==
X-Received: by 2002:a05:6820:4df3:b0:6ae:8fc0:dbaf with SMTP id
 006d021491bc7-6dcf1fa7093mr1040549eaf.1.1790768129547; Wed, 30 Sep 2026
 04:35:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929184900.39515-1-abdelnasserhussein11@gmail.com>
 <20260929184900.39515-3-abdelnasserhussein11@gmail.com> <20260930085640.00000377@gmail.com>
In-Reply-To: <20260930085640.00000377@gmail.com>
From: nasser <abdelnasserhussein11@gmail.com>
Date: Wed, 30 Sep 2026 14:35:18 +0300
X-Gm-Features: AclHuK8untSyrCd6-KRO0IrW6AMVzxM1NtGbJFcEt_bom4eFkclVEvnnxJY74KM
Message-ID: <CANpqX3bDL-C_w1ttuarPyUvOysCPYOsoLMS6Ri24oFnYmzjOVw@mail.gmail.com>
Subject: Re: [PATCH 2/3] staging: iio: accel: adis16203: add missing
 spi_device_id table
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: jic23@kernel.org, gregkh@linuxfoundation.org, nuno.sa@analog.com, 
	Michael.Hennerich@analog.com, dlechner@baylibre.com, andy@kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, error27@gmail.com, narcisaanamaria12@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Joshua,

Thank you for taking the time to review this.

> No need for mod_devicetable.h, this is imported using spi.h
> C99 initializers please.
> Additionally, you should delete the MODULE_ALIAS("spi:adis16203") line.

I will drop the unnecessary header, update the spi_device_id array to
use C99 initializers, and remove the redundant MODULE_ALIAS in the
upcoming v2.

Best regards,
Abdelnasser
