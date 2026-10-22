Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640692;
	b=2+qNZMjR8MkmbDe5ZvGEaJLsFHFK9hE6YH1n0rYacHPkV0rYks8lUJlW1gIz4uptnEv3
	 g0GsgzJJvQgDCtau9bEkj+vW3+CVDVue5DXuvmS//crqUsJsRPW+U8KWp9iLGrFdkzc/M
	 wzpk2wygAx+KBnz8i/De4Po0YfiuAqc7PMa41Zp2XkRhcegpKIaxeZggZo1XCTDZ269E+
	 mIhn02u7Jsq00MyJjWtP8TpY2C51uRZL7yc6/wou26SiFVe79GVW78sy//YAJdWCEaqnD
	 R7WfC0LTphff2BMBrzAOLr6eSyDh8A6zfVJH3dlILbOoLnzHZpqhsDm/4wTHnemLemA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=dmUAl43GwZhqnKNGkW+S2KU6p3o9wRLHowPUl3QmkvM=;
	b=Z8ogzjojkSBxZZT+zCAo2tNQkfOp8VwGWzIsDGhB/5nGFFiJbrQlZBtJnp5370jK+95e
	 IIQ9I7msX1F0Tn5ldfLyBMnvJFTzD2og5kk/rnqmCReYQQnIt1QPxf3GZF48uvt4GOfH3
	 5TVDAXhyN3JMXrFDo2entGYT4NCoJNNywtq4Lns2DXl0oE6HmF9yKOr8r91wJaa1FEZHb
	 QRbr7ktC++atTMOnygM6TylrUJBgmpQcKW0rAaIFVWfb8Kn83N+qHzrBn+d+UUOE9TV7e
	 Wk8sE+ofb4M3l06vq/iWgkVkTDYGCjRitCvExkByFl6W4bUn7A/SRUQR+dTNxosAlSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Is02QbK5;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE14606A325
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCE14606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Is02QbK5
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df375fb9b2so13671795ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792640691; x=1793245491; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dmUAl43GwZhqnKNGkW+S2KU6p3o9wRLHowPUl3QmkvM=;
        b=Is02QbK5MAdnWLelVLAJTZTNDF/cK3Hq5o1cxG5ZKigyMeYidgPh0ftYpw4DSdC02j
         fiEUDX1fncegDLqO7A6fuK8c0bvfIH7fxjkiQ2la4DTrIqAied3orx7uxTxNII1OLVUn
         dQMXNQw8f/dZDXiUEnSpNsdA53wVdu5D/zk4AKeMQ6sgpx7hrxhJHRR7wpKvD/Sx8pRV
         Q91DCpWVeSn8qGkhdOvNCG7gtBBLf2zlh7qjbLy7dVecrgG69m2AEh7wM1vuQbStY24C
         oFYBx2o0zrwjhJ88BXZrgaYSGZppbOlaDDWRsCp4xog6zEPWwuMLNKmvWn/NixbLMWb5
         XYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640691; x=1793245491;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dmUAl43GwZhqnKNGkW+S2KU6p3o9wRLHowPUl3QmkvM=;
        b=SnRqgkdjgA8EBwx26gESItphZ/oQiZZKpgvYiWp8sGLEAWKpk/GgQNITsxPkR/mLrx
         0NmZMRot+VYQ6X9OudX+H8gCD/1MtsaxvQmmS3kQzj1Mi9CVSDMmwV0rJaRae5mKU0fD
         4htSbLifDRxJF1kgVT+mKMS7nBFVRHeKBF+DxGoP1LgMFbxSYfdixse68L7IjtLHO4a/
         iZZ90c78kWWs4qOTWlkhnruB0BjmrXl2IA1yDbFhkPkSnatuwInUSSMBEDEv6gtcAF/D
         UYl4PqifwfN20B2QTDDeoSaYBpoDBFvbxInpY/k/+KJdma6vXqa5NkB7GLeYwHwMZOcR
         jlyA==
X-Forwarded-Encrypted: i=1; AKwUvBy/KFpQ6frvFu7bRW5ccTio6UtsXXDTVvqUhlbXynWG6nRKoeEMhiuQV/k3fIvYKI2auy2kPBrC9R0aXRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5zY7oqIoHlip8vKhp3rjjlSAuRnKB29pLU/JwOL1BWACthTmy
	arutflVBUuACsV2fn8y9j+49ksqA0/iDbERh4TTyqOuK74qEW527vwLmwyLBgUiUOGAFLxXZfT0
	6jna4UjIRLhhJQ4j/JdHAEg==
X-Received: from plcq17.prod.google.com ([2002:a17:902:e311:b0:2e8:a577:d361])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:124d:b0:2e9:7dda:bfc7 with SMTP id d9443c01a7336-2ea4409f85fmr29606375ad.66.1792640691044;
 Wed, 21 Oct 2026 20:44:51 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:40 +0800
In-Reply-To: <20261022034443.3034432-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022034443.3034432-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022034443.3034432-4-stanleyjhu@google.com>
Subject: [PATCH v5 3/6] scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, ufshcd_clear_lu_cmds() clears the request slot in the
controller and completes the request, but leaves its bit set in
hba->outstanding_reqs. ufshcd_poll() treats a request whose bit is set
in hba->outstanding_reqs and clear in the doorbell register as finished,
so the next ufshcd_poll() completes the same request again and unmaps
its DMA buffers twice.

Clear the bit with ufshcd_clear_outstanding_reqs() before completing the
request, and complete it only if the bit was still set. If ufshcd_poll()
has already completed the request, the bit is already clear and
ufshcd_clear_lu_cmds() skips it.

Fixes: f18fac1e2b72 ("scsi: ufs: core: Rework ufshcd_eh_device_reset_handler()")
Cc: stable@vger.kernel.org
Reviewed-by: Bean Huo <beanhuo@micron.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1db572f84971..68b53f89f8c6 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7987,7 +7987,8 @@ static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
 		return true;
 	}
 
-	ufshcd_compl_one_cqe(hba, tag, NULL);
+	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)))
+		ufshcd_compl_one_cqe(hba, tag, NULL);
 	return true;
 }
 
-- 
2.56.0.218.g1ec904b173-goog

