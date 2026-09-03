Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE694E13ED
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449751; cv=none; b=ZVbt2frME/Kw4muCchq6iQje3P4SPQtfy/KOaKbCnN6EtrRMEWgeMsI3FFhQE1DpaAsw1FXGADaKDo796ucQaRnu2akmBuPysOnfqhuDe5ElWqPbnCYya/gp+71wnJ6qZ+tf2UcLzZIDl5HLE/JynS7Iv5uNKYJ40+LUPSjUcOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449751; c=relaxed/simple;
	bh=ncJ1Z5b6dglmAecDwCPhVPH1ci0n4/A+38nkG7EOi9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=glMsHqgHtkyQTSaZiQyZ1gPw0lwkVwjSj4e7GW/C2qXmKGClic8SjSz9l5I1K6gXwMtOP2WxtlAD7jmnE44IZxzQ9QqAt8HRFw4lUftpU4F41QBVLyDyJwmnYJk6LUHSs2IZU20J90xTn6Dvn49TYX0xB7FRR7ajV+5nxuJ4dfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1sYT3NS; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1sYT3NS"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4858303de5dso699849f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788449748; x=1789054548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGqHkfnL74zaEtf/qjlyesNnXLKu3K97Vw4CNhC1tbM=;
        b=c1sYT3NSOrd6uouEtxSaM/q33egHhjFF9rlE99qGWPH10WBuo1kJxyi5v2qe+CwJRG
         StT2k8kew//q9C3OUIYYUE2cqnum218EYw0vCP+F03OxOHkSr/jadCZfnDCMk/SGEtXs
         5Tr6ITEfVLxpuRfSauN1O/gvrSmmNiaiB0XgaAWu67u1LRtJPd6WXqon1GEb/ng9PcGa
         f0dI4LaXAyNnIh8Uej/KJ60YAdiRqy6ni3HrHk6bB9Xqz5GOopx+0WXXioEYA34Uepe2
         ABFLSn9NnWMrWaYvq8xkGLP00zSTAjCpk6lLc+0PULLi6NCbB8Pyiv8YcJyUoIuXoyok
         Yj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449748; x=1789054548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BGqHkfnL74zaEtf/qjlyesNnXLKu3K97Vw4CNhC1tbM=;
        b=JB5r01QgKcm0oiIIFP6gNK4gwn+knTTd6zfKhmVLVRPYtERg3CO8ZlQNZrFdZ3a4uL
         ZUxo1vsv/QA8Oyrlj0XKcTwhgBOm4pZfAL/6yW1YqOrdcMR2J2rhq03BbzYXMOwubPkJ
         2exdbCyskjPcdO/fQhkr8aR8S3YB+KEWr0wU6LQE49MK9LpnXVBm4pxcFnVO4kPCRgfM
         NncdXpxTqh5lbANLBYD7MMnEbnW1TIAJuCmf5aX/t8c2Wah3qrg9g2uCo9gcRFFzVEsk
         VzWfCPZQmrecDapmH8WDM73JGLCioQYrEtjQENX7gRrMh1pzfyrK4VgOYnaBEtw2bYtO
         wU0g==
X-Forwarded-Encrypted: i=1; AKwUvBzYmriZSZwTgxPxCNdk0cPlAWzBbWib12LNuA1/rEl3rXRVix0x0WuQwpOkWd7HEpT0GRQSUwvaaWfsESc=@vger.kernel.org
X-Gm-Message-State: AFuF++mRVIpbeA0R3gsKz/eca9QCfk8AFpNebg+RF7rmHlcMYWGFUHDO
	busE1SrEJQ9KKzIeBbBkemlHm0oQ2E3WhLMwpP32n1lIeRKiU23S4eLLnSuw7/2SGQ4=
X-Gm-Gg: AYBFou35jSs/N+tLpkIPYeC8hzOUGzehCso6VqRfx5YxXPjJ8Stq4iW7d+5jW9tQ2N1
	QzRCtLDat24QxtGHOfyQrbLNRo3p9OXBeSxgKhNCwR98W3GExt3+pevq3y8+Ag0AdcP/kY31S1M
	zYDam8Sp9H1TvipoCb34/suy3Ag3XsoZoN5bpxEFHHS3lY5B7uYSE/bxyBI8yFZfwIMZ/46wbzK
	0tiVAyfuZ9FMVWzCDPTnLTealICucuiw7gXyATaN8unOzgznS5++4nyrKIecPnieHpTSaNWp32D
	Z0d89bDS1ZHHUIOZ5JRs1WHXgDvGxQx+OvF/xDGrBTJHAVgzEwtaODcAjTnvLoRdX75taX45aTD
	CjJthB0/B2COIH+kuCe+dd4Oa+QcB591xjXCUnnD9qay1XBFn8nNNk0vECuyL55lZ8KDYXPkYjT
	9FiOGTW1JDVlKjJzX+do7B+/hS5nHHutB5kU+AaFvCqNM7lKuhW4vQFJ3RpV423fDglO5wD6qhU
	E5axC/fRcOEAZp4OSlGr7VUykwwX5KWRRFZMuSPRHN9GXWychE0jpW1YATnoAkO5cjD44rujY4i
	Ec07Q0HkIuGR
