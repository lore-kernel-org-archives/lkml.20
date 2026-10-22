Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792641901;
	b=qzn/ylnyKMUMTopDYsn+hFIT69Bk9CT2587yizwbd0Wy7SK64qJF+nXI6oLIhCq+dTjz
	 2yx3ASpCki+w92Y01V+cV1kU1YerDMwf2fE8fc5Nxn82Xou2MhXwOSvA+kI4DQyCdyRDa
	 RxbioFf3z67u/Oxzx5nAnDoAj9wdBKx47icuS8McXCQToMwdwSgR0DhFwH5TJGmZ2v1Rl
	 rCxZlC8wyWKnLmM2ugloIHO+Q1GXxRd67H7/ugTWcxLeI0Q80WegIoAksyW4QFK35/+Et
	 +QqcFjdGVx7m2GgbI2U4z1OTrUjGrpaSP4/yGK9pPEHME0KmGIdhkBADgvTJUzU26Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792641901;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5Xa/115bcglogo2Lde3OroJ4iJzU0zzKruxbGyxC3XM=;
	b=eqgqt+SSuDmBR1P7lLABn2dGCm7zt0NbOAeTwg54gW2MhE+bhnFku5FJlqi+L5v57r7k
	 qEY5FL08sIPWziiPg798UMjQE7JLKjNgPhmXXDPm52h7gHAqjlOP+QagCH8+/KAkrEFet
	 9DKjYdfPEL9fhdJq5JlyYXkZMLpKHDqBYAsFmAHksV3fYN4DW2F8yVNHWW2Suj/97Eg1P
	 W4+hCiOxOa0KSZNFeCwya9qI5fxofbTj/DKDLpXJr5eR8631hBfaeVUHb2eVDmhI6Is5M
	 NkidKiVrfStHdxFO05kIh8xMQLosLtCBfBlo55iSGkAHB6TqJCzADhXiltF6Ipdz/hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AouYvQ0h;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24700606A323
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24700606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AouYvQ0h
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-363cd582f45so122519eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 21:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792641900; x=1793246700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Xa/115bcglogo2Lde3OroJ4iJzU0zzKruxbGyxC3XM=;
        b=AouYvQ0hfaP5ufZH4BemqOQMOJEq0L1wnpzJ5BykOq6RSnen47+6Rs/gGq56WrJAQ8
         14PWkqd4xWqAZAGmblc8X429oZowoLczvZ2S1vHJrE/GnFnTu/5pr4TSLnGkEgiqXdmE
         8IvN/zLzkTX/HlKwmcjywnqcqXqOllNgjm8Gfvo36PJ8/b4GxCt79gqQ006uVn/uqLBh
         xcgJRhgMJ0E+8eojqisNAFf7MCOAYrJ/PMBzEHCb/vA+Og9lD1XJT/GM95B8duZcVOd9
         2lND1EHRiTlfcMOXweS3ou8OeCxJGxG0T1HStVYbQ98MlHrcNx9Tarx3z8ZFtBZdyxji
         5jBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792641900; x=1793246700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Xa/115bcglogo2Lde3OroJ4iJzU0zzKruxbGyxC3XM=;
        b=g9CBHnq0jr2BkqaFjJsl8qeuMYDQTGTn+/hxbFXow2On2tGEEFsePyDaeENyQ/k9Cv
         RagMTOUKd906Qinl123WXcj6q1tFyCVnziYADI4buckaJhRCoNltFOZN8ZbCN0fimPoV
         c0FdjkMMeVHc6hStm1flMFaUsUJxDj+reHC6kZM4qKbUlJlSgenNyECzjrUikjFa1AkF
         TPDcDmuEvDPHn75knnIffsoy07vyBdaRJdZF14AqRKcxahpfSz0S0pj5b9CAc7cJszIk
         X3ozled1dUx1kSJUg3acGlKPryPCaGiVGfzjrtsqF0Bk8X6c8lCpuXxclLCrT0ho6FZO
         KGmg==
