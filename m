Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793173707;
	b=KPt3mZsp8G1b2knD+7Smwps1cx7gESubeIPCK67CVagknVpklfdIt2B+x5emOxJxPCZt
	 y4BoMQKNRa70W7lERBDizWIKO8dIA7OFtB0cR9x/IDtUwslyIp3q9QOPS46WELjegLltz
	 5ygyegV7qQNLR3BnrktlNX8VP0WxIE4XwTZCJAv3ZNxOzrRprEa6ODYUz1jNWzrsC58jE
	 klaHs6pNiN2v5Y9+CGdZ5K8A314/IPspT1aEa1hNjc7/kamfUjE1/cHeFSG+UhhuvL2Mw
	 F8TvZceORLFi3WML6IO18M4/vjzOuGOojYvveAt68vPA06rR+RCNMOlQnviXtO7uhUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793173707;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=7JDiLc3LwKorBdxIG2fO2JqwT8cJrgK3MbYLow1HkeE=;
	b=xB7yBXV7beHLwVEXbO1QXRewGgbTfQ4UvdIYNGw7579GiGYtcim1Gfd7GiDws0k0njFB
	 r4Yon65zpPptkhJpd0OpZoMcXLD2oA0m5Bn1pVTkd/RIx/WRFaAaNjKz8UTQxKXMghkck
	 bll/pceWYvdIj6BwXFVLbJiukHyehmYrSdYgutIjxqC3v7ofvgXwogUZdg9D6JWkpwBig
	 +W4UnElNue1ksVf4Q/AapSoq11Y1RyTpIOiY/WISs3pdNWl5eJp8wDBI/7dQTEmX/SB82
	 m9l5dBGRu8rB00PNufyzjF3Gk9ljqlb87hyBX2CkneptJM6efzRnoI9kTmUYT2fxrVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="WJwsi/aP";
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F45606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6F45606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sonalipradhan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WJwsi/aP
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so6987845ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793173706; x=1793778506; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7JDiLc3LwKorBdxIG2fO2JqwT8cJrgK3MbYLow1HkeE=;
        b=WJwsi/aPDlmQuEKdqEBYuYMRnOF0Ys+WLx1d+m9JyaUXGwib3GorzJdcuivp7QkZli
         zIofH4rrKKKrF8IJ2g0uzdCfbFnuiS2qeaNFbL3eCS8Sdq4zB6Ou/JTDd4jaYB0Pzjjc
         JALC9Unlvj3ZStTweea5iGCX3+l0ZMMjkI5UJyBcYVONeyCbIJnLwhdepY0UTOpWvgfH
         uXc0bVnZFBNuDXmyJtNDUA7T6UmwSmwyx97W/Z1H8l/fDfA34gkutmxCL7Paw2YoQB/2
         ns0mKVANZ60JtEGSfoljBS1MEF+YynsbKhO/fLELjqvntrNjEn5fA5CNxIRDoNgkmbk9
         boFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793173706; x=1793778506;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JDiLc3LwKorBdxIG2fO2JqwT8cJrgK3MbYLow1HkeE=;
        b=bXir/r7T9RLcMHPeu+Q6jb2paiV9KjzD+uBeFLFlbu46yxf0XcnilQ6FgPwf2euHrh
         uecYyDkHAJppMnKFzfzTIjWlzZaX73CgT0Z63eB2bDcQpLHDSczu2bo6fbsy75MGR8Et
         ebZjjiY50+vu7Jm6mXBIb6WXx5selzucI5jvFao4m0kW3DsuQuK7xM0Y7h5LeSdNRn2y
         uCJPK0CTYudMOWMtYFimwmeBkRHhIU4Fq7rPunWlMxbqN0aXRcG/hpgTJOn1mROPAkOJ
         EJBJz7NJoCHK6/6Bv4ByhkG08Q4W7NoOQ+FMtygT8MKjyi/LYiw8DJZVFTYbWO5aenMN
         Sh7w==
X-Forwarded-Encrypted: i=1; AKwUvByhDrcQ1qVliAb0ZcEMMiAEmI5Q0++dwckh/JfgRvipp+JTSU6isRpP3vOYEBlK799KheyrfZkQN+xNKgo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQy5y1/U8ARBSKUFWn3P/+mJIvpJJ+30JYWDTVpYcFHaMqtwVm
	zL2cK9A2ly9HDtycR+gezF8nEmT1C607OjXR1tQ7+9RMU6L/wldWL2jzrfcUL0wlpzM0D/ESCV4
	UMiSGdGi0AQcPHFEuRKTb9G9+6mux8Kactg==
