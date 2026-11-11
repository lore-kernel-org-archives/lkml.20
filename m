Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418199;
	b=zS+B26BOQZU4hbZUEt8Plca4doKMC/vxUKzvWjeOYWM1gOxu5BYC0cx5Q/8970Cqs9jb
	 DI+fga1vZA2yzh9P/18mHBwuAaJIeYlDm+0hB/RuahtC/CJATZXB9wEM7i/yeuLEmba7Z
	 dL24ROrVMGmuL/uxQeckXH52w4Q5NH3CIWvJtVPXrY/ElHsGxLGZDCTzdTUmdMs2FBbV8
	 u+aFU027L2iWe/FCzqpPPT16hJtNbnWtoRujJPdHZ0pTs35C5IYnWt7bvlWQLiZtlRnwB
	 tTjb0kXZxgRTxWbniTvXmyQiOjWAao/0ppRENG+/+FNb7P4H7HJ2sFiMM5KR7pG3hNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hWVnipVnpqlmDrtqQEQzI1nIW+peyVDfq10bD9YNiNU=;
	b=W7SsY1sq0femM9vdOm8Vse0MNSBK0kReiuK/tBfaQLgwSnIIw4uNDPEN6CbA7Ypuhml/
	 D0REawOtSp9nByCAs9BA7c+6cMkMMNchM1YRSCicqjPND48GiNC5FchjVpwwxCJgBCsMR
	 HIfV2AnTTXCqG5J04K3vy/Ox8YIa7znfoV+zL3sOFFR++HrThAjukLuERKz6mASZBaqHu
	 sGX2x2T1FDowYXVlmTy5SzQUt3vLvakwOKNLD612ofjYURY7vyB8YyFyOjI2ODXIdnTHf
	 NUjmJTlOMauZM9AYGWYukG6ssHwVFt0d2MWDbniD6HdG4aDaYE38RM3zdS2NwG5H3NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJF4jtNG;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6006C606A331
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 17:29:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6006C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJF4jtNG
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so36752135e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418198; x=1795022998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWVnipVnpqlmDrtqQEQzI1nIW+peyVDfq10bD9YNiNU=;
        b=vJF4jtNG9ztldXnWy3XgVGfj+s8YQWsZfHIbDvGy3dQTi4BzCXol6j5PdIf2vBtn6H
         KFPM/yBRMuMATvpT4o8vfjAA3dRLviT6V3rUeKVqQLr1QzGdQxaMsr7yOdeKqxAJ9JWt
         P0JZOqZ215Fz6ewfN4NoxLkSsXrXO4h67rIPbmljO3oqJ0RP/G7KpOa0SVIF4wvbrFMz
         tUtwSW/vX3vrEGUWk3YXtqgcsHe+n/aeYRg71fYJAsmY1fLX/Zo9YyV3+Phidn6Q3HMD
         SGPMSeUfi+KrkrweDZ9Lp/Taepi4lWEM+gxq5gJuGWJ5e9LY8qpDAZ6kBWX259kau+/W
         HZkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418198; x=1795022998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWVnipVnpqlmDrtqQEQzI1nIW+peyVDfq10bD9YNiNU=;
        b=IsnaC9rds6IpcERyGeDRX8K2prKCrIKZlKXl5PBV3P9Usr8p92pvtOAH4+m4+zUqyv
         Cmo76Zs0NQAK8R0fpxJXXKnuzhBcQ/E9tM9x4fy78wEejhd46cDbBcCxGRZer+deAb7f
         SSJ9Xvrn04fab4K3HW6esez68bmOjWjLjOSO65EMKdXxO2MfRBhSrr+zr6cNSejwI9rr
         vnQhsK4XPHmyL81hb2mkchlN+1TTh/DnYIHlLI3WStdeIVBySgboNuUgN6bAfgK1JXAm
         roqOwlFiLBEXGSXSbGNmPslsya/FW2MHvklljyehxU4CHJO64gkT0onLpezTTId5DrNW
         XfeA==
X-Forwarded-Encrypted: i=1; AL+hErEVbVdDmrkWccEqj51aty/omwkeb6IruvWPKXfF2/nywL56kJv2VejZOItZAkc0zw9wLuChuwZ7REecXs4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Leqr6co44mB4X7SHxfP6gFV88acq1ZXKpGoHaHck1gFTCFi5i
	sblmoRbjHX0qHb54Jnj1DNwoGlGXGOWPdmzANqRcOjyNH3coGM3mDVFF
