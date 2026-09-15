Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1E3911C7
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 13:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789477519; cv=none; b=XfTdq6ZgBq06lruM4Virqsao+OnyMDxuwZ+dxmiz9u4bdWGw6gH1P65RKKrUhel5YZjNjdR1pUymdMREjyHQTsISfDJCDUgdg3X9+ODBJaUF7drWOBHlfKWQvI+ER6See0l7PJvHQfaiDlNs0g1c0GfdwaQA/EhSaeSpWAwO8tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789477519; c=relaxed/simple;
	bh=W8p2Hr2M7ONzma+RlUzqxV+zyHJ/zE5dV/hCbRlB2aQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W+Tewq8WZ2VTgUFcRPew3hwcwkktj/Sp7znZhyN+mItJMwE+gITaSicB3mRrdU/iP9z/bX07PJSREw1qLXD817rS0A7TM9fdtUoCViKjuJ02kKrtkkAK5aHqK8qfL2VDx1fpQtxVsxcX9MEkFGDnQXDwvpU0K7AxtqP+3NtQnT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4E3wudq; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4E3wudq"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-47bc923fe6aso187520fac.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 06:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789477517; x=1790082317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4luyYPlKfAPRsR57HWe+RkabsdRokVmRAf5ceEum6xg=;
        b=e4E3wudqAFrK/J1f3pD5fft+PCS0/AKe6XIvmc9urLBAuKzpppmHYnGkKSAoHLS+uw
         faL7c05cZ5quRWlh3EQWnlwcRiAGrTKE21Jfx79N9qPYoDZdE3I1jwTBR/l2UngjPsIe
         5hjH8UZU9ZbGDS2SCX32WEow61GY1/trU0RXpbFrBOuKk5me+F37NwYa4MoPxYaXmw03
         fwqIUsr5hHffs+nrNtsJafAMI+fJx23GpLF+/+y84lxlLVeVFYX9aQijYGEpQ3V+a/0r
         RFIQ/wojHviTKWtq+OoXls/zCqpUqnEDvxYCZnMtNz7JSxDb8Nf23ue3x7K69g9d/k6G
         D+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789477517; x=1790082317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4luyYPlKfAPRsR57HWe+RkabsdRokVmRAf5ceEum6xg=;
        b=NPwSAbKgy3pd1akm3Z/v8a4lLIBnWvNppRTJJID8w3jjU7yJYJMgu1Ww5/+bZ+zcmK
         QMNF0qqqeBTJc2aMMj2LJN1Es+1w7wyeefxp23DG5+YhpQbqO7EQCgM6umz2v5grUbUm
         1JE3cT+mAHed8dTSlSNs7jU3JW85Elijl+H3RaNsUylmVQxpBLtX1bc43iSHc/WPpIhe
         OiV41uUlrSChmaQ4A9pTRjsUJXqHnHqtlUrUZ0Jy68JXXk1J97UVQIsa7dpC2fMIXcwp
         jOsTfxJeEwTTLA1jOCevCEF6bXbMsVOv79wDSrvmrDYme/xlcNa7yh/5MB0E5yX9PDnB
         SuVQ==
X-Forwarded-Encrypted: i=1; AKwUvByQhBHwqRYoeaz57LYds+DMEZfp0ciTJ8Dd6Krd6mgsJaPJuk/vRJiKMnO6IthPuxHMhUq3pIfduYjPyyo=@vger.kernel.org
X-Gm-Message-State: AFuF++m9/7UFhHW4UwXYn1QpS0roZXMXCuwnwPnj9O3sJMPYQjXYcODl
	4SirpL4/6KUSOGIXryi5PDoak6ary26F6w7rcnV1GC9w4IE3YKPk9+lm
