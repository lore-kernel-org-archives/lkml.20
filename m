Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794276421;
	b=ZMDqVey7HG5nssEjZK3IC68M7gtoUbOzuITBPSUOocpMtzePiuWEz6vqU+c5e4FcZz7r
	 UZTSYgFQjhp44PW7zB2V96693O6nCvwVY8k+1bTG/wG2G+U+3QEQt/PWnrkSHu18P+hQR
	 yr2bTFM2Ixded0j7drlBoCx2wj1zx2Pc7AxlfsD73cjp8smymqrxEuioi8wDEoOsfysCF
	 vyJAxiq7blwyTT49boIDUNAPCGtY5y9wiNxxEIytagXwENNIsRQa1Gu9qPqhFZ+y67qdA
	 qxHzmufJEAo4UYrgPAGgEMVKKlQB4+za+NaWlQDZJY5EXH3Fi17755TroFr+4MMEaiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794276421;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=J0T89Mm+Cl6JghlTWTDFBiTbzLpBKNVNjiNMZMUxxTI=;
	b=KuPxTUk2D7klfzwMcwHn7Y5xiX8GnsZO2TmrAF3FxksTv+Jdf/bk/2zdkfUqW3QThxaN
	 hl/kpTrMYtWAQ335qBVfdm5K3ocfAnNvY3bftvLmmgKfpagpffkVH765hQ0sQat9Vf0ee
	 ekH/9MfzPmzEfrn0jbDMxgTSFjWXvB4UwKyvA4lpNREhLAR1IaEVmyRkxO0EV4LVSTtp7
	 4dYfgCzXOfoJsssoozwyxItk1DQ/lHAvL4E72lr8NYSz3/+OMvTH8TTa2iQRVyVHODA2G
	 jbrguBrDLHYcH8P4cP9lK0nQ4zwOvBNv4rtd3SstPHdCxNd3eNSgyNjwlOuUZFArrOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--svv.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gwlA4WxK;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5FB606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A5FB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--svv.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=gwlA4WxK
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-84c4dce8182so2187037a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794276419; x=1794881219; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0T89Mm+Cl6JghlTWTDFBiTbzLpBKNVNjiNMZMUxxTI=;
        b=gwlA4WxKRoU8Qm7AzOZOBh3c0l0w1+LqQmRHl996cIRG6B9eUUmxzSA+wkhZ7xBisT
         IjuGVK11H6TAjus85ZMvSqvh2kYcP5d8rCpxeHpsMDzvbKrFgf0Z3gJkTG7pTskA1tGa
         kAgEwf7XerlTcUtI1q4wJN45kiJLAnByVFiZigfGIFsHgoLF70n0WuBJw5OKI2iiLtq5
         2rg/jgWSxRd6wBhaoQ8Zh9J1LczBqOG777we6pb2bu1IQGLuZGXlRK3SJqSAOnzS7WD5
         YmYuZf+Z73qgb5uE4ldEDv9qRd88Tlj13rei6YItQuICaCVz00bKQ2AcK75sjJEY7DlT
         6J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794276419; x=1794881219;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J0T89Mm+Cl6JghlTWTDFBiTbzLpBKNVNjiNMZMUxxTI=;
        b=BGlhcQ3XY1LzQUJH1CfnIjpO2YPpHnmWYmieOsTCoRpAfcrZt7GaqrCnGh/X2FCb17
         8Hes46O2z/73BY5vdJoDWiIehqlwAQUB4u3jRXb5SB8QmCBMZsdhnrAdingzaQhHliqv
         D/B4LtIjzK+AE3owNDOeBPLglFll3Ts4+kOviD105OGBdBxXJGt1ZnCizuC92DP9gcIH
         XkSlYOySE16aOIjkjCIhORBV25nAbHXejdHFPIufCDcKQeq9jXOt9zVR6gFUfYwQGHI2
         r8Zh8rth8k4YmLSTlOWYnJQaIIkrQC3dxWP2DsdFZFdPBiOYwO7Od23Xe2AEV1k4/pq1
         Fz5Q==
