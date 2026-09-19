Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4C2E2852
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795752; cv=none; b=r46hee3OxyEs1AoDPVsc9NTNRypPICVm5vx5DNKbV6xSzEP1woFEBcBHGHrIAQ/pXXLhok/1poOeIpfg7LlBwLOnHa0pJETkcJIePDffayCNvBNNTJPMoBwyKea1htxL3ZUcSAs7EoqTKHQe23yu++KX9/caoFKcH+hSRm5UsMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795752; c=relaxed/simple;
	bh=ekSDbC6S/5AfZ2Iah9TGW0ydX/g6qRFKlYWSxfRX59A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hIwvkcHMD+/v+jsgan2LAxgpquULd0CmT8Fe0WdGalSJxm2yqurNt2cSv+VURZAUIxJUfN1S3cRB8bWAhSGS+m+wDRDIIH74rJZX7ymkzuhQytxh5qbK9VBswBmiULT7mu2nPdT2MAzUE+ERuAC9gsWmx2Ukdjq29AS7cxwtLlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJKLTzOY; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJKLTzOY"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d8239so10112165e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795749; x=1790400549; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ekSDbC6S/5AfZ2Iah9TGW0ydX/g6qRFKlYWSxfRX59A=;
        b=IJKLTzOYSCrsRRFWzva18ymo0fxc8p23icvyB41lEzhUTKksA+L3AZuA4HqgINmgku
         mBdabaHYIXe5mMVok9iRle8X/tCJIakd+3sDgTz6DBPtvuo9I4zXvtl+kQ66SoWv49Y+
         CnC3C5iY+I2Rg7Pm9AECE4h1mF8wD1XD10PxuUE+u9QRWDVFkTk5C1Ex/opZm94/K7To
         9TTpJALXzSvetc4K2Pg/1rrJzidDIQLasisu1KZPVnaH4Zaxvfd5qaekNbS2EzZAxozQ
         luDjGOXZaSwBdtYBwr9uHN9Zt59gUKt87JCSkdLHn6dmERiLktz8Bg4fcO1uU3qgLaOV
         4Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795749; x=1790400549;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ekSDbC6S/5AfZ2Iah9TGW0ydX/g6qRFKlYWSxfRX59A=;
        b=e6bTGHxOlxrZSBBnCp1pk22juCW53nECrE5qzSXsB60YLicTLglxwEoDkjL3t+FHg1
         ql9ZO7OLZ/u9BecSutLay0qALsihtbalAOQW2D9Eow5Y/uUNVaoNPyoN4E8kjEN0knD4
         fd4Y2DJJKoxQIABIzveWKu0WemkEk2+YM0gYrvH4eMij8Ct6EUQGrEMhvglwDgqKlaco
         K+x/F0bjNO+aMTl162vKYNiKE/wKiQCy0IYDiICY0V9p6+BWAOOlTdQx8qq08RIPZCHF
         ShXgwDk6BIweX7sxzQ1a8fBCAg8snD5/v8VAgWqAxv2/ZgRJg+QPheb0hmRsj+l8/gjW
         tpig==
X-Forwarded-Encrypted: i=1; AKwUvBxHLZRu7vEpBQctyJiK0fUSybao200YZQChimYgio9S6Xh8usYU/XtFj2Z8DXLvkXA45XLabwbeT+7iQOo=@vger.kernel.org
X-Gm-Message-State: AFuF++kmEBUUzBHLgl2n36Cd0wYyd8xbgOAkqkggrxU02YrcCklIC1EQ
	lqxbqMNEFZlFQmfjiUNp3IY8iAeDcvCtPwTt4f7B3AzLGsav+IRVOs/J
X-Gm-Gg: AYBFou2jgVGRbplxQfpSFkRVuiSDdDtXJ1e4spW/0/ZK6u9PdNqy6tLvgrM3rB1yR5w
	vevZXCuAQKEY0yOheHiViI3v0Y8U+pap/joICyCqFaC5rvz7nqyy920j1aDan0AQR+q5sE+H429
	tUqMoedKGWmI0P99JGSQgu1aEgDef/8n/ZKJCmcYB45kmtobaRUS6Qudk1kPj2zHV+lQzhiaOJj
	cydbgKDMs1xPUpUylHRbRagtZakqbCm83OW/nIGB6ZoAuOEUt5uNiZcO2yYrjDXb9bf6WgRBeoS
	LGZo/uszMQ8jLDha9wac3S6OZU2Bgz6zZEUqXsKccQi+tpldGPJnAm1t2sG7q59Si6CiWB5P/OR
	wN3uZ3LjECBVpw4xCCxD3/d9s7f1Me8mpu9EVe+5JZDg4cxYU234WBE6pQsVaYbn/dmcLLMMa7y
	pB3GkMKvq4xFH7ODuA5dtOo0rME+HaP6GGUKGqJo7B4bKO46SjNxLZF/jIgbxFQ54ZzKPzu03j4
	nvMqwS3a69Jrv8wFjIfWTNpy/ezs0jrURoT+gmOPjvyljVkDQthtGA+TnVXC5QzKkYjYugRQCzW
	pv8xse49VW/EFYt6aZBQC/QNuP4eQ8ChadGGl/HFw4WoTrpiuqQJXLsxaCCLKGQFhf2O9nJibbH
	i6UYmm2uNiWkYM+xv
X-Received: by 2002:a05:600c:3b05:b0:49f:c196:47b9 with SMTP id 5b1f17b1804b1-49fc567318bmr60705515e9.4.1789795749070;
        Fri, 18 Sep 2026 22:29:09 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459d409sm4258691f8f.33.2026.09.18.22.29.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:29:08 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] drm/vc4: hdmi: Unregister the ASoC card on unbind
Date: Sat, 19 Sep 2026 07:29:05 +0200
Message-Id: <20260919052905.26038-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260825063735.14676-1-kmehltretter@gmail.com>
References: <20260825063735.14676-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 08:37:35 +0200, I wrote:
> Register the card without devm and unregister it from the component unbind
> callback, where both the HDMI device resources and vc4_hdmi are alive. This
> makes the card lifetime independent of when the final DRM reference is
> dropped.

Friendly ping on v3. Is anything else needed from my side before this
can be picked up?

Thanks,
Karl
