Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019484;
	b=NnFOGZa9BYjuc1CAUnVmlp+jRMyiJ2VBCBBCciT1wzjE4qmapRfU8TAh4aS77ExNlVGX
	 7xvYGAi4QEMWakYw+X/TqPpJWiG8/LLXEHOpMV/NAYw7wU77gn5YJQTgC6k8Wfpb23XR/
	 zCt7Y56+X8c9Tkc9EOGzu+yF5abflp3dlr2ouZDN1SDvA5IevOCx+vwFZaMLO96B6XFAh
	 fXCPPAVPOLHrwOeEBZYS+Xe6U0RKPLnst/H/DCQbQhh1mbSlk3q9LmkuhB76/lDjNYWVJ
	 FwbMa3shNYFU0Ri+w6Pv3D1BiGUP4H1iiu77e6CHSYh3L+uP90FwDzFB9bGqWGy5xqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CDuCVz07S0qbPUdAIoAtmgasF8yvxzKJyrb8p26CSho=;
	b=L1aRw7iGJl+BucPDwgPe7KoZVWqvqoaZunYm5xfS2W9/zAHgPqwGmuUlHdMeAaZHAIh0
	 dORQqooIH+Qb1a6o56W2s8yGxOtj/tkfpmNum7ADw4U4qv3HeyWLXlBxOJQmpsx0Wdwe1
	 oYssqesayEBYZeullNx+m/9Y+iIoDgKRHkQ6lwIqikVjb49ig1EY4KLzT3klk0FIRfn3y
	 gbmSg3g1r8mM3i/1lMgty7sWSUCpJEBqtRKxZL0VOUFi+9U6F/Ar5iA44KupHOxijt7FD
	 HuUUBUhiHV1wOa5rFTj++hxoZRW5RVzSga+6JN/6qjT247eX8mJBVJHoQ232TQfmFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+vtiLKj;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8301D606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:58:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8301D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y+vtiLKj
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df54150dfso1594374f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019483; x=1793624283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CDuCVz07S0qbPUdAIoAtmgasF8yvxzKJyrb8p26CSho=;
        b=Y+vtiLKjJ1N9OgW2m0zh3o2GnfDpPDv9JuQKGv7uung54Kjb4xMG7uhUVywhkef8ef
         7FW7OyD5ub4rNm+tOj/13wlRNWcKwz/QpL18ZLDqkolzpXopBGw1kBKhtfaUdQIE/hww
         O+NZJEkHoFHyzsqEslf+cz7EoteAt5PfaS9zNxcUREt/oHZJ7aLdFZLQH17nIxviN3g7
         TWwPQJzJvImMdezxUUzjflDZtlWULa0MxrpLORzokcSp4NXQd9ldZOOaWmPnvr+QAVaR
         Pu4PKopoX1vg/QJoFFoVg5SznRvshS6dpJ+H8zJ44+B5n0JEnNR1Ik+QDhcGlRSqoJf6
         zOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019483; x=1793624283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDuCVz07S0qbPUdAIoAtmgasF8yvxzKJyrb8p26CSho=;
        b=XlfBvKbREa2wSAPq0gEdxCH5rV+n1W+/Qm6jj14TxXAnvvz/EVfvQL3cwpKImFyfZA
         Q14+xXHaXlcIvHzAyeZnE9RtWYKY0iR6XhccvjuC/TrwCNNKHRe5zq6bJ06ri2FfIKGp
         SG9VrwdxBUOtvPOXTY8lbAltfkCXWNmCNAE7VFLgnjnyAFIkVDG39YZlcLVOGE2VqRlY
         S6MXlzXEmsN9QKuDnTQk+JVHQOjPOZdHbrlrEHgeNPbGHO27G46MCb+wWwVqGIFl+rtE
         oTX8TVcGIx8VxejT0w6FoEBz1mo8z77338dU7lKtxcAfjLTj8/re5mRC5U+fnaUuU93V
         4+sw==
