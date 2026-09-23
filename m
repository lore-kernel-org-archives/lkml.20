Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA5D369D56
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790130323; cv=none; b=V3U01vS30+FUoozD+Z7+KLfD2i3v9nnyI/94kXOL5p+OQrlNSQ+b3PWuc6A4y2NfvkH8ZKnB/ls0dJU3WcI+aWvBUmfJpYr5ezUO8jTsoRxHXl3c3Lo8g18u3zKxFnqJiVIWxlnElNaLBwIqAcaZipD3et+Kkn+2WZKPjd4X/Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790130323; c=relaxed/simple;
	bh=g5XxiDFghNFRNW5IZuQbEjg3YtPgkCJzRoomlBMAd5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WYLhhVnO3EOD16SlThq8GabkvLJznueQpS8LJA6rGc5ec4wBw8NhEYm7pEWRO24/GDJwfpfn+NTk3BojjflkyDnr4ZoOCEuzLIJovlTRg3VoV1G8LfzCIHBoBuFxTTBh7fMG47+VybJ/SL+db9ChdVEXblihzK7Bd6Hh2nCfjQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRXZCerT; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRXZCerT"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33eb5e1df62so22383eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 19:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790130320; x=1790735120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OW8pONdYaJOrcraRgR272mPtvH+JxyXPDb9LA5IdPHg=;
        b=YRXZCerTNuNPOuZkZCXN/McoJmBVe19ihdI3AeGt3634LRZa8Mf3VDeLVL+Q30JW61
         LI1sOMmXsrbXouFz10DcrIDU90FJoi/6QaLMe6odwETrvjK7gMP3Xq5S/C99l6jQlJn5
         zBR4Dg+R9ItyFh/lfn4OHYxrFAWrBAw4gGO1Wx5bwrSUON0FlOXfiUdPKZ53c5cumbR2
         dEiVCjapPq3kT9mtAUWrW6Bx2Xide+9yVuDNQj6ktRhVSKWBhr7fJbxSg4K8hfRtgG3t
         aznR7cWgZD18oWg7aMRAWYp+YNg+2son95hXryjDQDT+sq32/UJozmUT0RT55w2SL99k
         axJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790130320; x=1790735120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OW8pONdYaJOrcraRgR272mPtvH+JxyXPDb9LA5IdPHg=;
        b=iX7VYxXBGsONLeTlWSUcpCLeCKtdkyJZQ9T8z6CZNx0IPYZ4kUPizf/ZotS58LAdrf
         ELj0fZ0ETCsyhQhwylywFGlGGY7IzcXkLFggHF8Edfds/EO0NCqwewzkPTcx9P4PVSDZ
         Z1+AYycPvRFtN3ScVQERl89uze2kP67wkrxpebpxmb5aTUReR+4hgJLEwlhi61didwSu
         ot+pz52xoLlsSNHQx8bGyEZxGehurjXQs5NcsIxH63RPoE9Cp++knVJ3gyoqwa3PCq/w
         pS6tzzNOJGK4vy/fzyUdBINz+n0WqFybXqyKl6DGvIQ01lryuPkKhEZrjmuW+kQwbCEZ
         NRNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgKQWB6RpKPWn5uXzq7pUxJ5ds+4LTx6AjDkY2uDSwrJXY12kjBZIYP4jsV/DX4X9G9iIJXzEVEmT7az4=@vger.kernel.org
X-Gm-Message-State: AFuF++n/NmkDQH4V0V/WT7bktz/eijxa1iUV2yulfqEzFCjL11eriP+U
	0RSPj+4WKuxr/D3cNNaAH3mubKpA4KO1SscSitLIBU5U5EQBMVfYht66
