Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398882;
	b=IX7L7kOv1mwtPRI3fvWuFH6h4Tz2sH/h89MkT39AuZ3BGFOIhYSV5SqEhBqWo6837zHL
	 nV8geYnW3v63zq40qHIPdS9/c0PwoflaSF8kRq+deA8lXwTvHwPo2/ZYmhzUtPSIHtREn
	 N+8kOjCGLAOx49dyuXADWdMiEiWAOyHnCjkaVE9/RphhV+ljY+Zl9CvXapCFCXhsE5pcP
	 fx35r4guJqMXhcsjIlbci2Q/4B1P7BoSJlNw1UyP5VaImAhvfX7zzqqmSnrouM7+cnfVl
	 tm+sDeVnVcJb02TxB05JR35yxQ5mhT9mmk4uxz3Z9NElRU2JTV5an3cB184VxAqXeOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398882;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hYhOZkL/otgRvGfJdBZAujUUz33qad7UICBu6uXEBGY=;
	b=ge5wOz9ok/oDicN395NaRU5K68isDCUxljiFcPxJyDSG2yaQEO/gO6kJ2ixpJSmcLBvZ
	 R+0fvg1sL7arsEu9Ox9eyb6pgc5LymdhBC8yniJKi4TBHx3nQAjHUo5uLM/7ha7ajgbAo
	 8HMZTnvH9p1yTkhojNKqAX9X1BocoxwfAesfPq6FKkCvpb8Jkg/KDyxcMw6AonAk83Udh
	 nbK+c9TZJtFhqCEcoFZ5y9Z4H7H0d83qIuVHTHR8ggZh2BlaQnBHTUkoxYk/q76v46e0N
	 WNoE3+7OYp15AvkwevOvRFNPKDM+QkSV3KeATXEhhFahVEq9PZdEKM1FVMJpjIHA0tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b="LeEDn/mA";
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF37A606A8A4;
	Wed, 11 Nov 2026 12:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF37A606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=LeEDn/mA
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794398880;
	bh=4qCAPE7zQoMkKqxefQhrfehtD49kPtqZhPrvXyAgXKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LeEDn/mAlJNX8bB2+79D/R7xeJkgVoorRs6le2z0G2S/VpI6H0grgWlitxN3YejQ3
	 MVDUnBa228VRBlPMK5ABXSRG4EvlyHvCDrammXRkMakaidNeJX++AO/vdXy3Icnv3Y
	 yGicdrXrF/hKrFrO9DRCiXdc25xw8e6XJQ0Xwjg9chxdFOD/PQ7m6upCkpUQP/4NaX
	 xntxp/4RJX6Yipy3dQdgfQTk7CW3ygUGQcBNH02ajGMYm0AZZIzDU8FfiBvSBlWI8d
	 RvxxJFSqjkzRA0u56D85PzxvN8/ogGWiS8l7WwMA429F+zOfPGbiwzYWOL/pc3gARd
	 p+Yjhjp/QlZOQ==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com,
	Andre Eikmeyer <dev@deq.rocks>
Subject: [PATCH v2 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Wed, 11 Nov 2026 13:07:46 +0100
Message-ID: <20261111120748.23795-4-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111120748.23795-1-dev@deq.rocks>
References: <20261111120748.23795-1-dev@deq.rocks>
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

After ACPI S3 the chip comes back without its firmware, but the
interrupt mask can read back nonzero, so brcmf_pcie_pm_leave_D3()
takes the hot resume path and every command times out afterwards.
Seen on the BCM4377 and BCM4364 of the T2 Macs.

When the platform firmware handled the resume and WoWL is off, go
straight to the existing remove and re-probe path.

Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index fc0f23477eb..faa1e16ed4f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -7,6 +7,7 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/pci.h>
+#include <linux/suspend.h>
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
 #include <linux/interrupt.h>
@@ -2844,6 +2845,15 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
 	devinfo = bus->bus_priv.pcie->devinfo;
 	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
 
+	/*
+	 * Without WoWL the device is powered off when the platform firmware
+	 * handles the system sleep, as with ACPI S3, and comes back without
+	 * its firmware. Its registers can still read back nonzero, so probe
+	 * it again.
+	 */
+	if (pm_resume_via_firmware() && !devinfo->wowl_enabled)
+		goto cleanup;
+
 	/* Check if device is still up and running, if so we are ready */
 	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
 		brcmf_dbg(PCIE, "Try to wakeup device....\n");
