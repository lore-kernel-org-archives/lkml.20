Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891815;
	b=28xGA/4W+gR7xonwi51mRQMtAblDo5fHlwX/s3RH5maOwmcHV+tWFfMZ4KZQ7ib5FTbZ
	 CrGXqwll3KpKZCgEQu07Zuk3e9O9BQQjUDFZVzQz0gYq2qnzbmToDOUVzlylSJ+uXHJb/
	 7MBDB4/xkD4mkxnMuWObB6uRAehtyHW/FAcwxaHNBoPIQeQtyAjK0eROy47KI7EBRiMDS
	 pc27neT+0ilCIPRe58vrqDXpXckUw0J/vK+l8EQR//QiK8TuVu3IhmfifHpwZIE+FI3Kq
	 Kka8yHcmiJhfA13uh9eQo3ttg19EBhHYr8BJgSMczU8PPV+kwHS82uwtf+t3zIuGWzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d1DBG15Qs677IqV1qKCXQt1NSsOYDVjlbEUzBHqWXEY=;
	b=s1KzTopIrKnuaITqu80wCCsnySIGy/AWO6AJ1tppeHxO2S3+LV2ARQ5jqhX4bkS60PMD
	 r7E4T3gAlogCzPSdU/VVa8iwQOk0q4qiABCHIW0d6fYXTdINyCE8c9AfH+ORGhlrUaI1Q
	 R33SXuLrJuW+51k7ptvixHsut9nEdzXrCS4gIgK3LHW9oIVCfy90fCWZJXmSgISgoHX7y
	 0e2L25vzCQGvezrHthYWyx291Yg7ZAILARrw/OxP1CU0shp+lJiOhxr78wW2tnnTRTs1d
	 GcyWEBtDtBBBpUtSs40GHUJQD8CrVgfxkLP1OYRTj1QVIZzogaQz5wW5l5dLp8m5E7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvZ+cmBd;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C9D606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94C9D606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fvZ+cmBd
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-353804b591eso3792886eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793891814; x=1794496614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d1DBG15Qs677IqV1qKCXQt1NSsOYDVjlbEUzBHqWXEY=;
        b=fvZ+cmBdmC87qpW5m5qCIIUpSoJ4VzUCW6AloefJYZFgBVngGXLgK1+mRPhi+XN8Xb
         4JVQnTmOOay5FCdPife/oOhKv2QR1w9MjuE4obKVnkcJoI8+o80E2d+ZK3msyyumremi
         snegt0mUU8p3z1SOCth0R5tJKk+SrTiPWkjxvJUoZdDLadbOljnyO7kAd4O2k7xrIMaE
         stV77oMB1QviJUMRR809xbdT6BidVXOlW3/MKsgTXqF5ZLRiBJVy1TCTaQhUUOQ8HEkn
         n+eBxsySN5Tla/QBOnMn1Ay0isU1OdMKu+3mOf9yNZZcQRiHrwT5CyJbwfO3TbIFbI1M
         m4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793891814; x=1794496614;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d1DBG15Qs677IqV1qKCXQt1NSsOYDVjlbEUzBHqWXEY=;
        b=Ahwor0+ZJngUv4WSuyQXx8RjCe86xtCku9Myow5FUZPTprfIoxPdzE3Ldz63Ist8KN
         yztQ/7Ifbzl7z099xV3i5akepdDJ4F6RxmbJkK6B1EA0JwOZL67AqEWk3zSCCeyEb749
         YBjSPDWiQtdJh9zefrpXxREwq5866DUNwVMpIs5w1hV9MHyYnb3eWCPfBbZDDSMBAwPi
         ucD10uaqahC+X1tPFtAet53CrH3oSNB5rZZFHEzwC4qXCtqbUCpWc+jZG/UB8j5dyuHu
         M6m1E3MqheUgtpnLsGcNG0OGfPJ8i9K9Ueh6hSim2E/ojcsFN4chJMOr+SQL372Vt659
         h8lA==
