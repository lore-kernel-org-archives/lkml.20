Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3C38F250
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788761973; cv=none; b=IMIm0kj756jjqYT/vevo809Pez7AYhtCrCJU6IMUgFoVlSFh560QtNPyyYZp5FCGGDVcy9GVbEGOV6AcojSlhJ6xl2XYcXQEnBdRWSJw/2qFDd42QhmbXdpmg3D8nCN1rngF9aMKGBQE0U9Dim6V6DekcThUMg97IuHKZcyDMzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788761973; c=relaxed/simple;
	bh=ZaSX0pdXEKGGNopYNr78EaARlqdq3R1GfYHHOzopxcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efA/kSYfuKebQOSP0aA/O86qd44iqpXd7j+ze7iknP1c2OvqZhHodMpOVwIyuX+HfKCmtdp1s67VMY3wq/CT9U6c7ON9BTsupbixZJXmltvO4zfrRll+vkTDGhPwaQSDJOiCst58mP5eUUovWwA9yuUK8r6hDhrZSIZzVdmfaBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emWara1k; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emWara1k"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39647184c73so3801905a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788761972; x=1789366772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jkwFgba+otptQ7FHpTWiDmTPg7a9k+B/VhEM4eIT7PI=;
        b=emWara1kiHDLa5s/rWfJmP111uBjwIPHJPikp9jCivSxHKyO7R7AhdbYEUAeo3ulUL
         AADl5rq/ACCGxdR5ZYdiuoVcgNEYF2TIqBjpfXV0dyDXsMW6uZkkvZLGOXfT2Jb5JjAm
         HIeDnRNk/Rx60EYf6PuWRmDXAumSrMxEUGaKSg7/FM57kmQ8ecAjy69Kn8UBeqOod1Y8
         WXco5euD7REbIjp9puxCgzwoRGSKOThmA/oO6Jxru8hxRH5HHWzlqvb2LfaAeZ45R+r3
         KTlvXrHND1UYuSbGilnw2TjCN1ixAvgaw+xNx5WQ3J1zigvZc4xjMWJouzFLPbPhjMWX
         85+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761972; x=1789366772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jkwFgba+otptQ7FHpTWiDmTPg7a9k+B/VhEM4eIT7PI=;
        b=hd87aXahcEBP0HDuic1GFi+0N+RZk7URAIPMI8YSxILBiouRhrRlEKC6QvBCKSLavN
         es4UDOeOySwiA6/kLrdJknBz4a1E9/46xMMB+Gi3iTlzgJzce+1j+gI4maz2l57+wcPi
         UBKBQ+RxPDXgQqzaSBk87aH0XN1V3WIjD/1EGfWRRceXeV32Kdq5ZVzz2mCWdPOWImWJ
         uPcEazcAvHaXAReRuehwaIMdOtBAVKg0obs/2fcVAPqnPSWG0SAC4PffINEGHX8FbjsL
         hSWbz8H260OsAt+X90T5R2Ksrbugg4jUuqjqQPe8ZpWA2vW7P6V+W1cdJMHtlK1yzGFX
         C+Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwWwKm7S8bSQacPM+EDorDV3iLMyhaOc6+TwN3MFRA3OAVjBlEMDUmeimL7/g6wh3FTysQ3RQsQKsUcaBk=@vger.kernel.org
X-Gm-Message-State: AFuF++nbDJ5DfNRK1oz2LYmJPckBO4EAfN76Xaup4a2AYq/uNJmtBXYJ
	QPpRWSiGaahFEPJiIXONx5ttBxuoNu5p8qofsRbe4tC+3mp3eFdmZR2u0+d+zGYvwJU=
X-Gm-Gg: AYBFou2tdPmJtWt6ImfEeClMHNsusqDaxufhdfM0cMSW74gCHjBJN4uwUh24P2h6KDR
	nwuLfZGnFkO/rx9PPHSInfdKA11jmDkH6aYQWg4uhSrFFF7xVR5n+HKrGNaxtZ8B2u8R1JdNLgu
	EZejOnL7SM44EXkGKkZ7Vr+tAPhjJpQDL1Pdd1PPqa1b60nSE5gmmdcCaU2HmC3VpZC3tS7U27e
	XiJBObAYDNuqE+pbMvpgeiXkbhJ/Ufi9UUVh9RU9Xg9UnwEzkpRBFPYQdIFgDZFgPSg1tb15ObF
	0yHc8yAlNgIi/0eEzXTUaiWXoXwMMD7Mna5xYldAOoNONUDJBc4qhdnz7CH4jcqGC9rK0UJ4lsr
	0Exmec/A0fOPlJOfjiiP3PfVb0uA3p/Z32uqHJYF25QduqgmoS4taJ+VWV0OBeODUpUdfIawfmU
	xVqLnSeIdBBRZfcYE+RwB8kzO26vndVE9Fw0xCMl8yK97yG2CmKSu7lmoNnrbAma0Y6p2gAE6gW
	C9vS27/w77tRw==
X-Received: by 2002:a17:90a:c88f:b0:380:8bb9:aba9 with SMTP id 98e67ed59e1d1-39b07f3216bmr29292347a91.3.1788761971819;
        Sun, 06 Sep 2026 23:19:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm27439829eec.30.2026.09.06.23.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:19:31 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rpmsg: fix typo "upto" in comment
Date: Mon,  7 Sep 2026 11:49:27 +0530
Message-ID: <20260907061927.4585-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "upto" to "up to", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/rpmsg/virtio_rpmsg_bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
index 1b8bb05924af..28bef36931e4 100644
--- a/drivers/rpmsg/virtio_rpmsg_bus.c
+++ b/drivers/rpmsg/virtio_rpmsg_bus.c
@@ -110,7 +110,7 @@ struct virtio_rpmsg_channel {
 /*
  * We're allocating buffers of 512 bytes each for communications. The
  * number of buffers will be computed from the number of buffers supported
- * by the vring, upto a maximum of 512 buffers (256 in each direction).
+ * by the vring, up to a maximum of 512 buffers (256 in each direction).
  *
  * Each buffer will have 16 bytes for the msg header and 496 bytes for
  * the payload.
-- 
2.48.1

