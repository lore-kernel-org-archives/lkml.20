Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966667;
	b=ZB3orCHswYepIk4Y/gSNAHhQc+HWB74NWtfv6tB5+Hd8D/LF4e4e+/Sul03iVnEsxaQx
	 Z3toAe+Zyy/Yb1/qVTlvz5J/+tmV/XHj2oGBnRj9N3uJpAdwdzDijcDTSzWvVodb4Cts6
	 OU95NsIGuuPiXuYGyt7OqAd9b6OAen1O9/35HYAzmfADJQAfjzZMtiVOyTWYoOrzHzLsJ
	 gr/5kd+Rh5VTsOB+zCDD0EfyWRfzoBcrlTTwmytfM6blD5nedFWjiangjDxz0dprlvVwh
	 EEBBhn3UX1hk92E+3u8im4Y4tSU+tkmsi0V0RrfpthE4htv/m2xiuY7bIIagYCdoLvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P1OMG/B1lVqgZxM1GZjWM6eenEu+BEzraRxEM+z0u2A=;
	b=CA3cV4CjNiPqrAFPNlmVzzivT/uoj3QqtRHGzEEaOHUSLDywp2ZBfhR5ar7jVnEUPPRW
	 c2zBDoo2+N6WifiIKoB0qCgjdvNimfkRUDKSFwvplybp/p1cjRnNL/QGqF7+WO7vjziUx
	 7+k2oz9WiOqlK4mJ7Pk6dcDKSFEK8mGXaWnuRSUawK+3sIyPUKfIhh4Tvvl5PqMVc3DTs
	 r2+W+H1XpAojj1YjCfACNYO43hdittUUiamMJOrQUUvRpF/cqNsxIMhuWqBPU/0Lbs56F
	 8kksocTVezF0tQbLiQx2P835YEXjDNIpPBW416l9v8HhMxb+qy2pkB87qKbgAljdQOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJ5DVKWL;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0666F606A33A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0666F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xJ5DVKWL
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4c9abc1824so78255466b.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966665; x=1794571465; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P1OMG/B1lVqgZxM1GZjWM6eenEu+BEzraRxEM+z0u2A=;
        b=xJ5DVKWLdsqGYUj4mBLEzYwT4ZfyRw80Pr3dR6mVmfZ2qrKdrEj0P2Ev+90MvMbeyR
         fr/CR0GbJCTMdBd3vdDH5q84uNemVDCluDEoiWRoEis2P/deHkOkn3Xd8xY7DFovRntM
         EjQYE5OSOVZ8hi1kDghiMRg3bri/s/FPFcvFY9Cn7gfYgwc0C0TwCi5K2mUdPzhImMJ2
         43eqptqFyRwStcXDo55PV9iOzDWloW4mR9WNbayt031LkXwlpBZ1VjCZTVLgoijV6EK3
         sHNmhiwDZfezljtn3m4HEwXEEytX8/P7CU3r77pvcuBj3OMp76NJQu+R0VmOR1Q2QXAF
         7ycQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966665; x=1794571465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P1OMG/B1lVqgZxM1GZjWM6eenEu+BEzraRxEM+z0u2A=;
        b=t9ar9QdaS9TfkUSVv8OTsLGlXy70FLZhT0itqfnjuH32q7fiQS1PGq0IMtcI8N+yTv
         g/DxTRLim6embaydL1pulfVKYbN9RCDrmgMHlQbULUBjvcRo86dt3zGTgsEe1nJk3mqB
         Qu6D92mrwcXV1t+mlXdDb7W7w4xq+HoiJ13Aw00d2Ye2x8Pa6SywetkyzE3ytZv9Fvzx
         cjzG84MDaJQi0KIfiIaAk/tJfjAheNNGNcf6n5+V50dGaZADtSnLGVQqi0TyaaBtrLbw
         VcFW3uwUYwyMI0EZW5zGteOI44H+9QhnI4zYi58y90XBG6TDcAipGa5hBDmCZfd2hrJM
         pG3A==
X-Forwarded-Encrypted: i=1; AKwUvBw0BD7nIK6OJcSpPi5bnnRqbh85eqxIcD9JsEo/yKmDaiuFG1s8Kv2Uv9oIY2ztqUMfTzVy6mZ/h2/x1cI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZGj3XrqMdKTQOLZBhMUWCAe3KQlyJH++X56a13aFOKmQw0/8x
	KhceRMpHah3D+aFIjzwofHjYjTm//Kp8ZehjBf46f9zMJjcysUl7gP2U