X-Forwarded-Encrypted: i=1; AL+hErFilRM+mKdL0f/phGUG9RpNyO2DJEA3YIPQVJt3Tz7YGhLbQHOAmRP5febbwOoq0/vtzrar3F5wX+BBuDg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8InqCdXg7aUFvlfzCLXHvNqmU8J+ovbNoVASnDHujCblLlVGpU
	X+IOClobJWbcjjpkt+7pDD9L7kA8wUWKGrwqP1JRSuMwaCanQaKBH/Qdl4cblCdBJHo1nw==
X-Received: from oixg11-n2.prod.google.com ([2002:a05:6808:e7cb:20b0:4f4:b26a:174b])
 (user=svv job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:4f4c:b0:4fb:ac9b:b06c
 with SMTP id 5614622812f47-5683c9e2f4fmr1154358b6e.1.1794276419045; Mon, 09
 Nov 2026 18:06:59 -0800 (PST)
Date: Mon,  9 Nov 2026 18:06:30 -0800
In-Reply-To: <20261110020632.4003499-1-svv@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261110020632.4003499-1-svv@google.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
Message-ID: <20261110020632.4003499-2-svv@google.com>
Subject: [PATCH 1/3] Input: add ABS_TWIST event code
From: Siarhei Vishniakou <svv@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Ping Cheng <ping.cheng@wacom.com>, 
	Jason Gerecke <jason.gerecke@wacom.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siarhei Vishniakou <svv@google.com>
Content-Type: text/plain; charset="UTF-8"

Some styli can report the rotation along their long ("barrel") axis.
This is typically referred to as "twist".

In the HID usage pages, twist is already supported as HID_DG_TWIST.
However, this usage is not reported to the userspace via evdev interface
today, since there's no MSC_SCAN equivalent for axes.

Peripheral OEMs get around this today by mapping this axis to other axes
like ABS_Z or ABS_RZ. This is not a valid way to report twist.

As a result, the userspace programs that would like to support twist
must account for the various ways specific OEMs map this, since there's
no generic axis for this.

Unify this behaviour by introducing a new axis, ABS_TWIST. This axis will
only apply to the single-pointer touch devices (stylus), as opposed to
"per-slot" multi-touch devices (which would then suggest something like
ABS_MT_TWIST).

Here we define the ABS_TWIST absolute axis code (0x1d) to report the
rotation of a tool (such as a stylus) around its major (barrel) axis,
and document it in event-codes.rst.

The device can specify its twist resolution as units/radian.

Signed-off-by: Siarhei Vishniakou <svv@google.com>
---
 Documentation/input/event-codes.rst    | 6 ++++++
 drivers/hid/hid-debug.c                | 1 +
 include/uapi/linux/input-event-codes.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index b4557462edd7..f1f7fd502081 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -235,6 +235,12 @@ A few EV_ABS codes have special meanings:
     BTN_TOOL_<name> signals the type of tool that is currently detected by the
     hardware and is otherwise independent of ABS_DISTANCE and/or BTN_TOUCH.
 
+* ABS_TWIST:
+
+  - Used to describe the rotation of a tool (such as a stylus) around its
+    major (barrel) axis. If the resolution is non-zero, the twist data is
+    in units/radian.
+
 * ABS_PROFILE:
 
   - Used to describe the state of a multi-value profile switch.  An event is
diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 15e35702773c..594cf5248163 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -1015,6 +1015,7 @@ static const char *absolutes[ABS_CNT] = {
 	[ABS_HAT3Y] = "Hat 3Y",		[ABS_PRESSURE] = "Pressure",
 	[ABS_DISTANCE] = "Distance",	[ABS_TILT_X] = "XTilt",
 	[ABS_TILT_Y] = "YTilt",		[ABS_TOOL_WIDTH] = "ToolWidth",
+	[ABS_TWIST] = "Twist",
 	[ABS_VOLUME] = "Volume",	[ABS_PROFILE] = "Profile",
 	[ABS_MISC] = "Misc",
 	[ABS_MT_TOUCH_MAJOR] = "MTMajor",
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index f410c22e080d..cdc718fc1c4a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -862,6 +862,7 @@
 #define ABS_TILT_X		0x1a
 #define ABS_TILT_Y		0x1b
 #define ABS_TOOL_WIDTH		0x1c
+#define ABS_TWIST		0x1d
 
 #define ABS_VOLUME		0x20
 #define ABS_PROFILE		0x21
-- 
2.56.0.455.g6c5a503b38-goog

