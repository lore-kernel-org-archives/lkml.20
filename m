Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7303B5208A3;
	Thu, 15 Oct 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792067548; cv=none; b=GYHSixn00ZLYclzcH9FfYnltzU9ho/9HYuFAYhZQCKOUsvTupkurlYQMWsEY30uBPjuhulh96FRtUXv5Wpm0recWQ86xc/bRzNSPyRz5dO3ousdISvXdzx2W31tXJ8cbGj2UKPGV08Xr8T8WbT1bPvMMepWMJQq3cbJuAEpxKKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792067548; c=relaxed/simple;
	bh=3p/0sf2pm4Sd5wx7uWxNwwvAPAAn1mMvM8u5S1ZsRv4=;
	h=Date:From:To:Subject:Cc:In-Reply-To:References:MIME-Version:
	 Message-ID:Content-Type; b=ngaNOQTJpvpT8rOxT2EYq6KibFP9CXQDPy3xMoTsi544STemTdtG1AHmAQjbVHOR+kNbawiKGcjqXzb0VUKsXIr7YRAv5Mj6F/1BXo2o75bp/KxIqToUPfcE0AdXtQqhRduxKMKtq0VZbCdfFciNxmWZ2YYBubU0qiQ3PB5CfLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VxGR0+te; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PMxehwO5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VxGR0+te";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PMxehwO5"
Date: Thu, 15 Oct 2026 12:32:24 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792067545;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWEhhUcOb2trgljPzREHNYtE4a7zscXQAwx+LhLTak=;
	b=VxGR0+teyoXwCx6Az/nhNZKXUHHuGpA/77vblIShpADc+Og3zpHMqLwnZwmqVjyKZTRX1T
	lohlP8dwJ8BUltL+jvnrH4jsslqDuv7dhrpWUTIBQ2ekh96p9QFR32qvbOlfEQ+WEFqX4I
	tgM8T9FjvJWYm5/+fO94d/qOW9dP276/VekjxsPB6yRKBCb5kX/Ibg6C4vaIyIsClxFmGJ
	BggjxwBX+3E7TshGwllWZJaWwWM2213xMkGwGpQrkzsru+h4HEv3qIWJJ4Af3wG2q1L4s7
	apPzyOuITqPtvPWS/VeWOoC8uAMJ71+zmnmRF0SEXmCGpCnGBEPoIaD0kZBGfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792067545;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LaWEhhUcOb2trgljPzREHNYtE4a7zscXQAwx+LhLTak=;
	b=PMxehwO5QGrvz4Xgk9pf5jqtx1WeniM1A4OEZxo6N/6RhLX52m8KYHF4ofiaEFRhQI/f6B
	nONjP/uLA8gg57BQ==
From: "tip-bot2 for Eliav Farber" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: irq/drivers] dt-bindings: interrupt-controller: amazon,al-fic:
 Add mask selection
Cc: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Conor Dooley <conor.dooley@microchip.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261011050449.41903-7-farbere@amazon.com>
References: <20261011050449.41903-7-farbere@amazon.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <179206754405.2666988.14777124917992852826.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the irq/drivers branch of tip:

Commit-ID:     485ab2a36d36edb2bb630d2491d2ab7ed11178fc
Gitweb:        https://git.kernel.org/tip/485ab2a36d36edb2bb630d2491d2ab7ed11=
178fc
Author:        Eliav Farber <farbere@amazon.com>
AuthorDate:    Sun, 11 Oct 2026 05:04:45=20
Committer:     Thomas Gleixner <tglx@kernel.org>
CommitterDate: Thu, 15 Oct 2026 14:25:07 +02:00

dt-bindings: interrupt-controller: amazon,al-fic: Add mask selection

The block this driver calls a FIC is the generic Annapurna Labs interrupt
controller. It is built from groups of up to 32 triggers each; the number
of groups differs from one controller to another, and each group has its
own 0x40 register block.

A node in this binding describes one group, not a whole controller. reg
points at that group's 0x40 block, and the 32 hwirqs of the domain are
that group's triggers. A controller with several groups appears as several
nodes, and controllers cascade when a tree needs more triggers than one
controller has.

A group has one cause register and three mask registers, which decide
which output a set cause bit drives:

  0x10  info mask    gates the info output
  0x2c  error mask   gates the error output
  0x34  fatal mask   gates the fatal output

The three outputs are aggregated into three separate interrupt trees
(info, error, fatal); mapping one event to more than one severity is
forbidden by the interrupt methodology, so a group belongs to exactly one
tree. Which output a group drives is fixed when the SoC is wired and is
not discoverable from any register, so it must be described in the
devicetree.

The error and fatal outputs, and their mask registers, exist only on
controller revisions that implement them; earlier revisions provide the
info output only. A controller reports its revision in the group control
register (bits 29-28), so the revision itself does not need to appear in
the devicetree and no per-revision compatible string is needed.

Describe which output a group drives with a new optional property,
amazon,al-fic-mask (info, error or fatal; default info).

Signed-off-by: Eliav Farber <farbere@amazon.com>
Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Reviewed-by: Radu Rendec <radu@rendec.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://patch.msgid.link/20261011050449.41903-7-farbere@amazon.com
---
 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.yaml | =
16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al=
-fic.yaml b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-=
fic.yaml
index 26bc05d..1ebf9a4 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.ya=
ml
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.ya=
ml
@@ -24,6 +24,19 @@ properties:
   interrupts:
     maxItems: 1
=20
+  amazon,al-fic-mask:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Selects which of the controller's severity outputs this group drives,
+      and thus which mask register the driver programs. A group has one cause
+      register and three severity outputs - info, error and fatal - each
+      gated by its own mask register. Each output is aggregated into a
+      separate interrupt tree, and a group belongs to exactly one of them.
+      The error and fatal outputs exist only on controller revisions that
+      implement them; earlier revisions provide the info output only.
+    enum: [info, error, fatal]
+    default: info
+
 required:
   - compatible
   - reg
@@ -39,8 +52,9 @@ examples:
=20
     interrupt-controller@fd8a8500 {
         compatible =3D "amazon,al-fic";
-        reg =3D <0xfd8a8500 0x1000>;
+        reg =3D <0xfd8a8500 0x40>;
         interrupt-controller;
         #interrupt-cells =3D <2>;
         interrupts =3D <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
+        amazon,al-fic-mask =3D "error";
     };