X-Received: from pleo1.prod.google.com ([2002:a17:903:2101:b0:2ea:f42f:612a])
 (user=sonalipradhan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:2cf:b0:2e2:d834:a40f with SMTP id d9443c01a7336-2eb00141a17mr13956705ad.9.1793173705739;
 Wed, 28 Oct 2026 00:48:25 -0700 (PDT)
Date: Wed, 28 Oct 2026 07:48:21 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261028074821.579450-1-sonalipradhan@google.com>
Subject: [PATCH v2] usb: gadget: f_midi: fix UAF race during IN request handling
From: Sonali Pradhan <sonalipradhan@google.com>
To: nkapron@google.com, gregkh@linuxfoundation.org
Cc: tiwai@suse.de, balbi@kernel.org, jeffinphilip14@gmail.com, 
	victor.krawiec@arturia.com, fanwu01@zju.edu.cn, christophe.jaillet@wanadoo.fr, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, sonalipradhan@google.com
Content-Type: text/plain; charset="UTF-8"

f_midi_disable() drains and frees pre-allocated IN requests from
in_req_fifo without holding midi->transmit_lock. If f_midi_transmit()
runs concurrently on the workqueue, f_midi_do_transmit() can peek a
request from in_req_fifo and write into its buffer while
f_midi_disable() frees it, leading to a use-after-free.

Additionally, when usb_ep_queue() fails in f_midi_do_transmit() (such
as with -ESHUTDOWN when the endpoint is disabled concurrently), it
resets req->length = 0 and returns active instead of the error code,
causing the do-while loop in f_midi_transmit() to keep spinning under
midi->transmit_lock until the substream is drained.

Fix this by acquiring midi->transmit_lock in f_midi_disable() while
releasing IN requests from in_req_fifo, and returning the error code
from f_midi_do_transmit() when usb_ep_queue() fails so f_midi_transmit()
aborts immediately and drops active substreams.

Fixes: e1e3d7ec5da3 ("usb: gadget: f_midi: pre-allocate IN requests")
Cc: stable@vger.kernel.org
Signed-off-by: Sonali Pradhan <sonalipradhan@google.com>
---
Changes in v2:
- Remove the transmit_lock and ep->enabled checks added in v1 from
  f_midi_complete() and f_midi_transmit().
- Return error code from f_midi_do_transmit() when usb_ep_queue() fails
  so f_midi_transmit() aborts the loop immediately.
- Link to v1: https://lore.kernel.org/all/20261019135701.2767078-1-sonalipradhan@google.com/

 drivers/usb/gadget/function/f_midi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/f_midi.c b/drivers/usb/gadget/function/f_midi.c
index 63fb6ee70a3d..48cda34399e8 100644
--- a/drivers/usb/gadget/function/f_midi.c
+++ b/drivers/usb/gadget/function/f_midi.c
@@ -420,6 +420,7 @@ static void f_midi_disable(struct usb_function *f)
 	struct f_midi *midi = func_to_midi(f);
 	struct usb_composite_dev *cdev = f->config->cdev;
 	struct usb_request *req = NULL;
+	unsigned long flags;
 
 	DBG(cdev, "disable\n");
 
@@ -431,8 +432,10 @@ static void f_midi_disable(struct usb_function *f)
 	usb_ep_disable(midi->out_ep);
 
 	/* release IN requests */
+	spin_lock_irqsave(&midi->transmit_lock, flags);
 	while (kfifo_get(&midi->in_req_fifo, &req))
 		free_ep_req(midi->in_ep, req);
+	spin_unlock_irqrestore(&midi->transmit_lock, flags);
 
 	f_midi_drop_out_substreams(midi);
 }
@@ -661,6 +664,7 @@ static int f_midi_do_transmit(struct f_midi *midi, struct usb_ep *ep)
 		ERROR(midi, "%s failed to queue req: %d\n",
 		      midi->in_ep->name, err);
 		req->length = 0; /* Re-use request next time. */
+		return err;
 	} else {
 		/* Upon success, put request at the back of the queue. */
 		kfifo_skip(&midi->in_req_fifo);
-- 
2.56.0.307.g5fe7bd680c-goog
