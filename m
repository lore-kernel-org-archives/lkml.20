Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944098;
	b=DHr+dpRw8uwrs8IUL0ls9N17xiBtuoGvcqiNm8CUBWVPI4vmQeFtTOoChegzQj5pRNa+
	 MOdSRIZb7JW3c1Hxq+ZaI7qEv8Tg04UgbfI5jRsM5mEvQ6wY4I6nQvPbPht2Mha2sKfQ8
	 Ighm+urkwVvzZM//AYHw20QsBg7HSReU3giGIRenzPnIY5p8MioL4CvbdUYGhr1D/N18y
	 rd2ayjwJQgBRUpX7tWfd+aOMiGV2p+YBP/9k6iJ35opiuqs5iBVIiblfui5JFvmmkIGoJ
	 KoCJU64/k05aAghF5ExVIq4YOKW4DKwPQQL9XALD8bms5FexI4P5boNogT6bpF4t7tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AAZ9IFW+Zz0SgqoelY4mhTjP7/bdw7XNlc/ioW2tjQU=;
	b=VINaDvXj/eptDtCp1L+RoU0epZ3hLnIzaI4bhcxN/CYzv5G2nkdNaUplizVi33ugyRZY
	 V8hzuZLRLLQ2+4m+GJbABelGaRPM7D/tgnJvoZv+d17ToW5TcQLvZywKfqx9tWucr5MzM
	 dEKWl/xasqNB2YdoIuKi04VmO2jgmyrlWXzx7ji2vqTrv6VM0aaU09Z6OWEXGqM80igp2
	 Xr02wfEqEFUOlmzkCo9olFBZntvlnjT663kD5x4ePSiqKs2uPGDAuPtLrsdba0qnHErZa
	 AV3DDGKlJnaoMrpoGsxSy39e10xyO+NT9nVHH0bzcIGPke1pfJyTXG+ZmXJjpzdUJjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONk0HDpW;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531BC606EEAF
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531BC606EEAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ONk0HDpW
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-535179e995bso2508101cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:48:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793944097; x=1794548897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAZ9IFW+Zz0SgqoelY4mhTjP7/bdw7XNlc/ioW2tjQU=;
        b=ONk0HDpWZTZzaxkSAtxiRZVFKONuE/vUvC83Dl4aQaEr3IsTawTEUDxCFznTrubGsV
         b1kaQMKgT/zzhL+D694dm/LKqMpCD+2SBbRPbNYxqlSGMWALBSD+t/3LHjwfavqiMFGA
         1g1Aobhwb8axvoY4Xt2EiRi1eOGM0DpK09+mQIDQVLhpKrfu7drRcnSO10IONIJTiryG
         3AZYH/v9roEIx1sqY+WysBwr9dP8GBwKlbwYCNt22n8pkoJLhN9lp0zhvAyX8MazcMxu
         gML8jHMex8z+ho+H0ZExqenrBXV9vZp3ItYGt2VgWyrSeNduXmQReWFmgx8M9NZa0ghU
         QUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793944097; x=1794548897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAZ9IFW+Zz0SgqoelY4mhTjP7/bdw7XNlc/ioW2tjQU=;
        b=RHtRIbGrepeH2ZvzVWa+/NPW1L5bbzqxjV9jvn5jKJNp0hcO6T29ft2+aFYlujlY9X
         I6LE+h+FCyUSN2E4//tIVAUh7t1moqe/a8DDTH2STi4KLs3iSUeqyEVFff6DSFlZg/CC
         wTTVFwSR5FPlNdtwUzqjDU8FNTX3GrLuEe/rjmm01bAluIRAYfpkrWsJvQwLAbkCouVa
         4P8Aj9JQ5HZRo+P2F3oVnFjbTWxJmLSXZJEmlRRIyrUqnCfE/lTX2UjWqXdRXasI8GEL
         1FamTpZJNBeomRuo6CSOQiPl2Mo19qm/S4No0ZUSWDYzXcivbhrcC7GA4SzBGcZ2EKKf
         iYQA==