X-Forwarded-Encrypted: i=1; AKwUvBzjoAgDxFPyO82upGCPFXFvb5Nnwf6mH0zTD9E4mcl2MyyWngIjXeC6j6lDavWF5hHNv/FQfRrPwjLl128=@vger.kernel.org
X-Gm-Message-State: AFq9FYJKWHtweqhisY6xpUZhLHvexi3GGvZJjKbJff7ZWB60DWwzUIav
	GCFbL3t6UBDUIyOJYbItcdXfJuLlxZshRoLkjwhWxnsDPr3kGvPfG2Oa
X-Gm-Gg: AYBFou0sPGj928jRTuIDXPC7jjRYQeTASUPJLPa49kg24LVcrvn+GTVNivD/EyqEZBF
	a4idCrK3I+isXAyje2kmcsieMAhnCMVpcZwdu+HzAaXO0ubjs64CBORkLyfUjydQ1TyUpV9/paf
	HgKdsG15r1RM0NPbONnEcDY+bbI1tl0/bna33uUX3v6yfy3+1JJyN74yGbk/wdiJr+9MtiCDjI7
	Pq8Z+vBoeBVG8g0UBsH3XNaExvSPQeTmlMihIimY55QiHfMKMO6085mc80rTE1s9WW6n2CyGExz
	631dx5yV3CXnCQ3lej9o9vOaEzYkkAlQlRF9Ca/ogR1wsYjQXL4y8fcDBMidA11vNQw6s9raoBj
	BtljdK/9gzb27L+sLG7QuKq0/q+vZvuxwbCfGDZ5Y5zL4KYaHR9fUH1PDZzS8FBedidow1H92SQ
	OeQaNwGU8Cu5ozbLYpbEGCSkTi8KVvFIPYBs8U6WbeDfMGXTR1WC6GNG0ZaCCcSyO/FanxcZUaE
	4DP0eofk5t3Lm+5QIRqhVMchlOKTEfGHraeFsLoAyiPEjk6+CWsISZtk+zZrzNtJTBdXnzksMkb
	ied7TeOflaliSWcLk/ZNI9Q=
X-Received: by 2002:a05:600c:1388:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4a35aca74f6mr151054235e9.18.1793019482733;
        Mon, 26 Oct 2026 05:58:02 -0700 (PDT)
Received: from stjepan-Aspire-F5-573G ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb99esm15827381f8f.23.2026.10.26.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:58:02 -0700 (PDT)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
Date: Mon, 26 Oct 2026 13:57:51 +0100
Message-ID: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Switching a bus-powered USB keyboard off and on can be too quick for the
hub to report a disconnect. The device comes back unconfigured at the old
address, and its input endpoint then fails forever:

  - with -EPIPE, which snd_usbmidi_urb_error() logs and treats as
    "continue", so the URBs are resubmitted at once and the log fills
    with "urb status -32" every few milliseconds;
  - or with -EPROTO/-ETIME/-EILSEQ, retried silently every 100 ms.

Either way the rawmidi device stays, reads never fail and no data ever
arrives, so the instrument goes silent until the cable is replugged.

Retry a stalled input endpoint through the error timer like the other
errors, and when input stalls, or keeps failing for 2 s with no
successful URB, queue a USB reset. snd-usb-audio has no pre_reset or
post_reset, so the reset unbinds and re-probes the card, and userspace
sees an ordinary unplug and replug. A real unplug normally reaches
disconnect() long before 2 s. If the host misses that as well, as
dwc_otg does behind a hub, the input stalls and the reset finds no
device, which ends in the same disconnect.

The queued reset is dropped without a word if usb_lock_device_for_reset()
fails (e.g. -EBUSY when the device lock is held for over a second), so
while input keeps failing, queue another one every 2 s.

Output endpoints are left as they are.

Tested on a Raspberry Pi 3B+ (dwc_otg, Raspberry Pi 6.12.61 kernel) with
a Nektar Impact LX49+ (2467:2015) behind the on-board hub. Without this
patch, switching the keyboard off and on left it silent, with "urb
status -32" logged every few milliseconds. With it, each off/on cycle
logged a single "MIDI input not recovering (urb status -32), resetting
device", and the keyboard was re-enumerated and playing again 2.8-4.0 s
later, including two cycles 9 s apart. Left switched off for 3 minutes,
it was reset, disconnected cleanly and enumerated normally when switched
back on. Unplugging the cable went the same way: the input stalled, the
reset found no device and disconnected it, and plugging it back in
enumerated it normally. No warnings while playing normally over about
three hours.

