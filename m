Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D0B3DD873
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 23:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792365361; cv=none; b=Hh0uqmSzUkvl3PXjcZoyBzoFGyBptcbjRHtl+rKguJzzKf91fBqNzWv62Q1XOHmj4fAu5i851emjpnCGvA4ckWIAfnMdK1bwAT061/gY/iB3sbPunr86+3RQ1StyQdZHDQOSVCv1T7zyFZnBasfTBz6WhVlCX/ToZ2oHuaae5I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792365361; c=relaxed/simple;
	bh=S4bE2BgAbV/cAYIRrQlCKFuqyCJ3AdpaNeDWcqSlJtk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KeddRgvhXKi24yoGrEIct/0CVUyxCeaoGUvHd4/ZdbQHqzUh2LPe61pLbPFuWNUec8iOCBXysb8KjhmX9/m7v6E68g5IOCTockfWgAnpO8tVSh0pNCriGoUQxkBZDoQq+IS9ybV6WNrziphwG4RTY1LnX0WrpvsWCCSPfPI535U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rwUkfRdS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rwUkfRdS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c45111bebso865364f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792365358; x=1792970158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QtdMrgS5OyN3BgVJlDrKUHEutVSv3PFnuFIUQXZ3F4g=;
        b=rwUkfRdSbQAJXClnHCcLyMDTAUxR8SKxwn9iXmA8KjG/8IZTmUd4DaLv2evzxyH929
         RfweJqmnaQfJ1F6v+MWKJFi632Q4oL8QvyYszwxhJtcVFukfR40dlV+GCNOZpAoZfVbZ
         H015h9ExR9xf9qvtxVNgGZ4lpKEuGUubZ1IdsQygPLRDqroFFYEYF9TrVrPdaeEY/Js7
         S3ga1rEFm/MspDYd8CH4BtpHy75ZlONJh29RxedWdQ+rxmT2ax4Tb4j/3PCMFZWUgl5I
         78achKMS/VDrYo/tMW9+z+wqg3xntx6loiJTY/KOe4El7Jp0Yz3+/RLqvJpbujD8Yiq2
         eC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792365358; x=1792970158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QtdMrgS5OyN3BgVJlDrKUHEutVSv3PFnuFIUQXZ3F4g=;
        b=UIHEW6r49ajBkflnY+M2IJKnYBnHqfTbEBwNsttGVecFnki5p9eFcnCMUo11T7Q+XY
         Y3WdPSVFveUvf99s/V+nMx/VnZjPnjik9ibfokac85UWi+8FNSse8nTdQTDQ5D/854NV
         UgUHsgV1G1DALJ4oWKMCGcbcotMd5AKKAPBfKI1HL/C2INObIe/Z8jtSZNGOEroXP6/+
         y/BIlUvnQHdyeIIPln7alDyXc3AYo1XOHcukUeAJre6pFze/bf2HTHGMCgS8S3XM39Pc
         EnZtT8hxcclGAx6DwxDyY3F6j1sh14LYwbcONrH8MSKgEZD0c8vRrc5B2fMxK+Fe1soU
         NY/w==
X-Forwarded-Encrypted: i=1; AKwUvBx4PFgWOZDmOohXJ4zhueulQ3O+0fFkBwV1Uree8lJXFicd4TBfJp3SVuwTaQOoRRQG5xzxbdfBA7+Xkaw=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1F2yLwT1cq6HhRS/O+vQCFFr/hAHqhkz10tJF7x22NzSxMBLf
	vMisumWcUOw8FsP9yWU4jhUFmRfxP/kPjcbWoDWSIriT9BNd1uMCN8zI
X-Gm-Gg: AYBFou3H4/cdSItZCfj1cw7cOYEGPW8iUfWb47AfbpHW26C4gLVtvCIHrbAtg87X9Nb
	ppGOUee6x5dpAjQfCPn6cWZnLIqM8Tr+v8Si987DkFro7kXyDCwqMFiUDWCqaPyZnb2u83tGlTM
	7pQ8hUfhPpRgQ1iXS0noJaebbnAV0QE7fyRMoqDqifg6G3MjMmTUxwplEkdQwwY4z6wWW/hA5gl
	t+MO6qOWs9gIONAyjmeYRscfJOXLPepkRUFmZ6PSS4MrUOerIn2NhdR/oUqFmm37TXXnlQ5bzfj
	Nz3+yyAs3tOM6pYzE0xbqmZePx6x9pVEvYjpJ0SGbmrI2WLeJffTaG339EBd0S02yEFwXZGh9PM
	1Hk6kfUKTRqbrK+r1M2e+tUZNDjnRd7RozWmrGIDjUcv9H5NmZ/FDhCbqSHKaOZWuKj3unUq/NR
	3fYY6TZdWoTwBUe6VYzmKcjYDFvzLJuwytfsTiLUH/U+MZkKDai83uNOpMsEzMLim1B8cDv1u3i
	lc1JdoiK5Mt8udX+ZF2SU56M3g0n01brGuEiGBSRHH+qx8iDAMX6jC/YwwIpRnUhed9zM2kokCY
	aH+EbgwSFYfs+KaQEcX02klEUe4VvLUR2J+qZrj+sey5/J2s4HqHn73JHSiWsREpbRGiuttl8eA
	=
X-Received: by 2002:a05:6000:46d4:b0:48d:f9dd:e3b9 with SMTP id ffacd0b85a97d-48e07fb2acdmr8466980f8f.17.1792365358372;
        Sun, 18 Oct 2026 16:15:58 -0700 (PDT)
Received: from localhost.localdomain ([102.88.166.203])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7889sm19432309f8f.24.2026.10.18.16.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 16:15:57 -0700 (PDT)
From: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
To: outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Okhuomon Ajayi <okhuomonajayi54@gmail.com>
Subject: [PATCH] staging: octeon: remove unused cvm_oct_transmit_qos declaration
Date: Mon, 19 Oct 2026 00:15:38 +0100
Message-ID: <20261018231538.74139-1-okhuomonajayi54@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cvm_oct_transmit_qos() function was removed by commit
6568a2343639 ("Staging: Octeon Ethernet: Remove unused code."),
but its declaration in ethernet-tx.h was left behind.

Remove the unused declaration.

Signed-off-by: Okhuomon Ajayi <okhuomonajayi54@gmail.com>
---
 drivers/staging/octeon/ethernet-tx.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/octeon/ethernet-tx.h b/drivers/staging/octeon/ethernet-tx.h
index b03d56b0d2b6..498a5d68407d 100644
--- a/drivers/staging/octeon/ethernet-tx.h
+++ b/drivers/staging/octeon/ethernet-tx.h
@@ -7,8 +7,6 @@
 
 netdev_tx_t cvm_oct_xmit(struct sk_buff *skb, struct net_device *dev);
 netdev_tx_t cvm_oct_xmit_pow(struct sk_buff *skb, struct net_device *dev);
-int cvm_oct_transmit_qos(struct net_device *dev, void *work_queue_entry,
-			 int do_free, int qos);
 int cvm_oct_tx_initialize(struct platform_device *pdev);
 void cvm_oct_tx_shutdown(void);
 void cvm_oct_tx_shutdown_dev(struct net_device *dev);
-- 
2.43.0

