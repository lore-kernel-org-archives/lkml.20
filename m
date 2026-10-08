Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348EC47F3A0;
	Thu,  8 Oct 2026 22:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791499290; cv=none; b=AOAJbD6m4zzQJOInWGRFZzynCkU2mcEvXV73d/21oewRq/oogIl+0xAD0wB3Fw6AillTaBMH7Gu1Z4kkSGiFCPKbgrBMGkuW3CUkbaMhkAb4mt86J76CL+Wo7cVy2DonPqpdMSjqCPko+ovEYSdfGSGmDxewTyFYlPJAFEJfU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791499290; c=relaxed/simple;
	bh=kY8lun+I6df2z89WNcQ2hOi7c1wes9jNAnRP0SsGzgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hTQaRj7ZbcKtu6FUjnFiyot7f0/se6fDIWYZbJdXJ6DKLrkdW/hIpVnfofYT8qS7a9viSMUfxMnTEekqF2eIHaI6ftB77IDwPQ9g+ahTmefmAjJV4bKlJgDHKSOi9YtUA8sMrBeitlZZApjdXoQy9pDVo4A+ehi8HvoaUpwE8sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oqfZbaxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oqfZbaxC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92679C2BCF5;
	Thu,  8 Oct 2026 22:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791499289;
	bh=kY8lun+I6df2z89WNcQ2hOi7c1wes9jNAnRP0SsGzgk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=oqfZbaxC78eLwSv2dhK1+41mEYge2R88Ykp7Qa4+hE9nKaso/BT9C5dALg5xPGc91
	 Gem7sl5nUul9TsIDS5zZhPgutn2zV45CuK16QlAypTa0+hfwTNUBhXL8iHrChVgDq0
	 anfsH+CGLKn9fCgJlqtDpIp8N6ctU/FJaTYIgk3G/lhKgA+D043mdt8pYjDDet8sQc
	 bgiswKduUwftgxh76WOtBuHvVxoTtcFHDDHngcKY9yRdL3HzSQxQnDi3LCXeISlX+K
	 L/+yoY5CZTt0dkNDGhWqmZLWnP3eahS16gOxx0pRGE/m+cq6ymsqkSnYI2GLfwVHFk
	 3IOxGT81JJGpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA2FCA6015;
	Thu,  8 Oct 2026 22:41:29 +0000 (UTC)
From: Aleksei Berezin via B4 Relay <devnull+8967858b87.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 02:41:19 +0400
Subject: [PATCH] usb: typec: ucsi: acpi: Add quirk for ASUS ROG Zephyrus
 Duo 16 GX650PI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-usb-next-v1-1-95a2288ad9b2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ5AMBCF4avIrDVpuyh1FbHQdjAWJR1EIu6uW
 H7J/94FjImQoSkuSHgQ0xIzVFmAn/o4oqCQDVpqo6S0YmcnIp6bsHWllPMmmFpDzteEA53fVdv
 95t3N6Ld3D/f9AGN/umRsAAAA
X-Change-ID: 20261009-usb-next-98711bc6d682
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Aleksei Berezin <8967858b87@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791499288; l=1846;
 i=8967858b87@gmail.com; s=20261008; h=from:subject:message-id;
 bh=ZUe/15qN0Mxppoewg6G+nswhtqP0+uFLTWd6xRy/srQ=;
 b=aFGDFPYr/q9xe/9xPwSfFaRdQg99nHoip7c4m6WlX0hbAwKQubuYB6n+t/UGnYeLj6fARomJb
 oE9OETqmDJZDEArjhlb/kBmG49xbG0nPBWUoXYm+DL6Kjzgf5GKM8z7
X-Developer-Key: i=8967858b87@gmail.com; a=ed25519;
 pk=njtzBWPS2xf9KvwkMcmThxWGBoNdXiBOrAswIsycbXg=
X-Endpoint-Received: by B4 Relay for 8967858b87@gmail.com/20261008 with
 auth_id=1137
X-Original-From: Aleksei Berezin <8967858b87@gmail.com>
Reply-To: 8967858b87@gmail.com

From: Aleksei Berezin <8967858b87@gmail.com>

On the ASUS ROG Zephyrus Duo 16 (GX650PI, BIOS GX650PI.314) the firmware
loads the EC-based variant of the AMD CPM UCSI SSDT ("CPMUCSI"). Its _DSM
read function only copies MESSAGE_IN and CCI from the EC into the shared
mailbox and never fills in the VERSION field. The only code that sets the
version (M31F) lives in the "UCSIPLT" SSDT of the I2C-based variant, which
is present in the firmware image but not loaded on this machine.

As a result ucsi_register() reads a zero version and the probe fails
silently with -ENODEV, so neither Type-C port is registered and no
typec, usb_power_delivery or ucsi-source-psy devices are created.

Reuse the existing zero-version workaround from the Acer Nitro ANV15-41
quirk and assume UCSI 1.2 on this machine. With this change both ports,
the PD partner and the UCSI power supplies are registered and report the
connected USB PD charger correctly.

Assisted-by: Claude Opus 5.5 iasl
Signed-off-by: Aleksei Berezin <8967858b87@gmail.com>
---
 drivers/usb/typec/ucsi/ucsi_acpi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c b/drivers/usb/typec/ucsi/ucsi_acpi.c
index 5697ccc24..c8e6efdba 100644
--- a/drivers/usb/typec/ucsi/ucsi_acpi.c
+++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
@@ -196,6 +196,13 @@ static const struct dmi_system_id ucsi_acpi_quirks[] = {
 		},
 		.driver_data = (void *)&ucsi_acer_ops,
 	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+			DMI_MATCH(DMI_BOARD_NAME, "GX650PI"),
+		},
+		.driver_data = (void *)&ucsi_acer_ops,
+	},
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LG Electronics"),

---
base-commit: 42bcac323cc3b16566fed8c5b250318ad02a0de0
change-id: 20261009-usb-next-98711bc6d682

Best regards,
--  
Aleksei Berezin <8967858b87@gmail.com>


