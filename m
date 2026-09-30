Received: from mail-vs2-f36.google.com (mail-vs2-f36.google.com [74.125.227.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755D251FCAC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777993; cv=none; b=tCFZxoD+BADWx3Jh0SaqTxm8cMX23F7FvxMYS2l4h0Z9mJxYw9ey/oODMqwp8OPumh8rvpSv1ub2eb7MSBFkkRNwwJxFC52aebmq9UIAb+CmtNciVdpvoiCfvB/NDB3pmsKebqW4LJvc8Jtn6DDJ0HVHyOr7ldHrmGPk5eF9Ocs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777993; c=relaxed/simple;
	bh=U1Hv6/gbhpsi4CJd465niF6KPgOjs6MWfvNINhsKhE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0pJU6z3tsAAv3bOm060RveKz/Pnoi3vfW2f2Yu0MtxQIF9MSYIcpBQ+lYaSDcTpwWNeu75Fs62JKB9pxqwKPkC+O/FmLbFMIDa+Y2aF0JFxKY7UhJp5nmSO541blxKM0lHuHeoubwNpy4eNIPMKEb7W+aTOkplhPmDYkAQFPv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hc1hCklb; arc=none smtp.client-ip=74.125.227.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hc1hCklb"
Received: by mail-vs2-f36.google.com with SMTP id ada2fe7eead31-7bb9fe18227so745805137.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790777973; x=1791382773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oDyoA6fPjL0gLEUmJ0mu/HGgXQ0U83ukGEwv6gW1b4E=;
        b=hc1hCklbNGbvVzTCNeHVUUS3MyKxCW5enS4lIjnTEGnbck1hDvRECF4oqYwwzIAuAd
         ro+V46ncL56YoRbs6XUvPSJsJlUwe74Kn/aMEbyvJd4T+8RFvCtmi0lKtmn9pmLj77FT
         e7X7mjuE37dgKfckbxbuy9eISFsTc6XNmReqeQjAbFW4O5p5IsxlskNrGsMBrOK3AUyy
         4gRLCnWcWdGju3sAHUVD1t4VsDiCyzB7TeU12rlhXCxUw26a0TsD1jHq+4hZN3z9NMd3
         ggQQkvYV18q639wncO64B6IOuopIp4s4Wu2rVFE+Zj2NAewnu32NYwltRVD8CN5+M/co
         GT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777973; x=1791382773;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oDyoA6fPjL0gLEUmJ0mu/HGgXQ0U83ukGEwv6gW1b4E=;
        b=VX/i/+Vmgz2fDwVxwOvUhgrIYiWTHIBpfRxeRpk6HQGt1ass48EY6NbnpzJUMCG8ej
         xZxNw/VKdeVAyMAMW9aGH8J8pgOZB2B5WyItkcgwItbn5VI+w/2ZxdRw0AaKg/XRma/z
         wNEALfprFWaHIwfIktpF2dEJHumoefgyymqxZ1REEkPQ5nMgC2lS5nA+GVDwClqoVMfh
         Vn4VzpeGfdGvO0BLHtyZzI0UMIcKlpZ2V1qpi4eF6xz7M4ELH3cc0YSzTxJAWnj6+VdU
         m/TspLVTjHcwVk5wSKIN7+xI+OEjbC/EpzDS0BqcAuA5GjYhM98oL/NWDB69KKRyXReX
         b2QQ==
X-Forwarded-Encrypted: i=1; AKwUvBzPIwdez0zJIycx2sarzwbxjBHHwlrlmyYq5qfyocR7rFnhZiCU2GShuU71KOZdY40/Nm2oYf1W+AWtflE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsvBVYqHn2eZLgT+lIStuAbRKzEzMJJgdPf+/4mMISb+Xap+A0
	7smvqpLzcjxP8f4AuD2vtvhAe0rpQA3upyZlHyncI6v7cAvM8TzG91DJxkYl2g==
X-Gm-Gg: AYBFou20uLMC+ypeNeppAhlBVkQVqqSeakJz4SZ+oQN8v1elXuS08Pg6xko6gZNDW44
	srMXKUW+Ci+MlH8vSQgxVAyX1eTVDfSenB2ynqbTuP36IwTwsA0mnk2ZGuM1CnSmsu1CrGg6eIm
	E0zKrZHTp+FyIvqmV8vwjfJ2ZL1ifWhRagaTM2Q/qstiZpiIxwUZBCfDt1yQp4U9kwXuCMYne+6
	iWNZh1X0FlJJkk9vA83Dw9H42lmuqdrPOUT6tdFWZ154laXQxkQ2MBDK5UXKSzMKoDY0FmlF56c
	X48i3bpyDiYsGeE3dRNYpENgf3T7syO/3net4mGno5Gvs6OCAVZm39GTB7+u3HeoSAdR6Sp0hfu
	mK67hFku24z+InVNbf7YV1XQGH5aUblyJK1FWcEQ9pHynrli34DFzaZ2ORiXX8tJxEJQrw7XS/1
	aIjDFJ+IlT11qKBQMc1Ej6kCZPM6JwR8T8kG/BvAnZ+Yda74BoUN8JhYqdz/GVKeNZRZkBkapGh
	U6NYJcu
X-Received: by 2002:a05:6102:5cc5:b0:7bd:3530:d84b with SMTP id ada2fe7eead31-7be72eab133mr356318137.6.1790777973185;
        Wed, 30 Sep 2026 07:19:33 -0700 (PDT)
Received: from maclinux ([2803:c600:9110:8ba5:43a9:9b8b:ebdc:6411])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-988d909c4cbsm1793220241.1.2026.09.30.07.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:19:32 -0700 (PDT)
From: =?UTF-8?q?Francisco=20Beltr=C3=A1n=20Millal=C3=A9n?= <fbeltranmillalen@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] PCI/PM: Do not save the config space of an inaccessible device
Date: Wed, 30 Sep 2026 11:19:13 -0300
Message-ID: <20260930141914.6678-3-fbeltranmillalen@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
References: <20260930141914.6678-1-fbeltranmillalen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

pci_save_state() reads the standard header into dev->saved_config_space
and marks it valid without checking that the device answered.  If the
device is not accessible, every read returns all ones, the previous
snapshot is overwritten, and pci_restore_state() writes the all-ones
values back once the device answers again.  On a bridge that sets every
writable bit of the Bridge Control register, Secondary Bus Reset
included, and sets the primary, secondary and subordinate bus numbers
to 0xff, which cuts off everything below it.

On a MacBookPro14,3 this happens to the upstream bridge of a
Thunderbolt controller that drops off the bus while the system is
suspending: after resume the bridge answers again, but with bus numbers
ff/ff/ff and Secondary Bus Reset asserted, and the xHCI controllers
behind it are removed.

Commit e18d1abc3bff ("PCI: Avoid saving config space state if
inaccessible") added pci_dev_config_accessible() and checks it before a
reset.  Check it in pci_save_state() itself, so that system suspend,
where the state is saved by pci_pm_suspend_noirq() or by a driver's
suspend_noirq callback, is covered as well.  pci_dev_config_accessible()
reads the Command and Status registers rather than the Vendor and Device
IDs, which always read as all ones on SR-IOV VFs.

Check again after reading, as the device may become inaccessible in the
meantime, and only then replace the previous snapshot of the header and
set state_saved.  The capabilities are saved straight into their own
buffers and are not covered by the second check, and both checks are
racy, as pci_dev_config_accessible() notes.

If the device is not accessible, return -EIO and leave state_saved as it
was.

Assisted-by: LLM
Signed-off-by: Francisco Beltrán Millalén <fbeltranmillalen@gmail.com>
---
v2:
- Use pci_dev_config_accessible() instead of reading the Vendor ID,
  which always reads as all ones on SR-IOV VFs: v1 refused to save the
  state of every VF.  In the v1 thread I said I would use
  pci_device_is_present(), but for a VF that checks the PF and cannot
  tell whether the VF itself answers.
- Do the second check after saving the capabilities, and set
  state_saved only if both checks pass.
- The bus numbers are set to 0xff, not cleared.

 drivers/pci/pci.c |   53 +++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index b2879a6be..94de99d31 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -1776,31 +1776,52 @@ static void pci_restore_pcix_state(struct pci_dev *dev)
  * pci_save_state - save the PCI configuration space of a device before
  *		    suspending
  * @dev: PCI device that we're dealing with
+ *
+ * If the config space of @dev is not accessible, nothing is saved and the
+ * previous snapshot of the standard header is kept, as writing back the
+ * all-ones values read from such a device would corrupt it once it is
+ * accessible again.
+ *
+ * Return: 0 on success, -EIO if @dev is not accessible, or another
+ * negative errno if a capability could not be saved.
  */
 int pci_save_state(struct pci_dev *dev)
 {
-	int i;
+	u32 config[16];
+	int i, ret;
+
+	if (!pci_dev_config_accessible(dev, "save state"))
+		return -EIO;
+
 	/* XXX: 100% dword access ok here? */
 	for (i = 0; i < 16; i++) {
-		pci_read_config_dword(dev, i * 4, &dev->saved_config_space[i]);
-		pci_dbg(dev, "save config %#04x: %#010x\n",
-			i * 4, dev->saved_config_space[i]);
+		pci_read_config_dword(dev, i * 4, &config[i]);
+		pci_dbg(dev, "save config %#04x: %#010x\n", i * 4, config[i]);
 	}
-	dev->state_saved = true;
 
-	i = pci_save_pcie_state(dev);
-	if (i != 0)
-		return i;
+	ret = pci_save_pcie_state(dev);
+	if (!ret)
+		ret = pci_save_pcix_state(dev);
+	if (!ret) {
+		pci_save_dpc_state(dev);
+		pci_save_aer_state(dev);
+		pci_save_ptm_state(dev);
+		pci_save_tph_state(dev);
+		ret = pci_save_vc_state(dev);
+	}
+
+	/*
+	 * The device may have become inaccessible while it was being read.
+	 * Keep the previous header snapshot in that case.  The capabilities
+	 * are saved directly into their buffers, so they are not protected.
+	 */
+	if (!pci_dev_config_accessible(dev, "save state"))
+		return -EIO;
 
-	i = pci_save_pcix_state(dev);
-	if (i != 0)
-		return i;
+	memcpy(dev->saved_config_space, config, sizeof(config));
+	dev->state_saved = true;
 
-	pci_save_dpc_state(dev);
-	pci_save_aer_state(dev);
-	pci_save_ptm_state(dev);
-	pci_save_tph_state(dev);
-	return pci_save_vc_state(dev);
+	return ret;
 }
 EXPORT_SYMBOL(pci_save_state);
 
