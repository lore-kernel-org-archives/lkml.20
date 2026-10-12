Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CFA625
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791774830; cv=pass; b=Dp9EDixvE4xmdEgxQbaeynnXi7pDD+byZnLxtGp3uWlx/PSrgKaTYXxu078cryrONgK8QompckrAJwiPB0pAsJb448K4I3fPtXdz7FYd/4qYJMsAbyxl/Ft2yAdfmfOmUTOcqP5OX4C7QHtYmaBDv1gh79cR6R8TZeFHypd9Xb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791774830; c=relaxed/simple;
	bh=QQwEMw0MVh6sm8c6n1mzKfmuAGunbeouVXp27oOjqJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zcm8LGZhArd4rU1DpsV2vwFH6NKus1CBOBBqaFpHcK39z+WAD2zkh43F4qWfhbtKHdhEgN3ab3h7sEknDsm8o4Yns1Z77pHvkp80dhrbaSuyT5mCd6By8xcUOuzDf0cLLVWmMMoUP0ppw94YfszeSoX1RRTBk6IPtaXKjCSCwB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pgrl8dEc; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pgrl8dEc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e618db81c0so12313805ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 20:13:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791774829; cv=none;
        d=google.com; s=arc-20260327;
        b=IQujj/+bWzqmE7gBWHQBVNWq5o+47iLt+8572CkqriiPnCvyRkW6QjvXg0LjREmw2e
         +k70wwoA5WW6rzASRxAgFp+bk2+WbaHOEWWXj3mmqyyr342xnWER9Hki5XwzkftlEtvC
         Noh27E/vYx/HwR3FEu0scv6C6I1i9f6FA4fdqBl4qaHkiKGUunAEvFoqbgmtQEQv2yTl
         dJLhQs0be51y1t8QV7Ms0shReH4zdRbpghMZtZNcHRv/q5OdrkuuhAeruMpLSnunvfsf
         PU7FZdAi8m7ufR+geCb3r9zfJH9QxLMWE5BNcQOvgKLB0/oL6kY3GJZfcdlZ9+/E7v7b
         NEZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QQwEMw0MVh6sm8c6n1mzKfmuAGunbeouVXp27oOjqJk=;
        fh=o3fLTKlu0M/fd+5t5NAzLLbuJscR0swkryvkxxuEQp0=;
        b=cGNgjLpf8pX3ho2Ov3uC48k54jxtGV97RbNLgCRyPecJo8b38sDOnSuy4X9F8RnJJ0
         DFOwJPRy5Q2VXq7DVWGczX/kjdKW2L2ZLaL8qz7/It31tz+mC/0zPukCzcnphPhlr04G
         7pNKK1hzWfd2E7/+ku6vs19xp8YPzzEuyfllUA6iPO48VeqNFlMrxEXiE2G7QPVSkjjL
         FEfEuFBDmU1O3nAbDiAjW9DE6nByWG3EKDrl9EMRTNQN6pfKWTL+GIfQhu3yOpyJ2tVg
         oT/njCaNGGuoc7htViiZEpAWA5cYNlh/6K1DO3enyP8bjk+57jdgpRwXPLNegUv3BxUm
         fRJQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791774829; x=1792379629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QQwEMw0MVh6sm8c6n1mzKfmuAGunbeouVXp27oOjqJk=;
        b=pgrl8dEcdZnUtlPll7bM221Y5818hZTjzHF1AEhpgSLyOOGH4fIbP+ptr/sfl3kWxO
         jdJibfy04v85SUVQPMW797O1ZkJro2XThFq7uBQaG9jbUVy6r5yKkE9oF5EplogmPSa4
         9ro3J20Jx+dCw108se0YxqV6Nlg/ddZ4BN/nDfTEQNIfoPp4cp8JZuv3Q8+s7yT/ZIA4
         NFUWxaozfsIJwIW/6oUcl+W9H1J+jFt5HlnrQbJyJZrtSLmj8nhjGM889oAkbsbUGLbr
         O3mQVSMDjy1VF4ogdybTxHo6TrDU6pS8J/Kj+O6BkrrNoD+ZxRpgcE4ckR2/4mpv/RA8
         QKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791774829; x=1792379629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QQwEMw0MVh6sm8c6n1mzKfmuAGunbeouVXp27oOjqJk=;
        b=otGwTSi5NPS5+0GqF/qIY9AjzDTe16IYdov7gCCWznOjUSwj6TtjsplnR3kJZphrSb
         AMV3Lustf38IOvzHx9hQvW2X3qMUIT925XBX55LLQn+8UjOyLVkbcxBU2K9vmLuQhJ0w
         W/WnEJsduXuIDFDoYvMs2YWgFGj8+VJSTFRr+NgEiL4IpObZZAFA8lQ2+5VZDSWvVNB6
         mHQ2VFJpcib5MrpDy+fHPJyBMA2/N24UPp3UWikC4FbkZEsAUipQRm7JOG7dWW82g9SW
         dxDI1dq7IaeE6y2nA8WMhaNI/Yu9qx8ZP/zqefFB5kAN6J9J5I9fcM1h+bgcExsVAgg9
         eWMA==
