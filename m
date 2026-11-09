Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268102;
	b=QsMt2DAVu5Vm1Rf+Cg/zaKkd0aA8ZymHY4SZoAjG5nT8N8qVrMIiHUGdY5cZdSN3+bbp
	 hmavHCaE5MVDVU7gEjcs/OP2+hcrVzgfDuDsYb9dSQYU3HcTsacr4o6lkgrJPpQ07gIQa
	 bGN8y4tLhipCgHZyswTPKw67rQqAw8W+rDoPspwuZjWob8rPHap3rT/Ne/YgBE1B/tmJL
	 FirbQIHKGjW1lZmNFwXSQbFB800ZiSO7dDztPPHNMuKtMwj/PBfOD00hAmvJ+OHO44Gyc
	 WUOWwjXKebyJ1Sv7HBrj7l7Mv6CJLfBhwc4OkjPFvOpsJC1iKYa6c9dngfPMe1dKIyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268102;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=IppNhVX5WQCSwvqxwHiKEP05fP8li4vwyY2eexFMjDs=;
	b=Z8RMyzbl39hAj4D6AOIPkpa/phcerqDuNjEfbZ8CWoYD1Qp9bEeAPh7maewkOWUuVJRQ
	 ZZ0Q5JKIhTOwdbqHkdrUiKkwloekarqYXvIXwNndrhpmw9RrTAHmmCxdO06bEolpRg4Ai
	 g+4py0mco3IOEiBtcbOPcPN4sgE0/GIq9ozdVnoCn6uQVeRGbhiZijzA2J10LNrPoRzQ9
	 IN0SbpbDIsD/4GsTxV7BZGmsWWewb9YWk0BNd8OeVYdm/dZyZrBbSkWj1eUTgTJ8jVmdo
	 vGwwFxaothyPL9h2AxHwP4GFh4B3TjQUP6c/7qAdA+AIS32h4XrO8NwupbMYDC6CQJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pRG68NOM;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BE2606A334
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9BE2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=pRG68NOM
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso1118162a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794268101; x=1794872901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IppNhVX5WQCSwvqxwHiKEP05fP8li4vwyY2eexFMjDs=;
        b=pRG68NOMZ/f28pchMXhs4pk+9Pxc2LAdL5XRgHwZird9D2ijjySTURWf6uWFmqwa0u
         J9PAZCYsLHlfYlUnIcClJEzOd9rZEcN1H81ojhFrJ0fYfH59sbNPBXAuEAiA4LiWAgHo
         dYPxBpFdCkNxq6Os5w6ml6GGuRB3ej50dakATcGxtqfJcXhE0+klVIXkOYZUBwFAngpu
         UpKUtGoE8RyrkuekaWpRSwSwU3CFKapY8+I43i/Vv0JQFB6/MJgT5E1ACVITEqeI/9NB
         mGWU9MMisVFAzAqiFZ8KovoOUxwgHw+cwIY4kEfNyuKPXtqRIin7DXZPaij7uaivIr9X
         dyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794268101; x=1794872901;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IppNhVX5WQCSwvqxwHiKEP05fP8li4vwyY2eexFMjDs=;
        b=emXHwoihh8GvqxCzShGNXg+Tu6ac8/CZujpavl0LPtPSGtNHtj1vTMk3ZVSBPATLpf
         uSU/GKSAdTN+8uVK0oOYvxO39vbKjlc5n4d/bhbdavhqeqor5NmmT+QwMeMDjSNWqByB
         pM1mDcq0bCoJs/BSgVUSPmKXjJsdL9RxQSs6xEQgb6uRA1ymqKQEtDM3s8SNNJoVKTKi
         Js7rPvEVo3VXhAcUcOl+0ETYoivVChbdK0eETsAc5IrgkCMiMb7Hmzw27DJqadkfaQC6
         VLUpn5m1YrwWHCCXMHfJ7Qz3V1fttRU1eVKrpGikonSX0+Wz5ehzqE0jeYWoEbOKSzHm
         WOSw==
X-Forwarded-Encrypted: i=1; AL+hErFsdbu7Rwf8n5fKOVzKztoieLoHOU/W54DhkuYa258yyCZUOvod7MoKyXv5QArVbzwswoM6eL0jfzyofjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cPwBKNkC74EY6nst9JWlc3lavrCRTgdJvTVhU68tOZiDLIZhb
	THP42JXBTVaoNPHP8ue4kXO67aOYrzY0SZs/g0fRA48FluSmnM/AbiKrPxj1hWvy+lo=
X-Gm-Gg: AYBFou2GEZSW4ZjPDoJ5hr0VkDYPxs40eKencsaY/+8GiqubiLakbvZ64LWLysgxIeW
	sUVZUXbEv8pL8w18B2grAk8IZb/UmTdCk7dSuK9VKC/JuCGlKzAHetPI1G54C1EcS5YjbC32ZXT
	otGLjgbAc44TtBO+hS8Ixr+NaJOaqwV9SogtDRtoArI8onvJ4d5UZXbxdBa4YrUInrlCL2ZVh+g
	6SOt4Qymq5QW21bByMb33BxRjEyz8GIZy3SeoiwusFBFFVK/UHBLhIR/mwSlQCmbHiabLWS4zW1
	WSffPPtdtOAl+io5MdoZCr6WKWQ9G50688dJRl5G89Ce5PI32oKaBQmj7J76tMO7Jgy/7oZgDZv
	q27HhpUGMy/kLK9LqtydCBBAdYrfCZ6gEtfZY+YCSuhtBEaHYgKvtyBIIIEa1u7tGPn+HnN4cWD
	el40RL/huEB6OiTnjft+EVlE7M42GFslmLrG0PZcQ5Vhnx9+gPnlKxj6UH66Yl4M/GCH++fPn+a
	BW/8MCGgTUTJLfXoG7OJabJguQR1aIVoBoEJceWeDXisO8sVSt8vMi8vfZsIoj9A6rgxZaTTBXn
	TrlubRDhkgpKY6QE2vuO3JXSca79ecmBKiHr3lwhjhYo5Q==
X-Received: by 2002:a17:90b:4a0f:b0:3ac:a203:e0a5 with SMTP id 98e67ed59e1d1-3b166cc0352mr1249763a91.11.1794268100946;
        Mon, 09 Nov 2026 15:48:20 -0800 (PST)
Received: from localhost ([97.126.173.69])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b166f542edsm1433378a91.0.2026.11.09.15.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 15:48:20 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
 Andreas Kemnade <andreas@kemnade.info>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
References: <20261028-susp2-v1-0-174b52857d89@kemnade.info>
Subject: Re: [PATCH 0/2] ARM: omap: cpuidle34xx: Fix unbalanced
 cpu_pm_enter()/exit() and cleanup
Message-Id: <179426809959.2265990.7562894927493541429.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:48:19 -0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Wed, 28 Oct 2026 20:15:10 +0100, Andreas Kemnade wrote:
> Fix unbalanced CPU pm calls and delegate the question whether the
> cx pointer contents could change to the compiler.
> During research for some spurios FPU issues, this oddity come to
> light.

Applied, thanks!

[1/2] ARM: omap: cpuidle34xx: balance cpu_pm_enter/exit()
      commit: 97e0f6eb6112788e7a46376998e797b4d7d6f524
[2/2] ARM: omap: cpuidle34xx: Constify state info
      commit: 6d6f135fb1c38fc833e4189e1db47eb7060c0b1f

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>

