Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F3B38F65D
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791781526; cv=none; b=hxPwnKJcKa+9pEY7olq8JphhqNhqhRQSop1AwXwN281VffJFZVIWFH7YEW75OhVZJ2NNp1NTE5iL1s7A3nA7+QGOfUjJ6QaCJZxCnrRdEXpTyU4i5j92mgH45SS8kMTda+2fdJz+VhFvIsgtbA3+P2Vs+M1QUbRnbsA7FHT6Ijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791781526; c=relaxed/simple;
	bh=T7WVX2ncYr90B++RzGQp+UrRcsqXEtcv3aeFok6+kxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=id9I9kGqxoAMcDQ7yiuD28563G96pKLE+lHufkhDIeVAQDIISogOfSg5lARHWsa4CgL10elhWnQTmmpmVlNw1yUNXS72EQ0waNKVgpBeMyPPnHWATpa9+ZRHKC4KMtBbuRxyPQOcH7bHNUIRisLtsHl4oUF51Ny7oRJPIhN0jEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8QXaREJ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8QXaREJ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1036509b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 22:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791781524; x=1792386324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x1/TFFMXMatlGVfhZWQ915qwF0fBea+Z9nVUmArfnys=;
        b=i8QXaREJWGDSGmgXfeyKeVIaJPR7GEATvSbgGoUB7KmJSPwqrFVJb81cTL/BQGu0FW
         u1LoKAmyORCJeat5LmD/pu1rEmLxMQvrHIuD6Qr24nfpSQqYG4I5cyRSpJXrTBd3XOdJ
         4OnMx8AU7S253OBLzbdZ4o+vILYZme40KOef4Si3jWic1+KqPCw1sKJzwGbCSkNPXV60
         OnJTtWaDn1SHYwJkLlZ7VqhuWD/pX75in+BueQBG9prOs8mXM81aIjzXpB5O+SpYx0BT
         ad3KyQL35HLH72CVq84lCAUbXZFN3Cmov3E0DxsxQku79wOabW8pGPABsKr+mU83+4h2
         NbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791781524; x=1792386324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x1/TFFMXMatlGVfhZWQ915qwF0fBea+Z9nVUmArfnys=;
        b=c12edl9KF9kpAZZImPExBPglT/knuWAvADVuxU7y/0Lve5IbqKUIjp1muqf2Ahm1Hi
         xcDsxgQj8v53CfyGVNHON/s5mpFjXH1I8KeYe+jpk0TLotEdVf24e3tck5ZyRZvwOdaI
         ZFMvW3sZdg+klYRjkeT3qhHcbfPmzlro4bhkIh8NUEfjcGE48VjcnMT1+WaOvpRmw1Z1
         knJKO5BZVXDmE8SOdLnElcqoPYDTI8Of4XAvotqOXp510Fxe1I9LWRK/ZztGhGWHpz7+
         mjmReeMDzaqDYwAVkDtzMtEyZRy822FUtyLcN8pzSLDT6oB7osPTV+CLtFYyLaSXiQLH
         AcLQ==
X-Forwarded-Encrypted: i=1; AKwUvByolB8sCh04Ti4mc/xTagnFpmsemy2hBaH/1bCTrOoNyaTyZncHoXtWWF9CY+wh/EOZDIjXpUbidltGO1I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9H7qvkGzvQqECg1naRWiPjatxCwzK3JhMFIFpOzYqUyfRxEIX
	7LVlXZ2yvr1GRA5tNQhgPYjiJP7kL+uV9WOpv34aJLHMFgGWrY5DQ0rx
