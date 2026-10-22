Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676390;
	b=ZZaTvvJnYVSnltP6PaEte7GyUDeKnJtw2BkJX8Q3Ys8rvlanY23tqswWNorSsZioDqpD
	 BYrwkD/IgNAhzkYWllVk+EsYOHi6ECljWZTUGAwY2sjhXs6j9JnbFiA6z//CDm8OQLF1R
	 8fSKVJltWJprLo7kI/uFUhLDq5tmnwF/zO/dSZpaNMSn8VqZGqxh28zj78/IFyqFyBD9f
	 g5yeM7lg23BC5f384Qu/hl98t3G5BJk0vxk7AwPmqB7gM0afUPWTgfhjMVu9GpVIY7xvt
	 tzLAM4I5EPNAOCQdYnM/N7N5AckWBBRorW3CBuEuJFLa1vVH3EXAmma4B300HIM+xdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676390;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=iS9Ptv4gJD9ISiPFn7gETnJRBJhb+zthiQ0gRNLw8KM=;
	b=1VaHxpbK22Dx3ckQmRbX6e+S7bkXyKUSE5y5PdlymHdk2iVmw4PiYDAZjzaoaeM2OKIt
	 u2gH+Z5/W0QUNNw6EOpSVWmWhEH7HOQpfsGXbt2ddNn9ktObCdOILH90tUFH6KJjcdbrZ
	 BgalhLH+XsIL+W5EDXrKIL+BDir033axIeou7gSBDQZHH5TYoKlGqYhw0euolK/NyrQq4
	 jbZvRr/sDfXZLqkTq2Wch9z4/Ufa8hOHjqd15jvSayqrey57XAbo2X4SJhEtq0NP2n0zq
	 3YzqSz+W7ZI3aRW1AHLVbslY4WU8TXFjkfwJ9M+wUbdVEwVMJa9xcNhnHZhpYgRJ4Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--korneld.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ntUxXo4C;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D1E606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27D1E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--korneld.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ntUxXo4C
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1f5b673baso2163657a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792676388; x=1793281188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iS9Ptv4gJD9ISiPFn7gETnJRBJhb+zthiQ0gRNLw8KM=;
        b=ntUxXo4CAIFgiTl+mB+ZQdJMfe1A/Zpa0HXlouJZsfldUSvRUHoLlmgO2NUE9Yn1Gp
         ZTDquvLfsKpKmSH/HQ+h3gQP+ATKihzsrU0GYcDOUAvtR0G23gMc9OhtK+N+bAVAVdIA
         FJAFfnmGXk4NnMmhswVWoPmwZwesAatpNQcaX9hLgyuXMjFVWv7ZxAlOHGULca1GEhlG
         w1wnU6RMDimY+XhTpUBSaz7Gu7hByE10cz398aIcwj+VAz6zOiSnMVA2Rn5SbuC9DXQ0
         oIcMrPSDmqSl+EMGv8LkiO8lf+GQ0Wr4/7hlPjxELTyXn0l2ZUakB39nNh/Pgdh4iWF9
         1l2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676388; x=1793281188;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iS9Ptv4gJD9ISiPFn7gETnJRBJhb+zthiQ0gRNLw8KM=;
        b=UF9+lT6aJDZBkRL+TP8BxUPwMLIdYMbK/9nI10Uo/rYrS2Jkz4cQglBwdsLnoy47d3
         Xvcuy1krOZSbai2NUvWKfmvcE6wvdnR0TuSG4hXL/pC3pUtVMsh1E6gCMQfgXp1oxhnH
         EfpO/qLSl80WbGi3+DqKwL0LEXPBJiYgTNkcfXjbjcltw9lg8B/h27IZa78syRr6rLKO
         SwWy5lX1AOnvkWbcD3wcFZW1ytC9wom5kf/SayfhzGBVYC3Tc5d2WBJGMgWQCk10rmYA
         dh3iu9wcjiGgXzs20vsSm9frw2chCpEdug+9j9AQIcmTZgopdq8E7guPwatS9vzimYGi
         NGcg==