Also tested on x86_64 (xHCI, 7.0 kernel): there the host sees both the
off/on cycle and an unplug as ordinary disconnects, so no reset is
queued and input resumes after re-enumeration as before.

Assisted-by: LLM
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
 sound/usb/midi.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index e3d157554061..7f93df66e55b 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -70,6 +70,12 @@
  */
 #define ERROR_DELAY_JIFFIES (HZ / 10)
 
+/*
+ * how long input may keep failing before we reset the device (a real unplug
+ * reaches disconnect() well before this), and the least time between resets
+ */
+#define RESET_DELAY_JIFFIES (2 * HZ)
+
 #define OUTPUT_URBS 7
 #define INPUT_URBS 7
 
@@ -162,6 +168,10 @@ struct snd_usb_midi_in_endpoint {
 	bool in_sysex;
 	u8 last_cin;
 	u8 error_resubmit;
+	u8 failing;		/* no successful URB since the last error */
+	u8 reset_queued;	/* at reset_at */
+	unsigned long failing_since;
+	unsigned long reset_at;
 	int current_port;
 };
 
@@ -234,6 +244,36 @@ static void dump_urb(const char *type, const u8 *data, int length)
 #define dump_urb(type, data, length) /* nothing */
 #endif
 
+/*
+ * A device that was power cycled without the hub noticing (e.g. a bus
+ * powered keyboard switched off and on again) has lost its configuration:
+ * it stalls the input endpoint or stops answering, and resubmitting the
+ * URBs never recovers it. Reset it instead; snd-usb-audio has no
+ * pre_reset/post_reset, so this unbinds and re-probes the card.
+ * A queued reset is skipped if usb_lock_device_for_reset() fails, so if
+ * we're still here a while later, ask again.
+ */
+static void snd_usbmidi_in_error(struct snd_usb_midi_in_endpoint *ep,
+				 int status)
+{
+	if (!ep->failing) {
+		ep->failing = 1;
+		ep->failing_since = jiffies;
+	}
+	if (ep->reset_queued &&
+	    time_before(jiffies, ep->reset_at + RESET_DELAY_JIFFIES))
+		return;
+	if (status != -EPIPE &&
+	    time_before(jiffies, ep->failing_since + RESET_DELAY_JIFFIES))
+		return;
+	ep->reset_queued = 1;
+	ep->reset_at = jiffies;
+	dev_warn(&ep->umidi->dev->dev,
+		 "MIDI input not recovering (urb status %d), resetting device\n",
+		 status);
+	usb_queue_reset_device(ep->umidi->iface);
+}
+
 /*
  * Processes the data read from the device.
  */
@@ -242,13 +282,16 @@ static void snd_usbmidi_in_urb_complete(struct urb *urb)
 	struct snd_usb_midi_in_endpoint *ep = urb->context;
 
 	if (urb->status == 0) {
+		ep->failing = 0;
 		dump_urb("received", urb->transfer_buffer, urb->actual_length);
 		ep->umidi->usb_protocol_ops->input(ep, urb->transfer_buffer,
 						   urb->actual_length);
 	} else {
-		int err = snd_usbmidi_urb_error(urb);
+		/* a stalled endpoint stays stalled: don't resubmit at once */
+		int err = urb->status == -EPIPE ? -EPIPE : snd_usbmidi_urb_error(urb);
 		if (err < 0) {
 			if (err != -ENODEV) {
+				snd_usbmidi_in_error(ep, urb->status);
 				ep->error_resubmit = 1;
 				mod_timer(&ep->umidi->error_timer,
 					  jiffies + ERROR_DELAY_JIFFIES);

base-commit: 5deb9c57ba93d28a52871a96f3d8794d2cbed035
-- 
2.53.0

