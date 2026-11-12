Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794472823;
	b=UUa/coD1zJNRItnzO8QPbcuzi24lH0+ssjio1rhRbmDSZ438nJ1cOpVsb/dF0ch1Hph9
	 wwplddsWd/oqXOazb80AG8Cuz9kY1eP0h9sY4Sb6oj/KGEhuW+wvJdRGOHObvWkICz+Bd
	 LLevtqs30ZWuI6QG5A++ERJGp8UboUwLBcCw8i529w9OC3Tv18jIG/voPrECePeGM/ZSm
	 8Wlfb2PjivIFbodJP3SdnYPaRQfGzYjQOl6/OYuFTzFAGyuCQwm/iSjAbHIcHDeyJf3hy
	 9WE2cAsYTNsssVyfZ6oW40Sx+9vUPmHZmy90SzKD4gbjKKCyCqSNzYn7FC7JLeDc7fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MAVWgHRB0GBaofXsWEnJ63tTGooOFs/mkKNp1Vp4sNg=;
	b=HlL5ODnvRPP2Nc4UdfwxmL7HL3eXph1WaSLhJq3K1x7HHmpv+GB77vWMPWH1Kh1CBjiX
	 +0psJ87b+UinHz3u3iMCbtCgQTfmVolP74km9GjcjPBKT81W46zoU1kyPpuk7VMKBTFeB
	 tz/i07f6r92M0MwefQ7RmgB/S52g2BrAuUg9F/N+uH/AAM6v3C2y1zvMg7b1N2Zy3NnE7
	 u8QyExs6ZKfmhew1P3RBH3sRWHEqiCXF9+dfc1sfCvibCyGm2V6OE77Y0kNFN7Z5idFoV
	 sTecrIPwI9Xu+CTx/bNBRAbHODekeYQdk0QWSXx+pr+ge0hGmKu7kW23qmynb2v8JjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zRrz/v+K";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6985D606B3B4
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6985D606B3B4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zRrz/v+K
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-170135e43c7so2417816c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794472822; x=1795077622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MAVWgHRB0GBaofXsWEnJ63tTGooOFs/mkKNp1Vp4sNg=;
        b=zRrz/v+Kq6KK+c3ytkj6sqiY9NHG/6qdWG0mDbeg7fe9eAzYf6dDME6RCvDCmHn9Q0
         c9DF+7jqFtJmUV2kWYnN+TEatAomzbIRHrjPtsW2RZMaUbLfUioU7ZQXZHnHIWz0p95f
         0j/XPEDE0sO93PNrFpuwNBPpZtvlI/oUzbZ697DOquh5Mf7m59qja+mIvFRGbziAToxz
         NUiIT4VTsfBPEjCOwuGcm7oSSD8N476aJ7blt1OLR8wa0ldWGpfL0MDYkNsS0tjJJp9P
         AT4c6yYiZ0v4GZW/WW4T0kY2LLfIn0Gh0e6UeuNzpdrsWmHr+KCovDu7O/qOLBrLoUEG
         W+Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794472822; x=1795077622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MAVWgHRB0GBaofXsWEnJ63tTGooOFs/mkKNp1Vp4sNg=;
        b=jTb3cvWM937jxWxE22YVSszbr5S7fD9LIt7IIlrOMlsUo6P+0UUtJpSeaQ86d6dQYe
         M2Ake7hDe4vQZ0/DtoQAjquOyM8HjvLy+6mSrYVNb2tUXlqxIQA5VrNX0+yv3/fVuC16
         jdohl92j5nVYzH+5NS1GfviivfNgEyO2m0t5yfCWNV7oQ1/qsw0pyrC8pUIi8FWlgCGi
         LZU1JJai4q6Lu8I0JP1lghbO/GOfJyIXzX6PtF11KSePQCjOKGbyuU+zT+cwj7iQUdYQ
         K5h9iGby6r8IQN47UWB1CmlqnLEwGMwCYsYFj4Bf1SDa/WMvpMZ6vRckIBsjIZbgO1jq
         4eRg==
