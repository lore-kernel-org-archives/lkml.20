Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794389452;
	b=TP5mwU2zFXRhlDpQckm7M62svy7bk+5BP+Fv3STbmGQY9i3Rbpz9NJ5a2xXvKb+s6XwI
	 692EBYmopbGRXOqmvyedyaEQ2HqYnTFzGR1cLg0joJMkrpxHL90zUL7Qy/AfMbFXwrfSN
	 FNIflS7mJMZPHrSZjy3gkmkrdxmuqaacUprdgcXgnrV+KNU5tIxODmPdGoC/zUsLtX8da
	 2kszFN8IRzX7rvjFCDDDX3xhowgiZT9iARRB6hUwgTyFJ6uiOrhfi+t/vnEHLKoYWXERO
	 rv3PcK2DGvrs/6u8lvnC7M4Lv/ALaZIsrMSB+ELsG7yPnGOBZpBlBQedWcnC2K5gXNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794389452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=um2R5SpVc8daNcOs4qf45cuP9GuM58HqVfWdcuuni5U=;
	b=SH879gHVjCGEowm/WRMJlxsieKB4ICB9o9lV6CumfTiwyR3VToFAfO4ZZG2WsY9vxpJa
	 2NvCRbhLxL2Z+skTF7XJnD3VdnM6+8BDVWsBm0l+oVS1bMD/ARNMY9mRQD/IyCtwaXGKk
	 1fILaSv2LIsU5ng4yh6BC0Hv5bQsB76F5NV6VRv/wMuCBf7t5h3KeYF09R5kedePUN8h4
	 7xNEqpKxLw27eALGqOmlBLXf37pa2wi2jW3J3sz3YzXhHuIltlUNASEAPeRehfPzeF9k2
	 4lyYVF57EBmvPV7sg8+B0pOZBOTIg2KkFOAuj8QqLQPrqDKq1ryFO/+8ldhttMdDzYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E57jlpa6;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A943606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A943606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E57jlpa6
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso2602600f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794389451; x=1794994251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=um2R5SpVc8daNcOs4qf45cuP9GuM58HqVfWdcuuni5U=;
        b=E57jlpa6Vs6e1i3nKvCpjZpzm7ci9u/J/XqtTCOZMfFfoteIFJuP7zC3sPtujEAAmG
         wYTXJn3Rbk+jy+0+vDXyjlfgggPeaJIkcgOiEkiVy0OPc0B2WzyzBMlg/wYB0VMfLDie
         y8+re7NbvCoPWAZaAw0U+pf2QyHfldwnyLBqbnET+OwAlIpHSrs2xgm1BuQIkz/8Oi4v
         44g/A4qGsnjH+Gtsthd8C3Azy8y3N0deRf/ZD5GzIiir8uJPU2ipD7V0PaFLANwGIBs1
         rPU2ZSo4gsMPdAxqk4BQXMo8TGyXU7xkbG7FmFRtgdcV9CbhHKJMIOZZrAUSs1TMj423
         8cZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794389451; x=1794994251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=um2R5SpVc8daNcOs4qf45cuP9GuM58HqVfWdcuuni5U=;
        b=V/5RJfzI21fGNTcMsyNwOTyU3/vTz1LmRr/QOTBqCewWWHKHliDn2F5gr2JNkw5F3j
         sBRxYkdvqWCmldng1ftA4lGAUoIZnZAwL6gDCZu90+WOhlDOmBZYufBFJv648+ZH3u6n
         L4S5kblBz/xo9UoDEvA1XhHFKxR+iZkfyqAhbDo7CjCIcj8QaOCt8+Pefq63Ftvp1Qt9
         dkDurc4x1UBi7S6DSQ9IFxQyJutCyWCLS2ANZrD1gYkeraDDRK74ZdoaIPNA6jBTy5D6
         4povy2pUrug6qArN/7YAzdE4iaogkt8h70iUO0PJHZpT7TSLHnWYdJwq6iKa/WVJ8w0B
         Sh7A==
X-Forwarded-Encrypted: i=1; AL+hErGv1tzt3kmANKxfaspYBjdiO2FTsk1ZhD383SqyzfJlTqodIk997YUyB2I5hVBHzphnPXKk30J23o9sEzs=@vger.kernel.org
X-Gm-Message-State: APuU4Z88Vmghi3wNRG42w6f9WvNpq9R4qb7yJNX1Sv2Kn8mHaW4vGDy5
	14yxdnQY320bvHAQi/XRnztl6pSmv6vHsuKkCo01dmKy4Jze7G4ch4Y+
