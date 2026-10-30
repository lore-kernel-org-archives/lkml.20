Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=104.30.16.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793329860;
	b=x7qEfPHraFnsiA3Ol3S3z4At5Naqc2Lxx6b66fP1AFrqupzUl7gyByRKm6qJwpD3sw9S
	 Ac+EVO38t4vf23s4KE0OFIJLZ+sCzVE67Z7jRIwEKErK5y/xkBHYOUYTNZmMIJKZsgC0a
	 aacumAFcSibhiuPbWhtIqdua4ltIIbfsJoXmeyUAv8mcvT9UFpKpKqH2m5yprWSHXIB4h
	 4+qcT3rmO+wzMKUJoyGh1PZMJxO63zELyDGAGP5gTDerjLdwWer8r+4FT8E8oSdPr0Hme
	 H78/4tcA4bPQXHuWiS0eOvCylqJpAnBa6oyv1PfkWRLsjnLe1e9aNoZ+E8hAGyD6paA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329860;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Feedback-ID:Message-ID:
	 Received:From:To:Cc:Subject:Date:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5RMaJLdOqxhz6uN3b9vGcTDRWt0U48Knz5DQ3YYyltM=;
	b=ZulFu3nB+bfVimlAfn0d/m+UNeDlGPzikieudCMyGxbeVgfKniqhEj8rKfK3VX1mEByu
	 UxRDHL7B/yLKM3g64F03K14pO7XBcK+/AFj6qU/809+/ppoKDxKfMk8fzOfbLEN60nDbj
	 tczVjIw0c+HMPV08QvIWkglpf3JKGJbZeeScX6Up8vU5pi9fvcwfAKoXG3vfpWhFeLTY/
	 DgC2dRGMy5thv/rsdDxf2y0GNr9BsA9f/9dcA+Lshiq/Bnw0z+zsqR/dYFpsWVnqmQDVy
	 8smeMhZNVHC46oFUyU/UjJzDwKjl9VuI75ohI3OegSeBbPoWeH1cM4iZy4cwrlbUexA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=robsoncassiano.software;
	spf=pass smtp.mailfrom=cf-bounce.robsoncassiano.software;
	dkim=pass header.d=robsoncassiano.software header.i=@robsoncassiano.software header.a=rsa-sha256 header.s=cf-bounce header.b=XOnHmgdf;
	dkim=pass header.d=cloudflare-smtp.net header.i=@cloudflare-smtp.net header.a=rsa-sha256 header.s=cf2024-1 header.b=blYlCDWm;
	arc=none smtp.remote-ip=104.30.16.97
