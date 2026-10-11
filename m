Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71AA3630AC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791705911; cv=none; b=EMrhRNTE+q0fkvWM7CSrTvCF1V9w314AG1vjMOOMAGudb/ZW+UQThw+v8yvZ0R44HGWILNtTT4a+Ewc2lkIXcUkXzecRHpkF87nufspAC0YaNJChVxTwspwqD5dFbL/qBFQakcImvOBUT19yKVRD9rZ4N0S10J4JpoOgmSxMV9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791705911; c=relaxed/simple;
	bh=Dd0AlETCrLfBhwgPv/+aAB35OnDGld5JfQtHhBHb438=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p+VC3ngFap1985D/trtwROvidWHeHtvBspE8Uhrj/ogwyMtw/zDoNh0fDLmIaLqvIVD7S3ThZfSYdr+v2AsgxJiEQuyoBflYwS6+rMEZ4+dEp2WD1J9E0t8fm3UAZH3PO5i7fhbRww3OFz2nLcB+5f5PC1kTaG68REY6R/Ghifo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J++zvAya; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J++zvAya"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so9474985e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791705907; x=1792310707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHRwnViPe+B6SXPirxdpPYH3hzjizazcvdZWVcjfRYc=;
        b=J++zvAyadO9f+fK/sTclCsfwvrhcCgYj9XP+SmLag421FySxbP17MCb395sQKvw5Fh
         OGu42LDgxxLDkv/JOCj5GaqmpvGyX30Y5MNyUf7dV3lJAOG5b6Be52im/0AGVP6T0XcC
         rnkr2RbKFqLPKmCM8EW3ZwmyJVBqk9LWRWx0542kc5iVkTjxpIVkVFAzzDBGcx1IrQLh
         JifnUIrnGSnhNU9xar78mTzokMbbPcUcZh40FmdNDhJjY9h4AdHD53emI6DnYENC2gSb
         79SKnK40BTjK4UM5zrFgkcKI+2dZulNXEAN3c9M6YLpISAt5jUKrU6G1e7HK9AXP9ElH
         nNZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791705907; x=1792310707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sHRwnViPe+B6SXPirxdpPYH3hzjizazcvdZWVcjfRYc=;
        b=oWKmmsDWHOtzY6yAqFSvbEq7nDoAb4g+ZIFtNnf79vv1Ngm6Lp0BpM5K4bxvCelrg2
         vJzUuwQC6QRbx9Q/hKENVexCZCKg2CgJveYeFVlOK40Y0pakPhdwwpwN+T3J02P+fL01
         GygKpI71uFTCZkC0o+13PJKr9nTNIhYGBV/1CNx8SpvryoxRC+5CCQxP/bW7AgC9fy6w
         93TZZAv5w1+uGVi9zIgxY9e0aTrtnxr14fY1Qbx5Iz7JolpTZTv7liW75alEGF/zgy6G
         ps83JWWxlvvbJ2IZvx0HU8IV1AFs2JldYFvLx4a2NVOjf6kEWLyMGZkvbUCrONgKRqzb
         0MIw==
X-Forwarded-Encrypted: i=1; AKwUvBwBgnu08jIpXY+HoAmCXQeMQFYfwkhYz+Gc5ExnkdgYYRfet7SaJlJIk8upKSNOg3HpFiJa5Dd4dYpxDRA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL3w8cfPV9EdQenRXh33IOsAtXUKNrrowdP5nweth0h4TwbOOMc
	GjcSIWC5jpR5tHg63ywMDdFniTSmirKsoT9nsBjrFXyzhHlYiE4wXk0dIsA60zwIZQg=
X-Gm-Gg: AYBFou1ECeMqRZkbZPfsZTFLU3PM9m5s8v6SFeCbCJ3Lvff31H4ZrEG4XnPoUo4Vcgf
	yyAaw1N4kbPRvwARoskeOQcTAWvPieNMYw/oNq0yP+6tWpLTJXf78tbUmgd1UZJUd9T2OUigEjS
	xCnQEuSOjE5dRqhYsbj/VVOL8cERysiBBoZqSCle3gne+hnQlhXtwZLprEOEw0tsSMWV4ehDb1H
	ZDsQAmJ/V1tAh9W2TAyynI1BD2TVlFVe5SQMKL/F6MZ6aAK7DHaFobFQ+WR+j/qCNm944GNSGg/
	triTugSDUm3O8dZ5lVBzr3EXbL1rXi6Z8MBOwG/6CHLZZEIU8mM29RO8/ahQyN5VIImc7VFeTuu
	DPPmqewFdHRsdPt5wjgRvRZEi//NmLqo5Cxl/TexYIblQMpfl4QyLbj+6EnqfqAsN3kOu4fqOQJ
	w4FqXMKhM7N9TgSXmg0yHcuwKHzJJ0NMzMi/j/JxtjZp8eyasAtigI9WJLiY82A9pcrAa5GpaHD
	JhUZMB+PaCFMUGGT5KggebIsiZpiN5B5YgOd4WivVAeeTtngdww43ZIkDelyavv/pHWXpu/oIC8
	ZLTwiaaoehx9BdqG2Q==
