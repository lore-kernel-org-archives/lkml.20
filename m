Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=141.14.17.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749907;
	b=H0aPiPIGPq4lbanVqmjPZEAcBnARBWKdJcUBfHI9fDCTqdlhbOtEP4R8RnNXeEXWFQXq
	 OVtxIrp2jpEd4wBTYpK9LI2JnprsmvnpPReqN52HNLaajb2LRzRSjcE5Pi65tTP4dfUzj
	 hcZ6XlgMeQOfDkO1i40AxODRaivhk7nOfnUfiNcn/zeQsjgBsSE/qBHcz6+cbeEVQc/pl
	 GBXNjUaAdJgaHzjxbF2fuKXe52qPQD12BruAXUQZePZYt3iUzKtlDz2A8Q6mwIWT6yowf
	 vjX7X4G5xQ5OQdPT806JYtxZ/ACvTjGOolWRTQid0IC34COmmwRbeL7SSBUThwQ48gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749907;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:DKIM-Signature;
	bh=PywoGYHtYXzdkfVgZN+c7wT6tXLK+qOtUP+hmYI2/bE=;
	b=wh4BFyYzBp+/SB3md5/wcvvCYlvzGTEEJpanmRmq0vfa3ib5e+D6/TWi/hlCtsfawP4L
	 f8EBMHjNMtWSu06dAY2jZoCde2SYM6tuCgI7mO9VaR3HvvkO42GK6b2H8llm8cEimDqI/
	 HulLxEDRZxAd2qbSSOuBgOaJSwwQoHYlZ+CzGiD9oUZyIwAlGaL2YEhIwFDazsuvmkRI0
	 OCw3ncBakUs9jfHHt3NpkHNhmbLv5tGcXEqK5qfgkHX+nlwUfDkRXL6XCC5hrI1dJkK6k
	 lwY8vGWxYY4NurdbYtdHC62kxmF/BRUq+LNmW3DVguKyIXRrausjmlsqSi8gm/olOWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=molgen.mpg.de;
	spf=pass smtp.mailfrom=molgen.mpg.de;
	dkim=pass header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=ZIvBGXzs;
	arc=none smtp.remote-ip=141.14.17.11
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8920C606A31B;
	Tue,  3 Nov 2026 23:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8920C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=molgen.mpg.de header.i=@molgen.mpg.de header.a=rsa-sha256 header.s=20260906 header.b=ZIvBGXzs
Received: from handsomejack.molgen.mpg.de (handsomejack.molgen.mpg.de [141.14.17.248])
	by mx.molgen.mpg.de (Postfix) with ESMTP id 834FD4C2F3FFC8;
	Wed, 04 Nov 2026 00:51:19 +0100 (CET)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] usb: typec: ucsi: Do not report surplus partner altmodes as firmware bug
Date: Wed,  4 Nov 2026 00:47:44 +0100
Message-ID: <20261103234750.27510-1-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.54.0
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=molgen.mpg.de; s=20260906; 
	t=1793749879; 
	h=from:from:subject:date:message-id:mime-version:content-type:content-transfer-encoding; 
	bh=PywoGYHtYXzdkfVgZN+c7wT6tXLK+qOtUP+hmYI2/bE=; 
	b=ZIvBGXzsPHgJpWoFHzgQW++NNmNJC1z5bc/GXQmheABCG3DtzJPHe8vBXC8v+tLEWWi3MB91u1B3
	Nh+qv/+Lz4th8vC/U8nJg+Z/s3xa/YUHTp4a2ziz/6Yu9lZ3BnWY3H+DB2S/Wmx2IIYBroY3tZpTNj
	YE1PEmMCw6Y2yOMn/hP5hzX85NPZURU1depPxfUAgHLQBt53YUXIAb9TYDsncGl606qUshkvX3yQOB
	hYeWAm1grK3r5aXq9PM0Z+suEV397rrg9XCIZPJRkmhTPtP+oKlSiixxxdN4xaKOlKAw+PymnW9ac3
	fk9Dh2WPcSkW0niiZOyh6HwOQMbdqxgg==

On a Dell XPS 13 9370 (BIOS 1.21.0) with a Dell USB Type-C power adapter
connected, Linux 7.2.12 logs:

    ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x413c at offset 1, ignoring but please contact the BIOS vendor to fix this issue.
    ucsi_acpi USBC000:00: con2: VDO mismatch: 0x00000001 vs 0x00000002

The port advertises one altmode for the Dell SVID, and the partner two
Modes, with VDOs 0x00000001 and 0x00000002. Only the first one is
registered:

    /sys/class/typec/port1/port1.2/svid:413c
    /sys/class/typec/port1/port1.2/vdo:0x00000001
    /sys/class/typec/port1-partner/port1-partner.0/svid:413c
    /sys/class/typec/port1-partner/port1-partner.0/vdo:0x00000001

A partner supporting more Modes of an SVID than the port is valid. As
the typec class pairs partner altmodes with port altmodes by SVID only,
skipping the surplus altmode is correct, but the warning blames the BIOS
for a configuration that is not a bug at all.

