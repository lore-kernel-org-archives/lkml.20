Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315C376A16
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 07:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703361; cv=none; b=KuYJViDS1rxvL0a242OtQl+oFx/PW0smnfRQlnKk56Y2Iz9DDxDi5C//gWHZvz2rrwg/pEWxyNiATq14/+7W7yEpU8jKDXb0GXdpCGx7z8E3yD8r0MuLDu7fzh5qx1MNd3ds14P7SXaOLWrfuxrMTRgSRydhUlAaPduMkoksnt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703361; c=relaxed/simple;
	bh=fPtOYyery51wIT+wPHonfNoGlXmG8BGyYcpY5QZMuNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r1N2XUae37d0ua0pFKi3WxofHDsCk4ZHP7x08EOSo9O+w+jQ1nnMzoL3STo7pdndwN6PVFJ0fofVQ0MIpnNU0wezykn80binj7ZwRrjUVpuHXsWJMyiwhhc4PSiW3oyuDgFyZT2wgfwmQ8F2EIqUgaaaOJwIHaIJJKsAw7Mapz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4WHxTvW; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4WHxTvW"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso6339335e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 00:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791703358; x=1792308158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VizTuTMmqS8JYaZTbeKcF2/g08+w3bYur2XRIs9EVG0=;
        b=G4WHxTvW2OAPxgHeiW1+wMDziyAEKEASZ+mQmyVGEXzY92M76L/c/Ec1G2/r9Fx2U8
         Fb4NEoSrjVFXiU9DvZk7RpHvv5X7AgD9X1h3cRlYqMb+Fz8kB7wYwfzOaieujW9GPM+i
         TcAukk31JCMQ+QjkNUUCgPSTeW0RuFwlar86uvbxdhprPB6itErETQpnselgpv57Y18n
         +IAODTAmq/Be7Wlnr48AXu2bdG8YQeKoOg2eYSr0D39nyRlV1o9+5AoU3MNZJaaaH8W0
         zNBqDdfc30OSv2x6tPhHWdbsvDUoVKPD6DEoMpbWf43FdkHWieWMjXMuEkVFGLe0v+rj
         46CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703358; x=1792308158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VizTuTMmqS8JYaZTbeKcF2/g08+w3bYur2XRIs9EVG0=;
        b=ZZ4UQxQomVY2OVDC8rmO9XIeYbHzVBrANg/ghyRvwCFfhcKgo+6m/WB16/CEKIjQYq
         lREF68WbuTUH4YtcoJHNc0UpNEbbq/i2/5107/Dtr3dq47X2OWGuaDKlVXNfMC3o9Jga
         t5XM8yYMj9kjN3jQTPbNIQPdvxJ5qGZ4NybC23X9LS/wVv4ix7HioMx9xV6iz4xDG/6E
         4uvIXtz8+F/EoIyDJjSsTpO94OCNMqcsHv9lDLQLcdsUe7q7iX8m6kvaGHk8sucl1yqI
         U82c++e0aQ6zXc+v1bjFbXfnfwsURTsaV6Mcx8+d6O/KyAwlRCxEoImgG8RtnoptVU4A
         sDAw==
X-Forwarded-Encrypted: i=1; AKwUvByT8bjmRSHuW4ipZFyA2+pv9J030aShxIkImVFj3HIy+O89mD91gDyrjNSA9NCpMzulzCga5gPXyHZ78ZQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5nWmPe7YHYGTLM+nwSLxIcG1JFx0hfMwUZxLWcMZHB9FNoo1P
	qT/IwuC7cIUu3SbwB+Wihz+LiDre0dFcccyKiyFvhGjMjrbdqo+c7UFLyGoAwfDLqpo=
X-Gm-Gg: AYBFou2WQ3/wGsf22EU953kB9eko0jHiaDO2thAKImsFNGEiOUZGpHn/5UPJLg+G0oE
	hizlnGEx3/XYut0LoRjI6dlyLykjinnxkQwF9lxmTIhbYU1I4kDljvi4xfpGBYqnsquZUhIAjda
	FLyBjyp3BbVDDAVFPN5wCnNVePwRjKV/0SYLh4q2Po791V6/Metb+C81yrT7nDdiVzfgnZGYAma
	+hAuy1R6HCokYxkJOjBpbFjBbOWeVp9lYx1MgVuJD9ORrx3RYV3kgubkEKJaLfZQpQOIKllJD0l
	WvuGuJvUMbMQRWXPYMVPEoiqN1E0Y1sXh29ettHPTvWcGA8ZfNOlHU1DeM2SOjAVLJk1rWxA2ki
	86BQU/Ch9OHDESEP3DM4mN9/FfnylwEEe2j+xfmWhq8o3Hv1CtVcI9k2GhdA7v1ptj9MEz8x1Qb
	yf9KhvufUoTboAHGEJD15iWgYaSqo1Z+qPsZKlcjsO/YfgJCdy6iCKi0k32+zcna/QNJJXLngx+
	5qs4xURR4EkYgNX7LpGLWhhGuLFKaQEe9OfIEOtUAOpBUuLNcneghfAOuYapomD9+/uuig4qy/J
	thHuE32p08xxtiQQ
