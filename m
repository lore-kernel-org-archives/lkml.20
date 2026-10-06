Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD503CF685;
	Tue,  6 Oct 2026 08:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791274010; cv=none; b=p3gYz2qfXgKiWzaH4DzPmNfK+bBbrNYfXy+X2jCojPQgqs07wjvxjCIlrjI+hDOoufbHztBdpBhOrzLwhL6MNOOt01dvFUFExCL6wLu89JTn01f9TA+D2m2kbnEpT6FCSqleyn9rm+ReKebY8kc83FBFuVxeLyUilGm3iHP0Qgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791274010; c=relaxed/simple;
	bh=JYTOBm82xf1J/CQv9c2wjUeFtchT6u7rlec8hH7KZyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dktnQim4q6VXXuI63gqgsIBIe6OjZzK9oLqSGKosO+ML5rFAqPfclEoYzVmji+xVDuug4Qh4XNnNHN2kaqoisSfNU8bVMwGmjlQmQzY4GuFKMrgBOsZ9jwDc1p5vvksD2iIFvyDSBuLxAVLw/1/AEepgZGsqsBwnBn4/TcgCzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LvUw1MC8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LvUw1MC8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 562FEC4AF13;
	Tue,  6 Oct 2026 08:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791274010;
	bh=JYTOBm82xf1J/CQv9c2wjUeFtchT6u7rlec8hH7KZyg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=LvUw1MC8+aWSlHpmFdm9vp5jkMieQ34+abpLQE22q3wW+LzubosQTdNz8y83qFsBk
	 o66nzkGeTSt8txAeN6k02ha84tq8ktyd+Y/DAeE0eORJ6ARZ6vTTaRV4/3Arh7Q5BZ
	 wdOnqucNmxHOh4it0awBBt0qwngtxHNnwwldOpJWdYgMwM+n/N26hLAqAIw+97fyQq
	 myiTZwxdRWM1Zgf9L0xkcU4D5+lZmg38NRlrb0P7itFB0F0wi+5NqZ36qjLvenIp1S
	 A85GB2erqxCZGw7aJp6J2SGuiJahGhxmZfiG/sJALFT/7p8UchA4EoyDYHsnl8aflt
	 I9Jcko/m2iROw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BB9CA5FFC;
	Tue,  6 Oct 2026 08:06:50 +0000 (UTC)
From: Hans van Essen via B4 Relay <devnull+hans.kilurion.com@kernel.org>
Date: Tue, 06 Oct 2026 10:06:43 +0200
Subject: [PATCH] thunderbolt: Keep Meteor Lake host routers powered in DP
 redrive mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-tb-mtl-redrive-v1-1-5ec921114c37@kilurion.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBG4auQWTNJKdikXsWwsPCjYxTNtBISw
 t0psPwW7y0UoYJI12IhxSRRvmNGVRbUPe/jAyx9NlljXWWM4xT4k96s6FUmcO0CPLz1vrlQjn6
 KQeZjeGtPx394oUv7hdZ1A9/FhDFyAAAA
X-Change-ID: 20261006-tb-mtl-redrive-36be9e929945
To: Mika Westerberg <westeri@kernel.org>
Cc: Andreas Noever <andreas.noever@gmail.com>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hans van Essen <hans@kilurion.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791274009; l=2551;
 i=hans@kilurion.com; s=20261006; h=from:subject:message-id;
 bh=EqVI84jrNriCfmc4DxSSo78uh9LcZ/nE5LXz5NQilu4=;
 b=FkAOp1JcDaLEmGeafHFUpFTMSSY32is3iUXDygUiBtcc+o5aSMU3eKY+dEWoZeaAJzGQCX4PI
 2G0R7Eqbo+ZC5SyquXwTvE9Cw8bM1pmoxHGN9Z8mmCmgKucutxSQDxR
X-Developer-Key: i=hans@kilurion.com; a=ed25519;
 pk=1Qqd7FQOGBgV4kpJP4kZLbjH4wFg7+EdQaxwe+dr7Bs=
X-Endpoint-Received: by B4 Relay for hans@kilurion.com/20261006 with
 auth_id=1123
X-Original-From: Hans van Essen <hans@kilurion.com>
Reply-To: hans@kilurion.com

From: Hans van Essen <hans@kilurion.com>

When a DisplayPort Alt Mode (non-Thunderbolt) dock is connected to the
USB4 port of an Arrow Lake-H system with the integrated Meteor Lake-P
host router (8086:7ec2), the USB functions of the dock work but the DP
AUX transfers time out and no monitor is detected. It only works if the
port was used with a Thunderbolt dock before and the system was not
powered off in between; suspend and warm reboot keep it working.

The Barlow Ridge host routers already have QUIRK_KEEP_POWER_IN_DP_REDRIVE
so that the host router does not enter runtime suspend while the USB4
port is in DP redrive mode. Apply the same quirk to the integrated
Meteor Lake host routers. With this the driver logs "enter redrive mode,
keeping powered" when the dock is plugged in and the monitors come up
after a cold boot.

Tested on an ASUS ROG Zephyrus G16 (GU605CW) with a Lenovo ThinkPad
USB-C Dock (40AY).

Signed-off-by: Hans van Essen <hans@kilurion.com>
---
Single patch; adds the Meteor Lake (also used by Arrow Lake) integrated
host routers to the existing Barlow Ridge redrive runtime PM quirk.
---
 drivers/thunderbolt/quirks.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 96b7fe0..770e6f9 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -103,13 +103,19 @@ static const struct tb_quirk tb_quirks[] = {
 	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HUB_80G_BRIDGE, 0x01ea, 0x83b5,
 		  quirk_clx_disable },
 	/*
-	 * Block Runtime PM in DP redrive mode for Intel Barlow Ridge host
-	 * controllers.
+	 * Block Runtime PM in DP redrive mode for Intel Barlow Ridge and
+	 * Meteor Lake (also Arrow Lake) host controllers.
 	 */
 	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_80G_NHI, 0x0000, 0x0000,
 		  quirk_block_rpm_in_redrive },
 	{ 0x8087, PCI_DEVICE_ID_INTEL_BARLOW_RIDGE_HOST_40G_NHI, 0x0000, 0x0000,
 		  quirk_block_rpm_in_redrive },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_MTL_M_NHI0, 0x0000, 0x0000,
+		  quirk_block_rpm_in_redrive },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_MTL_P_NHI0, 0x0000, 0x0000,
+		  quirk_block_rpm_in_redrive },
+	{ 0x8087, PCI_DEVICE_ID_INTEL_MTL_P_NHI1, 0x0000, 0x0000,
+		  quirk_block_rpm_in_redrive },
 	/*
 	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
 	 */

---
base-commit: 74957ec2a70c08fd3ddc5ca251aaf3c3a81c82d4
change-id: 20261006-tb-mtl-redrive-36be9e929945

Best regards,
--  
Hans van Essen <hans@kilurion.com>


