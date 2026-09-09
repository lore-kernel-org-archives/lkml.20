Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B44F55A5
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966341; cv=pass; b=ifphSdtDI9wIB7dcjOWPu0NQbAeZInhEJ49noosMDPDnHUl+jXUdX/TqWODSV4hSH7NX1hrOI92l2x7BRP2xlE7Ww1TQJv2qd6bN/oxDa874AdxyLLb2bA5jBg2V2KpGoT5ZhutrLlRymcHG1S2ys0/4sLy6i2vafYejxCT4MYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966341; c=relaxed/simple;
	bh=CdSWv/WiURR6Acy7P/4aVQQtslC45I4dSTkhDw1BvgI=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LDbXOOrNlus2SSb0FY9yoYk2UrMlDVtlYzerV2FbuyHXRaAAATUU4oH7RLT19KsDu8jVJmFlewBTNWn9jyUs0B5PuM/xooXydmL+CLswU8U4e2PiPi/B9NIloXoYv5JZzXM1RXtnGN8LhuGHrajklq1SKX6tVKJ0+QOtLWAfiJI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MffD7ozd; arc=pass smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MffD7ozd"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7f18c0e03e3so3172531a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788966339; cv=none;
        d=google.com; s=arc-20260327;
        b=DSMWHea3LyrcLSjwMbydeJmnE00hmqyyM93AS+KdKIcvT+Gupl2aPFcRvyR1wGOZlv
         Ka2Kvcg/ISZ5B8ecMo9sTAZREDYUvwQOo9iU5WX1sdZFNhivnrXQej3A0FKx7v6jYHIw
         PmSe3/VeT+Myq5D3WpExsqdG3yHcNsnfgHfSNHTr6HlYI88qvmGaeOQl+3+LijxpmHUU
         VSa8eYQw9WTe9mvtQ3L7ojha66jo81ep3nJZvB5HKCc3PT0Ai/1cwGsMjux74plmqtgn
         4vt7UO8uvngpWQ7EyyIj0HWQBBNQ5Z1/sFyaS2X0wNBUCyOKpjWFlZhwNOhUZ4b0w1Kn
         c2Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=bPifW9Smu+tKBLdTNDc9b+YeXLJbZl3BP3bUtreOS1w=;
        fh=0jZOKk/msoxmxVuBHqaghtNzp5J2TELUZSHLStqeye8=;
        b=qKxljRsrd1JuhbfwqlIsSS5qOnkbzMoRcV1Lg9MkhFTZhzDxE4gkJCbJJloxdRDwn6
         fohluVKZHBGOuTF+MvqmZQ/rfqs9ujToU1gjNmf2/wEaV/zoLF4fWYRNALnQxlHPZNqN
         b+eYTWSGKHc44RAftNFcn/duGb9PnXkl63lrSP98tcl2b3xqYFXfmhUIJND44lvd5BzV
         zglhhIvYlL82ks/yoE0ZGRaR22FXQFG+rjatSFAPA3XWi0H9M1UnARyhTZTYprLhqGzY
         C6gEtsQxKa8eu/43phjjXgzbxtb2SiUjYJTQRq6mPe+1ewd0i0I1Jsj4SKxu86IfY/u+
         kVag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966339; x=1789571139; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPifW9Smu+tKBLdTNDc9b+YeXLJbZl3BP3bUtreOS1w=;
        b=MffD7ozdMsfGj8F4DamnIZ+7kNFrlvGiu1toNtJyONjoc3+nDY9xgXfFQRt/+ou3Cn
         T0LQE4bSPGK/mW3OcN7SL/NXMEHBcXLahoxXFiGsjUICJvxz9jv1Wf0VQAa1Ar6trJa0
         HO5uNBADKgUgIVu8Gz3x6lrFfENkOW0r1ZSNFdZKZ77hE/QDK2OaqMWwHhdaiKbLV2kW
         yjCTNnfsCBBvuyQOflwe7r2YaTruWLxs4CkaawZErJLiJFnd2zeUn62SrAL1hkOzcKBx
         D7W39vBhTkjAF7SFL6vyMIbUsNJry+bILMutzBH0omCg4WibewZ0bb5XzPUeMu1Z5kHD
         8YGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966339; x=1789571139;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bPifW9Smu+tKBLdTNDc9b+YeXLJbZl3BP3bUtreOS1w=;
        b=PD2Qy4jqiGQuGKvbFgmc0oz+tJ/Q34olwSetqO5rpRX3EyQySB4aLUF4q9P11QpGyn
         lb8dJC1WoBvUBKc6ROJAjkz1gqv8s5KmTwBswGRDGzNPZofG+rbEWFlWpd1mymDTdQHr
         I9UylNGgJ6Ro/J2/spmMd9v/zAgS47RdmNM+6Z4lVFip2YMu0s3aNoM+i8BRSUYXsnZI
         bUSM80/PUqY6lbR3F8ymlAx8zk7Jpy77swGSWGq6mfBqqncaqdQzRaNI2eWWQUQBocI+
         Ffv8i0U8T+cvU802PqcAtjc7DbUvLSRY0qtfrrlTtIybIPfEjHniUNOymWDiJbOoQGfN
         vouQ==
