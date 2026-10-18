Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369D83CF210
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341863; cv=none; b=en/qAuivbiTK06nWzqtn9kraFdbjkmHmdDEwEqG9ojMNJ3GKt+3A9AwT2cujAdlYg1h7Jm5fINQUCk0RYqN2L5MSNIVvLHrPEtRZOVjU6hv8L5sEHgeVm7UClud4xgIpRNNjr0hukitEB/AqG/mYgSZfgPoonGIX5fudVVY5nwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341863; c=relaxed/simple;
	bh=Z0lznjmT2fklPYTx5yPcuTT3xhmNlgD0+HUS4nS1wCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkCuG85z21fbDA23mqFL5P7ga/yMwUZkDHIEMVmNc3ps41nAgkdItEolK0UM+ivUfXpCBANFopOurMnJIljXLd0QT+umlGR5SZylaKEWqlmu3uOx5JIroyM+hEXM7sDEljN1KhJzOjnjRd0j5AeWsCWUjqrS6UwuWULp4xS+3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YhLN1bGV; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YhLN1bGV"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-353804b591eso2502802eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341860; x=1792946660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxESZ098zbjfzDcvUMgtVe2zTbr0dJel0R4trpg856Y=;
        b=YhLN1bGVrvjtlGmsk2SGea6SrN2JdrADzYstJO2EYf+9cekOccqpkGg7uQg9FkjhzB
         GcPDnK0fGyfx1FWuaOjH1UdEnoR6OO9LCA05v4F4LSr9kFgte1sQcsyx2gQ1yqlK1R41
         Pue9dVEqeWJPG4Aqv8hIpOBpdELiO8FAZiHjdbrxpKLXCzzifcvrn0UbLfXYHnU67biz
         WJIR8fGBbCpQvgRf3T0HkYdSYMDBF0KWDGnhtsZIVEYqw0Fvz2GBjIyJyBF16Z/KK14g
         oukYTXnSGhzbkcnY3oqedBCGDkf+3KPiT34nzpbATV+rruM/TLufAq/VuCVZL5M/q53+
         CJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341860; x=1792946660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxESZ098zbjfzDcvUMgtVe2zTbr0dJel0R4trpg856Y=;
        b=F5uowKJ3ZTwcTrG7CWsU5C0RTiK0mLTOhbLBKDPE6lMuZG34DgJ3GCBYc0JlI+Rgvr
         8RX2fFsJPnAZXDKy3zuBD9tQo2WHJmxR8X3hnVjVTwVkgxPUYWppsfuUZhQiSLLcpljo
         +IneljvXYilK6cxyi0N6FJlStDkYR2maWI3h8/ov0xV3Pq7gR9QwDWHOLe7IpM0mpjpC
         RoDjEn9Kdl3wJyiKrZ8F1tKguIpJyMDL880Bmka1hUD6h47Evl1VswYc41QYSgHFrpH0
         iPW8LCdibkM3XUUK4cmxeSoApup8oyJKPOpwMEWyM9Tq2XVTGzQgNPSMntP5lbjGoyer
         jVbw==
X-Forwarded-Encrypted: i=1; AKwUvBzTThDqsE7EFKPK3qtK8bpzvcw7G6aUpFpjL1JD6lILu3585jTMbaIhDG8un4o7oRRqqPsCDrCMFCNwqg0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5CSNClqHcHqcKtWVDSy8efGw9/eJtLXTvXWuenXa7Wo6q070F
	JZY58rcY+maTHXu+DjNM81aSPaXuo6FHvfU5ECr7xi0Aq9tvP+xKaNfH
X-Gm-Gg: AYBFou0hWQXraA+5y8liRpQTOeSfKDctv9M3n03dgP/H2XjLstA9w6TXESK/IScAECi
	ckkenG1y996Q5e6fSdpbibQPjgiQ5417cMJVIsFYqyc0vO5uC+arM/dF/sDz6U1xmeptvYCVvbL
	a6Mswc572U4bCe7vufELCz/llQ6nXUIIRywwe2C6PvDK72QvqLbt/l+9UmScT69Fwb9HOCATHlI
	Dc6Y1QmmUX5/hBN+pROcIDomLIsw7R65dTQhFksaYZbvym0gYbfFnla6z7Wx3HRbN8pzQXqXRV2
	IHoyZy29MOHmdcnLAiwWMY5jeOQFZK9FH7jKDrnpu5adgvq38mdod8cHoplve5m3I/A24FcbE9A
	B75/PscuccbfDHddNwh79eF3sa/t2H/NWAC5VTgDZvjTl/THSeRzKlm5pM9BmtPCL3BUNNqQHHF
	ANWlER1wv/ka7vZln19veUHKSwPqgkJ+RD0mtkLlh5K1JGh0UvGpoI02sjvXchalx9uhL9e25pb
	grlOGebuz+7ugXo9Q==
X-Received: by 2002:a05:7301:da84:b0:353:5b04:8d19 with SMTP id 5a478bee46e88-361a0e85f90mr8009309eec.9.1792341859895;
        Sun, 18 Oct 2026 09:44:19 -0700 (PDT)
Received: from Vicious.localdomain ([117.99.24.166])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm31431363eec.20.2026.10.18.09.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:44:19 -0700 (PDT)
From: Ashmit Kumar <work.ashmitkumar@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ashmit Kumar <work.ashmitkumar@gmail.com>
Subject: [PATCH 0/3] staging: rtl8723bs: clean up SIZE_PTR usage and remove custom macro
Date: Sun, 18 Oct 2026 16:43:59 +0000
Message-ID: <20261018164403.14921-1-work.ashmitkumar@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series cleans up the custom macro SIZE_PTR (__kernel_size_t)
across the rtl8723bs driver as part of addressing the TODO item to
"convert any remaining unusual variable types".

Instead of a mechanical substitution, each occurrence has been converted
to its idiomatic kernel equivalent:
1. Replace open-coded pointer alignments with the standard PTR_ALIGN()
   macro, removing an unused variable left behind.
2. Remove redundant pointer-to-integer casts where pointer arithmetic or
   pointer arguments are already sufficient.
3. Replace the remaining pointer-to-integer address casts with uintptr_t,
   use size_t for alignment offsets, and delete the custom SIZE_PTR macro
   definition entirely.

Ashmit Kumar (3):
  staging: rtl8723bs: use PTR_ALIGN() for pointer alignment
  staging: rtl8723bs: remove unnecessary pointer-to-integer casts
  staging: rtl8723bs: replace SIZE_PTR with uintptr_t and remove
    definition

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c   |  8 ++++----
 drivers/staging/rtl8723bs/core/rtw_security.c   |  6 +++---
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c    |  3 +--
 drivers/staging/rtl8723bs/core/rtw_xmit.c       |  8 ++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c  | 11 ++++++-----
 drivers/staging/rtl8723bs/hal/sdio_ops.c        |  6 +++---
 drivers/staging/rtl8723bs/include/basic_types.h |  2 --
 drivers/staging/rtl8723bs/os_dep/xmit_linux.c   |  2 +-
 8 files changed, 20 insertions(+), 26 deletions(-)

-- 
2.43.0