X-Gm-Gg: AYBFou2m2j5vDTRyXWdCGjBX8j5U2Pvrk9NYN+0Djxr/TUjHCfqbl/IGfdpzrSiMn2z
	hjOun0JaWemfmcZYrRndpaoj7yYeF20j3Fpr0en7PNZGoxlp6HCzoIixB/Rok2Wzw7e1KtCnZnW
	6URfVkV6YkTGObciPeGVs0pbG2lFsOI0IuPtgcAfPVJHcKkUHoJdLXkbGwCnBRj8i2p3nnpvYkG
	R9dsyCNZOktgXbhVFueHEFrqjk3j/mrE0vck4yo/+5J4BjH2ilWxhxSObcVbkIPK2J04ywrOw3+
	hxkTPsShEh0zbwTI9msiFhzcWrEMgxcXBGOaCh0PCI6dYgE6mRFaIkEZwzkG8/DzHS9JHfBNfAa
	SC8YZPIJU0QXJTo7mcWdFTFm0p/gN71yiirkhrSVMRFSqTekuBy4nYSXLRAR0WTrQIrH8arHy5W
	hetDYjpZV5bL/uuVSUkaM2AImZlsi3VkPmM0LjYcs7hdOVbWqabamSwD+AzOULa0NUh2gk9qyCT
	EWdbBIcas2SvgYCmT1RanTWDM3phxo9DTPYjPvWL4n/qUvRxOnO7lMsi8AAd21A1QMJX++4K/R8
	GcBPKPB1NDhSPPynMF6gwaXhVL9DXzQZoZEjQ7c/BKSaqT3myLwmVtHKbsZKw07VPpA0pMJQrO5
	3MgHI7N4IFgFnTt8YS15xdE9vu8TlEJRuDB+HF+Drz5jfNpDPYkSvN5Et3hGI1HRNSNRlzzrWpP
	raMKI7WO/AKZQ=
X-Received: by 2002:a05:6000:4917:b0:490:6e0f:a024 with SMTP id ffacd0b85a97d-499c69ca529mr2701747f8f.13.1794389450677;
        Wed, 11 Nov 2026 01:30:50 -0800 (PST)
Received: from AHERLNXVDANI01.lgs-net.com ([193.8.40.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498362eb14asm9175839f8f.34.2026.11.11.01.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:30:50 -0800 (PST)
From: =?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
To: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org
Cc: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	dima.ruinskiy@intel.com,
	bhelgaas@google.com,
	linux-pci@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Via=C3=B1o?= <danividanivi@gmail.com>
Subject: [PATCH iwl-net v2 1/2] igc: don't disable ASPM L1.2 from __igc_resume()
Date: Wed, 11 Nov 2026 10:30:34 +0100
Message-ID: <20261111093035.513635-2-danividanivi@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111093035.513635-1-danividanivi@gmail.com>
References: <20261111093035.513635-1-danividanivi@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 0325143b59c6 ("igc: disable L1.2 PCI-E link substate to avoid
performance issue") disables L1.2 on I226 in probe, in __igc_resume()
and in igc_io_slot_reset(). The resume path uses
pci_disable_link_state(), which takes pci_bus_sem for read.

__igc_resume() is also the runtime resume callback, and it can be
called with pci_bus_sem already held: pcie_do_recovery() runtime-
resumes all affected devices through

  pci_walk_bridge(bridge, pci_pm_runtime_get_sync, NULL)

i.e. from within pci_walk_bus(), which holds pci_bus_sem for read. If
the igc device is runtime-suspended at that point, the call chain is

  pci_walk_bus()                      down_read(&pci_bus_sem)
    pci_pm_runtime_get_sync()
      igc_runtime_resume()
        __igc_resume()
          pci_disable_link_state()    down_read(&pci_bus_sem)

A recursive down_read() deadlocks if a writer (e.g. a hot-plug event
adding or removing a device) queues on pci_bus_sem between the two
acquisitions. pci_disable_link_state_locked() cannot be used instead,
because on the system suspend/resume and ordinary runtime resume paths
the lock is not held.

The call is not needed on resume in the first place. The disable done
in igc_probe() is recorded in the link's aspm_disable mask, which is
only cleared through the ASPM sysfs interface. The PCI core honours
that mask whenever it reconfigures the link, including when the device
returns to D0 (pcie_aspm_pm_state_change()), and pci_restore_state()
restores the L1 PM Substates control registers saved with L1.2
already disabled. Drop the call from __igc_resume().

The issue was found by the Sashiko AI review of an earlier version of
this series.

Fixes: 0325143b59c6 ("igc: disable L1.2 PCI-E link substate to avoid performance issue")
Signed-off-by: Daniel Viaño <danividanivi@gmail.com>
---
 drivers/net/ethernet/intel/igc/igc_main.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/ethernet/intel/igc/igc_main.c
index 62a7c5178..1b5dcc166 100644
--- a/drivers/net/ethernet/intel/igc/igc_main.c
+++ b/drivers/net/ethernet/intel/igc/igc_main.c
@@ -7585,9 +7585,6 @@ static int __igc_resume(struct device *dev, bool rpm)
 	pci_enable_wake(pdev, PCI_D3hot, 0);
 	pci_enable_wake(pdev, PCI_D3cold, 0);
 
-	if (igc_is_device_id_i226(hw))
-		pci_disable_link_state(pdev, PCIE_LINK_STATE_L1_2);
-
 	if (igc_init_interrupt_scheme(adapter, true)) {
 		netdev_err(netdev, "Unable to allocate memory for queues\n");
 		return -ENOMEM;
-- 
2.53.0

