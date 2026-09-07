Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477C221254B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 12:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788783496; cv=none; b=GzSA2RglqMOnCBNJcJKcjvGKkoYubJna7WPVFgYQOjniMkYlvf5lyUGe/asbmkbQxiQqq2MMqc9smijS3hWM6qB1DMvKKccVK31gOxr+qWdqBZlAqUMKEBNhJUeGL3pWHgOqemVwjurvCoglRYT8IUQWRGZWFwXUIiMc7DTT2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788783496; c=relaxed/simple;
	bh=LYnwUEwJzU5eJuUV3p/96JuI4kii977npFTZZOepNH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KshAWUIw21UnwpVSGz9V2i6cG1uzFfDDlafE9SEMPH4yiy1N+JqmNlScuJwGd0WA65H0ZdPLvt0G3yvjggOhBdaq1S/YnAg29Eqnkzez0Yp37BMxivvW4b3otDUOwfT7WTMiTY7/VlXgbmyrEX4ruc60pJ5j1HMiHNttfEBh5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR51r13T; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR51r13T"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso4701893a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 05:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788783492; x=1789388292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oMsCw8GiZTKqLZR6QIiDUwMuQHXPEn7isoxeheHJ5mw=;
        b=NR51r13TAIhWgx/vzWMr/PMzJICFDUWkGnmWvez4JjYHjP6/kuLbqCleILh9Q+gWKW
         rEJWyZfO1ubMd39d6HBsn4hPbblSppDchXDStLkHctKA5EUZB9hhBCr+MCKNBd4Doe1H
         EBcsxHWpVwjXhcoXMl40isHcCFrAMz0SqFXFRpWrbF/OF7dS0SLx+oP2e1Y4+FQCsu+F
         ZGKCWQ1yMQzTzk52kLKrD5jtRn+P+51OitLG2xZPhj10mW6PgQ1CiSZGFUv/3soOZsJm
         X4nPx5Gz0Osb2IY8nErcS7eUj8H78Lr0WFYl7/fcYDXs2Jw/DD53Xd9x5eWjIACD/ZeC
         2KBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788783492; x=1789388292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMsCw8GiZTKqLZR6QIiDUwMuQHXPEn7isoxeheHJ5mw=;
        b=cZHH6Lz4bRO9yf8PVSSWVGAQphkomiRk7EUt076geBor/DcUp/uqPRd2VXmGYG2lu4
         TNHOM3R38ikcouKcUuhnQKY8CiqOAkOF2Fqu+R+krnggtqE0U6C9kzlxNOf5k/ZNjTN1
         Wr6+/bLTIAsguUEbAk/VbiVB6ERflhfWlDZscE15Ra0XN8JGRNCDXSSeU/271NtV0j1d
         lydXDRg97ofJfSWfBqeXMxmHE4/OjkovqSZ3GYmar9ILGKQOfTEkxBH9GIUPsZzf2kLw
         QgjUgSk5FzZfmEOvpW20nPqkOV5G/Od78rpy/hztu3X8XcFNXCUgyu2Pkq1Q/cPPx+Nu
         ZhKg==
X-Forwarded-Encrypted: i=1; AKwUvBwEzLsIy9z1BM94HefjXxc/PrcG+yj9ueob7u/P/GFF3T3e3MZMRUdcWbtMyACNxE0UiYLTx/o6dJVABDA=@vger.kernel.org
X-Gm-Message-State: AFuF++mc8oOUsVI/czZhAOZzM4iZL7PPJg3ZotB8q/x2j6/9IkMJjKuc
	GmD9U6HFG55B4vc7DqcvCQ4kWvcAjXkAWmlvdz92BVL0+Ck7MPsN5v3f
X-Gm-Gg: AYBFou1lzAZgE8NnNDnypnrYDNL6pBKL2oiqYNb91iF1fc130QZaLrFYvyGjzcrPmCq
	5x4tK9kMv3cTO5YQqcGWrNvLiT1Rvio320DFoFfkRJfXPh1TeKOfQo0sepo2BXU9ygPkVT2tuRh
	M4Vr/spiZmrli9qt+ZdRvjogi3OcSQYNVUaFYabWQYZvdxLIrOQwFXINvdL48RPJsnLC56hhZCh
	dLbOPK1izHotMUPAjRz+HsLWLwJkZ9XBP5R2zYblrEtcaXCh4zJhagGw+xMDERuHohxYG3XMIQV
	6HjHxZ3vG4LBdUaTiQFs/sPHC/G75Bo4e2qyMPeVT92gBEbPFU24z7PEBTGdJM/OeD+u7WTbObP
	Ve26wSatwNmWIk9peTh2jsiHc87mE+H1/yuChtf1rX92vbUOeqYQ5tR48yGtk+ev/s6HY5BGS6y
	9erOg2/p5aaZ4VKzPbQwvELZB7IYiRTKb2YkZxpP+2zjefFyfDgD39AfiQ7+tLT7bi++3hXmk=
X-Received: by 2002:a17:906:2099:b0:c28:f9e4:836c with SMTP id a640c23a62f3a-c28f9e49c9dmr85196166b.28.1788783492029;
        Mon, 07 Sep 2026 05:18:12 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5921e2sm466938166b.46.2026.09.07.05.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:18:11 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alexander Martyniuk <alexevgmart@gmail.com>,
	VMware Graphics <linux-graphics-maintainer@vmware.com>,
	Roland Scheidegger <sroland@vmware.com>,
	David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Hellstrom <thellstrom@vmware.com>,
	Jakob Bornecrantz <jakob@vmware.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Zack Rusin <zack.rusin@broadcom.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 5.10/5.15] drm/vmwgfx: drop dma_buf reference on foreign-fd prime import
Date: Mon,  7 Sep 2026 15:17:49 +0300
Message-ID: <20260907121751.126950-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zack Rusin <zack.rusin@broadcom.com>

commit f739416dc555fa205a785e5135d73fa39b26f35d upstream.

ttm_prime_fd_to_handle() returns -ENOSYS when the imported fd's
dma_buf->ops do not match the ttm_object_device's ops, but does so
without releasing the reference acquired by dma_buf_get().  Any
unprivileged renderD client passing a non-vmwgfx prime fd through the
DRM_VMW_GB_SURFACE_REF{,_EXT} path leaks one dma_buf reference per
call and indefinitely pins the foreign exporter's GEM resources.

Funnel the error path through the existing dma_buf_put() so the
reference is always dropped.

Fixes: 65981f7681ab ("drm/ttm: Add a minimal prime implementation for ttm base objects")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Reviewed-by: Ian Forbes <ian.forbes@broadcom.com>
Link: https://patch.msgid.link/20260505222728.519626-6-zack.rusin@broadcom.com
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80888
 drivers/gpu/drm/vmwgfx/ttm_object.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index 16077785ad47..39ddb74ad07f 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -658,14 +658,17 @@ int ttm_prime_fd_to_handle(struct ttm_object_file *tfile,
 	if (IS_ERR(dma_buf))
 		return PTR_ERR(dma_buf);
 
-	if (dma_buf->ops != &tdev->ops)
-		return -ENOSYS;
+	if (dma_buf->ops != &tdev->ops) {
+		ret = -ENOSYS;
+		goto out;
+	}
 
 	prime = (struct ttm_prime_object *) dma_buf->priv;
 	base = &prime->base;
 	*handle = base->handle;
 	ret = ttm_ref_object_add(tfile, base, TTM_REF_USAGE, NULL, false);
 
+out:
 	dma_buf_put(dma_buf);
 
 	return ret;
-- 
2.43.0
