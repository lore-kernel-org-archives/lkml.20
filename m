Received: from mail-wr2-f40.google.com (mail-wr2-f40.google.com [74.125.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64FF3603E0
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789900631; cv=none; b=FOtNZ3MYGVFmljeuAt3rCnc2aePqk/UIeDya17JSy8gYuJYIo2vQ2CUItCQNRXt98imyXcowZv7uiEBxlj6idN8LqYygcHKsz5Bhpw7/z+Vp4PxK47rXobTnTjGBlpt8XjbiqQZaInArMDpJQwrutcwx7R4PNR2kAS2TdJR/tGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789900631; c=relaxed/simple;
	bh=Xr7L/LVpjL3GQFGR8E9vjXeRDSdu2y58YHZHJfhpoVI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dT0T0gA1jIpQc/tsnDN149VtL2mcWC4FE//9IYMBPY8cySy9QZo4WCLAwh17kYNLn1O1DDvTBwFeO21jvo+Y3UjY0S6w40c5VLGbc5YQuhTttSu4JzBtWp0DDp7BrHjIqceCSZvUar5w8gFLjfUM0dILTtS9GddokKd6qzE9DWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=UEr2JLQJ; arc=none smtp.client-ip=74.125.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="UEr2JLQJ"
Received: by mail-wr2-f40.google.com with SMTP id ffacd0b85a97d-48704fc0141so177578f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 03:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1789900627; x=1790505427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmMG7+knsRKVkSdz7OMe2deg70Qp3sxmdG8NVLuTxqk=;
        b=UEr2JLQJ4SCWS1JcDc9SdjX38mJxDYydJF8bfCMsh/XlUfLjfwYd7S8YAi6Yem9hxI
         5ER7SxbA3FEuhFRezPSl+VlDyh4YYjrn3yzzQPTskdq37P6IRh3VWdPpkrFLaD7huyOw
         L5/C0OZeFVlMtPS84n5wD9ynI4Bu9oOzNQM6zFwLMjQ/Hm1UXBNcMVeCrJoTINrAutYb
         al0aHztRWkS+SpWWITw+LQ3oydnqGJmO5JnIF9C52QEJjcT3Z+sJYXdFlZfje6b9spW5
         y1uyudaDZ4NyWrPQfbaUmyNqif8xeQrmpfXzI8DhxfhvDpgrpONeFeK0PImhhpX3KHL6
         dwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789900627; x=1790505427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmMG7+knsRKVkSdz7OMe2deg70Qp3sxmdG8NVLuTxqk=;
        b=vcqvsSXXJQGQ2p0Yu0+g8gghayy5zn+15sGcb1Pfs5XnS9M0BbpB2+lTTycKOdXAmE
         NfvO3IwmmBpJa7vMpJ2EZN4sjsEYekCjlQTvnIaT1gjY7dRPP05xIu39MnEtqr7FAtll
         MMr2t9mIqfmP/3dBDUUpB6I3h/NkF2IS28eoMSZILdr+n+Y8S+GF1XWQGQkAus9MRbWs
         u5SsTBGis3W+/BQE0zQOW8kpT2e+R2LDN0aF6XnW/+XyQqMrROvmFL6eghW0c7HD1pQ/
         SubX6uklxlXxi/dIGdeMAaXPDmmBweLl9aJX3TPj3rnpYb58Nk2MjG9JcK2EQqXGwEuY
         fQEg==
X-Forwarded-Encrypted: i=1; AKwUvBzv8WM3mtx8aQMm9lD4LSdYme5Hs66HJvi+B7xk8LkmUEM7+b0h5bUmVaxo2deSKu9StYsOxI8JkXiVn6k=@vger.kernel.org
X-Gm-Message-State: AFuF++k15rnD8mHRFPgFau9F+qST13JE3M7X5IuUwN0pOzTiiOZbH1Av
	caAPcEbfPIniCZJYyC9dzSDDnSMfX9DblznHY2L5ESy/fgH7KD8QQLXQ8BELJzYr0Qo=
X-Gm-Gg: AYBFou2eLh4o2KLeRxOXXNSM1jE8isjv1aSeL2C4u+T2frlBuORiPai3QRbfCJ+Yy4d
	NORmlXsF52YffjS9GsaFIQsJk7jkxVEQm20lXUzPUWmoHZazUMRVzFh6oAGV3PmZFlzYfHThZcO
	Jg2TMhIs4CglUdsqUwgXM+Cqe0mhlt3FR9WqfWXIrAzfkhzQOiXFKq+uwwXR2qSCJHbRG70FLuf
	c7hjQ0B/kO6hXmE3zAJDNP3FpF9yJ++89umc6mGIIYMiAHMXsDbDcrur8bzeTnlFELwRk2aECJ/
	/JcPplSb3LHkgo9dK8x1pvKpKOXLikpXhKUb1CrYxdonyF3hQFu3ezd3vqG4Vx4SbjooRD0E1+m
	bx7kezRC9J3UIo52vHqgaHrpiVseYbpV3KjX7NVI9y3vhnRlfPpOS56h2/9uV9GRTracmpUCq0u
	VWjtAKDJfqvnXwTok0wtosAwHNNFQNbq2MCOFCpb6wvJoySDLrDnOVcdDA2MK+P7r5qULcSAKhQ
	mF+0EEGj2hsZTtXP3D+764trKYV+BQ=
X-Received: by 2002:a05:600c:609b:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49fc7f2bdc8mr115621765e9.2.1789900627044;
        Sun, 20 Sep 2026 03:37:07 -0700 (PDT)
Received: from jwang-ThinkPad-T14-Gen-6.fritz.box ([2001:9e8:144b:bd00:675a:38f6:9365:abd6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd103325sm164915215e9.9.2026.09.20.03.37.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 03:37:06 -0700 (PDT)
From: Jack Wang <jinpu.wang@ionos.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>,
	linux-raid@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jack Wang <jinpu.wang@cloud.ionos.com>
Subject: [PATCH] md: fix mddev_unlock() called without holding lock in lbs_store()
Date: Sun, 20 Sep 2026 12:37:05 +0200
Message-ID: <20260920103705.23191-1-jinpu.wang@ionos.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jack Wang <jinpu.wang@cloud.ionos.com>

lbs_store() jumped to the unlock label on mddev_lock() failure,
calling mddev_unlock() on a mutex that was never acquired. Return
directly instead.

Fixes: 62ed1b582246 ("md: allow configuring logical block size")
Signed-off-by: Jack Wang <jinpu.wang@cloud.ionos.com>
---
 drivers/md/md.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index 680b34a63cb3..41fbe5d9961a 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -6048,11 +6048,10 @@ lbs_store(struct mddev *mddev, const char *buf, size_t len)
 
 	err = mddev_lock(mddev);
 	if (err)
-		goto unlock;
+		return err;
 
 	err = mddev_set_logical_block_size(mddev, lbs);
 
-unlock:
 	mddev_unlock(mddev);
 	return err ?: len;
 }
-- 
2.43.0