Report only exact SVID and VDO repeats as firmware bugs, and log a
surplus partner altmode with a different VDO at debug level. Which
altmodes are skipped does not change.

This also drops the "VDO mismatch" message, which can no longer trigger
and printed con->partner_altmode[partner_count - 1]->vdo. That indexes
all partner altmodes with a per-SVID count, so with altmodes of other
SVIDs registered first, it printed the VDO of an unrelated altmode.

Fixes: 67c92c6419ea ("usb: typec: ucsi: Detect and skip duplicate altmodes from buggy firmware")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---

Notes:
    With this change, the Thunderbolt example from commit 67c92c6419ea
    (VDO 0x8087a043 vs 0x00000001) is only logged at debug level. If that
    case should stay visible, dev_info() is an alternative to dev_dbg().
    
    Tool use: Claude Code (claude-opus-5.5) traced the warning to commit
    67c92c6419ea, wrote the code change, and drafted the commit message from
    the dmesg and sysfs output of the affected system.

 drivers/usb/typec/ucsi/ucsi.c | 43 +++++++++++++++++------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 5aab8ab9f0132..7edcf9c877ba0 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -531,9 +531,7 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
 }
 
 static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
-					u8 recipient, u16 svid,
-					u32 existing_vdo, u32 new_vdo,
-					int offset)
+					u8 recipient, u16 svid, int offset)
 {
 	static const char * const recipient_names[] = {
 		[UCSI_RECIPIENT_CON]    = "port",
@@ -545,11 +543,6 @@ static void ucsi_dump_duplicate_altmode(struct ucsi_connector *con,
 	dev_warn(con->ucsi->dev,
 		 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring but please contact the BIOS vendor to fix this issue.\n",
 		 con->num, recipient_names[recipient], svid, offset);
-
-	if (existing_vdo != new_vdo)
-		dev_warn(con->ucsi->dev,
-			 "con%d: VDO mismatch: 0x%08x vs 0x%08x\n",
-			 con->num, existing_vdo, new_vdo);
 }
 
 /* Count altmodes in @altmodes that advertise @svid. */
@@ -590,8 +583,9 @@ static int ucsi_altmode_count_svid(struct typec_altmode **altmodes, u16 svid)
  *     SVID X as the authoritative cap and reject any partner altmode that
  *     would exceed it. This preserves legitimate multi-Mode partner
  *     altmodes (e.g. vendor SVIDs that the port really does advertise
- *     twice) while filtering the firmware-generated duplicates that have
- *     no port counterpart.
+ *     twice). Only an exact SVID+VDO repeat is reported as a firmware
+ *     bug: a partner may legitimately support more Modes of an SVID than
+ *     the port, so a surplus altmode with a different VDO is just skipped.
  */
 static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
 				      const struct ucsi_altmode *alt_batch, int batch_idx,
@@ -605,7 +599,7 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
 	for (k = 0; k < batch_idx; k++) {
 		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
 			ucsi_dump_duplicate_altmode(con, recipient, svid,
-						    vdo, vdo, offset);
+						    offset);
 			return true;
 		}
 	}
@@ -620,13 +614,10 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
 		port_count = ucsi_altmode_count_svid(con->port_altmode, svid);
 		partner_count = ucsi_altmode_count_svid(con->partner_altmode,
 							svid);
-		if (port_count && partner_count >= port_count) {
-			ucsi_dump_duplicate_altmode(con, recipient, svid,
-						    con->partner_altmode[partner_count - 1]->vdo,
-						    vdo, offset);
-			return true;
-		}
-		return false;
+		if (!port_count || partner_count < port_count)
+			return false;
+		altmodes = con->partner_altmode;
+		break;
 	case UCSI_RECIPIENT_CON:
 		altmodes = con->port_altmode;
 		break;
@@ -637,7 +628,7 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
 		return false;
 	}
 
-	/* CON and SOP_P: drop only exact SVID+VDO duplicates. */
+	/* Report exact SVID+VDO duplicates as firmware bugs. */
 	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
 		if (!altmodes[k])
 			break;
@@ -645,12 +636,20 @@ static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
 		if (altmodes[k]->svid != svid || altmodes[k]->vdo != vdo)
 			continue;
 
-		ucsi_dump_duplicate_altmode(con, recipient, svid,
-					    altmodes[k]->vdo, vdo, offset);
+		ucsi_dump_duplicate_altmode(con, recipient, svid, offset);
 		return true;
 	}
 
-	return false;
+	/* CON and SOP_P: anything else is a distinct altmode. */
+	if (recipient != UCSI_RECIPIENT_SOP)
+		return false;
+
+	/* SOP: a further Mode of the SVID, but no port altmode to pair with. */
+	dev_dbg(con->ucsi->dev,
+		"con%d: partner altmode SVID 0x%04x VDO 0x%08x at offset %d exceeds the %d port altmode(s), ignoring\n",
+		con->num, svid, vdo, offset, port_count);
+
+	return true;
 }
 
 static int
-- 
2.54.0

