Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74289312819
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966241; cv=pass; b=DDNj8g8zcEGsGwdCESWh2tArhzNR48H+sMyQyaEJkcMxsDIN+9CMvq0MqD8xzjcsHypvnQC+zQnKAumbfIs4DuBP4ch1NuTcumxOk8ED/sm+souZjnkLzqyaT+72wl838REsDUtFFM8tOYTZPcMMJGhzy+7MX90ax72GDnA/JyI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966241; c=relaxed/simple;
	bh=hkSfepIkuaA1BR2vdYKe9EUPh+zODoi/S7ln8yQ7GIQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=tDygRzIdOWn9z3O9T3pxS61Far9EpBCEWbpUvjr2+BHracHjjAVgamuMGojnZflvo+rbkQt5rHXz1QssTLZEXT2wkms9mEbIg2vIJjQyYI/YXLJKDkdS/KcFZujLyjhD+koEOVmW4FdAhQQtR3zlyLMrnq7HoHvQNoYdfl704SY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MCXxj0B9; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MCXxj0B9"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ea87caafeso5206124a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788966239; cv=none;
        d=google.com; s=arc-20260327;
        b=IHPx5ax7hMI2VoKJMhgLBmA8Hc+h99rjmr2aF0g49G8DwDqurQfPZw0+biNEFuoyZ0
         KUY9gaPoOiqaPJtpLo3JrEQSp5R4X6aWJ/ygNkPPPDaxFQ923X/0T4LTb4QEixdS/d79
         a/9trBNCUvkZGvZieDwY5GwXpa1rR2KqH7Q0DF6w9w8L4PCSjBkEiRQRWk2iYfz+8EoX
         IbGSHs6C+9aRcC7OmhlHz7xup8t1Srjyo3qmH6H3A0YsUoD5Wib/30r8vM1QnCWw2xCZ
         i18Gl/NOu5UEIE4QNcv6CElSngGrcBpmvXhhmetZEJ3St3/ms+WRk0EHxENu8POmGsey
         Jhkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=n/Z72raft7zwuNUvkj5sjKkqDryaZ+r6PhkLnJpg59s=;
        fh=CCBui1ESV1DWa4Zf6aoja97xha5I0aJBSMEAvZv6Zhw=;
        b=lVTy9cPVFVzfZs3B5eDOv3dkww9LGZa07dKyLKD1JNh/zHoMpnb8XOxm5DanjuIi7Y
         MPTSfPVxepzOzWi392WirOBF5Wr2dL42XROZcMOGWeig0oG9yiE77JN1xIrMAVs9Q4j4
         Eiu/5ZtydjrDZndVE4mE0CP8KW/MKNNFQl9G97Jiru0C7t6w7FGlJyJezZg+QWveq5Cv
         1PWbra885wdDcGz1AhATRrgwusoJcIZ5BHa/gOa2pHESRuZ+j3qcc0CCKHdmIAJNzJ1L
         iAiDrDGYnbhnhxjnA3cMCQzMNyXvuCpJyUGZl4408UzEViBqKbsS2iwK2bV1/nZT45VJ
         kdYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966239; x=1789571039; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n/Z72raft7zwuNUvkj5sjKkqDryaZ+r6PhkLnJpg59s=;
        b=MCXxj0B9n57vev65HwWxKaizg7tiKmsKfnykImftytdDJjn0S73WsNr7mLC/RkuF9D
         Wongqmt+H20nMh5J9YzgwIunWwufNGMwUGN2XyYwF/Q4vwi5vcG9uHz0Piqc1fP+JAXW
         9SC0pelY5hkl1TjrmXrxilAhTWt2YOcJ3yZ/yZjVso2ktdToRuXf7VTp08AU7JZtl4om
         cqipJE59StAAzlpNo3z1FyiV58QRwyyHyNLKN3bC0TRwY+50U/NNOpgQ0P6aDJAAXJC6
         u7hVPdzcKPsGBxtL6Mqxc0KpfW1Jm03ZCNS4C/0smYZExvr2gVIyFChxEE/hRgQyx4P7
         8Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966239; x=1789571039;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n/Z72raft7zwuNUvkj5sjKkqDryaZ+r6PhkLnJpg59s=;
        b=JQ6BdstRxVPONWsZenROnEG4p4XGZmHgncqt2FihDb5j9Pb6CljzlNA1Z+OsLEXUEH
         WmWJtEA20LdKCzuM5mqVYsZqcf82ne0S5bY4VXfL263i6UcjmmyabDN36QKg4FQK9t2F
         aVl1rdfunLJGw6MA9ge9f15fAYiQsjqCdFvdbS7+jOS2cmwebC2McQiR8rNDz75lwlpE
         rMBKN3+oVwpy9u+uoX5telIjJNzohEchuj/SxPQGpwaVAO40ky9KfyOUNRpkMIhDRX2G
         msePq/rrwymesED5crOojxz4ik+KorIEq5f4So1Au3dhoCP1e5X63FQD3fHNc7IO/RCR
         sDVg==
