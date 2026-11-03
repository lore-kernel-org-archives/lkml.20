Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793728160;
	b=V2D8SCvksDpdTkzC/prfOPiJhREoO+ydqgvYFCT18+vXq1OA+FD+y8dJrXvTRkZTJrYl
	 qbQ3NgSiXKdI5b+MeSptke9sRNCe5+LpWwo8Igf/nxFEYT4Mgdri2/A1rV1QdDoNNMtl8
	 OvlqZFvGltqhc+HRKqFpraz42erBOZxanr497Se/UHftQ9+98ybxdJIV9srKLUxLpig7n
	 v3YlgHDrA2V2tfvts0bMr7BzfMgcLlgHHJS87PVaBpUI6m34NPMTZ7g/fMSvku2rMONzd
	 RHuNb4vB56kR+hVJjeNUaloNGOEBrhTZRFNr3bT6zmb/DQjJFdSOP7Pyq36BptwmJHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FgikEYkiQsJy9iETUjpbTLeVR9t9RSzyiZY/EMx6FbU=;
	b=LiGq+/1crlmzZmZiZLsrK6LcEhzeXDvvhlpL9mI+ag1oFGRByDOo+XYzCLTSoJ51mVpi
	 TMRE3C5zWf+mbFD/e8vAVlWPIw44a0gSW+oF4Q/sEe9Mm1tFIOGcvA3+mE3qRHlv6BX1W
	 F4o+w0wfYavA7ZMq/BZcS3+VxDgV817oGMPXbCO+6gU1zCzuJRziUn/fndOKqRfe9KE/E
	 +z44K/IbygYrGVPJQAjmYlyHGM/SiUrKyY9xvmgRtvZlvWUDdqpgDrM6nsY+i1ldsSUUe
	 SjIhuot42WtPV98rNLO9usMCJhMaNse0lDJJW2Gl7o0JVxB6jKQF6YCtRCpLZJXMILg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJZc66fg;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9172A606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9172A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eJZc66fg
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36bd3dd31a6so104688eec.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:49:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793728160; x=1794332960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgikEYkiQsJy9iETUjpbTLeVR9t9RSzyiZY/EMx6FbU=;
        b=eJZc66fgV7RiNdGmc6O3XIKbRsi8kicehYGWe1f3xOXiMFhruz7iP8Bt+1rwtyb08H
         RBUBpzcbr50kwLRHQveCwqEPKJ0qvDC/NFT+njcF2NHBM4LVaAnWhefUdlYY+50aXKMG
         Sy2gaDDV29T4NZhFiMc1EAmDRPoWRjTb8Jbra8rM/MfKFWTt2Wn9bQF0+gE76a53mTYH
         5LfJDm0IuRRbTrXyZQfCOqS8h489OOp3msN+UMMPCn0mOc7w53AJnVitxKNoN7rGe/IP
         avWsWaC3pBdwOxDmffIOh3LiUDlDk0Hx6PB3mn51vuWilNt18kZxBLyIqnv6r15ZkXy3
         IIcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728160; x=1794332960;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgikEYkiQsJy9iETUjpbTLeVR9t9RSzyiZY/EMx6FbU=;
        b=Wtlz3++OesbUCAgRc9VWxlslOBOOzTbrWmsqZhPYof14YYcV26FTMqr6jVYsz5TWW9
         V/sjBO6+ZWTF+3ln15xIAl72WF1XaarMseX7hIUYFFHELH9m80F+oP0LGlH4T8xg3PN1
         q4up63AL8VW87D7SPa9S8KHrX8S1GDjpeo+QI2xy+nnyt0RLAnIymcNOUNtoLCZuP8AG
         wwkufXdOJL/2XTt38mfXaZtdBWV04o2rSmh4fOOp5tj7x4e9kV8YqctgOrsLZdmEH2XF
         Kq3xtvuhYLYI1FlwStew8FQEWcEVCLYit3MRxGwaySuKDl9q/GLsf06Z+9DhUe/fz85U
         oUpg==
