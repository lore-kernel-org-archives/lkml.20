Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484480;
	b=Ja6WI5r1wjGhwNi+o9odepz+WHBlkFsC/1W/l2EK8Gwqy5uWh5iHDyJz5bkCTGiy7exj
	 dW5jBEBCyXM7aCImex+G2Awn/SVa7xoWmse43yPqyVrK+pnb0ZXVFeGaaYlq89P+FDQaB
	 h6NWyKDQI/WkfM8GgtqF5dfJZvbAVu/LF7FQE3hrxpWpYYFVqNiEnpoDq2oBBoCqiWL2v
	 WUcifmVxbjKTp9kLS1Vj9D4gNaJRcwPK7AjwjgxKyZDZI3AR9q7MtwnqjprHR4rGoaYxY
	 yLZAbkEzh/tMsDN43IRsFpy654XijMt15YTcPenuBhvipv0Bbd0xPZzlwn18pswoJMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YxDpnFYtRSSmHdlBVXg/Qu2h8PYtM96rKGEWJhj/F1M=;
	b=Oqisef0xqhw28S+93svcJXQn5+SjTX/iWuQsLQzTVHHjaGzyTpKQ+sx0F77wfxAJZQvb
	 Ar7tpUtC8vPftrfqp/mpzYeHb8yzT99cJyT/x3/9DRCMB/87ZGoi+STLfNC73/4fQ2j8W
	 4irWt+QiTNvkmHVS2WvZ1C6t8Erlocti6EgCKoAyuIdI/YuVdjk7o/OoqqJ996WRXcIMv
	 pnwSM+y+ZzQ7+6u6e5YACccc3rjgRzijfans6gmXzoJZeBaOmUECqLDM6swwzvDT0AmYa
	 4EPuji1eeImjZO/SFl2+wg+JRvATV/XUvzFA10Yd51lq6wcnkv4/lLzfYwW7GOWadew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JMxk7x4c;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5049860A261B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5049860A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=JMxk7x4c
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e818ca61bfso26823615ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792484479; x=1793089279; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YxDpnFYtRSSmHdlBVXg/Qu2h8PYtM96rKGEWJhj/F1M=;
        b=JMxk7x4c9c13EkDJWGRjjv5Gq7Zfra+v3x5MhbLQWSxCXqQ8ABlF8YxsYbmBe3UhPv
         qjC+91LhNCVmh+7jo+6q0YyDGc/Vf2F2g5gUOa2aFSgJmSzzpxBlQ8AXGIYKl/3PFBer
         mUb9vmRaktrIs1bwzZaVIUxERDwuEw+uHGd+Y+KDct25eneb68P7tW8JkeVwXrHzSZEy
         +9S7oO02mR0S8G9fWbBqaHCANT/SaV7Z1r4oGKClaElCmq673K/wM8i1/3j24qbnyJOY
         PYKmquKHTWoQBb97UNb2WYDpLAaXodFreO2VqBSe1YPB4BngMgo5UMG/hlemW4IXI5yi
         3uWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484479; x=1793089279;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YxDpnFYtRSSmHdlBVXg/Qu2h8PYtM96rKGEWJhj/F1M=;
        b=iFwvQtJh11t6t4GWsm7zmUOLQMwTDpg6JPl5h/+v410wYeNxXsRBxnPnF6cgEiU8T7
         fRvgJrWwwzBvet9cypFF1dvDwafQxVrRMe3wRrnxPiZmHEYr5Uv4FPIQrL7afXifZgsV
         pJev9D1N16ggTe2RswMnr2AvkiS72j8LTxJdjAg6TUhV/6xeZ7YTua5xVHklmx1rbp74
         wCyTaxywvk6mf/2KTr/OH+NS/TAq9iovyYCp6hIKg55aM+7+euAwOWj5U+8+Av3BGBSk
         v/s4Da80JQGwIZJN3vudIP9KB5k1jDzY5swVuPAIwG6KdIVbOn6GqHdZlRedg3WFUgrd
         d7rg==
X-Forwarded-Encrypted: i=1; AKwUvBzwnOU4RAD6ZbiFPJAo8xcygPySqLurXqxPD5qDxhjcyeH/znTHrrWVbk+rYiYPSUvmaWnOq8TnK6CVLhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKPa5IXwl/q28YJZ7/r4nnkcWyFhMecfOHK1irzPMA5MO+esrJM
	nAYI506zXExq0qrZ7qqm68w9zUQqGpclpQexl/yOywjE/mvpfOfSYOMAUj8r8wzCsx5zUEOTs7O
	3uWl1DfgmHb+Idgp8qGnnjg==
X-Received: from plot23.prod.google.com ([2002:a17:902:8c97:b0:2e5:82f1:b868])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1d1:b0:2dd:c100:80ba with SMTP id d9443c01a7336-2e9a6d36004mr84600175ad.53.1792484478330;
 Tue, 20 Oct 2026 01:21:18 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:21:06 +0800
In-Reply-To: <20261020082110.3511797-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020082110.3511797-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020082110.3511797-4-stanleyjhu@google.com>
Subject: [PATCH v3 3/7] scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
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
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1b28dbba03a9..778932298e27 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7978,7 +7978,8 @@ static bool ufshcd_clear_lu_cmds(struct request *req, void *priv)
 		return true;
 	}
 
-	ufshcd_compl_one_cqe(hba, tag, NULL);
+	if (ufshcd_clear_outstanding_reqs(hba, BIT(tag)))
+		ufshcd_compl_one_cqe(hba, tag, NULL);
 	return true;
 }
 
-- 
2.56.0.212.g129ede20d9-goog