X-Forwarded-Encrypted: i=1; AKwUvBz/3csVVb2lAgQz9F7PjfEZrJE1uDk3i/9Ciz9skFKVZjUVOzDy2tj1zblQvXNbMZSVKobdiXvsmvQoZAg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9tue90XUtLRZf/yizPWAKcopammyhC0huh67GJl6KFCTFMfAE7
	2RCwghOv5jAzUuMKD5s/JaXdrgI1ieXuPQ8uheQaoF1MzTWlB3K+beQg
X-Gm-Gg: AYBFou3k5TMXvYPCsyhHcJWGX8yJuxh/6VjoFmP9OWEBJc1loRlSmWJcT/+sKXPJVrR
	3m/PN3Uw+V+eQhNQbHdJWap4QlLbdiW2Xp4dXWqeXn9tqsEr2BQzb+OFs9gwe2oJ4ptT2dUnUWk
	6s239a39Ccs4f8g0j0XnmiTZSKnUPJWUBv+F02R2HQiOwiNJcY/6NcYX0PJNGD1dcjRIdD6n39p
	030QSFsVwdVsSEnGyxcMFxCYg7QvSmlD6qX3ozvW4NAz/g9fRb302k1PC8Gx6UTxi0g72ZWl+a9
	8jbWySRubEc8reoK5rUkcjH397MV8ReWo6e7e2lWVjst2DgtwXmh7/K03vHm0yYQbt7tn8ZljIx
	f1/eLrAmt9liwUlOrArHRfoA/KMO1DBZ9kq1wzQU8TIHJj1CvhdcELTaZCpLhjpWP3mQt0GVIc0
	Kv86ukDBoZqhzZpBm6/GzyWIgYy2yOhRQ/3xS2rZYlCGSwA1i2VFiHtx39mP1RaEz7lPRFBPfIu
	LaS9HjsmoQeAS6AWOPea2bHX6a2ZmwYHjIYeguBFhUzOB2JYr3LztKJbAMnWq97iiNz4xjY40Dd
	yBHgrfjBOZyZz+QH10ekaUWjNUQs5ptJf7wZtQLieUBupAapc5J6
X-Received: by 2002:ac8:5c8a:0:b0:535:52c:a2d6 with SMTP id d75a77b69052e-54e100e5abbmr22180261cf.3.1793944097227;
        Thu, 05 Nov 2026 21:48:17 -0800 (PST)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e26f1bd64sm11903521cf.23.2026.11.05.21.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:48:16 -0800 (PST)
From: Yuho Choi <oss.patchbox@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowangio@gmail.com>,
	Mike Christie <michael.christie@oracle.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	virtualization@lists.linux.dev,
	kvm@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] vhost-scsi: do not validate vrings during endpoint teardown
Date: Fri,  6 Nov 2026 00:48:07 -0500
Message-ID: <20261106054811.281798-2-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
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

vhost_scsi_clear_endpoint() checks every virtqueue with
vhost_vq_access_ok() before disabling the backends and waiting for
in-flight SCSI commands.  If that check fails, endpoint teardown is
skipped.

vhost_scsi_release() ignores the error and frees the vhost-scsi state.
vhost_dev_stop() drains vhost work, but it does not wait for commands
owned by the target core.  A later command or TMF completion can therefore
dereference its saved virtqueue pointer after the virtqueue has been freed.

Vring access is not a prerequisite for tearing an endpoint down.  Remove
the check so teardown always disables the backends and waits for in-flight
commands before releasing their state.

Fixes: 057cbf49a1f0 ("tcm_vhost: Initial merge for vhost level target fabric driver")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
 drivers/vhost/scsi.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
index e44044449cef..f0966f25b09a 100644
--- a/drivers/vhost/scsi.c
+++ b/drivers/vhost/scsi.c
@@ -2194,17 +2194,10 @@ vhost_scsi_clear_endpoint(struct vhost_scsi *vs,
 	struct vhost_scsi_tpg *tpg;
 	struct vhost_virtqueue *vq;
 	bool match = false;
-	int index, ret, i;
+	int ret, i;
 	u8 target;
 
 	mutex_lock(&vs->dev.mutex);
-	/* Verify that ring has been setup correctly. */
-	for (index = 0; index < vs->dev.nvqs; ++index) {
-		if (!vhost_vq_access_ok(&vs->vqs[index].vq)) {
-			ret = -EFAULT;
-			goto err_dev;
-		}
-	}
 
 	if (!vs->vs_tpg) {
 		ret = 0;
-- 
2.43.0