X-Gm-Message-State: APuU4Z+43nljPvTmqQHOI3rPuwAHoYQM4SAqwrg01Mnb/nWxYEyuLwhv
	lW4LqFncg2Ipm+VvwDRLDuSX0d2nbeF1T4JWZNeu1Gpi2ey2wYRZrm79
X-Gm-Gg: AYBFou3tQnH9NcmE21WIQiHqJfoI9Kh8TXXMatmeJOEomjvNJYevpZkrdf+BWSus8i9
	dgqEJCNMOPveYKWpFTijv9eeE/6BlUGECdTtzU8X/ZhekMZ9YebYIRVVtXpPCz4W8I17VpvLjPd
	GRBCNxxvCtD/biDddyPccjHChm1y2Y8ZcRoFWp08uxxjdm4IqQNLwrzq2JdRedYT5Uq+9y/37yE
	HRiU3FfDLRk7TxewEZtVWKbPvZNlpuiwFRaLFftvjErSrgpYpt+Ytmbk05t8daqF0hvi3/1/8Ip
	16QpjJuwA/r6ASZX2TaqRoecXUQZc5ZHRNblpdejDdqSmx+BI5NHepXsXmWP/L9y6382k+93qGV
	PqzGSAh7SPoH5JqMeO7ZPUyehQ58WwUzw9a9Q7fF9TFbHi0o2kEGeC2Jt5B3A19evUXnRRAcWHG
	KESLs5JGzKAj6UWnGDzKuMgAs4GMPNFbOv5Ycf7lYwg1GN8JKySa8sH9lJY22d7SIuW0a+bMn3P
	5Rz4x03aznPki3RFGK+A/qEmKf1S4ISalvthSrukdRE2Of1DhMTvYv51uRcoWYfNBwSKVq29+jO
	PEGFdQxOys9QO99fW+oXzRmhiepaEiGa7BrAw+wPgA==
X-Received: by 2002:a05:7300:d090:b0:36a:e7a:e89 with SMTP id 5a478bee46e88-36a4239cc86mr30667708eec.2.1793728159684;
        Tue, 03 Nov 2026 09:49:19 -0800 (PST)
Received: from CRASHEDROM.localdomain ([142.249.36.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428c17bdsm47757914eec.6.2026.11.03.09.49.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:49:19 -0800 (PST)
From: Chengyu Liu <lui2012qwq@gmail.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Chengyu Liu <lui2012qwq@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] regulator: cancel disable_work synchronously in regulator_unregister()
Date: Wed,  4 Nov 2026 01:49:11 +0800
Message-Id: <20261103174911.1600930-1-lui2012qwq@gmail.com>
X-Mailer: git-send-email 2.25.1
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

regulator_unregister() stops rdev->disable_work with
flush_work(&dw->work), which is a no-op for a delayed_work pending on
the timer wheel: flush_work() only waits for a queued or running work
item.  A disable deferred by a consumer's regulator_disable_deferred()
therefore survives the provider's unbind, and regulator_disable_work()
fires after device_unregister() has freed the rdev, dereferencing it
via container_of().  Use-after-free.

The in-tree users are ASoC DAPM regulator widgets with a 20 ms
power-down delay (sound/soc/soc-dapm.c): the window is the entire
deferral period, not a race between adjacent instructions.

Use cancel_delayed_work_sync(), which also dequeues a timer-pending
instance, waits for a running callback and blocks re-arming.

Found by static analysis.

Cc: stable@vger.kernel.org
Signed-off-by: Chengyu Liu <lui2012qwq@gmail.com>
---
 drivers/regulator/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 6a4008f387..032b7298a5 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -6300,7 +6300,7 @@ void regulator_unregister(struct regulator_dev *rdev)
 		regulator_put(rdev->supply);
 	}
 
-	flush_work(&rdev->disable_work.work);
+	cancel_delayed_work_sync(&rdev->disable_work);
 
 	mutex_lock(&regulator_list_mutex);
 
-- 
2.25.1

