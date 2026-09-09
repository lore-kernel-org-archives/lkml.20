Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D784C30C37A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920596; cv=none; b=OXE2oMCeSefUsINKNOglCZYMlVwI5vvyIupKpemaxGnjjE6vMp11YCkthV66jbiMspnYoC1TNWOPKLsiquXbxl7pE3R6Avnuk9RoymRhSMUTQetJBT1YKP54YxpRBzTgrUhd/Cjox8sHBXmd8OJj5e4Do7hwvVwybJe3SR9rlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920596; c=relaxed/simple;
	bh=OlnxTMf1OS7EffZSZon0z25ejT2la63Mm23HWuKKSfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJ9fNVQcB8TcQA8yndqCX4Im96567shcKn88YHQcfa9p0lVQDvpo5erpWNE8g9g3xQ56vbi8tnOFmgFvy31p/pakBENePj/zJ8rEqlFG7QGdcmXSs4JvYjsUGwRnR8CiCCb+esRJyv/0I0q/LE4tcN3X1zRtzgv7IosC5fdorDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VrgeDPVI; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VrgeDPVI"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-4be07e7c54dso1380790b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788920593; x=1789525393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAgTxvl/DOmwjv6Cc0tmXlZdkUKiZ0mQGF7jFKNHR0w=;
        b=VrgeDPVIYMLoY/NWVzLr6GrRpjoeKCxlQ8MuzMLYnZG3YIFFOzWz1lsEIpjGECC+bJ
         tk5asnKpp3AuBDc8uFOTLMFwz6i20AXz06ao9a3pHLkWGNo3fD6C5NTr8CjKsr7MAGBY
         eoIWNrkilXaIFGK22msIqeevNcKOI7+lT0g8OxHZ2+2tQdANLThWAmzJoouoTZQxTwHX
         e6/Yn4CSvtCntUu/z3Uon5XJ0wLsoaMbe8WFVeTv5FndSUV7T/sfswG8v2CGMYKuqGpe
         bXD6gk9gvYxRIqi/taqCoKXN8yq0OGRwKKlpTp/6K2sT9FxVXcIWbs+uOacuVXyvgMqO
         GO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788920593; x=1789525393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JAgTxvl/DOmwjv6Cc0tmXlZdkUKiZ0mQGF7jFKNHR0w=;
        b=ESXaCEdaqbfuPZJA1moJcM3zlahn8699tq1MaY+TUB6de4juJ/0LYbrhzrsZajsW8j
         C/fb+YCLmK6i5hH4r9KesSsfZrSAUiGboW/jLNxcPh+gRflLqKcxqIFeC3ZyewIenF+t
         1TS6NSOYPGS5EnUjFLupqL6WAc9k0zCvayTDcCq5WjXgyceDwiEvUvdhoaiREnwwuAyg
         XZU0AKZ/big/yhav4kYJBOhMEyYdSaSZE9pzDh8UXODqcFhPcapBPEdHqOSC9sTYAXtl
         iL6kOlgC85V3X3OcLKDIM5SDuBNL6Sv32kDefpm7X93r3juLTUO0f9jEjUqHZUOE51Iv
         KYDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCouGE9u9a/3gparaVSaXRmrc7sZ2sZ7hfVGD/6yXdHZ+2++kwMiWu4wzgfuio7JxKbXelqzFCt0olRLw=@vger.kernel.org
X-Gm-Message-State: AFuF++lzyAfjsYB6rD9e/iTvdl9uz747BPZzLMKw05Wg8jhf4s6E+ynx
	fuVe/Lawiymiw3iABZGJIW/L6AcLmb6ODr+0CBKi8l5jN4fJxGxuwJbE
X-Gm-Gg: AYBFou12WuMtHV4saueIT4/2CE9a1baQQ4AXBzeMO6AwWSp0/5XKPKBhRgUUqL88ujN
	pRSqsd21MhG6H49+9HzP9PLhEYgbeDUowC2vMrQv16tvcsvyRrI/gjlWcTTYEBNuXlQZzvyga3C
	4iAXAMOSLq8Ni9QMCklhh72uoKdRcfxMSECYWcnTdzmmxQLNHHvoi91vFimPN+6iiaxqMT6b/4D
	ol/2M29GRBY57gjju4qf+wEScbiSfRKO2QBfPxWcuhFYYPIbzu9NzCBmwMxknd7XPlck7CSf8Ml
	2ZKeqQW8b0DVfzxt8UNSWcbKQwvEY9flqE2dzK+YnSkRox4NLO3/tGSWZXX2AZmIuY18FYGdUqj
	v7E44rGoWACzJTpIJZF+yjgSFxtsP7iiQVLuiRRmsk878F869HZrsFVI9kjjmNKSoOjorkpCG4O
	BKiLabuXyjIi0GTxd2xw9/B4fhHi6KTJeb58S9fJO+8BSmRddRvTqN4/vytGClTqTs9c/xzR1Yu
	3UameL/m7ya3mCC7AW+pztDew==
X-Received: by 2002:a05:6808:c1fc:b0:4b8:4703:db93 with SMTP id 5614622812f47-4b84703dc46mr13211353b6e.28.1788920593574;
        Tue, 08 Sep 2026 19:23:13 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971aa12cesm15580584b6e.16.2026.09.08.19.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:23:11 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: helgaas@kernel.org,
	bhelgaas@google.com,
	scott@spiteful.org
Cc: fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 5/5] PCI: shpchp: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 20:22:26 -0600
Message-ID: <20260909022227.620217-6-fahmymohammed@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260909022227.620217-1-fahmymohammed@gmail.com>
References: <20260909014143.GA123333@bhelgaas>
 <20260909022227.620217-1-fahmymohammed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

shpchp_configure_device() calls pci_hp_add_bridge() for each bridge on
the newly added slot without checking its return value.
pci_hp_add_bridge() already logs an error for one failure path (no
bus number available for the hot-added bridge), but returns silently
if the bridge's subordinate bus isn't created after scanning -- that
path goes completely unreported, and either way the caller currently
has no way to notice or react to the failure.

Log an error via the driver's existing ctrl_err() macro when
pci_hp_add_bridge() fails, identifying the device involved.

Signed-off-by: Fahmy Hassan <fahmymohammed@gmail.com>
---
 drivers/pci/hotplug/shpchp_pci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/hotplug/shpchp_pci.c b/drivers/pci/hotplug/shpchp_pci.c
index 36db0c3c4ea6..b9b18879b8ab 100644
--- a/drivers/pci/hotplug/shpchp_pci.c
+++ b/drivers/pci/hotplug/shpchp_pci.c
@@ -48,8 +48,9 @@ int shpchp_configure_device(struct slot *p_slot)
 	}
 
 	for_each_pci_bridge(dev, parent) {
-		if (PCI_SLOT(dev->devfn) == p_slot->device)
-			pci_hp_add_bridge(dev);
+		if (PCI_SLOT(dev->devfn) == p_slot->device &&
+		    pci_hp_add_bridge(dev))
+			ctrl_err(ctrl, "pci_hp_add_bridge(%s) failed\n", pci_name(dev));
 	}
 
 	pci_assign_unassigned_bridge_resources(bridge);
-- 
2.53.0

