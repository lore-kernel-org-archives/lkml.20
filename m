Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794631397;
	b=ERaAqwV0lGkAxY4azQxY6xxXLf3VMksYh8Tp3Md9iBBGRynNrkOeNICpocnZVEc9OsUh
	 /OgeXDY5ZMc1G1hLcgyfpg3vCT0o11w9UgHyQOJErz/jbV1n8/2xrUMLaMzC0tBITcElt
	 bm/jEBYJM49wmNcves0jCBkBROTBkAUGKGQnZIuTJRpqyD5zMO86u1y0KIuAiqhU17QZs
	 3e24sZMSVJVXeZXe/EjDccu6r/2MZwjtm55q71/R0mWsvYPFapEcIPLIYuAg9zcdFu+9T
	 qN2miq3slSJBqwnkTRfdtgzCMflXI4p41UqzJuffmRX9VJVoQc147B2b22q1zk+gWdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794631397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
	b=Y5sXJVs77sIAEIdZuGySZgwU7MXFCcexQ1GjX6LkiblWVMQU8i0ZkoFuGiCO+9n25Xud
	 ipNRcCBv1q5n9pTQMp5HXuGcrUwEcQ/lcvgGuV7XHT+mVKSbPbICKmn1elXafvTCSHFbO
	 rW+rpzoENQVTZfJB32mFgW153f08dxGW9O2QiOun9GcR6QM016/QyFY/4L2Yfs0wtWcMu
	 E4wEkmDR1raw/BJc8mdIgSE53YFp75p2U1zojy5VFKpvk4VWjREGYvJqE/tyHBF27qmE1
	 1ZvEmdosoxWSwx91ee/ryny+jYqd2V3zaUl0iA+9HyWC32BMNkK83Qgl8siGUug/kMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnhzdhYn;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAEA606A330
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:43:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAEA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BnhzdhYn
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4be0e5351so654735a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794631396; x=1795236196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
        b=BnhzdhYnZq+pqF4iUKKylyIbQCtz1P0HwrjsAZxz6tTO9OPb+g+e4k8mFpT0Ig+R55
         gYT+FrZFc3/ymqAsAhlA63dK8BHdlH1JjHkf3ATpfdGFxg0paLMvY8DfzxXSo5FlO8La
         TxYOx7KkJBnojMOPBzyG77uTuXn2lww6vDYa2GvKAabHezw2KoY2laTRxAvEDcLYRdrn
         MTMpilHlDRCzhnRRD+DDCWLfSEZCAIiefZkCh0B6SicqUZH6BtUB6wtudrbEBoYnUx9Y
         9UIiSOvZjAvh2H3N1sloGdYGAUSHqt8HWZg/CsQSn3KPGsG5z9dFxbsMmJ8LIoDktWHh
         xHHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794631396; x=1795236196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NiLyLycHtB+4ZXXMT4vdH4DfsyKDD4oOgAOd0xeeHHI=;
        b=OsgXufgg77UNXFT+tdOQcby3jiSheAJrvN8+SlmI/ckoe6nbLPWwJ+mpmF7RYtWP8g
         JmTDQM/zzGFfvWVilRhVcMdP+1XQusmUnCBmwJHvR4B0SNsU67i4s8PaPCd8meEUdWWv
         jw3xlF9Kn7nYbZQNZOLXqam6BP5f8Zf4BqaO93HfrvwNtk2b4uEqjtEX+0Aqmzat6Z5O
         eRtC1geJrXgntnBvc54rWMHqWyIKYvRhPZsx1cX2enYYa9FEU5U+zTWHmoeODmxPrsAy
         0x0v4fgq1cTMCX1Hr0PbTJBuPJ2dRQ0XuZto/03LbA1u1Qe7X1UwSsNHck6kbuQ/hf+i
         FRxA==
X-Forwarded-Encrypted: i=1; AL+hErHQ6aVvhaiZlmuxCL8zU73Ta2A3RCZDuhRgOmh3cWHfaWhFkF+wx54eBWDB/ifuyRiK63MTjC7z8tEoTIg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qn4/Hx1ZJ1B8UM5nn/alo9f5C2nSurhYtDlTDBYKFt4RMRYej
	+3bQRvCgGk2y3E8Z99S7yOXDAeLZIF/LKZFtxJcMa+qoyZ0exC50iI8X