X-Forwarded-Encrypted: i=1; AKwUvBy64p+gh6Ohw+Cv6xGWzrEK+VLyKN6MAjsGj77T7oA1YQPHIRc6eKVJOWeQazampfagQPheUMjhQ2e1eUY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1o3D+wTRfNmpBxSAHod5pt2fNywJuH6EFOXEzr8LCWEfGlJPk
	3vbDEltrhmfxao6SX/3B6IaTLilj3bCdMzY8GbEjVyyXbH7Bdq3f3+YD53D8dUPL4QM=
X-Gm-Gg: AYBFou3O/uHz95tKZoZjmHfMCFz4MmmQWW6x4/Om40FcvhaVhNXItge/1XyrgZAFKSA
	xThrwEMBQc0x6y33XXs/ihkexWWMMcfz736zNkxUyUcusbdgsRch3hlxqA3+ZrRKBO1bss2oBRP
	QI6gGTEBIbQnswImoRtSWoyJ9U0MBK1ueMHfzWynAC/gM6MRoopYrRk8TjeTtK75gNrmE6c5+ce
	ArbV4OmskVPFjE10WKRH0wbLmEQOn70SAWMpMThoiw1bJcsViRKZQXb3kQVbH3HZEiWMkTC69JT
	SwdsjPPkEcj8ru0T6rjEjJlqSt4U4fPOPfmQW/K7Kpku2v5Fawnw2B6ljidUXOLVi3VCUeAIzK/
	7wOS+C5Vth3r7yx5mkcYguK0jJwfT5GoKE2UBD7VkTsu7deStRuT9s6+9tU9ARUd2aR9jDI1lTG
	lkafz9ca3pFTOyd67stUWB9rrlhZlv0w6laLSCWq+LroZeEYax4uHbkfTklY4g/ePgbIOlRZ1SV
	6WhhgYgrM+/cHHSJLB+BVy2dOR0DLXdMiMLCMciHZj63ST5ntMLOl/orjyrWb+9dCIPIlizvSCQ
	XuLGY/gaEHQdK5cWJlm3sROO8CRged45Lj61utCCQTk0gZnq+RenyGrdPx/wV9420rMJR31Nd4+
	xEm3hbSLaCfPNojUeGKhQfAYC2YLKs21fEnz6NqXujw+EuVlC
X-Received: by 2002:a05:693c:630c:b0:36c:a360:9c42 with SMTP id 5a478bee46e88-36ca360cda7mr9483693eec.31.1793891813414;
        Thu, 05 Nov 2026 07:16:53 -0800 (PST)