X-Gm-Gg: AYBFou13FqaQWCIW+7UA4MGK67yrmRFGv+W+/oJWES6ymNzLIuOeCH5pIuGN74HawAk
	KLp1oPco11XF6FaVTEYWbe1EtrH/xL7uX67nMJDFQ+UWqAfpcWBULE/YLW92bnFV2MBFxzT3t+M
	nQlThD+R9z6HiMGZSlI5lVhkdM3LupeejL+vCKdM3pQr0Ag1ceVEzX7LaHBjfGw+L+bC1Iw5XKQ
	lPfhe/BOqdNUF/CH1pHJSTWgj423kMZey7D8goQuSmCsKJdNmN1sOpUkrAX4HSpwmBUScWzDy+k
	Buj/5Fa1kFdg/sCXnafNr0Z3bXpnkcfH69usNUYaHcsi1XYcgmco+4+Skc7+tDgv4WanHjshx3t
	7cHcOJAE75Jv5XxznpCYU9SAFI2Hyl5tcW38xyG6E6qbTlkOWVOrOBkD8YMQUnBc/2aTXqiUwgn
	hneG3Qv8L/PwmiTy37bvMuuD03TS/RXhdiDfeUiFS1qLBWKSwENT1ZrjeJm8fuj9K4HIPAR5UPM
	KnxKWAU0LrsPhZ1OMPMaCgw6MXFg8703JdMPBe97uNXRheY6gg+10uvfNP13aUhtB2di5B1/v9c
	BSR4cJdJnmVB/N2p9UeH5A==
X-Received: by 2002:a17:906:dc8a:b0:c29:f5d8:9c6c with SMTP id a640c23a62f3a-c4d3530b51amr205452766b.27.1793966665069;
        Fri, 06 Nov 2026 04:04:25 -0800 (PST)
Received: from beelink ([186.247.163.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356c60b0sm73922866b.69.2026.11.06.04.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:04:24 -0800 (PST)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Jason Gerecke <killertofu@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v4] HID: wacom: avoid divide exception in dropped-packet calculation
Date: Fri,  6 Nov 2026 09:04:05 -0300
Message-ID: <20261106120405.169399-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CANRwn3RYhEu0g9Lx+Vg=Uy8V7BWWz-jWV9d7UVuyRK-MGdbHOA@mail.gmail.com>
References: <CANRwn3RYhEu0g9Lx+Vg=Uy8V7BWWz-jWV9d7UVuyRK-MGdbHOA@mail.gmail.com>
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

The dropped-packet calculation uses a modulo against sequence_size
(logical_maximum - logical_minimum + 1).  When a HID descriptor
declares a sequence field whose logical range spans all 32-bit
values, sequence_size wraps to zero and the modulo triggers a
divide exception.

Replace the division-based calculation with a branch that computes
the forward distance through the sequence range directly, as
suggested by Jason Gerecke.  This keeps the existing int types and
avoids the divide-by-zero without any 64-bit arithmetic.

Fixes: 359673ea3a20 ("HID: wacom: Support sequence numbers smaller than 16-bit")
Cc: stable@vger.kernel.org
Suggested-by: Jason Gerecke <jason.gerecke@wacom.com>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---

Changes in v4:
- Replace s64 arithmetic with a branch-based helper that computes
  the forward wrapped distance directly, as suggested by Jason Gerecke.
  Keeps sequence_number as int; no type changes needed.

Changes in v3:
- Replace raw s64 modulo with div64_s64()-based remainder to avoid
  __moddi3 link failure on 32-bit architectures (i386, arm32).

Changes in v2:
- Normalize logical_maximum/value as unsigned when logical_minimum >= 0,
  matching HID parser signedness. Store sequence state as s64.

 drivers/hid/wacom_wac.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 361738b..1d3ae94 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -2426,6 +2426,13 @@ static void wacom_wac_pen_usage_mapping(struct hid_device *hdev,
 	}
 }
 
+static int wacom_hid_wrapped_dist(int after, int before, int min, int max)
+{
+	if (after >= before)
+		return after - before;
+	return (max - before) + (after - min) + 1;
+}
+
 static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field,
 		struct hid_usage *usage, __s32 value)
 {
@@ -2551,8 +2558,11 @@ static void wacom_wac_pen_event(struct hid_device *hdev, struct hid_field *field
 	case WACOM_HID_WD_SEQUENCENUMBER:
 		if (wacom_wac->hid_data.sequence_number != value &&
 		    wacom_wac->hid_data.sequence_number >= 0) {
-			int sequence_size = field->logical_maximum - field->logical_minimum + 1;
-			int drop_count = (value - wacom_wac->hid_data.sequence_number) % sequence_size;
+			int drop_count = wacom_hid_wrapped_dist(
+				value,
+				wacom_wac->hid_data.sequence_number,
+				field->logical_minimum,
+				field->logical_maximum);
 			hid_warn(hdev, "Dropped %d packets", drop_count);
 		}
 		wacom_wac->hid_data.sequence_number = value + 1;
-- 
2.53.0

