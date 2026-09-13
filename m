Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85FCF3BCD0A
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341333; cv=none; b=TqrC3jSU+zuH8mxS4M5mRIJiJSeCwfvAntrEFAtGHI5vQZna/c/7oZvXdKFplcYBn1E9Ra0/TMVm1u/K9aDaemskGSva0cO1XKZZ9ODzv5j0p86vitijCJTYa+S4fsyhspW+gDY38wvzBynllcJdS1EpIvh4qz6rfCWOnRSTbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341333; c=relaxed/simple;
	bh=gVYP12sqP6cJ+L+kakkU6p/W4lSVK4Q+ekoCezDUg6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4D5a4HN/KVBLr+SQkknDSPLnhJMETCLHJe4bfGjAatM/DCoCSD5noSV0Mkw1xfFWPlirM3x5S90lqwlGLoPP6tK4rgwGUydbT5uQPw5m+pCOcMbSG7rx4pzSnAKhBO3Zcet2UiFfWMZdw5QTv6QY9ZiuSEDBBVGIDKnDGpvAAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rWPdYgWm; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rWPdYgWm"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2801263a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789341330; x=1789946130; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f2kOvL/0PNO2AiawOfNAM0hHfx3xmVfEalLZGZRZApc=;
        b=rWPdYgWm77huGUFH1JCxeGWBs+dQ4WuhnmnnwedkpHepgI1b93t5Mlu0iPzMOBlAZy
         UQQuxDkDkPUwjgbbHVW8Xhg7f3jA5Mj2nvjZb+9oRSGuLUmTM98xLtL54DdFgEv1m8Vq
         HroSmCE9Ker7TO13OtEijHlye2vnTZnRJGjUV7rRRejbIV1HapFM4+daE5F/uP3tlNYU
         oLqCgsE3F3bHxF78pG0YZbQeflhCJ5GI7OCWl2s2gvo74qgY57Z5Sd71LgPJ8RT/CbT9
         5u/ZDyqWZ5ODZBOXr7HShlZm3D6XnZJ/njRVPzaaAzYc7rRt9Ae35k2umlpTCssOFaqY
         vJEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789341330; x=1789946130;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f2kOvL/0PNO2AiawOfNAM0hHfx3xmVfEalLZGZRZApc=;
        b=WKSwuvtjmLP2abIawTkBQCU13HW+YP3BrTO2KxYTWso3ad9G67GnWz0Pl28SgNvqOI
         T4WVv3Rb4nJRLO+NGXBcpV9PnMr2TxSgJ4kIFQHp6T0MhaB4TVlliyv/ro0i0C+lCBoX
         BUUYt9cVsvA12Xaho6gy4vCwprTUyf7ZSLnw4YYYsq2nwhuQTP3+uaEROE8TUKvGCj+j
         ETRYo2ALkhZ3lVp3kRGCnLg0sG/TwKmKPYXxDFKcys6gQ806xG9AYhCnj9HeRv/auiny
         lhnKd7moqKfXPvdfcQIWVYY0wPIogy3R0wyWg4xqAHytwOXStcn5KyjTzS4G/ZzF5w01
         GH5w==
X-Forwarded-Encrypted: i=1; AKwUvBwyz3FcHEb5OxW5s9lQPEqcF6I71CZk1o5+pxIuIj3PaXuSU1SQqKFJP8m1dE02zmBzeWvnkfxJU+o+AdA=@vger.kernel.org
X-Gm-Message-State: AFuF++n15UOog9osMTmNu9PVsDUdclEOyrDhv6tOvqhKeCHd+djScuMo
	vJwsQeBBoMu6te3klYFYe8Pb/J2l51VDbGAA5SylvSdfENpGRbBBbNGg
X-Gm-Gg: AYBFou2VsAu9i+Thyc/VXZ8QUUHOWbrWnfiVwq+LbesadA3erBLd2nwLKmsNAEvY57w
	sHf1t95tqTguPRP19eZNotNYgh5oTGbAxxLQqJUpgndEJIt+6prDb2FpRLly8V+CvgpZaOmgLyS
	SciSfw4HZsAEHDYJJNQLFR1tJHPNrCGRYtOdi0dMWl8ky+kW00W8ORdgKQs27RBP7PBJmas49ym
	S2DjBv82ydhlwvz20l8DMVJGXRwnhiFdj+Q13hxdIhLbDyEE4617MhwB4avCXVt60OSvWklLN0m
	u8JgXtmBCssdQdHyzdl4qgQAZ+2KExdcqFtkUsUVDY820+QtQTfbk8Xhfp5MZnPuoywg4gqOn78
	jO8DM7kZEcoEUB353sUjpGT6ei4DuTLlV5pJsdN8jChecC8PY8j9KA4I7msDjbbEt3SAbI31CuT
	E/PZ05bLliXWuLl1hDemGC0iE0IjcZCR37GaPorKjIS1frnM+ivtVEmU+BD4qBsiAK1RjiqljQV
	XBfWpnUOvNo7T9p/+RKREomubMy4xz5xUctL+fU
X-Received: by 2002:a17:90b:288a:b0:39d:e43c:5a0d with SMTP id 98e67ed59e1d1-39debfc0f51mr271711a91.8.1789341330359;
        Sun, 13 Sep 2026 16:15:30 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a739:376c:7eb4:ea2d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm11934175eec.9.2026.09.13.16.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 16:15:29 -0700 (PDT)
Date: Sun, 13 Sep 2026 16:15:26 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?Q?Rapha=C3=ABl?= Larocque <rlarocque@disroot.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 RESEND] Input: synaptics - disable InterTouch on
 ThinkPad T440p (board id 2722)
Message-ID: <aqcuip73GJZc6TsM@google.com>
References: <20260910164425.12832-1-rlarocque@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910164425.12832-1-rlarocque@disroot.org>

On Thu, Sep 10, 2026 at 12:44:25PM -0400, Raphaël Larocque wrote:
> The Lenovo ThinkPad T440p (PNP ID LEN0036, board id 2722) has a
> Synaptics touchpad whose SMBus companion is not ready at boot and
> takes roughly 200 seconds to appear. During this window the touchpad
> and TrackPoint are completely unresponsive on approximately 50% of
> boots, making the machine unusable until the companion finally
> registers.
> 
> The device is in the topbuttonpad_pnp_ids[] SMBus allowlist, so the
> kernel attempts to use SMBus/RMI4 mode by default. When the companion
> is not ready, psmouse_smbus_init() leaves breadcrumbs and returns
> -EAGAIN, the PS/2 fallback path is taken, but the device does not
> function properly until the companion appears and RMI4 takes over.
> 
> Disable SMBus InterTouch for board id 2722 so the touchpad and
> TrackPoint work immediately via PS/2 from boot. Users can still force
> SMBus with psmouse.synaptics_intertouch=1 if needed.
> 
> Tested-by: Raphaël Larocque <rlarocque@disroot.org>
> Signed-off-by: Raphaël Larocque <rlarocque@disroot.org>

Applied, thank you.

-- 
Dmitry
