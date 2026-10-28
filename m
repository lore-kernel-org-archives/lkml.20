Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793152937;
	b=IxmlSi226ElBO6qaUNVN2REH5aOgBdkS32FAzmqYeBjqQXOhJXjZvpSQzeL/EeIb2NCr
	 xqelNHb9dW2wKe0T21KZ5KAssiqxHdMQvEZB/uKgj6AFeV7AfQ6TrxNQGv3/zGGC6Lbb9
	 xcgAPciLNvQRXDlA/skv1/7/oTSYnxJWuMPWbsR6huIl3zo2jK64xDoP2dpIwN99ytA9F
	 gWmyf2DiSSbegLml+Vc9p5yswLlmfD03n6EdhGmvaZ7zUfYpNkyYHsVMxvLQpqFuX/F21
	 sNuoWnbHzabeeRu1o2Rr2arjtmfclmS0jle+9pxjjU/Xyx9FKPvjsPXUmdhGyNGKLUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793152937;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=bgOwmvJGdHJNB2YB4D7tbJBXgsIE7A862obCalFUcYA=;
	b=lwFrxzou1RubtGFx12y+RXlU6TsAc9OpcSylY4Ir8uIwHNw1st0C+kE5p2FwIDK/VCZT
	 ehdvjKRjNFsgMGeTxZpnbJm5d1BIYKpL37D5mJSXRHT2clXeSho2waR8wHHWJJ1KOjW7x
	 vgHHSUt6eMJAuQ27WCY6M/dkjmCZ0RV5FXRkIU5g2z9/9bB9wm+uLY18ni+/deD6FJP+C
	 nkoeQr4FOgCmdd/D5XVycNEb3bLjK2u4I6l4+4x5GZz20iSp7Me+SBxqOpr6dyQ/HUXRt
	 WiOxIzAb7u6Wwy4D1yTXuwrWcEGewCXrOlA6yoC3nhubsGs5bCjESfecEmLvoFVs6JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Jd55GZRI;
	arc=none smtp.remote-ip=91.218.175.127
Received: from mta0.migadu.com (out-127.mta0.migadu.com [91.218.175.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2A3606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E2A3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Jd55GZRI
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=1VmNsjXZ33fxd9I6qk4WqjAifQMRdQQI9ROACXEeoFk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793152933; v=1; x=1793757733;
 b=Jd55GZRIdubuq/2IGIoIiLIBnaFhVIIt4lqJQIf2ubBf09qI3EfH8QhpkFG9XqUKkRS8kXmy
 ZXKj2j83XUCJaEgv6RMtsp24D+DOQoZUkRnv2IWBBmw0Fb/6b2njcsNwYj9QGPaO3gYPCCJuPye
 Nk0BBy0dAheWP24qY7Jk4UPc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ccf0161f9d1d6e92;
	Wed, 28 Oct 2026 02:02:13 +0000
X-Mizu-Trace-ID: ccf0161f9d1d6e92
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: Teguh Sobirin <teguh@sobir.in>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH] drm/panel: chipwealth-ch13726a: Fix dark grays rendering green at 120 Hz
Date: Tue, 27 Oct 2026 19:01:47 -0700
Message-ID: <20261028020147.2014466-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.56.0
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

The init sequence writes 0xf0 0x50 followed by 0xb9 0x00. The panel
configuration in the Thor's stock Android firmware (decompiled from its
devicetree overlay, dtbo.img) has two runtime command sequences that
differ only in the 0xb9 value, both "display off; f0 50; b9 xx; display
on":

  qcom,mdss-dsi-ram-command:        b9 11
  qcom,mdss-dsi-bypass-ram-command: b9 00

With 0x00, in the 120 Hz mode, a full-screen gray ramp from black to
white, shown with identity color management, renders black as green and
the darkest grays as bright green, both at maximum and at reduced
brightness, and the tint is more noticeable at lower brightness. The
60 Hz mode renders it correctly. With 0x11 the ramp renders correctly in
both modes and the panel dims without a color shift.

Use 0x11, the value from the vendor's ram-command sequence, instead.

Fixes: 3ee01b8647b5 ("drm/panel: Add panel driver for ChipWealth CH13726A based panels")
Reported-by: Aaron Kling <webgeek1234@gmail.com>
Link: https://lore.kernel.org/all/20260727-ch13726a-washout-v1-1-bf869ddfc5cf@gmail.com/
Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
Aaron, this should be the 120 Hz issue from your washout patch; could
you give it a try on your Thor? I found the issue here separately and
saw your patch as I was prepping for submission, and I bet I was seeing
the same bug you originally saw.

 drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
index 562dc573528d..0832e49b77a9 100644
--- a/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
+++ b/drivers/gpu/drm/panel/panel-chipwealth-ch13726a.c
@@ -65,7 +65,8 @@ static int ch13726a_on(struct ch13726a_panel *ctx)
 	ctx->dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
 	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xf0, 0x50);
-	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x00);
+	/* 0x00 (the vendor "bypass ram" sequence) renders near-black as green */
+	mipi_dsi_generic_write_seq_multi(&dsi_ctx, 0xb9, 0x11);
 
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 

base-commit: 8ef66514d7b993c9fb96a5886f001e3556610c1c
-- 
2.56.0

