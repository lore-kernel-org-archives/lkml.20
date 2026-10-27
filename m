Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114443;
	b=2O+cJf6GVJrq4msWUHx5wIGsjdOnwFsMPD5nNwrZ2tGLZ/R5UI1nCz4C4CIzJiBjx02o
	 nSk9qAHRbKpetaTZs1qj7qrJf9qoojqamnMzSRLTfGVtNgHM3PxHFpTLt1Gf38buC997R
	 Pbi4Dwl3HdOsIVetYpuw8FD/Z+wMAUdGF4dLUyZcrIkzC/kkD70GjZkiHmwXK/Ukgiroi
	 P+Fi2rCWmXcV2dNzJeKTbAlnRT1QHLonWP+L+nQl00kPMZO+50oiDTRrq6hzQHeOSHdPR
	 qHgTku0IwDSl6dpSZMw6TPUcwEZk9qoT6NX4L6n+iOHhP92MRgmgeWK6HdbPk3gXyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IUODWlkVmJj+vXJKTqvEsunNB2Kl3gE7BePTN1LJNVg=;
	b=Ff70IEFQqizxnR1mX710yRy467VHKxspDZXyDgT8TFBeAMnl9Eim4NKCGnKcp+JgsU7Y
	 DBLWEzIBrlxj+LaLo/kwVMc/SiGFpZSDvlmQXFcctyUXIiKVMnEGGKaVyr+0MyQHCKNqT
	 a+jFcY6+gmyy+PFjsvenf2hv33pctkm+HVkOOxW9/igCPTYYFkfIfcIdmz1i67OTKqv2i
	 ILFDLR80ULfkEx3TKuXSF1ZZORgP1EUqV61WDALD49ybDdOtLGG8+mN3c4SuewooB+jYq
	 90RoXKNK0pZSWJBm9RB3NxfHDgJ8y+R4Wiwo8up5g4swepiRbMbvcMluEHGRdQGEMCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ02HWUC;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB73606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HJ02HWUC
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2798401f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793114441; x=1793719241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IUODWlkVmJj+vXJKTqvEsunNB2Kl3gE7BePTN1LJNVg=;
        b=HJ02HWUCljsvvTDuU4SIGGVJepVyhAW2zmPlkDQM3DbJj7sQwqBgnKrcmvZmrWnVRj
         QxnyExlKG1VUJgHn+yUVboCeQxn+UBSkMaLdbBHMg/X0vIw5LCkejab6/r4D2okdIa9O
         bLc43zyqETBP8iVxkrlyAZvf1Qe2UjUByoAjTzwpNbeXupqM+GWbU//+MisPqamo/ma5
         N/5/MlQLeQt4rWGd2/CXi+YxztOHaxiRBP3vPXiAgrPGrenFbcETbGAAAWFwwaESOnqK
         PJWStVdsFLFVO0x/Kl2EuvshewWeTRkrsFrufY/MBPSXbF2YTGwPYZlgHzE5E3kGjA/0
         9bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793114441; x=1793719241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IUODWlkVmJj+vXJKTqvEsunNB2Kl3gE7BePTN1LJNVg=;
        b=yQKG+DYfA4Sr1T7jBGCfrSBoqppHo07L/Yu9ojepxDhI9rFIXH1B+EyLHEKiw0mfRV
         CGN7F1qW2tP02/9LIrKCxeD0wdtLA2UxwlzBirbNw0WIcullO1dwLLsMaZp2tKu2Ys4Z
         AzWbCVbSGC56bBAykKlwqmSK5lmkCNhVa3FOXsGAOio4RJ6D3zMoKelHDBUkmGN0lMZR
         ADeBtZS17aYic0Z4C/RVmr8QYeFeeiZDx46eqg1LMQ5lEHrHmbenpR787hoY4aYptRrJ
         6Q7wnmY2iqhIZHSUxxiCA5dDUhHjbKzfDyU3h5ewJed/5pnMMVHVY8tAF8ydBD2Os5ws
         TrYw==
