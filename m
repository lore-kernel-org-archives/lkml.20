Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8C42F5498
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244436; cv=none; b=C7YctrYzb+WcjlJrwxvlFh52edWs3G/tEgakFvehsTcwsUKLBd1oWKxzbmPtSHvEWjFXci1XPnd1yrslnNONWKb6xigHzpwL/aMPpGHajHKB6Ojp3KAJ5CsCPMjkY/SxR3yLv/+iRiwWygQQGVh1sJamP3YHlNtSOtuiNODs1WY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244436; c=relaxed/simple;
	bh=SKiKdv5J0a9yKd1F/BXWfqXIuTSXai4BQt2mltfVBVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YEmo4UUU6u533DRzcPpQv95c846xc+7VZ/lP1l0aOArdDNxi8mBndCZN7U8pTBm9JL2oAynvDsh5kuwrFxttwJFYEQjLmZ7MdPsx/ec5KcCVrTE3elM3UgOcsdYRvJDZ1VQUOq1NJiCrpCpaZ3+Z+0qvUIHZkZf0WgBsAQ1s3eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuXifJc4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuXifJc4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso49644555e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788244433; x=1788849233; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC4Jgo3RleAZFIkAun3yFJqVYOX6VIQqPfa9Zm+C37M=;
        b=HuXifJc4wpBBKBpN4el+2b2KEIPMzSGZO3F9HUkhhBq4b/nfLUAUR07xxg29QFc07C
         KpgsbPvI5Uf2T5dSvj4SrvH7lqtXVAy4Hew7tr5J8tMFiWH6ZWbYSffYraaGkeqV+35u
         dVLj90QWJF1gOKK8ZEEaH7qkR0+Ea/fQ9ThPGaBqVGOOc4CkzxF4rMuF5KrPh8ij0pIp
         22GZd914TyZ5TsiQOzyFRlAwvSYbjap5C0DcXmuYTHuNh24mKayt5r3m/zSWrpvtqVg4
         fDIJCKrFmmJicgE6hRUAIP+RaF+eXt11X6nb1xDrsXDDwJsl++SZ0qqqWLiusaduQiWg
         vuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788244433; x=1788849233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC4Jgo3RleAZFIkAun3yFJqVYOX6VIQqPfa9Zm+C37M=;
        b=j6c7YPREONNDESrDsCTFK7zf+A9SsWP9cG70ASCUOy+pBNYnSvk/+v/Hn/QLbwM70G
         UmVZDC2FwKcstzVN8bC9UqLPhFbYY7/uGEsFYlX1csxI7cET8k8RKMairT75PVEUAXi4
         nGxAXJC0+IZtekzi3z6g7PxrKCXXWPZmP+Xb6Ot800cfSGaTN1StRh4IPhjLBrKjNdkj
         uIpC1OOBYF5mEKpTjR4uuTTYXI1B9+rW1+Bf4P0FUUeib6dbLH/7RQff6PZ314kvPMZc
         wWJQ8jadxEoy2b9A4ZV7ShtXpwI2vOxt4guHPcWEG73ppJwgVDahDEWH4Jx8wX1PWXDJ
         jGWQ==
X-Forwarded-Encrypted: i=1; AHgh+RqW5xwGxyF4LJ62Wo421M/1GpQfyD0qJBebiRdYBTc15r9NNuFBuRJUjgODpxglDPdhxB0aZVq39E6NhZw=@vger.kernel.org
X-Gm-Message-State: AFuF++kR8LxepH2mZl24QLPkDwzSg4VxGWu9/w8fG8mKG9wy9XycXvxV
	YbPa6dXegc9Xz5aXSt7hEAk13RXjmbBjcC1nfAvOXQoHBm6zgXilVlw=
X-Gm-Gg: AR+sD12/xuZLu24Q3+qFrB3gfSspUK9vQ2t/+g+KRRzlyl6VOjcJuMiW8p6jBIt/ABt
	XYHyAQf2sCJjgGNZ5jPCwY+HJRllfuFjr4UilLcMKJo1N9z3B9vB9g2xZ7L02HlkqAsAZ/BBzaR
	4us8vr7pOHUvG8bhPLPvha0od33SIP3tRSHoFZ9gcsVY5ic4kB7sfTWbq7SBxy5HhOeVBC33vy0
	4TvE76TDBxmFb2ASTcNwW2TTt6lQt51Uocy7V49NsjybOb3PmI6zeopr334jN4qQhzcbX+ULFK1
	adZjJZOem9Cghq/RHbgwdq/cPEmJq6/6MMn4wTwkFawJO67LUSxdiBLWOIgvyYL5DL0Tmhv8/M7
	NTHcOVsXdACGhRKqBLqi6JzX2PeDmvPuMI8jATom1+4s7GVLwTmsLSkWsU4I5V3CcchjJehH+WC
	zxOA4IcwVO1dFTjOhYxWW3FRy+wxJ3Jb4WzHAbCI++4iVTdzT1M3x1oA9/ZyGcZENI2ZqePtoAc
	sa4tPSB78fBvcTq6rzZZLCMSJSiJYhbetjeoTy+PIDY
