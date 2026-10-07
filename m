Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56593932DB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 20:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404325; cv=none; b=fi67TdbNCklTR7kpaV01nVTb/1muBkrH/zY5Pnd7WeB7I+kzHf16oS2zWQriVUroO+4Qrx1QXt/JNZPmMwK4uidQKKwCs6Bog57k07b616NMaag5Jn7xRkhfrwSRPr1fW0+pejOtBgvtnC/h+/OZJPYrrJPbUUxXt3F/FeDgR3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404325; c=relaxed/simple;
	bh=aq0AMSyhxQLdXuPHgvAFBRB0ypmluL2Ow3NcbByDnYs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MeaAg6UET0czlLk2wo6/LkHe5zC1LPGcyj8D27qYlfO6f7muHpvJKWrAHtaNDWYxt5V70PlyA5/uejyfHqoz3ob459phk9kng1c92dtlcZTXffoDzYejqUQ6AoE0o8+hna+K/Plt7Z6/OBEI7gQOxtRYYbP0mfxdBeT4rUMsUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fPOJ4isa; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fPOJ4isa"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381b831d535so4487766a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 13:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791404323; x=1792009123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4ajd1qKUyYuUsNFBJ1eWwssuwOD2W4HQfyS01t4xII=;
        b=fPOJ4isacEdwIMVw/FUu+UYcftTvtgrxjxNeq/MT+GIkL7dtgVikOimUhXxq3eAKa0
         dGVkOPWqJcNcBNKLME6GO4+lXFNtelywA8/B7jusZ2cIYwOJcI69uf5KlfAdgwTsQuS9
         +G61CzRgnjWoBt87CQ2FQPgkSYt2wo4fmvtofZXeWMkXVnPsmR4fVOoOubJxt4bNS7pa
         Uq6t4dZMEUkrP1nMW4ANgFYKjLyih8LJ4Cmw0XZBD2tcC6ZYsbneDz7jJluhvWgmhaXK
         +5iuEH6btJx3vZlK9Kbzki0tjxvb6xjLb9qSnNKiY0QcjLHleB4AHPoFPgcybleilXUL
         gt9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791404323; x=1792009123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O4ajd1qKUyYuUsNFBJ1eWwssuwOD2W4HQfyS01t4xII=;
        b=KBnk+VgNOug+g0wSzWKlqQsV1JtIulAdEe7sLxWydLsU8LY7ayF90C1S0VBheMxOsV
         M+CBXLfXMhxAV2MMzIYfAGe+lBd6mCnui/73Jw/EbbDhKlxTZr6Dw11s9AsFULsNpV+1
         4JNSckL3rPpon9Caze5cD7WYGAbiWFTfwqa5fDFTWFjjYwpjGpjCHuI9ilm6IImGW6vC
         sTDzoOtnMNZFvGkPHzdoA0N+8M0XmyBpGQejmLt+bJHuxJWGsz97O5DxopudyWZca6bR
         DujnzgKcQFtqNpJS4AASv3W8iDfFy5pQxV4G/unWyLuXYNW1t6ObvBsvRoNpHT6MnrlO
         VykQ==
X-Forwarded-Encrypted: i=1; AKwUvBwE+hNFc7XZRk+o22USQiVfqE7b/8u90aEMwoRGb7bIqpGT0GygGEse/qN5zCUzrTt58oTKz//CY5hGCEI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKohwSbEvhUVSjn/tXaa83ZCYXkrxtN6xtiWsgIXN1YZTqSVLP9
	S3ZoPBFRlDLmyxGzDanmVo/RWFA6zqRfOxS8ut8qJNvQHvcW2eu1Hqe9
X-Gm-Gg: AYBFou2SjdQ39dHxRI2nW7tgs0+s01U6dN1X2eF9s7G3Ng20v8r+l82k37maoyWBxGN
	T6c6Z5ALRc3Tcgesfe8OgxPEJVvWJ/kHSfMSWJ3LvxlaUZlscosEVrrOmRAO4yS1ql3VwbBjG6m
	m1N5UHh/lrMDE0hH6zRithQGAo5rQD/Bnf5HgZs5Ui+Aqo3ofufBqGofHwY8akwPhOuUgW661aZ
	REZjD7RFsEWEJY0zVpdRZS6bQhbwJu85QiXyHzvZqWAtCzPCMTsBrHtRccm7+2kovRUOK+CWMip
	8ZvSoSV8DP1J58f/CJjfQOHes5st0xQJjxZ7MaywThBKi8uNpxsARxB07MO40FrIEVs1PCcqFvC
	0CEHUZZxCoeB3Ip6yYsK0oUGkjS5jgqzUtrsfP5XNZ+wn6fJiTbBlIY0LQ3/hk8w7Ghj8zoA2S2
	LiNw5rRNG6q9VkJ0j4sylOL+sFJH1tGbmNlp4mBOlvOE59Wekv/dCuVUFg2HA12cXMqUWF8BPTA
	Ndaewdvnf3k+GBHTm+mDUjo/FST+sIRlTlXQdRErwDBJ/W/8muCwHW2+0QLerIF8BnkYpf8USr2
	8ZtqWGNf0vKsFA==
