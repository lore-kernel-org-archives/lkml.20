Received: from mta1.migadu.com (out-236.mta1.migadu.com [95.215.58.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA903EEAD7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790705834; cv=none; b=I6qevXQ4/rx82CporuTsOpM1EZUzOgbyXTDzoR6DrbAFpbuupMN1RSmt0A2vACoV2kjJnQBpmH2RA0z7YM/gikhEHNPVXZHAzLDaDqOUEeNUvsY+q+Y3PsFk4fxpiuZmSXigMmlWdsAz5GWOiFrgZZatQD48dPTj4qPXC3bN5NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790705834; c=relaxed/simple;
	bh=QCtA6it1d9y3JYN9hfWG5xcX9b6w2iQhbxavcPCtOGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D5VcUBUcQjefEk2WNvqkveEDcYNB6ujUpTk6eAso8mZo/2TOiDB6cfyZdoc1D0HHpwJGMiIrboXyHHCBCyr/W1ryGskHfDBACw0qTBLghO9ybxnXTbqV2d5G5FH+HZ656KKyq9o29ULZdUGXTxacqhrapFq95eeHRFuAGFrEtL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eXpE5T4f; arc=none smtp.client-ip=95.215.58.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eXpE5T4f"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QCtA6it1d9y3JYN9hfWG5xcX9b6w2iQhbxavcPCtOGE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790705830; v=1; x=1791310630;
 b=eXpE5T4fzfRmViDod7Nvder9qPoHvSkBONjrF772gH4z24MnggzW8Ad0yi4hGn/7uXASlAZD
 ixAXBMw5eyWwqY2ScVFFdED/aGcVJDIzcSqok3+9qrc0DxJnyg9a/Lk3m07kIk1fVpI0N/R5U/5
 CIEZcwx7GGm8DR9Q12D61/RQ=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 86cd8644d506ab5d;
	Tue, 29 Sep 2026 18:17:08 +0000
X-Mizu-Trace-ID: 86cd8644d506ab5d
X-Migadu-Flow: FLOW_OUT
From: Matthew Schwartz <matthew.schwartz@linux.dev>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Hans de Goede <hansg@kernel.org>,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH] platform/x86/amd/pmc: Add spurious_8042 to ASUS ROG Flow Z13 GZ302EA
Date: Tue, 29 Sep 2026 20:16:55 +0200
Message-ID: <20260929181655.26105-1-matthew.schwartz@linux.dev>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG Flow Z13 (GZ302EA/GZ302EAC) wakes up from suspend-to-idle
without any user input. With PM debug messages enabled, each unexpected
wakeup shows the EC raising IRQ1 at the same time as the ACPI SCI:

  PM: Triggering wakeup from IRQ 9
  PM: Triggering wakeup from IRQ 1
  ACPI: EC: Query(0xa3) started
  ACPI: PM: Wakeup after ACPI Notify sync

EC query 0xa3 only notifies the battery of a status change, which
happens when it transitions between Charging and Full while on AC.
The ACPI core correctly treats that as a non-wakeup event and cancels
the SCI wakeup, but the IRQ1 wakeup remains pending and resumes the
system. i8042 debugging confirms that the keyboard controller has no
data at that point ("Interrupt 1, without any data").

The detachable keyboard on this device is a USB device, so disabling
the i8042 wakeup source does not result in any functional loss. With
serio0 wakeup disabled, the same battery event is processed during
suspend-to-idle and the system stays asleep.

Add the spurious_8042 quirk for it. The GZ302EAC reports sys_vendor
"ASUS" while the GZ302EA reports "ASUSTeK COMPUTER INC.", so match on
"ASUS" and on the "GZ302EA" board name to cover both models.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/amd/pmc/pmc-quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/amd/pmc/pmc-quirks.c b/drivers/platform/x86/amd/pmc/pmc-quirks.c
index 09a30f333759..ff5c90510c0c 100644
--- a/drivers/platform/x86/amd/pmc/pmc-quirks.c
+++ b/drivers/platform/x86/amd/pmc/pmc-quirks.c
@@ -143,6 +143,14 @@ static const struct dmi_system_id fwbug_list[] = {
 			DMI_MATCH(DMI_BOARD_NAME, "RC73YA"),
 		}
 	},
+	{
+		.ident = "ASUS ROG Flow Z13 GZ302EA",
+		.driver_data = &quirk_spurious_8042,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "GZ302EA"),
+		}
+	},
 	/* https://bugzilla.kernel.org/show_bug.cgi?id=218024 */
 	{
 		.ident = "V14 G4 AMN",
-- 
2.55.0