X-Gm-Gg: AYBFou0icjAW9LAOlSt05fUWbGYt4fDEGmHASuRJ1QLo9VQn+I7Mz/U8g1GCmLPOc8/
	G2nsZXqBbzYaZEL4+jbyE6xVWxeyU2eL+RafM7tV+ltJDfeZC8TpeJC2K6C2vUJxQg5f9NPkUAl
	9M9pP4aLzBu4PCFmRTsdMXkX2eh2osJIgAv+S8m+t5bcCm/jW2daJrBp7kMz9rfswx9YjXkRfzN
	JX++SCAzJmJD7EbO47mJftgAAy+05FTqR3WYsOlXxoje5bpACHUVrTvT07Yjz3bjMkmDhJYKFia
	V/DJXW76tHHDOtIP5kE4SFbNBCHULLt2tUCGCMKdSP0ej07v67VZ/xtxBWlAEEubJuOMTdC40wj
	ImTX/07YRGWbubomwYL8BhkJTX/M0fO9sMLNN9b64j9bzPRevk4EakgDTyKiUQmHbSQyndZ+591
	m/S1Cr5zuQ+oJ3UMutkSBB9ZDk+R3e5M5GYvX73IY3gwsdOWm+RRLANdR4qJZL0EXaqrDcqNaDq
	dJiiApF+PwkozveLRpzbb1JgiP80bjVLO80qTmE89tq5f3PtmF8bdvQ/uLzBKn9dGm+LaajLnPq
	3WplHnHAXkzTSE6X1w==
X-Received: by 2002:a05:701b:4508:20b0:13e:5a51:148c with SMTP id a92af1059eb24-144f9002ab3mr1914745c88.0.1790130319575;
        Tue, 22 Sep 2026 19:25:19 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm2972435c88.7.2026.09.22.19.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:25:19 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lukas Wunner <lukas@wunner.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mario Limonciello <Mario.Limonciello@amd.com>,
	linux-pci@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Navon John Lukose <navonjohnlukose@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] PCI/PM: Skip the suspend_noirq config save if runtime-suspended
Date: Wed, 23 Sep 2026 07:55:11 +0530
Message-ID: <20260923022511.24932-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_pm_suspend_noirq() saves config space unconditionally when the driver
of the device has no PM callbacks, which includes unbound devices.  If
such a device is runtime-suspended, the bridge above it may be in a
low-power state with the link down.  Depending on the platform, the
config reads then either hang the CPU or return all ones, which overwrite
the snapshot taken at runtime suspend and are written back to the device
on resume.

Skip the save if the device is runtime-suspended, as pci_pm_freeze()
does, since pci_pm_runtime_suspend() has already saved the config space.
Use pm_runtime_status_suspended(), because runtime PM is disabled by the
noirq phase and pm_runtime_suspended() would always be false.

Fixes: 931ff68a5a53 ("PCI PM: Restore config spaces of all devices during early resume")
Cc: stable@vger.kernel.org # v6.19+
Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---
Found on a Lenovo Yoga 83KF (Arrow Lake-H).  A driverless O2 Micro SD
reader at 57:00.0 with power/control=auto lets its root port 00:1c.0
runtime-suspend to D3hot.  The port then swallows the ECAM reads in
pci_save_state(), and the forward-progress watchdog raises a fatal machine
check at the ECAM load in pci_mmcfg_read().

The same port returns all ones for CF8/CFC reads.  A local quirk hid the
reader's extended config space so the save did only those reads, and it
was tried once on each kernel.  The unpatched kernel still died, and the
patched one resumed with no "restore config" writes for the reader.

!pci_dev->state_saved would only work for one cycle per boot, because
pci_restore_state() clears it and pci_pm_runtime_suspend() does not run
again for a device left in RPM_SUSPENDED.

Stable starts at v6.19 because the fix relies on a2f1e22390ac2 ("PCI/ERR:
Ensure error recoverability at all times").  Older trees still return
early from pci_restore_state() when state_saved is false, so a backport
there also needs "pci_dev->state_saved = true;" on the skip path.

Tested on 7.2.5 with the root port in D3hot, three suspend/resume cycles
in one boot.  The unpatched kernel dies on the first.  W=1 and sparse
clean.

 drivers/pci/pci-driver.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index e16aa59dd..bdc8bad57 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -915,7 +915,15 @@ static int pci_pm_suspend_noirq(struct device *dev)
 		return pci_legacy_suspend_late(dev);
 
 	if (!pm) {
-		pci_save_state(pci_dev);
+		/*
+		 * The bridge above a runtime-suspended device may be in a
+		 * low-power state with the link down, which makes the device's
+		 * config space inaccessible.  pci_pm_runtime_suspend() has
+		 * saved it already.
+		 */
+		if (!pm_runtime_status_suspended(dev))
+			pci_save_state(pci_dev);
+
 		goto set_unknown;
 	}
 
-- 
2.55.0

