Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385727;
	b=Fm/cJR14w+/Aqa1jWdd79aFRVcSVeIXDa5Op2hgYdNBkDlkH9HeikY5cCfO32VKhlxej
	 jkyhUfP1pwQaYnan/dD9MCW9MWp5+VBdlewHTkXbmybG37KYBQ0St4SpmzqK40Bf1URDZ
	 7pnoTZ/9Akx0NcD30YLZRRlF0qHBwthqbOZcNw5Os5JO/YgM7eXqz+9/szh7+77LSaz5x
	 MoH1In+b/q4YmuKWfbzh3kpP+Z9qb3WvRC2w774gt8dJXj1kVJS67zLH8vO9jCFIy2SKI
	 KrNjuI2VfWSp7GPK82ibq65qlR9240q0z6zv6PhzRxJIBD3eQLNnVJU8psejpqK7JmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385727;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nLsYYt3mI/eDGnhUV9HkZE5A3HHR6uBsCx1xZC1MEv4=;
	b=1cGt9ZfRvsaaRYA4EaDd652FxD2WS8NmjXsN/LV1ujZtaeAZ+wL/e7gWBhKPH9ijhEOu
	 7Pl9NHnhAQtYCiAttmBabkLTQZiQmsSess9Kc9ODfAD7W0VXAsDb6qIb430YPAQYV/Zp4
	 tSsEH/ye26LALtx3XPlXTtc86kwDYw7Xy+5w7Qc5LhPnhTCtwRPwauubSC+G3vH5kxMd0
	 sFBAPw+/vfrdV/ek+w5kWN8Z+acNfpt4STxF4z13EUjuzH2DA/hPRV6oydMCiPsHRGXcu
	 dxEuisXK7A4c6dNGd+2Jz/W5TQdJkswFK/CPBl7VlWf+YtebhJfgHDXic8AYyGeeyLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzzTYXFL;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770BD606A339
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 770BD606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WzzTYXFL
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c4d28f75d62so395412566b.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385726; x=1794990526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nLsYYt3mI/eDGnhUV9HkZE5A3HHR6uBsCx1xZC1MEv4=;
        b=WzzTYXFLYguLfwGt0FKAR3H1jcizpt/6hddQEqesa8HRjEXY58T1Pr5zf1Mm1hGNuT
         /oVatvs6tHltKygAbJS7W6mDqX3cPhsy44rSlrzBbmf+KfkxEnIXMfCJSdcgF13dYwgh
         AwldHAMnJSnfgExfO63YtTo3bRqQJJNrg2RQmd0I9f4dZ7tMWaHXt3zMqLmhNHBNnESC
         bRpbkXLQVU0A4TNEAN3BLm1mxjzWYrDQYfDyXtsmCc0+7/pEkBIcvRh2a/9pNxtAvoqg
         J7bPRMgNUJIwR6L0V5S+awR5boMBgVNelxvlOVn1q9qEw7032esvZsov2YX7OGkd5sbV
         w4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385726; x=1794990526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nLsYYt3mI/eDGnhUV9HkZE5A3HHR6uBsCx1xZC1MEv4=;
        b=n8pJcD46XzmHGU/r2GFW6ORjCaxS1OfHtNozkcbSorExKfKSPBBkVs5anndbU/rfto
         HYntm+b1KSWLXerhKXp3Tb3S11CBc8n3mvrN+67kd5EStx/CTgbfT0V/Biy2KoVwrCOU
         L6zcA0oVtlPoguUMhot4zIn1a5BFpnmk/04pA2UBgnCuAw8GJbkqaDbWe/cKxFqzfzA1
         JHtAt575hqIOmb8UwXlKSIts8mkisfhjJ71Rfygia8ISF72miI8esj87q3SQqx670UEJ
         RrrJr/NujQNuKq639KN31057gf16lzJnX6BTWUagaWM0SBMhQfmowiLY6Vip9RlBd0fn
         y/IQ==
X-Forwarded-Encrypted: i=1; AL+hErFEIRodE6j61EEsS38WgTd8Zd7+hoMVss0853eVn1Zj7TDJ0Gtnvop88fee7zVoBRziXHdmVuslegqGqJo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jvdpyM/TkvvuZBLob2ZwF7IZvLs1mTg2NVxoQFl/B/bySVTUZ
	PKDioaE7yII/nJKy0oWozMyq/Dg8ZTCW88RfNkbrIojYH5Cn27YJEzzM
