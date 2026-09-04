Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389F84562B1
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530587; cv=none; b=XNpJ17zjXeFThNKatDo7+rpFUTRbozI+I16ZrR+az0NN6oye8e9R4oALXmzn89fYr7AF/+kWsItohaE55TohyIPzIAE82gk6QQOwelE+7YlL4CSK4xMLXBVUge5ta/zaKYUeMtHEFCxwHQEg194bXiMSc1fJWkNMZQwOCBRM53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530587; c=relaxed/simple;
	bh=HRCHvj3A1dVi35v/41imcHy54X0mYEwDvbxLvpQVeqs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DSIPlN5Hh3CgNjf6lSJmjbKgtRo9DR7NmSxFLhzT8J4DHeNWOl9fQcPOejk7TKrF5SAMRvYa5nW4PZmmEChRWPbbC70Qpf1pIRpqGd8eiJjTA8cvMPzF/dJAQibR1ySIx4nns0I+m9LZtACZoJPaj9usrbzvWdNo5gLwp/M6PNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QV1bVXL3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QV1bVXL3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-383b4a3755fso941645a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788530585; x=1789135385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=02m0O5dEhv7OyAeRQz2TuyPEYJMZ28BVgDL71NGGvo4=;
        b=QV1bVXL3nP9AQ15qFRRLuCslqI1s5yeSxEzhvxR+lo65ONcoUUUozRmnVSXSA087CB
         B80SyTyW35FlihvTVZcGSGUo8UX20CjgP14KbwJSEgGTHuYuDgc1F9qp+cEEO6HZDN7f
         6YH27ktMFPS/mJm3pn8tl5hCqLQWUBw222IHebZNrwAeaqGgAJSO7el47Bvmp48aS5GI
         O0VWKKqdHVr1qjJYuY/4Pny4ajLzeW1kFXIs0cZib6WYue4QDtV7o9Z1qGihjMzHzzRb
         YeseTFGGaZm8Jbb1Rm31Tgg7iZ13k2XDgpJ1+89xRVYA7uDfPO7zeOj2h6wTD9gKdb7L
         bw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788530585; x=1789135385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=02m0O5dEhv7OyAeRQz2TuyPEYJMZ28BVgDL71NGGvo4=;
        b=AO7zZRW5irdpJ7uvIObBfqMpfPvFqSYfFGKIaGMLmIL5JJmpbrY4uBs4wb0jywtsn6
         axMFyJkfEpuN0rs2QOBTRGkBAQXXHPm9SBXtYLisZNdPmko5uJblVyEigWVhIvC3RpC/
         15czjABernrttqJMf5tgd2j7az4lxyT1eSCAGGdV/KzEtLwAXoYcAmHnMwhXCel5OBKd
         +dgdeXQXVn9gsSb4W02u9vG/Gs8kaGtxQVWHkkPo+KC42qusHwwxKjyADILLWoQ920gq
         HoGE2ZtCq0lAI2b2LhXJKfRWmKb1Cn6i2akz1PdvnLIhMFipmlm/PftTb2Frfm7Euxq3
         q7jQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMgukWpuRSMBRYWgaocZCuKVLHHdneUUfL17OOWJbEaMNU1VLRQf7+ZfnihHwLhucTPPMMiieioJnoQcc=@vger.kernel.org
X-Gm-Message-State: AFuF++kSNJy9SwXkprxfoBRnrDyKo5ox4sC+cVR96Hi+6sdX9mR2wLa0
	ombmu1dICYwfkpaw+xeOH+6ZKppIf4OAgMh6Ki1gTYTBNet9LsqDlGu6Y8/w4w==
X-Gm-Gg: AYBFou08mF+bcV8w09j5QhtVEzXDBnmV7qZhHhs2YB8S6lEMq66DDDIK/CMRNW2nzhY
	FyIE1Yx+bVJ3BNpcTbqmQslqi159FUPcZB0Bp09NgPTMQ6WVRpnF+8VWFdLSflyLc2Aw8dJmQY3
	6w061pUSZRt+BAV71aVjDmyLakm5UBZOnlSz/TYI4d6c9EUlR53RAUi7ELo8lPj9I/oTbmge2nj
	QQkANovRfYrvSzwFGPev7rhdu9WVd87/4PY589YCzEnD1sKedvQkJ6yWLdMfymydwkirhT71dXt
	O+ns5anVkr2v6PjeyOKET7OnfjjwwqNe048n+mrRBUHAVwp7T1B99hFWnFbroEbbrECMWYR9v7g
	u53/7n3HVsIIjQ7dCYKZazs4w93hB4xRGouqr49EULh3j4jXtaM2S7pYiyO+GfpUCEdLFOXGNt9
	elS0FMCWRIANWfRybpJdDnkkQKztlMbiwYZPpDYNDburbW2Q2S2KV0ueILq6SIBLrVG2WdSEfEj
	u/sWNpcoe46D4LkBMs6h/+S
