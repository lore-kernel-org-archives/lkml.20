Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793996320;
	b=IiV7NrzkWD3+j2jDv1VcxVFuP0ahZThxpG5CMHZ8pMJ03+koABAXLSxFkZqYS4X5SA2y
	 lkohJajuqiUtw0t+Zpq5ZfXeSy227N5i1t22W3lFgKw2Z/+dhhTnN7radEelK6VT7nD+1
	 H0v4kaauBAcnJ80cEdS9pVx0rMVctxVbeWWWGgQBjYFYvNSW1JWHLtq31Yok1TnbeSKRC
	 7fmMEPjN0khhM1aDP/UuEGG16BG6lroAdl/GKmS1KddyO/eWLRx2SaRXx+plt0wwp8dcN
	 RxjdvznRh6wcyEUFi68UGKvZRgH6XSHt4ymW+EcoxEwL74Kj0LxOMXvHFPNw0OCefEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793996320;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=F7fQsHw/LRcfh1BCfg6ekMNR4e0098O9EarWCOnY1i4=;
	b=PXZw6ZjZ2xOdh19kOTlIrfbap4OdUSScRV61AHfWPk2gT/HaFn/HvfSpujaPzCe3fcUi
	 L/t5BR9uKtmF0c9rKj5OKuNFfolphgnRD1Tlf/GHQF8Y2Eu5qG+KaiGutUp8gKjayYpV8
	 sdIxJYVK0Z9ZjT4GcC5A6wmvy99nWZPf3z0U7uOdgzGkz9lDqewgL6nGwPy5gcDPZ7BSi
	 qeDqwIedQfqRG2f54xhhFd3eXVduMWy9T/meRoceu77eGFhfiAYS9agkqVniVLrITzTgB
	 ch9EdD2MqL1u+4ByLdft+3JltdH1v5sAZGS0qenoRT9irrTDsq5/7zjSU2RLaonhRMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GUWsEY3y;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4773A606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 20:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4773A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GUWsEY3y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793996317;
	bh=2SHu5LqL4nbO5DBRC11DYAEvUpJB/1avdF8wS3M0G10=;
	h=From:To:Cc:Subject:Date:From;
	b=GUWsEY3yNz5v4hqgJ8ZZ5DaJQHIh3J1/xkG3Ntk/bHaxA9WW5zWOMnBZzTovz2D9e
	 MsGnR8XvwPajXm6exKw4RBjfvojUPDLNedDOgw7KD4k5+PlIc1h9kwLhRPnRPAfAA7
	 zyXo7jL4SJ1miKo5t0mqc6EuwJQsj9kd9OMaQVjHUgtnsK42o9a4emoD4Yr/IRzQzz
	 0sQtlaYGZPvT5FyfQWsa06aB9Hq0GIzB1ira6SegHpbb5eFWJ8qmyjgWK4+JZFGGfJ
	 VS/sets+r4Q3rnWcr6cVI1rxU1y3YTgT8r6rIeQLPexn5zuReBcBc3VnDdmuVUza9g
	 czMTYI+Bf1dZQ==
Received: from archlinux (unknown [100.64.1.80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: leandrohrb)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7C7D17E05D6;
	Fri, 06 Nov 2026 21:18:32 +0100 (CET)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com,
	alex.hung@amd.com,
	daniel@fooishbar.org,
	hamohammed.sa@gmail.com,
	harry.wentland@amd.com,
	maarten.lankhorst@linux.intel.com,
	melissa.srw@gmail.com,
	mripard@kernel.org,
	pekka.paalanen@collabora.com,
	robert.mader@collabora.com,
	simona@ffwll.ch,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/12] drm/vkms: improve color curve LUTs precision
Date: Fri,  6 Nov 2026 17:18:01 -0300
Message-ID: <20261106201813.129911-1-leandro.ribeiro@collabora.com>
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

Currently VKMS only supports uniform LUTs. Besides the userspace
provided LUTs, it also represents color curves with LUTs, as it can't
simply implement the continuous curve formulas (floating-point would be
required).

This adds support to represent color curves with non-uniform LUTs,
improving the precision significantly. It also provides a script
that can be used to create these LUTs.

The optimized LUTs use more samples in regions where the interpolation
and quantization errors are higher (usually in regions with a steeper
slope). The LUT generator script compares different strategies and uses
greedy subdivision, which outperformed the other methods, to generate
the optimized LUTs for VKMS.

For now, only the existing sRGB and inverse sRGB curves are replaced.
Support for more color curves will be added in future patchsets.

v2:
- Fixed a few minor issues spotted by Sashiko bot
- Added reviewed-by and tested-by tags
- Rebased

Leandro Ribeiro (12):
  drm/vkms: rename VKMS_LUT_SIZE to VKMS_GAMMA_LUT_SIZE
  vkms: properly compute gamma LUT size in vkms_atomic_check()
  drm/vkms: allow color curve LUTs to have different sizes
  drm/vkms: remove TEST_LUT_SIZE
  drm/vkms: remove linear_eotf
  drm/vkms: improve the way in which we access LUT member
  drm/vkms: rename struct vkms_color_lut::base to y
  drm/vkms: rename get_lut_index() to get_uniform_lut_index()
  drm/vkms: add support to non-uniform LUT for internal color curves
  drm/vkms: test sRGB and inverse sRGB LUTs using more samples
  drm/vkms: add script to create optimized LUTs for color curves
  drm/vkms: replace uniform sRGB LUT and its inverse with optimal ones

 .../gpu/drm/vkms/scripts/color-curve-lut.py   |  573 +++++++
 drivers/gpu/drm/vkms/tests/vkms_color_test.c  |   48 +-
 drivers/gpu/drm/vkms/vkms_composer.c          |  127 +-
 drivers/gpu/drm/vkms/vkms_composer.h          |    2 +-
 drivers/gpu/drm/vkms/vkms_crtc.c              |    4 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |    4 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |   13 +-
 drivers/gpu/drm/vkms/vkms_luts.c              | 1469 ++++++++---------
 drivers/gpu/drm/vkms/vkms_luts.h              |    3 -
 9 files changed, 1397 insertions(+), 846 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/scripts/color-curve-lut.py

-- 
2.56.0