X-Received: by 2002:a17:90b:1344:b0:3a8:7bbc:3f3e with SMTP id 98e67ed59e1d1-3a8a1b0071cmr3203301a91.41.1791404323214;
        Wed, 07 Oct 2026 13:18:43 -0700 (PDT)
Received: from 4470NRD-ASU.ssi.samsung.com (c-24-19-224-150.hsd1.wa.comcast.net. [24.19.224.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9ff7ab034sm967623a91.4.2026.10.07.13.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 13:18:42 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Williams <djbw@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Ira Weiny <iweiny@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Fan Ni <nifan.cxl@gmail.com>,
	Li Ming <ming.li@zohomail.com>,
	Benjamin Cheatham <benjamin.cheatham@amd.com>,
	Gregory Price <gourry@gourry.net>,
	Richard Cheng <icheng@nvidia.com>,
	Anisa Su <anisa.su@samsung.com>
Subject: [PATCH v15 5/8] cxl/pci: Factor out interrupt policy check
Date: Wed,  7 Oct 2026 13:16:38 -0700
Message-ID: <20261007201828.952-6-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007201828.952-1-anisa.su@samsung.com>
References: <20261007201828.952-1-anisa.su@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ira Weiny <iweiny@kernel.org>

Dynamic Capacity Devices (DCD) require event interrupts to process
memory addition or removal.  BIOS may have control over non-DCD event
processing.  DCD interrupt configuration needs to be separate from
memory event interrupt configuration.

Factor out check for firmware ownership of memory event logs.

Link: https://lore.kernel.org/all/663922b475e50_d54d72945b@dwillia2-xfh.jf.intel.com.notmuch/ [1]
Suggested-by: Dan Williams <djbw@kernel.org>
Signed-off-by: Ira Weiny <iweiny@kernel.org>
Signed-off-by: Anisa Su <anisa.su@samsung.com>
Reviewed-by: Dave Jiang <dave.jiang@intel.com>
Reviewed-by: Jonathan Cameron <jic23@kernel.org>
Reviewed-by: Fan Ni <nifan.cxl@gmail.com>
Reviewed-by: Li Ming <ming.li@zohomail.com>
Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Reviewed-by: Richard Cheng <icheng@nvidia.com>
---
 drivers/cxl/pci.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
index 4867657f5526..7b754af2168d 100644
--- a/drivers/cxl/pci.c
+++ b/drivers/cxl/pci.c
@@ -640,6 +640,14 @@ static bool cxl_event_int_is_fw(u8 setting)
 	return mode == CXL_INT_FW;
 }
 
+static bool cxl_event_fw_owns_mem_logs(struct cxl_event_interrupt_policy *policy)
+{
+	return cxl_event_int_is_fw(policy->info_settings) ||
+	       cxl_event_int_is_fw(policy->warn_settings) ||
+	       cxl_event_int_is_fw(policy->failure_settings) ||
+	       cxl_event_int_is_fw(policy->fatal_settings);
+}
+
 static int cxl_event_config(struct pci_host_bridge *host_bridge,
 			    struct cxl_memdev_state *mds, bool irq_avail)
 {
@@ -662,10 +670,7 @@ static int cxl_event_config(struct pci_host_bridge *host_bridge,
 	if (rc)
 		return rc;
 
-	if (cxl_event_int_is_fw(policy.info_settings) ||
-	    cxl_event_int_is_fw(policy.warn_settings) ||
-	    cxl_event_int_is_fw(policy.failure_settings) ||
-	    cxl_event_int_is_fw(policy.fatal_settings)) {
+	if (cxl_event_fw_owns_mem_logs(&policy)) {
 		dev_err(mds->cxlds.dev,
 			"FW still in control of Event Logs despite _OSC settings\n");
 		return -EBUSY;
-- 
2.43.0

