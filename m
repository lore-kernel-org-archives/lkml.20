Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD305304CA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790692659; cv=none; b=UaKPiRx+nErJ/a+V6Hq1D0zmnDTKn+g9Bi4VfitWBbsghqg3DhvyAs12hJ/84RBFLW+gybz3j7lfzEv8Q5bTuzv+dSMllu0/GCOXc4w2a/0Vo5OsEFcZLhoBD0rJ1+q3UkpElhlXPd7yPY1MdXzuItlaPBIucPxn9LJGKXF6XB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790692659; c=relaxed/simple;
	bh=8jeJ3YJO45J2oYVr3ApJb5fJ6SYGUA4846QEuWZklGo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k3UMBiUs9SyoEiMc2ujCD+W5mwfY+jAVLEJi6OCVpC/7a1a3CiWpS/GbPGuWRpp21MCRojVRRx8w/OTNUJLdPhS3C4snjy4J5lG+uLfnKMfCjmvi4yhVmHlrivH1/f4p0ZZWV7RdGRyTMKvxTjnmQYrHPO2R9RsKG81yNxs6v2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pt979KQ3; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pt979KQ3"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so19507745e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 07:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790692655; x=1791297455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VWqinP7Zno7DcSlkiFvqjdgX8G+hgdcZR7wuZugNU3I=;
        b=pt979KQ3EOJQEYxoi0wqZ+4+H3VbHjAVxrJnfuQTmnbMEzy+vdtzDJ0CSxr1/B7uKj
         tgy2PMonNyCcwegdUutbrG5itiqkAJgRIkiA6e0ACUsSJVkEIuBnHlFMfH5rhJswrjFa
         rJrQ+gWEx/cDnVouttHQFFnvCIyVKyUCY7evIQ320Pde4i1kHBRKgMxScZrqSzNfAucu
         YZktcLFlkvPUo/LVCByYiBUH/eHtQOa5BDNjY2GyuxsYUi5f4SP2ThIxuPb7KGy0QPNX
         tVNKNJRNZnq7aJvmQX8lJfR32mwUU1mWc8/lXWlc9md+BVu3MbAjkDAVumNC04jRn+Ds
         tCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790692655; x=1791297455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VWqinP7Zno7DcSlkiFvqjdgX8G+hgdcZR7wuZugNU3I=;
        b=fV5Cuk+wZ1zOWeBvpLKF3IQNYQTz5RQVR/5ecmAVgKbyaO33393IL8OCLO2DCHe03R
         M8gLvnnS0tvj7Xp+Q89zgt76Nv2zGl+L7jS/iqV6kWFnyaUh2uJpUDyH39gpu+hPDsbw
         Loej9mStyj7x9gmIltksFFZDn3xx+3YYyvwRySchv7l727MwS1kd6nMQfQhKfJBvLHRQ
         EM3VUPGH4TZTGl6OjjpiVnHe6b56FtnmK/u0rAS5j2BnFKU0wwy3osBVm96Th7plCbtj
         QV3hhb7M9foZ4xqtlwm0+V2S8grAOVMuHZDPjnuGzZeFl3wyUY1UAjIa5X3/liSfmibT
         yLRg==
X-Forwarded-Encrypted: i=1; AKwUvByYLk10t7x0rTveREBf2Hu6d93vUv2POrtywZt3/bETUdpLmSHzl381K0i71LtKHRgjpOv+bzzCMxFh2oY=@vger.kernel.org
X-Gm-Message-State: AFuF++lFLceZULogCF8BCyBRbhIU4uvxCOL1m1X4RkUd5hy6SC4rGAPU
	EEDLdLCVGL3aFyMGG6H3I6dwmd64d6Fd28SyT5eqjIqjvktvTF6zH8XH
X-Gm-Gg: AYBFou3fTItXWlwpKKSrth92k8XmArOCUQCOjYlJKR7uKtvI8a7isEXOBcAvWNUg+/Q
	wCvFu6mu9DWxmh16t9GWotduk4IRms76j6Ie/jZhFSz7w/m2Z1iUelPoQBZbAstIvDqEe7Sdoag
	s8grXcn6J7T/OTG7H3Dz1CXz4XNNLeJODEF4gEunptsQE96XUvbnvpYbHCzS7YOkjMFsBaZSpg0
	dqAVGVE04Mun9+y8t89MQCWoSmlIhBq7MhhhvFzqrhbJy69pNpueS70kpqhcnkZ7Q2yyvNnpvU5
	S4FTE0yC+O5TS3BcE4jDPYFQiiAKZG+kr02qkWIJeHLYGkj+jKvaDYVzolSWs6+8/f7kPS1pleP
	u5GSPgbTevfudzecwwUJ4U43Z9ioXNhZabsderJyrCQLP8YrqYBD0+AH32z7OPpjeffytbhpyDZ
	e6zIUEpz4AG/zX9/iEdSH0EAg9bp9Mr1p/0vkh1yPklEkcrRlMu9BQ0a1XeaPKaaFcwPcuOce2R
	3rAx8WVgN8DTYqOupCPlnA4c3Z2rNKZ8TEs/0pZLKRyepL535fWtnApos4=
X-Received: by 2002:a05:600c:3ba9:b0:49f:fe48:d177 with SMTP id 5b1f17b1804b1-49ffe48d294mr195955825e9.32.1790692654751;
        Tue, 29 Sep 2026 07:37:34 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf8f93csm89716995e9.5.2026.09.29.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 07:37:34 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Sarang Sapre <sarang.sapre@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>
Subject: [PATCH v2 0/3] media: ipu6: ipu7 and ipu6 fw-isys fixes
Date: Tue, 29 Sep 2026 15:37:28 +0100
Message-ID: <20260929143731.43358-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the firmware config leaks on every stream start in both the ipu7 and
ipu6 fw-isys init paths, and a NULL dereference on a PIN_DATA_READY
response for an unconfigured ipu7 output pin.

Changes in v2:
- 1/3: use goto labels for error handling (Sakari)
- 2/3: new, same leak in ipu6_isys_fwcom_cfg_init() (Sakari), also check
  its return value
- 3/3: unchanged

v1: https://lore.kernel.org/linux-media/20260927201631.153126-1-devnexen@gmail.com/

David Carlier (3):
  media: ipu6: Fix ipu7 firmware context leak on stream start
  media: ipu6: Fix firmware config leak on stream start
  media: ipu6: Check the ipu7 output pin queue before completing a
    buffer

 drivers/media/pci/intel/ipu6/ipu6-fw-isys.c | 34 +++++++++++++++------
 drivers/media/pci/intel/ipu6/ipu7-fw-isys.c | 26 ++++++++++------
 2 files changed, 41 insertions(+), 19 deletions(-)


base-commit: 2dcdfb625c3b8fe87454e19dfbc54b3e3f0ad70e
-- 
2.55.0

