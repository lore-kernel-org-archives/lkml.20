Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DECB5540A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966354; cv=pass; b=I8J3I6OYGH2ic2ijuKaLUYw5DRBkv+JSaJ01F0HpbIFg8Anw5fwRzfvMFxS+aUIQpmoSGvl6+vHFTGLUC5ZI40avNSPIMNB5Sh4eCs2JXqGJmfPir6QDAnQZv4jLdsboqP/Z2c4nNRzhU4hKMa3EHBnUV5n7Gh5dzqYDAe7sEQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966354; c=relaxed/simple;
	bh=Pg0OPE12vmwuWYVjsDIrUEAMoARJ9Iewm2dvzaLg3Oo=;
	h=MIME-Version:From:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CooIQfwjq0gUdelLD6TsKd2mbBFb2NGO8H/bw5ZcjrkBRnEm6nn/wIStxYVjZanq/q6I+Wu1rpLXV6qr1uGfS9SvOu7UekZDCRrjf0kRgZZSQFYzYMGtnsUbjt4VruLohgWQXLqY9RtMFZIPzfczuGyBxV+aNLmtTYDWgWxI1z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oADgO/Nd; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oADgO/Nd"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7e9ecd7216cso5132678a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788966351; cv=none;
        d=google.com; s=arc-20260327;
        b=RFz1y0H2MHYqoGWka6eT0LP7rN+w9NRtZWoVejGL+DWoqDVo6Fw6HSunD8g8GkGh/u
         xomI5o6FrVHJx29aG+iQpj9mZ3CuEfjslYVubn1KaSChM5g85ZNIALguJrY5JNKux2NJ
         LQoYuEtRNnygzjlaG1sr2hvdRUmp5pGmcdLmGWwlAEZhW1PvljYomP41oJtVS5eaNeMv
         NjfOD57GlpDuXTOazbgXngOaNjmCua5ncirG0EdcyFzPqfuwb3nTdUNy9L91eY5TH9bM
         u9IKzMgHT0asWxvkp/WEFqRKi2Q9WgyXPPCq8C4onjdD/v4Re/Qv3iRtweiKMYfk4GF9
         XMoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:from
         :mime-version:dkim-signature;
        bh=AyUR7S+hdqUxAtfODrKh6/6SxqzP+uIq+xymgWT62Gg=;
        fh=xBFE4+CmMlnL01JZBoGNmnwV5cKv/8BGl71gA6yomLY=;
        b=eq3NqSNJwuf8C7PjVx3EZSrzPrJ3Icf4MpgNQzFlRhsIs1YDNjyHxuYtByJDw38szF
         B1eUcYhPLsQQPMlxEhsICA/BSlfkeRiz9EPbjFcsY7oPgbg+pHkDrTpF1T2DH3bUHkF4
         En7rVX7ja8IBZP9ixAMWOGD2J1dkJ28M5sh1yujdBZewZatePbf7hE627B4N1lVvSz2X
         7Ao/D39GeWAtqX9pqvlIN71Ji6X8ePXI5LpIY9WbIuAdSix58dylgPI9S/aDcNnCT+4I
         qWSa3sxiUf2VDPVPv4gSvv/sw1VIbODrXoEg827Ml1+sNegEeSYFHbHVnzJky+y0xePY
         nXyQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966351; x=1789571151; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AyUR7S+hdqUxAtfODrKh6/6SxqzP+uIq+xymgWT62Gg=;
        b=oADgO/NdcS2pejRPW5QAWVZgewxMo1rNeTbDso+Oj66BCFKG9vW8ld+nRunvyqXu2h
         TLNXPybtJBOO8aNd86PIfmIA5b9qV0Ecf57bwi+GE7wqhhxlyPcBVhOUyaYw+E95eKvk
         AUMBdPHAy5wR9rNWG7t7qRMFoLOe5N7RXouAi/u40bBBHZ+c2joLVE8ojv+zGTt5gPPW
         4T/JndVCnzvx18bTmqM5OfMsciWG69cAbfAU6WIiFU1/o1tOdTOP4XClvcze+YTMpTI1
         HbuEO2JOxZ1pQhvSkoc233wjJkeUNKYxnnxee7LksDVLPEnW8/sEQO6Bz26monqR/oNQ
         xXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966351; x=1789571151;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AyUR7S+hdqUxAtfODrKh6/6SxqzP+uIq+xymgWT62Gg=;
        b=M/geTP/Fkuj6pyUNvt6k1cRckILe8sEXSBkkvnz1VvmMbFWRJ5gfmxphQ8TQK7dSVz
         eiBabwXMzYVm7nQwi4kWBh1fgcbVJE8sM8IOj7vkijwAsnzCt49AHumBING7vS+u+1d1
         eHMBZocx+jbTo1YqpFmDSN0sAzagU+MMw5sXlVlaIYFuCoELsaKKxnfhK/kYzx0uzGcC
         279s3cDv2iiJggxmsfLt4th1NMbBfgGVuNJDt0EoSYLO67S4ycNFxs5Z/Wr9V1qSWxsW
         vKeMEbG9z10tDs5dSgtC3fCHicZonl85LI7LjAXRXVDwEVlALqLZ3cCNkFy9G5odBnQ8
         pIDw==
