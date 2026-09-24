Received: from mail-pj2-f26.google.com (mail-pj2-f26.google.com [74.125.227.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4A6422522
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790247798; cv=none; b=u12GRjuVsLZfVG5gxOm6vdMeu3hIr9SPjSL0APKSk454ZmdoPw4aNZ9VKcn7W3mE0eAxPQKPy92W1+6puqAL9R4a7jgpPTGbPW8Ea/zEt1MAoicKra6nsFflan38tDpRT+adOJ/d24Y76fciFeexMQPgdLWjbcs59lVoC22r0iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790247798; c=relaxed/simple;
	bh=aO9jXqxRqOyTTCrOYU5B+DX1uyFV7Lr1IqEsZ1j3xU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LU8HYwKUPbvsnRUguG6PnRDCa4rxN2WI1t1EZnw8MBrSFnyu1WaGsRFT7kQfiDTz9VTb4gtCnDtdqHJHDGhBI0P3nDjP5lP74l5zmgkhHGoTTa8AYZoGZZX84BCcAH8Oc5gbhrf2eIvmDRIydlTfJq2KvXafq/gXrtN+Til7LwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+9W5BoN; arc=none smtp.client-ip=74.125.227.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+9W5BoN"
Received: by mail-pj2-f26.google.com with SMTP id d9443c01a7336-2d8fb334e72so8754355ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790247797; x=1790852597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nIbhax5iMWz0Nhglod4QvaTZFTgtc4d508WTfg8CcMM=;
        b=a+9W5BoN6ibcGZ1t2yMukQ9u7OcULIF7Vd8Kg+X83fuGNVPz1nB7Va7fY0Dbdb2p+r
         4oCMlVlVJnw19Zo8jLm488hLxWXtnkR/8FN2lTplb+YVR2mMmnOLCZBkWjtPnaY7jMsl
         cWj35VgAx8yJRjDNW+roLfwr/0itvo2t3HKf9w0UmlD3UnVyQgUXgOrUcZlpj9w1XNBR
         RtgyedP69rIgVmCJ2WJj3oFe7yvlqAxJcgnYMQYcWg86ODCpNhquTPtZjeknRKObINNf
         kb7DxIyDr2iQBVNM+PmSuBCcHydOoNDCbzJyC+/KYPuE994J5Aee1xZB/jqu4WSMRhjL
         kIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790247797; x=1790852597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nIbhax5iMWz0Nhglod4QvaTZFTgtc4d508WTfg8CcMM=;
        b=ORXk7SKMgxCnC8Fm5aalZJ+g5sMtDMGZxUVqMSUBGb/FeL91QPuoWJhP4Qbv2+6i+l
         MTVvHVr8zB2kUGLQGXm5O9VQ53R1PfCHssfOAHn8bO9A7kExs48OAFVkMeBZrH17aupi
         gYMrh+vRqTOpnqxnO3PqAMIr7MBWbrhKZzIrJSiWUicyMuB1dUhOMixGlH7HLbkeDEXk
         QlujR+/Ch5wIc77teuLVevhcsqc6bPTN+o1r8z55WYBxKmMdfxJSBrIfY/dwUxIMJFa1
         8HenUy4eQP390UiY4EPwwVA2b9H8AN2K2VTuTZDwMy0LmVosVYD39ZHiTmfzW+1CsHwD
         E2FA==
X-Forwarded-Encrypted: i=1; AKwUvBztvG/xRWndfx/ThxPktO1MpFXzfUZ5iodrl+A09vG6VzaJfb84hQGNN4af1hU3ouj+gUEjV+1e0PVJMvs=@vger.kernel.org
X-Gm-Message-State: AFuF++mLS+AfhFMXcKKPlIieqG140LSnC2PPHe3hIIxJpNRsD9pxrwYj
	Aspzgu9VlN1Jx81uPOwVpMfPJiNyf96OgjJos0TUJBNKdZXPc29YZ7LV
X-Gm-Gg: AYBFou10fnqgScCjjPU0ymRqiz59Ufo4Q/HDt1jslio9lKO7EY2wTw7brla8ZK/Megy
	i8O4OxtdUzrRdtKki02QCsTP2zAxDaRpC5LNVBk8OppNZHvCE82ZPsOePe8XnGqaxg7V1T8YPvg
	6PaFuNmnokFWRqgDss5uDlyKhy8mauhzgdK5+CgurEodOdbNw4xLASfJk/flSg4F0b7cXXFSgVZ
	pYRiuPHN0/Wr+wnC+x3j13f2gQ7NBZdnI9KIzs9342r5YwmZvfOj/NNWCsYsP35OEwMaPiVs/Xg
	65HyprKhSj336XQbu2uopJyZ8l8uFU5whCd1LsLUjE69Zz+ORj9Ni9rArenthUcGrZUTy9XZEps
	vdfoW1dTJjOQYChc3jqu0fR/rg2Q/mLRDrWOzCKmnIqrJxArpdGAOv/Xq7rfAHLoDSowds4md6R
	TSIaTRhWVEWWxhoVgTr1Ae9mhAJeEszB1cP3hOoftu7BAQWHOrgbwXBQ==
X-Received: by 2002:a17:903:3846:b0:2dd:c100:7cc4 with SMTP id d9443c01a7336-2df7dd73ad0mr16876665ad.64.1790247796414;
        Thu, 24 Sep 2026 04:03:16 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm24724005ad.41.2026.09.24.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:03:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	bingbu.cao@intel.com,
	hverkuil@kernel.org,
	lgs201920130244@gmail.com
Subject: [PATCH] media: staging/ipu7: release ISYS firmware resources on remove
Date: Thu, 24 Sep 2026 19:03:10 +0800
Message-ID: <20260924110310.1555150-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_remove() tears down the registered ISYS devices but does not call
ipu7_fw_isys_release() after a successful probe. The probe error path
already uses this helper after ipu7_fw_isys_init() succeeds.

Without the matching release, resources initialized by
ipu7_fw_isys_init() remain allocated on normal device removal.

Call ipu7_fw_isys_release() after unregistering the ISYS devices to match
the cleanup performed by the probe error path.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index 601e5a79ef8e..a54393fbb9db 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -590,6 +590,7 @@ static void isys_remove(struct auxiliary_device *auxdev)
 
 	isys_notifier_cleanup(isys);
 	isys_unregister_devices(isys);
+	ipu7_fw_isys_release(isys);
 
 	cpu_latency_qos_remove_request(&isys->pm_qos);
 

base-commit: f03c39de3a1307371a4032757cd1732e91087c7d
-- 
2.43.0

