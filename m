Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCF1FFC59
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791515206; cv=none; b=kHjq6AnxBvrinPVKysqv098+cZZGbH/+TOqm36duZ5NyirMSuHi8cVOsnKPoVNSUEuPZRcMcDwU2hn5kFLPZI8/7HWAukYn8duMVDfzA8HTygSUm2E3IsX9sx7lt7Y2j93amKNq1nuss4A9L2hFtdLfhAxeWDy8iYTvnYGhDFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791515206; c=relaxed/simple;
	bh=5Uz2zi/HaHZ9scqnUVj7yk+2fytGfDAxOLNXAwt2vw4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=gG9y63IEzg0U4RDTVlHowCWq+eDwmKM1d4OnWRY+iiblvdsQ0rVcygFJbrKDrGGtS49G43Sva2sdqh9uIRyiG5Vs/Vp7okQyDTtEchckd/ZQacy7Nuwkz2YQ6BMovEevPUxlFECoYxHp6A3JU4/KTBDM0xYjfYRxGJYNybV+Zu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmiwYATY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmiwYATY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-88bda150550so2218457b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 20:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791515204; x=1792120004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrdVnUhtPNK/Av17PhvpBtm9fsARY9axkUcpxdE9xCo=;
        b=gmiwYATYJDVsrjbDD631PuI+E1Bodn447DUDkztIwobHVVaY6Tl9cwqDDtalGnjCCh
         d2IFLrQEBmM9JlR96GifgEEyp8Fj2tgUSMeQr/u4XPyIO/+RcgYdOg1OnWYwTft1ktzh
         gA0eNgrOcmxsdQNazDWxwCTV1kT9aP/8m0sHi+JYY40vp5K8dwI9KN4eZ1JxvnwOTOIX
         IBI5fwfLpMruw3GT1CwWfkZHTyVyRqDFr9JIU4cxYOy0fe6hbQrN36k8cPMUSsL54+PL
         /nR1sFvJJuYj4Hd3WDjucQtPhlWFbMXHy7j3bd1Dwg7y2BoX2TIBqkMwqohbL5kNju3R
         jKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791515204; x=1792120004;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KrdVnUhtPNK/Av17PhvpBtm9fsARY9axkUcpxdE9xCo=;
        b=mjvAZ3EKU4cXf9DQtah1jBJvASVTW0xdNJUAKS60VII8/Jvv3+QOp+FlWjsPge5fgc
         Efb6+mTQXFVKSaaUJMWZkU2VkcrPt2ZwdS32YAVeiSa8gp0JvFTRRfzpz2r5cwUZX2B3
         zRyncfhMT3oJbtay4v4Y7eP2aOVvEH36COTe3d+4lxYoYWya6a2gViF+gEhpR3RHKNaw
         TrmYVTk7JgLnG6ovaKa9ZnS7iWUeGnSqMy/Axkgf+7LKEvk6EieEpkUs4kQPkrN1AT1p
         08Cvgi6Pr0hXJZGUQWUVgVPxtg9AnS61hgQF3dpLI7A4lVrmLP6xXsX+3TOzdQizLqHE
         bs3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzceHK2QohVaf0M+drbj3TLot+0Hjtxn4rLKANdeiZTpjmyIQYhbdLH+Qoxm5TwjFCog4f6s93WzcQ4EzI=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5iqXnIHZO4RAPu6xSrgpg3tBtJlMKcZgQYmMqQoyZ5C+bdJLb
	7PbSLszCb2GFM68U4fJ4CEWEP7R5zxDb3kzMaPJcpZNc4MH7onmjMsAG
X-Gm-Gg: AYBFou2OwnCmSEvI8eXB8Qc/51TvZ2NA/tSbZvUMUqmF/upK/Sk7cr1IQp8GmhfzeVj
	VzskvjEviFOt7ZjBwTzY9mYpPwZ4Pua6I2yICwDzxrF9c5dkfzvdLOEZAsg/ysh7OvfZHmevjmF
	zS58XxNZYWAqFIkPjpuJczNKm8mIlE4flcZ1zjYZeaI9vGxy5DTsUPIW23HHwZhN0S/IlNGWXyU
	hvTQ15Hjdw4gLzktUZ56Goy5A4gNPdWHrjnCdxF1jy3w3eaYPTPlkNq16JWA6hzbLbuchbvJuTt
	SVpTr6jsrHB9VrDAF+gYQov5AiqxN6tjfexmbTYNIZhDEEWHpPAWfSqVh6HQMmQe1FpNe/I8YJH
	TknrQEq+1/yrw9KB2ebcoJe4AdwDHwGVzagE/a4/tvR+KyMrX3/N/DU8isa9TWA06RmbBescHne
	PlHs76zT06Xmna4wzXpLKEoyVnSrRF5z5RUk5lObZmgMvHmFTvNtgoyJ1QFAcqE9noNoKiU4eBd
	7nJtxwnjEdnDySOpOQur64zswmItt2leKGJP/Rlqw4a/6dKX3WJjIhmbbNrgMXcxuM=
X-Received: by 2002:a05:6a00:1254:b0:882:bba:8791 with SMTP id d2e1a72fcca58-897c73f9603mr484203b3a.34.1791515204273;
        Thu, 08 Oct 2026 20:06:44 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ecb01dsm320656b3a.36.2026.10.08.20.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 20:06:43 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/1] Documentation: hyperv: Update documentation for sending VMBus packets
Date: Thu,  8 Oct 2026 20:06:37 -0700
Message-Id: <20261009030637.3869-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions for sending VMBus packets have been simplified.
vmbus_sendpacket_mpb_desc() can target multiple ranges, and
vmbus_sendpacket_pagebuffer() has been removed. Update the
documentation accordingly.

Fixes: 45a442fe369e ("Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
The Fixes: tag reflects the code change that was made. The
documentation update should have been included with the
original code change.

 Documentation/virt/hyperv/vmbus.rst | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 654bb4849972..77a437969b49 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -137,18 +137,13 @@ control message contains a list of GPAs that describe the data
 buffer.  For example, the storvsc driver uses this approach to
 specify the data buffers to/from which disk I/O is done.
 
-Three functions exist to send VMBus channel messages:
+Two functions exist to send VMBus channel messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
-2. vmbus_sendpacket_pagebuffer(): Message with list of GPAs
-   identifying data to transfer.  An offset and length is
-   associated with each GPA so that multiple discontinuous areas
-   of guest memory can be targeted.
-3. vmbus_sendpacket_mpb_desc(): Message with list of GPAs
-   identifying data to transfer.  A single offset and length is
-   associated with a list of GPAs.  The GPAs must describe a
-   single logical area of guest memory to be targeted.
+2. vmbus_sendpacket_mpb_desc(): Message with one or more data ranges
+   to target. Each range consists of a single offset and length plus
+   a list of GPAs that describe a logical area of guest memory.
 
 Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
-- 
2.25.1

