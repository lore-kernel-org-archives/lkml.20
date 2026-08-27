Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6CE22F01
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 13:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787838846; cv=none; b=ZqvX7Hab/4JjuMWv4n8zZZ1fTSQ+Bzk3oV6nvNM98yKemXngaf5a4xkva7n0OHvxAKADaCM0uNQ78e/IcQn0COnSsjuiFAHQoVgh5rhZIa2emigcVBiK9oaa18sMDKALfAmMNWWFnC6KExJ1PUxOzt0S376M9dllcqkxB6dwOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787838846; c=relaxed/simple;
	bh=QcnsRvBS8HwkR+O6VJHcSxjceTtwS1oZqvuyeAOVQBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=svgvZdbjMKijwZAWlkJ+T/UMJQD6fgUsF0JmT+d+pDqpLiD5lp51p2kLmcFXCcz1JzYRncEhdcrS22XDnlcZG/wYkhudgKtk821TzW4YLp929Cxpvtd1L38xTxHdPXQD3hA4H6Ze3/AI4OVweISr7WH4eRf9cesfaZa3TTe+adE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W47rpLKp; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W47rpLKp"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2d6efd73032so9481875ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838845; x=1788443645; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=;
        b=W47rpLKpxgprzgm84JHNcrrstIUk3eh6n9RocLXhVaM0VIvRTXaGG2/kt5crpbzyM8
         SIKhN8Wy2LW5RJY/2lrcoAO92616v/Fo2m8UhJrpD9U0D7+2U3A6I3gPqZXReITyHBXK
         TnttMSziSVwRJLmzpYS9nauDh25ydtZNSRKPSl3IZiQ1ZlF3wV4zAE9W8ILqEPonWT1g
         350Q1dKuLG8pb6xt6Hs1eT4thY75vSqIUDG6fMW/Uw0kOw30ub4t4dEk/DlW26y7sRTw
         bGVLGbnVyI+qGPUCFh0iCE06lmeus+zHXCpLbaTgE0+AKMydVyg/ToVIvXgmtJwwhzys
         G2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838845; x=1788443645;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RngKn1qeN4IMu4W20K5F024kPlBdyKuXJtbP/ZBjLVg=;
        b=CTGBT+F3hgTLVVihUAFnuSBQXW4fPasUZUs+vvBAg4GcWfv9cLhOn3RwXzJ7D3oyg5
         DohkLhgEa7BHbhv8i2cBvhttKF0zYsIw/MZ466h6L34Nb4eYd2LJF5YAXDo2xVqTVdZe
         GawGRaQCs/BgBhMXQ7l8qVDhSrTkSM2VC5ShdqBdow/WnBc2i1R2yUzTQhZPezl/72/w
         6Lc1xMVsaTLgv3ggI6s9rmZF31iyM1dIHnkz1f3vGIm8uMf0pB7mJuEWklogJ/q7X2Sg
         mfxxqZcru5qFxV931sxgzKifxa3S8bO4pQdIhSTdra+L5/RUXHPiycvLfrE/F+h1rXZv
         rGwQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5wkFAVt3fL/wcxGKztWZIQhCdalozj6k/KJZyRTQ4xd0AJBPyLAR5WTQ/YKhj/6gmZpK/9TV3XnM1PaY=@vger.kernel.org
X-Gm-Message-State: AFuF++nLow9KfJjxZII01bYFKYkOaaP3m7hwOMVyTkDAY/xQJ0M9qYU6
	lLMiv70bYA59nkMR9FHy7i9eSvvxUFA46StQcKKT9WxG5LYz0TwVz8mi
X-Gm-Gg: AR+sD13dkoS1904T06IAfUqHsPDEPax6XDo2S6SAWlzDKX+p2EvjbJadiWWHlPbyx6l
	XweNGJRb7tuQL5dADyfWfc1udc1kNf7qDq27TuQQcPNl8bnKqARynQRp3SE8sxVbavKUsF0zXRG
	XmnWxx9oz9RFIN4YpZb+A6h/0Ye9eLW5O/nyETcul9rlUF0HH6hFqDo+ntSRgQ4MMX+vt+aNueo
	LAkaRtxxbQQd2frG5lqg59AnYaHBE4UhbHEW01xs1VAf9hbmzAVTjmonSeoUpQq0Jkl7xDajOt4
	98La2wesJpRTIV0I0ZsRtok0uLTmlJEDiQXKkDSlow0VU2BVpwr6iJmUA3m7tk9+DuHWMjeR8yV
	axGqJsv1zAFOD4xsqAO8ATnssmJqyCzPqY9CaVHIUTQnXhy68RktrfZtByk82tafmXnD2ieTi7Y
	gdHILgtDlNMKMPS7Xk4wraAxlnC+WEmaupf2J8fOYYPl5V/EPpDtnqK6GPy+Zwahn+FDq9LMoRJ
	JMgYi+EAMGj5g==
X-Received: by 2002:a17:902:e74e:b0:2cf:7db9:e13e with SMTP id d9443c01a7336-2d72600b801mr85038015ad.3.1787838844476;
        Thu, 27 Aug 2026 06:54:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704c34ac6sm17479885ad.73.2026.08.27.06.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:54:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 27 Aug 2026 06:54:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wanming Gao <wanming.gao@mediatek.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wallace.yu@mediatek.com,
	Jarried.Lin@mediatek.com, vince-wl.liu@mediatek.com
Subject: Re: [PATCH v2] watchdog: mediatek: acknowledge pretimeout interrupt
Message-ID: <5e1793d5-6c78-4372-872a-069fcd99a07a@roeck-us.net>
References: <20260827092616.2724197-1-wanming.gao@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827092616.2724197-1-wanming.gao@mediatek.com>

On Thu, Aug 27, 2026 at 05:26:12PM +0800, Wanming Gao wrote:
> The MediaTek watchdog pretimeout interrupt is level-triggered and does
> not have a separate acknowledge register. The interrupt is cleared by
> changing WDT_MODE_IRQ_LEVEL_EN and then restoring it to its original
> state. Without this transition, the interrupt may remain asserted and
> cause an interrupt storm.
> 
> After changing WDT_MODE_IRQ_LEVEL_EN, wait 70 us before restoring it.
> This is longer than two 32 kHz watchdog clock cycles, allowing the
> level change to propagate across the clock domain.
> 
> WDT_MODE is also updated by the watchdog start, stop, and pretimeout
> operations. Protect its read-modify-write sequences and the complete
> IRQ acknowledge sequence with the watchdog spinlock so that concurrent
> updates cannot overwrite the temporary IRQ level state.
> 
> Signed-off-by: Wanming Gao <wanming.gao@mediatek.com>

Applied.

Thanks,
Guenter
