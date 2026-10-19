Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424913;
	b=gGCujWtyUj578ypDFW2rDnu9LD1VNZz3uTh1JP91aPhyWbhzoIEN4/R8C0W9/D13nlxR
	 5J+nlajraq3+Rt1ApntGY41tWcNEvVclg4RPK2Mu5IkXVwWGFeWNVjLgsV2kukSDZsGs/
	 H/Ww8Gz60933t94T9ximKpfw7JbMA8e21OEJRqUEi+3K/LKj7xsjryV19ktkAsBXO0NYZ
	 hFMVxq2SOlRxJya1QeBbWcLzRqVvTz6CuJ0vBiE7sHNLVw+ywvx8p+OrT61rz79x8zqZ9
	 FMSJbA46bbvu3NEe1K2ukdspXTTVFaDp/WT8g6n0WmGAJjUiQC3b8YjyCrKTuPsYgBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=D5ibEBjYYGDjpoR4yF5DIOCUI477W7gW0Qwdc18+UCA=;
	b=dMKX6Fi0aSJg7/RbTJVNdRisreLgLkj++oV0k7+Uh5MXHpDt3jcqfPkRyBIefFh+afW+
	 itfWBSJmlwYlVDGU15QsN6YUyIKI5tmTxvl1s2AO5KXvrcPQ1qWQ6Q8pLvShB7ynjn6qV
	 /KscFtbwyGngecsLK71eKGRp+pUJG7HoXRLyy/fOorz7PUrheazCdpfnNPreiuG2RGpOS
	 49U0jlWfGy+2onLoOn1HqZqbqlqTS3cmX1LyiV7FSopg04ja2DucFAQPE5OeP14PQTJ7U
	 ghEj+ibIe1AihgUD8G7Br2CkG7wvUQ/4y42vxz7H8O5QhJU/lxql1SmHYH23uwrTV3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Fop/91rr";
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9AF60882BA
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A9AF60882BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Fop/91rr
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ab60ff4273so2044975a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424912; x=1793029712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D5ibEBjYYGDjpoR4yF5DIOCUI477W7gW0Qwdc18+UCA=;
        b=Fop/91rrI49G2R9n+i6IU+JVwKKE5uaqFV0aTKU53z8zbKm2FzIoge5IJiz+T3kTfk
         4RN0TeKMVRYy53nGS5ynGaXrb97knBDYrp1dkfiWLJPvQfJLMHcWMWC2tiNoMflVOcks
         AiyEKT5VRMrtanNzOethDn5wbqoBHmArLVGNXUKivEcHgprsSs/zxYrEVXQWzTPxnkPw
         /LAdhzLZ7f9gMJMUNwD0Wfs3yT6vuOsvzp8R9UTt6lF3IQGebYxwP0rqkNyOE6FYWurP
         swnlm3iXTFNrPaUcUvw4A1jvi6j9i1W1tvPNJl5mmJX99ARl01S9v01otcUBC6BFXGVh
         IbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424912; x=1793029712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5ibEBjYYGDjpoR4yF5DIOCUI477W7gW0Qwdc18+UCA=;
        b=rx9588gqHZc7FfwqdGsAE52l8HdYwn8oHpKjBK9tWbD//ZM8VRFk1mg4OPfa29hHvH
         DFMrdPmYkRDfC4+al7STFJqNqsfSaSVcNFldla9sTxGE7gz2LH6CWT9ykvEjryASYb2U
         ogLsQuTYOwl+w5YI8gth5cd55yYGN/EOi7fHO3yU0yjp2SZFIF4HP0hHSuvJnu4z1Luf
         dfMvAxW9Y0x3CYXaK4PLXBzAV7vBRSM6DfKK9QrX9nRqoSjwGlF7OlnLxrxR+kl0gzhK
         5DifZzamE/S9aEqHC0WXGZjrukPCua5Ngmg9pyWNU9OB6TexJLsrQBMrMY6mEx2XCBf8
         LaSw==
X-Forwarded-Encrypted: i=1; AKwUvBx99zaZ1vgigyRR92kv39zDqsczs/UY0FzPFtlEyr2wZMZOHH0UNYLjvItrQVN09QeWmo7ocAEMFOxYkqA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5UG5OkVRLbcrBADtFjCrZtHl/hTmozBB1sLh13VhsEjJiDp60
	5oBG5B0pHU7oDDq+litw1hsWVLx0pohYScdyk4faUv8PxScihhQo85r5
