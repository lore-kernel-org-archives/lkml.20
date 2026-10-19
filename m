Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B01F48B383
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792394071; cv=none; b=uYEgnvjmdfjwspyikv9U1IXY1o19waibrkMj9Ki822NXfwlc+DcK4b2NdqXXGpjQ/nKr972rrdk0BpipXtaaa3azwW+fphpXKtF2TBlnC5MrE/51T1Km+g5eugVuhbUOzMJ1BGXnh4UDZbzVBijqJpuI1h+mMXjTfxVvLEkIoVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792394071; c=relaxed/simple;
	bh=KMY1czFApm5yxluf0IMsZNo+1011rLzhUbYuQmO4Nxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PL2ANp8ZD0+XQg+hTNnk2G+oQW3hmt4B4rstiBC0y3QW5E/Tn0O9hMy/ual0Dc0UZgdcPYFxCU7GBctR8L1SH9VCU6aTg90QyJGjFiUMueJ/P7+iHZeUzoG7+dFgUIT7T2fI5gnaKAu8bWflfyrZmKhgD7k/KKHiHcdSrbTaNbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nbvvkNb7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nbvvkNb7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1465778f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792394067; x=1792998867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TvlgYQm3dB8aOMy4KbGGHq81fZ8P+nSRZxAdejOQGxE=;
        b=nbvvkNb7Zz3njb/cC/R+prTfNxCv7tND0+aMP2D9WBmtZTn1GDyOeUI6cW2Dq63o7d
         wp4ee9ZlFg7BDfbFgpGjnPkEmDO4jr4Tjpx6+DxjcWyD4E0yoII/XgMsoBdAHsyKmK0U
         WaZ/KdsGRYP9IOnmEUGzw3pN7vjUSFj6Du8yq4TdY2wPUVZ4waAdHWwFtvqphRpj7S+J
         stX+svpRBZS39RfhJIbkSvHFxQIbfn5dKPkw2n51uSQrY0CmBFvfvrZy1f50mV80YGiU
         36KelPIcELWws/4L5K6w0WQXmBJ7l8HWfgn7TMEclwG4brzdy0AkHAuKcyXJoccidcf6
         E0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792394067; x=1792998867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TvlgYQm3dB8aOMy4KbGGHq81fZ8P+nSRZxAdejOQGxE=;
        b=EAz2NTYTG2HjPYFdMzykBKC2haWarRyr8LkuBzdgzPmoNoxNZfDGMGxYt1sXSac9SE
         ohH8cwZ2rvszwvFcoFuf3gmEbOosV87N9FW0HGYnyNzPSuS3wMkbtfHonaXvalck+vGG
         d2URzaPP4Y/fJzlkO+lPx96Plc7zZHhApDjHEQ8HqxahfNbTPQE2abeQhGnhPf5rVN0F
         5sqaxwDVdpon5sB6qUF0RrG6yx0rscB2A90zfaZqJjJG+lUn1tt3zXp/gamRTza32hXY
         /KSaS3kt2iSnFAxZndpM4njpcvRqgPHi4GH9lFVTKJ4J4sHRaVDaATwymnSGnlvDnMcS
         xlUg==
X-Forwarded-Encrypted: i=1; AKwUvBwyoX8YRG3EDGAn90E0Qf/boZDUVWRY9x16aN11R/QKZnQeC7eJn0q29S1EBK9/1qoYPLjbklfVfaiy200=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRLYlhSok9sgvZoYSI70CuL6jHgcuRF76WoIo5WKppQLkExWcT
	TwKdnPGvizRo3tEvXCvtgQQE54bryF3r6vHTRGn6fHw6+r5BNmcLrnu2
X-Gm-Gg: AYBFou0DXyznmQPSVD2FgR94SHvOZWQHjum+pbf+Xhj5VAYfJMAn49+mimX4slQF4PK
	krY0hzEdZyJQGsnjpoOXKAYOa0EgI5JCp3w3zgeXNWIEjx8StpskMGtvP2DaAieFhhRarC4cr8D
	p5zNRWcZtCmPok064uxWxhbSyX+BEG34MjyicwvS3psyCHa1NjBR+6b0X+DtrWq0J3+QjnLqQQj
	MDbrib5y0o0S1Z4d7HYEECj9oZC7iMnekEQwRz3DmEWLUTvxtM0Gzyl3jpCA9SxF2WXnefMoMGq
	PNt0umSX5+u6sobbN5qONYMnkOoW+0x7heSXqDrfhOowb04ija3bx2LWE8sJrHaO7gLuY0V2k1h
	Rv1Z/iSZgxy7FkmouDUibL/VTzr47TIIwkFdSmwBLj/rc6NTn5XARJkEcjbuU3WzIPzw874XgIH
	jqPJ7OW9exvTfKEUOs1lyiE+Bl6RIQ1rwVsn+5pqCFNm9llfv5xIdG8KyKTTNscQVCy/fzOKJBN
	feL5KpGDO+Wl2SV7SAzTzWaIzyLRAmWL3/yJW+saQhmjH65wL39pr0i93Z+/QyuWaDK7Eonr8gX
	FoS2av3SyMvS8bDKPLXfbNC7TXa+6YDj+0OKyWFTm/C9PZTXN+XA3FrJzsFLY0BHrTKhQ5TZkQy
	s
X-Received: by 2002:a05:600c:a05:b0:4a1:813f:2a57 with SMTP id 5b1f17b1804b1-4a1d7608058mr147552565e9.13.1792394067002;
        Mon, 19 Oct 2026 00:14:27 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4e0-4601-c43a-536a-04a3-af7d.310.pool.telefonica.de. [2a02:3100:a4e0:4601:c43a:536a:4a3:af7d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm21559338f8f.2.2026.10.19.00.14.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 00:14:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: linux-media@vger.kernel.org
Cc: Tomasz Figa <tfiga@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomasz Stanislawski <t.stanislaws@samsung.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 4/4] media: vivid: synchronize imported DMA-BUFs for CPU access
Date: Mon, 19 Oct 2026 09:14:11 +0200
Message-Id: <c12681c1d39c45ce554d31eb03e3452ad55b0e43.1792392288.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1792392288.git.kmehltretter@gmail.com>
References: <cover.1792392288.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vivid accesses imported DMA-BUFs with the CPU without cache
synchronization, leaving physical RAM stale after capture.

Set uses_cpu_access to bracket the driver's CPU access.

On a Pi 400, stale frames fell from 25/96 to 0/96 with this change.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/media/test-drivers/vivid/vivid-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/test-drivers/vivid/vivid-core.c b/drivers/media/test-drivers/vivid/vivid-core.c
index 62cfb5feb2cf5..e3aa1fc3bcf75 100644
--- a/drivers/media/test-drivers/vivid/vivid-core.c
+++ b/drivers/media/test-drivers/vivid/vivid-core.c
@@ -925,6 +925,7 @@ static int vivid_create_queue(struct vivid_dev *dev,
 	q->ops = ops;
 	q->mem_ops = allocators[dev->inst] == 1 ? &vb2_dma_contig_memops :
 						  &vb2_vmalloc_memops;
+	q->uses_cpu_access = true;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_reqbufs_allocation = min_reqbufs_allocation;
 	q->lock = &dev->mutex;
-- 
2.47.3

