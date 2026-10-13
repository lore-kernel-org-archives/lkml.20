Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B6D46A5EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 05:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791871012; cv=none; b=DKCJL0SkxlmwkXooitOG1mcUhEJ3CGC1Q7wQjjI6Ss2lieFlREVRdWXYeGxntIBYfUlkC2d8LyYN2kuzqoO86uQcVs5aHfpBco4fZ6NV4gfZy/8OaF5OexeuBuS1TDowqNdoS0nb/Fh5mWTcy8zaTEaYfe39M2en6EIn5y3VY/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791871012; c=relaxed/simple;
	bh=3pCOcqKf7T9wJyZUmZLGcII0V6IWGjvH8jpDvckklck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EeKy3X0mTGh/9PBqcFVzjNl5uF2Bf+8CegFu50B+Ww8AwtOchP6SZt3k2631R41UCtJMlDr8IDDAA6uAyvpFS3Y6GYPKrbUZ0OzQ2JeNbXyXG9ePQr6NZSl0QsNSDAwDARTeczYejQqYkyhmMwzoqcC+/aW/tJ5Rd+QbZOu9olw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sSx6Be3d; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sSx6Be3d"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso32554935e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 22:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791871009; x=1792475809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=edPFNMluEF6s6sLCanSOFhEfk5IKgfxAjXociYy8RQU=;
        b=sSx6Be3d8rXaMlKRX3sy6Fa9oI+qKKmAUE/8C+bOSvCQ42dNOK/zcjgShIzu7j1rcV
         /jj5zxQRjXMS/3kPcgHG/G2QR4subIlihnIcY9LNQq1HTYF9q4EmTYVxsdqCQ1T85pXl
         Jyga9Lunvsd+qx4awFOipxkgG7Ml+VNaZEeX1DDrenDrSn3++FQ1/PFPQMcacNmRnRoV
         twfcvLB7sm31Ko5HyYb4utcjZm3wTtRNP3tX5JH2pScvzuG5yUGobcYT3uw71PHWuS5b
         RP/lgUl/6v8KaCn5H4hWkPQP3AcPAaxAhC4IyeckkpJwm+vzoXF3UwaHjLSAFiVWpsA6
         UO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791871009; x=1792475809;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edPFNMluEF6s6sLCanSOFhEfk5IKgfxAjXociYy8RQU=;
        b=clfdXf0NUgLefy6/KNrMEsQX9xy5h9kBUFIoepuH9vwBRvUJDvhi1QjvfgL+Nx5aKi
         5qvIm1rPd6JHpYQZ1eVkYArDojcur1l+ykVacNrs/7rSaoH5370kl88vGqs50RAREZD1
         rrNbCQAgSzQC0xSVfUDylT7DECeZ5isEUKJ7BEqFZPia6ds2IolE8BRKlQZGdn8E63/R
         1/PcvXCaTynkwk1qtLy7YW2aTtA50gqz4js+wnVYnmdFeY8E3T4M2Zj91OvY0+ElAt1e
         kKaKqL+OmRC0Kx6Lzxc1Nh+oUAKa/LvVnor/3bT9lmWwX82i2FFKqu7Jh/80/e4ZTz3D
         kVdw==
X-Forwarded-Encrypted: i=1; AKwUvBzKdRlFNcGcMEefsUfn8Z6T3PNCDcRcKUYo7tbjbcUgEJ6zpedOCRsA1QrhqVj8N/XQfTA/S0vtEj+agRU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoxk6ekekmebrMk9HlOnm/INAYRkWMybGDudSwZZPuuTmw4+bk
	fCmUPG4B0jYm7EDtA6GSTZEzA11q3Rmo5SJdu6zIImr7Fl6VFkYBXISQ
X-Gm-Gg: AYBFou0mbz/TqIyn22Z3TmYBvmkwKGOrA8/lmGHxKP88bg9ARNOobvJskcpgkrZHWkR
	fv6F8oQMMHXL/3zfTsytK5Xb03Q4Zc0Rgl8r50AsHQjtLrq+3jERFfk0zwGlzrtHLkaP1FrsRiu
	qqWXVB4EKksPExVYogRXS398ocfiFLnaupBUG22yPtXAY+zbUTWuVtRqW8Ho5rxJalo5J4b6HuS
	b0omuK80mSFkUhebxAwM0xYzO+JBRzH/E+JcfritUCfvsutvpbTNjtnJzSZ2ZGZg5UbAOCE2tP7
	6Y/M1cmgTCbDv7qa7gqI/IszdJBhG4KnagZajVxwOqcV/55mNoErr6gQeBA+9Oe6D7tvvkZl3tU
	/WTOG0LJ3I2bkBKsPfEnDy5bNBivakwESlV8oYzQcisf5ZSTR8qPvERq4TUXXe2sPVg+jM/UJJh
	4ARqzGwX0pNOOUnrYisevMB4E6YTyGgabK+YA2Gpj4dtet3EMz4UvTCiwaiPjkNh7s2ArVq7KYg
	iGmNQ==
X-Received: by 2002:a05:600c:154e:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a18e49ad83mr221940565e9.11.1791871008947;
        Mon, 12 Oct 2026 22:56:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:ee4c:dd08:4e0b:2855])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6b3cbsm271369505e9.0.2026.10.12.22.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 22:56:47 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: qcom_smd: release channel OF node on device destruction
Date: Tue, 13 Oct 2026 08:56:42 +0300
Message-ID: <20261013055642.793161-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

qcom_smd_match_channel() returns a referenced OF child node,
which is stored in rpdev->dev.of_node. qcom_smd_release_device()
frees the device without dropping that reference, leaking it
when the channel device is released.

Release the OF node reference in the device release callback.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/qcom_smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..6c1cb66528e7 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1065,6 +1065,7 @@ static void qcom_smd_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct qcom_smd_device *qsdev = to_smd_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(qsdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0

