Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340B4323416
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 02:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788920582; cv=none; b=SGWgi3GLNVN6lgEVgLkRCNsBdWJfgi65LJShmKqwm0hkUG4kIP55903nxJJGAhbOeFsiuvPrd9JEZHND9q5kjIpKszq83DCyme9aPN3a5D+O+gxs5vr9p2/JsaAiTxL4i5y/a5BOae/6nBbullTcYguF4njr1Wsw1KQzLtw0F4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788920582; c=relaxed/simple;
	bh=kahNmhGL8r0OStd+UDk1yegSCb1Wry94V4qhk0XcnPY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fid35R8lNRDSbVi/AI9mSmR1oB59SrbDBN91HvRDkocaYCLVS7uM71HvpdsQ0iogTuEp09ga5OStNc+HusTtwqbYOhs2mP2KAMhnbWCY081VeduLiLxjDptWgltrIbnck8Sv9dRhHe+lAYT2lJ4sfJALmSVVIDIifCKO5G6e/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mCAVcNKZ; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mCAVcNKZ"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-4b5b727be96so3305908b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 19:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788920580; x=1789525380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZMyQef+oIqclLbtgPWrdXN2+jow9YDnTQ19wlR5TNs=;
        b=mCAVcNKZc+1JZK03AAOp/VBYhRQz5oNSv+yRNRsJaiIS8pgfXyv9YidJsykTBKvOZo
         wE++7BTif5mnAUIDmu7E0wzbRmRgkue57KBXN2dhNNgrWIZHmxn9mfdHoqvYykCEc4JY
         MQ/gEcC0SO5s0apmeXNO+Y0sjGdcwM00xWkywPOdNpNnlEal606DZSp3rN9JGNGstzRG
         HLZoMEmfyvIc/LuDuSKO0WBtQUKR0x1NxdrVRYnFNiRdFWF5Uiv/UK9oysohp6T+HKxl
         JySH6s8IBnGbuKe6tYDz/ZMkigyaSD1GaUHqmn5BygLemjf/1gpx+1P9maJmM5dG+4Ps
         FQ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788920580; x=1789525380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZMyQef+oIqclLbtgPWrdXN2+jow9YDnTQ19wlR5TNs=;
        b=Cgdlrf9hQYwrgQkYGocRmBWQ+2++7gLJPKgFH+1bZ+7Gh3Po0a6boO7K1/DXCciSEq
         YXe0na4rSBb0Xy7aB+i30pDL4+jiD1AksAbwQhcamW5Kxsq1tnKyhI4EN1wg1x9FA7gu
         z1qCXOdFy9eP4sv5+d9uczfonfdw6mm/DibGrQiywOX/e0QhDlzRG3RgRsB6AwchQtgQ
         pjB4riO9MQEoYz1YTyAo+8c4H2YXUSaGylWbtEBBwSNFYNkofvCj7rczhWgEUxsDFlaE
         uNzFit4T56V4opxwdYaV8vAVZ/PNFMJkKOqKRrMi1d8FiQLSZXi8GkDId33pKK9bKMV6
         iPkA==
X-Forwarded-Encrypted: i=1; AKwUvBwYT9Zh8M8hOU70K8HVEiqYmH+cDY/EtveczdTEwEdGMMa1uv9nJ65vAQvlSvxZFfPKoZiFkph+5FMK/4k=@vger.kernel.org
X-Gm-Message-State: AFuF++lO1HSUeuffGwG8PFljXK74d/u2HmtJ+VrH0n8s433uJBjdLqRh
	6PpqvRWHZe4X6MK/HdC6paPXSF0yDVMtE0IAm/6lgnm9qMaCGXN+T/8F