X-Forwarded-Encrypted: i=1; AKwUvByb0PjMd9Wg6bqJnP225v7Nm/cWOtOYVXSVe48SZ488gd9/uOEY8BwHOXHguGwZ1pKhxkHlmOQl9Ryj/ts=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDVhb+8y/DTnpT2Sc5qEYR0OBw9akODEd7T9IGsfsRS27dtTAv
	DCy4nPLcMGqGY3wNJDB6MjUn5FiEFXDLjB0O3yt4K47Ql6q+4FakURfNtbejwzoz
X-Gm-Gg: AYBFou2RhIVQicpaih4HObe4hgsITNPVivekQLwfxZe659RwBT/igSlzjchlCdN8ffw
	qmB71woRFN8TQkcA+xanbw3jiYM5zfvG4B/2+JRnCfleAkt9UMapJbT6BACQR7XfpYs/ZF4ueH4
	Timdd7IKPJujwWesmgLXhJtAgS+4PMUNeSOcZRWUlKrNNKBrZXtsS++cdDm20qaQ/sbolk78Nef
	Ih2DzGP4smuQQV5j7LwCIO5NfkhYtqN0ynW+uUdPZ284VhZeGV3I7/7aha5GM9oO9xyQCVeNAoh
	9oGQ/yUFBZeZLhGTRGOHpicAkBlk5GctDe82r6JgJr9ansY9LmwIWSDlbWuMuwUQSXoKQ/9HE28
	TS4CZpEeyaoR8BUxV8g6O2TYaWxAEh27KCLKFWYjExeoKWLakBnyH/1tQ8tWiQ+QHhmATdlVv0I
	xEYrWPRbwlvZIzbnMzMlV0EPg5Ur26Psvfnt8BqWwyp6K4fPpBCyJXKk9nvV2/6GWaxeDKRh9ZJ
	gcMYwurBiezugDVJpW816it/V0YAauqNk0eVS8DwyfHbL5KCDJ0tx5qZRWBF2eZsqYw05+dXnBR
	wL3AcbqRKMjIQEqibk9hkuG4njDU2ctlYKw9vj6ya9kO7OZvU3r0XyyefVvsPAF5eCfX8ffdfok
	=
X-Received: by 2002:a05:701b:4301:b0:190:e602:c769 with SMTP id a92af1059eb24-190e602c831mr7355159c88.1.1792641900034;
        Wed, 21 Oct 2026 21:05:00 -0700 (PDT)
Received: from cachyos-aura ([45.112.149.26])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903d3ae06fsm10950539c88.19.2026.10.21.21.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 21:04:59 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] mfd: intel-lpss: Set d3hot_delay to 0
Date: Thu, 22 Oct 2026 09:34:53 +0530
Message-ID: <20261022040453.45797-1-navonjohnlukose@gmail.com>
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

intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
LPSS controller still sleeps the default 10 ms d3hot_delay in
pci_power_up().

The PCI spec asks for those 10 ms on D3hot->D0. Mika pointed out that the
LPSS controllers are not really PCI-connected devices, so the delay is
likely not needed. quirk_remove_d3hot_delay() drops it on several older
Intel chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
same for the Intel I3C controllers.

Nothing misbehaves with the delay in place, so this only shortens resume.
On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the touchpad's I2C controller
autosuspends after 1 s idle, and the first report afterwards waits for the
resume. With d3hot_delay set to 0 the i2c-hid interrupt handler for that
report takes 1.1-1.9 ms instead of 12.6-14.4 ms, with no I2C errors. Only
Arrow Lake-H was tested.

Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>
---

Notes:
    Changes since RFC:
    - Drop RFC and add the review discussion to the changelog (Andy).
    
    RFC: https://lore.kernel.org/r/20261016114347.23633-1-navonjohnlukose@gmail.com

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

