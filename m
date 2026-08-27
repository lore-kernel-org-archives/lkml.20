Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41373812C2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787805496; cv=none; b=Gf6kGOVxOBpuKio5zEUQb+6eWvsn5P9yl/ROca3jRJ6S41RLrIXvHJp6mTb3FZABGyvi3zZg6gFFJKNHMDe7CGSn7hjPuwtJvbeumhQT3ItowNRTz9fw5K/ZpFU7Kca5X6IKeZk9uIuOl6LN73T+8B3fJLRr4WJ+2WC+R5WxqM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787805496; c=relaxed/simple;
	bh=0P+Ppehm+2rMxkEV+1Euuypk94PflIXQ90MtgsW7QNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QpVxAvtf/UfZJNlkhNr8kxiKx3p6FQ/VBANF7u4t6IUZnt1PUqQSKLddtCKPscPiNc6XMrdN3JNLYybUK76mMd8TWQyRsaHMH9peueefQSmMt8JBnTjWi0cNgoeipCy3CZ1GWjDfOIWH3S7oWosAwM1Wjg7t4QAh9+NDtSvFN9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANXRAwja; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANXRAwja"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso467899a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787805494; x=1788410294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0P+Ppehm+2rMxkEV+1Euuypk94PflIXQ90MtgsW7QNE=;
        b=ANXRAwja2tPvK/Lmozql6U9jtUI8WKVTpz5dr0cqfuy+MMN11iGJwcuhGk4hh/guma
         /8imGq/AfwincljYvn+NWp5QX6AoWJqoyMUMfNyXPVdRUWuXYEEwzDRx1E5xuIva79jR
         m2pTsYPeet7fSJAVAtBL+moHhDnMXu5+/HcINAzAohPeRaHZcReBN4/qSFSLY2/Ox8P1
         JaBC1cCF+J+LVlCUeLDn+LuYedX8cbfLE+00D4KDKnV2ZTm68UtjUIeDQAWgKi6Na/XW
         osYrWcy8AJx06h5OrNbEMqe9qrEZ5RvqDgB1eZuSRczHXo/YwXmperkDWAEW4oEm0gsM
         vS+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787805494; x=1788410294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0P+Ppehm+2rMxkEV+1Euuypk94PflIXQ90MtgsW7QNE=;
        b=LSHiGXB9b7rH625xCWqVTdDDNCSgo2XG8jnSRWhX5MbfnWR066/VsBunRGEdq2rNW6
         ZdwNjN2jVQyyXE4qY88AXIw8Sv3aE+G1dUe12MiLvd7L2zvSMOoRTpoD70+ePh+Z+K41
         PnHpqj2mIaeX88gC1Xtk9QCM6EASs3+PVVlUjCd3Sr5QnvAUtoxTZjkg6NNrAU96uEhy
         1k4X6SozGYBHlTGYciTalssMVTO2uARPTc94YouKYNEBxB2PIuGDM6nbTBrzlaoxcADJ
         AktLLIN55bJQqFcopcUnuPa9RZdzWJs+TzOiu9IAp4XPGy2WNfeVQaUIj5ZBncUxcpab
         sJlQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdazbYeoCbBqIMfpeI+QCHdX/hH9TQlris5blka7JCMCedunDkO36eeSSI01WHoStfZhTN7lRyJ9X3SNI=@vger.kernel.org
X-Gm-Message-State: AFuF++nOj4518u9wB7KGOcONjjOQ5Rj1MDjATpwP17fJVZMhGSNPBIRt
	nL9y3Ue0v/rZEwRc7R+iwibSN0tFuUzPJK/Kx3nWU22toYZeA9wqYVyy
X-Gm-Gg: AR+sD13mxjsH2RGslJfJ8/ZeHrIm1weCZT1hN10Ab+p4hz+kG7muYlAG6wU9djbeLKh
	zsrAJHb5gpfhvDHxDQzNEGKMLR4bkmd9CZFYVuGi2ONd9oDiXBKyx3dqsdZYhiRY61I+7Q4oTBl
	5BIJ0cu28sX1p2S2r+wh01w/6jaBS9X7jOidCLscU+be5ooSdmZ9w+wVbtHlXizsd0nCGMJNCXj
	zbumalmd7N5h9/7x3wUpl28priJRX57XHJ/tbFlDmULEWKwu0tIieg6Ye5sodbII0CTsmzDoXp+
	m+b3CdxpT2q4HZaN0UJyaj483eKDZ6B1GhJ9Czl6ahpoMqniUZ1kEMpQS74+EDXXgSuMWkaphDU
	y5wUSrwYoi904xLjg4Rejj5vOxdNMRdO+pHvKcREegysMA/0F7IwhS/0OOVI43+TFs88qtCoWHj
	IPtCJfJ3qWdk4Q0m+21N9O3J3MJ1j5iCUt1RFPfdt1Xw58f+fz7u5+yy4UjPvjRvYCzA==
X-Received: by 2002:a17:90b:35d1:b0:396:65b3:c05e with SMTP id 98e67ed59e1d1-3969bb1e82bmr5197069a91.9.1787805494011;
        Wed, 26 Aug 2026 21:38:14 -0700 (PDT)
Received: from Default ([2409:40f4:1012:4330:756d:2890:a615:2db9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3285f3cd3b0sm118260eec.12.2026.08.26.21.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:38:13 -0700 (PDT)
From: Jeffin Philip <jeffinphilip14@gmail.com>
To: jeffinphilip14@gmail.com
Cc: balbi@ti.com,
	bigeasy@linutronix.de,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	stable@vger.kernel.org,
	syzbot+fd6ef980cf1c722be639@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: fix null pointer dereference in usb_put_function_instance()
Date: Thu, 27 Aug 2026 10:07:46 +0530
Message-ID: <20260827043746.13087-1-jeffinphilip14@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816061712.15547-1-jeffinphilip14@gmail.com>
References: <20260816061712.15547-1-jeffinphilip14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 16 Aug 2026 11:47:12 +0530, Jeffin Philip wrote:

>usb_put_function_instance() attempts to dereference fd inside fi struct
>to get mod in uvc_alloc_inst() error path. However, fd is not allocated
>until later in try_get_usb_function_instance() after allocating fi in
>uvc_alloc_inst() and thus guranteed to be null in error path. Fix this
>by adding a null check for fi->fd that returns if fd is null.

Friendly ping, let me know if you want me to fix anything.

Thanks.
Jeffin.