X-Gm-Gg: AYBFou2uiok33NCogX9VWEu28SJXhiIk0FjcINlQUL1rIdkbZm2bcXT6wu3Bj3Z6gpT
	G7IiJ5ryea7v0PUOccKEi9kPotWB/VhhsC7w6BWkBTWuMhGBGcZCyYPazLduzWbX4nA2LgyQbTP
	lyKmieuJEWfBAv4XxbTJu9SJWODYrTgIxedOrtUnf7c5QdHVrefjRj+9ljCE3ACAlKL7e0cVa1a
	+6b4HlzDcJR01eTsaJzQ9KVYmFjTp4gCcXVQEvre5fJQwl17ODD8gyIPWg3UJOQN17jVAA2S4Y3
	cDdjKx2Afg/TKKA1T14cl+MAOkpsiqNylSZ6oXUXGa8AGTWrcAjssKYWeZRQG4fZb2L3WgulTP1
	+P9wiGQPy1fCrQJ5BBKcSzPY1Gs1AhqfscJ6P2yBVIg5UQ89KqSEN5ODHM+kxPlwlp7PDjMIzu1
	y/zub9SSMwkfWguFKnGMzNLVkOsP8X6MT8lBn7ccSvizjCe04c9vIe66jpXfnt4er0lBG1H8Yua
	eNroDrwpqj2ViSW
X-Received: by 2002:a05:6820:1985:b0:6b7:83d6:292b with SMTP id 006d021491bc7-6c739c72294mr552478eaf.46.1789477516775;
        Tue, 15 Sep 2026 06:05:16 -0700 (PDT)
Received: from ai-agent-sv-01.. ([43.135.169.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf11e6af6sm1299889eec.3.2026.09.15.06.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 06:05:15 -0700 (PDT)
From: NoNine <chenmin83@gmail.com>
X-Google-Original-From: NoNine <min.chen@siengine.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Min Chen <min.chen@siengine.com>
Subject: [PATCH 0/1] coresight: tmc-etr: Sync the trace buffer for the device
Date: Tue, 15 Sep 2026 21:05:02 +0800
Message-ID: <20260915130503.645953-1-min.chen@siengine.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Min Chen <min.chen@siengine.com>

The flat ETR trace buffer is allocated with dma_alloc_noncoherent(), which
reaches dma_alloc_pages().  That API zeroes the buffer with CPU stores and
requires the caller to sync the memory for the device before the device
writes into it.  The TMC driver only ever syncs for the CPU afterwards, so
a non-coherent sink is handed a buffer whose zero fill is still dirty in
cache.

On an AD1000 EVB this shows up as 64-byte-aligned runs of all-zero
formatter frames in the first window of a freshly allocated buffer
(1,100-2,400 runs in the leading ~4 MiB; later windows and reused buffers
are clean).  Writing a known pattern over the buffer before the arm and
cleaning it removes every run, which pins the loss to the buffer
hand-over.  The ETR node is not marked dma-coherent.

The patch adds a sync_for_device() buffer operation, implemented by the
flat buffer, and calls it from __tmc_etr_enable_hw() before the TMC is
enabled.  It is intentionally flat-only: the ETR_SG and CATU data pages
are allocated and immediately dma_map_page()d, so the map performs the
architecture's for-device maintenance for the first hand-over.  Their one
remaining corner case - a barrier packet written into a full buffer before
a live drain re-arms the same buffer - has no reproducer here and is left
out.

Tested on the AD1000 EVB: five first windows on freshly allocated buffers,
including the first capture of a boot, carry no all-zero-frame runs and
show the ordinary clean-stream profile (2.851% zero bytes), against
1,141-2,360 runs for the same measurement without the change.  The patch
was rebased onto the Coresight for-next/queue tip 5442d22da7db and builds
with arm64 defconfig (Image and modules, no warnings or errors).  The
hardware run used the vendor 6.6.87 tree; the rebase carries the same
change.

Min Chen (1):
  coresight: tmc-etr: Sync the trace buffer for the device

 .../hwtracing/coresight/coresight-tmc-etr.c   | 29 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 30 insertions(+)

-- 
2.34.1
