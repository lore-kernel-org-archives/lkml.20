Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D21E260C
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151035; cv=none; b=J5wjzp3l9+h3m0e/sosFF4pgDLV0db33wfPkNfAOZdcWUDIuNfud/GbjYAnua4ZFHVcn+NRywmHjaim6AkY7XasZJ7XFQBeJgbHVqLWO5/aB+Jmt0foyDsXdRZnt3M+XAXPxXj1kUlwBkfAV3I+zXYqsIPC0ovaHKhkOjdV+XH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151035; c=relaxed/simple;
	bh=F0lN5jNXo1HR/IXIt1s5qsnfRbMoIHmvZzGoYNgvGw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bH7XP0KXh4Q3ueDKuOjZpog/VVaGy/T9ypjSSSiUSm5pO2nyRk4OGY2ikCZPuZJnwEeB6uFpgwMYVZ1OTMtGjz+8WRttudXknezU5w2OdentniPhmRNOuKZJ3bAAHyrb1IjL/zC1f6nRBXreWIkkyMV0cNRKmUr+rIewR9gufLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pADzAER7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pADzAER7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ac7a053626so340006a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 04:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792151033; x=1792755833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S+td6jQ9eFxr+J3I9/ZGxjpxAlBZ9KrGIzgJ7io9vyc=;
        b=pADzAER7VsYf6rl0PBo/iKht+nB23rRfE2m18xeRcSdxTunPtcRxSrAkuFnxca928A
         k2sJpaHdXzpXkSmVX7L6SpnSqb8omugUOliOKhrlxkxGwDKuMULN1KpQgZ61WlePdPFx
         BPmQKIehy7MxTK0+G822TfRLVJgihnh1BXuCoWcP72Og1jumcdABRIB/tnYJcqbC5rGw
         llx8V6adFTedHkxZHJacEeoXWJspxkfNJGYjaxgJ9KqVzczUXWoP0zagsauVgcWgVSBx
         2FlTLELVj3wTKi3AkwG8QJjDFgoan+Hq1e1tAsjaah74N0SOPLgm7iajxXuVZRNfGg+W
         TsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792151033; x=1792755833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+td6jQ9eFxr+J3I9/ZGxjpxAlBZ9KrGIzgJ7io9vyc=;
        b=xAtnaeTODIP7AzFvV0Yhm1eIjQqep0Yh7ziTLVrR9XRXS4jH/OQrBKxc3cCDKVnqE4
         zgchgt/ZTknC9hG2T5GrS+ublqFHs9OQYBpNvsI7IJId/Mw6SKiUuFTS8NpqcZWHny27
         3H7Rx5N3CLHj1Dq9ndkARYuv2UMBRuyIgaMn2oNLW4wqLQdvyB9kdeCEa+9lRA3klB68
         Dfch4751P1XD9xTr25o1Q7wQBCx9RRGTCS/wChwtXZ54gW/Ga/yAVXV4GSv7FwxpNDlL
         OAeSWZN+q/p6fFwmy8j9Eg5M+yhqZsHPtfynAhp8JtyUbbNfv9WWc3K3jFJe6pusBoIc
         iJ9A==
X-Forwarded-Encrypted: i=1; AKwUvBzp4lAUPFOoNlWjHTKD71VC6AZEeVD87xKmXsHIxtmgMGfK9WyKOljPr581QMuOLdeKX9G4U9yG8tNfDh0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIJBLPzWzOQPNdfMhSWzvMXKeAOsvbHUUBarusJgkU6JJBFzpzV
	Uh+lhNDsuQexCiittXWj8Kjzp6N/I/a7XPmUT9Cl6aZLua/0iMWyd1Ds
X-Gm-Gg: AYBFou0BpxXS+b2ooqJyHxpPK8pWx115YFUW2k+FjuSxjAtnZxNjtvMln224ScC6wsW
	JEOgGGDO4smd1QUkVmhu62kv5ZeZ0PF0IVY7uK50MGfelSpsyTkBynsr/lpb7FVZFUz/G6DIIb4
	s/LJwuhvKmcmMfMHmPvbTWvEdMMdqhGXAL1PQmgH65+370M4WhPES0ey81kJkTpNMb2yBld8Q5A
	VDd/7swJmNQyMG50UTmrxp2oYDWNFy7BD/V6XTFyLIS46wMaxHQofacF4b/kaTjZFlJDKJWQzQs
	2yLhzWRG+gCGA9WMUc7bndsrqJqo0HgOExpmIGPQjrAuZGf+EEzXeBTub8VBPy5Vzu0OpK5YXOq
	3oK/tPn93j2CNHUe0nTd0+WcibQ9tGwWNhv3HRxR8EwN45x8Taoc9JpvSqJQ2HXQs5NHoj2taXQ
	NFff0P8RkSR/x6ruIo2AgourqgZtqfxqi6njBa9UcOxJFDXJi1boWsxO/MUKzW4fViL/+4XsRvd
	JJt8ewJJn+LUFC6rE4p/PIz4FmA5zd4+RgyfgCC4I975U69+X8LJld3P04sllex8og10rpuF54v
	4xGuJxCZtNtHtIc0xw==
X-Received: by 2002:a17:90b:1d4f:b0:3a8:736e:c19b with SMTP id 98e67ed59e1d1-3ab3ab31007mr31561330a91.4.1792151032639;
        Fri, 16 Oct 2026 04:43:52 -0700 (PDT)
Received: from cachyos-aura ([45.112.151.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607bc950f9sm7108349eec.0.2026.10.16.04.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 04:43:52 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>
Cc: mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] mfd: intel-lpss: Set d3hot_delay to 0
Date: Fri, 16 Oct 2026 17:13:47 +0530
Message-ID: <20261016114347.23633-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
LPSS controller still sleeps the default 10 ms d3hot_delay in
pci_power_up().

On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the delay costs 8-16 ms per
resume of the touchpad's I2C controller, which lands on the first
touchpad report after each 1 s autosuspend. With d3hot_delay set to 0 the
power-up takes 64-256 us and the I2C transfers that follow complete
without errors.

Commit 815b4448198f ("i3c: mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel
controllers") does the same for the Intel I3C controllers.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---

Notes:
    RFC because I could only test Arrow Lake-H, and this applies to every LPSS
    generation the driver handles, back to Sunrise Point. Andy, do any of the
    older ones need the D3hot->D0 delay? If so I can limit it to newer IDs
    through the driver data.

 drivers/mfd/intel-lpss-pci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/intel-lpss-pci.c b/drivers/mfd/intel-lpss-pci.c
index 63a3fb58566..5672f033e5c 100644
--- a/drivers/mfd/intel-lpss-pci.c
+++ b/drivers/mfd/intel-lpss-pci.c
@@ -70,6 +70,7 @@ static int intel_lpss_pci_probe(struct pci_dev *pdev,
 		info->quirks = quirk_pci_info->driver_data;
 
 	pdev->d3cold_delay = 0;
+	pdev->d3hot_delay = 0;
 
 	/* Probably it is enough to set this for iDMA capable devices only */
 	pci_set_master(pdev);
-- 
2.56.0

