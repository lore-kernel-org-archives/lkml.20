Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50FF37C11B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167568; cv=none; b=rr4mycr65AgJryF9gO4gJZZvNFt/Sd2eEpvy1JyEMW95dsd8cbbke/JQtR7pXZb1D1ddVz0uQIIq33ObH2lYOzQ6NmYQSSDppwTrcYnbLHG7cTGMaXHh8DQM96lGb1nwk/7UrcWjHDV+/HO9IKIY5crk/CKibcQLtAuW/DVTWSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167568; c=relaxed/simple;
	bh=b6eK+JTnsD5G55VIj96FsjB8Whw0kXK01d17YFng7kk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxM0LUzMgi/vqDJB+/Xc0ZFVJeWwSgGqnxUW64mMNjXeo/kS/rVTOUIYr51KIxO1VLilMVkGJTlz0fVDu4z2d1GF0Eca8sDpXBouLzDgZgg43SlWm3NALFSDp6R0QA1bva4lTQmvWufhwQ5ThwR+eRT/e3GERk4hVXzJliIjcpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BLQBAd6L; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BLQBAd6L"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e29049adso1309909f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788167565; x=1788772365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hNZ+b3HDjQM0tqOrcrrtH2VXmNsaU71pN0Wl2Kwd8qQ=;
        b=BLQBAd6LVx6Em+GdXHuBK7u7DZ+ibCpgwg8vPTR3MPFIPNMWXjCQyU+e8x+QCNtrxu
         FFHZMbYG88UkRi1v+6tR7tYp5otvGsS0SrmUd81mBWo5Yz4P4yAE2xC/Eryr9cTU6a+L
         FX46y2RY5Ew+fNM2+iQiFckdGNOPl6NRdVuktgcLuhFwnCGwUR5wKuD9qtVBOvKKlvau
         8SS43GofDlnguUPPpu/FPTvLnrKZ9c7SpzGAaGC7mItX16zF1tWyN+o4koqIWa1frpPo
         8SxNgwlLVI832U6+H6Qj7Dw31+e5j+TFggAdlFkuoaTHwhOOCWotsjL0OsVknCkzRpLB
         nFSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167565; x=1788772365;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hNZ+b3HDjQM0tqOrcrrtH2VXmNsaU71pN0Wl2Kwd8qQ=;
        b=m3dOhJO6uLVoSp9TLE9ytASTh5+2BEJGo6GRN+iPtCOO10zPhoPDbxmBtOQh+Hpajo
         LCdOIwQ/s14ebdnm2xCvj7NuXJ3YM3cZQXr4t8islO3iMiUmYbl0/bf5b1I3tB4iKSE0
         qvjpkCyfozJlrWX7IGXWJ2sGT77qWGlaB3J/TowDTHtwOgxeaPYmMulE206Op7kpi4rT
         yZYZPmNPPpHfegGUpnmUczu4j4Ez4T+qqiGi9MZ/1LHOJLHxFGY2tyYXx4n6697dLoXA
         njdsFZUvq7++b6+DUdh66QqOL41oH91qrZo2XxcfM8m4yoc2r2nvBQiQSltaipkEeaZs
         e8Ew==
X-Forwarded-Encrypted: i=1; AKwUvBx+xsGacmEn3u9WeZy1t6SgaE3fZIWPJ7XQ/81y66GSs86moVEJm7ZHoFKcPwYLoHAEUb97qYaGvk3gXGU=@vger.kernel.org
X-Gm-Message-State: AFuF++mDOaCPYJSqiSAhfA8tpH5GOnOo8lqzGHiq0ITq13ZWdypYNCNb
	X2MOWOTqDAvS/fUH4IreWYqrHHEIBGWRxDJzyWa6vm+r1EUPwMKwSDwC
X-Gm-Gg: AYBFou0lrsMzzBf89I2bX3L5fvpG9nSFS7C6MD5xQUjgGggCekodzk2fCFg20t+vtjx
	lOV3V11IcHgJYjGbso4nblfo6y4t30LiqsIkCrcR+mo6hYRDzeVgKLc48XUbC1a91bVZZrysSdw
	7wOhjcPG0aoSaehKUClywWpiUrF2cPJnbefLpqTYmRM9xK8kpUE6lYFrxYKUcIhQV5s53VIRszq
	rVYkCrEEvFg84oVjcS7NjLjjIkNT9WrKvRcvDj7/5hTzE6aziILzdQXWhd6k33Igp4Dno7B/gvD
	GyKIBbOv/Esjg0XtkWx20s1wHcCOifX+ohil8MPmGK6O5g6JbUdrjDUZ4fxT12OTN/FIsrbtIPu
	JAb67yOt+DbWwGmXAmQrLCUpSaeEapD2yIJVlohy6A60AX6A9suFglox2hzjEzLWOqS2egGoIAv
	6NX6rGMVHg9e66yyJq23RV5ZoYhqqhyXaMOgpkMnepUu2lUMkFFQImYveBZSJ7JaniHtFN+JVlB
	pN3gmxL8XxgPv+6aloWU809XmLxGdmyeI5QzSejl663VQkg6SSTJKsxlToMOb0WuZ0k7AOQ6rAk
	KgfGxmxmGSjZs0Ea6Y1jGPwZ4uwWEoStBvThNEFRL0B/SyJBP1fcVBbEYnGmGy3baNrdZ3dHSYZ
	Q+p6OTaZc4jn73FIrs6LzV38xrDYyyFNtizr+sgDehfO5kbDkIj+wGYX8YKHM6EJ2n4poMqRfdg
	sGTuVs
X-Received: by 2002:a05:6000:2003:b0:482:fbb5:8a74 with SMTP id ffacd0b85a97d-4843efbab4bmr2606232f8f.11.1788167564841;
        Mon, 31 Aug 2026 02:12:44 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm22268212f8f.34.2026.08.31.02.12.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:12:44 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:12:43 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: light: vcnl4000: use sysfs_emit() for
 near_level
Message-ID: <20260831111243.00001714@gmail.com>
In-Reply-To: <20260830185345.2209268-1-donggeunyoo.kernel@gmail.com>
References: <20260830185345.2209268-1-donggeunyoo.kernel@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 03:53:45 +0900
Donggeun Yoo <donggeunyoo.kernel@gmail.com> wrote:

> Use sysfs_emit() instead of sprintf() for writing to the sysfs
> output buffer. sysfs_emit() is aware of the buffer's PAGE_SIZE
> limit and is the preferred helper for sysfs callbacks.
> 
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> ---

Seems fine.

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
