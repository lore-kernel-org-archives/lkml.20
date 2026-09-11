Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1183E5A0B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789094604; cv=none; b=D5n3mKHIwGzWCXyXQngoyTjTNAFOEhq1sUZQ9EPsm2aeW9/z8yj8VkBMrhsurB/kVnKIPIDbkvmR3Ju6ykK+f9TK9vZIZkhxDJ8eI3e82WR4ilUXW1byso5KXlBaywgqd6/xjnmfBhWn0Kz3Kq0/KRRlw7rR2dywIcsco/1S2Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789094604; c=relaxed/simple;
	bh=/j8zxAOgXfwVIkihoKCWYxsy6SGLDEogI8QwPoIgXAM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Xa7nKR7YJzS4F2hBXZxnG+khzSR5ltt8ekeLd4Z7tG0fLGj1vau5oQWUEkEPHvZBGRuoJq07/pLCUZtoEHVX4FpRRR5waU4UChulz0JUjxNSj0XdcmoSKQM2sPOZJ/7TIJlBf0VfrmLCpWkmvOm9Vb1VXFtvkFHfuuOBt0K+lZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pmpxDsGM; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pmpxDsGM"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-869c40637faso416441b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789094602; x=1789699402; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VIFobB/49RKC10K8JbhHdKLcDdcT1zlJJkKF9fMl4pE=;
        b=pmpxDsGMsOqSpB4xZ/25bkVMQ9O4vIfjCF2z/uuxGjU5KfZ4kdXlzLaipDvpl3Izec
         57agIqWu4NLIjU/MjVBMNWkX21eSz+qklIKEaiZpwqTPxLFcfR//0jIcfPetImZqTaIS
         R5Y5LAzqx41foOvFwcR0/Q4PgxYOaLOWoFYZ5bIa9WMqEdoQAV281zGPUsTai44EIK2G
         88OZGejnb3io7WS/umarHrO/5PZZYHSHVPO6FdLCoLkczRG+JiuOvtWl0VzmxO9kSJEx
         dI9eyeFD2omU54XoW08lMTs8zsnZHxc/mTxlPpicOD16X2SEFP7cSmT5sR/Neg9fxSMX
         VJ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789094602; x=1789699402;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIFobB/49RKC10K8JbhHdKLcDdcT1zlJJkKF9fMl4pE=;
        b=roei1H6nIb++cs4ppJauMM8UCoBhA83PWIxm3k6tkcIHGwaFY6rqjMlQxIHjS5XFD0
         BDlom92ZiTB+U/RWFEE99yvorh7LRSnE7KxJUcfl8pHkH2yw9zcP5Xh9TiiDP3uqCij1
         bMau6UFFCpIz865yng2//TDdH/wdn2zn2ll/+PfvtyoC8Ah7uNG5nKUa57y2VLYpSNIN
         6VwkCsoH1Tng4iyU/rgpE9p91xvcyqvch1XaPNrGUB8ICbo8NWU4TQby90XHVHfOt/Wh
         VrOKENVYmLAQsfc+wAWgayna7bOWe0AU1THTaqe6lwu7w3J9HEXp/LVNvikQI6a22I1F
         LWIw==
X-Forwarded-Encrypted: i=1; AKwUvBxVKVgv5HYlFFajquMv7YMfpA1PmcIvaKqWjszYsZh7eacuiHkarEY4X5mXGy0gm2J5CZewFIensJUYpu0=@vger.kernel.org
X-Gm-Message-State: AFuF++lO4AiTBFmIkMT2hdRPKbhKiJ3dC/2NL91C6aIp7FgUyvguMPD/
	Kz+Qxtyw3poaT0VSrmLT9zKTl83ktALqv4eUIQjVCTD6jJCVpLTRQTD1ri2EIA+v+LW0HbTHYZC
	SZKrcHEi68kf/IVPH6EErdg==
X-Received: from pfbdr7.prod.google.com ([2002:a05:6a00:4a87:b0:863:66b8:b7d])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:8882:0:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-86b2dd00270mr3038046b3a.2.1789094601474;
 Thu, 10 Sep 2026 19:43:21 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:43:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911024319.1346706-1-stanleyjhu@google.com>
Subject: [PATCH 0/2] scsi: ufs: core: Handle devices declining optional Query IDNs
From: Stanley Jhu <stanleyjhu@google.com>
To: mkp@kernel.org, James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bvanassche@acm.org, avri.altman@sandisk.com, alim.akhtar@samsung.com, 
	Stanley Jhu <stanleyjhu@google.com>
Content-Type: text/plain; charset="UTF-8"

JEDEC JESD220F specifies that a device which does not support an
optional Query IDN returns QUERY_RESULT_INVALID_IDN (0xFD) in the
Query Response UPIU.

The driver maps every non-zero Query response to -EINVAL and logs
dev_err(). A device declining an optional IDN is spec-compliant, so
this reports a failure that did not happen and keeps the retry loops
resending a request the device will never accept. On UFS 4.0 parts
that omit the Timestamp attribute it repeats on every boot and every
resume.

A third model was recently proposed for
UFS_DEVICE_QUIRK_NO_TIMESTAMP_SUPPORT; recognising the rejection at
runtime avoids growing that table further.

Patch 1 decodes 0xFD as -EOPNOTSUPP across the query layer. Patch 2
uses that to stop reissuing the Timestamp write on devices that
reject it.

Compile tested on arm64 (defconfig + SCSI_UFSHCD).

Stanley Jhu (2):
  scsi: ufs: core: Fast-abort unsupported Query IDNs
  scsi: ufs: core: Dynamically disable timestamp on unsupported devices

 drivers/ufs/core/ufshcd.c | 39 ++++++++++++++++++++++++++++++---------
 include/ufs/ufs.h         |  1 +
 2 files changed, 31 insertions(+), 9 deletions(-)

-- 
2.55.0.1007.g17ff1f9808-goog