X-Gm-Gg: AYBFou3U0XpOtMXh0YNj4quHZGTPULqn4HGQbKkxTri1wDtCWWlNxl1XPI8aLpj9qL9
	ggCno6UQNyHGUnWGHXBtA33tjAirmmr59flJw+YwgkkL0/Th4BSpTPLAEvN6B4LdEBECoW+xhGR
	QfI9crS9XetGJTW9NMg+EMA8/FbsJ9GseEt5rnchbTcyog7PJ5TFN1wMs1bmRP58jDJqtLE6MgN
	q+9QThX8DV3+umDjhUTb/VBn3J2wgP/Li1BmLRRKx8TDiG8e6bah2aZ9IHDJFQjMZ1Vsr1tsthe
	EQwbB9c4BvpvWh2t2ICCUtHtfJg83zivBSUd45eAtkNqVPe8ldJ9BrFMv+2QgmPvRa4CBL05qDj
	3rPjDZJ2elBMI/yHincyv89Y9mhZLsfJkAUno12UTulVS7q3OupBA9DfinA6wolhXT3WRst4lpN
	3i8uGpK3RbWvm34as1cW2Y9X/MS0+oAaHruWRnhEU+S51jJxtYkxZcpLHzUZzrJ3mhOq1CSrhkr
	qCWIGp2iwA=
X-Received: by 2002:a05:6a00:3d14:b0:881:e626:74ae with SMTP id d2e1a72fcca58-897c7cd6d35mr6843765b3a.41.1791781524452;
        Sun, 11 Oct 2026 22:05:24 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3106de6sm3593668b3a.14.2026.10.11.22.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:05:24 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Miri Korenblit <miriam.rachel.korenblit@intel.com>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Benjamin Berg <benjamin.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	Avraham Stern <avraham.stern@intel.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v3 0/2] wifi: iwlwifi: Fix GP2 to nanoseconds overflow on 32-bit
Date: Mon, 12 Oct 2026 13:05:14 +0800
Message-ID: <20261012050516.3803074-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

Both drivers multiply a u32 GP2 microsecond timestamp by NSEC_PER_USEC
without widening first.  On 32-bit the product truncates for any GP2
value above 4.295 s, and the truncated value is fed back into the
wraparound detector, which records a false GP2 wraparound and adds
about 71.6 minutes to every later PHC timestamp, cumulatively.

Six sites, three per driver:

  mvm/ptp.c   scale_update_gp2 in iwl_mvm_ptp_get_adj_time()
  mvm/ptp.c   gp2 in iwl_mvm_ptp_adjfine()
  mvm/rxmq.c  gp2_on_air_rise in iwl_mvm_rx_he()
  mld/ptp.c   scale_update_gp2 in iwl_mld_ptp_get_adj_time()
  mld/ptp.c   gp2 in iwl_mld_ptp_adjfine()
  mld/rx.c    gp2_on_air_rise in iwl_mld_rx_fill_status()

iwl_mvm_ptp_gettime() holds its GP2 read in a u64 and
iwl_mld_phc_get_crosstimestamp() casts, so those two are already right.

Changes since v2:

 - mvm: added scale_update_gp2 and the adjfine() site.  v2 only
   covered mvm/rxmq.c.
 - mld: added the iwl_mld_rx_fill_status() site.  v2 only covered
   mld/ptp.c while claiming parity with the mvm fix.  Reported by the
   netdev Sashiko review bot.
 - mld: iwl_mld_ptp_get_crosstimestamp() in the v2 changelog does not
   exist; the function is iwl_mld_phc_get_crosstimestamp().
 - both: state the wraparound consequence with the numbers.

No Cc: stable.  The affected intersection is 32-bit plus iwlwifi plus
PTP, so that call belongs to the maintainers.

v2: https://patch.msgid.link/20261001050103.860584-1-zhanxusheng@xiaomi.com

Zhan Xusheng (2):
  wifi: iwlwifi: mvm: Fix GP2 to nanoseconds overflow on 32-bit
  wifi: iwlwifi: mld: Fix GP2 to nanoseconds overflow on 32-bit

 drivers/net/wireless/intel/iwlwifi/mld/ptp.c  | 5 +++--
 drivers/net/wireless/intel/iwlwifi/mld/rx.c   | 2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/ptp.c  | 5 +++--
 drivers/net/wireless/intel/iwlwifi/mvm/rxmq.c | 4 +++-
 4 files changed, 10 insertions(+), 6 deletions(-)


base-commit: d6d3455d8751854e0d1820f14184682e23ac4475
-- 
2.43.0

