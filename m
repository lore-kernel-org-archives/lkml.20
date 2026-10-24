Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792862687;
	b=qKTxQysQfZVlbexserpiez5Q2iijXR9WmpMxqzCVpRIQ5m994priV7RUP90vRlkUnK4I
	 AnvFxmdEKjmUFY34ZRKgO/6Zo6w6OSepmAoIEXGASGOIxW0QMHIM/EZSeJFCTUy+t+0xV
	 XA6GnlHIwE/MPyZw9ANQvIXe32Nfg2wQXOTjV+vuFtWaDeqCYKe1lWiUiaY1HT3/reyuB
	 sDkyL22ZToKfOymDon59dEERGMzG/SowxpT6DYr4GI97Z5PJ8gKaBNfmBWNOn5Rq8G0oz
	 5GDCKCecFwpLFZ++1yJqLZKcRstGR2CNmGC2UpZrTwIofq6ezLDVvGHTzqiOANJSW6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792862687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x7nrxvqw7BIVjKxlluiLcYREpgrFvqJvaHMxfNmrkLM=;
	b=ryGYvVBq28shrC8NCsrUEH8c2qinrDqh7gTmrvnfzkP3HBl1X/VDzYCg9BXEucHtdT2N
	 B20k1brMXlq9JBWwBvo7/RES5QUW5fQLZ0HhhrWjSfGIZENQAUyslDQIgCpYbuLLvdTsr
	 JWUETSXKjLRApHiLTGyl8yjCKtGxjqvk5L8rZVjr8lxFXO1n7ZPA3F5FMr+zrIV3g9X7s
	 5bL7L6YfC/Ws2dz+vSfQTQIiuLbnt4p/1hP3eJCXkFE33fHGiTStEAegKS/D5hOWEyyXV
	 znKdM6/5cIEiXP9Lj0jvFmtuV48EAh5MVBaZROrKweuc/XnHCf4Yp67xOciYPFxEO2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0IOMheK;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD50606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 17:24:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CD50606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B0IOMheK
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so136815e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 10:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792862684; x=1793467484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7nrxvqw7BIVjKxlluiLcYREpgrFvqJvaHMxfNmrkLM=;
        b=B0IOMheKeJThOLJjE9YVnNnLE4knkhDF1KSxEAHHEFIPyfIrux6NO1XXW7Ycphaywn
         vicXEK/ohXujqc+LrTcilWa7mpUFujtikDK+oehOcYJ55ZOvxaNfKum7wrhC0CwHPubq
         FQ1V9FuQwey4q14tKOtgojzlIVpniG92Exk0//ROLd9vsNlXx4lpvlMjvQda5ybOdVq/
         U9cwslKcgVHh5rgOkgRkkSggIghMJEsZl61nmeBL/Rmoj0VlQtaRBgKueH9UAjex5886
         +4Fb1T02IPSBtRp1WCpr7y4FOELCG/3aylWnE1wsqgpuVFEFgM8yg0E+mb5+0N1LEI06
         CWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792862684; x=1793467484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7nrxvqw7BIVjKxlluiLcYREpgrFvqJvaHMxfNmrkLM=;
        b=hA+T2/oKUxff9Mv0sDRJL4tjx0oo1CscF9spqAB1pA5u5pzvOPw4ruoT0fnAhQx3Xa
         8tqz4OGDcR+Q0FnULu292JOxX/JRqN1TDdMQAnx4aHgec0a0BeSOTt3zWRfRaA9tVrPS
         azqM7UZl2mP2DcRkqOoeEohS9+TNlR/up+Zzu8usJ7KRP6YyDi59xQgAcFTuhFcqFHcg
         qvSWuRdcCSsUDvZ+R41L6lJF3FFk9CmP7CrQAtZtJf958u4iy6OyIAuQSW09PwbAC/eQ
         Qtorf541LTmhzDm/ROlJGrfsjvzgq9q65B/3UaSsa0cKRVpvL5jKMpWpM5oTcafWIaNf
         G6lw==
X-Forwarded-Encrypted: i=1; AKwUvBxhWHh7zdFCNSIVHT4cfDTAy9WGjZP/TYzoEsUsdVxbeofjjrrWGtGxnlLtnXwdKfhHzsZSdYiSoBUfOiQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4DesGcOuJ0aMPXcQk0QCnpCNpzkuk6cUg46bX1cfMM36UwKc4
	MG3MJgDarTo1+q/Y6p+PCdj39sdhBWCX5kEckj6GPdEWsxMeoq5ggAgp
