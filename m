Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA633AAF7A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 08:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789460252; cv=none; b=hionaJj183QJa+vEv3kRLF162V/nVC3W80CSWM+Fo6Vin+V3PUuLWcnkTyMOuyQIm7JGaC6icdm1GHS25cTeO3Xgw6nKDr1eVp8uM+JISpjq57f71FI+dX5NAir9MzXKUh6esXGqqUs0KyE7blLNv3p6wHMReC7jn6bhRh2wsTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789460252; c=relaxed/simple;
	bh=ikVItM4c5MyquBuPQpXW+/IZc5tdSZkXIzkp415pSPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QOHuDIuV+7iq7jmrQX3eywKRP9iAklbcspg78rxnAIVLH4y8fa19adQlm8Zhip6BVNpOmpzFiDMYbYWlLeCXLfqua0fckz2WXOJgKNNCS8IeigOozTeaohqwmG66WFN4yy6cgi2yjniSQsqEvY4tLt5g2Lf3nsYW/m0CXq1XObc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I44qzsDA; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I44qzsDA"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e721b5503so206615e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789460248; x=1790065048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8pTpGUAD77RimGr9uBvcqWJOmvNRfvA4ujxJL69sXts=;
        b=I44qzsDAEtrm4El80OELCgEMjb3t281cjM/b5fogQ7REHPw0lx0DoCcaFyUCFWAVFF
         ap6SAbU3/5DfFL6U0oXVqfTnT+q0NQW94aRjjbPm/rOCaTp7VpTfx2zoW1RPYW/MelFr
         IGric73QdXSh7WDjkU5ZYRyOFuJs/4rO096cjFPnykdLRux+RH1+Ds/841xfTqHojhEn
         cEgnrQ0h72Dkv2ueMBZ+scW7jN+zVrW/KdDI2hZ6+SPHvZkIVJCqcFdmbHq3FHBD3nKs
         aYCxPl6emGnLI5ZEamGoKtAr2+i9CDAkcVzP41ZN33u4QmZozHlOq62FAKwdxLTuHO+5
         FQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789460248; x=1790065048;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8pTpGUAD77RimGr9uBvcqWJOmvNRfvA4ujxJL69sXts=;
        b=m0t2xFub7GYM0udFzPky2ac1cWI4QUvDGg9Z3NneuB3G29AekW/kpTMIfXemlfgS8l
         Nfk/0GPrTIK0IwL8oRLKuUtMO6LhsCNrdignbe6SPXucjxI6yZYqQXrIIejHZEmzrefv
         x4NNN/7OBrVs1+mMJ8y1sR/jXibC/ye3B3VagWYidQTTHWCpAGdicFrI9gs6dLnMfZ1j
         M5/RMrZbFvKoWkl7f/EUz+1zV1n9PfoaLCRNgK7SryqsNWo7CnmM6BreirmA7MqNTyUh
         omTbzWy4S9gqirBSZ9omUwhkk01nCNCSW2Xxs42VEdZXyT3dFGGDlfXr2dbFj2ZQT/hi
         BklQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHtP4y5qU/wddBBjY/jOfHYrQ5cPNrlK/xdX6C9udLAIS3/7fpL8HLJ4511Mhd0xCzNJLEpMBBgZ5OExs=@vger.kernel.org
X-Gm-Message-State: AFuF++lSjSzoEZjKLF2Yi88gneQSE3+dfygloxV2o0gUif6Td3EhMDBy
	bY56IO3hY3aSEYkjxu8IM6KTseMQ+ydRYlu+9mq3a0k4uJ96VFwv6wZI
X-Gm-Gg: AYBFou3JlxHOdjOZiTAL1DUHuw9+53VC39N06Jz536tXc2pLCMTGIMKiGOw8hq40amC
	VhacJdAKQDlmhw7DM1r1Vvevv5dgFTwYrQ4Ad2ycYmYmhuhfU+plx8+uwOMnt7S/5fFfIkLJBsN
	UkO75wi92W95+1HvAQCitBWr//lyuPYnGD8BQ6NzF0zsH1AkkyiCwDRt7tw/5QcUYrD3w0AB6Jk
	kTPpZE5x8nUrpvUHuvC2Qyf1x454VEb958igqa+4oyElf3cc4yARkKhhUxlWlrrXiSRDZxrNf6k
	i+RlH/+4Z63ChgV5UQ8d2UVflQ3qMzVe1YncEBcG7Pal4EmKmqHF4I7wd7zegA7gnKv33EkQWVn
	qakN/PTb1L3xhgqxZQwM+GYbWt6Oc2DSrUHmH+mkibxNjxo28XjI+cGI/TsrRidzYyNk+RxSgZQ
	G1i++awxo2HuRlMRK88l1Q0t5gH6t2gCDso8tNsD9srmGUM/eJGDQLn6Sc3aaQjq9gsv0rAFIMc
	l3zFrjZ8JW9x0Xc+1VVIQewqA0vySRv1EK/Vmmlr7k8Q/VEXeGAugjAdsDabI8YQ2u6Xw1oncC+
	BovRu6gxMmTMNgOZ
X-Received: by 2002:a05:600c:4743:b0:49c:fc6c:be13 with SMTP id 5b1f17b1804b1-49e82268b7dmr2094545e9.25.1789460247500;
        Tue, 15 Sep 2026 01:17:27 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d66a4a3sm64059695e9.1.2026.09.15.01.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:17:26 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: octeon-hcd: keep SOF interrupts while a periodic pipe is due
Date: Tue, 15 Sep 2026 08:17:23 +0000
Message-ID: <20260915081724.25637-1-orgads@gmail.com>
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
Assisted-by: Claude:claude-opus-5
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
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
