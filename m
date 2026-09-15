Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023E23F4DD0;
	Tue, 15 Sep 2026 13:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789478028; cv=none; b=X3V3Nh45LBlBxBVVr/4oV4V7MHiUod9Z47Nzg4/PEk2SV227NUbYJWEbd/9zTyTWFuO6a2/pu4HDIxsmMwojQQsAIlji1eOtWrvdvNIsyBGGjWptjluMT5fKq6W213bnfFgg6UhjBffb+Y3WeTEYQ1pxygA4LPNyp3/CBg7moAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789478028; c=relaxed/simple;
	bh=byas6azvYHTCZERk/vafvd8gjLFgeA6zisT+bW3iEik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YAMZ04Mz6v81/CXyECKhhCxdSN938qJ2oFXqFuRpzuEl+8HS8XBrvYjHeEAMR5AGWqQdKesMXveLaSF61XAl35Ar+oNIhKiuPjP94CDJFkRUzzSoyUYUbNuL6CSJasuio3aNSp+V2N1Zd+do5HO7J1uCnfbYv4keKGq8+JFzlx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFk/boQ9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFk/boQ9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789478027; x=1821014027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=byas6azvYHTCZERk/vafvd8gjLFgeA6zisT+bW3iEik=;
  b=lFk/boQ9c8h0eLp6FB6N5gueK0fEIy0xePaxWvszsr9FSoh7JfjiAzrY
   cv6gIRofAqBp+PUkLqRuniIwS+ZgJ8VefBcDurvhH9a8v9VEWu+XosEoP
   jsHSI3ePiw+Eb6zK/EMULdBItpiusPyusUTYFI57djgGG/MlU3clYlCdo
   nkLjbs1UMpvxNSV0z4jJQyVzoHdEUu/CdJkLnGdA9ZN3YnO47qCO/qavb
   CHFkZPnIu1lHM8K7DkVmKPJdy21e2g1nwNt3sI0G2wWRIyahozPrb33fw
   BwTgDpUqOWP0rBn53S8LWE5OAoKyXrH3S7ybyswuEcZHZBoMR6rupbMTj
   w==;
X-CSE-ConnectionGUID: xLmeJY9JTOKCLS3ka0eV+g==
X-CSE-MsgGUID: Ov3Niq1jRV2ZaWyzqQbCdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112608449"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112608449"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:47 -0700
X-CSE-ConnectionGUID: FX6OGsXGQKSoOpmGkSDflw==
X-CSE-MsgGUID: ixNK6jJwR8C1Y+ZZTQO2Cg==
X-ExtLoop1: 1
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 06:13:44 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH 3/3] ASoC: SOF: Intel: wait and verifies the presence of SoundWire peripherals
Date: Tue, 15 Sep 2026 21:13:27 +0800
Message-ID: <20260915131327.1783551-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
References: <20260915131327.1783551-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Wait and verifies the presence of SoundWire peripherals listed in the
ACPI table. This prevents the system from probing non-existent (ghost)
SoundWire devices.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sof/intel/hda.c | 47 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 4dbba9186b29..e1815bfe358b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1304,6 +1304,8 @@ static struct snd_soc_acpi_adr_device *find_acpi_adr_device(struct device *dev,
 	return adr_dev;
 }
 
+#define SDW_ENUM_TIMEOUT_MS 3000
+
 static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *pdata = sdev->pdata;
@@ -1313,7 +1315,9 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 	struct sdw_peripherals *peripherals;
 	struct snd_soc_acpi_mach *mach;
 	struct sof_intel_hda_dev *hdev;
+	struct sdw_slave *slave;
 	int link_index, link_num;
+	unsigned long time;
 	int amp_index = 1;
 	u32 link_mask = 0;
 	int i;
@@ -1415,14 +1419,53 @@ static struct snd_soc_acpi_mach *hda_sdw_machine_select(struct snd_sof_dev *sdev
 	if (!links)
 		return NULL;
 
+	/*
+	 * Recalculate the link_mask as a link will be empty if all peripherals on the link are
+	 * not enumerated
+	 */
+	link_mask = 0;
 	/* Generate snd_soc_acpi_link_adr struct for each peripheral reported by the ACPI table */
 	for (i = 0; i < peripherals->num_peripherals; i++) {
+		slave = peripherals->array[i];
+
+		if (!slave->bus->is_present)
+			continue;
+
+		if (link_mask & BIT(slave->bus->link_id)) {
+			/*
+			 * At least one peripheral is present on the link which means that this
+			 * link has already been enumerated
+			 */
+			goto skip_wait_link_enumeration;
+		}
+
+		if (sdw_show_ping_status(slave->bus, true) == 0) {
+			/* no peripherals attached on this link */
+			slave->bus->is_present = false;
+			continue;
+		}
+
+		time = wait_for_completion_timeout(&slave->bus->enumeration_complete,
+						   msecs_to_jiffies(SDW_ENUM_TIMEOUT_MS));
+		if (!time) {
+			dev_warn(slave->bus->dev, "No peripheral is present\n");
+			slave->bus->is_present = false;
+			continue;
+		}
+
+skip_wait_link_enumeration:
+		/* Check if the SoundWire peripheral is present */
+		if (!slave->dev_num_sticky) {
+			dev_warn(&slave->dev, "SoundWire peripheral is not present\n");
+			continue;
+		}
 		/* link_index = the number of used links below the current link */
-		link_index = hweight32(link_mask & (BIT(peripherals->array[i]->bus->link_id) - 1));
-		links[link_index].adr_d = find_acpi_adr_device(sdev->dev, peripherals->array[i],
+		link_index = hweight32(link_mask & (BIT(slave->bus->link_id) - 1));
+		links[link_index].adr_d = find_acpi_adr_device(sdev->dev, slave,
 							       &links[link_index], &amp_index);
 		if (!links[link_index].adr_d)
 			return NULL;
+		link_mask |= BIT(slave->bus->link_id);
 	}
 
 	mach->drv_name = "sof_sdw";
-- 
2.43.0

