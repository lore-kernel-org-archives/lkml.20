Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0AE377A9E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792395936; cv=none; b=SSh+LONs6aFMHDIMcdWRGq5A9sEt9hpwpCtRAUrtWhsLmtIGaTFd7KaP6bVdXBc7txWcL5v0EooBU/Q6Dk257QaIDoNCOjsWU42yeg2V/IqSgEuuX3OopF3J3YTUvck/5KIlwNzO3SCeUu9Eu85ptbsyDyV9fsO7P7d9ltRVM6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792395936; c=relaxed/simple;
	bh=YlRidHLZxLVQQkYv/73Bcq/10xLHfZWapZAMD6FOpb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tdmZNP0ZnWsBJcDcqNv0JVZgu0PToJMNia58ib5WS19NjDTj6C2QUg670tH1aK3wqEvovGqTpVyeFzXdhdzcmBlQ9QJKueNDJ+CGVcY38y5lvhvTliZZo06G9xy/SM44eK2r9o0DyRpNa+KpUtPVEiEeEZiS08fzQhk/sxLF9E0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=iH0soMx/; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="iH0soMx/"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-89d6bd67045so694198b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1792395933; x=1793000733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ul6H+GadvFiEjmBn8Klfdhq6vLjdD2yBpTer/wEL68=;
        b=iH0soMx/+nd1CSKDU8UbkKXG/CZ0rFXiKN+7v7S+WRPxAIMZILwsU9XtsJrAwL6Osd
         SmW8wMSWYtC6OESx5Q2MGZsbkmaInWXrotddTXt+kME8U2w1rca3fYdiro8eG1zX4Ai7
         LviQTK4XqfXQL6ZPQoNxu4HDwqdsIBAgf9pnHA9Z9iE70GcTqkGDJhn8Ykvs92d0KHIr
         Dg0Uwkp2Ka73UNP8s2a1J+tOoTmTFI9vJLAmr/90kufjEVlBh6jL75w/AWnmHLuCOQ/K
         O0qqwhc+4SNzfMbKjqBYJY160DnFVnjzN2MxL4Jg+hayFs+4MmyF8d1N0+sbJp/H5iC4
         7K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792395933; x=1793000733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ul6H+GadvFiEjmBn8Klfdhq6vLjdD2yBpTer/wEL68=;
        b=OsqMRMICYF4DyDMMsOMIhks48pUG+rTyw3yv01icwsGtXB54nxdKaOl9Z/L02VULOt
         85YTSty2vBOFeflfmieWhtPmqLJX48E3EvCiV2k9efD5/C6FUjBruYoOtuG6kyovqJDS
         /Vp3oPgJFjXJ+w14F7MqzyumlEMcbxdb+WcC1e36U/rzG+nmXoiqavzLFnr7lfvzhm9d
         7CTkC8zA8qBXGRBG9L5kL0f7rbgldzH3fKXuWuUnQPSDLqaoAsqTeOtYsHaqVHQLTm1X
         GT3R+YVnYl8jNFX80CLNfQhAtPSH6EUQTK07ooRF6WDtr7X39EzVHUGRHDxqNVKxs6Ma
         bjtA==
X-Forwarded-Encrypted: i=1; AKwUvBzUNgj8k3PA2omqzFRY53nG536Rat+1jTL2GwKZ+ykCTy2fhrFsrI8wqKNjG5EXR8pDss6FBIYSo8sBtGo=@vger.kernel.org
X-Gm-Message-State: AFq9FYI6TPy2ZStDnjHmFxIGpGsdcpKT1L2pYAo6DJrkHSV6rc6Ia3Mm
	C8A7D+44BSxdoGWKmcHVCg1QmidJ+HGT58VOlDSVDuH0tNWQOQiv7lSQfF6Incv2lUM=
X-Gm-Gg: AYBFou2YD5m2UdCHpaBFz5bibL5oTTOs4zfpMbb3mHUWJnM0ySG6bw4GX8MCtSQ+S1R
	M6VrbIpGVE/cdvj9z6IUJP7e7ppCMFuknDTaC3fVUoaUdT9X2MpBhW4sMaLqXeTCkVh7F6QaEGt
	RM0QpCAYEjXzw9vkgsx6MOsMfmSxsBhmrVcxp2A4QHErfe+B5X9Jj/c8WSkp0jBIctPAfjCAzyX
	ACQ37FuFjyePvyi1XmpkaX6RlcYtKgk8jVsFCWLhz70T6GDGaU8YUbgoHwSnZHG5IgVVg91qeNq
	tJVta6Dpd3F/oHn4U834Ir+mRHm6ut7I/x3WK/QY2KXImV4owDwciR9XP+vhhXNGyESUjZaRUkX
	jk5XxZrHr424XHiKipo9LCa0U95D66wIzRcaJBRaFLDoGIBYckzBB32dvL4BuE+ahc4ORXHIenM
	Xg3MNOd/Vg2dEVa3iOI7QY+NJv0En9PfuyNtlxYaSHaVacMEkYT+fhsOt7REJMFDp+Rv5b6gHwE
	E9e+g==
X-Received: by 2002:a05:6a00:3d0a:b0:8a0:550f:bb43 with SMTP id d2e1a72fcca58-8a0550fbc34mr3271497b3a.34.1792395933010;
        Mon, 19 Oct 2026 00:45:33 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm3494351b3a.47.2026.10.19.00.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:45:32 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: njavali@marvell.com,
	mrangankar@marvell.com,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: yhlee@isslab.korea.ac.kr,
	GR-QLogic-Storage-Upstream@marvell.com,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 0/2] scsi: bnx2i: bound the payload lengths the chip reports
Date: Mon, 19 Oct 2026 16:45:19 +0900
Message-ID: <20261019074521.658170-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three handlers in bnx2i take a payload length out of a completion queue
entry and use it without comparing it against the buffer it is read from or
the one it is written to.  All three fields are u32 and none of them is
masked.

The first patch covers the receive queue path, where bnx2i_get_rq_buf()
copies out of a single BNX2I_RQ_WQE_SIZE entry and the Reject handler asks
it for as much as the chip claims.  The second covers the login and text
response handlers, which put a write pointer at resp_buf + length and then
pad from there.

What makes these look like oversights rather than a decision to trust the
chip is that bnx2i_process_scsi_cmd_resp() caps the same field against both
of the sizes involved, with a separate error message for each, and has done
so since the driver was added in 2009.

I have no NetXtreme II hardware, so patch 1 is backed by a KUnit harness
that drives the real copy helper with the RQ ring and conn->data swapped
for kmalloc() of the same sizes so that KASAN can see them, and patch 2
rests on the sizes in the source.  Neither patch changes what is delivered
for a payload that fits in the buffer it was given.

Yehyeong Lee (2):
  scsi: bnx2i: bound the RQ payload length reported by the chip
  scsi: bnx2i: bound the login and text response payload length

 drivers/scsi/bnx2i/bnx2i.h     |  2 +-
 drivers/scsi/bnx2i/bnx2i_hwi.c | 29 ++++++++++++++++++++---------
 2 files changed, 21 insertions(+), 10 deletions(-)
