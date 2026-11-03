Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793672185;
	b=uZudhIAvBVC3Z0B3nLElaOXtl+F8bLSU7dqkInY0xvKvH0m9H1XU3yLY/i4KlpIlGquu
	 RM1qtFvbsiEz2Gn/cQHeLsVzY8bqlN6r9gnulRg3l0cFJTaFvMF5L9dWlVjvpelTpNk8+
	 mYnr3IdBbUBtcywV3+spIari8hXk5n8qAHg9r+LFYwtd9nB+Rm3JM/xLMvfnRv/df3I6b
	 /X+1wBRDAAx77UCYQjpodQMCU9NvxJVs6b9r4jURAZvbavT95gJGb6L1+O+L9dqgF7NjD
	 uI8EFOff2ZU5Rnberh5XOZwlcxV7IeI3fJBUKFla5mfMRadh9wUtrxAvIR+0pjYSW0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793672185;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ijy+SvooTNfvUUWkqdlHKvzcvEOeijQKYcYXR4SWdu4=;
	b=0uPqEkXGAVh8iqj3X3sJiWfwhMtNzYpz7w8LtzOZuPbbY1/KNidWXhc+iNSTJlVmXINx
	 OGaytVSPvSbhD+cexDtOdgV4GJCXNOMiwbfvHm2N3hCppt3aK+GYoBpP1WSSGSvjkbBZB
	 1bp7K6JkOoc+xBl6pWb1QFmRr+sbTbilDDRbpexNHMmQ0YLIitw4aavCahklB6r9xr/iM
	 H4XIdEmQUqKEtdk4tCAEok+FNxmN/dUWvSi0feyj35bfiWl8LkPSBAHUMqSYvcwMBtrbA
	 atQiNzmc/ePVyyRoWtikUm+yB0w7OxBgTXrtNX5plgqEVtw6h5D4x7n2TcyTV+Z2d6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGOj5sbB;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC84A606A327
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC84A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGOj5sbB
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1851263a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793672184; x=1794276984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ijy+SvooTNfvUUWkqdlHKvzcvEOeijQKYcYXR4SWdu4=;
        b=AGOj5sbBwSmeOGTWRLLYfsv2KhP/qZH6Rk6fKKPTS1yUxqDFqIwrtvkBMTGLHW/9xG
         NzBZF23UpXHTMzoeAE/uSfOMF7ttZ6O4InHW0GStMHDnz/ShQ8bJRWX1IvBLSZfiI/km
         +YFthwWqDUOqwwh439Y3llGU/rnR/TtbXCxZ0Y1gQm2irdWkHmhl7ctgLAHOkWAS0YBm
         FaoUIKGk1EWqarDd4mbjAHVncbAcKjDW9KvR3ZgS3VDJY3+jt6q/krg0HyzLz9kBd+Yt
         vJIEXk//AfUnpLu2CcauUySKiUjeFrIb1u4CEAhj+ynNY2W9eZ8A+xRqCcLhEgm4Z+Qe
         +dYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793672184; x=1794276984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ijy+SvooTNfvUUWkqdlHKvzcvEOeijQKYcYXR4SWdu4=;
        b=sUXJs3ex2S4sSdVeBd//ub0Dqw0bCdEDAE5xcrlp+exHjGAvk/grjuyGjw7IiRVoBW
         yObpGLcOBcygRq5T7eniYq3DZWxpLFPlo3taYyV8x46Haa1Bi7yyFjJLuKfUUStYNJ6E
         YCL26NnDiy/xUbDOpFNC5W47g7+a2/AGJQoV6T1/7Wpk49zNGdQqPVZKlZnTBD2VlBHK
         TT/GNssnvA2CHMmZo7u4VwK6IWefJ+S2NQ17C2VcI1yXd5jhrUvtknzq83renbqZQ1Wk
         b/I8Fk9FUAKAFj34stSvz5xEs5cndZxNtuZfPhl1A9IifEPjbYUamV1F99XslKFblBDn
         3HWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGEU2fXSiYmWkpSo2w42jybr9J7YLlCP039fM09+JDRcn2Vij12z804CBxTIZuJLVv4KgcNWj/LFdmphg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKuJkWq7mJqc/XnHdOoNusMqecgM6/Y9N8nl3z6hECybF1sjl
	5JVu70gZj67hrlmVLpsfCBjTBNmBgi9kZ2Mxw9dkVYOPdGVcc4p2kUN4