X-Forwarded-Encrypted: i=1; AL+hErHUDzUvE2dIROv98XGnW668s0wUp1J7NYs0zpG/MVHtTw5H/vbhcO6J/r1rdYP58OEXJK7CEniPbny2ezo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fsNxq6Pyyp+tz41lIAN0kYf/GbDzXa2EVXIQSAxUkqIdYrQgQ
	At80TFjtuC+yA042dq26sJG62XZBTRabNXxBQYzQnEtuHA+A3mZfJ5IF
X-Gm-Gg: AYBFou03YW6wuJu4UtXH+ivPWQqzRKkThzJhBGArZn+w/dYIcaJnOEyIBKAbCaABhSa
	pJYUOoA9CufCA9Co+GML7s7OmaqB/xVfe//79cLi6337Aff4K3Dm/hg7AhNmW5Hp5wLGf1ofTR2
	jCEXX+GJ2BpeQfWvUCumQGF4zuFqXMqPEZWbmtZ+TIorYEBwMf5qcTCaY1gV0gmQgJcL4FoFvtt
	GaFiugR+z1ROz049IzCVteh4yJdvqt47xC3ASoxHPFMb3/43lOBT53RgLaXdhMH9GIpXHQ8/4ZE
	Rp4bI6n+fXThv8ZdSa7S/wKTG04hYLCZPgY5GaAUJc4M2Sn/cGnCSVFaX8GC/M/7c2TaZXzDpRy
	779ePqmKrKpyYuyYZl3j3cdFsjeX7Kehk0WlmZoUzEoofuZTbLcrcPCyD8r3bjeYbWf9zjquqGy
	EL566a7B8PXy2zs4HBIGFzpzvDOnFSpDPbYPK/ibMcDWBLiCAsMJVGnKVyBD3fiSJFgFNQIhmHN
	BctTrfD/Z3iPPnFbQzOWCXVTp9v/nyBpA0WJEnhri97IUMmM83BAVcojgxZ5piN18eorP7GdYqs
	O/yGQKWLY91Tr/GKsNMn2JPAPS3tL9nKnbS8U5ExqV9eE7XhkzK+HLCc1F95/rmaAgbyVhvrug0
	B197iZ37xPocp3Kz63joPWyd0a80mesO1uAys+SWVxuI=
X-Received: by 2002:a05:7022:296:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-1b3c0365599mr4162359c88.45.1794472822191;
        Thu, 12 Nov 2026 00:40:22 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm47756100c88.10.2026.11.12.00.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:40:21 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: heikki.krogerus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: badhri@google.com,
	groeck@chromium.org,
	xu.yang_2@oss.nxp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] usb: typec: tcpci: filter masked alerts and quiesce the IRQ
Date: Thu, 12 Nov 2026 16:40:14 +0800
Message-Id: <20261112084014.2564834-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
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

tcpci_irq() reads TCPC_ALERT and uses the result for the event
callbacks, while only the IRQ return value is masked with
tcpci->alert_mask.  A masked alert is still latched in TCPC_ALERT even
though it does not assert Alert# (TCPCI spec 4.4.3), so the handler can
run TCPM callbacks for events that the port has masked.  This also
defeats the ALERT_MASK = 0 write during teardown when the write fails.

In addition, tcpci_remove() unregisters the TCPM port, which destroys
its kthread worker, while the devm-managed threaded IRQ can still be
running and queue work on that worker.  tcpci_unregister_port() must
not run before in-flight handlers have finished.

There is a second teardown race through tcpm_tcpc_reset(): the IRQ
handler can call tcpm_init(), which calls tcpci_init(), and that
function publishes the normal alert mask.  If it interleaves with the
teardown clearing of the mask, it can restore the mask after
synchronize_irq() returns and let a later shared IRQ reach the TCPM
port after its worker was destroyed.

Filter the alert status with tcpci->alert_mask before processing it,
and again after the final re-read.  Add an alert_mask_lock and an
alerts_quiesced state: tcpci_quiesce_alerts() sets both atomically, and
tcpci_init() only publishes the mask while alerts are not quiesced.
Return IRQ_NONE immediately when the software mask is zero, so a
quiesced port does not perform an I2C read at all.  In tcpci_remove(),
quiesce the alerts, disable the hardware mask, then call
synchronize_irq() before unregistering the port.  Apply the same
ordering on the probe error path when the final ALERT_MASK enable write
fails.  A handler that starts after synchronize_irq(), including one
triggered on a shared line, sees the zero software mask and returns
IRQ_NONE without touching the TCPM port.

