Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251C153D0A0
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788871324; cv=pass; b=b8MzVDaPq2VVsXDUuLjSpUA0K7xlgV3B4gxfD8ab6MsI4mnkrQTQr/VRdA9f7cYzII3YoC9zFeEVjy28uiwKHgzNchzUQuejugFGEKVsejWnRX6f/T22Itv0irbCSxkIosmsJN/zdSvDWbYM03L1arSXqWunv6G/EeYCf/R1Rlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788871324; c=relaxed/simple;
	bh=FoFrigmlvBCol4gAOv1BVVUy6nOClXwHsZRUnMO/Rck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XJZGumDf1LlHoS5NP4S2fd0NvKGKUZGH197mGTvb+wJHE39nqu7kKZNdS3G/uBOMKWx2amsySTRgtKoe5AsFscjCUOnEv1nXp6r/BIBFubodaEDrDhHj23ZjBJefYnxZ8CgeEUngC0WTOsA8IxakiPuEg7A7u81OzBHm5B8jj18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPln5Zp3; arc=pass smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPln5Zp3"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c250f28f1cdso734800666b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 05:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788871321; cv=none;
        d=google.com; s=arc-20260327;
        b=WnIic+rYwkDlodj88sAi/FCDjKN53xHA49IVR0mJbHEidNVPRMpsW6q03FoTS6Up85
         BMrbBHFHOOhAergCdif/oSY+QsKozn9oY+w5klcX2nqdqpVtltguU0XTNYD6doBwt3i2
         KgGdCCgvbiXYAD1J3p6R5rWRyLkvlSAYXNPLhIehv5A/RKFUSYMMOyS9e7PEWrCeH+Cz
         K9DkldSMaxvDB06FYKZgCvbLoTY/bocVDhdIMQPZm8Wp/64gtCQyuaCTuDAAZCvN/xkv
         ilsGLYtlZw4keUzvhoQZvtcV1D+bGDX/nG/6YImfb3xIA34wtN+lQTjI5zEeeWD9r0nJ
         GpbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FoFrigmlvBCol4gAOv1BVVUy6nOClXwHsZRUnMO/Rck=;
        fh=zTrZeP7DcjXZGQKmmmIdDzCqrNblKj+Iu8Y1lI/hMio=;
        b=W40zo9p2ypn9Kc4pKadO9DSi8kNz0xrYYzuPr0V3lHlRwys2NhNoLBMlxWOaVhAeA9
         tp58WKmL8dprHQs+HH2AeJ8x7OAT7wGDqaW0A0c0kS4RB6XxtzhA6X/A2Px2Wlx439VC
         CWotDD+FJBofeCv/TW0DIcS6Lb6b0nePH7Ik04cXPuq+6BLKuB66jJpnkMomC0G8iZTZ
         H+HTzLLzKvDmusEDArRUEWdDsM/3U9G6DpfHZGA/FMuQMkaAdHn41Sz08oj5jyn+KJ+K
         ODoZrwpIIQyYnLkZYB2nMd2+IWEx4DWf41Hzn0LunbapRzoNpe5AXEd1vN0X8iP8A/1i
         CETA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788871321; x=1789476121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FoFrigmlvBCol4gAOv1BVVUy6nOClXwHsZRUnMO/Rck=;
        b=hPln5Zp3VVx4vs2pVzL4csIiFAbHnF3Hja+WUxbfU5mD5AWmppMCIVB4nAERESixV5
         3IYV7rqGZR6inPt+16Vc6ZtwRCDHjYUJ/kcmBf9CHPPjyTdLAnF3O8cumPFops1UMNW7
         JydV98T4ZEbVbcwLpTf5X17h/WPT+PMFc2Igc4aE7iQY0DiOW6rfyxUIs8QIylQ6PigJ
         YPWWI/TH7j40y7jJZS+gSl5qmaa3u49SFkYrO9k5lDlC81mPun0Ejp50v2vUQaH0qiXA
         CTOWch/1QEqi1iTVrBIeiurtjl6VUXcJBb8BrJnYZbXA9tQfYdwCKNPm5aqckandgYJO
         4inA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871321; x=1789476121;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FoFrigmlvBCol4gAOv1BVVUy6nOClXwHsZRUnMO/Rck=;
        b=kEzIwZPriNj/ULDVC8B9mykFyLcERF+nSLUkNByeWUy9HlU8sLcCETff//CgOPS7mJ
         9brRaTadPK6ziHbIkA80LrAeBw3Oz/SZ+/PRh/5WzbjQJ0O+5T0+z8vTiapEmljjGAD5
         vrV0/NMpFWP1PqzIKZti2lqqy+DnMTC83FyvssJh1bHWSPmxvxDv1MA4iImK0xLRhE29
         T4rXWsU7o0pVmKwpqBGTOOAi70YylWtaDYoh8+AxgtKG1/t8z5g+6rRW35jFNMWbqbH+
         mZX7cSXWeTjged1me9f9bWE7QQ/9uLDft8cCNSHbBWh+3RkG4t6IiTsckI6SCHJH4e0C
         HvZg==
