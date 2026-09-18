Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD98519E19
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 17:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789752290; cv=none; b=fRoV24Yib5H3+IJPQB4NVYLGaP8J/p8Pg60zVZumEa/Vij+HcT5ky2JsWdTzcv2HFrNI2tV/KOp9hcTMX0fCqe0hfmz2hEBGTa568P/F8RLl+iDPgv4NtL+U9W7HKVQF8buxHRchniDYGmlKxRPsZReS13n75gdh7d9UeHwen78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789752290; c=relaxed/simple;
	bh=e3U2RUqrflZnwIr3xZJrdz3cRiaSIqCPPArSVUFsnT0=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=o2K07bF45FZLJNtvQXORkqfFKZRI/x4MGSBLBvQYivxTCTclKYuoriRX9z0BncqowypYJ5TtZ9ePI8hxoDyy/V9DqLuAAMglmFbD1c5HWjKv3ubm1mKedRJnr/sBMbg+BxEHz9eGBRTgnrxlL9DEfwV5sewyq27WLtpy8LVIva4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MEYebcBQ; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MEYebcBQ"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so799157a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789752289; x=1790357089; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MK8SQon571KaD8P7buh1T6LtzzA2FoPJEodcHPYT2dM=;
        b=MEYebcBQogWSAUhKH8Ntvwvd0S84euubUfyzmNXfuOWojVcLdw8olgm3WCpLAHahLC
         iyyAYRd/W2UlDpzoHZWJiJO9sIVkcmaVj73GkHujAMBIgF9NXIMZmvtEVjhrpfkCBUjj
         Im0HBiWoXKVeQFu6QGRDlGTpnYGyi3NCAfc2M/vXDQtRxgKJmg/mRF1MvQZ5UwumpCiP
         K1aGQBpZkVkSlI9g4RL5pTs657WK2z7NzaTr1Ewt4QM9N7FDBOTRWX+or+umy/4hXLuf
         pvpUTjB3ZP24Q5wO1bbJC5EPBCtc3DIVaDJN2nF8Auoj31KVj0lubFpiop2+0x0H5HLx
         Ydkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789752289; x=1790357089;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MK8SQon571KaD8P7buh1T6LtzzA2FoPJEodcHPYT2dM=;
        b=gTZeE7otbahVVVwKEojzxEeFblTBDiMK/ancSMjve6Ca9ik6H3QSVwUSxLbYKCAOrK
         zeJ4U2TRPxtyVGkg1S9vE2t9Do/3odSgum7Ymf/Z7ShmVcDg3f63v98BqndxIP7IiP96
         UsqmYNbtlQFu4XSkb7tSTDnkrcQpH/KrOA3/o5r77gGZ73YyYe3ehrUnWQ9cVgZhulFI
         G+cv6eDAM91E6Fi4SiaP7T2KouU9o8RclzMQlDHS2HiBS+RMpcHIY+g7LFW6Dn6mD99z
         F/8JooBvbpJowlz2//nXi9i6zq45PdtxP7twsEoHb02IFK4P3u3hRjn+iAeB+df8FEgK
         X/vg==
X-Forwarded-Encrypted: i=1; AKwUvBw9ppoiiEi9HsVlAvLjovxp6G2cVIINqP6W+JJKNuEKJbvTR7Q55LWILFpNxZu/sfnDFajQxseclRwx3Kc=@vger.kernel.org
X-Gm-Message-State: AFuF++mb08ja4hVjx5XdXqbPca100I6wmG0eQLtv78UnqNxfjb+ioyZz
	l85/GkumDHi5JG4/jvoOCDGv3/Ll8VERrXJ45kNdWsSK7kVwS8k30zgewbW5P2LbhPQmikKIDGm
	T43+Ha1ABzhAubg6MafrrpX+DTenmq76HKw==
X-Received: from pjbct5.prod.google.com ([2002:a17:90a:f585:b0:39e:574c:5672])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:384d:b0:39e:6c6a:4b67 with SMTP id 98e67ed59e1d1-39e6c6a5448mr417570a91.49.1789752288464;
 Fri, 18 Sep 2026 10:24:48 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:24:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAN9zrWoC/4WNQQ6CMBBFr0Jm7Zi2kEpceQ/DotJpmYiUtEgwp
 He3cgGX7//893dIFJkSXKsdIq2cOEwF1KmCfjCTJ2RbGJRQWrS1QMcbGooYyfXhPS04knmiri+
 taxur1cNA2c6l5u3w3rvCA6clxM9xs8pf+s+4SpSoG5JC1sZaqW4+BD/SuQ8v6HLOXxh77/q7A AAA