The masked-status handling and the unquiesced teardown both date back to
the original TCPCI driver.  The TCPM port worker was later migrated to
kthread_work, which is the path that reports the use-after-free, but the
missing status filter and IRQ synchronization are the underlying
defects.

The probe ordering that requests the IRQ before the final ALERT_MASK
enable write was added later, so the probe error path needs the same
quiesce sequence as removal.

Tested on 7.4-rc1 with a simulated I2C TCPCI device and KASAN:

- Unpatched: a handler parked in tcpm_cc_change()/kthread_queue_work()
  while the device is unbound produces a slab-use-after-free on the
  destroyed TCPM worker.
- Patched: synchronize_irq() waits for the parked handler; the handler
  queues on the still-live worker, then the worker is destroyed; no
  report.
- Normal CC event: the callback still runs and removal completes without
  a report.
- Shared IRQ raised after synchronize_irq(), with a stale CC alert:
  tcpci_irq() filters it with alert_mask = 0 and returns IRQ_NONE
  without calling tcpm_cc_change().
- Hardware ALERT_MASK = 0 write forced to fail during removal, with a
  continuous alert stream: no TCPM callback after the worker is
  destroyed.
- Final ALERT_MASK enable write forced to fail during probe: the error
  path quiesces the IRQ before unregistering the port.
- Reset-race: the IRQ handler is parked in tcpci_init() while remove
  quiesces and waits; after release, the pre-guard code restored the
  mask and a shared IRQ reached tcpm_cc_change() with a destroyed
  worker (KASAN null-pointer dereference).  The guarded code keeps
  alert_mask at zero, returns IRQ_NONE, and completes without a report.
- Masked/unmasked mix: with TX_SUCCESS masked and CC unmasked in the
  same ALERT, only tcpm_cc_change() runs; the masked TX bit is not
  cleared and remains latched.
- Normal TX_SUCCESS and RX_STATUS alerts still reach
  tcpm_pd_transmit_complete() and tcpm_pd_receive(), respectively.

Real TCPCI hardware and PD traffic remain untested.

Fixes: 74e656d6b055 ("staging: typec: Type-C Port Controller Interface driver (tcpci)")
Fixes: 862a9c0f6848 ("usb: typec: tcpci: fix NULL pointer issue on shared irq case")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes in v3:
- Filter status with alert_mask before processing it and after the
  final re-read; drop the v2 chip->stopping flag.
- Add alert_mask_lock/alerts_quiesced so tcpci_init() cannot restore
  the software mask after teardown started, and return IRQ_NONE early
  when the software mask is zero.
- Publish the quiesced state before the hardware mask write, then
  synchronize_irq() before unregistering the port; same ordering on the
  probe error path.
- Point Fixes at the original TCPCI driver and the later probe ordering
  change instead of the file move.
- Re-test remove/inject, shared-IRQ, mask-failure, probe-failure, the
  tcpci_init() reset race, masked/unmasked mixed alerts, and normal
  TX/RX events.  The final metadata-only amend does not change the
  tested driver source.

AI tools assisted with source review, patch iteration and test harness
development. The author reviewed the resulting code and test results.

v2: https://lore.kernel.org/r/20261106091725.1334097-1-shunsheng1218@gmail.com/
v1: https://lore.kernel.org/r/179378589227.74015.8259496684787732118@gmail.com/

 drivers/usb/typec/tcpm/tcpci.c | 44 ++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 6717ac914c6a6..1b98940fdaed9 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -39,6 +39,8 @@ struct tcpci {
 	struct regmap *regmap;
 	unsigned int alert_mask;
 	unsigned int rx_type_mask;
+	spinlock_t alert_mask_lock; /* protects alert_mask and alerts_quiesced */
+	bool alerts_quiesced;
 
 	bool controls_vbus;
 
@@ -648,10 +650,21 @@ static bool tcpci_attempt_vconn_swap_discovery(struct tcpc_dev *tcpc)
 	return false;
 }
 