X-Forwarded-Encrypted: i=1; AKwUvBy6lDHPJ80jePmBhRNf4Gqtk1Hc6iyhiv4NKiVAxHYYIg3vblZevwNtzj4/CHyRw+o+tIYdIWPNbZapSdU=@vger.kernel.org
X-Gm-Message-State: AFuF++kFsYGQBdz9johDvRNwz98k5AxOJmVZLZ0G9Wkx2mbQXy65y3OY
	+HIWhp9hnuk55SYNpULli22lzvBpDVQgoHtHnfHpJThkx11feHIrb5FgYtJKuOUcT39lfh8qfHx
	nD9CnC74RuF7q3MrjZWVjRCuQ/C6hLBs=
X-Gm-Gg: AYBFou3Skyz5cEbqCo0IWUHraXCVhtCVTn0cVTSxAJD/drwNBlHZ7wK9taxkDsDet2z
	DS2qEWMwMzyvPZnv/Ud1M2MYIyE763cMEmpCKcAyTO1yLu1kRw0h6J5oSYvssDMNR6e6uIaAqrU
	m4eS8kyoT8vBHGr2C7EYGxENcW2TSh9Fu+EftpjxwWVeNSYmlJ0HbgbiCMuH29gYS2Hgn8g9iyw
	wW1MUNuK6gdOLd8G0CyMAtwg7yXvzRC1ltXVCuwR+gDT3vk+WIbDQ067X+9HOCS6ue6oJCM1Ffr
	ORCAS+QzLGgjcVjyVa0tPfk0RtbKvjECHQwiwhjjVpwLDpDzYYKdtzbEC9gMJVwrb1afU3B6S7b
	LYb18K2Xtg30gksJsbaStnKX2buuhXnG6bvBfP0WkO6dn152HQFuMzFR7pwm3SRY0mHqF/EDsVz
	sZBTp15KHDk23vpYVaHDH2QAv8WaLgKQ==
X-Received: by 2002:a17:907:a892:b0:c20:3402:bd35 with SMTP id
 a640c23a62f3a-c260c988d8cmr1050021866b.12.1788871321161; Tue, 08 Sep 2026
 05:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908114047.1360-1-joshua.crofts1@gmail.com>
In-Reply-To: <20260908114047.1360-1-joshua.crofts1@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 8 Sep 2026 15:41:23 +0300
X-Gm-Features: AcwNN1WS1TCR78p_ZCpT7YYJ99OzAPGWGJrL9p5fNGsCglr8Gtv7IcE3tK5sR_c
Message-ID: <CAHp75Vd-LTwJU-SvVug3MNPzFYsOQFc7qQ5AiMDjHOx8XNkHow@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: max14001: add missing MODULE_DEVICE_TABLE macro
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Kim Seer Paller <kimseer.paller@analog.com>, 
	Marilene Andrade Garcia <marilene.agarcia@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 2:41=E2=80=AFPM Joshua Crofts <joshua.crofts1@gmail.=
com> wrote:
>
> The MAX14001 has an SPI ID table, but is missing a MODULE_DEVICE_TABLE()
> macro.

Is this a problem?

--=20
With Best Regards,
Andy Shevchenko
