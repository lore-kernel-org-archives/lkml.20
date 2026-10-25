Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792942863;
	b=qRmc/HUhp5/ffONZyWxfQD6rZQANt2aFU4LJIYf7pdFkfrT9NRuDruIAVoSeLOIGQ4XK
	 Gz0a8+Fry14sqtymBM+mljoisHITnFXRcEuP/q1TlBBEzu3dCIlozLOKKQPWcMg9WqO4L
	 tAqxg372a4r5ahsOWoCZ7VtdxIc9QUhgt9wpnpI3fO9iGMxL+/phWGMaC2dXn6cZQIWUz
	 1QTfrSem/UuaCpbwAgqhLw7DtIpcF6VkWwit3uyRD9iBc3MdQWVbE6VWsiLT1/w+k9oMX
	 /d7FCc2TmR0f3Ovwq0iYBXQ08ggfbKhj/3vVL89dWrJ/L+VlK9VzIniAt0v6ne66InA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792942863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Uf1h6a93j4+yEUbF39+PknBRrGGMkKcsWKsXQeeS/kQ=;
	b=rF8E800ujxn7U/fOQjPomv1pPZE6BhlHC1n0w2YcV1SVDDHJmPnGLyn9wUNyrPNRirAx
	 ClKoRHMe+FVbwwFeRHMCjx/udi0ld1vUBz0syfr88TqDGi/prr53zniu0cgqUoRwFzS8c
	 EsENt5ndHBpUvcvzSP7F8DiHYcsvuzR6VsE4ANSzKMsetBWqk4kQEUdBV/G71konLLQ8j
	 hDRqRAPEDb5765iDVup26PGfhhUM+IkNed2xTbrjIp+BqaJPhsfr0dcfliAZ2VjIZrKU/
	 bU6ypdTxjMCLZhMQekFFrpPFXk75ipdTLDiuEt9WIsF7iFYQQCO622/X5ZUcEY519eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ONc0W75D;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4FE606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 15:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC4FE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ONc0W75D
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so3438285e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 08:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792942861; x=1793547661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uf1h6a93j4+yEUbF39+PknBRrGGMkKcsWKsXQeeS/kQ=;
        b=ONc0W75D37GzZCkVxEQG5HwzaDGrmqOyY6BIikyrFoBsZVuItg2moxQKjFPxLZEYrd
         hZlsHqSNv/66kByfseiRippSqe9vYikszMcyx+Y0TK/ccu5IYYAIgIohGBqUtE4yuLWy
         cg1CsBPDWfvIKDqJIoTYg+JMcNJSB20cqrwWCTfpLOyJWNOV5wjFVq2xhLqUXDHolkI9
         slZUGTn6pHiOaCBdBVal2+s7m84JF1H6eY4J+imyffy7sN+3w8YVRiyLJRsEtkr83pWp
         CksScCvDEJuX2etKI8Lt2QcnTKtcmlTI5j9TmflZqMOfrpbqCtCRZLhZFT1SbiEQBsjJ
         2Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792942861; x=1793547661;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uf1h6a93j4+yEUbF39+PknBRrGGMkKcsWKsXQeeS/kQ=;
        b=HS43EkI8p4J87NiVZLOnEJwomu4sN7rHEWx5rbgjKC//FepUGNkBjsxi88XbrEDOnZ
         JgDGNXNI70h+hyDM7RIwrW+9IEKSeRaUXJg8o3yso5tVSDNtz0ygNlbX/ofT5jNogbT7
         rMSJjeH0mKh8IW9I45soj3nG+OGZrAXtuNzRCLIobT2gqd+SRgsjSpLftpApcQnp3dhB
         NvgGjPcADREBy7ElQnfJQgwUxcGmYIMUwuRFPQQ5adc1yy43VvtGhW4qD6yZLplY3m2m
         zl89yVKoAfnpBvkNo2gG09FsIOBDaFd6rx89HnngE3f3H0x4puAco2fG9RBeyoKvyK9M
         yENg==
X-Forwarded-Encrypted: i=1; AKwUvBwTO8xOUcUxRu2btHxrt+CdIr4urwDrATdRUujvu9GIKrtW1TLa3ojt/GavaCy2EZR4jukeC/HHAhC7Kok=@vger.kernel.org
X-Gm-Message-State: AFq9FYIex6C7dQUBWMhtJx7dD2mdOvEbKaNvgATWABbukCxwqv5xlJ2r
	NniCu8/SHkWxVDJAL1jNDxl4FwGEbOj9GtlA0YdgbLe+B+y2gAmQeUlU