X-Received: by 2002:a05:600c:5493:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18e4ee976mr127814205e9.30.1791703358078;
        Sun, 11 Oct 2026 00:22:38 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19c8244edsm22878105e9.2.2026.10.11.00.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 00:22:37 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] usb: octeon-hcd: keep SOF interrupts while a periodic pipe is due
Date: Sun, 11 Oct 2026 07:22:36 +0000
Message-ID: <20261011072236.2381546-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cvmx_usb_schedule() now sleeps on an hrtimer until the nearest future
periodic deadline instead of counting frames down on every SOF. The scan
that finds that deadline only looks at pipes with

	next_tx_frame > usb->frame_number

which is right for picking the deadline, but it means a periodic pipe
that is already due and was *not* started is invisible to the decision.
A pipe can be due and not started for reasons that resolve on their own:
no idle hardware channel this round, its split window is closed
(cvmx_usb_find_ready_pipe() rejects both), or another pipe owns
usb->active_split.

Such a pipe is only retried from a SOF - cvmx_usb_next_pipe() looks at
the isochronous and interrupt lists only when is_sof is true - so when
some other periodic pipe sets a far deadline, the driver masks SOF, arms
the timer for that far deadline and the due pipe waits for it. With a
hub's status pipe as the far one, that is hundreds of frames; the code
allows up to 8000 (one second) before it falls back to SOF.

Before the hrtimer this could not happen: any pipe with a future
deadline set need_sof, so SOF stayed enabled every frame and the due
pipe was retried on the next one.

Note the pipe that is due and not started, and keep SOF enabled in that
case, exactly as the old code did. Nothing changes when no periodic pipe
is due, which is the case the timer was added for.

Control and bulk pipes are excluded deliberately: their next_tx_frame is
not updated on completion, so they are almost always "due" and would
keep SOF enabled permanently.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
Resend of
https://lore.kernel.org/all/20260915081724.25637-1-orgads@gmail.com/
with no code change; the Assisted-by tag is now in the form
coding-assistants.rst documents.

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -1923,6 +1923,7 @@ static void cvmx_usb_schedule(struct octeon_hcd *usb, int is_sof)
 	struct cvmx_usb_pipe *pipe;
 	int need_sof;
 	u64 min_due;
+	bool due_now;
 	enum cvmx_usb_transfer ttype;
 
 	if (usb->init_flags & CVMX_USB_INITIALIZE_FLAGS_NO_DMA) {
@@ -1964,12 +1965,23 @@ done:
 	 */
 	need_sof = 0;
 	min_due = ~0ull;
+	due_now = false;
 	for (ttype = CVMX_USB_TRANSFER_CONTROL;
 	     ttype <= CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
 		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
-			if (pipe->next_tx_frame > usb->frame_number &&
-			    pipe->next_tx_frame < min_due)
+			if (pipe->next_tx_frame <= usb->frame_number) {
+				/*
+				 * A periodic pipe that is due but was not
+				 * started - no idle channel, or its split
+				 * window is closed - is only retried from a
+				 * SOF, so do not sleep past it.
+				 */
+				if (ttype == CVMX_USB_TRANSFER_ISOCHRONOUS ||
+				    ttype == CVMX_USB_TRANSFER_INTERRUPT)
+					due_now = true;
+			} else if (pipe->next_tx_frame < min_due) {
 				min_due = pipe->next_tx_frame;
+			}
 		}
 	}
 	if (min_due != ~0ull) {
@@ -1983,7 +1995,7 @@ done:
 		 * a few frames. Stay well below the 16383-frame wrap of
 		 * HFNUM. One (micro)frame is 125us in high-speed mode.
 		 */
-		if (delta <= 4 || delta > 8000)
+		if (due_now || delta <= 4 || delta > 8000)
 			need_sof = 1;
 		else
 			hrtimer_start(&usb->sof_timer,
-- 
2.47.0