X-Gm-Gg: AYBFou2g3vKNrcim9ATbIaTVozwvytxulz2e8Oo5j0854lVt7zVezqIy2hqlg7Smd5u
	1T7sDblCBcd95lRWQPBu16XyE+X9ebTWQSTflwOvSSS51VgBGk4m0uin0KWi3OnnoXz3FdeZ5jZ
	St7TCmzBNQGTUc+oASDCdDSG3VWAHa17U/cx1aE2thw4rnUygzJK0NgFw4g87d0wbSedOiwgZoN
	Ev8wzBIkkSI/W7eOhM4ViVwtZK2i0gnjRdTXvJGOimL40HceiErFojaWLLCNsam/rZwJLM/1+Jr
	EXQfRDADTuCPu8sUNci2fltCwvHc45r989WcoWyss3XI8/ya5TFCCl+pVMDXh1CTTeZOGzhNyCa
	YuL+g13XULfJkSDl7vOfyaOOuVCgXzRMqh7lYUBCjqbUgtstKrNVrLd6yU1M9UcHq/H9Z+66cHL
	Wyj5DVQrz4eRd0E9XXJiZ7qNdjs1Lklf1R8Fjzk9GUCl/w0toxOiVQM+ayYyJ1fPpR+5GqROqHU
	HlgAneS3fB3OG5urmb8xkLPjFUq6aWFqo2DFQ/itXuPQZbiAnqvO3h/jeH08kxc625US2eyYA+T
	IMlj+l1cWyrYwWrId45CRy64TSy/0NUNUH+22/mdzO9hFg4dZ3xQi5MrrIaKrW+/QbCNnq4my6Y
	/7xwnNwcZ3NjIjhKp/101rcYkFKUKdPhy8EESqilxh5Hf+I9gMzFHSLh6w3Oy2Zb2
X-Received: by 2002:a17:90b:440d:b0:3a4:fe48:d410 with SMTP id 98e67ed59e1d1-3ae897f8c6fmr8544348a91.30.1793672183582;
        Mon, 02 Nov 2026 18:16:23 -0800 (PST)
