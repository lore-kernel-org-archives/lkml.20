Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872F43BB664
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790249388; cv=none; b=s9Km2/sdoyiS+F6SYXqDzI1YyzXePppSRTwQrBYQ8soC3Pa+BonKeXEsWI5SvUWUfYjds69XzHLXyOgchogGWq/AZxXqsfW5+f45ym7M9kZY0uCfVo4jrSFirzzLqkXqi7/RHWFj94rN9Nw/8Hi7gVYzQcCgSdGkvOaU/JWRuMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790249388; c=relaxed/simple;
	bh=gTmFQ0oJHViRUsuavsr8vMA6jtJ+ccLcnGzXGc56JO8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fx0sNcyVP/iC9bo9g9H2pz5iapVknmYHStIl48a59mWChA63qtk5iqmvGohVssK/z/0xQpzEWIi7XssXsom5f0UKEYmXJExzmOldof2rlQYZdqPGN6mz+fUamkaMQKeUX1jg1Jn4IYu9O+aoGAWL4VzCf/hgE/EBgmsgJ12277I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkjPxkEw; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkjPxkEw"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so17689955e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790249378; x=1790854178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZqJYCgUdmptAxAUCkfCgkXC7Nfbl/0yHiSBbVHAR1aQ=;
        b=qkjPxkEwyiuRN8b/f/eLfstErSRzqdsogBAfcRPOQRlUfGcO+lK8sjzU3vumZ3jRkJ
         qfYd2yeCl0+XyU0Lu1hWT/WE1YuZ50mSlArHJx1x7PBvZF/828a968Ee1jwvexwvfhfQ
         pnzdPxgMeL1TkDVv6jhFQTDhlzAVDuVWYQEivjqBJ/J+Bvef6WnZnsAf4zi/FUa7qgKx
         HVDxADs0Kb6CkPy/cz3OzCz3Rwk5wYjLt3BOrsL8ZOw7O6B1I+fRM+cRoV1WQzt0Vrwn
         DSvlRexguH2ODHucUJ6l+82jW/b+ECWKHJfC1H3iCxRSE3in1pt3zezmtEF+JjePbr9j
         gong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790249378; x=1790854178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZqJYCgUdmptAxAUCkfCgkXC7Nfbl/0yHiSBbVHAR1aQ=;
        b=i2/O/SPhOoR/xZfHszdh8N6P2aJGxTYGUmnBrenulcNcMqpcfF7KwoRMuhO2Cbz5wK
         o7b2Rc6sN89Z/JPJXsl4iEpF9Z+T7v/8PiX6QVP5zwh83wFhiL0d/Xcw14xRsjlfAaFm
         Asobf/K/9sWh2TZ69knJkKE3TlWAyEQTiS2hwDhB19vLmzq8+m9Fd/QHhNXZP4612shN
         /KGpNffXGljMwDovE8EbeDRg0uBByMoPVae/PNRubwl/9jdvlWtOkCyVEB6uAfWxkXjn
         jrrb26pJ9j+mDc2e/8s2WxqzRs8Ib4NZgMYssyQ02Oh9w5nLD0U+dPuXdArE4/c1eamd
         6HMA==
X-Forwarded-Encrypted: i=1; AKwUvBzUsd+31I0Vx3V34u3CSIaUWnp0yqGt2AIiKqK/XDmtPhXG6rcUeacyWN4li03agsI/w184Zx9kVDbzJLk=@vger.kernel.org
X-Gm-Message-State: AFuF++lZzYNCUBhfRJVT6IMZoqzYdW3XecwAjdDt2iF1IUV59bPxtk4A
	06FEAaKfZwAqKQBEsZu2QBC+cPwHKyDQq1cDS3NtYKlQN8diBW8hKDof
X-Gm-Gg: AYBFou1NnYWkK2ZMCIlrmcw/WTt8ekgCgzsx9vUHB8I74BKJQXtDxnwTc5p1sPt21ge
	Q8EvnYYAGzCaSja4dFwcNHaPUDgk9+LGN1zC4DbzD6U02VXEYmeOeh//xWD7tFCi4cGGeqqXZ0K
	on4TFT3Fo7HKG0c4usFAu+kJvyk7AyxJrhHWWoENsZywcO53kxBI7h0A8ObRKK59WSLslOD/mx9
	FyxdxjaqMBHM/f/QKZkrLT3mDsmG7XXbZz96ysUDnabcOKQNxJq7hf1WCbpI8VkrC/5l6/FCucX
	g823g/dAB8lNJS8lVMzBtYnjL4WGAPDbCAlKKZ5qpVaxR+fqhAHgz18bx0hEaCgW/aDpw1xxste
	khGunM0z7T3X41COpDJtoIC1tWaroLwYBSY7lZnIpmA5D4RqFE/UAdlBOS36GipdGRA5cXZWnc8
	Wa1BXEJHS7G2vpp9GwYkW3p729NVWdzF+QeMSwIlZIN8w9WOJPkn2jS0ABv+4l0xLYijwBrRCr5
	OIh4GGhmZuyfUZ/Vo9V+/GCpgiIc/dFqOqOIZS+xsfzFWv4azKByKgX3l0nbssnFTIxogelN16w
	nZKH84DMdqGajHZEyghtCHM6WLf9P+ASIo1ubNowAY06oZKxmYTBz2XfsEU9z0ysUW+zc1MNjBe
	PGZwq6kIKnJew+htmtvDO44hYuoMmB8n0XpaPvcwW1PD+ND3iwOBfoXy6ih/6NNTAw2bI7MjeyW
	KUgPy0apLeT1fbReI=
X-Received: by 2002:a05:600c:1d29:b0:49d:797:83bf with SMTP id 5b1f17b1804b1-49fe66f3c7cmr39286615e9.21.1790249377765;
        Thu, 24 Sep 2026 04:29:37 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5ce4941sm59630995e9.6.2026.09.24.04.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:29:36 -0700 (PDT)
Date: Thu, 24 Sep 2026 13:29:35 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Gustavo Silva <gustavograzs@gmail.com>, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, linux-kernel@vger.kernel.org, Peng Fan
 <peng.fan@nxp.com>, linux-iio@vger.kernel.org
Subject: Re: [PATCH] iio: chemical: ens160: use regmap_assign_bits() for
 conditional set/clear
Message-ID: <20260924132935.00006ed1@gmail.com>
In-Reply-To: <20260924083527.461864-1-peng.fan@oss.nxp.com>
References: <20260924083527.461864-1-peng.fan@oss.nxp.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 24 Sep 2026 16:35:26 +0800
"Peng Fan (OSS)" <peng.fan@oss.nxp.com> wrote:

> From: Peng Fan <peng.fan@nxp.com>
> 
> Replace if/else block using regmap_set_bits()/regmap_clear_bits() with
> the simpler regmap_assign_bits() call.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
