Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483065;
	b=lWa0Ygjnf12b5XM9mFYyrd6V9heAQire+O/xfzXjIc2lx7Bwh78urqNxGzcDJ7WjQJ6j
	 ulailA83h+/YWwouU/LnIEAq0U5iiuXG0Trg9tAjChMvMO/r84wdETcTfwLQ9Tm7De0Tz
	 HTqhHfWCQphQqxJgKoyO6sbsPWaY41ZHCXy7lyHlTSXutMXISXEPIsNVPRos25ZuYfHCr
	 ry1CNEgcTx+EhSeWgvVFD/oyIyZBBQ4iQdjbvHBztJiE/k+G6fnegU3PLIdfWXMZ7XBq/
	 0yGh9xnerEmqSm9w5PZTc79Oki3z/egn7f6TGaNK8HyaTsydU7vCtcVK/GtqeF8VmVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9l9JrxrF8l+mOniUL6DS7aawaMxPEmoUUwIsn8MZ6Bk=;
	b=1sUw6+k7PRfrTlSZsAH1gyZxaOEjWkJsQai6JBRrLJDITs6ZDxWeznG9pJg1TKT6QOcF
	 zgcx6GtXG/faVTRcbqIh88AHRnjQ1HHwb+PTKjMG5aOHKnPk3Ic/JDHxsN3byImiJX9UQ
	 Pm1KLI2mZyj2AHbP6MNvP4l1uNM2FfbqmxClBHVVeLqOTFsf4ZrNeUOyMUKs0YeSR+5jx
	 3GwWcCUQsWWPOMohXwiYMA+RIgkB35zUlJmyrwRGE9LM+fums8u/7dKuY6+xxOsfrnDme
	 1eD2opjhqF+KAd+VbyK5jTI2GoDUrbKKnJPg9MoM97zJlJMQZlRuT6DPf7PI2J1muhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlQvZ1H1;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AB4606A888
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1AB4606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LlQvZ1H1
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c506094fd93so378563566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 03:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483063; x=1795087863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9l9JrxrF8l+mOniUL6DS7aawaMxPEmoUUwIsn8MZ6Bk=;
        b=LlQvZ1H147PHodwTS5Gxx5lddD9zz3BsqMsGx8zl7w7Mb7v72RbAkGkS8LLmK4fc9/
         qxJEw7AYY0KkbJzeMrg9tV/oRwVR1qqK41YqNndC7QSLz07IjBvCoY7IvMznd6iCtSVE
         iieVbwpGTWTkd/qk/aPlHWSpwCEPpt57nwzZ6HWIhjnvm8dO8DBk0dYuSBHD15sxnH+2
         /x+evw1wa4y6vY6i/RGwiT1AvBmcuVWpFy84qb+EKNH2uLzgDn4HFrM2GZLGdvgZcsOc
         tvl1yWeBb7RnCwj/Gz72AQSGrvWm5ud0S94EmW/2rMBh47JYPBCV5/PTTyztDwhhvbwk
         fhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483063; x=1795087863;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l9JrxrF8l+mOniUL6DS7aawaMxPEmoUUwIsn8MZ6Bk=;
        b=yBZ5VWL4Oc4TUx31TTX5trno0/UC1bzwztdu6P28wSoJDg6moBCDc+oQs3NyxRZajd
         ikt7RiPWaM51jMXzqooRVRR1gw2Lx9dni40LwiRFbYn66e8T0WDWEOjYG219GGQsq6k/
         tg1QTVpnv1JxlEhhL43w9MVMdnI12JKkHuGCYYlzW/0buj/RtmprgKtDVCvNgfOuP2Lj
         1Jhohv4J6XXqx11Sc4XUTgfSiKuFASYY6NRfLRpScVfPfBryGw3fXu01zs/z/Rf8UDnt
         TDKu8IaguIXImAg9kdIecc5A8TlS3ijn7bRMI1ciqeBVLEUD9eFhJvZWk7u8jkNGL8lH
         uZew==
X-Forwarded-Encrypted: i=1; AL+hErHvUjmazLmyKj61uP+91XBkXKw2LhJvpUkXl/QfrJ39SnglnzLZrbY1GWZq3C25G2Q92YHKiBURrlDtmPI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yRSoY6W8uWRABw1+KofkUTDkYCtni919C8a2rqdZBjIAvslCd
	dbkPQpEmdMc/+VBcU9LmF29upOKBp7r7LLeh6rkzb5w1C5ox0k7hbfkl