X-Received: by 2002:a05:600c:4747:b0:499:dbba:9859 with SMTP id 5b1f17b1804b1-49cdc57bf3emr86849635e9.5.1788244433013;
        Mon, 31 Aug 2026 23:33:53 -0700 (PDT)
Received: from surface.. (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce11e0fsm43331585e9.9.2026.08.31.23.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 23:33:52 -0700 (PDT)
From: "D. Manresa" <dmanresa@gmail.com>
To: Jakob Berg Jespersen <dev@berg.pm>
Cc: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"D . Manresa" <dmanresa@gmail.com>
Subject: Re: [PATCH v2] platform/x86: int3472: map the ov7251 power enable GPIO to "vdda"
Date: Tue,  1 Sep 2026 08:33:51 +0200
Message-ID: <20260901063351.67231-1-dmanresa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
References: <20260831102306.36610-1-dmanresa@gmail.com> <9bjLpqRXj6Hx0eSwnrfYfzQUL9rQwcxzb7uzDdMDhfQUkXmd8vUjOYrWOWHduP7IUZ8rtmnsUxIzX5E3CLVGfXCylvdrZYdmJhkX-O24aT4=@berg.pm>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 31 Aug 2026, Jakob Berg Jespersen wrote:
> Tested-by: Jakob Berg Jespersen <dev@berg.pm> # Surface Pro 7+, probe/power-on

Thanks for the quick test!

> 0x009e0903 is V4L2_CID_ANALOGUE_GAIN, and the in-tree ov7251 registers
> V4L2_CID_GAIN instead, so only the front and rear cameras get
> enumerated.
> [...]
> Did you have something equivalent downstream? Happy to send it to you
> or to the list if it would help.

Yes - and so does everyone else, independently, which is the strongest
possible argument for sending it to the list. The linux-surface patchset has
carried exactly that two-line change since 2023: "media: i2c: Clarify that
gain is Analogue gain in OV7251", by Dan Scally (on Cc), in
patches/6.19/0013-cameras.patch. It was never submitted to mainline. Last
week a Fedora user rediscovered the same fix from scratch on another Surface
Pro 7+ (linux-surface PR #2252), and now you make the third. Since libcamera
hard-requires V4L2_CID_ANALOGUE_GAIN, mainline ov7251 is unusable with
libcamera on every machine until this lands.

Dan, it is your patch - would you like to send it upstream yourself? If you
would rather not, either of us can, with your authorship preserved.

> I should say I have not got a usable image out of it here yet: Frames
> come through at the right size and rate, but the content is saturated
> white, and the sensor's own test pattern does not come through either.

That is almost certainly not the sensor: it matches, symptom for symptom, the
IPU6 CSI-2 receiver desynchronisation I reported on linux-media yesterday -
"ipu6-isys: MCD PHY is initialised before the sensor is powered; intermittent
D-PHY desync at stream start (TGL)". The signature: a session starts with the
receiver desynced, every frame arrives at the right size and rate but the
content is garbage railed at full scale (for a 10-bit sensor most rows pin
near 1023 - saturated white), the sensor's test pattern does not survive
either (nothing valid does), and dmesg shows "csi2-N error: DPHY fatal error /
SOT sync error" from the first frame. Three checks on your machine:

  - dmesg right after the white session starts: if the DPHY/SOT errors are
    there, it is the receiver, not the sensor;
  - close the video device and start a new session: on my unit the desync is
    per-STREAMON and clears on the next attempt (~3% failure rate at stock
    30 fps timing, but it drifts with uptime - I have measured up to ~50%);
  - if the front camera is streaming at the same time, stop it first: the
    OV5693 (port 4) and OV7251 (port 5) share MCD PHY1, and starting the IR
    while the front holds the PHY made it fail 22 times out of 22 here.

My IR capture path retries the session start automatically on that signature,
which makes it invisible in practice. Details and the register-level evidence
are in that thread.

D. Manresa <dmanresa@gmail.com>