X-Gm-Gg: AYBFou24swmXcIa8caGcQFxbrpibTjH4IVdUK6jVnAVediXwali38+nzIkHZWdIb9n1
	DoJ1WrNrFSfTQmbAKdtv+TqxP5/C0WR6lqbHwuc5ifxqK4xFhF3Q9tDmBc/gqzU5eQiLrAsZWaZ
	5yZ9pa5cCRMg4oSBFO/zpUKBriE76qAdaX/6HSYp7PqSD1EWwrF0MSYdPTnMPs29FwReUt81RpE
	UknxXlXC1McriIVNvNaPAGt6cMMjUBHN2+23oCsFpNRVt53eVLScrQwiHTa8ZXdWYeqkWvV8D9t
	JlUkrpuxuuMicZsnNWAfXYwNrymKStBQNSf0SHSL0dUTxz/F5kaHhMsvLi3W/e3Fz2sgaABGh0b
	i3/MA9mWN3kj464XKH83S21Zn0h4q+5QlNbESET6h5euAlNd81zbd370oWrkJKiS+WywmEAANr9
	s6d4GPKSOFROgs3QluL/a/j0fvMVREYE0D8XxJuqRrcTr2iNogOjw+HkKS8LB0arLg+5+jWeDTY
	sUr6AypWSCD631BAgCRXTn4prGMasvkb/JHVJbDYXCrZ5LOwybLCe9DQ43aCvTrLUQa10NeWwCj
	th6vNj8FLDa+cR8tjobtOQWWSsBM4geKzBStc2ps3KZevryc7SKan8A4rsGp3a8zfEk5R7Ig1xr
	XBss/bynjpRql3GksZLVG08yOPWrWULum60ELUhSDnrwWibqh/08wOii5vbdWWeiYgeqf/tgeGu
	PH2fKmvXVQjYVZd9fFVNrVWxWDctWXfxoaL7LRJEe8YrfNJODS31IXk1nmg/2kdD7OT9Y=
X-Received: by 2002:a17:907:a909:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c506684dc60mr118230666b.6.1794385725683;
        Wed, 11 Nov 2026 00:28:45 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:45 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 0/7] hwmon: (nct6683) Fan control and sensor names for ASRock NCT6686D boards
Date: Wed, 11 Nov 2026 09:28:31 +0100
Message-ID: <20261111082838.1418051-1-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ASRock B850 Steel Legend WiFi (NCT6686D, customer ID 0x164a) to
the nct6683 driver and enable fan control on it, reusing the NCT6687D-R
fan control that landed in hwmon-next since v1.

Changes in v2:
- Rebased on hwmon-next; use the NCT6687D-R fan control path and
  have_fan_ctrl (Guenter)
- Dropped the pwm_enable and pwm write retry patches, both in hwmon-next
- Restore automatic mode on removal through the fan control path
- Added the ASRock BC-250 (Fabio Baltieri), needs a re-test on the new path
- Added sensor names, fan header names and +5V/+12V scaling as separate
  patches; the M/B thermistor and the fan header order are inferred, and
  the scaling patch can be dropped in favour of sensors.conf
- The struct cast flagged by Sashiko was fixed in hwmon-next (c4a01c2a80b2)
- Kept Alwyn Kik's Tested-by on the unchanged patch 1
- Link to v1: https://lore.kernel.org/linux-hwmon/20260825092546.669450-1-jdahlin@gmail.com/

Johan Dahlin (7):
  hwmon: (nct6683) Add customer ID for ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Restore automatic fan control on driver removal
  hwmon: (nct6683) Enable fan control on ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Enable fan control on ASRock BC-250
  hwmon: (nct6683) Name the sensors of the ASRock B850 Steel Legend WiFi
  hwmon: (nct6683) Name the fan headers of the ASRock B850 Steel Legend
    WiFi
  hwmon: (nct6683) Scale the +5V and +12V inputs of the ASRock B850
    Steel Legend WiFi

 Documentation/hwmon/nct6683.rst |  10 +++
 drivers/hwmon/nct6683.c         | 140 ++++++++++++++++++++++++++++++--
 2 files changed, 144 insertions(+), 6 deletions(-)


base-commit: 44c8ceae2dd3ae536c5f4f956cedb24c157aac23
-- 
2.53.0

