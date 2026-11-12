Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794463788;
	b=BdjFkEn6q/tCvm7RexNbEPXu18Or8ryoF7jylEQzXmp8bILArEJ4TZ2zz3x1txJXJ022
	 M72QjsMf+tK15zLH0t4Pk7fO371HjLCvOoSmSSM5pX4z5USCWV+g7WI/ObupgFsTOjiJf
	 hq4qzn9YpV22cHH26dRQgT/EApGsaXJy8ANuMTsrjcwkcDWTaDHR3vGOFjv2BiIOeuWKb
	 DaX0qG0v0eKSL8gSfsPXioNgs1AIm3WT8PkvCRqblJG6JIb0NozIr6lJ44lglkVQuNzKd
	 88R2Q3t/riUIxrZrSVNImXKVO/QcVMJBqEaX3v7dq8WXOjQFVjdR137XLMZEQaxJlNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794463788;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QegnHOVCQQW8xmm91W7f7yhk5Ynl+/Lq21GOFV5KI54=;
	b=NC49MCxDl8Z72mMydrGewxhbt/ZKYxR5d75+b28NHRsn+fCZaENAC0hWnIhAzT/XQIC4
	 J4rK+adjre8X2PH9TR0eIvqO0z9OqqQeOjtN7UcmNfjpDzCo1FJaXxuKyk22GjJb1FnTs
	 E08L9zG4dosUdSfeQhaBylQA1vel74kALG2UB8jrLZk6TeMVMSo8hgizh4OOv+PhX2qyE
	 scH9iz3NTnGri9os0+qRGpEfTRlLEc1EpzlOgi+YEHIs6YdUPxGBbQtX5B1utnJ26EqKL
	 c0FBk4TNoj0oJ/Syw/VgIYEaSsSOQ0Rptjv2asEoctAS2ZlMXzJWvFpP5EU4k2LrRrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KcD6ihXE;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DDB606A324;
	Thu, 12 Nov 2026 06:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DDB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=KcD6ihXE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=KcD6ihXEUQY8BX0JOD60Eylbgh2PvkFZ/xn0v0mqNKGerQZmffmx9UvDfM6f3UEzhqBVWFNR/mfhE
	 CT9HgI5zoz2Vy38Q1hR0MytKZExRIVpBS4PPCLJmJNowsOOzCa7AMZ9valQNZ3mi4dvqOOrb5HylFu
	 0YbSaBErXMbBeiJM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af5582126f-aafb7;
	Thu, 12 Nov 2026 14:09:44 +0800 (CST)
X-RM-TRANSID:2ee66af5582126f-aafb7
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96af55826aaa-f4fb1;
	Thu, 12 Nov 2026 14:09:44 +0800 (CST)
X-RM-TRANSID:2ee96af55826aaa-f4fb1
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH v2] soundwire: mipi_disco: Put fwnode on property array read errors
Date: Thu, 12 Nov 2026 14:09:42 +0800
Message-ID: <20261112060943.1916-1-laixiangwu@cmss.chinamobile.com>
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
on the -ENOMEM and success paths.  However, the error paths added
for the property array reads jump straight out without dropping the
reference, leaking it on every failed read.  The lane-list support
in sdw_slave_read_dpn() is even missing the put on its -ENOMEM path,
unlike the other array allocations in the same function.

Release the reference on those error paths as well, matching the
existing -ENOMEM handling in the same functions.

Fixes: a489afc105ed ("soundwire: mipi-disco: add error handling for property array read")
Fixes: 71b405b18444 ("soundwire: mipi-disco: add support for DP0/DPn 'lane-list' property")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
Changes in v2:

- Fix the subject of the first Fixes tag to match the commit title
  ("mipi-disco" instead of "mipi_disco") and add a second Fixes tag
  for the lane-list error paths, which were introduced by a different
  commit and also cover the missing put on the lane-list -ENOMEM
  path (suggested by Sashiko AI review).
- Note: an earlier attempt to fix these leaks using __free() was
  posted in 2024 but never merged:
  https://lore.kernel.org/all/20241019-mipi_disco-of_node_put-v1-1-1de27e6852c4@gmail.com/

Link: https://lore.kernel.org/all/20261112021827.1835-1-laixiangwu@cmss.chinamobile.com
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



