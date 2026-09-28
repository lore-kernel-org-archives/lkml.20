Received: from mail-oo2-f41.google.com (mail-oo2-f41.google.com [74.125.231.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CFA4DA9BA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 15:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790609344; cv=none; b=Dsg9k77yscXkroop3Uyx+4fEyBa96K28gN1XfPmiVf66OKp/looziC8N8+tGxO961sEIhIezvGSTo4sDg8a5bFUJHGUpHW+K6QDwnuocAxysYr6HcNSd1Q/ZqUd9NauEF7DXLiFpuI4IMuVpmcHxN8tvCc2KOu95PEtQ4nZUPKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790609344; c=relaxed/simple;
	bh=PGI5LSsUHdXzEsPU3eTZRxILUn153NxKw3UV6sGM8ds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n4nDoK/N0YVKJZc6jwRQyKoVOmBl6C3n5+If8JCa2OXSinJDn4wODFAny4JKW5QlP50JdSvDsaV6hYfbBjl9nym6l7qnpVQ3IZarGildx0QWEZFwzccTUylv0KQxbXfhLg6IfAIX9VAGwS7Z9ku/opI7EFHoT8VIFU+KRwbetQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzBjCjyo; arc=none smtp.client-ip=74.125.231.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzBjCjyo"
Received: by mail-oo2-f41.google.com with SMTP id 46e09a7af769-7fcb425fb68so1925392a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790609342; x=1791214142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGI5LSsUHdXzEsPU3eTZRxILUn153NxKw3UV6sGM8ds=;
        b=kzBjCjyoCw/47E1YHMrj6tz4H4gfSqfH65EZmX7tP8U0J1sPskHtLzLfdhov1nwNnl
         piT5jbYCuVdz2+BYKvLyCeF5ybCko8QZhOavuUNHTsZnT819v1MgfuNTtkMz9gInaJ62
         qN+SjxA+TwuXP4Cia/e8nHwZBZck5jK/YE0bWJ0XmBX9EPdH3bMOjLq0d5zQsuBg35Hr
         FhbQ9S4AfOwAx21gmjwmFf9Ca/6+p2gUw1BYSMvx1WMNEIDay6AU8WfuDBOTE9FllHT9
         DOAKK0eRRb1RI+cwwtD+ewxDhwY0Fkg9IDVijkXKzklhcRgYti69VGuzLQQJVGWsmnsQ
         LtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790609342; x=1791214142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGI5LSsUHdXzEsPU3eTZRxILUn153NxKw3UV6sGM8ds=;
        b=QsOHA2Ez9l7RbgV4XC2GsfmVUUjCXnUrzP+SXcuXkK1fWjXO/COEJvizMlbUXJesaw
         SCyKdA/jip5ia8DM0sEM/sdX+q3o76ZuTdTAKBCnApUdBDCod47P/BL8XmksElLcVCbJ
         tjYxNf/NTUGCYpNa4K0iM1/WsKAlx7YNXtnJ3+r4eVsv6zJrgb3xC+zFz2t05HSQkUeh
         KpFkf8jmCevmkCUqemufqeLECK3sGh2IRNYb0ICXuTJgvFMIjuUlG1yLLNepVPWulB54
         AH4FqVeTd1cMvCOFG+zOXsA1FuoSRHNkBZTNZ14r9ZM9L8DB+gEzGS+F2jSlMOmuRJSF
         I4qg==
X-Forwarded-Encrypted: i=1; AKwUvBy8dN2mJBzN0hFYORFz5qocz8L2S4Un1sGcEEnqqxd4vKH3OUq0xss2SON34TDFGEP+vFfpmsFtDABs23I=@vger.kernel.org
X-Gm-Message-State: AFuF++mIP7TLEsmuPlNfVqFJuIhfzcQ/VdScb0H/dEiw6Chsx968bXt7
	GHWCKcvxpChRYX7LJqRVBjvHfocziFeY9gjMo9I/qlp11p9Ow7uYYVIG
X-Gm-Gg: AYBFou1YdswHuVQSYL6pyx88d0eXZxMQPQO2HbHZkhwzmoRk/cpoonvLNMpMkMsmjKu
	wB6AlbJSl16o1vE/RPztsOSd4/wdlMjJv5Rgk0Sh7Ce6Wp1pygREiZJk0Gz8fj2f12IpOTWktOx
	9/0DcZUFKiUkvd1oGcBYhWTVTGvfPocbA0dFA5844ytDUdeXNRKlThxEd7UykchfuJfr6lVDYmT
	i3Hptp/LfOvD6a38pt7WUB4oqXRjt6+BB0yoXwCInb0mgitr/lYVF32cZdomeWPX8QGkyp7Gn+M
	u0ocHnMxrgRpVWmJ8cw1e+rIokWUGXYdC5I3sA0DsoE2svOHDJqXO90Ct4AxZCq9gO+TDkOtQ9H
	6tGvv0IQa/2PSVgTXBynFcVJ6EmXXV8+6Vv3P3WXq8mLpS5BJz0AihdJQ1r+8gwJMz8i0hIztLS
	jX2GBL6Aj8Qh4djd5b0t4aeMS9wruLKn0EhqVL9wuaWg3Vr1/3VdHHJjuMOjEQ2P58bmFUVKZsV
	aqsedrDceVnkWA+Myk0jw==
X-Received: by 2002:a05:6830:83b0:b0:7fc:ae19:17ec with SMTP id 46e09a7af769-81783e88241mr15803831a34.29.1790609341691;
        Mon, 28 Sep 2026 08:29:01 -0700 (PDT)
Received: from cachyos-SlimIce.lan ([2607:fb90:9a26:9349::e71])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81d584f53e7sm1874160a34.14.2026.09.28.08.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:29:00 -0700 (PDT)
From: Jared Wuerzburger <jwuerz@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Samuel Dionne-Riel <samuel@dionne-riel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] iio: imu: st_lsm6dsx: Drop trailing comma in ACPI match table entries
Date: Mon, 28 Sep 2026 10:28:41 -0500
Message-ID: <20260928152841.68967-1-jwuerz@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aroutl04Q99mqJor@ashevche-desk.local>
References: <20260927220559.24169-1-jwuerz@gmail.com> <20260927220559.24169-2-jwuerz@gmail.com> <aroutl04Q99mqJor@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 28, 2026 at 12:09:10PM +0300, Andy Shevchenko wrote:
> On Sun, Sep 27, 2026 at 05:05:58PM -0500, Jared Wuerzburger wrote:

...

> > Assisted-by: Claude:claude-opus-5-5
>
> Assisted-by: LLM

Thanks, that was the format from an older version of
coding-assistants.rst. I'll use Assisted-by: LLM in v4, in 2/2 as well.

...

> Thanks, but while at it, also switch to C99 initialisers to avoid an additional
> churn (there is ongoing activity to switch all ID tables to use C99 initialisers).

Will do. v4 converts the table to { .id = ..., .driver_data = ... },
which also matches the i2c_device_id table in the same file.

Thanks for the quick review!

Jared