X-Forwarded-Encrypted: i=1; AKwUvByDiAJN4HA5AHQmvIVK4PB0qCMdwB82cM4xNMMtfUAjCVT7RDpBApqJOGNL8I7hYYiT50ar/WWzSO25EzU=@vger.kernel.org
X-Gm-Message-State: AFuF++nQDmTHAI0TVIzV99OrKC18PHADtHVPaknXZHbhstCguJ90jV+N
	XFd4/VURaYX3TxJvC6mFBW5R10+Pj9jysOWF0jtojLCYagxQaZmEgscRWvUdSkTnAkndGkSCNNE
	EdOpuq8P3MF3kBpns4tm5pfhNHv6jsoQ=
X-Gm-Gg: AYBFou1xvP2wv0BzScN1Z12lLcPAcNfkewYVLLMMP9hDx8zIP/GfFGhlQhzKWd7MECZ
	6PkqmpxNFNO0asnUoDePotDO6o3w2MlWtFKVIdw0gVd+JxO15Y7QnBhS5bguf7t5hsEWSFE10+U
	IhmtUYv7XkFiRmyPcIYTx+dentK4H0K63QeGr2C2g53ID4RzVQMPYX6aMqkO0LaMDNzjyF8QZik
	VL/H0nAoWk/fIOiIcLSQ/I14PxJoatpvsa+99Q7cH3MUWhuhrQVOnk/MOphYoC/EGbMAgZ2jETk
	UW0lYDoJf1XHnKJeF7jO22+/U9A3DKdX6l2ZwCYoySkYptEbhFZd/M+RQuyu0qW69tjTk4LKCue
	3wChpQK48Ng1cTQIBRiMFA5j5sBMFRjhgO5nh3Q==
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id
 98e67ed59e1d1-39b260dd3efmr48184331a91.1.1788966219133; Wed, 09 Sep 2026
 08:03:39 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:03:37 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:03:37 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jinseob Kim <kimjinseob88@gmail.com>
Date: Wed, 9 Sep 2026 08:03:37 -0700
X-Gm-Features: AcwNN1W19s7315aGlu8LliS1GT-z2uNC5wYBGWEEN5ram-BzdPYUuwtrZLJmSEE
Message-ID: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
Subject: [PATCH v9 0/5] iio: add Open Sensor Fusion UART support
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, joshua.crofts1@gmail.com, 
	u.kleine-koenig@baylibre.com, julianbraha@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This series adds the Open Sensor Fusion UART receive path and IIO
devices discovered from capability reports. It exposes accelerometer,
gyroscope, magnetometer and temperature samples through the standard
direct-read and software-buffer interfaces.

Changes since v8:
- Configure UART at 115200 baud with flow control disabled before enabling
  vcc. Acquire the regulator before opening UART, retain decoded early
  capabilities, and publish IIO children only after fallible probe setup.
  Close UART and drain receive work before releasing receive-side state.
- Give the aligned one-axis and three-axis scan structures explicit
  padding members so designated initialization also initializes the bytes
  between samples and timestamps.
- Pack selected channels into the active scan layout. Tests found that
  forcing an XYZ producer layout could give X/Y/XY consumers a value at
  the timestamp offset on the target IIO base. All nonempty masks remain
  supported.
- Quiesce pushes with a driver mutex in predisable and admit them after
  postenable. The same mutex covers the enabled check, layout access and
  complete push; it does not claim IIO buffer mode.
- Keep the latest-cache rejection rules and add KUnit tests for early
  capabilities, scan bytes/timestamps and buffer teardown.
- Tidy macro/call alignment, shorten the driver commit message, and
  document the actual receive-side compatibility constraints.

