Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD33E39B4A3
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791673051; cv=none; b=u5RlG9cT+4Hio6hujJaV3g6q2XKrmN1n7zttW91XqOMn0+9kX9s5an5YzBzCioH0m/AQMN4v48hu6AImJ9LnGfc5hNqfU+qWT1lPS0dBl8iZ5XKetkQPZEZUe0PiqTJP/FmHH7AHw12ydp5cel9EVp63+0T/OEqDqGZIwUeRD4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791673051; c=relaxed/simple;
	bh=wTrXCdV8AzwxSn8/wumycYvIi/3KBkGCkcB7oOa/3gQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9hA5vHwaFeDiHZfK1z2QF+Z0Vm2IuIhrfdTLzRZowwzX9atfdyBXcqBExOhk1LNAl5Ah8W8TS3r0UD4ctEl37qy0J4HUUxYc7lBAmrw/2rpFsovflXvpZMkECA6i76l4LTlk2KVIUiO3APfkorDFLJwQQ0znE2ZgH0EEuhagWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iG6LnH6G; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iG6LnH6G"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3a813079a55so1782763a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 15:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791673048; x=1792277848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qdsV85v5vqXCLh3/0lUrvTrzvLjiTUom72JURhklJHg=;
        b=iG6LnH6GGHlTwIreBjm7i+M7UE0sA6HT14m8/obHjuPOyq6lj+uXFIUC1NDkOxQaPK
         kQfw0Pi3I9J3X8Kt8tQQjBrq/JKZsKd0wD9kmYCPUJ7+H/vlbBBftsCHIj0S8XpQkZPj
         H1D8CBoJFBaE7r9087V5tZ3NtRE0z1tYAI2QVpTC8A3443Eu+eco06wb+6kAoWUC86j5
         V2GcQrabXUGj+0e4tp5ys/jriWG+3kVURtTCc5fDfTWmz0pMIaQmMuwSUITyX+YLLPsG
         xRSBuZhDc3L0H+ivXqwxoxnUXVyiC79xZ5iqiNPFSfy9gzbNEU5Ja82D0c8BMiNRkPx+
         gPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791673048; x=1792277848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qdsV85v5vqXCLh3/0lUrvTrzvLjiTUom72JURhklJHg=;
        b=vnzgQrbPFAo4expKGP/RQwMxjvLnu3I1HLxzDMGyRnTZqJuCg7EngVibRhqxGXe4Xw
         jHw3hEShNdyjRpSYnia6oSaud3vGzFlOu6txVcMVRxHFnDbkZ+v/XxzmD1VGv31HjJPk
         S4eVdPMrSm0eATQ78FridrSB5yRS8upWzVopVrKyI+WwGdCdjTmsHsAFbGgUDo8iMkRc
         4Y2Aqidph6iVgdz8WfhfW2f0FLcUctYgcmRP5fwF/TIvyIzB6wKSmyWMVbKfOu2Sxiu4
         j66jT0rBRoE4OKJsuQ08Nv7cjIfcMGRYUmobzCRL8L5AYC47FnNxhzGfBBHD8LQSy18Z
         hoLA==
X-Forwarded-Encrypted: i=1; AKwUvBzzR5ord4hNIuHOiz2cMfsULqqAC7JpNLPt3JKHNoev3/9msmjdQ7SOPPA0+3Rvlxhb9cPTsj1CJNIELS4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDIfB4LxCK89I51etdjQIOVQUh/328lx4juRCvoUMnsxFqBv46
	kwbC0CBJNmoCjM+Z6dIjeZaMeiqxrGtwOOknWZYuH3C7dJbAviG+J9xT
X-Gm-Gg: AYBFou2MGyTuoxuUrAkCVm6NmVxXJST4NO/2ANLTQU29QUHD77EIUsm44pIk2AzmFsq
	1K3tMRlI4NYbi7a9poBA+BwOwIr5OTDUMGUzqaRAYUqpgj3RbKu3feQQXTWjHRA4VXgEhJPTkIH
	j2+Ed5X0LZ1VStDp+OYWuBUqyCW/uVCrgCdhIPJfwQ3G77R5/28mDaF0al1wb5cmDbzD6f0gSpX
	16+VL4kMj4i4TX/HqJSGpJH7yltN+0jbyBTRgwPBhKhGvT105m93rQVW+qG85uAqZU8fSGSngEg
	2sIJTzs+5Oua6Ahh/Yx/CCuDtIeyouErtJ11gCZz1l/OfNtUoRGB7tEiD2C6jBo8BSrGswOI1sJ
	aL8d2lCyuMHu4KMa/qEmn7CoqXWrrlVrJ2Qvr2HAUX1lKsBWWNY8qtCrDsB12GgNk8OV92P49D4
	rrUwOBmd3h1GJRWuZxm1mvPpgUUiAO4vEijveT2gG0KoEgV8cm1ny7jlenQLFdnJqbMj1Qtg1Za
	eOw/Wc87rjRq6zJcVGT8XGK7OMQoENTTKXUZh4=
X-Received: by 2002:a17:90b:48cb:b0:3a4:cf85:aef with SMTP id 98e67ed59e1d1-3ab36d637b6mr4475092a91.25.1791673048079;
        Sat, 10 Oct 2026 15:57:28 -0700 (PDT)
Received: from cxlqual.. ([220.120.90.131])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm2603662a12.5.2026.10.10.15.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 15:57:26 -0700 (PDT)
From: Anisa Su <anisa.su887@gmail.com>
X-Google-Original-From: Anisa Su <anisa.su@samsung.com>
To: linux-cxl@vger.kernel.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
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
Subject: [PATCH v16 5/8] cxl/pci: Factor out interrupt policy check
Date: Sun, 11 Oct 2026 07:54:56 +0900
Message-ID: <20261010225852.10727-6-anisa.su@samsung.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261010225852.10727-1-anisa.su@samsung.com>
References: <20261010225852.10727-1-anisa.su@samsung.com>
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
Tested-by: Wonjae Lee <wj28.lee@samsung.com>
Tested-by: Junhee Park <jh9934.park@samsung.com>
Tested-by: Heesoo Kim <habil.kim@samsung.com>
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