Received: from sanjays-pc.govzhome.govindz.co.nz ([203.94.55.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e4ff4csm10418413a91.1.2026.11.02.18.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 18:16:22 -0800 (PST)
From: Sanjay Govind <sanjay.govind9@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lkml@antheas.dev,
	q.tanaka@gmx.com,
	kees@kernel.org,
	wiagn233@outlook.com,
	lufia@lufia.org,
	elliotctester@gmail.com,
	contact@zharov.dev,
	zoliviragh@gmail.com,
	Sanjay Govind <sanjay.govind9@gmail.com>
Subject: [PATCH v11] Input: xpad - overhaul device data for wireless devices
Date: Tue,  3 Nov 2026 15:15:52 +1300
Message-ID: <20261103021550.1054584-3-sanjay.govind9@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021221009.361992-3-sanjay.govind9@gmail.com>
References: <20261021221009.361992-3-sanjay.govind9@gmail.com>
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

Xbox 360 wireless controllers expose identification information in their
link and capabilities reports. Use the vendor ID and subtype from the
link report to give each controller a more descriptive name and product
ID. Some controllers also encode their vendor ID, product ID and revision
in the stick capability data; use those IDs when the vendor matches the
link report.

Defer input device registration until the capabilities report arrives,
with a 500ms fallback for controllers that do not respond. If discovery
does not provide identification data, retain the receiver-derived
identity and the existing default product ID of 0x02a1.

Protect the wireless discovery state with a spinlock and initialize the
input device from a consistent snapshot. Track controller generations
and revalidate presence and generation after registration, so a
disconnect or replacement during registration cannot publish a stale
input device. Stop routing input immediately on disconnect and reconcile
cancelled discovery or teardown work across suspend.

This changes the IDs reported to userspace when discovery succeeds.
Wireless controllers previously used the receiver's vendor ID and a
product ID of 0x02a1. They now use the controller's vendor ID and a product
ID of 0x02a0 + subtype, unless the capabilities report supplies a product
ID. This matches Windows for gamepads (0x02a1) and wheels (0x02a2).
Windows reports all other subtypes as 0x02a9, but Linux has no other way
to expose the XInput subtype to userspace, so retain the subtype in the
product ID for those devices as well. SDL already handles these IDs:
https://github.com/libsdl-org/SDL/commit/fdc5efe1cbbcbffda016fbab9d5d9083ba040470

Signed-off-by: Sanjay Govind <sanjay.govind9@gmail.com>
---
Tool assistance:
Copilot SDK in VS Code assisted with review feedback, implementation,
code review, and testing preparation.

Changes in v11:
- Track link-report receipt and a fixed discovery deadline for each
  connection. The presence worker rechecks readiness and the deadline,
  so an already-running teardown callback cannot register a newly
  connected controller before discovery completes or times out.
- Ignore link and capabilities reports when no controller is present or
  after discovery has completed, preventing stale reports from
  repopulating the next controller's identity.
- Clear pending discovery state on suspend so resume starts discovery
  afresh when it inquires about presence.

Testing:
- Built xpad.ko with W=1 against the running 7.2.11-arch1-1 kernel
  headers, with force feedback and LED support enabled; loaded it on the
  running kernel.
- Tested with an unofficial Xbox 360 wireless receiver, a gamepad and a
  wireless guitar. evtest captured gamepad button and stick-axis events.
- Repeated controller power-off/on testing, including three reconnect
  cycles, produced fresh input devices. The gamepad remained
  045e:02a1 and the guitar 1430:02a7; no duplicate input devices remained.
- Suspended and resumed with controllers powered off during suspend, then
  powered them back on. Both devices reappeared with the expected
  identities, and evtest confirmed input after resume.
- These hardware tests exercise disconnect/reconnect and resume handling,
  but do not deterministically force a reconnect during the presence
  worker's execution or suspend during the discovery window. The
  test-only missing-link fallback scenario from v10 was not repeated.

Previous revisions:
v10: Protect discovery snapshots and input publication with a spinlock;
     track controller generations, clear the RCU input pointer on
     disconnect, and reconcile canceled work over suspend.
     https://lore.kernel.org/linux-input/20261021221009.361992-3-sanjay.govind9@gmail.com/
v9: Track controller generations, clear discovery state on disconnect,
    use a separate capabilities output slot, and validate vendor IDs.
    https://lore.kernel.org/linux-input/20261015220126.102766-3-sanjay.govind9@gmail.com/
v8: Clear presence state on suspend and wireless flags on input teardown.
    https://lore.kernel.org/linux-input/20260818073159.909188-4-sanjay.govind9@gmail.com/
v7: Check whether the input device has already been initialized.
v6: Address presence-work time-of-check/time-of-use issues.
v5: Fix work scheduling races and a typo.
v4: Clear wireless state on presence changes.
v3: Handle incorrect or missing link and capabilities reports.
v2: Defer registration until capabilities discovery or timeout.
---
 drivers/input/joystick/xpad.c | 348 +++++++++++++++++++++++++++++++---
 1 file changed, 317 insertions(+), 31 deletions(-)

diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
index 810e52782ae8..82408e1c0e04 100644
--- a/drivers/input/joystick/xpad.c
+++ b/drivers/input/joystick/xpad.c
@@ -30,14 +30,17 @@
 #include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/input.h>
+#include <linux/jiffies.h>
 #include <linux/rcupdate.h>
 #include <linux/slab.h>
 #include <linux/stat.h>
 #include <linux/module.h>
+#include <linux/unaligned.h>
 #include <linux/usb/input.h>
 #include <linux/usb/quirks.h>
 
 #define XPAD_PKT_LEN 64
+#define XPAD360W_DISCOVERY_TIMEOUT	msecs_to_jiffies(500)
 
 /*
  * xbox d-pads should map to buttons, as is required for DDR pads
@@ -60,6 +63,26 @@
 #define XTYPE_XBOXONE     3
 #define XTYPE_UNKNOWN     4
 
+/*
+ * Capability flags reported by x360w pads. Bit 0 matches
+ * XINPUT_CAPS_FFB_SUPPORTED, which is also set from the link report.
+ */
+#define FLAG_FORCE_FEEDBACK	0x01
+
+#define SUBTYPE_GAMEPAD			0x01
+#define SUBTYPE_WHEEL			0x02
+#define SUBTYPE_ARCADE_STICK		0x03
+#define SUBTYPE_FLIGHT_STICK		0x04
+#define SUBTYPE_DANCE_PAD		0x05
+#define SUBTYPE_GUITAR			0x06
+#define SUBTYPE_GUITAR_ALTERNATE	0x07
+#define SUBTYPE_DRUM_KIT		0x08
+#define SUBTYPE_GUITAR_BASS		0x0B
+#define SUBTYPE_RB_KEYBOARD		0x0F
+#define SUBTYPE_ARCADE_PAD		0x13
+#define SUBTYPE_TURNTABLE		0x17
+#define SUBTYPE_PRO_GUITAR		0x19
+
 /* Send power-off packet to xpad360w after holding the mode button for this many
  * seconds
  */
@@ -748,9 +771,24 @@ struct xpad_output_packet {
 #define XPAD_OUT_CMD_IDX	0
 #define XPAD_OUT_FF_IDX		1
 #define XPAD_OUT_LED_IDX	(1 + IS_ENABLED(CONFIG_JOYSTICK_XPAD_FF))
-#define XPAD_NUM_OUT_PACKETS	(1 + \
+#define XPAD_OUT_CAPS_IDX	(1 + \
 				 IS_ENABLED(CONFIG_JOYSTICK_XPAD_FF) + \
 				 IS_ENABLED(CONFIG_JOYSTICK_XPAD_LEDS))
+#define XPAD_NUM_OUT_PACKETS	(XPAD_OUT_CAPS_IDX + 1)
+
+/* Discovery state learned from x360w presence, link and capabilities reports */
+struct xpad360w_pad_info {
+	bool present;
+	bool link_report_received;
+	bool discovery_ready;
+	unsigned int gen;
+	unsigned long discovery_deadline;
+	u8 sub_type;
+	u8 flags;
+	u16 vid;
+	u16 pid;
+	u16 version;
+};
 
 struct usb_xpad {
 	struct input_dev *dev;		/* input device interface */
@@ -758,8 +796,10 @@ struct usb_xpad {
 	struct usb_device *udev;	/* usb device */
 	struct usb_interface *intf;	/* usb interface */
 
-	bool pad_present;
 	bool input_created;
+	unsigned int input_gen;		/* generation the input device was created for */
+	struct xpad360w_pad_info pad_info;
+	spinlock_t x360w_lock;		/* protects pad_info and x360w_dev publication */
 
 	struct urb *irq_in;		/* urb for interrupt in report */
 	unsigned char *idata;		/* input data */
@@ -788,17 +828,19 @@ struct usb_xpad {
 	int packet_type;		/* type of the extended packet */
 	int pad_nr;			/* the order x360 pads were attached */
 	const char *name;		/* name of the device */
-	struct work_struct work;	/* init/remove device from callback */
+	struct delayed_work work;	/* init/remove device from callback */
 	time64_t mode_btn_down_ts;
 	bool delay_init;		/* init packets should be delayed */
 	bool delayed_init_done;
 };
 
-static int xpad_init_input(struct usb_xpad *xpad);
+static int xpad_init_input(struct usb_xpad *xpad,
+			   const struct xpad360w_pad_info *info);
 static void xpad_deinit_input(struct usb_xpad *xpad);
 static int xpad_start_input(struct usb_xpad *xpad);
 static void xpadone_ack_mode_report(struct usb_xpad *xpad, u8 seq_num);
 static void xpad360w_poweroff_controller(struct usb_xpad *xpad);
+static void xpad_inquiry_pad_capabilities(struct usb_xpad *xpad);
 
 /*
  *	xpad_process_packet
@@ -954,7 +996,7 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 
 	/* XBOX360W controllers can't be turned off without driver assistance */
 	if (xpad->xtype == XTYPE_XBOX360W) {
-		if (xpad->mode_btn_down_ts > 0 && xpad->pad_present &&
+		if (xpad->mode_btn_down_ts > 0 && xpad->pad_info.present &&
 		    ((ktime_get_seconds() - xpad->mode_btn_down_ts) >=
 		     XPAD360W_POWEROFF_TIMEOUT)) {
 			xpad360w_poweroff_controller(xpad);
@@ -972,19 +1014,21 @@ static void xpad360_process_packet(struct usb_xpad *xpad, struct input_dev *dev,
 
 static void xpad_presence_work(struct work_struct *work)
 {
-	struct usb_xpad *xpad = container_of(work, struct usb_xpad, work);
+	struct usb_xpad *xpad = container_of(work, struct usb_xpad, work.work);
+	struct xpad360w_pad_info info;
+	unsigned long delay = 0;
 	int error;
 
-	if (xpad->pad_present) {
-		error = xpad_init_input(xpad);
-		if (error) {
-			/* complain only, not much else we can do here */
-			dev_err(&xpad->dev->dev,
-				"unable to init device: %d\n", error);
-		} else {
-			rcu_assign_pointer(xpad->x360w_dev, xpad->dev);
-		}
-	} else {
+	/*
+	 * Take a consistent snapshot, as the reports are processed
+	 * concurrently from the irq handler.
+	 */
+	scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+		info = xpad->pad_info;
+	}
+
+	/* Remove the input device if its controller disconnected or changed. */
+	if (xpad->input_created && (!info.present || xpad->input_gen != info.gen)) {
 		RCU_INIT_POINTER(xpad->x360w_dev, NULL);
 		synchronize_rcu();
 		/*
@@ -993,6 +1037,54 @@ static void xpad_presence_work(struct work_struct *work)
 		 */
 		xpad_deinit_input(xpad);
 	}
+
+	if (!info.present || xpad->input_created)
+		return;
+
+	/*
+	 * The work may already be running when a new pad connects, so its
+	 * original delayed execution cannot be relied on to finish discovery.
+	 */
+	scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+		if (!xpad->pad_info.present || xpad->pad_info.gen != info.gen)
+			return;
+
+		if (!xpad->pad_info.discovery_ready &&
+		    time_before(jiffies, xpad->pad_info.discovery_deadline)) {
+			delay = xpad->pad_info.discovery_deadline - jiffies;
+		} else {
+			xpad->pad_info.discovery_ready = true;
+			info = xpad->pad_info;
+		}
+	}
+
+	if (delay) {
+		mod_delayed_work(system_percpu_wq, &xpad->work, delay);
+		return;
+	}
+
+	if (info.discovery_ready) {
+		error = xpad_init_input(xpad, &info);
+		if (error) {
+			/* complain only, not much else we can do here */
+			dev_err(&xpad->intf->dev,
+				"unable to init device: %d\n", error);
+		} else {
+			scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+				if (xpad->pad_info.present &&
+				    xpad->pad_info.gen == info.gen &&
+				    xpad->pad_info.discovery_ready) {
+					xpad->input_gen = info.gen;
+					rcu_assign_pointer(xpad->x360w_dev, xpad->dev);
+					return;
+				}
+			}
+
+			RCU_INIT_POINTER(xpad->x360w_dev, NULL);
+			synchronize_rcu();
+			xpad_deinit_input(xpad);
+		}
+	}
 }
 
 /*
@@ -1009,19 +1101,102 @@ static void xpad_presence_work(struct work_struct *work)
  * 01.1 - Pad state (Bytes 4+) valid
  *
  */
-static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data)
+static void xpad360w_process_packet(struct usb_xpad *xpad, u16 cmd, unsigned char *data, u32 len)
 {
+	struct xpad360w_pad_info *info = &xpad->pad_info;
 	struct input_dev *dev;
 	bool present;
+	bool request_capabilities;
+	bool discovery_complete;
+	u16 parsed_vid;
 
 	/* Presence change */
 	if (data[0] & 0x08) {
 		present = (data[1] & 0x80) != 0;
 
-		if (xpad->pad_present != present) {
-			xpad->pad_present = present;
-			schedule_work(&xpad->work);
+		guard(spinlock_irqsave)(&xpad->x360w_lock);
+
+		if (info->present != present) {
+			if (present) {
+				unsigned int gen = info->gen + 1;
+
+				*info = (struct xpad360w_pad_info) {
+					.present = true,
+					.gen = gen,
+					.discovery_deadline = jiffies +
+						XPAD360W_DISCOVERY_TIMEOUT,
+				};
+				mod_delayed_work(system_percpu_wq, &xpad->work,
+						 XPAD360W_DISCOVERY_TIMEOUT);
+			} else {
+				RCU_INIT_POINTER(xpad->x360w_dev, NULL);
+				/* Forget everything we learned about the old pad */
+				*info = (struct xpad360w_pad_info) { .gen = info->gen };
+				mod_delayed_work(system_percpu_wq, &xpad->work, 0);
+			}
+		}
+	}
+
+	/* Link report */
+	if (len >= 26 && data[0] == 0x00 && data[1] == 0x0F) {
+		/* Decode vendor id from link report */
+		parsed_vid = ((data[0x16] & 0xf) | (data[0x18] & 0xf) << 4) << 8 |
+			     data[0x17];
+
+		/* VID 1 means unavailable; fall back to the receiver's VID. */
+		if (parsed_vid == 1)
+			parsed_vid = 0;
+
+		/* Use a subtype-derived PID unless capabilities supply one. */
+		request_capabilities = false;
+
+		scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+			if (info->present && !info->discovery_ready) {
+				info->sub_type = data[25] & 0x7f;
+				info->vid = parsed_vid;
+				info->pid = 0x02a0 + info->sub_type;
+				info->version = 0;
+				info->flags = 0;
+				info->link_report_received = true;
+
+				if ((data[25] & 0x80) != 0)
+					info->flags |= FLAG_FORCE_FEEDBACK;
+
+				request_capabilities = true;
+			}
 		}
+
+		if (request_capabilities)
+			xpad_inquiry_pad_capabilities(xpad);
+	}
+
+	/* Capabilities report */
+	if (len >= 21 && data[0] == 0x00 && data[1] == 0x05 && data[5] == 0x12) {
+		discovery_complete = false;
+
+		scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+			if (info->present && info->link_report_received &&
+			    !info->discovery_ready) {
+				info->flags |= data[20];
+				/*
+				 * Some vendors encode identification in the stick
+				 * capabilities. Only trust it when the VID matches
+				 * the link report.
+				 */
+				if (info->vid &&
+				    get_unaligned_le16(data + 10) == info->vid &&
+				    get_unaligned_le16(data + 12)) {
+					info->pid = get_unaligned_le16(data + 12);
+					info->version = get_unaligned_le16(data + 14);
+				}
+
+				info->discovery_ready = true;
+				discovery_complete = true;
+			}
+		}
+
+		if (discovery_complete)
+			mod_delayed_work(system_percpu_wq, &xpad->work, 0);
 	}
 
 	/* Valid pad data */
@@ -1246,7 +1421,7 @@ static void xpad_irq_in(struct urb *urb)
 		xpad360_process_packet(xpad, xpad->dev, 0, xpad->idata);
 		break;
 	case XTYPE_XBOX360W:
-		xpad360w_process_packet(xpad, 0, xpad->idata);
+		xpad360w_process_packet(xpad, 0, xpad->idata, urb->actual_length);
 		break;
 	case XTYPE_XBOXONE:
 		xpadone_process_packet(xpad, 0, xpad->idata, urb->actual_length);
@@ -1487,6 +1662,31 @@ static int xpad_inquiry_pad_presence(struct usb_xpad *xpad)
 	return xpad_try_sending_next_out_packet(xpad);
 }
 
+static void xpad_inquiry_pad_capabilities(struct usb_xpad *xpad)
+{
+	struct xpad_output_packet *packet =
+			&xpad->out_packets[XPAD_OUT_CAPS_IDX];
+
+	guard(spinlock_irqsave)(&xpad->odata_lock);
+
+	packet->data[0] = 0x00;
+	packet->data[1] = 0x00;
+	packet->data[2] = 0x02;
+	packet->data[3] = 0x80;
+	packet->data[4] = 0x00;
+	packet->data[5] = 0x00;
+	packet->data[6] = 0x00;
+	packet->data[7] = 0x00;
+	packet->data[8] = 0x00;
+	packet->data[9] = 0x00;
+	packet->data[10] = 0x00;
+	packet->data[11] = 0x00;
+	packet->len = 12;
+	packet->pending = true;
+
+	xpad_try_sending_next_out_packet(xpad);
+}
+
 static int xpad_start_xbox_one(struct usb_xpad *xpad)
 {
 	int error;
@@ -1884,8 +2084,8 @@ static void xpad360w_stop_input(struct usb_xpad *xpad)
 {
 	usb_kill_urb(xpad->irq_in);
 
-	/* Make sure we are done with presence work if it was scheduled */
-	flush_work(&xpad->work);
+	/* Cancel any pending presence work */
+	cancel_delayed_work_sync(&xpad->work);
 }
 
 static int xpad_open(struct input_dev *dev)
@@ -1942,7 +2142,68 @@ static void xpad_deinit_input(struct usb_xpad *xpad)
 	}
 }
 
-static int xpad_init_input(struct usb_xpad *xpad)
+static void xpad360w_set_input_info(struct input_dev *input_dev,
+				    const struct xpad360w_pad_info *info)
+{
+	if (info->vid)
+		input_dev->id.vendor = info->vid;
+	if (info->pid)
+		input_dev->id.product = info->pid;
+	else
+		/* Default product id for x360w controllers */
+		input_dev->id.product = 0x02a1;
+	if (info->version)
+		input_dev->id.version = info->version;
+
+	switch (info->sub_type) {
+	case SUBTYPE_GAMEPAD:
+		input_dev->name = "Xbox 360 Wireless Controller";
+		break;
+	case SUBTYPE_WHEEL:
+		input_dev->name = "Xbox 360 Wireless Wheel";
+		break;
+	case SUBTYPE_ARCADE_STICK:
+		input_dev->name = "Xbox 360 Wireless Arcade Stick";
+		break;
+	case SUBTYPE_FLIGHT_STICK:
+		input_dev->name = "Xbox 360 Wireless Flight Stick";
+		break;
+	case SUBTYPE_DANCE_PAD:
+		input_dev->name = "Xbox 360 Wireless Dance Pad";
+		break;
+	case SUBTYPE_GUITAR:
+		input_dev->name = "Xbox 360 Wireless Guitar";
+		break;
+	case SUBTYPE_GUITAR_ALTERNATE:
+		input_dev->name = "Xbox 360 Wireless Alternate Guitar";
+		break;
+	case SUBTYPE_GUITAR_BASS:
+		input_dev->name = "Xbox 360 Wireless Bass Guitar";
+		break;
+	case SUBTYPE_DRUM_KIT:
+		/* Vendors used force feedback flag to differentiate these */
+		if (info->flags & FLAG_FORCE_FEEDBACK)
+			input_dev->name = "Xbox 360 Wireless Guitar Hero Drum Kit";
+		else
+			input_dev->name = "Xbox 360 Wireless Rock Band Drum Kit";
+		break;
+	case SUBTYPE_RB_KEYBOARD:
+		input_dev->name = "Xbox 360 Wireless Rock Band Keyboard";
+		break;
+	case SUBTYPE_ARCADE_PAD:
+		input_dev->name = "Xbox 360 Wireless Arcade Pad";
+		break;
+	case SUBTYPE_TURNTABLE:
+		input_dev->name = "Xbox 360 Wireless DJ Hero Turntable";
+		break;
+	case SUBTYPE_PRO_GUITAR:
+		input_dev->name = "Xbox 360 Wireless Rock Band Pro Guitar";
+		break;
+	}
+}
+
+static int xpad_init_input(struct usb_xpad *xpad,
+			   const struct xpad360w_pad_info *info)
 {
 	struct input_dev *input_dev;
 	int i, error;
@@ -1956,10 +2217,8 @@ static int xpad_init_input(struct usb_xpad *xpad)
 	input_dev->phys = xpad->phys;
 	usb_to_input_id(xpad->udev, &input_dev->id);
 
-	if (xpad->xtype == XTYPE_XBOX360W) {
-		/* x360w controllers and the receiver have different ids */
-		input_dev->id.product = 0x02a1;
-	}
+	if (xpad->xtype == XTYPE_XBOX360W)
+		xpad360w_set_input_info(input_dev, info);
 
 	input_dev->dev.parent = &xpad->intf->dev;
 
@@ -2098,7 +2357,8 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		xpad->delay_init = true;
 
 	xpad->packet_type = PKT_XB;
-	INIT_WORK(&xpad->work, xpad_presence_work);
+	INIT_DELAYED_WORK(&xpad->work, xpad_presence_work);
+	spin_lock_init(&xpad->x360w_lock);
 
 	if (xpad->xtype == XTYPE_UNKNOWN) {
 		if (intf->cur_altsetting->desc.bInterfaceClass == USB_CLASS_VENDOR_SPEC) {
@@ -2215,7 +2475,8 @@ static int xpad_probe(struct usb_interface *intf, const struct usb_device_id *id
 		 */
 		udev->quirks |= USB_QUIRK_RESET_RESUME;
 	} else {
-		error = xpad_init_input(xpad);
+		/* Only x360w devices use the device info */
+		error = xpad_init_input(xpad, NULL);
 		if (error)
 			goto err_deinit_output;
 	}
@@ -2262,6 +2523,7 @@ static int xpad_suspend(struct usb_interface *intf, pm_message_t message)
 {
 	struct usb_xpad *xpad = usb_get_intfdata(intf);
 	struct input_dev *input = xpad->dev;
+	struct xpad360w_pad_info info;
 
 	if (xpad->xtype == XTYPE_XBOX360W) {
 		/*
@@ -2271,14 +2533,38 @@ static int xpad_suspend(struct usb_interface *intf, pm_message_t message)
 		 */
 		xpad360w_stop_input(xpad);
 
+		scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+			info = xpad->pad_info;
+		}
+
 		/*
 		 * The wireless adapter is going off now, so the
 		 * gamepads are going to become disconnected.
 		 * Unless explicitly disabled, power them down
 		 * so they don't just sit there flashing.
 		 */
-		if (auto_poweroff && xpad->pad_present)
+		if (auto_poweroff && info.present)
 			xpad360w_poweroff_controller(xpad);
+
+		/* Finish teardown if suspend cancelled work for an old pad. */
+		if (xpad->input_created &&
+		    (!info.present || xpad->input_gen != info.gen)) {
+			RCU_INIT_POINTER(xpad->x360w_dev, NULL);
+			synchronize_rcu();
+			xpad_deinit_input(xpad);
+		}
+
+		/*
+		 * A cancelled discovery must be restarted by the resume inquiry.
+		 * Clear its metadata so late reports cannot seed the next pad.
+		 */
+		if (!xpad->input_created) {
+			scoped_guard(spinlock_irqsave, &xpad->x360w_lock) {
+				xpad->pad_info = (struct xpad360w_pad_info) {
+					.gen = xpad->pad_info.gen,
+				};
+			}
+		}
 	} else {
 		guard(mutex)(&input->mutex);
 
-- 
2.56.0