X-Change-Id: 20260830-fix-aer-refcount-leak-6378f84d62ba
X-Mailer: b4 0.14.3
Message-ID: <20260918-fix-aer-refcount-leak-v2-1-bdd1ff1c35a9@google.com>
Subject: [PATCH v2] PCI/AER: Fix struct pci_dev reference leak in aer_process_err_devices()
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lukas Wunner <lukas@wunner.de>, 
	Stefan Roese <stefan.roese@mailbox.org>
Cc: Keith Busch <kbusch@kernel.org>, Sinan Kaya <okaya@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="utf-8"

When an AER error occurs, candidate error-source devices are added to
e_info->dev[] by add_error_device(), which takes a reference with
pci_dev_get().

A device can be recorded without any error status being present: the
Requester ID fast path in is_error_source(),

	if (e_info->id == pci_dev_id(dev))
		return true;

matches purely on the ID reported by the Root Port and returns true
without reading the device's AER status registers.

In aer_process_err_devices(), handle_error_source() is called only if
aer_get_device_error_info() returns non-zero, i.e. only if an unmasked
error status bit is actually set. It returns 0 if the device has become
inaccessible (status and mask both read as all ones, so
status & ~mask == 0) or if no unmasked status bit is set.

Because handle_error_source() was responsible for calling pci_dev_put(),
skipping it permanently leaks the reference taken in add_error_device().

Decouple reference lifetime from error handling by moving pci_dev_put()
out of handle_error_source() and into the aer_process_err_devices() loop,
so every recorded device is put exactly once.

handle_error_source() is static and aer_process_err_devices() is its only
caller, so no other path is affected.

Fixes: 60271ab044a5 ("PCI/AER: Take reference on error devices")
Signed-off-by: Priyank Rathod <rathodpriyank@google.com>
---
Changes in v2:
- Corrected Fixes tag from 1ab4a3c80508 to 60271ab044a5 ("PCI/AER: Take
  reference on error devices"), which added both the pci_dev_get() in
  add_error_device() and the conditionally-reached pci_dev_put() in
  handle_error_source(). Thanks to Lukas Wunner for catching this.
- Removed the speculative topology list from the commit message. As Lukas
  pointed out, error reporting is not enabled on devices without an AER
  capability (pcie_aer_is_native() bails on !dev->aer_cap), so the
  dev->aer_cap == 0 reasoning was wrong and is gone.
- Explained instead why a device with no error status can be present in
  e_info->dev[]: the Requester ID fast path in is_error_source() matches
  on e_info->id alone, without reading any AER status register.
- Added a Fixes tag; the imbalance dates back to v4.20. I have not added
  Cc: stable, since you indicated the path is an unlikely corner case -
  happy to add it if you think it is warranted.
- Cc: Keith Busch and Sinan Kaya, author and reviewer of 60271ab044a5.
- Rebased onto v7.3-rc3+ (f259f446f519); applies cleanly to pci/next as well.
- Link to v1: https://lore.kernel.org/r/20260830-fix-aer-refcount-leak-v1-1-64e1013add12@google.com
---
 drivers/pci/pcie/aer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index d8dcd238fda1..bc761410d56d 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -1340,7 +1340,6 @@ static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
 {
 	cxl_rch_handle_error(dev, info);
 	pci_aer_handle_error(dev, info);
-	pci_dev_put(dev);
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
@@ -1518,6 +1517,7 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
 	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
 		if (aer_get_device_error_info(e_info, i))
 			handle_error_source(e_info->dev[i], e_info);
+		pci_dev_put(e_info->dev[i]);
 	}
 }
 

---
base-commit: a077be4fde21ee6e751fa70eb641ef5d9bf2fc48
change-id: 20260830-fix-aer-refcount-leak-6378f84d62ba

Best regards,
-- 
Priyank Rathod <rathodpriyank@google.com>