X-Forwarded-Encrypted: i=1; AKwUvBwxTtzhqvelLFpPXKO8R9agAHdN81cnk4cquSkqtRhz5073qgR6M6yXIbJ1qqQJJPIh/ZlS75zD/PTK3s4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKLKY1ceIJz43ZgtZUudFP1TQGaYWwC66htYPiPhGFIICC5i5TU
	P1aDuDiaXpHUKPtYEj+e+PBlR68usWAwIZoz8wcUsEit23xUxeuKMIGAWoW8JpIs
X-Gm-Gg: AYBFou0UCw7d+3Orm55WGGwd5V2SOZSKhwd1GBvHNgK/8B2h59ih+XZyJ4SmT4029Ph
	qRCA0SG/AyzExzCIynEeT+l0e/v2g+jSY9XvHrr1LaIbtdXqPeqNSYHz5aIzGsSEWxDtx411Zx+
	FFh+X5ncIztsUdUmbSuA6kSvAtHBN7BtsCANPUJizQcMvLN53n8vNtpm0xPm6ZO77+M5EvpFhy3
	3TqRhciJ+eg6Wg0dIL3VFcsUCbc5geWBOWu13OYCzfolQuI/H/vkXjZYum+FU/8hVr3H1bEiNyM
	tmxfVaBET5Y2rwK9548tp5Kb0fwQHMgiwg0VjzVEffT80fW+v8iPVyILTedwDA+xH72GEq3UpsH
	a1c6H3I8qVWIOntntHD3FJqFByYi1QeGIDRQHb31iKLd/6jIQXpB3/G3nvZajw0TTJDoM17gokI
	dS0+XM903KheFvg3Cxa/ALS+1jEYYMQ2+tQ6aNmdzVg18bcvP/H11xCrfMuR2HGcEHt2i2E9mbH
	U6mh037vjTtTVWEgLPoqk+9UZxgBfsN8TogSEXjTy0OCbGwo8OZT6yCRgqLnWta3PPmw4Ovm1GZ
	Sg==
X-Received: by 2002:a05:6000:2dc8:b0:48a:f073:336b with SMTP id ffacd0b85a97d-48e3eb88c9fmr18966253f8f.23.1793114440713;
        Tue, 27 Oct 2026 08:20:40 -0700 (PDT)