X-Gm-Gg: AYBFou110YmqsRD8+KajcqRLtrMTjRJx7ZNgNTkwdnmuXh6kVXbKgFG6HzPtHJH7VlY
	q2wIfpa3z7YgFO5aaJ5iGelOxEC5U4r7ckX4iCRTWHzjVRWFDQOgEDgmUG0IDmsXLS8HW5kvr8L
	ub1tKWSf1K7poSmgYIO1X/BCUhIjYJAUUKdYWZoDk0vmAm0dYFEr8frtrQnBgaYj/6Hezoa/l+x
	kTXsYugMdTtW/21tz4eHcFydzpo038uPjjP92QaLc3EVZSCHr/shSjiJEnlCxet1A/DN9bbg7rI
	Pu1OpdZzaIL/7h9aRui1g0w1X+cCGUrHpeuV1kMUFfKMAsLD5jGkYpslmognUB0W60Yde+6BT2p
	aPQD0+WfyPTFR5SnzhbKX9JmoTW5KcPLEVfbNT0+h0TDBVzRDC8dRIMlRHgU3B8+31W2cmGxu7X
	wp0RCZmpyv4ZmmDMuoIuqHkhzdEmrXsShFic0cUIMy5wuowSa7G4bM02K/Ge2Lkw+mFb17K6gTM
	zZjGixnSXtKyLFrdXZVbxKji23NLDF07v4KmbIXgBPcGFE/tp1GSz6j5cr6Xi/sj5XRJmSqZTTr
	WtidiQUA+NuP0ae82YE3WgbawF7zc2kQilH2s+e6ASh3CQRrwrYeP34TLUG0iuA2iQvIgXM1qOt
	KPIBv9lcrDl1qzd6p6x3uJDUa5ERtA0oS5RbAmV4NLNuGMA==
X-Received: by 2002:a17:907:1b1d:b0:c4d:31c5:e30 with SMTP id a640c23a62f3a-c5066d3db13mr401955866b.49.1794483062958;
        Thu, 12 Nov 2026 03:31:02 -0800 (PST)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a618abesm326514666b.50.2026.11.12.03.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:31:02 -0800 (PST)
From: Jacob Procee <sn125164@gmail.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Jacob Procee <sn125164@gmail.com>
Subject: [PATCH] usb: typec: tipd: cd321x: replay the plug on resume
Date: Thu, 12 Nov 2026 12:30:05 +0100
Message-ID: <20261112113005.16418-1-sn125164@gmail.com>
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
safe, mux back to the partner's mode, role back on). Queue it on
system_freezable_wq so it runs only after all devices have resumed.

Tested on a 14" MacBook Pro (M1 Pro, j314s) with a backport of this
change to the Asahi 7.3.3 kernel: a USB-C security key left plugged in
re-enumerates right after "PM: suspend exit", where it previously stayed
gone until replugged. Unplugging the device while the system is asleep
also works: after resume the role goes to none, nothing is brought back
up, and replugging it later enumerates normally. This mainline version
was build-tested only (W=1, checkpatch --strict clean).

Fixes: 82432bbfb9e8 ("usb: typec: tipd: Handle mode transitions for CD321x")
Assisted-by: LLM
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
checkpatch flags the Assisted-by tag (non-standard signature, 'LLM' is
not an email address); the format follows
Documentation/process/coding-assistants.rst.

 drivers/usb/typec/tipd/core.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 02539378ffed..2ec380124532 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -164,6 +164,7 @@ struct tipd_data {
 	bool (*read_power_status)(struct tps6598x *tps);
 	int (*reset)(struct tps6598x *tps);
 	int (*connect)(struct tps6598x *tps, u32 status);
+	void (*resume)(struct tps6598x *tps);
 };
 
 struct tps6598x {
@@ -911,6 +912,21 @@ static int cd321x_connect(struct tps6598x *tps, u32 status)
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
@@ -2014,6 +2030,9 @@ static int __maybe_unused tps6598x_resume(struct device *dev)
 		queue_delayed_work(system_power_efficient_wq, &tps->wq_poll,
 				   msecs_to_jiffies(POLL_INTERVAL));
 
+	if (tps->data->resume)
+		tps->data->resume(tps);
+
 	return 0;
 }
 
@@ -2040,6 +2059,7 @@ static const struct tipd_data cd321x_data = {
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 	.connect = cd321x_connect,
+	.resume = cd321x_resume,
 };
 
 static const struct tipd_data tps6598x_data = {
-- 
2.56.0