X-Received: by 2002:a05:600c:19c8:b0:4a1:777b:8a12 with SMTP id 5b1f17b1804b1-4a18e4adcdbmr114834925e9.14.1791705906973;
        Sun, 11 Oct 2026 01:05:06 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dc1b30075sm9520337f8f.19.2026.10.11.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:05:06 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] usb: octeon-hcd: keep SOF interrupts while a pipe needs them
Date: Sun, 11 Oct 2026 08:05:06 +0000
Message-ID: <20261011080506.2394708-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261011072236.2381546-1-orgads@gmail.com>
References: <20261011072236.2381546-1-orgads@gmail.com>
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

which is right for picking the deadline, but two kinds of pipe that
need a SOF to make progress are invisible to the decision:

- A periodic pipe that is due and was *not* started: no idle hardware
  channel this round, its split window is closed
  (cvmx_usb_find_ready_pipe() rejects both), or another pipe owns
  usb->active_split. cvmx_usb_next_pipe() looks at the isochronous and
  interrupt lists only when is_sof is true.

- Any pipe that has sent its start split and waits for the frame its
  split complete may go out in (split_sc_frame, also checked by
  cvmx_usb_find_ready_pipe()). A control or bulk pipe on a full or low
  speed device behind a hub is in this state between its two halves, and
  with SOF masked nothing guarantees an interrupt that brings
  frame_number there.

When some other periodic pipe sets a far deadline - a hub's status pipe,
whenever a hub is attached - the driver masks SOF, arms the timer for
that deadline and these pipes wait for it. That is hundreds of frames;
the code allows up to 8000 (one second) before it falls back to SOF.

Before the hrtimer this could not happen: any pipe with a future
deadline set need_sof, so SOF stayed enabled every frame and the pipe
was retried on the next one.

Note such a pipe and keep SOF enabled while there is one, whether or not
another pipe has a future deadline. Nothing changes when there is none,
which is the case the timer was added for.

Other control and bulk pipes are excluded deliberately: their
next_tx_frame is not updated on completion, so they are almost always
"due" and would keep SOF enabled permanently.

Fixes: aebbc7d63407 ("usb: octeon-hcd: sleep on an hrtimer for far-off periodic transfers")
Assisted-by: LLM
Signed-off-by: Orgad Shaneh <orgads@gmail.com>
---
v2: the Sashiko review bot found that v1 missed two cases:
 - due_now was only looked at when some pipe had a future deadline, so
   a due pipe with none still left SOF masked;
 - a control or bulk pipe waiting for its split complete is in the same
   position as a due periodic pipe, but v1 excluded all control and bulk
   pipes. split_sc_frame tells these apart from the always-due ones.
 Compile-tested only: there is no full or low speed device behind a hub
 on the test board, so the split path is not exercised.
v1: https://lore.kernel.org/all/20260915081724.25637-1-orgads@gmail.com/
    and the resend 20261011072236.2381546-1-orgads@gmail.com

diff --git a/drivers/usb/host/octeon-hcd.c b/drivers/usb/host/octeon-hcd.c
index 256e459..9477a1d 100644
--- a/drivers/usb/host/octeon-hcd.c
+++ b/drivers/usb/host/octeon-hcd.c
@@ -1923,6 +1923,7 @@ static void cvmx_usb_schedule(struct octeon_hcd *usb, int is_sof)
 	struct cvmx_usb_pipe *pipe;
 	int need_sof;
 	u64 min_due;
+	bool due_now;
 	enum cvmx_usb_transfer ttype;
 
 	if (usb->init_flags & CVMX_USB_INITIALIZE_FLAGS_NO_DMA) {
@@ -1964,15 +1965,32 @@ done:
 	 */
 	need_sof = 0;
 	min_due = ~0ull;
+	due_now = false;
 	for (ttype = CVMX_USB_TRANSFER_CONTROL;
 	     ttype <= CVMX_USB_TRANSFER_INTERRUPT; ttype++) {
 		list_for_each_entry(pipe, &usb->active_pipes[ttype], node) {
+			/*
+			 * Do not sleep past a pipe that is only retried from a
+			 * SOF: a periodic one that is due but was not started
+			 * (no idle channel, closed split window, another pipe's
+			 * split active), or any pipe waiting for the frame its
+			 * split complete may go out in. Other control and bulk
+			 * pipes are left out: their next_tx_frame is not updated
+			 * on completion, so they always look due.
+			 */
+			if (pipe->split_sc_frame != -1 ||
+			    (pipe->next_tx_frame <= usb->frame_number &&
+			     (ttype == CVMX_USB_TRANSFER_ISOCHRONOUS ||
+			      ttype == CVMX_USB_TRANSFER_INTERRUPT)))
+				due_now = true;
 			if (pipe->next_tx_frame > usb->frame_number &&
 			    pipe->next_tx_frame < min_due)
 				min_due = pipe->next_tx_frame;
 		}
 	}
-	if (min_due != ~0ull) {
+	if (due_now) {
+		need_sof = 1;
+	} else if (min_due != ~0ull) {
 		u64 delta = min_due - usb->frame_number;
 
 		/*
