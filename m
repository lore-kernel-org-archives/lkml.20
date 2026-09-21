Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B9A434408
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790014568; cv=none; b=UEv8gmU94RnP4Xzy05EVUDde5KULuYpB3JZZSy1HckpOpixT8+rrtWju8lRHjpjG2huhCspdjWm1cb8WF1919H7AXEVT/d6a0+waMoRBPWMJ29wwcZcbPtA2LnpvTNCUg+9I2atMn6RgyrhPLZMtOoGm2A86j2XdGw8VcyQX65A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790014568; c=relaxed/simple;
	bh=MF95b1CFz2Hh2Ch96ToeVJ+PB5mNQ3DhGZRr/7qtRaE=;
	h=From:Subject:To:Cc:MIME-Version:Content-Type:Date:Message-ID; b=V5C5KPbyK1wMFzQlhbIU3evcx+ahLH5MDGmolJ4272wdnARSIJKO7iVLNe7vbc2RJvmvYIEym2RWV8FhQ+76CbFVyUh8VjXq8UbpCwThGYXGMDgvcW+yA6OLpPwDpd/SF68DBGR+3wNW9WFb0Q4fSW3nfJmL7pfQY//g2Sul4ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qe7qoFK7; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qe7qoFK7"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a856865so3020696b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790014566; x=1790619366; darn=vger.kernel.org;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :cc:to:subject:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sp7CkkCFTfRQKPl6kzZrbuCRgTVE+fbWFxi07HmMuWo=;
        b=qe7qoFK7Ayt9tt0RbnaQGa9W6vnh1iFhV2jgBFxYukOEZbhJYpnCDBiLeVxM4VmUxV
         wQECEnesyEZQsl65jWyI6YrAG7vvsilxWnaTOqS1T1eJiqe1jp1omX/FxZi+IuxSZ3yy
         WZmXBIRi/0ZqAWK17URNmJGTPlL69sWVN/1RMNAUFNeKoOp8gLkEYlbtU09jo0XsKEGN
         lNKeKUu/pGRKD5YE7qYn7A/hEvfTiZRkGy6//kLcU5wrdFGmvTqm5VcpA/Wr09fHzjj/
         WBdxbylZ7fI1lBTicos6plOYwYK8ax3uD0aVgHK3P4BiSe2HpbV0D0kduRZx825AfVvZ
         qBDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790014566; x=1790619366;
        h=message-id:date:content-transfer-encoding:content-type:mime-version
         :cc:to:subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sp7CkkCFTfRQKPl6kzZrbuCRgTVE+fbWFxi07HmMuWo=;
        b=krbRLJSZjSMTBIYvH17Rm8JMcnfwFyQZ1FOpHZbeexXbuOaIyVMgc9oWe9P3x0ARHH
         zQWVOirM7eZJZq8I1yBQg92D7D+TXlYNzu+2L6MNfX2kODeKOUvy/xx72jSmjMVoYI/4
         8LCXVPny1nA7+yBSzyLU/oa7KmBUO5DU3NKZdAuueCAV1nvI1+ZCHZlY813Kv3SKat5k
         mxXpBvYwUZHTpIckRUbmLhbBgdJEUHOoQJcpzXHBeNcW84lWfLoRWAUVlgwWzielZW82
         Vbp5D6r7VgDo5V+LkZ9GcYsRciR7v08OmV6i5B1EkO/2Q7dEgDjOiNoK+0rguu4sc2q3
         xd6A==
X-Forwarded-Encrypted: i=1; AKwUvBycO/s0E05fSnylEGW7r5eKm1eWfl1WNeo1/k1zZm0lqanmxitj5yl/wMcAvQ9RDFqzIKggv7R9pLhetoA=@vger.kernel.org
X-Gm-Message-State: AFuF++kjDF3o6yJGsBRnFW8WRwKrRZ4r41etFM1VBo7LvuY3u4go5hmX
	rPRj/X4Je01gzwWjk5Mh7F8h8CDeJ5gQOdxX+wC9LGWyV9BLnRYVROQU
