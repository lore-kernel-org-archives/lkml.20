Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E8C52F29B
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915502; cv=none; b=YJ0We+HRRIoisRGcEsSS/vNW5JaBbZkyb8SXW772ZqXgESTj36FfWHq0qK6Pu3sOhIR6dDoL4mU7yJ1FpykzMbBDU1rYZqbykjOpaRuOfYJvBCHWR2rGCUCqI5Fz/TkieTSq4h1jWMaYaZ88ZEuBKe+qkHUfrqRdJrDERwmTdA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915502; c=relaxed/simple;
	bh=nxoM6aqmzwRV8bE4p6kF3mZpEO4PV/m/0sBGUc2ECkA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyFI2Apjs2pIGyVYFoGE9+q2cRj65iBaKQK49kGOXRLMtYIZPlXU9kYHyQRW99zSI7zyDVc7Ez2oAEM9eQIIASIvQEnWCY4Oc0b+C6RBN1tzpF2J030mhs0PuumH2EyW89qZCWoOqKAbWPhS0PnGXmIyyGMUO0TnFfd/udDtTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0EXaT74; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0EXaT74"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so27487315e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915495; x=1792520295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=E3hQjmEMreIOp/z0zH8ILmz0PDZuKIXrXvhSTza6jwU=;
        b=Y0EXaT74IxmPk6Gm057hWy/QFEVGQheYGSjsaVWWit6ogybM15dEsBYkRDKJuJgYkB
         ZYFRDLTfZkDWguhVVfFV6caxQVLNmWC7DrqTDkwW9+6tqF8ti/BVy1afyjjIjJuM3CRA
         dJnZxUSsVFppFFHviNheWzjNmMdZc0C24biruwEealLwGoMfsmhOEZM3wP+/jfjALKeU
         NiQhy6qGD468Dla54HW6s5WqwFqAU07WftGTzl6SL74g3ek+y9agntGB/VLWbYM4kOBZ
         B6XUzOpYNi5+JAoP+AoSNL0Pa2a5cKvpyOU/eb367ed+ELHryuQLAzE9hvtKWmndxto3
         oYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915495; x=1792520295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E3hQjmEMreIOp/z0zH8ILmz0PDZuKIXrXvhSTza6jwU=;
        b=wOMldIrVNHrrx9gBxgfDILUgZ54dNMVpttJ0ri0WPlikrH4MJpRy/T0y95GEEfdtxl
         ovsNRwPrMGWuGwCOhP5lgww+MDsMFY4eIvZ4EG8Z019b6Z2yifuuzGpeO7QYgk6kfOWW
         EQPoqLWTSrD/Ie5A+Ck24iF9IpCcKy3OOMNA4ESL/GJuIJy+kH3CBOMz0Kkj+O7fOFHE
         jSZ/gaA8ERFxETdHKwRZZn0QcmnEoSU0X9ol8fDHMZxAnx0wqJJI9m3sxt0i4lhGhZm3
         CGfPky0NV6zcQHUh649s14ydYTow6fz8xlUhivoOfvUTeSORA+IbtSfx0sFs0w7dZP1O
         QqUg==
X-Forwarded-Encrypted: i=1; AKwUvBxm82/SOKfZk0MSQJhV2Cfus+q3Q+jQFk0ZASZOdybGs1tyF2kWevMigNMgX6NF/EX8QpKVpte0tim2OFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNSU2j2cFY2lvo85KlYX08V30vn2+Wffo3WgPddPgcwc7rHWmN
	x7gvX6U77IvWFc9N3T0vhtmmWqMN4M4Wb5YVcv7DlwlIFzZPOR1ugwXM
X-Gm-Gg: AYBFou0nxlXtl5lYRN9xnBxaHlGhNf+jzUhbIvObVgsHVM7Y+nlMhb5sAMX38IJEXH6
	FSEzOerwaCzidm8u9FTat6AdAX3nr1oQAt+ylr/xvHV90noiGZxXZBP95JqUfzVNngibu4OPBok
	BdlYkXYYWyCKXWCRw21w/mVop02XgZ/TSyS8cBNJ0ljUcKByCgF7icphJ+tjwzZz1A0SS0J3xiZ
	Gr22Wo/ue+tEnCz3tThCvfCWK2mdxVrk7VMet666gvLDu3R1crTM+dHB+3gJqtNfRQ/MGkurley
	m9UCRDOuvkp9scVg+DlmL8Lm0QjSQPsHY1YSXhCR0qWTJpSDIbJKgiSmPLWEbTCXALV7AELy6ef
	7MumaHwoJTv7orUcP3KiWMEQ1wKUKmYSWNC9K4/BHnGOBAtgJE/dQ/kqGGFNouu66NJn5xcQDRy
	FhVnXMVCI8w6vx5zH4f6N+8OfixOl8YM05C3xiU/23AOrVxib2UuE+63L/2sHwGOUTVGhQDMIZ0
	Cd3IbQNJMPOZqIBHy8=
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id 5b1f17b1804b1-4a18e4a003cmr266822965e9.11.1791915494922;
        Tue, 13 Oct 2026 11:18:14 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] leds: aat1290: Add support for AAT1270
Date: Tue, 13 Oct 2026 21:18:00 +0300
Message-ID: <20261013181803.496627-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AAT1270 and FLINH pin, adjust driver to support AAT1270.

---
Changes in v2:
- added formulas for calculations
- adjusted mm_to_fl_ratio to be set according to chip info
- adjusted timeout configuration to be set according to chip info
---

Svyatoslav Ryhel (3):
  dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current
    Regulator for Flash LEDs
  dt-bindings: leds: skyworks,aat1290: Document FLINH pin
  leds: aat1290: Add support for AAT1270 Current Regulator for Flash
    LEDs

 .../bindings/leds/skyworks,aat1290.yaml       | 13 ++-
 drivers/leds/flash/leds-aat1290.c             | 91 ++++++++++++++-----
 2 files changed, 77 insertions(+), 27 deletions(-)

-- 
2.53.0

