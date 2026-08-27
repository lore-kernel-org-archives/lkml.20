Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17DD3AF66D
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831867; cv=pass; b=AO7XiwZ37rWJ8YrWpqsjzBlWG5fNja5CtCywjYNeRxS+VVD0wxY2SzWOOmh2rkG+sEDKkHyUMLBJKs9mlpfdmoZMSGMg0NzhBNTo7wtCAQhKovd89G66tSYnxNBPtM+8bC8B9AULM/S7xJlOmupL+43sWKXDSjCD7z6Vji9QeSc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831867; c=relaxed/simple;
	bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/thI5RCVYVP/0M/DaCgSM2KYaViYQncyfnFmBz4ylwyt93DHrYwlA12BhW2TrTCf1eGYWpESgbI9BUtqmNPwPnDOOqDssZeX3kYpqT0ppS8FMP4yzhhnb3armV2a2f5bY1rpv22cxPymDGoP/kroiGxKzZHizwjwE4rTut4D7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bw22IXTw; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bw22IXTw"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c20ce3c118aso189867566b.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:57:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787831864; cv=none;
        d=google.com; s=arc-20260327;
        b=FE2t7Kz4KF0p8BDk/0E/tqbkbheiofEFxvOUo36W/1/uacDph3dhsRyI4k2EuvQ/S/
         VCZZ9jfj0Xuh0rLUUKAp+4jPdbCxGPTuQbUcE4aVGJ6hVrWEINMFTtuHyUrZ4v6Uls5T
         28fuiFTm3M+iHu5WfuuoujjEfJ0ttJKg1yIwUk5ZkooSw1sexHQ1eqgnqCrwP7XlhaBJ
         JUR5qTk+7HusrK8mXSzPGMneWHa3Q8+qFTv4sjXvMWsxJW1EfLOAVvrYXB33Tm6C23gZ
         Qk6agX0ZoCTTlHYtaZxUlVn1iayH4hsgEcmTmhiyY/BgcHupO79UYuin6EQ/VlZe//pI
         fppQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        fh=vMIuOV5tLZRfbrJOz/lT4xoqzd/5DQxw9VmvgTXaG6o=;
        b=gwsBq/LDJ+PG5KPlyZqERkm24mRDNInA0pK3KDFiXW0nCLjxt/OURjYXfIm/Oki5Ux
         jLnwF2/TPl8cG1dfuVksWXdBhbEJyI4aVWtjsgaLQ+BWu8UaX2lkjc6cK2q9TSC6/hp7
         jWaocuyZxTtDcFIx8fqr4TUKzNUIKge4PGXcMPInBEf5pVcPrbci7HkfJNZjs4+Hdb0w
         xwxFFheWkfRQ7gbk0gkQMfpMLBeh9wcAR9tb4y+UO7ncBEt52SNObVkzEaeU4ewsOJ9x
         Z0xjYCtbWiHXDdbeloBDCZD1zpAQCkMjXqJIIkMKM2F/ef0vqOE2VDUdVTtuWVpQr8KO
         MawA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787831864; x=1788436664; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=Bw22IXTwgHN75sAceHvrr7MFp/nbbM+A92yH9eFDnMLzb1DvBiaNYIWBWyfjtvm2Ul
         jqhky/f7Djmfld0kEnHwztrBMs+x2vW12DXwliNr8MSRF8/pMSnaLjCE4+W0Hahd7wm9
         4yR9ksktbwqUgvJeBOtT3RjX592+rc6SY/IZjm9tKHJiwyjQs5E5xXiJiG/2rz/I9aEQ
         76T10yeSK9LHsTgO8FE5+v0RdKBwE+JISB6qG4b9ZwA04mkTdZGxgvJaFCBlICPoLKjb
         GG+KH0d9lXUWlpShVFMgtwhN7ZvX/0oAsUHN0/4SneV4aVod5VweF43LzTZxMxxFx4Hy
         XkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787831864; x=1788436664;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6WdDC4sV3epSU/xCoz/N1VgwbDwuBbVuoylTs5Qjj+4=;
        b=JLq/2gdAIhdYNPeAOJXhg5fwRCEOMoEWg9LiAITT9JmRE107rS9VVu5GgKq7VTTNW1
         oM3ASl9QgpmnzHHbNA/llDZPWYRsSbwDpFW4PJM8rpNTZ2UU4SeVHUxDGohXz/zEzG6I
         P5EhB6OhzpeuQFNc3MydsIlzXSHR6swbfQyJQQjDd/xcxwNlRkHq2+bSjRPurCm/YuI/
         QksAdeX2dTHafCkYkth8kEZVOkk0MQvp1CWsQEkEozft9elYkARDr21hS358QvF2nG3+
         IpTHRZpRl+dZIeabRl/gSDxWfbpMwnsNSSx2kGbbuIRynvFKxikdKxuZqaKoxzkGWdrT
         YL1g==