X-Gm-Gg: AYBFou0fpIyFNswxpr4icF3ro3gKEGPSssAxryBmj1vOxIaq+zLZrYAYxNRyPmvPmqL
	iB8MW3oZdGlPIUaa7v4BrjuKZprBjdy/Y6XqGwDymf5pz8e0oXKm/mi2LFKI5P0yxqnZKMuBnOZ
	CCuryIySFPGBzUWl83Q2IjgagsIQc/cgNc1G8eLEIAqVmN4KbOFTQqk7M+i6nB3Pnpa8S03Fec1
	VtkxzlBoYNYmuY2mK1Osl7+fCe1/w5UsIzIVLRB/XJMlgN1JIXDnCyGF0khs8VVm1w8nyGPpbgs
	AqH4aRxPMNFvt0au4OTOagOuEP7NedSFU9ye9clGain9kalJxNC+EFoHVwUAV1LWmVV7fPoBsa9
	9RTu/KW2Fd24dKQgn0YZFaOI2xn5c36tKgCJ7nEEawEhedLqbVJZSABcZq8hN9pUzXopTnbOWn3
	zcdn5Gij7eyjQ+mQaQd4J1wtXTK8+BCRoR0IVX/qkjA2HytcA17rg/Z70EzBtFPRyKOwFw4NEef
	Aqq94XJXKaKmUyVjqSy9dj6rDb47dnTJUCIK1XSc9GF8W6Lell/WPXwwJG30Qx6H+KHTTe2cZhJ
	rukTVCT1Sik9OrD50zMvf5VhpDm/JuY+nlnKssNVu1FuC7xLZRQjD5ksOrj8/3wBvpd6xrmcUml
	+
X-Received: by 2002:a05:600c:4e45:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4ba0936efc4mr61545245e9.14.1794418197595;
        Wed, 11 Nov 2026 09:29:57 -0800 (PST)
Received: from stjepan-Aspire-F5-573G.tailc0f20e.ts.net ([2a00:1bb8:118:d39e:d655:6a9b:5ab8:7f68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e26700fsm3134525e9.10.2026.11.11.09.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:29:57 -0800 (PST)
From: Stjepan Poljak <stjepan.poljak@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andy Lutomirski <luto@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	virtualization@lists.linux.dev,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] virtio_ring: reject a split ring size that is not a power of two again
Date: Wed, 11 Nov 2026 18:29:37 +0100
Message-ID: <20261111172947.3579982-2-stjepan.poljak@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
References: <20261111172947.3579982-1-stjepan.poljak@gmail.com>
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

The split ring indexes its avail and used rings with num - 1 as a mask,
so its size must be a power of two. Commit 2a2d1382fe9d ("virtio: Add
improved queue allocation API") moved that check from
vring_new_virtqueue() into the new allocation path, which
vring_new_virtqueue() does not use.

remoteproc calls vring_new_virtqueue() with a ring size from the
firmware, checked only to be non-zero. With 100 entries, for example,
the driver would put buffers 4 and 8 in avail slot 0. The device would
look for them at slots 4 and 8, possibly reading the wrong data.

Put the check back for the split ring; the packed ring has no such
restriction.

Fixes: 2a2d1382fe9d ("virtio: Add improved queue allocation API")
Signed-off-by: Stjepan Poljak <stjepan.poljak@gmail.com>
---
remoteproc still reports this as -ENOMEM, although the "Bad virtqueue
length" warning names the cause. Returning an error pointer from
vring_new_virtqueue() is left for later; the same change for
vring_create_virtqueue() is here:
https://lore.kernel.org/r/20261106055635.3019889-1-stjepan.poljak@gmail.com
---
 drivers/virtio/virtio_ring.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index f683a2d6a200..8da9bd0e70f4 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -3513,6 +3513,12 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
 						    name, map);
 	}
 
+	/* The split ring indexes its rings with num - 1 as a mask. */
+	if (!is_power_of_2(num)) {
+		dev_warn(&vdev->dev, "Bad virtqueue length %u\n", num);
+		return NULL;
+	}
+
 	vring_init(&vring_split.vring, num, pages, vring_align);
 	return __vring_new_virtqueue_split(index, &vring_split, vdev, weak_barriers,
 				     context, notify, callback, name,

base-commit: 1a577f9402c1780cc1e663f48d5dd54c02051b09
-- 
2.53.0

