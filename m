Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792960659;
	b=z1BJnWFWSgjTmPx5un+DYYbR1BeacTfOAKlPwH4zQsM28r+dwgEvR6fmeJVN5RrSE83H
	 5n/7GUI8rN3OArZCZFvwx84FsPNw8Y+nV5vySfDrEl9sG9N7gIsK4Dvd9cfGbUgYG0kcC
	 Dp3GFdyNAPSssxKNzZp8rQ6rYwhuvkDVqAXSAd5qyFZd6jMqpTpxN97Rgiz/aBrVL8juo
	 miJpOY5xJcoCyuEM0d7ZJ/KqMZYVxA7wDKoQM++8+VelFT2rf0Mei+L+Fnx4syDOI1Lkm
	 tCdGkIZHFzpNDCpWfve17W1nalyBoZcP0ys3tfxNw+bxEks+aXIvWiejQxj3PMq723Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792960659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=PlSoCgfZlJoJONbpF7eAC0swlGll9EuLKZNtFVx8kFY=;
	b=Rhu38Sh7PoY4X7Skbd8c+G9DXXCoYCQi1hfyBCSh0whkEgXEWcTrYvnJyfKRvi1JtlpB
	 Mru1KLLWIrb8f8f8LDOmGs+lQr/j+BStb6rpfDSCSYF45u1+tp1d6PwmeV65i397zOxzh
	 nW8EKaPL0gimpX+WEb0Hb5tbjTjt/zC3aoW/kXkLGxLBDr0jfz1RXpuH9/6EUSo6jeQY5
	 BOlMgiWRWprygQgMlFDYZMx9Zf/pRpiW9IaacjJFJZHEpVgStKLnmP/nsii1HfwDpibgR
	 rbLJUC9hAklfwd2UcZXZL5yEOfwLQG55OlJyDqsjAJuFZ/nOWWGXhtmU4szN38bkh2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sIrHI2r4;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A712606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:37:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A712606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=sIrHI2r4
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4163558a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 13:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792960657; x=1793565457; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlSoCgfZlJoJONbpF7eAC0swlGll9EuLKZNtFVx8kFY=;
        b=sIrHI2r4IV8xPByba3hYp1R2EYUFnxRGVkulGhm9zb/Jf37VgwwUgOrjQwkuave9Ol
         mGNnib2bM3hzA7nHquurCIQ5BIE/czH4jb4AT8wYTT7j2LDk26kYUD58mFNq07DD6Oi7
         Cf0t/yg6NhwuowvcW5Jsg2qf0mqFQAwJoyEA5N1/RWPMw7fO+PwsJ15IEQlgZPM754Ir
         cjE7BgLBadpA/YbPsXai7ZKxvuAbA6njvuh59ctI+bR+FSP/l73n7mNUEgg+SzocrAli
         N1N2bFY1S0i/ft0ge2+7GVmp/fV2Tp0XTZkmy/9e1gdm4tX79Kt1zVeQ78qZjXay2Y2p
         X7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792960657; x=1793565457;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlSoCgfZlJoJONbpF7eAC0swlGll9EuLKZNtFVx8kFY=;
        b=DU0Rl47UBlniDknM4P+FY+mio48Np7FuFaHRUccPdptVdJx+vsXg0gShyRaDONV8Cu
         URomL8oSdB1/OEtSldiqTz4rXgEYACFr/ILoTztWNhqhcdPYghzaXV3MRLEoyWrk13tC
         /XTB0AjSqeJVq3OEjasueV6HhGssK8D6YyIOdphY8SUtnqSQEbCo9W9ig/ayzj/jTOLO
         d3PXlAuthy6mqiCbMCDA8tUzv5kDuG0PvSUaiC/xSaECFljrGF8sxBfXICcs2UB0yDbu
         WFAxa+GhK5/vBDNkDC6DvgTONRk4NVRB5aGr6E1oc5SEPJiUKGkroV7IgoXNmvLemtkj
         4NOA==
