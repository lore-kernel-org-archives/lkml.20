Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F41B47207D
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383130; cv=none; b=XwWgiDb+BKsJB7k6sRx63H95kJ4wOxiYHH2s7YpGhCWfMfQbiKKyLdQV6OpKGGJNQQvy1ytp57DrY0vph84NgSYjPYRfV4urOqx4N9DZBMGgyEbp/riy5gc8A/OUkI+2qDTa/QFAXsJzS+8wkfFox+8/DDCDOIAYoDBRtLAV4zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383130; c=relaxed/simple;
	bh=svkNOJvu8oYAzmxCWvMKzSruaulE91jy0uCslNc4Fc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=FYsOnqgxPdkTaw1Jn9dJtINNmNyGyNPnI0JwWwT69xNKqsWORjLS7U575ABLXGVuIVeoqlorqdZrDk7Pm/yRCD+QFo+DrFvEE7i4UT1+wSa7/fRQEHWu7GzeAnfg3VOm70KYc7KASIPTelUJwe3QQZikpvhBzRwGjpbKkmDurso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=pe7FMe7f; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="pe7FMe7f"
Received: from localhost.localdomain (unknown [82.96.140.143])
	(Authenticated sender: stephane.grosjean@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3C3AF780383;
	Wed,  7 Oct 2026 16:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1791383121;
	bh=svkNOJvu8oYAzmxCWvMKzSruaulE91jy0uCslNc4Fc4=;
	h=From:Date:Subject:To:Cc:From;
	b=pe7FMe7fqSlI/Fe1lE71jG060youLDYHFkQoXewEGQ8+BTlt01e3Vuso2kDzH4kKD
	 GjOtzdScwR8BGQLXROHNfupUnFo2zxBJQTuNoBVw0FttFqDcnkrIaUp7Tq4JT20GK6
	 tVmcVF0nfB17Qswn37rswj/MXsugyRJsXZkjdXMSYefegcfV41Vxtw8QPbLT575WO3
	 rpcs5JAXWbmnjqTJkSRwysrKarA1VsEaZd/KUz2OZ/ts9/Xq+w0T4WBtdEqbnPyBWi
	 RzoOT0DITzXuC/ykOLV2guQQFVY5ZfdmiiI2tNtuuJm5h91VfZz5Zs9QqPY8Ljc6pu
	 9/m5Il5W9ZFYw==
From: =?utf-8?q?St=C3=A9phane_Grosjean?= <stephane.grosjean@free.fr>
Date: Wed, 07 Oct 2026 16:24:59 +0200
Subject: [PATCH] MAINTAINERS: add entry for PEAK-System CAN drivers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261007-new_maintainers-v1-1-398e6e36128c@peak-system.fr>
X-B4-Tracking: v=1; b=H4sIADpWxmoC/yXMyw5AMBCF4VeRWWtSlZJ4FREpBiNR0nFLpO+uW
 JzFtzj/DYyOkKGIbnB4ENNiA5I4gnY0dkBBXTAoqbJEylxYPOvZkN3C0LHoVK5VmjaZNBrCa3X
 Y0/UVy+o3782E7fZmwPsHVvbn9XMAAAA=
X-Change-ID: 20261007-new_maintainers-d275233b60a5
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?q?St=C3=A9phane_Grosjean?= <s.grosjean@peak-system.fr>
X-Mailer: b4 0.16.0

From: Stéphane Grosjean <s.grosjean@peak-system.fr>

Add a dedicated MAINTAINERS entry covering the PEAK-System CAN drivers
and related header files.

Register the corresponding maintainers so that patches, reviews, and
automated reports are routed to the appropriate contacts.

Signed-off-by: Stéphane Grosjean <s.grosjean@peak-system.fr>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c915b114c99c..ddb5b6d04b5c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21319,6 +21319,17 @@ PDS DSC VIRTIO DATA PATH ACCELERATOR
 R:	Brett Creeley <brett.creeley@amd.com>
 F:	drivers/vdpa/pds/
 
+PEAK-SYSTEM CAN DRIVERS
+M:	Stéphane Grosjean <s.grosjean@peak-system.fr>
+M:	socketcan@peak-system.fr
+L:	linux-can@vger.kernel.org
+S:	Supported
+F:	drivers/net/can/peak_canfd/
+F:	drivers/net/can/sja1000/peak_pci.c
+F:	drivers/net/can/sja1000/peak_pcmcia.c
+F:	drivers/net/can/usb/peak_usb/
+F:	include/linux/can/dev/peak_canfd.h
+
 PECI HARDWARE MONITORING DRIVERS
 M:	Iwona Winiarska <iwona.winiarska@intel.com>
 L:	linux-hwmon@vger.kernel.org

---
base-commit: a7bfaba4823e3c165bb2004c74eff7c096672bc7
change-id: 20261007-new_maintainers-d275233b60a5

Best regards,
--  
Stéphane Grosjean <s.grosjean@peak-system.fr>

