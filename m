Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0CC1A6815
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792289329; cv=none; b=r530A2zscT9I+OBGn/2y0ooTVtCYx0eD4Pjnv4fd+VpSt/gjIngB0RGSoNGndQd0fj7G0ix3YCHb7yymfXDlJSGi6jNy7Z2wiRClfpgmFrALOZRKFFdC0GtAL57q+pE2LWcFq7kpDfqmvYBGJz0p9p/xDDccW3Z630fiLFmRJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792289329; c=relaxed/simple;
	bh=ow69sVINNaVvr2Z0q+1YVQzqsCXceAWHPGehvygUFA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8OmYcyaUdesUVPb5kCjyDFH4QhUf30DVWqLNu+Ye7YB6hHwdzPzLS8KTh+R3zHofYpbIKPrCvKW+ngD5qszieNQpj/A7TysQnAR1YNGRSOL2eH7DGp8ov6zVZNW5mQ9DWp4lo3Ybjg/OxdsGsQXFhBQz82VOraIDx5aPiKNsp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPlWBOVk; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPlWBOVk"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5363316fa0cso12771941cf.3
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792289326; x=1792894126; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RaGAAGiU7kTJl217HSqn7DxbRR+6QeuVGQHPa0XU5iw=;
        b=mPlWBOVkqSoa40MfIhSXJRka9r5QpJvEQmzcBu2AoExSX0cGEbXGeGmYxDv/zFZYZ9
         0U+IQidBjkH4nt2igg+bZt0MSOnKYocUpLsUmQDJdH6z1ewtuVUaeFzoHHnjSLea6zEx
         7U6C/nRvb/6NZk4qc+LC+sHcfVrCwN26o+1lnXrXhpHuAqXg0lmeUdT82mb8uHpS4n7x
         LJsTE6r4uesd5RPCFrA4A8n0VdQg4Ww1ItWiCMFgPL3ytmQtRVnZqN0vjoX8ZT5+R5cN
         AJPtnNtK15OsRAUDFWlnugLaI9xR57hBUB0Z+ryV7eFWasHlrie1sKmEEFGPGB+victL
         FvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792289326; x=1792894126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RaGAAGiU7kTJl217HSqn7DxbRR+6QeuVGQHPa0XU5iw=;
        b=228fXrBndHl4Fa7hImvvBZu8zHq+s6PJlakDYvx02tuLCW812vXun6vdTq009b4KkV
         0YRqZ5SvXyncJEKoM1SOCWINJwk+i43F/vKIbF/su9+qoB+lDxy/LoIj1eniCDOjxg/1
         biSJoVqyZIpSjpOSYIrD7y4EXyiy4apSI3zbyNvi4kFPCOwzuOSR/CvOLGZHmThdd9g1
         kstszPRRFLy3wT5dtGlQw7jyrQIp0f1rSsqoSEMvIf1xiKLQn7pkK6U+iWx1dgplUXG6
         fneIkTsH5PVOecRrJlg461tdiZEFk9Dqtdfr6f7UHB1iCy9V4xNsZKUTkiJS3W3WMMKN
         gZ+g==
X-Forwarded-Encrypted: i=1; AKwUvBzQ88pd7SG1jvettCQm1WieGwyxA3tjlv1AEzTr2/YyHrxbHOuW9fgeAtsWQgqC/Now8BU429gqfi0/iM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwlFRXriwg7lzuBureM+evp7BW3YuKAx1hMEjcruNttTROHrPU
	abBKQYU01A1Rq7sV/w7DpffOMQ7pCWc4lCk7pcQI5+pr/TiXqVaJcqQAK2ZKCag=
X-Gm-Gg: AYBFou3KLf1yk0iauNrjOePOqjcfdPcMA2DzJYci0dqcDAbMg7CTKxlDibhfqvgFgIL
	7FCN4z2P/Ma4tSnV0TKmN63MlXAYSNI17OL5V1Mx0ZEib6tiyvbJr51qTUrFLg2x1G6qCkAinyR
	kR1XBizwTPMTum5R8zVZ45LGXhYArcH9GYMyt/7hGIUwNIiqmD/52XdV+iD0BOiCFmP8VZn68Df
	OUkAx9AHO+KFgEjmLvUsBHg3EPBDcni5EccDACAh8c8F8ODy0V/oyn7JnsXbDqCuRIHF/qDpT2h
	RYh+p1mRoOggselA1Cj5RkbqKFSPiOM3Z9uhbwPVHFus6O34+XszscMHSm9rDOjMzQP9X1CaoXI
	Gqc0ldj0ZtOy014RBgbm3TicQFnqLal75FR+7mLe3ZXSxkWuxHDca/Nnd9pUuh137Uvp1YhE4p8
	Jm8WXcpluFfo4wIl6y0F+eAs0NQwFL6+nfk4GscEsWV4GJ4WgGJ9oaNs67yPGQlEYMN77GRR9n5
	xCu86ZD875vIsnREAPVmaZAULRx8QcFaLawzRWDqHWXUNi/xModU2irZ2CbF82gOrOkMUN/96Uz
	kjIHF6PoRBcdHMZBiurnv210pqbC
X-Received: by 2002:a05:622a:48b:b0:536:575b:8dd6 with SMTP id d75a77b69052e-536575bbc1dmr35825921cf.0.1792289325861;
        Sat, 17 Oct 2026 19:08:45 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa68f8esm61731291cf.29.2026.10.17.19.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:08:44 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	ae878000@gmail.com,
	daniel.machon@microchip.com
Subject: [PATCH net v3 0/2] net: nixge: fix tasklet and DMA teardown
Date: Sat, 17 Oct 2026 22:08:38 -0400
Message-ID: <20261018020840.3851552-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate the IRQ/tasklet ordering fix and the DMA shutdown fix from
v2, as requested by Daniel Machon.

Patch 1 releases both IRQ handlers before draining dma_err_tasklet.
Patch 2 masks channel interrupts after recovery has stopped and waits
for DMA reset completion before releasing the buffers. On reset timeout,
it retains those buffers and prevents a later open from replacing them.

Changes in v3:
- Split the IRQ/tasklet ordering fix and DMA shutdown fix into two patches.
- Give each fix its own subject and commit message.
- Order the nixge_stop() local declarations longest to shortest (RXT).

Changes in v2:
- Wait for DMA reset completion; retain buffers and reject reopen on timeout.

v2: https://lore.kernel.org/netdev/20261004042702.1130389-1-mhun512@gmail.com/
Review: https://lore.kernel.org/netdev/20261007104833.4ukkys7rnmv7ki5i@DEN-DL-M70577.microsemi.net/

Based on net commit 6dc989ea46b96ce170840174b4a38c4a387fb005.
Found by code inspection. No hardware testing.


Myeonghun Pak (2):
  net: nixge: free IRQs before killing the DMA error tasklet
  net: nixge: wait for DMA reset before releasing buffers

 drivers/net/ethernet/ni/nixge.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

base-commit: 6dc989ea46b96ce170840174b4a38c4a387fb005
-- 
2.53.0

