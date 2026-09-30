Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AD944E676
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753228; cv=none; b=c+hh/Os/4QfWoTofLIDDru6Q+0KBAypNZoo+0xandSTtl4m0YBh1fO3kC2z44ymzVYMsshH5PRybFUAL/YaUqrWdgdQ0LHTCtHnm+fU7GoUe+Br81tb2jjWRYcQfhyV78tmViVYtJrizbjtRHHLPHmD7TkSl3zLka56LEd0lv38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753228; c=relaxed/simple;
	bh=D9vwwProX17BLsM0UFpS5a9cgtGgzRvu+3832nOt/F4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vf3CwanFqHG1IQoRy89rX+IOonTc/Z1YZmpj6KSkKfXci1610N4t92M5vyRfCQzhltlx2G25BTFc90mEuJzp5KCkJv5L689yIzK+FfHZa79uhEo6YHCBITU6ug0R/Bjra5iisegz7alA9FLJamF+x9MVhEHB9UBRTMYihT4JNqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6FHZTkr; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6FHZTkr"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso52294395e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 00:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790753224; x=1791358024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9vwwProX17BLsM0UFpS5a9cgtGgzRvu+3832nOt/F4=;
        b=c6FHZTkrbkp81Xos5XSD0I+jrxaLwk1zgGD2Xk/yWGrmvj74qKoGGv0c4tP4pkzvVa
         fLtJI3trYItWoE0HXLuVGrU6ZUW6FUPCdq8c3qR/Tl/ppfamGT9S8+uJ19oEiaMtULAp
         7S6URxniS/1f3RM3e6jZ4FPhsfzwYVWGd1ur/xV8e2Ees8Cy2kZRkbS7t3sRq2N2yobh
         3AdH56+HEQCQBHxLiOnt+d0NqS7E5OkYdpiSw0uOOd5LNoCO2L7GdfmcQq6DzF/XBzdF
         lYyXX2mbU91oiyL6bCabAIxg1TOEkPHC5ttFQ//TJNVeTpUg/Xz0DwdAFg14nnS/2i0S
         ha0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790753224; x=1791358024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9vwwProX17BLsM0UFpS5a9cgtGgzRvu+3832nOt/F4=;
        b=EbHtlM6F3PKJmr8Ee4SdzoMgESxWEuRc099R9rmIEOqlyzg0ZxMqbp5zRw70Zyclxy
         P3utx4vIdIkOhbPf5ExxQpD7XKCtmnhWUTg48g4ooHvZJHtnG/ox9W9EoFkYWBZaJshD
         n/TOf1SawpDtfbCZye8+WAUucVk9xEjJ2gPyOStz18bOnEDGN9WIuAisglWCaKsqCE3+
         7x1cuMvWGN6DQRrH4e1aRz4OkjqF9gEnQuqyToqVAit4J0SCmn0Yq0zOz5pJOUiOHDtm
         2hwN5qBo8j9THDZWBV1y1CqEH0QrInZV8svO/hn3fADDykJk0KCLzk9kUx1cVtWUhipR
         LEjA==
X-Forwarded-Encrypted: i=1; AKwUvBx0uHoiOnBTMjKevsg8MLjFxX7bJ2KS7Ip+vjadgfTjmTU6zVWsDo2Y6zDv46XW+dv3hQ0zMDlCYEmo2i0=@vger.kernel.org
X-Gm-Message-State: AFuF++mqNhFsDfSPocYQze+gKyRfYnCBumhELn+PMKizfGBwwnjybwRW
	eNceGRqHrPdWlZiuzw7Xgwz3gdcAx14ws4VLi26vAFJgG21/BfHwcR4G
X-Gm-Gg: AYBFou2ClPbiAg7rMVtEMUv7NqEs9ijh2zC+LI9jO9DwtIPo7JH66iL9OoVjlGMukTo
	QjaCuOlDv42qqYdePYVmFMdbWY/MLVJbJEB6AtGNOJFiiE7NK3Enu+csfQ9qCYY/ED7Nym7Yk8Q
	fabtt805rWwV1vz5EVcd52TY33fDgYl6vlCz6atG2ezIhBRL5ZDaiKVobFDhjZCytEc2HRMx41r
	ojeMxyVQUlBFy8rqb5fdMELn9rWqff4yfCZpN2Qbott78aOaAPzgvtz5/PCrDhS89TAS6jGd8d8
	Z2v9mRwUwpr0dbrDxFVl3C4pJnuP7GnhIJ08Y8+zIll0u7RXbnWoydl4wVV7jfuthwBbA8NEoVN
	7IInl48tSlLQ/N18MLiF27sokQKJCATVxAIwOVL2P9RlWTNQJH34g480dzlun9n7kzni20x76uj
	VH9Eqtwd5t4kSA3pOPjtDfYU/5HjjOgLknP8BdF4G0aZKIAmQmRG5x/DUTf5h89uFRSjCEL8xYd
	gWu
X-Received: by 2002:a05:600c:a45:b0:49e:6c27:d093 with SMTP id 5b1f17b1804b1-4a01afde48emr5913265e9.15.1790753224196;
        Wed, 30 Sep 2026 00:27:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a017520e1bsm26495935e9.6.2026.09.30.00.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 00:27:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next 1/2] wifi: rtw88: download the beacon the reserved page was built with
Date: Wed, 30 Sep 2026 09:27:02 +0200
Message-ID: <20260930072702.1981397-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <fd3beaf9c2e34b03890707e4dc663ef7@realtek.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Ping-Ke,

On 2026-09-30 Ping-Ke Shih wrote:
> If scan request while doing channel switching, we might deny the scan
> since peer (STA) might countdown itself and jump to target channel
> but no beacon listened causes disconnection.
>
> Therefore, rtw_download_beacon() fetches its own beacon without affecting
> countdown (channel switch isn't operating).

Agreed. v2 refuses a hardware scan with -EBUSY while csa_active is set
on any interface, and rtw_download_beacon() fetches its own beacon on
the scan path, which then never runs during a countdown.

Best regards,
Mehmet
