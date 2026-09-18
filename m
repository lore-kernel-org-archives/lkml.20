Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372C052CCEF
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 21:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789766449; cv=none; b=dsn+6SNnC9qSFsbYZKYs/n8JfYBPeXK86rpM5n57AdroVqiTGeEoQZQBe3AwKHF4RjCIyTiAsuZWXDLN1ZQu2A4Mloj28bDdZeJJVmFptVBi4tEjA8LHvTWAh1fVgAMAJ2MY/ogM09sBLH0K2ERx07EFYo0fILG0N+N9xgW5LKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789766449; c=relaxed/simple;
	bh=cLaFuMsX/J0zSn55GeVISf0SU6o/PJijEaT3vRfGDQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gEUg+afQ527oBYQJfNlHnCIwrbyFK/ul04t76ZqkQqc3rsMMMAPW/89MLDpVQNeH51Zh10zLz2Gdg3166uBWRdDCRWH6zRMyR3l4mIj4GQ6rAr3ppyUX7M8ltI1pvmAevOo48n+z8eo+v1ej+NrFaGWfIbFpB68CJq1aOo25+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com; spf=pass smtp.mailfrom=arista.com; dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b=bApyeyVC; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=arista.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arista.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arista.com header.i=@arista.com header.b="bApyeyVC"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso884053a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=google; t=1789766446; x=1790371246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DlvPZmkodSWKlZLq43ZSJsHfXL/FkAr8wO/PLm1mStM=;
        b=bApyeyVCR/bJJ3v0JIVee1948Dkvt6h6SvtgD/XWfsBcRjn9Z8Lj6rd/1xMCCd3RKy
         +BtZ8T5KUJNhudMipDO3XWyZCYoH04/W7OglRIX1B+X2a1PPfe2fmq3z8CqDLuhWHDMR
         8EUJc0gC6jed2a31rN/SJyCmxzyAQ8SofJEMxdmMIn9VLI+/4nwb97GkblziZcVqiC6F
         1Kb1OuYgp5BMC8XyuNV9jrhCESnChb4uMrMJa1qS6vxfLAvIWkJoFvhjhMeoNMhKTwo/
         Y84bG3x/k/ppBSv/bleNG1pgoeueMfOldkFjVZszFAvKmwUPI3lcOAZuUuw+AA9A/sd/
         pu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789766446; x=1790371246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DlvPZmkodSWKlZLq43ZSJsHfXL/FkAr8wO/PLm1mStM=;
        b=CQyk9V9/UBVR8aSpHNTn7KPGKPv6wIoNBlipLNLTI3eXL6Seb2QlOosAO9eTSMYttp
         2twXqup6byiOLKgyE+Kur5JzxZjQOquVSK+yAxqmyXDnVvZaa8iGuAueRMQpMBxEJh1m
         ba1NqfPNhNuUhbGb9lntv0C00+rua03nXeF9ctqHn2Rj+h3Fwbq3CJYsv06NOv0MGsvA
         uswaiwLgpBKBUg7fRzinSurhmkH7S7is03F3urF0+dPXOTfPsUVNW7niNJ4gVQ1y+ZeO
         L+/mxRWtv+xPhuLoXVR+m/GcaQB56wSIyVNaWOXcHSTEjjEcf/JkABeZM2ICgJc2Qocy
         201g==
X-Forwarded-Encrypted: i=1; AKwUvBz/o4/s6H6rMbq+GU2XbEC4PG3tCvHgn0i9S5IEnR5g71GL//6PMk0Gcut+hwROCXUaZ6amYCY7HDn70yE=@vger.kernel.org
X-Gm-Message-State: AFuF++l0V67+RLWyUgBSWe7Rv1/Zcw3i3IMAgoBPmO5A2qfD3BX8omaz
	M7LcymWog42bS9nvFVQUDXJAp6CWE8l3b8CYLwefHBoirv+Sq9HZr7Ztewxhb3vkuw==
X-Gm-Gg: AYBFou3uE2Ygy1meF7Vt8ZB37vcFbPxL6fsKYrfaFsBZss5wXzBoMIk7olIoIUj4lH9
	na7BM9vOJrNoyQwY7iFhqlMMCRrAQ8Bc5zN5GNhYdr8lAVR1uPiSYuembgc03XdF5NCp7aqUFor
	xa5INN94cWZesL+ovkVS+Rv3fcZpRl7r8+6mZgKqDXfXBtljjjH7oPLHsOeKritzQa6SoKVdBdZ
	ILD8LaQyNz47Qqtj0bEvlxzpFEShP2jaj+7VIpWnIo8oa0vpRYgjyzZmp13TR/5dCKaego4/FTu
	Xy3sWS2A+MpXZVpKGHFvAjD/jssl5qGdj7cqh2UBlyC71EbWUrEDTbpGREDHQth6yxlxifiOL/A
	OCe4XGuUZnKbYp1O6UdEzkmKeEANY9gb8C9i6NJPKeLt6QwD1hkyxOmXV0FoLbXC2168fiMg0vF
	jr5br4HTSR9xt4bxk4K4CUfoZJO2g/AqRu91VOrFbD/KS55Q5a8jp65G9Hy8jIUtQSBx2MSxE0I
	0jhbxlvdLQCKBwDK8ON/yPevaNCUFgLCAGmepFDwjYLIK2f6ddi
X-Received: by 2002:a17:90b:52cf:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39e54bd0941mr7847088a91.15.1789766446231;
        Fri, 18 Sep 2026 14:20:46 -0700 (PDT)
Received: from yurypm-new-58lzp.sjc.aristanetworks.com ([74.123.28.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55e71a4sm1004948c88.13.2026.09.18.14.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:20:45 -0700 (PDT)
From: Yury Murashka <yurypm@arista.com>
To: bhelgaas@google.com
Cc: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yury Murashka <yurypm@arista.com>
Subject: [PATCH] PCI: pciehp: Add PLX quirk for missing Command Completed events
Date: Fri, 18 Sep 2026 21:19:26 +0000
Message-ID: <20260918211926.1480-1-yurypm@arista.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All PLX PEX 8600- and 8700-series data books say the Command Completed bit
is set only after the Hot Plug Controller completes a command that changes
the Attention Indicator Control, Power Indicator Control, Power Controller
Control, or Electromechanical Interlock Control fields.  It is not set
after writes that only change the Presence Detect Changed Enable or Command
Completed Interrupt Enable bits.

Consequently, pciehp waits for Command Completed after changing these
notification Enable bits and logs a timeout.

This behavior exactly matches the conditions described when
quirk_cmd_compl() was first added: both controllers report completion only
when the same four Control fields change and fail to report completion for
notification Enable-only writes.

Add only the PLX PEX 8600- and 8700-series switches on which this fix was
tested to quirk_cmd_compl().  This makes pciehp mark Enable-only writes
complete immediately while continuing to wait for commands that change
Control fields.

Signed-off-by: Yury Murashka <yurypm@arista.com>
---
 drivers/pci/hotplug/pciehp_hpc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
index 4c62140a3..5450aa6c7 100644
--- a/drivers/pci/hotplug/pciehp_hpc.c
+++ b/drivers/pci/hotplug/pciehp_hpc.c
@@ -1122,3 +1122,17 @@ DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_QCOM, 0x0401,
 			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
 DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_HXT, 0x0401,
 			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8717,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8725,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8749,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8604,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8608,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8609,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);
+DECLARE_PCI_FIXUP_CLASS_EARLY(PCI_VENDOR_ID_PLX, 0x8614,
+			      PCI_CLASS_BRIDGE_PCI, 8, quirk_cmd_compl);

base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
-- 
2.51.0