+static void tcpci_quiesce_alerts(struct tcpci *tcpci)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&tcpci->alert_mask_lock, flags);
+	tcpci->alerts_quiesced = true;
+	WRITE_ONCE(tcpci->alert_mask, 0);
+	spin_unlock_irqrestore(&tcpci->alert_mask_lock, flags);
+}
+
 static int tcpci_init(struct tcpc_dev *tcpc)
 {
 	struct tcpci *tcpci = tcpc_to_tcpci(tcpc);
 	unsigned long timeout = jiffies + msecs_to_jiffies(2000); /* XXX */
+	unsigned long flags;
 	unsigned int reg;
 	int ret;
 
@@ -710,7 +723,10 @@ static int tcpci_init(struct tcpc_dev *tcpc)
 			return ret;
 	}
 
-	tcpci->alert_mask = reg;
+	spin_lock_irqsave(&tcpci->alert_mask_lock, flags);
+	if (!tcpci->alerts_quiesced)
+		WRITE_ONCE(tcpci->alert_mask, reg);
+	spin_unlock_irqrestore(&tcpci->alert_mask_lock, flags);
 
 	return 0;
 }
@@ -722,8 +738,12 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 	int irq_ret;
 	unsigned int raw;
 
+	if (!READ_ONCE(tcpci->alert_mask))
+		return IRQ_NONE;
+
 	tcpci_read16(tcpci, TCPC_ALERT, &status);
-	irq_ret = status & tcpci->alert_mask;
+	status &= READ_ONCE(tcpci->alert_mask);
+	irq_ret = status;
 
 process_status:
 	/*
@@ -806,8 +826,9 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 		tcpm_pd_transmit_complete(tcpci->port, TCPC_TX_FAILED);
 
 	tcpci_read16(tcpci, TCPC_ALERT, &status);
+	status &= READ_ONCE(tcpci->alert_mask);
 
-	if (status & tcpci->alert_mask)
+	if (status)
 		goto process_status;
 
 	return IRQ_RETVAL(irq_ret);
@@ -854,6 +875,7 @@ struct tcpci *tcpci_register_port(struct device *dev, struct tcpci_data *data)
 	tcpci->dev = dev;
 	tcpci->data = data;
 	tcpci->regmap = data->regmap;
+	spin_lock_init(&tcpci->alert_mask_lock);
 
 	tcpci->tcpc.init = tcpci_init;
 	tcpci->tcpc.get_vbus = tcpci_get_vbus;
@@ -972,12 +994,15 @@ static int tcpci_probe(struct i2c_client *client)
 	/* Enable chip interrupts at last */
 	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, chip->tcpci->alert_mask);
 	if (err < 0)
-		goto unregister_port;
+		goto quiesce_irq;
 
 	device_set_wakeup_capable(chip->tcpci->dev, true);
 
 	return 0;
 
+quiesce_irq:
+	tcpci_quiesce_alerts(chip->tcpci);
+	synchronize_irq(client->irq);
 unregister_port:
 	tcpci_unregister_port(chip->tcpci);
 	return err;
@@ -988,10 +1013,19 @@ static void tcpci_remove(struct i2c_client *client)
 	struct tcpci_chip *chip = i2c_get_clientdata(client);
 	int err;
 
-	/* Disable chip interrupts before unregistering port */
+	/*
+	 * The port's kthread worker is destroyed by tcpci_unregister_port()
+	 * below, while the threaded IRQ handler can still queue work on it.
+	 * Publish a zero software mask first: tcpci_irq() then ignores any
+	 * alert that is still latched, or asserted again on a shared IRQ,
+	 * even if the hardware mask write fails.  synchronize_irq() waits
+	 * for handlers that already read the old mask.
+	 */
+	tcpci_quiesce_alerts(chip->tcpci);
 	err = tcpci_write16(chip->tcpci, TCPC_ALERT_MASK, 0);
 	if (err < 0)
 		dev_warn(&client->dev, "Failed to disable irqs (%pe)\n", ERR_PTR(err));
+	synchronize_irq(client->irq);
 
 	tcpci_unregister_port(chip->tcpci);
 }
-- 
2.34.1

