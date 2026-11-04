Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793785866;
	b=i5GoVMY4uz/L6R4MmQ7Jf++skaZgNgNt0rMw61g6vabdH/gwEnMINeH6DVGNWQcj16ui
	 vK+ZQJTZQC/hCk0oyP0IhG4/r6ZgWC+1gQkp9tzsflFdSd94oFHAOlxks6SVyZqQSj0xZ
	 7dowsWE/QBu+3AAoCUdapKMjEKP52PDH7CoIrbTq8DGauoRBg/GT9sO/BBINx4o+QKjZb
	 ZM8Kn7uBESr5qVyssJIBzaLzO0e8Q9ENLgb4bMuU7GiUKmDJDBcaHlUCWC9QYbyZ1n7AP
	 jLedAzL9R+KBno1UKuFVTMSXmXBdIhEFHeAzca9bJRb8hqPPIq+UEnf9w61cwb5U5NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793785866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:Message-ID:To:Cc;
	bh=iMXe8C7daPiBSG8ju/PNDegLRf9dJOdMxFUB3wDGg24=;
	b=eJHUGn5FjkENfENHzuBvEtQ/KpC1TgQ7XtIiRdwaX257a08eKS3l1rFDzdsKOQDkkPeN
	 ObZIifa+O39RweuUgqVtNHqXWhHlGy12I9acfwnE69NdmptvExwf7K8hYNIB5ZZCj0Yzf
	 VuaA2ngIkjpj/IFh60r4iLEPSC/Zb4oJN1T2f1dqxvfRdckOGKIs/SnzPhkZr50SMBcnE
	 DE6xuQqku6D2Bdt+RLB4tZUx+bBOvM9xIn4TROQVOeKOhvQ8XsED+RwH4rCsyfnBaMDpV
	 NwxJGsgwNIf7GBZ3DgswD80RY9KIoljInsZca3ujphYpWkiIppP9U96pYVmQTJf4h1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4id2crq;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A35606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:51:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80A35606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A4id2crq
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1a3c08d6928so753895c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793785866; x=1794390666; darn=vger.kernel.org;
        h=cc:to:message-id:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMXe8C7daPiBSG8ju/PNDegLRf9dJOdMxFUB3wDGg24=;
        b=A4id2crq9enniV0UEe3S9PcM2zqBBo9lolzKRqBxWkkFhSroIRB6fWgZVTnteGNHNi
         ozVKgo3tKzysoauI2Zxv8cbyxMiSRMwC1xJkBIG5DSJpuumzxgrUXlgD3i+y+dKkiSha
         pjY+4g62GUY1yiupYvzTn95vOFslgSEVVQMgULbGCYoiLBeZwSwU34HebA9vZ7WYAGcu
         LvC5cO3kx0Tn52MIdi0YOE1ess7iztzEDapLM017J9LZMaAQARbFyJe4Nqua/sDOkZ/u
         TVc54KPqUdu/ES3sPg9KOA5K+VxecyTwyXdYvYMiMB9u0XTY2fk+NZZsBOexV/gM1v4U
         TfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793785866; x=1794390666;
        h=cc:to:message-id:subject:date:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMXe8C7daPiBSG8ju/PNDegLRf9dJOdMxFUB3wDGg24=;
        b=QSmCWruL++gsLajUV9OYsg/aLKDUJ5toXCzIzXLvPCmaLsLugA7BHj79lWNCrHEbRI
         riXSXdc/N7L3Fkz4iLWGM+hdOH4P0tdANJpp2wSMUx2Uw3DqF98AkO4RY4g5qTZcAMPk
         4pY0j0YQiArO9Vlv6EivWwR78tImLMXXbTDaOYAZ4PSZI840iJpHQi+ASG6CL8tsz4qE
         6qtRF8gWu+Eer1qQ0XxJLvUjVw/FV5ArDJj9weeOHAq4DHyuF9I2C0m8aPGvVF6JVlJM
         Z1bhbLAnZ2LXCBWWqYzuppBC73hOOCr4rJTv0+MfIgLK+4hEBWh6Rv6wJYkwLohhy47H
         T9Bg==
