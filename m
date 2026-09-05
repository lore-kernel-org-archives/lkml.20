Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E182472AF
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 23:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788651065; cv=none; b=Fp5bFQ2cUHTiIDMzVB2wBrDfhpAJty1Utpli6ZRRWchetTWWXSC2x2ntA+0JfwyR/qQHqPW3ALeZBJ0HYS2W6eF4epu4RYx15EP/rKZY+C0SeBGeCIqeyShw8ycRfWGWkkEgJuECeZH6e0DzAkE9/FSV8Pvyj2I3PkhS+A8KTBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788651065; c=relaxed/simple;
	bh=1gjw1JLl6E4CZT0M7vNz4xDeXI03YlilM+CEuXg2mtw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZRwO3vCEFE/TzWHbHl2zg7s6dC9svo9WehdVJShAIhb9EsqT2dUqxzmFKQDIoLGnU7q/zP4t0KLBYTZhRhGbdud+c7qMWdkP9RZMMLCodM7wH7G9WODpFF5iH65jZOM9cgHDFHNyTWYzW0AxXCVaHdYB/6jVBRZRmfjiHz8KhEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv+VUho6; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv+VUho6"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so23491031fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 16:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788651062; x=1789255862; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7yzJKanOzKSOnMYKEyJngbZRM6LI+anOWm8IP0V+9O0=;
        b=Gv+VUho6SHSF0OTM+gpDWVPwYMPGD1WQl8zD+4nWhqzaru9wBY3NCaYkA0Hxbn5q0v
         koftgGwIU0fc8Gf+uDr7jfM3//At4lPPFQum0+3prz0XvW5yDA57ydYe4bQZrzl5vRi3
         i2KJgajJsAPW49zR597ZeRY66AFooBpgMbcXDfc2NhIHMHRxe+FTbTjpM2OWC6Q5+Xad
         Unlab/ykn/auvqrL6KTJQ0CTutrb9PvRSmaMFWwnwCrh5zATS+pT0bklxLWgcAsnNLw+
         JpjeKbLUJgMgOYPlogUwZl2sXjUm3Z4ShoxasBTcFiKPIXgVJu7tKF/ZwkKOzEhjqdox
         Kawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788651062; x=1789255862;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7yzJKanOzKSOnMYKEyJngbZRM6LI+anOWm8IP0V+9O0=;
        b=tFhXSEz7r+/52O1rWnUwlb2IYYEiKjpm3yk05GAmvc/Th8vT1PfvuJmd07DmChYVfQ
         rb0ukIVWORqAIdTVteHB5TTevT07kUIJZhkQa8s+lzEaiJK5NdWYiftrOBOHQw7eyaex
         ZSSCcrzOg7ZUw6N3u5/8IJ1A1yIoqyAgwvgN2WrpYgoxP+twL7nHDWlJJKulXUV8Bgoj
         y0poysg2M02ipwUpoZ2GvKqwsG2jwWD05rv+Ew9FbrA9TDcRN/CzIfvGuMS1EYikVnm3
         gaqg31/xuQ9DAEGa3hEwgS3w/mTP1zvopiSPWomcTJnO/cLVbF+vgt9NDI+aC0XcF7Bt
         J9LQ==
X-Forwarded-Encrypted: i=1; AKwUvByGULNb01yRdM5VZ7UEauQr72XHuIbCA+QlDZG7SgQXUTNL55zEzsOwj8nO9wAU5DMvuvdZr9yB3niLseM=@vger.kernel.org
X-Gm-Message-State: AFuF++kRbKFH+5kXtEyxpgwBG8cbkViG8vQuHOOGUgrA4u/UVr66W+4v
	D517u3Z0qeKyxyDG/yR9bU0lUk+fmXzkm2DhsuJ5hfpqU9sawjC6lPXkDTlh6aEJFwP/XA==
X-Gm-Gg: AYBFou1Ousxy1C/qhiTv4mNtquPWW3wTSTvi2wuAXRL97kNCPh38d+QxiwkgRCDoDL+
	2GrttKToWnaDf6tiFnHMy+z43iBasaAm7r5XHXt60vL5O6H24x+fGgNbc94BpBf6nYYCS7TODQ/
	a72BNISnz/PL6iyI+KcoFs8H1qJUl0ZSsIkduAQ62hNlUETVL9tFnhFDRS53MzbhO4dHrE4Caia
	J50LSd8xxGnbr/Uyvd+FXAQsLB9paFKS9beYakPsuvmAnbx7+PpVZVBIAI1pNftbxTl0jskq636
	j1wWvNUaOETNETXiiDXNMGG+wAHfZXoGjUplau+ul/9z14e01k5841XezVdmii6LHKzQqToCmGD
	WA9XcVxbkWRColzZVZPFhkUmf7nRi9OElsTyjqv/Dnj/Lv7QVdhFCKpo5elUTxH8LvY+mSDaF4L
	OLPpZtJOYfACM0UU8IcNYe26sNLsRCuS7Nw2w02KF7oKKBcZ6srnJu7n2owTOxKVpVHNcNOVG60
	rujtA==
X-Received: by 2002:a05:651c:510:b0:39c:a24b:f0b8 with SMTP id 38308e7fff4ca-3a372c9383bmr12639611fa.2.1788651061389;
        Sat, 05 Sep 2026 16:31:01 -0700 (PDT)
Received: from localhost.localdomain ([80.66.93.20])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370588231sm16849751fa.22.2026.09.05.16.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 16:31:00 -0700 (PDT)
From: Maxim Skokov <skokovmaksimevg@gmail.com>
To: nfraprado@collabora.com,
	pkshih@realtek.com
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maxim Skokov <skokovmaksimevg@gmail.com>
Subject: Re: [PATCH] wifi: rtw89: Don't return default channel from disabled bands
Date: Sun,  6 Sep 2026 02:30:28 +0300
Message-ID: <20260905233031.5561-1-skokovmaksimevg@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260812-rtw89-2ghz-quirk-fix-v1-1-7fd2a46e7a02@collabora.com>
References: <20260812-rtw89-2ghz-quirk-fix-v1-1-7fd2a46e7a02@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Aug 12, 2026 at 04:36:28PM -0400, Nícolas F. R. A. Prado wrote:
> Update rtw89_get_default_chandef() to consider the available bands when
> picking the default channel.

Tested on RTL8851BE (rtw89_8851be), applied on top of wireless-next at
base-commit ca800a9302764c445de0da0e84d2252400a770ee.

This chip declares BIT(NL80211_BAND_2GHZ) in support_bands and does not
set RTW89_QUIRK_DISABLE_2GHZ, so it takes the first branch of the new
logic -- the path that has to keep behaving exactly as before. No
regression observed:

 - driver probes cleanly, firmware 0.29.41.3 loads, no WARNs and no
   backtraces in dmesg
 - both bands still enumerate in 'iw phy': 14 channels on 2.4 GHz,
   24 channels on 5 GHz
 - association and traffic verified on both bands separately, 2.4 GHz
   (channel 6) and 5 GHz (channel 36)

Tested-by: Maxim Skokov <skokovmaksimevg@gmail.com>
