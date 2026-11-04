Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793824258;
	b=GOOUdjqX23a22WoHPFCvIcYN5MVt2MOh6yJ7eeo+340NDehqy9V08KepQVMY7JSIhExz
	 LxFLo4/d6g5JMtZ/IxqWBD717zCbJzuVGun6D8+Qm5sJ10T+HqpX0KfYeYHi5KhikX3H5
	 o6M6FqFE955slbbiMJU3e569ivCAy043HRc7PIfYOMy4CJrQHy6be66ef03F/dcsLKdZd
	 0DLFJ9MxZ4MZdVduEfYQbI6gWsxoFKjipDFiyuFWmxol3kUrvxL5IS1ZWVRyClZ9HGNdX
	 0BztOZpYrG8NKUvBhvLe7BKgmncCZdSQ1mDlOE6htI+hMbWqOltDwFD0TZhXFG/LcyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793824258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=huPVslj+kM9c+WtCioU3Ljzu+t0gbVdPL3W1oxXh1oM=;
	b=aG90DKOwVmqN69/EQNlon4M/OZgIwKFIufU4i7jNDLyjq+W8pVnNd7tuDgmviV9tnhut
	 FnLz7kcL6sEgRVMJ4gCaWTxoz97pVwHSMPCxXq/85MmlS2HLqo5QWMWZsyQmBC7DT8hvP
	 sGUEud6AwW6/+2DI5BgAqqrA7J9q4fUvbHxu+QlRY3nLHyj1thyv9gIX8MHg8tX58e8Az
	 GMje4EKu8OYyDTeI2k1TGrcwoQpS8HZwUNNrcJO4K45btUsn1wqtXu5/q4ZfhJahhJZMu
	 DIeS3B8342wmufdtQh1NtF58h2d5Gv1gjo8nZSw0rYwB/W7Alep71YRyA7kuu9O8q8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LXvS2106;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A3C606AE0F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A3C606AE0F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LXvS2106
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e00eee27dso643507f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1793824256; x=1794429056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=huPVslj+kM9c+WtCioU3Ljzu+t0gbVdPL3W1oxXh1oM=;
        b=LXvS2106f7G3x7PVtW2Uc/j2I076hzP3YOxsuP76p3ihKo81neXfgxoLSaWA0vp3h+
         gWSdTzowhKTy6g5f0gIpElccxgYx8aRj2B7hEl6SVWOIyxPO6u5Ad1bTjKJlSelVHU3x
         1uO7bI2o6Nsw4ANPDdQX3Utt9eLr9hwcEl5g0+AKoOGU69CtkbHqDU5D+jJBkGGTtpAx
         jJz6OKIqx8DHqGm+vI1zjxRND6y1mwn9cbbb1xshHUv9acUPbjeh3EfMqM+CoXQS45ie
         H1fqZgQhvXZRz6rU7Y0Ib9iPzdGBJJ+Q+Oz4BD1ENFyvEXZi26Ji2irgcfO8yioZbvnt
         FtVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793824256; x=1794429056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=huPVslj+kM9c+WtCioU3Ljzu+t0gbVdPL3W1oxXh1oM=;
        b=oPY0WLj1OShtdkA84jfCeRtspZ9KziY1m2SFPDFfDg4Q8CAj1wNzp4ASkciyvX8RV4
         m0R6XNG43Yad+FvEh5+Scm5V4c9OF3+f4hTn9ot3Z+HwmWhIEwX0TmhuRKTHIuQtwBJi
         MUZiOnd+2oGo7/VRHEdgqwNatShQdE1pjqhiLUbqHJuPsjllj3QIQH9rmwt+46Q/fwb6
         kHIKBp1cag9WSf0LIL9lrt/cdgyFtm4Y85CDmY3jg1HcOJ3Ul27Qk0+UHfH9qRCfcxda
         KCpIsNlh53lw6RhoObwMoJZtjVxOzoCx8GwHJg/e4dqobfr1IXTQrdIducHZ+KShS7mC
         o1RQ==
X-Forwarded-Encrypted: i=1; AKwUvBziSWyJcaE9wuInnsAsg6xNOZY1hM9s0P+tbiNQOYVcMAbAy8VQoNSAJUW6vj3sRnrjZ17r5IiuM0pQU9Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/n++iyqMlnMorvbtgc4+jkpllVsHxtLOZ87p8baH/7ZpsjCJ6d
	V4U5EGs8rb0hIXcDrVU8Ee4G/SBsI4uZUcL9y0HoxneIr3wIpbURD4awDKfTPYowiHs=