X-Forwarded-Encrypted: i=1; AKwUvBzmQKs8eV+mE0aMRk+M17k5Rjc1gpfBzkRHHL73aOVwuSFid7iaGQK8Q/CxSDrzePAfmqLS+qbAV6fQN/k=@vger.kernel.org
X-Gm-Message-State: AFuF++ke+xPxiGYItOkOhthB7Ch8wTsinkJiHWb/mCc/XjkcuNazbj88
	bLBf+aiG/Wzzax5SrJTzC3AYMGrT/Q2XzKE7mn7smbJIbKgsy5qAGt25NdyEkKuFkXc6Y73RIjY
	hFxbd4MRTs+hiDG8Pq5qnP7TcyTmSeuw=
X-Gm-Gg: AYBFou1bJZgpv894wQ8os4DZdemB1ZXuzx2OO0l+m0eKEvxeT4SLLBpV6c5ADs/STyO
	BzKuqsg8Tcdx7reHFhOhZwTUzJoH2anrY5ghjmmzZu8sW6BROiYzZKCmQpU0U4qlp2StzcI2g16
	izDzLjYvDRrFjGOL8Jkc0DxdFK58Z9711G8d/3jHi4pH2IPafVw0P5TLyiCVNFRNbZ/lFJi0phK
	yOoJxD5x/TATvq31pO8y1LWKts1I1bg5E5WRb0Ezp9XE/SuqBtvfXPcVjmFIaXTXn1mxB3OtbVs
	/ICIZLfXFcl/TGRlGe9NI/jsn3+mKiNcUY0ZuVs9My04i/y5WZP2K7SSp3fugRRgFCEJN8FiCGl
	AvHZQkJlqpVKtUwEoCJ/yGJwV0KX2A7j5lAt5cIV/2W5aO+JC
X-Received: by 2002:a05:6820:810a:b0:6ac:b6c0:2bf6 with SMTP id
 006d021491bc7-6b6fabd2f22mr20142537eaf.5.1788966351014; Wed, 09 Sep 2026
 08:05:51 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:05:49 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Wed, 9 Sep 2026 08:05:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jinseob Kim <kimjinseob88@gmail.com>
In-Reply-To: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
References: <CALMSewJPfQXRX5q4X3gJf=LT6m2FnusTM=DBiWsBqRFiyNP_Gw@mail.gmail.com>
Date: Wed, 9 Sep 2026 08:05:49 -0700
X-Gm-Features: AcwNN1UJyoZ5NxE2b9rqL4o8eMYp7QtQzYieEg-YsNXYdTJfmBhIY59oc__BguQ
Message-ID: <CALMSewLcwgHyTEZVKUkYBo635nr2mZopHYkJP+hnBc--jerqxA@mail.gmail.com>
Subject: [PATCH v9 3/5] iio: osf: add protocol decoding
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	linux-kernel@vger.kernel.org, rdunlap@infradead.org, joshua.crofts1@gmail.com, 
	u.kleine-koenig@baylibre.com, julianbraha@gmail.com
Content-Type: text/plain; charset="UTF-8"

Add helpers for decoding Open Sensor Fusion frame headers and supported
message payloads.

The decoder validates framing, payload bounds and CRC before exposing
decoded frame contents to the rest of the driver. Framing validation
includes the OSF0 wire magic and fixed header length. Protocol version
and reserved header fields are exposed to the core so authenticated-frame
policy is handled after CRC validation.