X-Received: by 2002:a17:90b:4a8e:b0:398:bbe9:73af with SMTP id 98e67ed59e1d1-39b26107ab5mr8991224a91.7.1788530585161;
        Fri, 04 Sep 2026 07:03:05 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm11608907a91.12.2026.09.04.07.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 07:03:04 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless v2] wifi: mac80211_hwsim: send config events to the radio's net namespace
Date: Fri,  4 Sep 2026 22:03:00 +0800
Message-Id: <20260904140300.3402053-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hwsim_mcast_config_msg() falls back to genlmsg_multicast() when it has no
genl_info, and that only reaches init_net. A radio in another namespace
therefore has its DEL_RADIO announced in init_net, while its own namespace
hears nothing.

Multicast to wiphy_net() instead, the net that GET and DUMP already filter
on. Tested with a config-group listener in each namespace, on a base and a
patched kernel.

Assisted-by: Claude:claude-opus-5 codeql
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
v2: rewrote the commit message; dropped Fixes: and Cc: stable.
v1: https://lore.kernel.org/linux-wireless/20260809113908.2218030-1-maoyixie.tju@gmail.com/

 .../wireless/virtual/mac80211_hwsim_main.c    | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim_main.c b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
index 02b6d81cccd118..d77f54daefc519 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim_main.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim_main.c
@@ -4396,15 +4396,15 @@ struct hwsim_new_radio_params {
 	bool background_radar;
 };
 
-static void hwsim_mcast_config_msg(struct sk_buff *mcast_skb,
+static void hwsim_mcast_config_msg(struct sk_buff *mcast_skb, struct net *net,
 				   struct genl_info *info)
 {
 	if (info)
 		genl_notify(&hwsim_genl_family, mcast_skb, info,
 			    HWSIM_MCGRP_CONFIG, GFP_KERNEL);
 	else
-		genlmsg_multicast(&hwsim_genl_family, mcast_skb, 0,
-				  HWSIM_MCGRP_CONFIG, GFP_KERNEL);
+		genlmsg_multicast_netns(&hwsim_genl_family, net, mcast_skb, 0,
+					HWSIM_MCGRP_CONFIG, GFP_KERNEL);
 }
 
 static int append_radio_msg(struct sk_buff *skb, int id,
@@ -4488,7 +4488,8 @@ static int append_radio_msg(struct sk_buff *skb, int id,
 	return 0;
 }
 
-static void hwsim_mcast_new_radio(int id, struct genl_info *info,
+static void hwsim_mcast_new_radio(int id, struct net *net,
+				  struct genl_info *info,
 				  struct hwsim_new_radio_params *param)
 {
 	struct sk_buff *mcast_skb;
@@ -4508,7 +4509,7 @@ static void hwsim_mcast_new_radio(int id, struct genl_info *info,
 
 	genlmsg_end(mcast_skb, data);
 
-	hwsim_mcast_config_msg(mcast_skb, info);
+	hwsim_mcast_config_msg(mcast_skb, net, info);
 	return;
 
 out_err:
@@ -6190,7 +6191,7 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 	hwsim_radios_generation++;
 	spin_unlock_bh(&hwsim_radio_lock);
 
-	hwsim_mcast_new_radio(idx, info, param);
+	hwsim_mcast_new_radio(idx, wiphy_net(data->hw->wiphy), info, param);
 
 	return idx;
 
@@ -6208,7 +6209,7 @@ static int mac80211_hwsim_new_radio(struct genl_info *info,
 }
 
 static void hwsim_mcast_del_radio(int id, const char *hwname,
-				  struct genl_info *info)
+				  struct net *net, struct genl_info *info)
 {
 	struct sk_buff *skb;
 	void *data;
@@ -6234,7 +6235,7 @@ static void hwsim_mcast_del_radio(int id, const char *hwname,
 
 	genlmsg_end(skb, data);
 
-	hwsim_mcast_config_msg(skb, info);
+	hwsim_mcast_config_msg(skb, net, info);
 
 	return;
 
@@ -6246,7 +6247,7 @@ static void mac80211_hwsim_del_radio(struct mac80211_hwsim_data *data,
 				     const char *hwname,
 				     struct genl_info *info)
 {
-	hwsim_mcast_del_radio(data->idx, hwname, info);
+	hwsim_mcast_del_radio(data->idx, hwname, wiphy_net(data->hw->wiphy), info);
 	debugfs_remove_recursive(data->debugfs);
 	ieee80211_unregister_hw(data->hw);
 	device_release_driver(data->dev);
-- 
2.34.1