X-Gm-Gg: AYBFou3RICuliIeCZ1pxI4a00XYnXieuZne78rUJ2WhIaiYlXXlEddwI365xN2h64am
	vYdPP2R2rKMLVx1kzceQrkTVHjS4hGYhC0e1447zCa99oIuw58NUhvEV+PULtJUGwiDEH4ntbs0
	SAJEF/Ww5HXX0W1t18RRAC4ovYpgVqwweqzBHucAQERX0AnreCG+AWDvbHm+wdMI7qf2Nw3DiNJ
	Nen4rUnfNj+wnW5PcUwR2Pw43tSOBrAg5grPs6NSajLGMU7wVAYoIMfbYhsCiaTw/Zm1+RzAPnO
	CLKQO2Kh1DpbdLlzmZazUPkpNDy0kwQkA8t/H+z+11qSd1tWmMbm9KGCiRWLbsyiceHVlQRCMud
	UZ5AlYTr7S4gEeEx+Jhqxe9roCVqAaCXeGROKJAPlte9DiN0ZhpLEezj1R34UtEvgRe+CYe89Ju
	+rblpvpV7lmeoDbvdwV8jsb3VGfeN3fHZSzmkTONqdzetxVcDiVNSBSDjYOnDGDfg64727BUPKe
	wYdNXP0zScVOVp+qJBNGx20uP6A6SogjnPJgT6HpK6gcrKYPuwOOEOtcbYPZP67Pg8EytWDm5HA
	FTJ5Qvdxai5FptgbBMvzR0N4
X-Received: by 2002:a05:6000:40ca:b0:48c:5304:5e50 with SMTP id ffacd0b85a97d-48e6e2620d8mr39868997f8f.0.1793824256006;
        Wed, 04 Nov 2026 12:30:56 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda207d8sm5431164f8f.52.2026.11.04.12.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:30:54 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Drivers: hv: util: Fix transport teardown on util_probe() failure
Date: Wed,  4 Nov 2026 21:30:49 +0100
Message-ID: <20261104203049.1031148-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

Commit 07a756a49f4b ("Drivers: hv: util: Avoid accessing a ringbuffer
not initialized yet") moved the creation of the KVP and VSS transports
after vmbus_open(). util_probe() still calls srv->util_deinit() when
vmbus_open() or util_init_transport() fails, and hv_kvp_deinit() and
hv_vss_deinit() destroy hvt unconditionally.

On the first probe, or when hvutil_transport_init() has failed, hvt is
NULL and hvutil_transport_destroy() dereferences it.  After an unbind,
hvt still points to the transport freed by util_remove(), so a failed
re-probe frees it a second time.

Skip the destroy when there is no transport and clear hvt after it.

Found while reviewing a backport of commit 07a756a49f4b.
Not reproduced at runtime.

Fixes: 07a756a49f4b ("Drivers: hv: util: Avoid accessing a ringbuffer not initialized yet")
Cc: stable@vger.kernel.org
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
 drivers/hv/hv_kvp.c      | 5 ++++-
 drivers/hv/hv_snapshot.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/hv/hv_kvp.c b/drivers/hv/hv_kvp.c
index 336b278..813bec5 100644
--- a/drivers/hv/hv_kvp.c
+++ b/drivers/hv/hv_kvp.c
@@ -825,5 +825,8 @@ void hv_kvp_deinit(void)
 
 	hv_kvp_cancel_work();
 
-	hvutil_transport_destroy(hvt);
+	if (hvt) {
+		hvutil_transport_destroy(hvt);
+		hvt = NULL;
+	}
 }
diff --git a/drivers/hv/hv_snapshot.c b/drivers/hv/hv_snapshot.c
index 847dc69..a827cef 100644
--- a/drivers/hv/hv_snapshot.c
+++ b/drivers/hv/hv_snapshot.c
@@ -456,5 +456,8 @@ void hv_vss_deinit(void)
 
 	hv_vss_cancel_work();
 
-	hvutil_transport_destroy(hvt);
+	if (hvt) {
+		hvutil_transport_destroy(hvt);
+		hvt = NULL;
+	}
 }
-- 
2.43.7

