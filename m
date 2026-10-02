Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D3046D57E;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790931473; cv=none; b=Z7UX/nslG9DbZBJ+yKmjEb+Z6WC41B3C0dEOOyfyLbZ79BhzfQ8sGA56cU1EpwmzwJLR/usoGAWbf+JVEZVvhuTxcajiMSjlugXPvLgrZsv7uA2Jf131IJqsugVpdyofxu8hNwQpCEYW/EMM9aK2QhBgpUUKGwjB4Uqs1xKjIv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790931473; c=relaxed/simple;
	bh=y78pXzHx7s/2mnuT3SBqsj9uW10BqgFNJtwiAfWIDH8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NXcFD0gE5SG/zjz6QgzoL0O+EaOp4hkgzOFaElLviNLa2CJzaYwAT82Rd2meSz1NWTNV8Smq0HdqqsQOdgsaIxxGtJepiYizD6Nw6LhC+CF11NhUCyG6Sb5fIvCjg5IlDVAzYTGj7qjQT/SE5Z8KJXThIiEIS2qGFR1oGL/NuuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rx8TEAxJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rx8TEAxJ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB5E8C4AF16;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790931472;
	bh=y78pXzHx7s/2mnuT3SBqsj9uW10BqgFNJtwiAfWIDH8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Rx8TEAxJQL0pr/1KJy06eCzt3HEtKH5ah4PdraGP+WsgO6AqVPSM+uuk4FI09e6g5
	 JQIyfSfBGf4HK2prNFn+sr2QNYH7ZNUs1znoBwDd8vIQxAWMZafAYsBwI7VrraWLgd
	 3QjHOZ8eW50MmjB1gDMAsKLk0w/cibn5MalzqwDxnPePYY5my6fSkneBrSLvnVNWdo
	 pr/pzSkC55KqyDPVL+8yuGjSXrjEuQ+6HzZxSkP91lLYMKihsr1f/Pl7fBgo9W1t5e
	 oaxNWhCOlu4173XWo1VSIuc3slqjcoMDP3z3GPU/8/lyVt/yBCZU7mQEVGIOFH7R4h
	 TUJqBYZou29Eg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6AACA5FE3;
	Fri,  2 Oct 2026 08:57:52 +0000 (UTC)
From: Maurizio Casciano via B4 Relay <devnull+mauriziocasciano7.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 10:57:47 +0200
Subject: [PATCH v10 09/15] media: intel: ipu-bridge: select OV2740
 frequency by IPU ID
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-submission-media-yogabook-v10-b4-final-v10-9-817ec765b257@gmail.com>
References: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
In-Reply-To: <20261002-submission-media-yogabook-v10-b4-final-v10-0-817ec765b257@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Nicholas Roth <nicholas@rothemail.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Bingbu Cao <bingbu.cao@amd.com>, 
 Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790931470; l=1755;
 i=mauriziocasciano7@gmail.com; s=yogabook-kernel-20261002;
 h=from:subject:message-id;
 bh=ue/b0XTG/PvSekybROAgfBd9qT5GItC9FQ1t+m15SPs=;
 b=UtaMLLCfyxOYO2/6LBwCHX9XSiv3e9+RM6M8ch+dwP0NXrdovvniufucRoQDuxaw/F+UFhr8x
 /FAZlma5zjYDmgHUysGYMLgAmqUb333bqINEWj/Tks9SQc4Kn5LVDu8
X-Developer-Key: i=mauriziocasciano7@gmail.com; a=ed25519;
 pk=ODC2oSPBqt7ukC3AEDZNS7LIE21D8ke8TEHoNlxniNM=
X-Endpoint-Received: by B4 Relay for
 mauriziocasciano7@gmail.com/yogabook-kernel-20261002 with auth_id=1099
X-Original-From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reply-To: mauriziocasciano7@gmail.com

From: Maurizio Casciano <mauriziocasciano7@gmail.com>

The OV2740 connected to the Cherry Trail AtomISP uses a 288 MHz link,
while the generic OVTI2740 configuration uses 360 MHz.

Use the bridge's existing PCI-device matching mechanism to add a
Cherry Trail-specific OVTI2740 entry before the generic fallback. This
keeps the platform distinction in the bridge and avoids adding a second
per-sensor link-frequency override path.

Suggested-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM
---
 drivers/media/pci/intel/ipu-bridge.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 62852fe1a406..1a133194cbc0 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -21,6 +21,8 @@
 
 #define ADEV_DEV(adev) ACPI_PTR(&((adev)->dev))
 
+#define PCI_DEVICE_ID_INTEL_ATOMISP_CHT	0x22b8
+
 /*
  * 92335fcf-3203-4472-af93-7b4453ac29da
  *
@@ -58,6 +60,11 @@ static const u16 ipu6_ov5693_ncont_clk[] = {
 	0
 };
 
+static const u16 atomisp_cht_pci_ids[] = {
+	PCI_DEVICE_ID_INTEL_ATOMISP_CHT,
+	0
+};
+
 static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Himax HM1092 */
 	IPU_SENSOR_CONFIG("HIMX1092", 2, 180000000, 180480000),
@@ -112,6 +119,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG_MATCH_FL("OVTI2740", atomisp_cht_pci_ids, 0,
+				   1, 288000000),
 	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),

-- 
2.53.0


