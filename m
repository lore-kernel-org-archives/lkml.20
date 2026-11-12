Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794486526;
	b=Q2pVPA4MPXXrnP06XOKymLuL/2G7F8xaRjvez7qmCkgHVQgQ3SPgahJhaLHXo5h3NP9U
	 7dHdt1WrnrIZG3PNvnELIhNSOeAxLULIg2QhR24NV+vsiKZ/QOJJUsSNKSWcfpyL7No5X
	 J8RI/SMmN4G8y86e1C5OBzcoJ7JQc3XvMbU3s0BrBmaxNy0q8UuOCTN6UsSaVs3MZ5NXu
	 mRy45bcqn9hE8RLeuu11dYVR4/5ozTRg1cope1IXoX9ovtMW8gbIW3HpeEroczZSJruZc
	 JSiDfCPqJwu7i7w8ZqDFE++artb3e0JFO9s+YTE7iFh9PNvNsliRfMDVUuHqh6aI9wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794486526;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XiwXT+3Y9hXTo4i+ayzyhU8nxlqPVZveP6KcvRhcgU4=;
	b=tCiuZajHDeLjzCccHWcPxOoZ9p2YaxLJBEXuPnhGZ1EqWo8uwT/WD/eZ5yxZVNQ9fstF
	 NKQX0N0dMbyxGS/Jl+7Uya6/z8MzMp3XEQFJsh3gvHoG28uxy56GdtReO0fsncb7u7lBX
	 T0BJb4QeC1/idxAKLvVI9lIzS99Dk4dblKLMV5WXIacQT1NQXbs9O6JDSAMEIsXnw6B66
	 kliwp8WuDm3W+dtO6HoBorEym0RYUuFeDWw0CbbwWxH3uSo43BaY2pfUmsQvDJV5/3RLf
	 jG736+93Sh0bvrPLnJSG5i/2k6nqV+tQDGGl4qHVVgDxa2nuOsvDdOMJ2TURIdG7Wzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUd91pfD;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C29F606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 12:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C29F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kUd91pfD
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d21051042so651704866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794486524; x=1795091324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XiwXT+3Y9hXTo4i+ayzyhU8nxlqPVZveP6KcvRhcgU4=;
        b=kUd91pfDR9mi1xyKzYpwMRjel+vZ43RBKfzFybKhJO6J0pdM7Rg7gpNacgX3+SMjCB
         6vgUpZQ39ZVCx9idhaP0Pw6E1ojHnrXpXmbWhgFc5uUgM3Ly7spyV4NaHsuh5PGXBO/y
         JDQXIPBoCxwtNlMigdPux8V2JfhUmKjfZiAH+ji3ZUT2abNYYM8L/lglN3Ruf0WwcNGF
         7nSDBu+H2rZ7T4KgO/2XUd6IqicqEJ9sqYlDmP6gPaS62FFG680npAPNP424GpmT88VC
         rhfAKGVUn25rncV0ee8FGJrAxQGJXXKcrmiEcYxcqZYg+NxdRo5O/IlH6g1KRImcSMIu
         wQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794486524; x=1795091324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiwXT+3Y9hXTo4i+ayzyhU8nxlqPVZveP6KcvRhcgU4=;
        b=zQP6YvEmRWb3U4TRNwb1hv3AEO/bfQ+Wh6FO0qXf99RTFrNTHArF3BgT4jYqFup7CO
         rKNxqyi1ZopBTaSFZBqLq4QXmRy5h62V2fc5g27pEFGMzHiun9BhnkTuSra9wQ4i8o2E
         8I27AUF0cwK1JuqbSdeleoGxmwHLo097C6hYQ/M22zsWLpF8ioZJYp56+uKGrPfpgKLu
         Sl8LNiMPRo1NlZxWzkrAaJeF74H3CAOQ5kdRKcZaYGLVnNQaiMqTVKqJaB4CkONt4vC+
         O/76rMgqNAY2fBf4w/ZfbPV1IeswbhKjxkHPW969A9GkwW9IAV8dyZhSfPx6I0hdJ+uX
         DmfQ==
X-Forwarded-Encrypted: i=1; AL+hErF96+rfKb9M3EorHowpZSpEmf1ydRAmgHaHzvJCyrL7dUq8h2gg06Z0OpV94L8we4faLvIh8xX4zfIffRw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/rXiUFZd2n8c/as5K8j1VvPIiWu04/8Set+rB25thvDanEXMOe
	OajYklZMUMFHJms2RsYa3OnopAhv8cLUdXslu3AiOHR7+0DjgOrX568E
X-Gm-Gg: AYBFou0+zSKnVYrFrg4bXQOq2s+gyS76ansLy5p5BogFRhMIsUQdTCfiY8Sk8U0HIjr
	0zcwS8Dlc80o6v6GNJvHxAT1R0xzf76m3EkBwjGt7BVnsh8v6F/s66gzMfyg9rlOacWn8Y9oGBo
	dBQSupZ97wQZLSEHbIgi1FKzrPpQB7q9683iPUJblPzMVNM7NTMqc/yb+XcMCG0h/g+IVrHKmOH
	PVnqZk2WsURn2ZqxBb1dU0eJjfe8aX7uAgS0Q09szs8AwVQp+LxWcCd6uk2EftYWMvCMnIJ+/TP
	cJ7S4/HRsXtZ6NgYYlzpmerR3MFw+dnd+gNmFw1nSjuUm2MnaGjbP3BBrFC0zDXGsfRQ86X089o
	mAVTL+lmNmFA+7xsduzhL+jli7fOTSybd6LOLP4Jo8fFFIl+pSoJsLzwx8g+9+nZKTELP8Dr8CP
	gO7PwnvL+puWoBpj6nigbsFT9iv+3A+ItLDnn/Df57BMZIPuhbgjy/4LEk35T4U8F5wGCqMnd/A
	vgc6SyS0dC9QcfpD6XI20CzONhRelN4gNVXZOoGPH/P8sOLlYqkHtQYT+9s1lsBa9WDdJ4CNLae
	vvWEHkvzA7ChEc5vslsKPAgRbrClLjliP9z598A5yTkrFsHr7tlx6aSv0tCVTBPezz4dgLhiAbT
	IEPGA1tJJx2oWUuax3pE7TvdpuwF0Cky1Nurr5diHqa4Nu/alZmSAoPw0zGn6/dfMylg=
