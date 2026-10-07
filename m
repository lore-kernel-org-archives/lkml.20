Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0793378D6B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 06:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354460; cv=none; b=nKzLwQo7MVOK1RxIlXei7lW1HJryLiIY4UsLZ4eD1J1dfsO/a3ICEyVwkwgBGK5prTTCX+jsFggEt9L8rguVQi53mwyp77MQUwirMS6/IV+67ntX1thh2jWB+lYLdQIJQp451zu+OX6PE9sKx8uceEa5RFZoGJl2LUYcy/QMcnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354460; c=relaxed/simple;
	bh=y32cOnzwL4gc9TDB3M1SxRF6CzRTCTm2vf8MXZWQigI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lU6veSsJ0TDh1XBsAnYs18+3VPASyKsG2t1nBtOUmFGvH1RzzFWFGLx7HHr3M0yo4axlK81c3O6dOElQuXzu/ylsD4YUkiQIuyHS8JSJkxWiDwz7i7MdfAh/+kurSdfPRHOfK9Wsom8oF+Qa8BTKDLCOn1IGoAMUTJKGc98lwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzCIWShi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzCIWShi"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a17baef589so9489635e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 23:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791354458; x=1791959258; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fydqj4hmNH78wH617QGFX5r4cVYqMTrHIFSWZQexZXo=;
        b=FzCIWShib5DHYJCsTaey3GrumioKcamChwgsVvo5/wUi4lNauM6GQr4DbjkMXYVT7Q
         OHPjyGNtsU4XgKneOjAJwBNr/Iq62Wo0scRXeWFahSrUBiT1QKsFJjsMqUsg+VKW1ERU
         ErZrM1o5orEXgrbsAAF83X7gmxz5zVwXh2sP5EIjUPWsP+4amhhRJRwJh3tvzuWllNex
         qA3XdO8HQdhVaIkFRzJMsWPxOppR2vU0BaDjtCplJif9jeoqoDm/aYqzU4sQGEEblV09
         NqIg/lUGeCtUBTUEWY6xQ4zhVAZJ8d5pJeesDZIeSHi4VbcsbfxKfz2MOgohakHrMSGB
         y+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791354458; x=1791959258;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fydqj4hmNH78wH617QGFX5r4cVYqMTrHIFSWZQexZXo=;
        b=h5+po8BHlpyJupxd4uA6NiWNWKX/WDvYr9fRT5H+YO30tXZDJ9MgIdfsHIoHV+aIeN
         D+MQk/SuaJkQ2V/ldf6U3c5ZAYAfxC6UgQxE60IReJewLrKma/vqTMiJv++ljJj0ME+s
         h9BsHMkvr1TawfKW8WiJkhHWWk/FdrvhVfWEd59x9ZPlYx0V1ZBan592tceLdp+3oW/L
         hqPWZTXBOryldviIlsPlACIQMxwriHaq3iNh+Qtz6UdOgGVyWpfphgbX97E4CauQbSWw
         FoWkvZVR72RsjRV7yrWmLg0LMB4DJOsm4RkSXOYaYm6/+T35JCsLKOI1UQnqaslB/by+
         /5hw==
X-Forwarded-Encrypted: i=1; AKwUvByh9AO9VUYQq+lDBVkK53sp3G1Pw245qLnlSTtfCZ82Xjf3ilHJ59Bs2twc1pDis+fahpb+i2LP1aPl/Q0=@vger.kernel.org
X-Gm-Message-State: AFuF++kJRCA7QtBwxwIAiRShKfDAh8YNCsULTLt7b6mk1t3Z3BT3tGi9
	E6UZ18lyI0pDZV+l7+IgVkXuTeiepTO8hMu0WsqUvXbrEPxRZwFoBTtQ
X-Gm-Gg: AYBFou1PMO47F8XUffV4SSITvuVkGdfdBXoDdMUMaBpAwPIeuOM8mtkPogiB3U92UnQ
	8+DwKp4WgUeTFNVKR0WLxHXn5V09FNsmaK86yptYGhNbwM+NZNYPokASsEftbOP6FkqnIW1BTiz
	5G+mFxCOL/fN1i0ko90K7EmoZaOpFfQ9W+s5SZLNXucc9ef5copmPj4wYOHxjfUVQ1dkQUs9St6
	T0p3T5HN2rRm0vwJ2e3KNecEBB4dc6zzoYzKC+n6zR+/HR1r+2kC7+wP4u+JrDiCso+doLt0euL
	YrgHspSaT2JH9SLm++H+lCsFa+Zxurg0QWLartrllrNZ/vHKcpyDQ/6upWAPtgMiYF8swWfHLIQ
	07zTS09jL768OYlwf2QLUSZ0zBoZlz2odseydHiEcMkhvi74icIBfbO7SMlMnX+2PtdF4hrZ3Cu
	ebtpAJOPLEYXgd7QhEyQbeCyWQY0Vv3ElpsUJW/RyEUlnE89YYrrfahLvSWi1LyvsP210EikHdR
	O921JUhWWEV2qxX0rQd3T2LDHheCBeSxiMWRGcSwd3Y8kTT4CYsC6CPyRhEWKJtMIP3Muey7rAA
	bBSGgvdKUdrOaqzHRurYV1URQ1cxtHW1PAIz9o16ZjC71/Xkbx/o6LF3KMaPC8C7xAxlSDyu
X-Received: by 2002:a05:600c:c0c1:b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1811c81b8mr7255155e9.26.1791354457565;
        Tue, 06 Oct 2026 23:27:37 -0700 (PDT)
Received: from MBP-von-Karl (dynamic-2a02-3100-a1e1-2201-60f4-32e0-4d59-5772.310.pool.telefonica.de. [2a02:3100:a1e1:2201:60f4:32e0:4d59:5772])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a180303863sm20629145e9.3.2026.10.06.23.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:27:37 -0700 (PDT)
Date: Wed, 7 Oct 2026 08:27:34 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: fix load_unaligned_zeropad() fixup for RV32
Message-ID: <asXlyzkNoALogots@gmail.com>
References: <20260907190750.26303-1-kmehltretter@gmail.com>
 <ap-CqOtyN9qvWHOb@xhacker>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ap-CqOtyN9qvWHOb@xhacker>

On Tue, Sep 08, 2026 at 11:36:08AM +0100, Jisheng Zhang wrote:
> > Fixes: d0fdc20b0429 ("riscv: select DCACHE_WORD_ACCESS for efficient unaligned access HW")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> 
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
> 

Friendly ping. Is anything else needed?

Thanks,
Karl