Received: from stjepan-Aspire-F5-573G ([2a00:1bb8:118:d39e:4868:f22e:b51d:7cb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb902sm24533156f8f.24.2026.10.27.08.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:20:39 -0700 (PDT)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: Clemens Ladisch <clemens@ladisch.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: usb-audio: reset a MIDI device whose input is stuck
Date: Tue, 27 Oct 2026 16:20:34 +0100
Message-ID: <20261027152034.1871962-1-stjepan.poljak@gmail.com>
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
errors, and when input stalls, or keeps failing for 2 s, queue a USB
reset. Failing means that every retry fails: a successful URB, or a
quiet spell of over 500 ms between errors, ends the streak, so isolated
errors on an idle device never add up to a reset. snd-usb-audio has no
pre_reset or post_reset, so the reset unbinds and re-probes the card,
and userspace sees an ordinary unplug and replug. A real unplug normally
reaches disconnect() long before 2 s. If the host misses that as well,
as dwc_otg does behind a hub, the input stalls and the reset finds no
device, which ends in the same disconnect.

The queued reset is dropped without a word if usb_lock_device_for_reset()
fails (e.g. -EBUSY when the device lock is held for over a second), so
while input keeps failing, queue another one every 2 s. Keep that limit
per device rather than per endpoint, as several input endpoints may fail
at once, and a second reset queued while the first one runs would reset
the re-probed device again.

Output endpoints are left as they are.

Tested on a Raspberry Pi 3B+ (dwc_otg, Raspberry Pi 6.12.61 kernel) with
a Nektar Impact LX49+ (2467:2015) behind the on-board hub. Without this
patch, switching the keyboard off and on left it silent, with "urb
status -32" logged every few milliseconds. With it, each off/on cycle
logged a single "MIDI input not recovering (urb status -32), resetting
device", and the keyboard was disconnected, re-enumerated as soon as it
was back on and playing again, including two cycles 9 s apart and one
where it stayed off for 3 minutes. Unplugging the cable went the same
way: the input stalled, the reset found no device and disconnected it,
and plugging it back in enumerated it normally. No warnings while
playing normally over about three hours.

Also tested on x86_64 (xHCI, 7.0 kernel): there the host sees both the
off/on cycle and an unplug as ordinary disconnects, so no reset is
queued and input resumes after re-enumeration as before.

On both, three fake -EPROTO completions 10 s apart on the idle keyboard
(a pending input URB unlinked by test code, not part of this patch) were
retried and caused no reset.

Assisted-by: LLM
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
v2:
- A quiet spell of over 500 ms between input errors now starts a new
  failing streak. In v1 only a successful URB ended one, and an idle
  device completes none, so two isolated errors far apart counted as
  failing for the whole time in between and reset the device. Reproduced
  on x86_64 by faking -EPROTO completions 10 s apart on an idle
  Impact LX49+: v1 reset the device on the second one ("streak" of
  10240 ms), v2 retried all three without a reset. (Sashiko review)
- The 2 s reset limit is now per device rather than per input endpoint,
  so a second failing endpoint can't queue another reset while the first
  one runs. (Sashiko review) Not tested: this keyboard has a single
  input endpoint.
- Retested with v2 on the Pi: four off/on cycles, each reset and
  recovered, and the fake errors above. The unplug, 3-minute-off and
  x86_64 off/on and unplug results are from v1; those paths only see
  errors 100 ms apart or a stall, which v2 handles the same way.

v1: https://lore.kernel.org/linux-sound/20261026125751.1700779-1-stjepan.poljak@gmail.com/

 sound/usb/midi.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/sound/usb/midi.c b/sound/usb/midi.c
index e3d157554061..488dede19e45 100644
--- a/sound/usb/midi.c
+++ b/sound/usb/midi.c
@@ -70,6 +70,18 @@
  */
 #define ERROR_DELAY_JIFFIES (HZ / 10)
 
+/*
+ * how long input may keep failing before we reset the device (a real unplug
+ * reaches disconnect() well before this), and the least time between resets
+ */
+#define RESET_DELAY_JIFFIES (2 * HZ)
+
+/*
+ * a stuck endpoint fails again on every retry; an error after a longer
+ * quiet spell starts a new streak
+ */
+#define ERROR_GAP_JIFFIES (HZ / 2)
+
 #define OUTPUT_URBS 7
 #define INPUT_URBS 7
 
@@ -99,6 +111,8 @@ struct snd_usb_midi {
 	const struct usb_protocol_ops *usb_protocol_ops;
 	struct list_head list;
 	struct timer_list error_timer;
+	unsigned long reset_at;		/* when we last queued a reset */
+	u8 reset_queued;
 	spinlock_t disc_lock;
 	struct rw_semaphore disc_rwsem;
 	struct mutex mutex;
@@ -162,6 +176,9 @@ struct snd_usb_midi_in_endpoint {
 	bool in_sysex;
 	u8 last_cin;
 	u8 error_resubmit;
+	u8 failing;		/* no successful URB since the last error */
+	unsigned long failing_since;
+	unsigned long last_error;
 	int current_port;
 };
 
@@ -234,6 +251,40 @@ static void dump_urb(const char *type, const u8 *data, int length)
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
+	struct snd_usb_midi *umidi = ep->umidi;
+
+	if (!ep->failing ||
+	    time_after(jiffies, ep->last_error + ERROR_GAP_JIFFIES))
+		ep->failing_since = jiffies;
+	ep->failing = 1;
+	ep->last_error = jiffies;
+	/* per device, as several endpoints may fail at once */
+	if (umidi->reset_queued &&
+	    time_before(jiffies, umidi->reset_at + RESET_DELAY_JIFFIES))
+		return;
+	if (status != -EPIPE &&
+	    time_before(jiffies, ep->failing_since + RESET_DELAY_JIFFIES))
+		return;
+	umidi->reset_queued = 1;
+	umidi->reset_at = jiffies;
+	dev_warn(&umidi->dev->dev,
+		 "MIDI input not recovering (urb status %d), resetting device\n",
+		 status);
+	usb_queue_reset_device(umidi->iface);
+}
+
 /*
  * Processes the data read from the device.
  */
@@ -242,13 +293,16 @@ static void snd_usbmidi_in_urb_complete(struct urb *urb)
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

base-commit: a4311e9447bbb219044db38897f95be112f46a8a
-- 
2.53.0

