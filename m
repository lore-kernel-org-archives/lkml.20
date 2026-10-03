Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9FC348C5C;
	Sat,  3 Oct 2026 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791039981; cv=none; b=tVojZ4gwNQ5rc3d/5WcKxDTyjHuECN2Mtvh0Bpca6lu2OcfmzWaChBSXmsW8iZYyCbCS2uOwUqBbDO7fXbmOyj+Ij4ikd3HZ7iSGr6wcg74v/6Uthk4ZkD+z2r9U92ADySQPnBiwaftrwpUyIPSnyiBB5gy3o2OW9T1AJnKi0Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791039981; c=relaxed/simple;
	bh=5o2hSb+dIsoK1cdHidk+rJJOuCyrSJMCGHqn0emAoOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W7z8QzwBo96WQyq5rMoFKMs2U8ux+umPbGcai/jUOxmUwWmTyvninqzlNBVlRzLliow8QqnCo1TBjslWf0LXN0bKLLogFa66EGx/Fbk7SZiJe7nmr1oJwoCAk9zuYcypueQXiTbMz0h459Ma40nioDavIbPrgjS0nRL0Y2kCS+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=h40Hjog1; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xi/ksa+l; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="h40Hjog1";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xi/ksa+l"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791039973; bh=8LSDfdcYIynoRuwr1M+Eb2h
	ZTCy/Cp/bOMKkg6di9Vw=; b=h40Hjog1KIg9CGVufK/tohtGo7hZmCU7tqN1XegaCn91+6ZRwE
	J+asYfrHf4dzX/5X8nw4kGbnHFyp6Mzy4LK6Jp3LKusuzSVxFM6/bYmHvaK64P55FXEC8KoUd4M
	FX5Pv05LjyOvdP6a12DMhSFiOsHdFFok1qO1NjA6TluKprAFSDOcC9W1LP1l28W9aPfZNezNrxU
	yjaxdDx5WPzRnMXGZuAk/jTAk2YjkGGaXVt8nx7g8NdiS0/R6pcgkXNcmwc/vf8x3oK0nYPGno4
	xZBrYDX8jN2zZnP7n4ywDoxOSuR+yzf5WhqywOizC6BXS+QxopOCuDnxjM3zfR/NJAQ==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1791039973; bh=8LSDfdcYIynoRuwr1M+Eb2h
	ZTCy/Cp/bOMKkg6di9Vw=; b=xi/ksa+l/mpo/aNrRUDdfBDPEinZoS1FZ/84UkkRrQNkZNsTww
	i5hfFxRe2LO/jSR9JEWcD34IJZPRsCA+ozBA==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: srini@kernel.org,
	gregkh@linuxfoundation.org
Cc: robin@snyders.xyz,
	ekansh.gupta@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	andersson@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH v2 0/1] misc: fastrpc: Fix SMMU context fault on sensors PD
Date: Sat,  3 Oct 2026 20:35:58 +0530
Message-ID: <20261003150559.6926-1-pc1598@mainlining.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Srinivas, Greg,

While bringing up the sensors DSP (SLPI) on Qualcomm SM8150 devices, we ran
into an SMMU context fault whenever userspace (hexagonrpcd) tries to attach
to the sensors protection domain (/dev/fastrpc-sdsp).

The issue comes down to fastrpc_get_args(): if the device tree defines a
stream ID (sid) for the context bank, FastRPC allocates the message buffer
through the SMMU using fastrpc_buf_alloc(). However, the sensors PD on SLPI
firmware expects this buffer in physical shared memory from the remote heap,
bypassing the context bank. Handing it an SMMU-mapped IOVA triggers an
immediate fault:

  arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x1fffff000, fsynr=0x330001, cbfrsynra=0x5a1, cb=11
  qcom_q6v5_pas 2400000.remoteproc: fatal error received: PDM: service 'sensor_process' crash
  remoteproc remoteproc0: crash detected in slpi: type fatal error

This patch checks for SENSORS_PD and ensures its message buffer is always
allocated from the remote heap, even when an SMMU sid is configured. Other
workloads (compute, camera, audio) remain unaffected.

After applying this fix:
- hexagonrpcd attaches cleanly without crashing SLPI or dropping pipes.
- SLPI remains up with zero SMMU faults.
- Sensor queries over QRTR/SEE (service 400) succeed and stream live
  accelerometer, gyro, and magnetometer data to userspace.

Tested on Xiaomi Redmi K20 Pro and OnePlus 7T Pro running 7.3-rc.

Changes in v2:
- Retain Robin Snyders as the original patch author, with Piyush Raj Chouhan
  handling testing, downstream validation, and upstream submission.
- Drop inline code comment in fastrpc.c to keep the patch clean and minimal.

Thanks,
Piyush

Robin Snyders (1):
  misc: fastrpc: Allocate message buffer from remote heap for sensors PD

 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.55.0