Received: from cachyos (2a01cb0c82caf900a186612f304bfea5.ipv6.abo.wanadoo.fr. [2a01:cb0c:82ca:f900:a186:612f:304b:fea5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm21567087eec.7.2026.11.05.07.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:16:52 -0800 (PST)
From: =?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Isma=C3=AFl=20Bahloul?= <i.bahloul01@gmail.com>,
	David Fredman <davfre@gmail.com>
Subject: [PATCH v8 5/8] ALSA: usb: babyfacepro: add S3 suspend/resume
Date: Thu,  5 Nov 2026 16:15:50 +0100
Message-ID: <20261105151553.223722-6-i.bahloul01@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105151553.223722-1-i.bahloul01@gmail.com>
References: <20261105151553.223722-1-i.bahloul01@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The device loses its registers across a system suspend.  On suspend,
let the PCM core suspend the substreams (applications get -ESTRPIPE and
restart), then kill the session's URBs before cancelling the stream
work their handlers queue.  On resume, re-run the cold init and replay
the cached mixer state and flags.  A resume that follows a device reset
goes through reset_resume instead of a re-probe, so the cached state is
replayed in place.

USB autosuspend stays disabled: nothing in the driver holds a PM
reference while streaming.

Co-developed-by: David Fredman <davfre@gmail.com>
Signed-off-by: David Fredman <davfre@gmail.com>
Signed-off-by: Ismaïl Bahloul <i.bahloul01@gmail.com>
---
 sound/usb/babyfacepro/babyfacepro.c | 89 ++++++++++++++++++++++++++---
 sound/usb/babyfacepro/babyfacepro.h |  4 +-
 2 files changed, 82 insertions(+), 11 deletions(-)

diff --git a/sound/usb/babyfacepro/babyfacepro.c b/sound/usb/babyfacepro/babyfacepro.c
index 12cfd7fea..06ef1a97d 100644
--- a/sound/usb/babyfacepro/babyfacepro.c
+++ b/sound/usb/babyfacepro/babyfacepro.c
@@ -3,7 +3,8 @@
  * RME Babyface Pro / Pro FS - proprietary-mode USB audio driver
  *
  * Core driver: USB vendor requests + cold init, interrupt-URB PCM
- * streaming, and the card lifecycle (probe/disconnect/module entry).
+ * streaming, the mixer-state replay after a resume, and
+ * the card lifecycle (probe/disconnect/PM/module entry).
  *
  * See babyfacepro.h for the shared device state and register map,
  * and babyfacepro-ctl.c for the ALSA control surface.
@@ -198,9 +199,9 @@ int bf_pitch_write(struct snd_usb_babyface *chip, int pitch)
 }
 
 /* The cold-start init (cap_coldplug.pcap), verbatim from the user-space
- * reference (protocol::streaming_init).  Run at probe, where the
- * device state is unknown; a session start does not need it (see
- * babyface_stream_start()).
+ * reference (protocol::streaming_init).  Run at probe and after resume,
+ * where the device state is unknown; a session start does not need it
+ * (see babyface_stream_start()).
  */
 int bf_cold_init(struct snd_usb_babyface *chip)
 {
@@ -267,8 +268,17 @@ int bf_cold_init(struct snd_usb_babyface *chip)
 	return 0;
 }
 
-/* Re-apply the whole cached mixer state to the device, whose registers
- * the cold init cleared.  Caller holds chip->mutex.
+/* Units probed since the module was loaded.
+ * The SELECT selection is not in the readback, and the values alsactl
+ * restores right after a probe are the ones of the last alsactl store.
+ * After a boot that is the last shutdown, the newest there is.  A later
+ * probe of the same unit (a usbfs claim released, an unbind, a replug)
+ * may follow SELECT presses made since, so bf_panel_select_put() needs
+ * to tell the two apart.
+ */
+/* Re-apply the whole cached mixer state after a resume (the device
+ * lost its registers across a system suspend - TotalMix does the same
+ * re-apply).  Caller holds chip->mutex.
  */
 int babyface_restore_state(struct snd_usb_babyface *chip)
 {
@@ -797,8 +807,9 @@ static int babyface_stream_start(struct snd_usb_babyface *chip)
 	/* A session start is what the RME Windows driver sends
 	 * (cap_audio): the trigger pair, the URBs, the arm.  The device
 	 * keeps its mixer state between sessions, so nothing is cleared
-	 * or re-applied here; the cold init runs at probe only.  The rate
-	 * is written first: hw_params only re-points the speed multiplier.
+	 * or re-applied here; the cold init runs at probe and resume
+	 * only.  The rate is written first: hw_params only re-points the
+	 * speed multiplier.
 	 */
 	ret = bf_clock_write(chip);
 	if (ret < 0)
@@ -1497,7 +1508,8 @@ static int babyface_probe(struct usb_interface *intf,
 	chip->card = card;
 
 	chip->dev = usb_get_dev(dev);
-	/* USB autosuspend is untested: nothing in this driver holds a PM
+	/* USB autosuspend is untested: babyface_suspend()/_resume() don't
+	 * check PMSG_IS_AUTO, and nothing in this driver holds a PM
 	 * reference while streaming, so an autosuspend request could race
 	 * a live stream.  Disable it explicitly rather than ship an
 	 * untested code path - full autosuspend support (correct
@@ -1752,6 +1764,62 @@ static void babyface_disconnect(struct usb_interface *intf)
 	snd_card_free_when_closed(chip->card);
 }
 
+static int babyface_suspend(struct usb_interface *intf, pm_message_t message)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+
+	struct snd_device *sdev;
+
+	if (!chip)
+		return 0;
+	list_for_each_entry(sdev, &chip->card->devices, list) {
+		if (sdev->type == SNDRV_DEV_PCM)
+			snd_pcm_suspend_all(sdev->device_data);
+	}
+	/* The URB handlers queue the work: kill them first. */
+	scoped_guard(mutex, &chip->mutex) {
+		if (chip->streaming)
+			babyface_stream_kill(chip);
+	}
+	cancel_work_sync(&chip->stream_work);
+	return 0;
+}
+
+static int babyface_resume(struct usb_interface *intf)
+{
+	struct snd_usb_babyface *chip = usb_get_intfdata(intf);
+	int err;
+
+	if (!chip)
+		return 0;
+
+	/* The device lost its state across the suspend; re-run the cold
+	 * init and re-apply the cached mixer state.  Suspended PCM
+	 * substreams are woken by the core - apps get -ESTRPIPE and
+	 * restart (prepare starts a new session).
+	 *
+	 * This is also the reset_resume handler.  Some hosts reset the
+	 * device on resume; that needs nothing more than the cold init
+	 * already does here, and without the handler the USB core unbinds
+	 * and re-probes the driver instead: the card goes away, open PCMs
+	 * fail, and udev's alsactl restore then loads the mixer state
+	 * stored at the last shutdown over the current one.
+	 */
+	guard(mutex)(&chip->mutex);
+	err = usb_set_interface(chip->dev, BF_IFACE, chip->alt);
+	if (err < 0)
+		return err;
+	err = bf_cold_init(chip);
+	if (err < 0)
+		return err;
+	err = babyface_restore_state(chip);
+	if (err < 0)
+		return err;
+	err = bf_state_apply_flags(chip);
+
+	return err;
+}
+
 static const struct usb_device_id babyface_ids[] = {
 	{ USB_DEVICE(USB_VENDOR_RME, USB_PRODUCT_BABYFACE_PRO_FS) },
 	{ }
@@ -1762,6 +1830,9 @@ static struct usb_driver babyface_driver = {
 	.name = "snd-usb-babyface-pro",
 	.probe = babyface_probe,
 	.disconnect = babyface_disconnect,
+	.suspend = babyface_suspend,
+	.resume = babyface_resume,
+	.reset_resume = babyface_resume,
 	.id_table = babyface_ids,
 };
 
diff --git a/sound/usb/babyfacepro/babyfacepro.h b/sound/usb/babyfacepro/babyfacepro.h
index 1d4c358d9..a32849f83 100644
--- a/sound/usb/babyfacepro/babyfacepro.h
+++ b/sound/usb/babyfacepro/babyfacepro.h
@@ -12,7 +12,7 @@
  * snd-usb-audio quirk.
  *
  * babyfacepro.c holds the card lifecycle, the PCM stream and the
- * mixer-state persistence across re-probes;
+ * mixer-state persistence across re-probes and resume;
  * babyfacepro-ctl.c holds the ALSA control surface - the hardware
  * mixer.
  *
@@ -386,7 +386,7 @@ void babyface_pcm_stop_both(struct snd_usb_babyface *chip, snd_pcm_state_t state
 void babyface_stream_work(struct work_struct *work);
 extern const struct snd_pcm_hw_constraint_list bf_rates_constraint;
 
-/* Mixer-state persistence across interface re-probes. */
+/* Mixer-state persistence across interface re-probes/resume. */
 int babyface_restore_state(struct snd_usb_babyface *chip);
 int bf_state_apply_flags(struct snd_usb_babyface *chip);
 
-- 
2.56.0

