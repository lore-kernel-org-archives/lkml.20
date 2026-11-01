Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793519163;
	b=IduMn9aau28HieehsCv4uc2UxnJIVloNk8bNdeyrUC45cYEiXiyxmponDzWRK73udX1/
	 njXVj1Ms41StAst8dFqEnjRxf+u5LQPXaqbDO7SYid7dw5NJz19lJgwBYl+uKY2Wyjm5d
	 afPLYjEcvRPWn8wVAcnSwlDqNDy+dX9EimEFVg/iejaErNSlpgqKDnxsLd2E3CW7toGke
	 hXmsgnwbZIO3bO3wkHknCvHdBD/CAXgCiTbcfYI/7VL8Tu+g6VsZLQflcIbRusni5Wnp9
	 BNTgKwly/TFba03b3UBHU6KZzqrwesBU95qStHUj41cLrlIPYtBuwVCWPcLvPkVKnRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793519163;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SAR00vszMy7Oo8d4FC1bVF4Fi2pxCcoHYlztJt6Lr9s=;
	b=f70YZTDN7YP0cgIlVnyIxSyL9hzcWL7lOY2VRv0an5cPIeZawIaOSPXKEjHwhnJb1Tfs
	 GxYoKxsYbV/APW2n+RvpU+xnOlOpZAjYICndDUwq8j+P0MWgqA5fjxydLcj3qRJS8A0EB
	 whQ5FBDXRkNXYvaDQ64wiZ3p6/Eoesap9UpnkjL6hSlT1XtOqknYBzrjOYd4+st8wVfeS
	 4myXA12Dv6YgUgU7gl/FxsC5mo6McByL/YqH2ojjdu7UwqoQGnb/4/WONovN/VvcJv/92
	 0ezKNqJPg6p7eLqscAYJxEvbvM++oGmFm09Dt4d9dQhJIkSFSLS4Z1SUyv7KrRqrmLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VRK6u/rG";
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830AC606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:46:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 830AC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VRK6u/rG
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so2500054eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793519162; x=1794123962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SAR00vszMy7Oo8d4FC1bVF4Fi2pxCcoHYlztJt6Lr9s=;
        b=VRK6u/rGWl+iWQBWtPoSfwsH4iYy/wckEhB4cNLAeRElbupKkNN6SFHTATwzvhkoCC
         j+aeCJ3s4CUCUG8nZxCzuQCjitQCYD0NljeYZq3pKGDld+7dm+Kr6sOzXv2Pb+lHuvIu
         ywTWGHkvUJdVo5PYCIhFjPpOqPnl1BDgyFcWpgeBMiZHvBU7UfnyjF0csD3fy+u3wz8u
         e6Z5J7+1tR4vfUAL6YDsyAXJLIXUHmHXaRATLoHLbEWocm4CdM5K7pmTsEM/LYAy4JWb
         kr19gZFthfT+5QNjKVO0aAlDSEoP8j9tFURACZyLhSKrtUyUeTJ3Hff018ljzysZiALR
         O03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793519162; x=1794123962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SAR00vszMy7Oo8d4FC1bVF4Fi2pxCcoHYlztJt6Lr9s=;
        b=Eq6Zw0Ezrnt+71C8nLF+4XvEYLEHYLm7JIupGb8cd6Xj7fHZzBjJGbi/K7MZxhLDDo
         xpBmnn1KBkhgtiR12/P2yRYlxIuVBIpn8Qr9Za680lm4s7iOnbDfXIA3qwLjAeJqb9ZT
         9glru2Z6kMkvIgRujMeKrUuK/6EWA1VplyTAWqAEPBp5ZpmhJb3xT1OsnXvyKyrB12y7
         5IA1A2tw0d/ZfRQql1shSxF5c5v7xoWJULiZ0aCnJJ5u8gxBM4piEwGZfbo3vZu5yrzB
         usxGqsiOQFfpQXOdly5DR06UZDdee+AT1J/4Vje1l3+/MkRArCuzMilCfTD11/6mC2ii
         KJ2g==
X-Forwarded-Encrypted: i=1; AKwUvBwDkuIIXgz/iHUE0/bC1PIUz4g8SPdpcIeUylj2rVxJmOP06fIh+pfU1MzTfRDAqoR0OgjqOE9aY9yPqmA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XOrfj2hSDtWeW4j0ejjfmUtrMiIqaKFZSQcBnjU87gFOaiZiK
	9Rv4zAWsflKFTPym+i7l4wjElZe0v0VhnSriuJ85nj+PiUycMIKp8EFI
X-Gm-Gg: AYBFou0AxTVyOVDSNr5FV1StFdf2YO7U+2uXWv4joGelLfKBqMai3pFPnWMvvwWFVMW
	yQHpJEqN/8WC9/QzdrYQfjreBnOT0zDao1rBwPo+J8bzHqOhIaTl/6tyYE8oTkrpWHxGjYmrWbN
	rlqfm7s9D3VA2nqo+J8D1jx1KGew3BqWKYQHPWYLee63zh23zuf4+pUJ7mcONlOMB1stI2ZJhx7
	KA6+z92xnpTfdmPmZvY3AZr6MsIt9X6fP5q45AShFoUBWt0XvfsEOTkfDGAzP42g2JBOwR4e+xh
	wy5lv7VSb6u4BEFAkW2ExXyA9lBr5geHg1hpat5VhdhHEQ5va4PLng0noy+CwrojjOja1cN+sTC
	DGX7Ush2r0h92tTr7Bt7rDc0G6yJP/HhA7KB6DQUQTLZXcYjquWixXxesdVOB34ZsjhzkCOSn6w
	ErD0lM+0R7edVqDvNnAzO1ZzawRKy4N3BS4aj7exbCvcN1J7M1fFZC9+ADBdtrVRRPUmjNgGeOD
	pbUvX2/Z11R+Of7x21HEEXFLVgBOLEQ5HTbsAO7xPcq+poFtkYcZ3WE11JF8OgiO3AfcKvCuX/I
	qDKtyvCZR/lZ7/oAiGPC3PiN8WOp94K8tYraq6Dl
X-Received: by 2002:a05:7300:fe86:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-36a42400c6amr10962673eec.31.1793519162483;
        Sun, 01 Nov 2026 00:46:02 -0700 (PDT)
Received: from arch.localdomain ([152.175.67.103])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42662f23sm28414684eec.2.2026.11.01.00.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 00:46:02 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jerrysteve1101@gmail.com
Cc: Laurent.pinchart@ideasonboard.com,
	airlied@gmail.com,
	andrzej.hajda@intel.com,
	damon.ding@rock-chips.com,
	dri-devel@lists.freedesktop.org,
	heiko@sntech.de,
	jernej.skrabec@gmail.com,
	jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	luca.ceresoli@bootlin.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH v2 RESEND] drm/bridge: analogix_dp: use devm_phy_optional_get() for the DP PHY
Date: Sun,  1 Nov 2026 15:45:51 +0800
Message-ID: <20261101074551.263631-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261013134659.335829-1-jerrysteve1101@gmail.com>
References: <20261013134659.335829-1-jerrysteve1101@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

Gentle ping - three weeks on the list without comments:

https://lore.kernel.org/dri-devel/20261013134659.335829-1-jerrysteve1101@gmail.com/

It makes the DP PHY optional, as needed by the RK3288/RK3399 built-in
PHY, and drops the misleading "no DP phy configured" error at probe.  It
has a Reviewed-by from Damon Ding and applies cleanly on drm-next.

Anything else you would like changed, or can it be picked up?

Thanks,
Jun Yan
