Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974943F3298
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 23:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791156927; cv=none; b=m7AbWh+VpxnJywqbTDTk1Olu+BLTSuRsIBcrlHAJAvRLGgZvL/pJLJsJVtyX0GNRlFAMI8AwM7hdqz4mALg4t6q3AWxJW0y0yJzj3RYiBRN1cXRpiUfo0JIDn9VqZbCUe4zcUrTOEB6yVT2P9rVIkdS3zQu2E4ioaGUO3PS3R4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791156927; c=relaxed/simple;
	bh=84oNTtoU5TRwLXpVP/C4e/RdQ+WXtPYh57/ceGuME94=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ljp/0AZPvKEGfm05Jvev+fNYsUhd6x4jbyzRsa0ZMiA5m8jWsfFvDk18HDf/D7/KKvqoNVEwzgD1gdSUXJMQG8YU8JlU3bS3p3K5NZT7VZRt4K1qVNgzNn+2uXtFZPtLwi7hvg8UmfhL2XabmpgU5CfEDT33pTqn/rD0j9yQvJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NTpjoFTL; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NTpjoFTL"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-34ca2d54925so2112868eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 16:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791156926; x=1791761726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0geCidlObjDwsqjGR3bZHWylINcXP3kfe/2o2o6fpA=;
        b=NTpjoFTLlYM7sRg/L3XOdp1t55LqJBUMQLftf/+zfkp+LebieQPcBwFL4x0rKIba6Z
         IWRVP6MZYjDSR49HD6P2f5ES5Zh/0yj0RRZTh3Zwl1RF8ABLX8lkXlQooG3os8cgQQgb
         jVaHxlHbDbO23HMsr4mx+l172oBgVOPRh6kdoPE51R5VWhBjQfA9SpehR/D/3MvkFg6R
         5cyOleMYOUJJtRMYv5wqZYJOus18IpLpbMJRdpoB+nWVfcyrpID7P+97/MrR2GBAAxiT
         gKC8IUgQtvfDljsC8iGTc/zQ+IvqFHpOwdYb93crPM7D5wAF+J3FJgNSPXgUnniBZaVX
         figw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791156926; x=1791761726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0geCidlObjDwsqjGR3bZHWylINcXP3kfe/2o2o6fpA=;
        b=GWd22r9NzZFajz3XFQwwZa4TpGPqyGNmrW0u0pzyorhwARngYD/dyIFP00Gi7IJ73Q
         t4zyh0Bd791PMdDcbdbe51MjB+aR8hv6E3KlfXL7rBtGUhdYFDi+kGAnWujdRNLS3hti
         w9lH8DfzsHcLAeUvAQnzROI/lohktTNUacqP/0rEaUYdoVvayCmVE36iIGKrRb+WMVIk
         +f6zQX+0c71n7JFa4t+4zunO81JdJLiITzKWHUFa4Lf/MXv4gMK2+p7OoDTxchoyEKOc
         ZSKbW4yxTv77saglUzgtdL+SUEQWBFsOknWO3OfRuLgpMLlvKSA6aqPMu9So6JE3Glxa
         oLOw==
X-Forwarded-Encrypted: i=1; AKwUvBxZWx2c3nxxbrJ0i0Hi4xAecRUPss9WLZR69DFm4HyVKn7RKPzdT6pXHdwTqLLm+f4NUWC+aQJFSOCq4T0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLOh1cuNXlpa2mthPIP+NMB3eKaQ8Iqsfga+pO0gYH/Xpa+7r/+
	oEl3XP+akC8Gt1mQdUvXvJXkNb8SfCWBe1bTdbyzBXYwMDk9zZaS0z6N
X-Gm-Gg: AYBFou0YfFRMDcinZH5UO95mBEf6p8IVFvmR//XBV5nAxS2W9HIbJsIoOgdq93qj+MW
	lvKbMet1AWFrbh1ChHCkAnNmFxmL3CFoEruYgtYxN8NIj5aVOLSTWQcuQcLosnk7eSi3RJHykuK
	Xulx/4KhNOnc65JfRrsvwXBrw/ONqfc2F4y7z7unRUCBDSJ3lUnQav+dFZW1yzmc+UMnX+X3Qe4
	yD88IY/EkWDDllRv79DsRO0nHnDLC2+GVZA6ySIMarVMXfQ3lcUwFTs3ypN/zrjx7CZihhVjQQf
	iGKF/+ZIRkcOscqHDWvGFZIBkb3+HoEyLkQM5I9kwvi3/QpsrKHC2jG8SQBoRDTwFvQFpTTW1tK
	1M3lqJ/tOfC83C6OPxZyg6GJZZ0RU1tDC59zIgtzOfYzef39IPIYS5AMVaUIVPpr8rRYiXzd8dU
	k1zY9dx1yVnUDZvNnj0uGYmlNR5z5eJzkgK/OiCIetecv6p83twalJWKH/5mh5KTNaQAAoCK953
	LhkR/vMty1ByGxFm+xoVmUnGwbxwrYSAXZtp1UU5TnEyis1Cwmt5h0C/yf754HgYT2FO/Bt/JFz
	eaUWGcBE71kISp+NrCyyVX5IE8xg2lmVXq5yoznO8tvEMVhb
X-Received: by 2002:a05:7301:db82:b0:351:245b:d1e7 with SMTP id 5a478bee46e88-351245bd4aemr3769432eec.0.1791156925455;
        Sun, 04 Oct 2026 16:35:25 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35126f01924sm7960360eec.0.2026.10.04.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 16:35:24 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-bcache@vger.kernel.org
Cc: Coly Li <colyli@fygo.io>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] bcache: fix kernel-doc warning on CLOSURE_CALLBACK
Date: Sun,  4 Oct 2026 16:35:23 -0700
Message-ID: <20261004233523.516891-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bch_data_insert() is defined through the CLOSURE_CALLBACK() macro, which
kernel-doc cannot see through, so the kernel-doc comment above it
produces:

  request.c:308 function parameter 'bch_data_insert' not described in 'CLOSURE_CALLBACK'
  request.c:308 expecting prototype for bch_data_insert(). Prototype was for CLOSURE_CALLBACK() instead

Turn it into a regular block comment, and drop the @cl line along
with the kernel-doc markup.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/md/bcache/request.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/bcache/request.c b/drivers/md/bcache/request.c
index 3fa3b13a410f..e7f097346d64 100644
--- a/drivers/md/bcache/request.c
+++ b/drivers/md/bcache/request.c
@@ -285,9 +285,8 @@ static CLOSURE_CALLBACK(bch_data_insert_start)
 	}
 }
 
-/**
+/*
  * bch_data_insert - stick some data in the cache
- * @cl: closure pointer.
  *
  * This is the starting point for any data to end up in a cache device; it could
  * be from a normal write, or a writeback write, or a write to a flash only
-- 
2.56.0