Received: from bg-jh.cloudflare-smtp.net (bg-jh.cloudflare-smtp.net [104.30.16.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2A03606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2A03606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=robsoncassiano.software
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cf-bounce.robsoncassiano.software
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=robsoncassiano.software header.i=@robsoncassiano.software header.a=rsa-sha256 header.s=cf-bounce header.b=XOnHmgdf;
	dkim=pass (2048-bit key, unprotected) header.d=cloudflare-smtp.net header.i=@cloudflare-smtp.net header.a=rsa-sha256 header.s=cf2024-1 header.b=blYlCDWm
DKIM-Signature: v=1; a=rsa-sha256; s=cf-bounce; d=robsoncassiano.software; c=relaxed/relaxed;
	h=Date:Subject:Cc:To:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1793329858; x=1793934658; bh=5RMaJLdOqxhz6uN3b9
	vGcTDRWt0U48Knz5DQ3YYyltM=; b=XOnHmgdffDaxgu8MAvuchAu9lgmQoOt6I+dvpeCm5I8yH
	wvTkBjZF10ljHyGknJrKJ8OflTXWSoSCMPtiawFOqh0xUUW06evgHdwcFLY39h+r65XC/pGVejY
	WxapHO3Qtp/P3HJ/JxKb4q2UXOvGLM4b6Me6vQSwauo6uM1XbB7cQzH4/f4HMVKbfaDHV8b6Mra
	p3xEo9bMDB3iB116WqHFO1Tklh7bAnInCoIxF2nhH+KoSQQYNznsIlkQRtimsS2Wa0tc41ab5zP
	+1SL72eoCw4k+BHjre2nNj9SLgqjopAxqsLcfP33J80f+5zFqs8vnPW7nwr+u8EbrYajiHig==;
DKIM-Signature: v=1; a=rsa-sha256; s=cf2024-1; d=cloudflare-smtp.net; c=relaxed/relaxed;
	h=Date:Subject:Cc:To:From:Feedback-ID:from:reply-to:resent-date
	:resent-from:resent-to:resent-cc:in-reply-to:references:list-id:list-help
	:list-unsubscribe:list-unsubscribe-post:list-subscribe:list-post
	:list-owner:list-archive; t=1793329858; x=1793934658; bh=5RMaJLdOqxhz6uN3b9
	vGcTDRWt0U48Knz5DQ3YYyltM=; b=blYlCDWmbyG2ejkI1JFz1DIWVR1tvfPWYJKKFHnvWp1M1
	XthQiVDG3WqZivLB1H9Ab8duvaGcNXrLWtOkJOlYTErN7bMoJq6dB0MvFZsAZmwlHd+d/znAAbD
	zMca+cTGS0O4gszn+xzN7z0rfvUA8vOYvMTPWYUF489ta246DNqdsg3HKJ7lQgRqIR7mDTt6dGo
	C9Ff7CFFsrZTwWLVUmP5ZlJsvIeHeGYkxk4skxT07AYkiCTxRE1sqmdBpc0/5pxnca6Iup1GHhx
	6ZjD4HPbsx2T5hczmMlMIhYGxP9RojVwE1+sVMQsjhbSoq/yQRJgqHx1Z3xiddsDrwhLpdhg==;
Feedback-ID: robsoncassiano.software:5:5:Cloudflare
Message-ID: <WnzOhxjlW7w5jwpSIQmUzrvduOStpoX2h3FS@robsoncassiano.software>
Received: from authenticated-submission.invalid
        by mx.cloudflare.net (Cloudflare Email Submission) with ESMTPSA id LKLvqPjuMPko; Fri, 30 Oct 2026 03:05:13 +0000
From: Robson Cassiano <linux@robsoncassiano.software>
To: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me
Cc: linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Robson Cassiano <linux@robsoncassiano.software>
Subject: [PATCH] nvme-pci: add NVME_QUIRK_NO_SECONDARY_TEMP_THRESH for WD SN740
Date: Fri, 30 Oct 2026 00:05:13 -0300
X-Mailer: git-send-email 2.56.0
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

The WD SN740 (15b7:5017) reports two secondary temperature sensors in
the SMART/Health log but returns the 0 and 0xffff (Kelvin) sentinels
for their temperature thresholds. nvme-hwmon exposes those as
temp2_min/max and temp3_min/max, producing -273.15 C and 65261.85 C in
sysfs.

Mark the controller with NVME_QUIRK_NO_SECONDARY_TEMP_THRESH so only
the sensor inputs are exposed.

Assisted-by: LLM
Signed-off-by: Robson Cassiano <linux@robsoncassiano.software>
---
Tested on the affected system, WD SN740 512 GB, firmware 73100004:

  # lspci -nn -s 01:00.0
  01:00.0 Non-Volatile memory controller [0108]: Sandisk Corp WD SN560/SN740/SN770/SN5000 NVMe SSD [15b7:5017] (rev 01)

Before, on 7.2.8:

  temp2_label    Sensor 1
  temp2_input    53850
  temp2_min      -273150
  temp2_max      65261850
  temp3_label    Sensor 2
  temp3_input    38850
  temp3_min      -273150
  temp3_max      65261850

After, on 7.3.0 with this patch:

  temp1_label    Composite
  temp1_input    45850
  temp1_min      -40150
  temp1_max      83850
  temp1_crit     87850
  temp2_label    Sensor 1
  temp2_input    59850
  temp3_label    Sensor 2
  temp3_input    45850

temp1_* are the Composite thresholds and stay exposed; the quirk only
suppresses the secondary sensor thresholds.

The quirk also covers the other models sharing 15b7:5017 (SN560, SN770,
SN5000); only the SN740 was tested.

OEM systems: Dell OptiPlex 3000, Lenovo IdeaCentre AIO 5 and Samsung
NP750QFG-KS1BR (the test system).

 drivers/nvme/host/pci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 77317e5..4f1f10b 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -4170,6 +4170,8 @@ static const struct pci_device_id nvme_id_table[] = {
 	{ PCI_DEVICE(0x15b7, 0x5009),   /* Sandisk SN550 */
 		.driver_data = NVME_QUIRK_BROKEN_MSI |
 				NVME_QUIRK_NO_DEEPEST_PS },
+	{ PCI_DEVICE(0x15b7, 0x5017),   /* Sandisk SN560/SN740/SN770/SN5000 */
+		.driver_data = NVME_QUIRK_NO_SECONDARY_TEMP_THRESH, },
 	{ PCI_DEVICE(0x1987, 0x5012),	/* Phison E12 */
 		.driver_data = NVME_QUIRK_BOGUS_NID, },
 	{ PCI_DEVICE(0x1987, 0x5016),	/* Phison E16 */
-- 
2.56.0


base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222