X-Forwarded-Encrypted: i=1; AKwUvBypCO5ZTn2Fb8+b/Iulzid0SVXsmSqxxXNAdfsht8/N44P5UJmbhnfCYh0+z6mwyFta70X52WbY/zJYnFg=@vger.kernel.org
X-Gm-Message-State: AFuF++msnQtG7B9q3CViEg2XDGmOnGN3R0zWeBDwQOjhqkpYT9ShDeaF
	EjiL+449dXr96G6vgdF9raCd1xl8ll5pEhT0vj8Xl6yxYnLa4Ph6wBsfJIZZIbMY+MLXtRgdZlw
	g/g3CKP9W1OQhC6gP/sKm/D2zODathHs=
X-Gm-Gg: AYBFou2aWk6qgZqUvCnmn9R3jF73ssyp3C+Q7S3vldwft4rfxoNqEHIOp7Vm9qYIfNb
	EfNjA2YjN+odfRsqAtQmc6K8/vECzP1D/lm9sInbuMQ/G4BtdXNRo5CkP+QDO0BnVsLGkFefqd9
	Xg1FyBX28Zyoj4pfYkeZV78bCcOjj83BIAPbObvdi7eaZgNm6AYAMLfLvQ2wCgu7oFgEGL9Js3E
	mX+SWtxCa99z08W8ezD5awrT8Y6Izv6Z6PROX1vcQlLZQBH8LI2334y/k9Ay53xSTNyUheOtcBP
	//mtNkXD+6IkRN4xvsIQ4bmfRSyCb2Soz6r7dWrFUH8xA7XB4WR73WFbAe3rmK42IFK7RjJVeir
	XSexCqoFP5qPAEcXR3+AvLzLnPiOBdMFmpDsAew==
X-Received: by 2002:a4a:e847:0:b0:6b7:46e9:9700 with SMTP id
 006d021491bc7-6b746e9a360mr19044134eaf.48.1788966338598; Wed, 09 Sep 2026
 08:05:38 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:05:36 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:05:36 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jinseob Kim <kimjinseob88@gmail.com>
In-Reply-To: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
References: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:05:36 -0700
X-Gm-Features: AcwNN1XXvx0UutbQz3C8pC-IVMf-p4wSoPFQaanIGZK3T3vTnj6LaeC92XUpPTI
Message-ID: <CALMSewK17jG3MXTHv4Rj+tFVriw9+tqNuAMcX4KGQGy5NQP_MQ@mail.gmail.com>
Subject: [PATCH v9 2/5] Documentation: iio: add Open Sensor Fusion driver overview
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, joshua.crofts1@gmail.com, 
	u.kleine-koenig@baylibre.com, julianbraha@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Document the Linux IIO mapping for Open Sensor Fusion devices.

The overview explains that sensor channels are discovered at runtime
from mandatory capability reports. It also documents that OSF0 is a
wire-format detail and that protocol_major and protocol_minor carry
protocol compatibility information.

Assisted-by: LLM
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 Documentation/iio/index.rst              |  1 +
 Documentation/iio/open-sensor-fusion.rst | 84 ++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 86 insertions(+)
 create mode 100644 Documentation/iio/open-sensor-fusion.rst

diff --git a/Documentation/iio/index.rst b/Documentation/iio/index.rst
index b02b879b053a..c2b7963348fd 100644
--- a/Documentation/iio/index.rst
+++ b/Documentation/iio/index.rst
@@ -40,4 +40,5 @@ Industrial I/O Kernel Drivers
    adxl345
    bno055
    ep93xx_adc