X-Forwarded-Encrypted: i=1; AKwUvBxXxEVRUgsXeH6SQDObLATf2CXFVGc6QxCdatdTbxpP2mmJTF/mXjDSdJ1OEWwNSEaO2/pRUPe6Cp2KZgw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnJwbR7hSHBmFSDaDRdetyRA1g6CW3Ay1xz6Q3vCz+twbJY/JY
	QpYWShKRtTw9aeLNiGBfCSN4kMYWhEO1Ps8dmgLJll18S9WM0T9DD2sX
X-Gm-Gg: AYBFou2XC4ovWdFJde3IURYVC6pJLdxsIhiZlVXHkvAmKsk/dlL96lwoHGC02kCtoCD
	09KkLw75prvvjUkLiVdUCAW2wyof7XcuFE0jK5vXoTMvtd0KQOqAC7PjNB5Rrs5ZFX28GhiXKf0
	hH7mv0ck/wMwUiVN04nB7z97zYfycyNjJLOXDxperA93HyunFiJivomIcm9reFp81O92IfKUgy5
	TDMT1ygnfOptVUN0LGRyBc9BGPiiwBiKAUP2sQWFXUoy7tztV+0pqmTnbK91iqpBPl0uad3yM0W
	M9pXIasFKPeTPWXHr3uhJl55jMT+92Fef3gnNh/eNDm9+CT1U1y94eGipc9RTvgqWqv5hIge08I
	hjTgisZhIvk9ALriSRCQs5mAGSCq6b+I+B0tTGDx6MBgJwS6H0eD8LlXUXBRl6aiQT6OdEku3Dc
	/iSgmVbcelRxPaw3ABYdTVntDe87NzcXZ0xuuhZhFjLU1A64r7i/uRIc1MRUz1TsPURkYKPgrDq
	hNaIZ9sC9gEHtljpGkdQuATcGEUZ/IgN5iAAo/sLEIL77Fl/MpKb4iSvl2azF+PL+JN6QZxWVig
	xFE/H1VfC0lvt8zf1oC//ZupRqNsD2DpTc6s5Vz+etX+Hp1kPeuFt3hnc0UAh9HN1B7vxLOmo0T
	7UmHCUxExPgkoaOFj2Gsgp89/yF3UzEOWTyGZjrU0J2j9
X-Received: by 2002:a05:6402:4008:b0:6b4:5d8c:95e2 with SMTP id 4fb4d7f45d1cf-6b45d8c97c7mr3366886a12.4.1792960656746;
        Sun, 25 Oct 2026 13:37:36 -0700 (PDT)
Received: from localhost ([2605:59c1:3500:c210:a19e:c679:44e8:e9a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4458dd28fsm2693713a12.3.2026.10.25.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 13:37:36 -0700 (PDT)
Date: Sun, 25 Oct 2026 22:37:33 +0200
Message-ID: <e16c174c12a32614e0f6cf08301d344e@gmail.com>
From: Selby Mashiki <mashikiselby@gmail.com>
To: Sunil Goutham <sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Selby Mashiki <mashikiselby@gmail.com>
Subject: Re: [PATCH] net: thunderx: fix fwnode_handle leak in bgx_init_of_phy()
In-Reply-To: <20261025203159.455100-1-mashikiselby@gmail.com>
References: <20261025203159.455100-1-mashikiselby@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Here is the additional information requested by the bot:

- Discovery: Found via a static analysis script scanning for
  device_for_each_child_node() / fwnode_for_each_child_node() loops that
  exit early without releasing the child fwnode_handle reference,
  followed by manual code inspection.
- Triggered vs. theoretical: Theoretical (found by static analysis and
  code inspection, not triggered at runtime).
- Hardware testing: Compile-tested only (-Werror); not tested on real
  Cavium ThunderX hardware as I do not have access to the device.

Best regards,
Selby Mashiki