X-Gm-Gg: AYBFou2rj0O8EuSH8gmNPKxN9YhVXUPJQ5uPznFxM0IiTyhCd4roTre4iCRyyg7rz/5
	d68T0FJy39oayywtIdwMEhTdjizPdLe77B6ZEv5aEN4/99gwaRef7dDIKaoEKRbI+QIdkaz1PRU
	GhpvADYfECTfW2C+xlEU/v4lHzfGuTzbrPaZPMiPvYPqJKJIC4Y/2Nv7A0Aqxzn1LmKZmVcgWoB
	D612xUdihB9mKGQH0Wklka8WW1Tcown5KzxvXsxLp3auaRdau+btmKayrt9+2FHKYkkvvb5eggG
	WtK7M9j/xD8v5afVHvbn70jtyl09MkiGMrMLkwMq/wfhfMsvP+XvftRcNMGTU1QZ+P5fwUETB8E
	6vTftSlZWIMYD75rtJB7vskdHiGtKe74vOy8ttGoJD10xZpB7aTIVULzL7S491Pk6NhO6b4tz5C
	yztEs+FtxDRb3CuW3JnlwdGXNE5vUGZroIDwIbdGmIpxz/nUqJfcjN6WiPDM6GLb2OlsQMsUsuY
	bpMpvqyabB2CM/cunlkxMTBG9Kz0kMk86rQritmxYHyxki7fpKiiSFEoq3dqod9H/6LkqxPmnXU
	ww80rOE8NK5kgDwx0LEuggM7juTGLEYkrXSbN8+c3J3SpUEA2k5rApjN+zTSPDZHEt/VjRchwrk
	cvMG4NaE1c2nLTcGFXZD0trf93WjXNEHJu+fFfSUscUfSC2ACCpFX/rjGY2i2JL6J9fgFhbsGIC
	wSUR9a
X-Received: by 2002:a05:600c:19d4:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4a35ac9114dmr35075715e9.10.1792862684213;
        Sat, 24 Oct 2026 10:24:44 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm80685955e9.1.2026.10.24.10.24.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 10:24:43 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: quirks: Skip nv_msi_ht_cap_quirk when host bridge 00:00.0 is absent
Date: Sat, 24 Oct 2026 19:24:26 +0200
Message-Id: <20261024172426.85842-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

__nv_msi_ht_cap_quirk() runs on all PCI_VENDOR_ID_NVIDIA devices to
enable or disable HyperTransport MSI mapping relative to a host bridge
at bus 0, slot 0, function 0.

On NVIDIA Tegra SoCs (such as Tegra210 on Jetson Nano), the PCIe
controller exposes root ports at 00:01.0 and 00:02.0 with no device at
00:00.0, and the root port's HT MSI mapping capability is already
disabled (found == 1). Looking up 00:00.0 returns NULL and logs a
false-positive warning on every boot:

  pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge

Return silently when no 00:00.0 device exists on the domain, matching
nv_ht_enable_msi_mapping().

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Observed on a Jetson Nano 4GB (Tegra210, p3450-0000) booting v7.3
(c03c1a14507d), where the Tegra PCIe controller (1003000.pcie)
enumerates the active root port at 0000:00:02.0 ([10de:0faf]) with no
0000:00:00.0 device on bus 00:

  pci 0000:00:02.0: [10de:0faf] type 01 class 0x060400 PCIe Root Port
  pci 0000:00:02.0: nv_msi_ht_cap_quirk didn't locate host bridge

 drivers/pci/quirks.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 1aa87a3..47778c1 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -3115,10 +3115,8 @@ static void __nv_msi_ht_cap_quirk(struct pci_dev *dev, int all)
 	 */
 	host_bridge = pci_get_domain_bus_and_slot(pci_domain_nr(dev->bus), 0,
 						  PCI_DEVFN(0, 0));
-	if (host_bridge == NULL) {
-		pci_warn(dev, "nv_msi_ht_cap_quirk didn't locate host bridge\n");
+	if (!host_bridge)
 		return;
-	}
 
 	pos = pci_find_ht_capability(host_bridge, HT_CAPTYPE_SLAVE);
 	if (pos != 0) {

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.39.5 (Apple Git-154)