Protocol specification remains an open review question. The accessible
historical protocol-v0 drafts at OSF revision
11d11eb413e6a0e861e4d45fdccadc71c5f15c48 disagree on reserved fields,
trailing extensions and magnetometer units. They do not establish a
versioned normative specification for this implementation. The driver
requires exact known payload lengths and capability scales in IIO units,
including gauss for magnetometers. Documentation now makes those
constraints explicit. This does not establish protocol maturity or
resolve the request for a canonical compatibility specification; feedback
on that requirement is still needed before merge.

Validation:
- GCC and Clang W=1 kernel/module builds with automatic stack
  initialization disabled.
- Eight OSF KUnit cases, including all 44 sensor/mask/timestamp
  combinations, retained latest-cache regressions and controlled
  push/disable/unregister interleavings; Clang KASAN and lockdep.
- Before/after padding byte and generated-code checks, an auxiliary ASan
  demux race harness, and 16 modeled probe/unwind/retry scenarios.
- Strict checkpatch on all five patches; clean apply with matching
  intermediate/final trees and per-patch DT, documentation and code
  builds. GCC and Clang final links pass.
- Fresh ARM64 Image, modules and Pi 4 DTB built from the final tree.
- Raspberry Pi 4 with those artifacts: four IIO devices, direct RAW,
  12-second simultaneous capture, all 44 scan combinations, 400 buffer
  transitions, unload/reload and verified return to the stock kernel.

Conor's Reviewed-by is retained on the unchanged binding. Randy's earlier
documentation Tested-by is not carried forward because patch 2 changed.
LLM assistance was used for the documentation, driver fixes and tests.

Based on Jonathan's IIO testing commit
edb91bc566576f6664a3efbad6bd4205aa1d5259.

v8: https://lore.kernel.org/linux-iio/20260820050608.5440-1-kimjinseob88@gmail.com/

Jinseob Kim (5):
  dt-bindings: iio: add Open Sensor Fusion device
  Documentation: iio: add Open Sensor Fusion driver overview
  iio: osf: add protocol decoding
  iio: osf: add authenticated stream parser
  iio: osf: add UART IIO driver

 .../bindings/iio/opensensorfusion,osf.yaml    |  52 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 Documentation/iio/index.rst                   |   1 +
 Documentation/iio/open-sensor-fusion.rst      |  84 +++
 MAINTAINERS                                   |   8 +
 drivers/iio/Kconfig                           |   1 +
 drivers/iio/Makefile                          |   1 +
 drivers/iio/opensensorfusion/Kconfig          |  27 +
 drivers/iio/opensensorfusion/Makefile         |   7 +
 drivers/iio/opensensorfusion/osf_core.c       | 414 +++++++++++++
 drivers/iio/opensensorfusion/osf_core.h       |  73 +++
 drivers/iio/opensensorfusion/osf_core_test.c  | 577 ++++++++++++++++++
 drivers/iio/opensensorfusion/osf_iio.c        | 336 ++++++++++
 drivers/iio/opensensorfusion/osf_iio.h        |  22 +
 drivers/iio/opensensorfusion/osf_iio_test.c   | 325 ++++++++++
 drivers/iio/opensensorfusion/osf_protocol.c   | 224 +++++++
 drivers/iio/opensensorfusion/osf_protocol.h   | 101 +++
 drivers/iio/opensensorfusion/osf_serdev.c     | 162 +++++
 drivers/iio/opensensorfusion/osf_stream.c     | 231 +++++++
 drivers/iio/opensensorfusion/osf_stream.h     |  53 ++
 20 files changed, 2701 insertions(+)
 create mode 100644
Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 create mode 100644 Documentation/iio/open-sensor-fusion.rst
 create mode 100644 drivers/iio/opensensorfusion/Kconfig
 create mode 100644 drivers/iio/opensensorfusion/Makefile
 create mode 100644 drivers/iio/opensensorfusion/osf_core.c
 create mode 100644 drivers/iio/opensensorfusion/osf_core.h
 create mode 100644 drivers/iio/opensensorfusion/osf_core_test.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.c
 create mode 100644 drivers/iio/opensensorfusion/osf_iio.h
 create mode 100644 drivers/iio/opensensorfusion/osf_iio_test.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h
 create mode 100644 drivers/iio/opensensorfusion/osf_serdev.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.c
 create mode 100644 drivers/iio/opensensorfusion/osf_stream.h


base-commit: edb91bc566576f6664a3efbad6bd4205aa1d5259
-- 
2.43.0
