Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FD648664F
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 06:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837104; cv=none; b=VrFd8p417m/7aOHmxd3oAcjY3Wu8rBMjAw7fUO8TK4lIj82w0ZD0nuiyZqdPo1zxItcLZaZ/rZ0MAGL3ybpfowHxkPraVRGuK8pNQ9kL/deaJtzsWR7kuXLjPKsgKQmk/UMJEkdpkWPkYgdnAfX3ei21kEm1tl2eDl6RgkGVUm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837104; c=relaxed/simple;
	bh=votCEGmz1dBqut4kLOHSiZQ1DnWpjQ6Ww8QiJ9avmvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KaMX2zolKXe+Ngp3hfbfPmLHuhGe4qOsBXuGajyH243nWIUmu9EOwxRDQQ9Lp9CSVIs/MQwbgXNHQOfh0HXQiEqbVx4k7JhuGjp2/2U+q4AH0HSsrUT3MjVYHmW9eGvN34QYsEhFPkNSS37Tv8zl9QvnrAF18+8fgryjyitym50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJmJel3W; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJmJel3W"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff9642c57so12185585e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 23:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790837100; x=1791441900; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D/97GcaHqO60C3xOpYaJJL73vz2EyjukQ0UgEJCJAEY=;
        b=HJmJel3WoK5OchmHOkR2yPOuzl2NiK7u32P+PTnbyc2BHWZ5XpvTeyKlZY1U6aiJkl
         +ggLcU+TWlIyIHc3PHxIONXfG5wnGBUI9dABIZAus3+ivJX1S7Lw9Qyr1XTb3XZlyvgJ
         G5YYsADwey4VxLgTGVNtAwRxZygYNay7gD5Q7Q3vR2OBkSmqsvGDr30Rq4qjBppgARmh
         1Oc9vdEoMCPyvT8gmHOVzfY307OjsC/HImvdWdh1DtYev7qmr58UpkPAEoXAW4RkQ2Sa
         cTObtL3KghgU+Aj1HSz9m1eiOTQjUYklNIgOW+Fxxd+0ySxE6DJqe4H/fDD4+H85SWQL
         p+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790837100; x=1791441900;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D/97GcaHqO60C3xOpYaJJL73vz2EyjukQ0UgEJCJAEY=;
        b=Hy1b8iliSqFNgfQAVj5nbuEyxnCeqLBlqYkMyurM/yH0V6t8NFT1jIvqk08+CnKfGE
         xck4o8CdclLgUT8dXRTC09NURiEyUcXRy9w2XapHk5fcDk7quoltZs/juBMUwEBt3JGi
         AOtwHX/ciHoSw2qeLtRQZbT+iYFCfAm4LYPQ5Yc1TmaUTX6A0E5miVTWbbYbbtgCGP8B
         TwS6EKgijDWLLhmLJP/3BmhG8+NxrXAuqhXEuuovBfvJL2kbA92MDtY/u7dbIWZwPx1J
         G42/hAnI8qvUjkL9XDShb0VyLG/SMH+2FQIukBnOan656Hgysw3WGdEMQ9QAdGtp41yy
         aZxQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfHz9WO0cQjydIy4Wgf0FK/C3iHW1QyM6Q4AX2qortuZ+Enb9fSTmD3+BUjdXbolGaOQzQOnjQGQVivP0=@vger.kernel.org
X-Gm-Message-State: AFuF++k2TPtKCzQFjleN9JBQHs2v/kLbmQj/XjJGIg3cpe9XfjjV0s6H
	faeiKqkUvrnQ/FLO//oYc5H58/RziMFWvFHrSeQYA9AzvMDmDSyZiH1p
X-Gm-Gg: AYBFou02O9l49x4XGEpm3CKQKvealwTfSKAiItQczO/Hm8eH1r01M8OfwxyOKggAxFW
	tGI/MQ16JoQnnAyT7jIgYZXMS04NgyrItIzB+GZuh8hNX9V/ld8Vu+1Z5+xjSm2qrG2qDLKVdYC
	w/i3+EtJlZ+e6GUFcVfhU0BgP8U80AcL0maJRESbr1Bc7J/q3omFA8duSLveR6e1KyMeacmhTUv
	sb7sISkZ4tS7yTo5RajSD1ODx2IDsv5b9AwKLAHtboGpBvoo02W862vOBXY5LYt4ryewpcClO4M
	Vut6kT4qNyNSTGf3G0J5N9wYxbvfFMEjyI1SJ9z5emctEM4hHu7pqf6Un81k1f3w5gxEwZqmd7a
	1tEP8J/v8siNn+a5cV0CplBF+Rw2SbOCbBly8FCXHbxDDo59EXIlKl6eBKSbHXBUabUmXyO0RKh
	udG287nte3KtnW2OFi/UUhen1U+Gim4xgQhSbwSN96oviMIQK+eJ8NQ0kqrYQD+YEDIOTz
X-Received: by 2002:a05:600d:864a:20b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a01eaafdb4mr22604095e9.0.1790837099925;
        Wed, 30 Sep 2026 23:44:59 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f99a332sm86476875e9.12.2026.09.30.23.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 23:44:59 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:44:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexander Aring <aahringo@redhat.com>
Cc: David Teigland <teigland@redhat.com>, gfs2@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] dlm: clean up a type in waiters_read()
Message-ID: <ar4BZ26gjQEjZgIa@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This doesn't affect runtime but "rv" stores error codes and so
declare it as ssize_t instead of size_t.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/dlm/debug_fs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/dlm/debug_fs.c b/fs/dlm/debug_fs.c
index 700a0cbb2f14..f52a51b1382a 100644
--- a/fs/dlm/debug_fs.c
+++ b/fs/dlm/debug_fs.c
@@ -596,7 +596,8 @@ static ssize_t waiters_read(struct file *file, char __user *userbuf,
 {
 	struct dlm_ls *ls = file->private_data;
 	struct dlm_lkb *lkb;
-	size_t len = DLM_DEBUG_BUF_LEN, pos = 0, ret, rv;
+	size_t len = DLM_DEBUG_BUF_LEN, pos = 0, ret;
+	ssize_t rv;
 
 	mutex_lock(&debug_buf_lock);
 	ret = dlm_lock_recovery_try(ls);
-- 
2.53.0

