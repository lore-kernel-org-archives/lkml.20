Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880AB4908C0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784156; cv=none; b=g2x73iA7DyRHjhOeBUY+I4NjPXegDMWLVZo3BNaHKpBGlAZR95UdxRYfu6OlBeaKejV0UC86sF+m5hh7UrP5aGkT6EnZk8ihLWnevMoJUVRohl7BOq3QzniNkrKejfHvY7RF4Ico7Oym6dWm4Nq3CxQslYmNO+1nd3RiMMq2bII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784156; c=relaxed/simple;
	bh=9BFM3aJZwwSAMWa894hh/FwIZhRlBHiI7TetRzJ6tNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SItbqZqEahYW5aqM8a0RmhQgNjEopYN8C1gVG/bhlt6du8lUmj0+4LelGipBuclyrPePJjNZq20ePX5VSX5QzSvSvOdXIwQGAHLeI6lMBoMRMCbXR5GUuH6Y4wKowC9rGphDj9vw4oeVlKwtg6InUp4DgkTvLZ8/NAyRoSBwK1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezEeTYQb; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezEeTYQb"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66e611e7c05so2441534d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788784152; x=1789388952; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BAuZNiA5/uluN+xTnwX3MbZRNEexczkRLqDb6knuzk=;
        b=ezEeTYQb4Aw1hOIdIcJ+VGstvaaznl1S12jDOZlL6RZZaIa8sFMsWMp2pu2qm8yMoZ
         Nr4aGBZet3bvMGBDKjH32ZPRU7KLh0qy81dhFQ9XPauLhoovkLeL3OqyWwUnr4Cn7aZn
         vkX0K4J6zfGmYJ0v8q+IVSvrvm7SFwc/gTX5E2xpkgKir5jqrrjvghfBOBysU28OTVJ0
         wx30LxdwBsC4qPwTvTuefnknMvRgZqFSUmQohVKpO0+eJreB381HGuAHyOtDV2Mz4KaN
         t2bMiK3CIepF1dYSaTIBUih5SJYADt17eoWx4brgIYxNueReQo0cZJhqq0IEpGmzu7fR
         U6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788784152; x=1789388952;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BAuZNiA5/uluN+xTnwX3MbZRNEexczkRLqDb6knuzk=;
        b=EUrQ9tiHRAP9fq4/qLgKgxs0i6bcIe3za3HzZXt8sf/jrgKsCMDAJorqs+WDWXveEw
         XeedBszKgyyLLau0J4qpKnqObRQ3k/jn6vfMXHrNjz1IwWrYMIlLO3qYKkh4MvPaCWWz
         I3LlI/5F5TEvTxGKw0Y2i2zM3wfSfeZxkUl9rPsaQ88mHvN7Ojma3UmpgCZLAO8NTz4S
         2SgjzYOTJP+hQHp0HmdcEfVz/qjnMSOCXY43BAZVADYri582HLe/glwPxAPKP5H3QldE
         cYaUEH5lipIKj3PqJw5LMifMBk3Y2xzCgZYjZaf7VbFuKaOLmZBocRszi5e2y31cqpNc
         BpGg==
X-Forwarded-Encrypted: i=1; AKwUvByJsx+FhJjXJlXOpWD7oL0sNYVOoohsHWdQVhXnvp1nEdRfydoNIknTzSetoZHcuvOEX0pOcU+FPbzupmQ=@vger.kernel.org
X-Gm-Message-State: AFuF++lYCGpgsxEXUa/fK5EWiNJE+ZYqXgCGEthaGvYG0rNDDM4Wbv/K
	XVRx04u2uTKgv0bq7ipY8LNNXGgYCruBMEGQuc7iMhSZoDTleg1+YKw=
X-Gm-Gg: AYBFou1qySM3zig/MQwfV1Y9d3JZ3Gbh9B6ey+DBE2ndy/uKdOw6b9wn3CiZvO+I/BI
	6YIjeJcFYzFSWKSIo7B02PAuMW2wZS7de9HEflf4s8HJQ2NEvC6PUa9icAzPyUj9VBVkMlcGZoQ
	v55D5SKjrdPHVE4LJ7g6ZU0wkBM/uMvc80aKabEBeWI0mDVZq5gYZHE9WN7N1p0DggyJSm1jqFU
	AHdJDsJDQBcUZIiDrq+EzlxnYB5KFKfzFeaL9325XN9Q9OBLZm5dLQ5bbHZ6bUdNNwR16BqERf+
	uJztB9DpmthKDpa0gR/+epGOPqs44ZS7q68O34slVMUtj/Eodd23e5J17b1z7lC7ret8cyQuTwA
	6OEjXO0RsLgESYs599sCLLJ1xP0vX3Q0JmwCJKPAXExFnV/pk4Nfi6AtX/H/qr2jZkzZ7q0IoVT
	zrVHxI/exsbAz1fHzlCNZ1rtXlTg7TaTTjeYJFVcPAiCZNs7M/ayLIGSoE3J4YVCAuN7K6djox3
	/mccVgc54ZxUERvnklgW0D2V9MgKB9qUBnnccozXYL/88K32Q==
