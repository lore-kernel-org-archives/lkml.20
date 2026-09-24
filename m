Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FEF432BD6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790235567; cv=none; b=Y2WtoDdDlGKYsdSB7i8Q0X/H2dWib8awezvpb3G8+zLVfhFsTfBnP4jhUWyfhbJcea9jiaIZwUWamaEHo8PYg6J8t1JR55EVfBLOE8wOVaJezrdyzVj4JTJRJo626Hc+/SsmIdOdUuS69Ug43c26xUIv6QhBoam+zgV7zZuUf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790235567; c=relaxed/simple;
	bh=Pw+Av91JRHzFJpjZkmQikGFp79b9jMCKqLUOdDMofug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aPQKxbDGwjKa8TZ/dQnpOg59iM+D66PyVMc2RPqbcQo2i9NoCCwCOsqKdvkWh2gGNuhzG1eFjxdlthhJi71sjtbqaEsZaKm260qsZn52rgouK+LJ75rIdQNI5EvYXGjf5GvWbMK/GxlP+vsNTQ8qhWKUaAznluABlojuW90pQ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K1bDWVw0; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K1bDWVw0"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-86ec25cf7ecso344499b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790235562; x=1790840362; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S2buUXXqIEIUcfZHLVUXYEcgHUS9sSJjeV8Phy1za6c=;
        b=K1bDWVw0Z1uEj8/1/iGXfhUuOrREsE8/pewMUUrHzOaGs9U5NtxPXg0EdwI0v+fpH+
         1QvlcaeO8KKfLDVFRqOfcuwtJ7M1F3OgmFCsWvAQNrz4rXdyArcWXa4jt7LaH9ZGQPBD
         9an9BEqqokA5QTid7WGMaMUN95RV+XSKnciUZi0F7mhpV3yywoY7Uvuw1wWLWksMY792
         nF637uDOtfYArt7Cv96xYmTWmi/DiH89vHex8VThSV+2lHCVju2Lz1VUTXI6OuZm7+Fd
         WVCCnc7aE9NuwkHf+cPpkfdRxzPhNSYjXpUaQ4k330wh91kEgWHPJT76pDfguvrVAEw4
         EOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790235562; x=1790840362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S2buUXXqIEIUcfZHLVUXYEcgHUS9sSJjeV8Phy1za6c=;
        b=vVnumYNLT9yEfsLJrsK20k55akHqPbCPfPoMSauXa4KISD7/PThwS7uR+PhlayKIDE
         DvP3dIwC6ytwoGdCFqmWPdiipf59pwSsQh5rM+GVrGo+ne+OXpKf9GHcsJk1TEikU9OL
         28N5PV8x17NGeBKcZE4ejK4s7lLRhyMmPOXcNmRJedGzZNiFpTMKv8DH9/24HFNm3WO8
         /TCWFD+uOonwS96jRvR63cjN0peEZ0hwQ8QapgtrjARa2MAFUmk1muQ7OQM+cgzoVLp1
         SkmKc9tqwGapqrwxjzt2jtVVMc64oUCV55pvAnolaP2k/Ep26MqkHA3e/myq+Xntfo5s
         +lpA==
X-Forwarded-Encrypted: i=1; AKwUvBwNKN6gHE985XiHdh1cNTkc+YbcLVlq8fhvKfo2aaFrfBdpi3nIgXVKK84kNzxZB0rMCGV2RC2gR7To4dU=@vger.kernel.org
X-Gm-Message-State: AFuF++kb+uS94AcTfRbIvQ7AijMh6OvjDlcourydAKFRQYKyOfaMPjMa
	EdbV8k70yGZWribZSIAaKWrAr682hbgL8VK4o5lZ/nhw9mKuFgexXv4u
X-Gm-Gg: AYBFou0/VQqnXDwVT7iGsFdQ8wgopxok4MFOEq+hEJvqOaRetdyPNo0F7I+kZRA3xyh
	wZFWbZOUC/xUBlCQ40oEoTvBj4oTY9mXjwDqsni771hNzcWHRSNug6z1U6nLRvc8KK83nrMXJOd
	weASnhM5MUrDC1oSoMczflDC+vpSW59XaEnJ9BQPW8gBzf9npSPvZVTWVvJsdMrwSTyvnvgPES8
	46/g3NwFWLzDuZHdz1WNsiikknRnJnDddPHuzNTUGVdPHFfEh8RN4pg8Z04zWAhMDoD859Hw3tm
	HJgXDvJp2pBfwgtR46BtzaqMt0U0WBpWQmqo5IFSmfEzaAZBe+ptOeY+CLalcrFKxYlrE2unGYS
	iagb0Ht+JYD1AgvsUA/+dnl1fRnZVAfYcZ4PUNblmGtS2V0qJTf0wY7syNeweY8mKQI7AN/8PEb
	X8sxWgeBJ0G8j3zVPFZXRIVVGltudhpYaE+Dclinjn95d7d5TWVkN5zQe3TCr1ik8QYvkCXx86l
	wJP+zb2fu9krFkR/5qSsmXPP7/yevLZPZz3mZkE14w2ydEsuiaeT0MF+A4iGDeohPoSllX4TRp8
	llrprRL48A==
X-Received: by 2002:a05:6a00:a20a:b0:878:3705:5722 with SMTP id d2e1a72fcca58-87ea1195231mr974546b3a.46.1790235561625;
        Thu, 24 Sep 2026 00:39:21 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87d1dad44c6sm2393739b3a.42.2026.09.24.00.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 00:39:21 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: al@alarsen.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	matthias.goergens@gmail.com,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v3 0/6] fs/qnx6: fix buffer head leaks, double free, and inode validation
Date: Thu, 24 Sep 2026 07:39:13 +0000
Message-ID: <20260924073920.2782917-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260921042511.1473629-1-benquike@gmail.com>
References: <20260921042511.1473629-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses buffer head leaks, a double brelse(), and bounds-check
failures in the qnx6 filesystem driver:

1. Validate di_filelevels <= QNX6_PTR_MAX_LEVELS in qnx6_iget() before
   accessing inode level pointers to prevent array bounds overflow.
2. Release bh via brelse() on error path in qnx6_block_map().
3. Avoid double brelse(sb_buf) on error path in qnx6_fill_super().
4. Release sb_buf on mmi_fs error path in qnx6_fill_super() when probing
   MMI superblocks.
5. Abort mount on superblock magic mismatch when silent is set.
6. Validate sb_blocksize before dividing in qnx6_mmi_fill_super() to
   prevent divide-by-zero.

Changes in v3:
- Add Tested-by and Reviewed-by tags from Matthias Goergens across all
  patches in the series.

Changes in v2:
- Split into a 6-patch series as requested by maintainer review.

Hui Peng (6):
  qnx6: validate di_filelevels in qnx6_iget() before accessing level pointers
  qnx6: release bh on error path in qnx6_block_map()
  qnx6: avoid double brelse() on error path in qnx6_fill_super()
  qnx6: release sb_buf on mmi_fs error path in qnx6_fill_super()
  qnx6: abort mount on superblock magic mismatch when silent is set
  qnx6: validate sb_blocksize before dividing in qnx6_mmi_fill_super()

 fs/qnx6/inode.c | 26 +++++++++++++++++++++-----
 fs/qnx6/namei.c |  5 ++++-
 2 files changed, 25 insertions(+), 6 deletions(-)