X-Forwarded-Encrypted: i=1; AKwUvBzktl1tLQbWzHvwkntfc2/e0Zy6SdMMEH4GcAOzrVRiAc5MobphSkxABLuioekmH/OZ04yaMcP6bRdesyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIHqI6/zjPev0zNS80TxAZmJXK9i8lLkVlbx8pdvjkgrSgV9tuX
	AjD8ss85MP8cXoEo038+KSPRrWzv+KDbBI0vkWPcQzV6EYneV4fjlc5cGKd/DlyNTxl22OIq8Dj
	F4sO6b1CzTdLaFK4pQjsodoaRrvNlupQ=
X-Gm-Gg: AYBFou2cRyvQdcoaixaFfILSlp1UHTDC51tkaZhc1DWaxTfO8VOCJ2+N6CuMgGGKn2h
	wx0a01wUOI7baj1k6+V9R50f1ZeJWfLAAqMbPU2/Y+QDlWUXEYjlAnX798bWBNjqGIubNtBgPrq
	3C4m7j7hEVjy7Pb2O+oxdAcbzGYssnVfJF8+rHiMFO8DvuNsvLnpfVwiLypmENf2DbB17E0gkC/
	A4Raf7bFdPRRkvA4fbBrkwMdtnfjvtZqzhGs/37PF3z4lnnv4t/y87ZtlXtHntFfe3xDPEmNGBJ
	O//jHE7biKcJL+jrrqtn+4KlckMytGHv+3YruvJnjVf6P75tSDc3Jq3Kfxp/QNeTY4ExLrr0LqL
	v0y39rP6TEaqnNf4nOPkKHm15ZbcKoLr43RThaIaFxiyoCP4Gnnvu4G79nCmP+ZiKVfs=
X-Received: by 2002:a17:902:e884:b0:2e8:3281:6464 with SMTP id
 d9443c01a7336-2e842cfe9f4mr73943905ad.32.1791774828856; Sun, 11 Oct 2026
 20:13:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011051924.60456-1-jain.sm@gmail.com>
In-Reply-To: <20261011051924.60456-1-jain.sm@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 10:13:37 +0700
X-Gm-Features: AclHuK9uqDFJoTllpeX_OzZxUzR1wDkehf0yZbXw9ZjHspovKBm68NjSPo7pxb8
Message-ID: <CAABR9nE6KqsMUXYGROsu3icF8oAVTQ8b07dc7gxYcucqoaVJrg@mail.gmail.com>
Subject: Re: [PATCH 0/2] iio: magnetometer: fix the register restore on resume
 in mmc35240 and mmc5633
To: Shashank Mohan Jain <jain.sm@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shashank,

Thanks for finding this.

>
> The Fixes tags name the regcache commit, because that is where the
> behaviour changed: the drivers have used this order since their resume
> callbacks were added, and it worked until v7.2. Please tell me if you
> would rather have the driver commits there.
>

Cache-only mode has to be disabled before the sync, otherwise the
sync makes no sense. mmc35240 and mmc5633 have been misusing
the API since their resume callbacks were added, it only worked by accident.
86fc3483a4d6 and afc8e3ee8307 just catch this misuse.

So please point the Fixes tags at the commits that added the resume
callbacks, so the fixes get backported correctly. I've commented on
each patch.

Best regards,
Phuc