X-Gm-Gg: AYBFou3LZtRhpC6oXzzXxMXurkJu7/VcPH3Z4t3nl9eG82kYzkYdWkxTSF9FZ5Q7Xs9
	pXRIYK9uHm/QckzAXJN4qIMjqvQ00IHELcbvYzRDD538h44z+jxjCJ+Qg1uJai17IOtQqFKnh6O
	FTorKTvCabDvY7JdOTkTfsmgeB+syRiWBFSM2z7LVZzlCPgbUP6z6Z7lSX9rxvyH/xugsggd3yz
	muLqE4LRdCvUzz47AmeNty4Cx+7MmTmJk2L9oKp2A0CMCcUuGNgwYcwLaz9ydk+8vJoIU04f/fz
	+/Vqa5ygCSmTYfDN9e/Uuw3zEKrtseXazFh/S3+gnkKECbWwWA7H3Q3egcI+HA4Y0RNAfw27TSO
	rGbzZkuvneRmro3DhQ7r7Wiq/e6ftz0eMeGkLl3Lsy8Btm/1bXmxmeHhS+us1PLx5pJEWm7/S49
	fekBOAUq0hxxdDKxLttETVrhHf5sjZTirXjrOwr1oiNkE7w17gYdPMlpa/YL8gwUN78ssE0c/PK
	P5Lb5efqZKy25Egywr1jdo=
X-Received: by 2002:a05:6a20:1605:b0:3dd:a197:cf26 with SMTP id adf61e73a8af0-3dda197d7dcmr12001110637.74.1790014565989;
        Mon, 21 Sep 2026 11:16:05 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc72ae8eae3sm3902549a12.14.2026.09.21.11.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:16:05 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
Subject: [PATCH] drm/tegra: initialize channel context before publishing it
To: Thierry Reding <thierry.reding@kernel.org>,
    Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
    dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
    linux-kernel@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Date: Tue, 22 Sep 2026 03:15:59 +0900
Message-ID: <179001455907.44752.8291506500067688174.idr-bug-37@gmail.com>


tegra_drm_ioctl_channel_open() stores a new context in fpriv->contexts
before setting context->client and initializing context->mappings.
Another thread sharing the DRM file can guess the context ID and issue
CHANNEL_MAP before CHANNEL_OPEN returns. For example, the first allocated
ID in an empty context array is 1. The mapping path can then dereference
an uninitialized client pointer or use the mappings array before it has
been initialized. CHANNEL_CLOSE can also free the context before the open
path finishes writing those fields.

Initialize the fields before xa_alloc() makes the context visible to the
other channel ioctls.

Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Found during source review at mainline
5dd1818b15d98d4a20806cd00b1b40320b06004f. The affected source is unchanged
at 93f51579e7df248780214094418f205253383cc5.

The modified uapi.o compiled in an x86 allmodconfig build. I have not
tested this on Tegra hardware and do not have a runtime sanitizer trace.
This concerns the UAPI guarded by CONFIG_DRM_TEGRA_STAGING.

 drivers/gpu/drm/tegra/uapi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index c0ac6b45f..1dec2f0ab 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -135,14 +135,14 @@ int tegra_drm_ioctl_channel_open(struct drm_device *drm, void *data, struct drm_
 		}
 	}
 
+	context->client = client;
+	xa_init_flags(&context->mappings, XA_FLAGS_ALLOC1);
+
 	err = xa_alloc(&fpriv->contexts, &args->context, context, XA_LIMIT(1, U32_MAX),
 		       GFP_KERNEL);
 	if (err < 0)
 		goto put_memctx;
 
-	context->client = client;
-	xa_init_flags(&context->mappings, XA_FLAGS_ALLOC1);
-
 	args->version = client->version;
 	args->capabilities = 0;
 