X-Received: by 2002:adf:e947:0:b0:484:f26c:ba9a with SMTP id ffacd0b85a97d-4858606d6a3mr2102493f8f.16.1788449747700;
        Thu, 03 Sep 2026 08:35:47 -0700 (PDT)
Received: from cdev ([2a00:fbc:f1cb:c56f:5a2a:db32:f638:bd69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448eea5b4sm14851108f8f.27.2026.09.03.08.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:35:46 -0700 (PDT)
From: "Vladimir V. Kondratyev" <vladimirkondratyev2@gmail.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	pmenzel@molgen.mpg.de,
	chandrashekar.devegowda@intel.com,
	arnd@arndb.de,
	kiran.k@intel.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lsa.uz@pm.me
Cc: "Vladimir V. Kondratyev" <vladimirkondratyev2@gmail.com>
Subject: [PATCH v3] Bluetooth: btintel_pcie: fix stale cache in set_dxstate fallback check
Date: Thu,  3 Sep 2026 17:35:04 +0200
Message-ID: <20260903153521.130258-2-vladimirkondratyev2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260507203426.128975-1-vladimirkondratyev2@gmail.com>
References: <20260507203426.128975-1-vladimirkondratyev2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

btintel_pcie returns -16 (EBUSY) during suspend, causing the entire suspend
operation to abort on Intel Lunar Lake hardware. The system immediately resumes
after every suspend attempt:
  Bluetooth: hci0: Timeout (200 ms) on alive interrupt for D2 entry, retry count 0
  Bluetooth: hci0: Timeout (200 ms) on alive interrupt for D2 entry, retry count 1
  Bluetooth: hci0: Timeout (200 ms) on alive interrupt for D2 entry, retry count 2
  btintel_pcie 0000:00:14.7: PM: pci_pm_suspend(): btintel_pcie_suspend [btintel_pcie] returns -16
  btintel_pcie 0000:00:14.7: PM: dpm_run_callback(): pci_pm_suspend returns -16
  btintel_pcie 0000:00:14.7: PM: failed to suspend async: error -16
  PM: Some devices failed to suspend, or early wake event detected

btintel_pcie_set_dxstate() falls back to checking the controller state via
btintel_pcie_in_d3/d0() when the alive interrupt is missed. However, these
helpers read boot_stage_cache, which is only updated by the interrupt
handler. As such, if the interrupt was missed, the cache is stale and the
fallback check always fails, exhausting all retries and returning -EBUSY,
causing suspend to abort.

The fix involves re-reading the hardware register before the fallback state
check, consistent with btintel_pcie_resume().

Fixes: e57362f4911b ("Bluetooth: btintel_pcie: Add support for _suspend() / _resume()")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=221481
Link: https://lore.kernel.org/linux-bluetooth/20260830151550.44687-1-lsa.uz@pm.me/
Signed-off-by: Vladimir V. Kondratyev <vladimirkondratyev2@gmail.com>
Tested-by: Sergey Lebedev <lsa.uz@pm.me>
---
 drivers/bluetooth/btintel_pcie.c | 8 +++++---
 drivers/bluetooth/btintel_pcie.h | 1 +
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index 30923eaabed7..44ad31a5d7ed 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -3538,10 +3538,12 @@ static int btintel_pcie_set_dxstate(struct btintel_pcie_data *data, u32 dxstate)
 					  BTINTEL_PCIE_CSR_MSIX_HW_INT_CAUSES,
 					  BTINTEL_PCIE_MSIX_HW_INT_CAUSES_GP0);
 
-		/* A hardware bug may cause the alive interrupt to be missed.
-		 * Check if the controller reached the expected state and retry
-		 * the operation only if it hasn't.
+		/* A hardware bug may cause the alive interrupt to be missed. Refresh
+		 * boot_stage_cache from hardware, since only the interrupt handler
+		 * updates it. Finally retry only if the state check still fails.
 		 */
+		data->boot_stage_cache = btintel_pcie_rd_reg32(data,
+							       BTINTEL_PCIE_CSR_BOOT_STAGE_REG);
 		if (dxstate == BTINTEL_PCIE_STATE_D0) {
 			if (btintel_pcie_in_d0(data))
 				return 0;
diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel_pcie.h
index 9baa214d9bbe..a7f4e590af5e 100644
--- a/drivers/bluetooth/btintel_pcie.h
+++ b/drivers/bluetooth/btintel_pcie.h
@@ -51,6 +51,7 @@
 #define BTINTEL_PCIE_CSR_BOOT_STAGE_DEVICE_HALTED	(BIT(14))
 #define BTINTEL_PCIE_CSR_BOOT_STAGE_MAC_ACCESS_ON	(BIT(16))
 #define BTINTEL_PCIE_CSR_BOOT_STAGE_ALIVE		(BIT(23))
+/* Reflects live D-state. Updated by hardware on every D-state transition. */
 #define BTINTEL_PCIE_CSR_BOOT_STAGE_D3_STATE_READY	(BIT(24))
 
 #define BTINTEL_PCIE_CSR_DOORBELL_MBOX_READ_CONFIRM	(BIT(4))
-- 
2.55.0

