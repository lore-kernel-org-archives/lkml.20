Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794066504;
	b=d0iXAu3yI5iM26F7OJrfjeIU0hrMwVzCj57Kw4++qWHkr3Iwx0e+VhKoG2SMkqHJqxFZ
	 Uw7BBmYbRZDEUGsQ7UIrCyW604jpadKen9I65lCMlnpmzGAMxHn07Ra9iZuruEWh3z9MW
	 kj9a5aXhOYGSIn40kuspuf1mxIkxL2cWTZueGf46r7TUKY9JYDphU9R6MkBvdOpy+yv5g
	 6pd71le04oA6zthWAgiJXhjdFfuwxRhwqxcu7nzFFEYLhe1tUvRwYo2GPIpy0C3bEr1op
	 4146JFFRb9bpf5LvkOySDSs+3LIBEMULU6p3T1EO4LePq58vrdgZlFh98iVPPgaV5gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794066504;
	h=DMARC-Filter:From:X-Lima-ML-UUID:DKIM-Signature:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hYhOZkL/otgRvGfJdBZAujUUz33qad7UICBu6uXEBGY=;
	b=yrsOPnpsKWP/7fV1cx3Zh38nNkptG8XlM2n3gUwrwRk6hwUlrJe0PGcjkPJHBpX3Gwy4
	 nIggVRFeS6Q/b1LBXbs6BganWmgtXnm917oAvD+qHV7EeKoJeNPzO+s1geR9sB5n2Ot0Z
	 8g78l3PlB6eIP/VUwrs75Cu7ffvweqHjWlkB1I5xWRH/Nl+GIT2gCbNH1mN8AtzevZ22z
	 rnaDhB1MtX53gwI0N5BiptfPOzp5z2KUwYRskTcyNj4gKg7DAFxHQARr4wjUkTyFDXpnP
	 +j748rpOtF8euARAm3J/x+u33Bo9goVxDSvSgegXnMb2wAIqcQrnksYAw/lwoR8LrrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=hPPdqKoc;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A83606D802;
	Sat,  7 Nov 2026 15:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03A83606D802
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=hPPdqKoc
From: Andre Eikmeyer <dev@deq.rocks>
X-Lima-ML-UUID: 9aaff8ec-c42e-494a-a81b-24780cb8c769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1794066500;
	bh=4qCAPE7zQoMkKqxefQhrfehtD49kPtqZhPrvXyAgXKM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hPPdqKocPiV4UFi/TjPSFvFFPR/RRvv0hd9puVLmdL/W/cCQZ+pgbgAjI0x/v9ws1
	 YxYwCMqx8uhjGpay9CVwMLrSdmuthOtZO6zLnHnww/dd2CPIg1RIZFO8LDb7UOYZzf
	 B2OgrRXhgX/MRZoBXMhKnyxNtk7jkpzkDCnXHJU3NZOfc8gX9eL2Z5Wlfwj1DczI+W
	 AhL/3nib7UOJOsS85SNVHFayqnXLEYlyGPI7mh3dmUeU0XGDNUjLChu6joVX97oDdw
	 bIB75GMwuxc+p90eoG+j6S5Uy7gRSEQ8+CJADL1LRxv3kzP1wWFMiCIT6pZNNaKh4y
	 DmnR3E236jqsQ==
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Michael Reeves <michael.reeves077@gmail.com>,
	Hector Martin <marcan@marcan.st>,
	Janne Grunau <j@jannau.net>,
	asahi@lists.linux.dev,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH 3/4] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Sat,  7 Nov 2026 16:48:09 +0100
Message-ID: <20261107154810.89780-4-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261107154810.89780-1-dev@deq.rocks>
References: <20261107154810.89780-1-dev@deq.rocks>
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
