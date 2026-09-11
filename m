Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B449F485CF9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 13:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789133035; cv=none; b=R/C8j3MIT5KG1Qy6OZplq9/Z0kRCkwcwo62SpykUya/UwJLbS/obcencwF8nAeB7W3dAamf1+2vhkIDKO5ecL1tJ2Pf3X8DO5RjXX38jBxPY2O9SNAGZnzNP1PuPGVaMRAspEJZR3wZnuNKy4syC5Eyt+1sMIXrRiPiH49g+xq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789133035; c=relaxed/simple;
	bh=qpz2ap2Qy3ycSRZrgUKqHGFQhhk7gpL+MfmoSPp40Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jcCLSrYIKItrgdlFCaVqyz1n7q0RrrGby1n6gbzcNvPEm04U/XeImNJdsmh/R+9QDvfDmvj7kzHcZXRQcXtx566ctrqcMOLL/zNwepExaDQzXc+I5A4YpAYFI1kFHtfRdg0rJASMaCPeHh3Bg7wTPHguR7i7nLUw0djYIYr98qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LxGNi495; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LxGNi495"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a20dec69f9so7162121fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 06:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789133032; x=1789737832; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GRtNOlIv6Nq3mnj3CtQhPUwSgfYJDObGyFZaQ8xnneU=;
        b=LxGNi495ExZd1S3ovUUb0P0OhGIH+1Sfpr9NghkgE3oBK/fh/GxQvEWiinbTCiKCXm
         XrUEXUWh+Tks113I4Tnos550L8UZNMpWNPUEy7zVqub70fnLlloAf7IanN8t+vtGKjQo
         z1m7XEejAJGMgylB7IiRIglp7Wg1nqWqz84Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789133032; x=1789737832;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GRtNOlIv6Nq3mnj3CtQhPUwSgfYJDObGyFZaQ8xnneU=;
        b=SFPZjH4n3jxDYlEDmN58AawZ8SDgUBVHiLKVRtb8diHWr5sbakeDqls1pGd3uPvld0
         T7IP9/dqQ6natiQgFYcvLRHxrM0TZCQewH2L/q5qpSHEi9J9FJeFQnE8jXbfA/dC2fu5
         WXCHjZTMAqCu9n2W/htHZTencKjTTEdDgeFC6F+VdQEjwXaYpWEfHeLbzu65pxk4CO8d
         +1XskMrxuqfpERnBNJCooHEaAWsV7bWK7DhEcAkQvL5aABIGIrZXZtdU/a7TN7c4kSXH
         tiDAQvMaJm0HB3e52TMFLhoNxNpeEOOZu0nVRBzLM3hqSqbw12aFKn5MDgSZlCAqpYty
         GkYQ==
X-Forwarded-Encrypted: i=1; AKwUvBzV069xk1EoNrle8hzKJ1mM8eP8k1nfoNQPLbCxBfOjZlfFaWjs6rEaKPrAY2al3ooJkzbZ9jP9y9EMjsY=@vger.kernel.org
X-Gm-Message-State: AFuF++mc9wtC5Ip/OzZL7tkee5qSHaSw7ZNe28nWKjSUOGlXz4aOrhMt
	qVv94CEETp5nvkg0gXIVucYy7FlKPtwlrjzveg9Nl0U/04FFI1iRuQBNszeTgfESeg==
X-Gm-Gg: AYBFou2mZ1l0/kbTM3MG7KKW/ht4fb2qDJ7I/Tw4lV/5RVTAWDMGdDlnCJIbU13+osx
	M/S3APY2z6wVC+vdTFUOjbNbVkRSmuxCON+ihRUrzJEIFLokS0lLnOg2wcyCJ5v/y35xExI9ezq
	n9JNo78H/omWqmeMMpZ+GTeoDrBoingN+FmGnPGJ5oIDNRZp+DIR+S1pgyzQJ2+YxjNSF34OQ4e
	hOYvvGITkrQ6M5MQ1e+fsmSj4DB76BSIVClIgVQTcRDimTFjU5iu+7Tf4vdzcswJ2Oglx4Bdro7
	HCUxNfXQo4IZys2/a/n0Kk5zQeyilip/Nf/PVoBXaLCXWq9OLoChd9ugS6vBnNZJEwx9F/vFz2o
	ltUoWj3ZsxENEZm3QMN947N8sJlBCfe+t+9gtBEcubifn5ZLovIh0CQAxVCJk7lXV3+Lmxht2TW
	uf92v6ketnh6uve62SfLKWtoUu+9XVqGQVA5vvWTg7WLd+SjIYB0Ar1e+O4cC1KvzNm/ENBY6Be
	zd/vtgD9PpPGbyHm1hgfZS4P4k7CPoWKeYdxt4JTvu43aEL7w==
X-Received: by 2002:a05:651c:43c4:10b0:39d:b5b9:f0f4 with SMTP id 38308e7fff4ca-3a5a50895f6mr3800571fa.10.1789133031755;
        Fri, 11 Sep 2026 06:23:51 -0700 (PDT)
Received: from ribalda.c.googlers.com (11.36.88.34.bc.googleusercontent.com. [34.88.36.11])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3361f94sm5611931fa.32.2026.09.11.06.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:23:51 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 11 Sep 2026 13:23:50 +0000
Subject: [PATCH] media: uvcvideo: Fix bounds for descriptor parsing
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-uvc-ctrl-bound-v1-1-7b5cfc68bae1@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOUApGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ND3dKyZN3kkqIc3aT80rwUXctkQ0sTgzQDs7RkcyWgpoKi1LTMCrC
 B0bG1tQBPMFgRYAAAAA==
X-Change-ID: 20260911-uvc-ctrl-bound-9c1940f06fc7
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@skynet.be>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.3

uvc_parse_control() passes descriptor by descriptor to
uvc_parse_standard_control() with the number of bytes remaining in the
buffer, not the number of bytes of that descriptor.

Because of this, malformed descriptors could leak over the next
descriptor, leaving malformed data in our structures.

Change the code so we pass the actual length of the descriptor to the
parser.

Note that this makes the existing check more strict and some devices
that are wrongly parsed today will not be probed now.

Cc: stable@vger.kernel.org
Fixes: c0efd232929c ("V4L/DVB (8145a): USB Video Class driver")
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index e289cc71ba98..429f1ab19a2a 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -1248,11 +1248,14 @@ static int uvc_parse_control(struct uvc_device *dev)
 	 */
 
 	while (buflen > 2) {
-		if (uvc_parse_vendor_control(dev, buffer, buflen) ||
+		if (buflen < buffer[0] || buffer[0] < 3)
+			return -EINVAL;
+
+		if (uvc_parse_vendor_control(dev, buffer, buffer[0]) ||
 		    buffer[1] != USB_DT_CS_INTERFACE)
 			goto next_descriptor;
 
-		ret = uvc_parse_standard_control(dev, buffer, buflen);
+		ret = uvc_parse_standard_control(dev, buffer, buffer[0]);
 		if (ret < 0)
 			return ret;
 

---
base-commit: 27953c044974baf7e24dee3e9342fe0103dea80c
change-id: 20260911-uvc-ctrl-bound-9c1940f06fc7

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