X-Gm-Gg: AYBFou0Dugd/1VxG/LA73RYX5WEQChJW7ZiGdYkrrmqVli/l/LOld/wdEmQin+1Lirk
	wBVAdyFtjCjkkbppfXHb8OohJ0LtKaDgMVCAFERTYFJtqC5dnL0zlOa6F6dOjgpRbRT3uc4tc/2
	cGsmdG9CbgyEXnKvILV8hWSYbM5CAADcxzktZNJPAmKe7c0uipHURCM6aqm5WOveY6/qVDGEUOx
	JpBMOO4QDZ59xHW+2DopUpTX988X3921ehO91goNASv98cNKVtSi/nX8r1xmO3ADYgStXHBcciv
	q6u0zrlRP859PB1m6xdubywaAL6fXTtFEvE0jG5hD7uz/gPoEQDiq9F2LM1IKhAmWClz/3Quu4X
	qoSgsvTnbGn5qm/jJKmznDVeh+1LR52tqWBp+9o7o7a8PO931wbWkj2gf7+/H1Cu5VLKwUDF/vo
	gcVltuwOmEXYKoE1jf5864/aIDVHAxt3T31vS2rLMbhrgxwGaK8zWicfFqBfrPkjgeen6u4pBJQ
	oYcNVj9+X+Oiuv7hismGuR9bHicPKknh30Sx8QstyEaVIl2qg==
X-Received: by 2002:a17:90b:39ad:b0:3ac:74b3:a8f3 with SMTP id 98e67ed59e1d1-3acef542337mr7164449a91.44.1792424912467;
        Mon, 19 Oct 2026 08:48:32 -0700 (PDT)
Received: from hostname.tail4fb79.ts.net ([2401:7400:c804:b668:a144:150d:733a:5ba2])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ad5cc13658sm63271a91.4.2026.10.19.08.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:48:32 -0700 (PDT)
From: Ho Jie Feng <hjf3108@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Ho Jie Feng <hjf3108@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] Add MacroSilicon MS91xx USB display driver
Date: Mon, 19 Oct 2026 23:48:04 +0800
Message-ID: <20261019154820.68659-1-hjf3108@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This series adds a DRM/KMS driver for MacroSilicon MS912x/MS913x
USB display adapters.

The four patches add:
  1. XRGB8888-to-UYVY conversion helper.
  2. Register access and connector support.
  3. Atomic modesetting and USB framebuffer transfers.
  4. Kconfig, Makefile and MAINTAINERS integration.

Some code is referenced from the vendor linux driver.

Tested on USB to Composite/VGA/HDMI adapters, both USB2 and USB3.

Ho Jie Feng (4):
  drm/format-helper: Add XRGB8888 to UYVY conversion
  drm/ms91xx: Add register access and connector support
  drm/ms91xx: Add atomic modesetting and USB framebuffer transfers
  drm/ms91xx: Add Kconfig and Makefile integration

 MAINTAINERS                               |   7 +
 drivers/gpu/drm/Kconfig                   |   1 +
 drivers/gpu/drm/Makefile                  |   1 +
 drivers/gpu/drm/drm_format_helper.c       |  52 +++
 drivers/gpu/drm/drm_format_internal.h     |  19 +
 drivers/gpu/drm/ms91xx/Kconfig            |  13 +
 drivers/gpu/drm/ms91xx/Makefile           |   9 +
 drivers/gpu/drm/ms91xx/ms91xx.h           | 217 +++++++++
 drivers/gpu/drm/ms91xx/ms91xx_connector.c | 263 +++++++++++
 drivers/gpu/drm/ms91xx/ms91xx_drv.c       | 518 ++++++++++++++++++++++
 drivers/gpu/drm/ms91xx/ms91xx_registers.c | 386 ++++++++++++++++
 drivers/gpu/drm/ms91xx/ms91xx_transfer.c  | 218 +++++++++
 include/drm/drm_format_helper.h           |   4 +
 13 files changed, 1708 insertions(+)
 create mode 100644 drivers/gpu/drm/ms91xx/Kconfig
 create mode 100644 drivers/gpu/drm/ms91xx/Makefile
 create mode 100644 drivers/gpu/drm/ms91xx/ms91xx.h
 create mode 100644 drivers/gpu/drm/ms91xx/ms91xx_connector.c
 create mode 100644 drivers/gpu/drm/ms91xx/ms91xx_drv.c
 create mode 100644 drivers/gpu/drm/ms91xx/ms91xx_registers.c
 create mode 100644 drivers/gpu/drm/ms91xx/ms91xx_transfer.c


base-commit: 5e756743945d3b6bde6d8d1e3f943a03269c0ece
-- 
2.55.0