+   open-sensor-fusion
    opt4060
diff --git a/Documentation/iio/open-sensor-fusion.rst
b/Documentation/iio/open-sensor-fusion.rst
new file mode 100644
index 000000000000..15d41202eb66
--- /dev/null
+++ b/Documentation/iio/open-sensor-fusion.rst
@@ -0,0 +1,84 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Open Sensor Fusion
+==================
+
+Open Sensor Fusion is a sensor aggregation hub interface. The Linux IIO driver
+receives OSF protocol frames from an attached device and registers matching IIO
+devices for the sensor classes supported by the driver. The actual sensor
+channels are discovered at runtime from mandatory OSF capability reports.
+
+This document is a driver-facing overview for the Linux IIO mapping. The full
+wire protocol, firmware behavior, and hardware model details belong in the Open
+Sensor Fusion project documentation.
+
+Device Model
+------------
+
+An OSF device sends binary frames from the device to the host.
Devices using the
+``opensensorfusion,osf`` compatible are expected to provide
+``CAPABILITY_REPORT`` messages so the host can discover which sensor
streams are
+available. Device Tree describes the attached OSF sensor aggregation
hub; it does
+not enumerate the individual sensors discovered at runtime.
+
+The currently supported Linux subset exposes:
+
+* accelerometer samples as ``IIO_ACCEL`` X/Y/Z channels,
+* gyroscope samples as ``IIO_ANGL_VEL`` X/Y/Z channels,
+* magnetometer samples as ``IIO_MAGN`` X/Y/Z channels, and
+* temperature samples as ``IIO_TEMP``.
+
+Protocol Scope
+---------------
+
+The driver supports OSF protocol major version 0 for the IIO receive path.
+The current wire magic is ``OSF0``; that string is a wire-format detail and is
+not the Linux driver identity. Device Tree keeps the generic
+``opensensorfusion,osf`` compatible rather than naming a product such as OSF
+GREEN or a wire magic value.
+
+Protocol versioning is carried by the ``protocol_major`` and ``protocol_minor``
+fields at fixed offsets in the OSF frame header. The driver currently
+supports ``protocol_major`` 0. ``protocol_minor`` changes within major version
+0 are intended to remain backward-compatible within the fixed header layout.
+Incompatible wire-format changes require a new ``protocol_major``. A future
+device that cannot expose compatible version discovery through that fixed
+header layout would need a different Device Tree compatible.
+
+The Linux driver handles device-to-host frames for:
+
+* ``SENSOR_SAMPLE`` buffered and direct-mode sample data,
+* ``CAPABILITY_REPORT`` based IIO device registration, and
+* ``DEVICE_STATUS`` cache updates.
+
+Vendor-private message types are ignored. Command transport, calibration
+control ABI, fusion output ABI, and runtime capability removal are outside the
+Linux IIO receive path.
+
+Timestamps
+----------
+
+OSF frames include a device-side ``timestamp_us`` field. Buffered IIO
samples use
+an IIO timestamp captured on the host when samples are pushed to IIO buffers.
+The driver does not correlate the device timestamp with the host IIO
+clock.
+
+Compatibility Notes
+-------------------
+
+This overview describes the implemented receive path, not a normative wire
+specification. A publicly versioned specification covering reserved fields,
+extensions and physical scale units remains needed for interoperability review.
+
+The decoder requires the fixed header size and the exact payload lengths of
+known messages. It ignores unsupported protocol majors, unknown message types
+and frames with nonzero header reserved fields. Unsupported capability entries
+are skipped individually; malformed known payloads are rejected. Appending data
+to an existing known message is therefore not a compatible extension for this
+receiver.
+
+IIO scale is taken from the initial capability report and is not updated by
+sample frames. Devices must supply scales in the units required by each IIO
+channel type, including gauss for magnetometers. Historical OSF draft documents
+differ on reserved-field handling, trailing extensions and magnetometer units;
+those drafts do not establish a canonical specification for this driver.
diff --git a/MAINTAINERS b/MAINTAINERS
index ff09899bd645..0c9c322162b2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20515,6 +20515,7 @@ OPEN SENSOR FUSION
 M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion.rst
 K:	opensensorfusion

 OPENCOMPUTE PTP CLOCK DRIVER
-- 
2.43.0