X-Gm-Gg: AYBFou28MWsPmjyRiAJqWA6XjYvwLsEbre+Sl4PUQ3dMCqKX8nR4Gvj8gXhkgI0nZ/r
	XXosxDilwWUsusDCZiP1QKIkiX5zhucJ8PUUr2SfXR479wufPSFyfus2Xnvg7ncf2kx6X3P8G6s
	HLsIj9mY3WyuLDVL5YSr6Yv5T9FA7vboig8TVy9CK6dXtWAaI9qH4WiAkxED4f1q8sZKKqLXBEf
	kJBlwI3i/aHRmF0d6U4mfLifnqoyTIsrOYlVY17ceOKOWKKrM7ppLlTOSD6JZsYr1ocm06xLfQB
	4efPDNC6us9F+X6fp+u6/4/FCWU9F7Cpp3DNBP7tNTIAHUyeQ51wu3Linqbo0VTVr3J/2OX53NW
	U9Pl/flMRA89RrP1/vai+it0+Gs14JL0eSYbtqWADbUJaDzZRTgcEK/JUdPaL+Tj3xsHat8MG4W
	IWFxtw1FpoNr1UUd+n+tRGx1UhF3xYGHGFAcKm4+k9KZYqKxj+UE2IKXWeirgbZnWfIbcz8E1Pw
	g72+V+o6oTIKbY3tzN9cqhi8jxBoh/IDuGCe+3sFScWp5AQuiW4wUTRw7+bGeAq86ID3ahflBT6
	mDZMlfcUFTogWXKE8RnOzQdbOhpUbSIYqsY=
X-Received: by 2002:a17:90b:528c:b0:3b0:a9de:9884 with SMTP id 98e67ed59e1d1-3b1b0a4e3bbmr4061630a91.40.1794631395879;
        Fri, 13 Nov 2026 20:43:15 -0800 (PST)
Received: from localhost ([176.210.133.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3eaf732sm3230685a91.3.2026.11.13.20.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 20:43:15 -0800 (PST)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	vladazaharova2018@gmail.com
Subject: [PATCH v8 0/4] gpu: nova-core: retain the GSP-RM log buffers
Date: Sat, 14 Nov 2026 11:43:00 +0700
Message-ID: <20261114044304.245684-1-vladazaharova2018@gmail.com>
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

The GSP-RM log buffers are exposed through debugfs, but they go away
when the GPU is unbound, including when probe() fails, which is when
they are most useful.

Patch 1 moves the debugfs root into the module data, which also fixes
the root being leaked when the driver registration fails. Patch 2 moves
the log buffer code into its own file. Patch 3 adds a gsp_keep_logs
module parameter that keeps a copy of the buffers after unbind. Patch 4
drops the completed item from todo.rst.

Changes since v7:
 - patch 3: check only gsp_keep_logs, not CONFIG_DEBUG_FS, drop the
   reserve() before replacing the copies, add RetainedLogs::push() and
   mark retained_logs() #[inline] (Danilo)
 - collect Alexandre's Reviewed-by for patches 1 and 2

The code and the commit messages were drafted with an LLM coding
assistant and reviewed by me. Each patch builds on its own, and the
series was tested again on a GB203: the copies are kept after unbind
and after a failed probe, replaced by the live buffers on the next
bind, and nothing is kept without gsp_keep_logs.

v7: https://lore.kernel.org/nova-gpu/20261113075317.934264-1-vladazaharova2018@gmail.com/

Vladislav Zaharov (4):
  gpu: nova-core: move the debugfs root into the module data
  gpu: nova-core: gsp: move the log buffers into their own file
  gpu: nova-core: gsp: retain the GSP-RM log buffers after unbind
  Documentation: nova: remove completed GSP log buffer task

 Documentation/gpu/nova/core/todo.rst   |  12 --
 drivers/gpu/nova-core/debugfs.rs       |  45 ++++++
 drivers/gpu/nova-core/gsp.rs           | 100 +++---------
 drivers/gpu/nova-core/gsp/logbuffer.rs | 205 +++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs     |  68 +++++---
 5 files changed, 313 insertions(+), 117 deletions(-)
 create mode 100644 drivers/gpu/nova-core/debugfs.rs
 create mode 100644 drivers/gpu/nova-core/gsp/logbuffer.rs


base-commit: 0ff9e5b9ff6736c37593cd7db89f4593ec4f8e86
-- 
2.56.0

