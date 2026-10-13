Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ECB526A80
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904663; cv=none; b=jjyf1hB7xWwNPnkXTWyXys6rnyG18EcqkK3AJgzHDiVit+t+0Pd7tIaneIaRxX5qIVM5CtSYuurXcCbJkg/4piurGpn7OKecefa7qzQW3sVfZhsM17CLO3DzoGyycyf1dyc+oapZ2mwlVnktr3dsEBJO2BnVhQ+bgGWhpcRQsck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904663; c=relaxed/simple;
	bh=J+AisZ3Sz6MrlsY1i2kbJokelTSfW+Ad0UKI2E/gXe4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mp/J6P9CPq1H3ZVggjD9dQ0gASieqQpQG4SYDQjQ/Nufdu9PPSw087X6xftRNJEsMQI4guJvkqNUq9tU4JMjFr5YMVHOz9jUfZVvFa0dAuMw/X0t6C7cSkWkUGK3YoP4XrgfvuDTTSN5uTMxzLX1Qt7a/0Ulb7yREp2D5liyDFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=TRrwaCYz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="TRrwaCYz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so2829487f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1791904659; x=1792509459; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=En0suO18R4o3yz7vXZ+ZIS4o6qKTdbqbAzANkCBRAmo=;
        b=TRrwaCYzQyrNVfQ788VFlBF4gFPUiNybOeBrmxz/Fd7fMEOoI8Zq3WqVA/TZTfio5y
         R/YgQ8rNBKPOBVljgF826aMjWB1aAJhwnfVWr1dPqeJCoTZC4NMkcwba7z8Hqb4w/mef
         1jfxIAP37qUmgIrVixUz+IFb5P2Jn6YMmY40AOAE56HkaTY1ZL4ylH+z9xjVzjZmDvaz
         YN/Y5g8Y9wKvbnYYcec2Hr6l97j1M+ZydC9O3/y69qTxyorQBH5knUWthxdyYB72gZxp
         vLaDlJ07LExKtNXmFo30j8rvn9YuleGqmv8rQ/0aPLKBEBwJ/nbJ4CloKE1SkII/dl5s
         n0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904659; x=1792509459;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=En0suO18R4o3yz7vXZ+ZIS4o6qKTdbqbAzANkCBRAmo=;
        b=EBeqKUvaqtWAXMcZCH9nt53E9qxJUz3KmhYZJaWw1DPre4cXeSaiI+q35hm20fer/R
         YfmztrF8uNTr5gHlfr2RTCcKjxDfVpcWJY3H98FKSHEEX9atCPXwMPuxgjok32M2dFow
         9IWtfluaaZa5kNfbd5+JjJdvKd12m5CuWQLhNRhsDpvuMUceg7Pfq5cn5oWfrqI8F2JE
         OPjWa7Ubmuvv3VGRuZt6IkXooFAFwnr3r2/5z+Lly4XmlTotOZqLdK2XwngEErcS4iE4
         0fopCcNWi9PHQbNpZTXQrPLrQb86NPHjJHVJgiz0O+IuN/W2Ad2/TG0BSOqDGDDqgKN+
         Jw6Q==
X-Forwarded-Encrypted: i=1; AKwUvBw9p0p9XK9ZEg6ETBohpg6z61mnI0fAL6aDXEWeYnltmf66SgaWfK76nYvvCLqAq5saR8hSQ7qDsyIxbg4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSQrhLiKMP1+NjMU9tLHdEcCzW/Xm0iGO9WaC5PJJO8qCgbHqS
	1nlDt+1xrjgeMvz9WKa6y7huedZn5Lf8il6iiAKHu0uQDqzOlAFiboxkF+XbVgVmoi0=
