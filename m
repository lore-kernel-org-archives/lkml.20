Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDB52BE02C
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 13:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789823892; cv=none; b=Yp5CEvAfaeDwieIEiG2fWkwYlEKSvzy+UiNy4YbdRa0HyXv5AcytalSheQAuFloP8D92gjjC3w7r0z3GBf93n51RCAEKNzv5HApPOij/wiXMkg1aKvk4j6T+hoG39X4bScwCOYmOLHMoILi27kZzlgAdjGQhu+LN5XC6Mua9njo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789823892; c=relaxed/simple;
	bh=CsmY2C0LUhQFV2xkI5Vula3YY7rYEiZTWt4OODXOZMg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZvbyCtfF+YagurAk0cqPEmEPD3D2K+h6q2MN+sTe/i5s9cwf3hlTvJDgVx+kTOXMMMbL40ctT0qJ32i7dmKZN0JU8FRY+TcLB0WV35Gq8XAU/zvv8gcF8d9G/LiqhgJM9bY6nxMp0H1bFo3+t5ZJi80/dD38VPmiZAj3W11koTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I5T4SkdM; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I5T4SkdM"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea4c79fso728446a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 06:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789823889; x=1790428689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsTGylBrKeTBmgAOYV6+2j7T7Vnx2su+clGWmC3zkts=;
        b=I5T4SkdMoeg+bxeMvG5McZrykI2Poa08KbsvifYwWq+TYVoL9fB/y/qsEEORnF5QmA
         MjgaaxhJMT9bRZb3eIXVpRLSFHV1DPZw7LRKEdsfCtlLdvy4fFlMCzESs8v9Lm9Qjyhm
         SPi1thXSJ0vYYg1d/L0fhUzzo10gtT4OAKgylP6uIxWI50yk2RnIAQI6Sb0onhsOOtyY
         X3d2pFU4TZGnOzm2PKycIUKKxYJSb9H8biM+PSKdyGioE23LV0o4sR7cqvjRIaW1Z17n
         fItzu3tjyVDmezvW4HcnMoVaquIgjRc/NBLre01b1arThe+BwbsTKylZnnUyPYrw0i8p
         HNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789823889; x=1790428689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsTGylBrKeTBmgAOYV6+2j7T7Vnx2su+clGWmC3zkts=;
        b=AE2jd+tJgkuBgsMVpEtsf8zMSkLP/Jue0ZMBNSuDDfTMWs0J3XniGoEPWDiU7T3s/b
         IaHiYs460JzbO80wdMjjcJBR+OVFpbDWiKQoGp4RcKgN5Lffbf6oopz6qrlPDArW/O4B
         FGDVj81v8dnys4aN/mY2uEuiRqLrwgq7Y2drNRTWiUCNaR2ZKozpQOAm6cB67NwtnGd6
         ugmWkyB+Z37ovrr2b87XkC/bsl3Br18ZlJOmjlkQ8qeHf7UGdy2kCxXglxxwca4yW/fe
         BVKKamhee34WkiQQW5qdsTy05gouw5k+TSqkTOWYHwVYJkfJ0TvlhnrkaG6ZmR3GN2Fz
         ipkw==
X-Forwarded-Encrypted: i=1; AKwUvBw5yPtUr/NXk6OHmgNwIoyniuOs4IiLqaVU13R/KDBqabOQN7fc0NNB4vN7HEma5ydCBTkSvZ7r2bCyZTs=@vger.kernel.org
X-Gm-Message-State: AFuF++k/Fht+PnZXQksj6nJJiGoS5R4qiAgPkid8yvqcFXkfqdFtn/7H
	8JAh9td+9Huf9ZRmLx00sCTCpgstRJRgjM9E6q41AJbfGd/7W4Sp44SV
X-Gm-Gg: AYBFou0dhVoajlLfQhsI8xmnxUYfjFvlUyfYUbEE6MhaBocfy8YgRurBB0StYV6HRe2
	IG/zfhI/XR7/I8jvU1d0yN0fuFRsl8+s4Rm+2R/0kQOCqicFZOMp4YmaB7WJ+IfiwZitoyAqlom
	pqUQ2mdRp+8K7SC4tSf1VaHomj+l22Qzu7qcv9qEfAS/Ktx1ukksIZjF5hdCDEKx5Yennz26l63
	2kcFv5Awq/cCdcEzA1QCf5QN4Tpy5PyySQxICPHScdvNVC7In5+r1yMq2uaoR3jfvSHD2FzHa/D
	R1tlKyJxYX4SF6G/bUCbOoOqPqRPWt43UvhWjPMnlF059wOXLeZi2r7ic182U8A3dUf++6u4TtW
	fni9wpdLaQWXDWls4PBpzbXunii7z1oBukQVyYSTZWnQ9z7B8Qv/dc/ewWEKP63TB5KQBzfkA/y
	kCtQBJR942pGEjhjuYrynkRa5brYmtt0pr8U9Ke53IQRFVH4/l6AFp+heOV15BqftFii1evg==
X-Received: by 2002:a17:90b:5706:b0:39e:6c6a:209e with SMTP id 98e67ed59e1d1-39e6c6a234emr3242069a91.63.1789823888812;
        Sat, 19 Sep 2026 06:18:08 -0700 (PDT)
Received: from gmail.com ([188.253.12.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a023cf10bbsm1276314a91.3.2026.09.19.06.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 06:18:08 -0700 (PDT)
From: Jia Jia <physicalmtea@gmail.com>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Nicholas Bellinger <nab@linux-iscsi.org>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] vhost: keep vring addresses stable while the backend is attached
Date: Sat, 19 Sep 2026 21:17:44 +0800
Message-Id: <20260919131744.131030-1-physicalmtea@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vhost-scsi keeps the response and bounce-buffer iovecs until the backend
completes the command.  If userspace changes the vring addresses while the
command is in flight, the completion data is copied through the old iovecs
while vhost_add_used() updates the new used ring.  The guest then no longer
sees the completion.

Reject changes to the vring addresses while a backend is attached to the
queue.  Keep accepting the current addresses so userspace can update
VHOST_VRING_F_LOG or log_guest_addr without stopping the backend.  Queues
that have not been attached retain the existing setup behavior; userspace
must detach the backend before changing their addresses.

Fixes: 057cbf49a1f0 ("tcm_vhost: Initial merge for vhost level target fabric driver")
Signed-off-by: Jia Jia <physicalmtea@gmail.com>
---
 drivers/vhost/vhost.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
index 44cac11b68d2..074590838de5 100644
--- a/drivers/vhost/vhost.c
+++ b/drivers/vhost/vhost.c
@@ -2150,6 +2150,17 @@ static long vhost_vring_set_addr(struct vhost_dev *d,
 				a.flags & (0x1 << VHOST_VRING_F_LOG),
 				a.log_guest_addr))
 			return -EINVAL;
+
+		/*
+		 * Commands may retain iovecs derived from the current ring
+		 * addresses.  Keep the addresses unchanged while the backend
+		 * is attached.
+		 */
+		if ((vq->desc || vq->avail || vq->used) &&
+		    (vq->desc != (void __user *)(unsigned long)a.desc_user_addr ||
+		     vq->avail != (void __user *)(unsigned long)a.avail_user_addr ||
+		     vq->used != (void __user *)(unsigned long)a.used_user_addr))
+			return -EBUSY;
 	}
 
 	vq->log_used = !!(a.flags & (0x1 << VHOST_VRING_F_LOG));
