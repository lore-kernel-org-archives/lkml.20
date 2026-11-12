Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449911;
	b=Rda4ErifzOBSJBNWcjMRbvMh+V2BP6xEcxIJ+MFYYsAAVSs9/hUuk/MC+Pdl9eJsDfLr
	 8eFoOXNA0s6nIj+PeNmhFGW2TTmpW3n3WT24c/HjQV/+i/39hGCVpT3ridvdtu4ykg4ag
	 nOzhpDXUhaxK8WtKlc8B0h1THkOEsevgF9NUGHFC3shgkLYImPHQk3PynNxKqPlXf7vhL
	 AHE3kUjbv0ZgzKUTOHUF9xHy/ltuxNTN7RGZ4Qod+Qm/NHMD7AuwFDd3lwxxcRN+fM3Iv
	 YeK43oKutv0U6Vk/UCFK9UbLWncj4cBqcotFHwJt2jGZjm5Kh3YOybR54zPGVicJn7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449911;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2EhXVjmJ93wNlqrQ6N4F3pddlf9oxCctxxqON2Q9SIA=;
	b=isKaQwqY227fVKzfVCIVqyM1ye+Z7o+goJxdFJ11ZuR0hukqq+ugi8VT27swy9QgBQuj
	 UIlxC7n5JoLqWzFj0WFBPph0IjCibUeo6LbiSxzL8qTghvViCL6Quw2ng0HYlqjXL+MpK
	 12Mez6GBh3HfyGHjpXWb5nNqzN8ZvLvsgXDTn4ct66SSpCHK7Jusz75vqD///XHtgcEt7
	 WjQPeEsb2I0ndX9kbglRyeaRKn/IlS+lrxqLlZqqAU8kqQwM8B6skrFpLNvj49PVGM6Yi
	 RIQCXYDpCTHWrNRQ1EZZyVrmfcSsf26t8pL/Li2qZGeldx3M9DuetNaO0NDLJLAtK3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="GSFDs8w/";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED7C606A31C;
	Thu, 12 Nov 2026 02:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ED7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=GSFDs8w/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=GSFDs8w/hYulX9Wy6qz9A45I/9MqWVtAGnZOC/5u0rxGFKt8LdFvNDuuPabELQrqZcr3/KTuqs4kk
	 eWlzmxdq/dl3KlP+i7rqzcohI65s5c+9UORqX6bD9Q9tp2UhdM8hvtz5m5s/GsjX7SFEUnd8dXBeWc
	 TZlmAO7JrUqOZkxw=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46af521f42a3-7c25e;
	Thu, 12 Nov 2026 10:18:28 +0800 (CST)
X-RM-TRANSID:2ee46af521f42a3-7c25e
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46af521f3b2a-eee1b;
	Thu, 12 Nov 2026 10:18:28 +0800 (CST)
X-RM-TRANSID:2ee46af521f3b2a-eee1b
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] soundwire: mipi_disco: Put fwnode on property array read errors
Date: Thu, 12 Nov 2026 10:18:27 +0800
Message-ID: <20261112021827.1835-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

sdw_master_read_prop() and sdw_slave_read_dpn() take a fwnode
reference with device_get_named_child_node() and already release it
on the -ENOMEM and success paths.  However, the error paths added for
the property array reads jump straight out without dropping the
reference, leaking it on every failed read.

Release the reference on those error paths as well, matching the
existing -ENOMEM handling in the same functions.

Fixes: a489afc105ed ("soundwire: mipi_disco: add error handling for property array read")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/soundwire/mipi_disco.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/soundwire/mipi_disco.c b/drivers/soundwire/mipi_disco.c
index 259ad98b5..65f8a41e6 100644
--- a/drivers/soundwire/mipi_disco.c
+++ b/drivers/soundwire/mipi_disco.c
@@ -96,8 +96,10 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 		ret = fwnode_property_read_u32_array(link,
 				"mipi-sdw-clock-frequencies-supported",
 				prop->clk_freq, prop->num_clk_freq);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(link);
 			return ret;
+		}
 	}
 
 	/*
@@ -132,8 +134,10 @@ int sdw_master_read_prop(struct sdw_bus *bus)
 					       scales_prop,
 					       prop->clk_gears,
 					       prop->num_clk_gears);
-		if (ret < 0)
+		if (ret < 0) {
+			fwnode_handle_put(link);
 			return ret;
+		}
 	}
 
 	fwnode_property_read_u32(link, "mipi-sdw-default-frame-rate",
@@ -262,8 +266,10 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			ret = fwnode_property_read_u32_array(node,
 					"mipi-sdw-port-wordlength-configs",
 					dpn[i].words, dpn[i].num_words);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		fwnode_property_read_u32(node, "mipi-sdw-data-port-type",
@@ -305,8 +311,10 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			ret = fwnode_property_read_u32_array(node,
 					"mipi-sdw-channel-number-list",
 					dpn[i].channels, dpn[i].num_channels);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		nval = fwnode_property_count_u32(node, "mipi-sdw-channel-combination-list");
@@ -325,8 +333,10 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 					"mipi-sdw-channel-combination-list",
 					dpn[i].ch_combinations,
 					dpn[i].num_ch_combinations);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		fwnode_property_read_u32(node,
@@ -347,14 +357,18 @@ static int sdw_slave_read_dpn(struct sdw_slave *slave,
 			dpn[i].lane_list = devm_kcalloc(&slave->dev,
 							dpn[i].num_lanes, sizeof(*dpn[i].lane_list),
 							GFP_KERNEL);
-			if (!dpn[i].lane_list)
+			if (!dpn[i].lane_list) {
+				fwnode_handle_put(node);
 				return -ENOMEM;
+			}
 
 			ret = fwnode_property_read_u32_array(node,
 						       "mipi-sdw-lane-list",
 						       dpn[i].lane_list, dpn[i].num_lanes);
-			if (ret < 0)
+			if (ret < 0) {
+				fwnode_handle_put(node);
 				return ret;
+			}
 		}
 
 		fwnode_handle_put(node);
-- 
2.50.1.windows.1