X-Gm-Gg: AYBFou18DWyz43Li1N+bXGFg+vprWIIRHQfOOrh7N+OLMedRSAloGTq6efGnG/fqpGO
	OAkja3TJoI6SY4pkzCiyIRiBxbUqJRvkNuGWhzE9xdrAgGJrjglzyqLEv6BWce60lqFDy2STbbW
	dzzRYMjh2SJvJIpkQgOWwIGvgVS1uEeaIHi0PHW6I6w0OXQ7T2idopoSXzQmz8+UUG9yTrcnH2d
	dEUt5DhsJPmZOfhIQJrRbn8BgxyP9CHvLEumB4XPfgFVpoJfFrtAe3v45p/AkkdJ1XQCqmzdJvL
	iiXoObO5W+sSGDSkm8tehWro1kft2fJmfBzqtzOY4XZLZzfyiQ5MMe7jN2xQ21SYEvD+gGoTpjZ
	mW6XjDriTksHiWS2pEoPUAZFn31ofAKW3nJr5E7486WA5yY+jqnN16gIwAqslNrNPn5bmZfk2Wv
	JcojrfG4pSAmPegI+k/OTiQ7Mh8kDJiBXNZ1/gVaL/RVzpPLgtRiFV4IAjho3EnPAzSY+Tgh+N3
	5dy3vn/Qkx4QNQcjw/UxIVJ4HH0ZQYMcZf7IZYqrlGub+T2guhXIpXEq98dPs2TotYXAPFZi3Jk
	16iSn1IiTagqZw==
X-Received: by 2002:a05:600c:3b02:b0:4a2:180b:3153 with SMTP id 5b1f17b1804b1-4a35ac8e71emr77642285e9.14.1792942861063;
        Sun, 25 Oct 2026 08:41:01 -0700 (PDT)
Received: from raviolimobile.tail5f26fd.ts.net ([84.70.180.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm10487861f8f.16.2026.10.25.08.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 08:41:00 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>
Cc: Fernando Rimoli <fernandorimoli11@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] media: i2c: vd55g1: Two v4l2-compliance fixes for controls
Date: Sun, 25 Oct 2026 15:40:24 +0000
Message-ID: <20261025154031.27083-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Two control fixes for failures v4l2-compliance reports on the sensor
subdev.

1/2: In manual exposure mode the driver marks the auto exposure lock and
bias controls grabbed. Outside streaming that fails the QUERYCTRL and
QUERY_EXT_CTRL tests, and because v4l2-compliance switches the exposure
mode while it walks the controls, the S_CTRL tests also fail with -EBUSY
when it starts from auto mode. The controls do not apply in manual mode,
which is what the inactive flag is for.

2/2: Control events, as most sensor drivers have.

How these were tested, since it is not the obvious way: I do not have a
VD55G1. I have the VD55G0 of a Surface Pro 9 (Intel IPU6), which runs an
out-of-tree driver derived from vd55g1 through Peter Marshall's VD55G0
support. In the code these patches touch, the exposure control handling
and the subdev ops, it is identical to vd55g1 in media next. I applied
the same two changes there. With v4l2-compliance 1.26.1 on the subdev:

  before:      41/44 in both exposure modes
  after 1/2:   QUERYCTRL, QUERY_EXT_CTRL and S_CTRL pass, controls show
               "inactive" rather than "grabbed" in manual mode, and the
               bias can be set there
  after both:  44/44 in both exposure modes

Getting from 43 to 44 also needed a fix to that driver's own flash
duty-cycle cap, which vd55g1 does not have (it is not upstream), so I
mention it only so the numbers add up. Streaming is unchanged, 150 of
150 frames at 57.60 fps before and after.

Both patches build without warnings at W=1 against v7.3-rc1, the same as
the unpatched file, and apply to media next as of d7e7bca71698. The file
there has not changed since 4a069a763e8a.

Fernando Rimoli (2):
  media: i2c: vd55g1: Mark the AE lock and bias controls inactive in
    manual mode
  media: i2c: vd55g1: Support control events

 drivers/media/i2c/vd55g1.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.43.0