X-Forwarded-Encrypted: i=1; AKwUvBzY0l1gpddt7EMclInk8dhH9vJotq2jXxmYrVYJgFIuLpZrqrBwh5/dxau/7zwCx9OAr0dFi+SkZWRM7UQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/J48qIsakTMQAu5yTZhYKtfCRQBvPOyi01QnyFRPbRIwEyuxHt
	CAjh+Fzce4szqIgwwWKELEmJLOKTp/Q6FSqNK1ld+VUnKMOcbOiYfS9n
X-Gm-Gg: AYBFou0IR3L0MIAFR9eYpze0KdjucUAmlsp0U0REwjMH3GFmEwdnhmRWKPGz9ROmeTv
	OjXcBDFB+pOzx7C/Fo7WTwSmsnyBPu4cSMmVR+8/gQGaErjyzMzKLMxHpDlOiKVijcV5/wUVGVn
	o6q3rPIh3AFUkE6t6hdyvppqrAbwgIHGgf7R0Mu6TnrwhKA1kVbibX5oSPJBgMLHSyC5ErkWkgl
	78nD9LhffS5USMnxH3Ms+qEvwPDbkjQsxyMX+mP3u7YUit7mYQxGuPA0rCUd2EAFTecMq4fJGW7
	ef0mthPpmm6YeoXtdfQRjmKARUxXBze45S1fLicWEi8FalqAnk/zTbAxrxNaxmas7y88AIvDyIo
	cTN8q4t1ubtGXQpLWEPEqDUq74hR9cJgaXYtIWsavaY7EWUAr67c0H0pOTi/zCCSlwzvPjx9Rh8
	3Nx+CgDb1t1JIM/wCg9ESFsQR6WFl91buCjLJZI+IlHunUwAd91T90yl13ppFoI8iAEWQkVOXE4
	lyXNMixQdYLOyiI2zhMMykSawzBCobgplFyokCOLZ6E7xXq5sRVrC1JFrw6nryVenHwy/5gI2gm
	FoSvVvWmv6cu9hWF+qcwK/7WBqCus42lLu1erBqAVw5GB+q/ZRVnxEkL8Ej8YHmjgYw=
X-Received: by 2002:a05:7022:b047:20b0:16d:dd5c:4261 with SMTP id a92af1059eb24-1ac5e6f4e87mr24922994c88.46.1793785865246;
        Wed, 04 Nov 2026 01:51:05 -0800 (PST)
Received: from [127.0.1.1] ([23.247.137.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c463e9sm6536137c88.14.2026.11.04.01.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 01:51:04 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
Date: Wed, 04 Nov 2026 17:50:50 +0800
Subject: [PATCH] media: v4l2-mem2mem: cancel job work before freeing m2m_dev
Message-ID: <179378585020.73536.6089775766038265997@gmail.com>
To: mchehab@kernel.org
Cc: hverkuil+cisco@kernel.org, nicolas.dufresne@collabora.com,
 Frank.Li@nxp.com, ming.qian@oss.nxp.com, dmantipov@yandex.ru,
 121811682@qq.com, ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

v4l2_m2m_release() frees the mem2mem device without draining its
embedded job_work. A job completion can queue the work while device
removal runs, leaving the worker to access a freed m2m_dev.

Cancel and wait for job_work before freeing the device. This ensures
that a previously queued or running job worker has completed before
the memory backing it is released.

The use-after-free was reproduced with an in-tree V4L2 test driver
under KASAN during stream teardown and device unbind; the same
injected scheduling sequence completed without the report after the
change.

Fixes: cbd9463da1b12 ("media: v4l2-mem2mem: Avoid calling .device_run in v4l2_m2m_job_finish")
Assisted-by: ZCode:GLM-4
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
 drivers/media/v4l2-core/v4l2-mem2mem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..c4756e7bb1fb2 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1207,6 +1207,12 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
 
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 {
+	/*
+	 * job_work is embedded in m2m_dev and is re-queued unconditionally
+	 * whenever a job finishes; wait for it before freeing the device.
+	 */
+	cancel_work_sync(&m2m_dev->job_work);
+
 	kfree(m2m_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
-- 
2.34.1