X-Gm-Gg: AYBFou2B56t23XD0wSVOIz7Lr7zG97AjJdkfQUUe6/Ig/tmnIe5V9ha01LrH018BhU7
	xUeOIhG06JRcgVFnSdCC9iNyvH9bOJDVK9NCQ6WWFIDBWdC7eYvAsFWlv6T/sDMgB5G+GssSka9
	Pfl1RiMKh42WjAAJAvC7LDIi+G5NNgu51xIJ8aeNqF4qTJMYb0dQkQMa98xaOE+dn6QUBVC1W44
	ucfnnucTWuh8luM7cHqKuWpVSmTzn3BUC6Eo73cMVS+lS7PAB2QULz9QBv2Cmx2+SkjLUo6mnKa
	KuM655HdP/NRpGstZh6M7iPW81PsZfiNj6ITzyHiXXJu9HW9bdwDYXAKXS6B1SH/DzFtgXwe+Tq
	bSGIJfiy3WTgxwqCydMMTaUmkclhngfShPH8t6fKBeCu2SVPvRAiI/iim3evJXp1+GlPc91+3n/
	O6zUJ09A2+7bzWFpNEJCOjowMfFrZNFJOzdwyAnm+rFph0tH7DTQN++JDBtYcfkkBN7Oj9HM71N
	+UmYpE96cU6L5/DNv63Suy46w==
X-Received: by 2002:a05:6808:1783:b0:4b1:b83a:5878 with SMTP id 5614622812f47-4b961a7b906mr20611009b6e.14.1788920579975;
        Tue, 08 Sep 2026 19:22:59 -0700 (PDT)
Received: from david-hassan-Inspiron-15-3567 ([69.162.230.54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b971aa12cesm15580584b6e.16.2026.09.08.19.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 19:22:57 -0700 (PDT)
From: Fahmy Hassan <fahmymohammed@gmail.com>
To: helgaas@kernel.org,
	bhelgaas@google.com,
	scott@spiteful.org
Cc: fahmymohammed@gmail.com,
	kees@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 1/5] PCI: cpqphp: Check pci_hp_add_bridge() return value
Date: Tue,  8 Sep 2026 20:22:22 -0600
Message-ID: <20260909022227.620217-2-fahmymohammed@gmail.com>
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

cpqhp_configure_device() calls pci_hp_add_bridge() without checking
its return value. pci_hp_add_bridge() already logs an error for one
failure path (no bus number available for the hot-added bridge), but
returns silently if the bridge's subordinate bus isn't created after
scanning -- that path goes completely unreported, and either way the
caller currently has no way to notice or react to the failure.

Log an error via the driver's existing err() macro when
pci_hp_add_bridge() fails, identifying the device involved, and
remove the now-resolved TODO entry.

Signed-off-by: Fahmy Hassan <fahmymohammed@gmail.com>
---
 drivers/pci/hotplug/TODO         | 2 --
 drivers/pci/hotplug/cpqphp_pci.c | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/TODO b/drivers/pci/hotplug/TODO
index 7397374af171..215ab36df11d 100644
--- a/drivers/pci/hotplug/TODO
+++ b/drivers/pci/hotplug/TODO
@@ -14,8 +14,6 @@ cpqphp:
 * A large portion of cpqphp_ctrl.c and cpqphp_pci.c concerns resource
   management.  Doesn't this duplicate functionality in the core?
 
-* Returned code from pci_hp_add_bridge() is not checked.
-
 ibmphp:
 
 * Implementations of hotplug_slot_ops callbacks such as get_adapter_present()
diff --git a/drivers/pci/hotplug/cpqphp_pci.c b/drivers/pci/hotplug/cpqphp_pci.c
index 81c58b1ec200..34803f36ba65 100644
--- a/drivers/pci/hotplug/cpqphp_pci.c
+++ b/drivers/pci/hotplug/cpqphp_pci.c
@@ -100,7 +100,9 @@ int cpqhp_configure_device(struct controller *ctrl, struct pci_func *func)
 	}
 
 	if (func->pci_dev->hdr_type == PCI_HEADER_TYPE_BRIDGE) {
-		pci_hp_add_bridge(func->pci_dev);
+		if (pci_hp_add_bridge(func->pci_dev))
+			err("bus/device/function %x/%x/%x: pci_hp_add_bridge() failed\n",
+			    func->bus, func->device, func->function);
 		child = func->pci_dev->subordinate;
 		if (child)
 			pci_bus_add_devices(child);
-- 
2.53.0