X-Forwarded-Encrypted: i=1; AKwUvBz5i4eZtmxs3RJzf5cJ7hVgmm/G5xvhtJf9Q8BRT84PY8S6FW+Pt9fT+pj2WGkTJrc37sfv5VsLiaMoYug=@vger.kernel.org
X-Gm-Message-State: AFq9FYJX+nWqbnHeXPa3ycNT3uBepBoatevKeqwQ+lZV+6jRc5EEbBZj
	HyonmagFA7VBmURVR6/qOZbk03q2/oWNUhLKZjOXap9lOMIl3b3ZHwtXq5S3ApEymRzKO4L5szz
	eptGPdZoOfg==
X-Received: from edrd18.prod.google.com ([2002:aa7:d692:0:b0:6b4:1721:3ad7])
 (user=korneld job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1d53:b0:6b3:c434:b8e9
 with SMTP id 4fb4d7f45d1cf-6b41bbb061emr3468614a12.9.1792676388370; Thu, 22
 Oct 2026 06:39:48 -0700 (PDT)
Date: Thu, 22 Oct 2026 13:39:12 +0000
In-Reply-To: <20261022-evdev_syndropped_fix-v1-0-b5400740e1f7@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022-evdev_syndropped_fix-v1-0-b5400740e1f7@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20261022-evdev_syndropped_fix-v1-1-b5400740e1f7@google.com>
Subject: [PATCH 1/2] input: evdev: Always terminate SYN_DROPPED with SYN_REPORT
From: "=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"=?utf-8?q?Kornel_Dul=C4=99ba?=" <korneld@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Per Documentation/input/event-codes.rst, on SYN_DROPPED:
"Client should ignore all events up to and including next SYN_REPORT
event and query the device (using EVIOCG* ioctls) to obtain its
current state."

Currently, __evdev_queue_syn_dropped() queues a standalone SYN_DROPPED
event without a terminating SYN_REPORT. This causes two issues:

1. The queued SYN_DROPPED event remains unreadable until the next
   hardware event frame arrives and finishes with SYN_REPORT.
2. When the next hardware event frame arrives, SYN_DROPPED is prepended
   to it in the same packet. Compliant userspace clients then discard
   the entire hardware event frame up to its SYN_REPORT.

This was discovered on an Android system with a gpio-keys backed device:
1. gpio_keys_open() reports the initial state on open().
2. Android follows open() with EVIOCSCLOCKID.
3. This creates an unterminated SYN_DROPPED, causing the subsequent
   event to be discarded by userspace.

Fix this by appending SYN_REPORT after SYN_DROPPED in
__evdev_queue_syn_dropped() and updating client->packet_head
accordingly.

Signed-off-by: Kornel Dul=C4=99ba <korneld@google.com>
---
 drivers/input/evdev.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/input/evdev.c b/drivers/input/evdev.c
index 8bfaaa45e0b9..c6da2601480f 100644
--- a/drivers/input/evdev.c
+++ b/drivers/input/evdev.c
@@ -147,6 +147,7 @@ static void __evdev_queue_syn_dropped(struct evdev_clie=
nt *client)
 {
 	ktime_t *ev_time =3D input_get_timestamp(client->evdev->handle.dev);
 	struct timespec64 ts =3D ktime_to_timespec64(ev_time[client->clk_type]);
+	unsigned int buf_mask =3D client->bufsize - 1;
 	struct input_event ev;
=20
 	memset(&ev, 0, sizeof(ev));
@@ -156,13 +157,24 @@ static void __evdev_queue_syn_dropped(struct evdev_cl=
ient *client)
 	ev.code =3D SYN_DROPPED;
=20
 	client->buffer[client->head++] =3D ev;
-	client->head &=3D client->bufsize - 1;
+	client->head &=3D buf_mask;
=20
 	if (unlikely(client->head =3D=3D client->tail)) {
 		/* drop queue but keep our SYN_DROPPED event */
-		client->tail =3D (client->head - 1) & (client->bufsize - 1);
-		client->packet_head =3D client->tail;
+		client->tail =3D (client->head - 1) & buf_mask;
 	}
+
+	ev.code =3D SYN_REPORT;
+
+	client->buffer[client->head++] =3D ev;
+	client->head &=3D buf_mask;
+
+	if (unlikely(client->head =3D=3D client->tail)) {
+		/* drop queue but keep our SYN_DROPPED and SYN_REPORT events */
+		client->tail =3D (client->head - 2) & buf_mask;
+	}
+
+	client->packet_head =3D client->head;
 }
=20
 static void evdev_queue_syn_dropped(struct evdev_client *client)

--=20
2.56.0.307.g5fe7bd680c-goog