X-Forwarded-Encrypted: i=1; AHgh+RpGZ2ohR5iwDYLL12FzY4ACR9zBaCNHN/NTQuf6iDuovtNVdIkuJhaViFuiHwCHFc/yk717eJ+q289m9xw=@vger.kernel.org
X-Gm-Message-State: AFuF++nJkgFhi82C/qo6p8cNG2Ic9kBGczgD539rP6DNjIWjXh34ZKyb
	L2tCV5KPrFjOZA3zlzin/H/Y+A//0RGvkEdkAdU1Tiuy5gpmY7EEiy/DLH0A5bzXCMt8SH9ltLi
	WcCtsjq8WFkXvE+1arM/b/tqZOTgAiz0=
X-Gm-Gg: AR+sD11x14ar8NFnlbDyQ4ww889nKKLWHiuniAF24Q90SDjhXpGjrIpc2eMjSqv1Zu4
	ydFoYiC7OTiko/03iwC5++PYah5Uvx7xVIZOujN4+UdMX72T/gClWDEEelDiLBX5PV/Ch4CZeDb
	+6+VU0Lg97FP+nYOrQwkpfty43leSAwojWo+G6RfatYOZw2X9V9Jf5ojjZX0h65NHsNnqAobEOV
	qfj/uxk/Gfw8MbdjlgVrhsp8bYiXd45Io1RHiDSVCyItTcSfImXqPc/f60xRrmd63BrPOQ7zKtA
	6NAJClwt3ec/ftE1R4otLMrjohTgSr+uHU2Jiy95O1Q=
X-Received: by 2002:a17:906:4784:b0:c1c:49d9:4c34 with SMTP id
 a640c23a62f3a-c25360ae6f6mr459116966b.11.1787831863644; Thu, 27 Aug 2026
 04:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
In-Reply-To: <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 13:57:32 +0200
X-Gm-Features: AcwNN1X9AttqB8t1bj6TQbgbNwwMvZ74IM7YuKbj9WRorR3Nx4t8S9M-g6F42ms
Message-ID: <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> > Then these bits stay as is in DTS but bindings header is not needed. You
> > can have of course DTS header, as we did in the past multiple times for
> > such hardware constants.
>
> So I wrote above this to myself and can be ignored completely? Then why
> would we not ignore your patches?

I am sorry, I'm definitely not ignoring reviews and I'm actually
trying to understand and fix my mistakes.
This reply refers to v3, but in v4 you reviewed earlier today I added
reset table support in the driver, therefore in v4 those constants are
IDs instead of bits (and it should help cleanup the other MediaTek
existing bindings if deemed necessary).
If they're IDs that describe actual hardware capabilities, shouldn't
they be located under devicetree/? (Again, I understood my mistake in
v3, but in v4 it should be fixed).

I feel like I am missing something that's very clear to experienced
kernel devs about the boundary between kernel sources and device
trees, but I can't seem to figure out what exactly. I'll try reading
the kernel docs again.

Thank you for your time and patience.
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
