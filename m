Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA2E2AE78
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 02:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835736; cv=none; b=fV4cA/gpzqWYjYPUc6NKxA8Z05djJjNQNq1C/zt9nHOfaLWbtp9cOtdo163rNRA7xgR8YdZEBQJLJikb2wRDoVxp+pnH5aHWWMSqfMCfDvEUsl+Zfr5mlxRSfUkp7o4th/Out7NOtCU8sUUzRAjmauZDxgFS2ct+DqXixeybZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835736; c=relaxed/simple;
	bh=nMD+HFxqtWb98q+Dd5yamAN3mV3IUNCRO97y95Ldr84=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KBq7PhVx8GzH/NrQDKyRJeRbthPmmi6V/frjRdRbUiNZ7rJC9ywhrICiXXld3pnYuJTaTh12omA9ybPLQQ12/9KneNARvoC/mV2pkE4Qor+cUUaQYaOWZmMQO3OHk1c3DmRQyWTT2dDkXtgh4UWFZ9gcAcPahp0JtwmRYhxuSrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMNkhmrM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMNkhmrM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d5cad1a6baso35102045ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 19:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788835734; x=1789440534; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WBu+NhvQpv2NWcsnpIgxu4YIS16eKFsC/Iwk8ZVLPjA=;
        b=ZMNkhmrMdeeC6oRE1lWeEmOKc/GbgvWOFVWa0IugSZnfg2WIhFigkNwk2auxOXwpn4
         SlSql/EeSi7cGZOlX8Wd3KJFKtfJjpyx2OcHLxNmpuWzPJkSn3oXJ/+7kiFqpffe3dX4
         u56ty9SH0+R3aHut3xD4yoQMn2lyiw9T3AJBAwu2zABq1K2hVMcnrSq4s7Xwkue3Itq7
         ZR9TG5fySkgIMIoYuOCbDggnfRjghEu0Bgwu1Y4dfstWbv/golJ6uQgfM8xcmYtDxHQH
         gsP/r5kx7R2iKBhHT5rFu9tUZNelo31uzRjN+LYNu1Avh3CC60DOjd3SDVS2lMFQgzxa
         3bFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788835734; x=1789440534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WBu+NhvQpv2NWcsnpIgxu4YIS16eKFsC/Iwk8ZVLPjA=;
        b=gamCl7AgJgtGREJu/TDHbN/MseVyyRoKk01gAYXcz0EQhSCrY4E3uNLG6oWNftZjUv
         jkwhsqJ1RbvoRXqwmwfQU3740lfrW3q82B1pocaMS5XvffLOJxjL0JwE4J5px0Ox9DxE
         tdNijWHlHWs0X85KgGiKsOLwrA8YIMVVzI5euBI3OixLs8H9Hsep019g38IF4PXAg50q
         umJi2M4AXieIldoCDvlPSkeg54r1vvRMK3tAdPFlfroWOzrPx+yB/PcRmF+IarChoVNm
         peQI4pUCDC6bx6CvnXhNp25HSVSlMl2daGP2oT3AJwR0oSj+b+U5H4BQD6lP1rfMvFXx
         ppoQ==
X-Gm-Message-State: AFuF++nVoj1AVQT50XrFhAlW8BI3s3PbzyGexwX2inJjd3Kx9uPWjj71
	JvVAHfxCfo+6zVbHp2TXRo8N/1Am1c3laCGFXRHBgrZp1BzUg9Qv6D3d6WASElU6
X-Gm-Gg: AYBFou2Snqw98nvZu3FvVexXdKKNzD76xVY/xz5oM9ITS+bpRxBPpnpI+gH32jYY7uz
	qlkM2V7DXJHOksGqWMI1PxYI7W0OxANZETsCcEu5uNDZA21IXF+vGd6L2KdG2nLioTfBchTsddX
	oqKBwGFWgTl9B73HgRD+nrYAQ9xeQx2n4dDX0wHc+dZccYPfgjMyXosMgvmJKJMWxSytUh6OZ/9
	RR+d43FmUptiGP1uXmww/2Gb8+NnKG39xbDyySsKy/v6vYk4oKPCZEG+IyvRYTN7rG6Wpc3jmHA
	P7ADo6TGDrkx0c2sHNPL/QWqXOFFbiDBkyrFASSqqzMnT100LxsVyFJUxUYdUpNI6mmJW1lSh5s
	5DINVl6nOIk3cKnSSFu/rN+fV7jkRBrDseRhqLqtPMkd4nTDKVvaRat88QP3mNMQtSnvfwwUkXU
	zHirOcdGv7uTkHqhj495JbSPdo8wRrd7JWBYR5KptoBgTn6KokT23upJwBatF6
X-Received: by 2002:a17:902:c94f:b0:2d6:df31:5bd0 with SMTP id d9443c01a7336-2db125c3322mr391612335ad.10.1788835734121;
        Mon, 07 Sep 2026 19:48:54 -0700 (PDT)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae8af3sm50145505ad.80.2026.09.07.19.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:48:53 -0700 (PDT)
From: "ping.li" <leeonion.muyu@gmail.com>
X-Google-Original-From: "ping.li" <ping.li@horizon.auto>
To: james.morse@arm.com,
	ben.horgan@arm.com
Cc: linux-kernel@vger.kernel.org,
	reinette.chatre@intel.com,
	fenghuay@nvidia.com,
	Ping Li <leeonion.muyu@gmail.com>
Subject: [PATCH v2] arm_mpam: Only schedule mpam_enable work after first successful MSC probe
Date: Tue,  8 Sep 2026 10:48:46 +0800
Message-Id: <20260908024846.2063161-1-ping.li@horizon.auto>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260818130646.663778-1-ping.li@horizon.auto>
References: <20260818130646.663778-1-ping.li@horizon.auto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ping Li <leeonion.muyu@gmail.com>

mpam_discovery_cpu_online() sets new_device_probed unconditionally after
processing each reachable MSC. Once an MSC has already been probed
(msc->probed is true), later CPUs sharing it skip
mpam_msc_hw_probe() but still leave err at its default value of 0.
As a result, new_device_probed is still set to true, causing
mpam_enable_work to be scheduled again even though no new hardware was
probed.

Set new_device_probed only when mpam_msc_hw_probe() is called and
succeeds.

Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
---
Changes in v2:
- Drop the Fixes: tag, as the extra mpam_enable() calls cause no real
  harm: schedule_work() merges the duplicate work, and mpam_enable()
  is a no-op until all MSCs have been probed. This is a cleanup, not a
  bug fix.

 drivers/resctrl/mpam_devices.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 2f09f4b78bd3..fefdcf588932 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -1866,13 +1866,15 @@ static int mpam_discovery_cpu_online(unsigned int cpu)
 			continue;
 
 		mutex_lock(&msc->probe_lock);
-		if (!msc->probed)
+		if (!msc->probed) {
 			err = mpam_msc_hw_probe(msc);
+			if (!err)
+				new_device_probed = true;
+		}
 		mutex_unlock(&msc->probe_lock);
 
 		if (err)
 			break;
-		new_device_probed = true;
 	}
 
 	if (new_device_probed && !err)
-- 
2.34.1