X-Gm-Gg: AYBFou22XWK9BYApbs4CK9zDD35sSBDwoQftLRcYnAcID+Bb9e0lXhwYJWF3CAAt7dj
	ghoOj/99hoSAPXJSY79Fq43//04BhRXFl2Y2bWyBgUAXBkI1oSl2b60xIKelQV+beCc4tmisw2J
	WG6vtARmBQYp/+f/oOkPfxqjpkHIs2i/pchr4JN5pntm3rs+Yp2NzC6m/bvCrKxUI2hnJp5r01I
	5jNQ7oeCm1x91tjLZCx3OlUlWmcQVyQhfZyFRR+zNvfXH+9I0h8GNX04/BGeduEJNtDPQFXzgQT
	/YlDL+hBMWrxe4kZGukUz7nSId5JPogGnic8CY7iwDvprJcWuul/+/cJyrbkCqcph4k2MBU4POc
	K30m8fkxhBljxK0MUqs8guTFpoELGvkZZM/ER6Onts3hb+fFd7CX1R/0f3EUBkZq3kigubLhEt8
	6aml6n7TP2bj693mMQYjCqqclhxQy6hi6/6jaSnIcwURu3B1h3SIZGHQB+zLnpKU1NzG/UBtXy9
	+w4Fo6ispCkbn7j85eT0abKvA7W08yZHpl7rdRuB0dwt3qp4g==
X-Received: by 2002:a05:6000:2685:b0:48c:6724:b67d with SMTP id ffacd0b85a97d-48dbacddb35mr24003904f8f.38.1791904658905;
        Tue, 13 Oct 2026 08:17:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48de0aaabb8sm6529743f8f.15.2026.10.13.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:17:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH v2 00/13] Update imx678 to act as a common Sony Starvis 2
 driver.
Date: Tue, 13 Oct 2026 16:16:59 +0100
Message-Id: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGtLzmoC/12MQQrCMBBFr1JmbSQJk1pdeQ9xkaSjnUWbMimBU
 nJ3g+DG1efBf++ATMKU4dYdIFQ4c1oa2FMHcfLLmxSPjcFq2+tBo5ppZK/y5qWdreqddyGiduG
 C0KSJ85Zk//aKafP4qe5fLUZpdTU0EJInxNddfF4Diewrn2Oa4Vlr/QCB4rpLogAAAA==
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The IMX678 (8MPix) driver has already been accepted into the
kernel.

Whilst preparing a patchset for IMX662 (1080p), I observed such
commonality between the two that it seemed sensible to attempt
a common driver rather than submitting a separate IMX662 series
again.

On checking my box of sensors, I found I had an IMX675 (5MPix) as
well, so that has been incorporated. Subsequently I was able to
add IMX585 (8MPix) and IMX832 (1080p).

The Sony datasheets are rather lacking on the limits for HMAX.
They list HMAX (and VMAX) values for nice round framerates at
a number of the supported link frequencies.
These limits have been adopted for IMX662 and IMX832, but for
IMX675 and IMX585 they have been determined empirically by
observing values of HMAX that start to introduce image issues.

Now cleaned up over the RFC V1.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Changes in v2:
- Switched from an RFC to a patch set.
- Add the dtbinding changes.
- Added IMX832 and IMX585. Tested and fully working on all 5 modules.
- Updated 2 lane handling so that the higher link frequencies achieve
  the maximum frame rates.
- Adds a patch that corrects the minimum exposure time.
- Allow userspace selection of all link frequencies specified via DT
  (makes testing all the link frequency options far easier).
- Link to v1: https://lore.kernel.org/r/20260805-media-starvis2-v1-0-91e8e4eae44f@raspberrypi.com

---
Dave Stevenson (13):
      media: imx678: Rework into generic Starvis 2 sensor driver.
      media: sony-starvis2: Reorder link frequencies to remove lookup
      media: sony-starvis2: Always program the sensor in window mode
      media: sony-starvis2: Parameterise the configuration to allow for other models
      media: sony-starvis2: Rework 2 lane support for higher link freqs
      media: sony-starvis2: Allow runtime control of link frequency
      media: sony-starvis2: Correct the minimum exposure
      media: dt-bindings: sony,imx678: Add other Starvis 2 family members
      media: sony-starvis2: Add support for IMX662
      media: sony-starvis2: Add support for IMX675
      media: sony-starvis2: Add support for IMX832
      media: sony-starvis2: Only update bits for window mode
      media: sony-starvis2: Add support for IMX585

 .../devicetree/bindings/media/i2c/sony,imx678.yaml |   38 +-
 MAINTAINERS                                        |   14 +-
 drivers/media/i2c/Kconfig                          |   20 +-
 drivers/media/i2c/Makefile                         |    1 +
 drivers/media/i2c/imx678.c                         | 1447 ------------
 drivers/media/i2c/sony-starvis2.c                  | 2314 ++++++++++++++++++++
 6 files changed, 2368 insertions(+), 1466 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260804-media-starvis2-65a5bc405b74

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