Capability entries are decoded structurally, including their flags and
reserved fields. The core can then apply support policy without rejecting
an entire report solely because it contains future entry values.

Use explicit little-endian wire storage sizes and designated
initializers for decoded output structures.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 MAINTAINERS                                 |   1 +
 drivers/iio/opensensorfusion/osf_protocol.c | 224 ++++++++++++++++++++
 drivers/iio/opensensorfusion/osf_protocol.h | 101 +++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.c
 create mode 100644 drivers/iio/opensensorfusion/osf_protocol.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 0c9c322162b2..f7ead365f946 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20516,6 +20516,7 @@ M:	Jinseob Kim <kimjinseob88@gmail.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
 F:	Documentation/iio/open-sensor-fusion.rst
+F:	drivers/iio/opensensorfusion/osf_protocol.*
 K:	opensensorfusion

 OPENCOMPUTE PTP CLOCK DRIVER
diff --git a/drivers/iio/opensensorfusion/osf_protocol.c
b/drivers/iio/opensensorfusion/osf_protocol.c
new file mode 100644
index 000000000000..cd7b8587f737
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_protocol.c
@@ -0,0 +1,224 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/bits.h>
+#include <linux/crc32.h>
+#include <linux/errno.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "osf_protocol.h"
+
+#define OSF_CRC32_INIT		GENMASK(31, 0)
+#define OSF_CRC32_XOROUT	GENMASK(31, 0)
+
+static bool osf_sensor_type_valid(u16 sensor_type)
+{
+	return sensor_type >= OSF_SENSOR_ACCELEROMETER &&
+	       sensor_type <= OSF_SENSOR_PROXIMITY;
+}
+
+static u32 osf_crc32_ieee(const u8 *buf, size_t len)
+{
+	return crc32_le(OSF_CRC32_INIT, buf, len) ^ OSF_CRC32_XOROUT;
+}
+
+int osf_protocol_decode_frame(const u8 *buf, size_t len,
+			      struct osf_frame *frame, size_t *frame_len)
+{
+	u32 expected_crc;
+	u32 actual_crc;
+	u32 payload_len;
+	size_t total_len;
+
+	if (!buf || !frame || !frame_len)
+		return -EINVAL;
+
+	if (len < OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	if (get_unaligned_le32(buf) != OSF_FRAME_MAGIC)
+		return -EPROTO;
+
+	if (get_unaligned_le16(buf + 6) != OSF_FRAME_HEADER_LEN)
+		return -EPROTO;
+
+	payload_len = get_unaligned_le32(buf + 10);
+	if (payload_len > len - OSF_FRAME_MIN_LEN)
+		return -EMSGSIZE;
+
+	total_len = OSF_FRAME_HEADER_LEN + payload_len + OSF_FRAME_CRC_LEN;
+	expected_crc = osf_crc32_ieee(buf, OSF_FRAME_HEADER_LEN + payload_len);
+	actual_crc = get_unaligned_le32(buf + OSF_FRAME_HEADER_LEN + payload_len);
+
+	if (actual_crc != expected_crc)
+		return -EBADMSG;
+
+	frame->protocol_major = buf[4];
+	frame->protocol_minor = buf[5];
+	frame->message_type = get_unaligned_le16(buf + 8);
+	frame->payload_len = payload_len;
+	frame->sequence = get_unaligned_le64(buf + 14);
+	frame->timestamp_us = get_unaligned_le64(buf + 22);
+	frame->flags = get_unaligned_le32(buf + 30);
+	frame->reserved = get_unaligned_le32(buf + 34);
+	frame->payload = buf + OSF_FRAME_HEADER_LEN;
+	frame->crc = actual_crc;
+	*frame_len = total_len;
+
+	return 0;
+}
+
+int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
+				      struct osf_sensor_sample *sample)
+{
+	u16 channel_count;
+	u16 sample_format;
+	u16 sensor_type;
+	size_t expected_len;
+	const u8 *payload;
+
+	if (!frame || !sample || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_SENSOR_SAMPLE)
+		return -EPROTO;
+
+	if (frame->payload_len < OSF_SENSOR_SAMPLE_BASE_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	sensor_type = get_unaligned_le16(payload);
+	channel_count = get_unaligned_le16(payload + 4);
+	sample_format = get_unaligned_le16(payload + 6);
+
+	if (!osf_sensor_type_valid(sensor_type))
+		return -EPROTO;
+
+	if (!channel_count)
+		return -EPROTO;
+
+	if (sample_format != OSF_SAMPLE_FORMAT_S32)
+		return -EPROTO;
+
+	if (get_unaligned_le32(payload + 12))
+		return -EPROTO;
+
+	expected_len = OSF_SENSOR_SAMPLE_BASE_LEN + channel_count * sizeof(__le32);
+	if (frame->payload_len != expected_len)
+		return -EMSGSIZE;
+
+	*sample = (struct osf_sensor_sample) {
+		.sensor_type = sensor_type,
+		.sensor_index = get_unaligned_le16(payload + 2),
+		.channel_count = channel_count,
+		.sample_format = sample_format,
+		.scale_nano = get_unaligned_le32(payload + 8),
+		.samples = payload + OSF_SENSOR_SAMPLE_BASE_LEN,
+	};
+
+	return 0;
+}
+
+int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
+				     u16 index, s32 *value)
+{
+	if (!sample || !sample->samples || !value)
+		return -EINVAL;
+
+	if (index >= sample->channel_count)
+		return -ERANGE;
+
+	/* Samples are little-endian two's-complement signed values. */
+	*value = get_unaligned_le32(sample->samples + index * sizeof(__le32));
+
+	return 0;
+}
+
+int osf_protocol_decode_device_status(const struct osf_frame *frame,
+				      struct osf_device_status *status)
+{
+	const u8 *payload;
+
+	if (!frame || !status || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_DEVICE_STATUS)
+		return -EPROTO;
+
+	if (frame->payload_len != OSF_DEVICE_STATUS_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	if (get_unaligned_le32(payload + 16))
+		return -EPROTO;
+
+	*status = (struct osf_device_status) {
+		.uptime_s = get_unaligned_le32(payload),
+		.status_flags = get_unaligned_le32(payload + 4),
+		.error_flags = get_unaligned_le32(payload + 8),
+		.dropped_frames = get_unaligned_le32(payload + 12),
+	};
+
+	return 0;
+}
+
+int osf_protocol_decode_capability_report(const struct osf_frame *frame,
+					  struct osf_capability_report *report)
+{
+	u16 capability_count;
+	size_t expected_len;
+	const u8 *payload;
+
+	if (!frame || !report || !frame->payload)
+		return -EINVAL;
+
+	if (frame->message_type != OSF_MSG_CAPABILITY_REPORT)
+		return -EPROTO;
+
+	if (frame->payload_len < OSF_CAP_REPORT_BASE_LEN)
+		return -EMSGSIZE;
+
+	payload = frame->payload;
+	capability_count = get_unaligned_le16(payload);
+
+	if (get_unaligned_le16(payload + 2))
+		return -EPROTO;
+
+	expected_len = OSF_CAP_REPORT_BASE_LEN +
+		       capability_count * OSF_CAP_SENSOR_ENTRY_LEN;
+	if (frame->payload_len != expected_len)
+		return -EMSGSIZE;
+
+	*report = (struct osf_capability_report) {
+		.capability_count = capability_count,
+		.entries = payload + OSF_CAP_REPORT_BASE_LEN,
+	};
+
+	return 0;
+}
+
+int osf_protocol_decode_capability_entry(const struct osf_capability_report
+					 *report, u16 index,
+					 struct osf_capability_entry *entry)
+{
+	const u8 *payload;
+
+	if (!report || !report->entries || !entry)
+		return -EINVAL;
+
+	if (index >= report->capability_count)
+		return -ERANGE;
+
+	payload = report->entries + index * OSF_CAP_SENSOR_ENTRY_LEN;
+	*entry = (struct osf_capability_entry) {
+		.sensor_type = get_unaligned_le16(payload),
+		.sensor_index = get_unaligned_le16(payload + 2),
+		.channel_count = get_unaligned_le16(payload + 4),
+		.sample_format = get_unaligned_le16(payload + 6),
+		.scale_nano = get_unaligned_le32(payload + 8),
+		.flags = get_unaligned_le32(payload + 12),
+		.reserved = get_unaligned_le32(payload + 16),
+	};
+
+	return 0;
+}
diff --git a/drivers/iio/opensensorfusion/osf_protocol.h
b/drivers/iio/opensensorfusion/osf_protocol.h
new file mode 100644
index 000000000000..2b616f2d5197
--- /dev/null
+++ b/drivers/iio/opensensorfusion/osf_protocol.h
@@ -0,0 +1,101 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _OSF_PROTOCOL_H
+#define _OSF_PROTOCOL_H
+
+#include <linux/bits.h>
+#include <linux/types.h>
+
+#define OSF_PROTOCOL_MAJOR		0
+#define OSF_PROTOCOL_MINOR		0
+#define OSF_FRAME_HEADER_LEN		38
+#define OSF_FRAME_CRC_LEN		4
+#define OSF_FRAME_MIN_LEN		(OSF_FRAME_HEADER_LEN + OSF_FRAME_CRC_LEN)
+#define OSF_FRAME_MAGIC			0x3046534f /* "OSF0", little-endian */
+
+#define OSF_SENSOR_SAMPLE_BASE_LEN	16
+#define OSF_DEVICE_STATUS_LEN		20
+#define OSF_CAP_REPORT_BASE_LEN		4
+#define OSF_CAP_SENSOR_ENTRY_LEN		20
+#define OSF_CAPABILITY_FLAGS_MASK	GENMASK(1, 0)
+
+enum osf_message_type {
+	OSF_MSG_SENSOR_SAMPLE		= 0x0001,
+	OSF_MSG_DEVICE_STATUS		= 0x0002,
+	OSF_MSG_CAPABILITY_REPORT	= 0x0003,
+};
+
+enum osf_sensor_type {
+	OSF_SENSOR_ACCELEROMETER		= 0x0001,
+	OSF_SENSOR_GYROSCOPE		= 0x0002,
+	OSF_SENSOR_MAGNETOMETER		= 0x0003,
+	OSF_SENSOR_BAROMETER		= 0x0004,
+	OSF_SENSOR_TEMPERATURE		= 0x0005,
+	OSF_SENSOR_HUMIDITY		= 0x0006,
+	OSF_SENSOR_AMBIENT_LIGHT		= 0x0007,
+	OSF_SENSOR_PROXIMITY		= 0x0008,
+};
+
+enum osf_sample_format {
+	OSF_SAMPLE_FORMAT_S32		= 0x0001,
+};
+
+struct osf_frame {
+	u8 protocol_major;
+	u8 protocol_minor;
+	u16 message_type;
+	u32 payload_len;
+	u64 sequence;
+	u64 timestamp_us;
+	u32 flags;
+	u32 reserved;
+	/* payload points into the caller-owned frame buffer. */
+	const u8 *payload;
+	u32 crc;
+};
+
+struct osf_sensor_sample {
+	u16 sensor_type;
+	u16 sensor_index;
+	u16 channel_count;
+	u16 sample_format;
+	u32 scale_nano;
+	const u8 *samples;
+};
+
+struct osf_device_status {
+	u32 uptime_s;
+	u32 status_flags;
+	u32 error_flags;
+	u32 dropped_frames;
+};
+
+struct osf_capability_report {
+	u16 capability_count;
+	const u8 *entries;
+};
+
+struct osf_capability_entry {
+	u16 sensor_type;
+	u16 sensor_index;
+	u16 channel_count;
+	u16 sample_format;
+	u32 scale_nano;
+	u32 flags;
+	u32 reserved;
+};
+
+int osf_protocol_decode_frame(const u8 *buf, size_t len,
+			      struct osf_frame *frame, size_t *frame_len);
+int osf_protocol_decode_sensor_sample(const struct osf_frame *frame,
+				      struct osf_sensor_sample *sample);
+int osf_protocol_decode_device_status(const struct osf_frame *frame,
+				      struct osf_device_status *status);
+int osf_protocol_decode_capability_report(const struct osf_frame *frame,
+					  struct osf_capability_report *report);
+int osf_protocol_decode_capability_entry(const struct osf_capability_report
+					 *report, u16 index,
+					 struct osf_capability_entry *entry);
+int osf_protocol_sensor_sample_value(const struct osf_sensor_sample *sample,
+				     u16 index, s32 *value);
+
+#endif
-- 
2.43.0