X-Received: by 2002:a05:690e:b4a:b0:668:9fa5:b9cc with SMTP id 956f58d0204a3-66fc19c3cbcmr5343158d50.0.1788784151674;
        Mon, 07 Sep 2026 05:29:11 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714bb0efc1sm70511967b3.45.2026.09.07.05.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:29:10 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Brigham Campbell <me@brighamcampbell.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v4 0/3] Add support for CH1115 Controller
Date: Mon,  7 Sep 2026 09:23:28 -0300
Message-ID: <cover.1788711082.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series add support for the CH1115 Controller [1].
It is a monochrome dot matrix OLED controller that supports several
interfaces such as SPI and I2C.

This driver only supports the I2C interface, but all common parts could
easily be put into a common file to be used with other interfaces.
I only have I2C to test with.

This is the first driver I write. The work is based on the driver
located at:
- drivers/gpu/drm/sitronix/st7571-i2c.c
- drivers/gpu/drm/sitronix/st7571.c

Tested with Raspberry Pi 3b+.

Changelog:

v4:
General:
  - Patch series based in kernel v7.3-rc1
Driver:
  - Fixed nits found by Christophe JAILLET.
  - Fixed max_width and max_height in modeset to avoid having bigger
  framebuffers than resolution.

v3: [5]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Removed "chipwealth,contrast" property (added backlight_device
    support in driver's code)
  - Renamed "chipwealth,invert" -> "chipwealth,inverted"
  - Added default value to "chipwealth,offset"
  - Removed 'status = "okay"' from example
  - Indented example with 4 spaces as stated in the documentation [4]
- In driver code:
  - Added support for backlight_device
  - Replaced drm_dev_unregister with drm_dev_unplug to cover the dt
    overlay unload case
  - Executing drm shutdown operations before turning off the display
  - Checking that the width (panel-timing.hactive) and height
    (panel-timing.vactive) parameters are greater than 0

v2: [3]
- General:
  - Patch series based in kernel v7.2
- In dt-bindings:
  - Fixed linter problems
  - Replaced first_page property with offset
- In driver code:
  - Fixed dst_pitch calculation
  - Renamed file from ch1115.c to ch1115-i2c.c
  - Support flip-vertical and flip-horizontal dt properties
  - Fixed several things found by sashiko-ai

v1: [2]

[1] https://datasheet4u.com/download/1576606/CH1115.html
[2] https://lore.kernel.org/all/cover.1786110720.git.nico.antinori.7@gmail.com/
[3] https://lore.kernel.org/all/cover.1787321297.git.nico.antinori.7@gmail.com/
[4] https://docs.kernel.org/devicetree/bindings/writing-schema.html#annotated-example-schema
[5] https://lore.kernel.org/all/cover.1787973729.git.nico.antinori.7@gmail.com/

Nicolás Antinori (3):
  dt-bindings: display: add Chipwealth CH1115 OLED Controller
  drm/ch1115: add support for Chipwealth CH1115 OLED controller
  MAINTAINERS: add entry for Chipwealth CH1115 OLED Controller

 .../bindings/display/chipwealth,ch1115.yaml   |  81 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   6 +
 drivers/gpu/drm/Kconfig                       |   1 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/chipwealth/Kconfig            |  16 +
 drivers/gpu/drm/chipwealth/Makefile           |   3 +
 drivers/gpu/drm/chipwealth/ch1115-i2c.c       | 885 ++++++++++++++++++
 8 files changed, 995 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/chipwealth,ch1115.yaml
 create mode 100644 drivers/gpu/drm/chipwealth/Kconfig
 create mode 100644 drivers/gpu/drm/chipwealth/Makefile
 create mode 100644 drivers/gpu/drm/chipwealth/ch1115-i2c.c

--
2.47.3