X-Received: by 2002:a17:906:794c:b0:c49:df95:fd0 with SMTP id a640c23a62f3a-c5066d3d0c8mr439976966b.48.1794486523598;
        Thu, 12 Nov 2026 04:28:43 -0800 (PST)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a683d72sm332400566b.81.2026.11.12.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:28:43 -0800 (PST)
From: Jacob Procee <sn125164@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Jacob Procee <sn125164@gmail.com>
Subject: [PATCH v2] usb: typec: tipd: cd321x: replay the plug on resume
Date: Thu, 12 Nov 2026 13:28:25 +0100
Message-ID: <20261112122825.7730-1-sn125164@gmail.com>
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

On Apple Silicon the Type-C PHY and the dwc3 controller behind a CD321x
port lose their state during s2idle while the plug stays connected, and
the CD321x does not raise an interrupt on resume. xhci notices the lost
state and re-initializes the host controller:

  xhci-hcd xhci-hcd.0.auto: xHC error in resume, USBSTS 0x401, Reinit
  usb usb1: root hub lost power or was reset
  usb 1-1: USB disconnect, device number 2

but the PHY is only ever programmed from typec_mux_set(), so a device
left plugged in (here a FIDO2 security key) never comes back until it is
unplugged and plugged in again.

Re-initializing only dwc3 after resume does not work: tearing dwc3 down
also powers off the PHY, and nothing turns it back on, so xhci then
times out ("Host halt failed, -110", "can't setup: -110").

Instead, make cd321x replay the plug on resume when a partner was
connected: mark the plug as changed and queue the update work, which
then goes through the same sequence as a real replug (role none, mux
safe, mux back to the partner's mode, role back on). Queue the update
work on system_freezable_wq, from the interrupt path as well, so that no
update runs before all devices have resumed and the work item is only
ever queued on one workqueue.

Tested on a 14" MacBook Pro (M1 Pro, j314s) with a backport of this
change to the Asahi 7.3.3 kernel: a USB-C security key left plugged in
re-enumerates right after "PM: suspend exit", where it previously stayed
gone until replugged. Unplugging the device while the system is asleep
also works: after resume the role goes to none, nothing is brought back
up, and replugging it later enumerates normally. Booting with the key
plugged in and replugging it while awake also still work. This mainline
version was build-tested only (W=1, checkpatch --strict clean).

Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
Assisted-by: LLM
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
Changes in v2:
- Queue update_work on system_freezable_wq from cd321x_connect() too, so
  an interrupt during resume (or a run still pending from before suspend)
  can't run the update before all devices have resumed, and the work item
  is no longer queued on two workqueues (sashiko-bot review).
- Retested on hardware: key left plugged in across suspend, key pulled
  while asleep and replugged, replug while awake, boot with the key in.
- Link to v1: https://lore.kernel.org/r/20261112113005.16418-1-sn125164@gmail.com

The pre-existing tps6598x_resume() issue sashiko-bot also pointed out
(I2C access before the reset GPIO is released) is not touched here: none
of the CD321x on this machine has a reset GPIO, so I can't test a fix.

 drivers/usb/typec/tipd/core.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 02539378ffed..bf2b08a5fad7 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -164,6 +164,7 @@ struct tipd_data {
 	bool (*read_power_status)(struct tps6598x *tps);
 	int (*reset)(struct tps6598x *tps);
 	int (*connect)(struct tps6598x *tps, u32 status);
+	void (*resume)(struct tps6598x *tps);
 };
 
 struct tps6598x {
@@ -906,11 +907,27 @@ static int cd321x_connect(struct tps6598x *tps, u32 status)
 	 * its last run anyway.
 	 */
 	cancel_delayed_work(&cd321x->update_work);
-	schedule_delayed_work(&cd321x->update_work, msecs_to_jiffies(CD321X_DEBOUNCE_DELAY_MS));
+	queue_delayed_work(system_freezable_wq, &cd321x->update_work,
+			   msecs_to_jiffies(CD321X_DEBOUNCE_DELAY_MS));
 
 	return 0;
 }
 
+static void cd321x_resume(struct tps6598x *tps)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+
+	guard(mutex)(&tps->lock);
+
+	if (IS_ERR_OR_NULL(tps->partner))
+		return;
+
+	cd321x->update_status.status_changed |= TPS_STATUS_PLUG_PRESENT;
+	cancel_delayed_work(&cd321x->update_work);
+	queue_delayed_work(system_freezable_wq, &cd321x->update_work,
+			   msecs_to_jiffies(CD321X_DEBOUNCE_DELAY_MS));
+}
+
 static irqreturn_t cd321x_interrupt(int irq, void *data)
 {
 	struct tps6598x *tps = data;
@@ -2014,6 +2031,9 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
 
+	if (tps->data->resume)
+		tps->data->resume(tps);
+
 	return 0;
 }
 
@@ -2040,6 +2060,7 @@ static const struct tipd_data cd321x_data = {
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 	.connect = cd321x_connect,
+	.resume = cd321x_resume,
 };
 
 static const struct tipd_data tps6598x_data = {
-- 
2.56.0

