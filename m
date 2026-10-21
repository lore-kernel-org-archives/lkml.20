Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555579;
	b=HLJe4fRbW22bOEi2Y6Yade4uGpvNtsoqhaXQ09k20eAzNuA+35qsgMhbCdeir0d64GDu
	 EuVIVu0U5a0MJM8TsAWmhmKQ2r6cdByCZBqibC09ZP9xlKE65qtYTOcgbmeA6iExrPQAZ
	 YskGtbJ3p6Jvlsho32hYYxNwgtvow8m/2jKRHxbaFKNDqEmhDQpoa8voizTKbm/6BC7r3
	 kU7WShS7bFq/HdRssKoEP1fUycd/zcTQlTWQMC9L8y5VM32mX9yHe/MPZkCHhQaKBXJWO
	 Sy8+9AHZ5pAJ94XqqotlxPbyVm/HC9HrGIseoqz6P6u144KZ5HV8TGYO307DC7P0H7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555579;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=DuIIAaqvvnxnspDSWao0NwbDdlTo4WVnKM1pf0MR9Tg=;
	b=oqkWKZzK/OcHnKKGR8Q5yvw8vSPWv++MhA+WQ0MxNCJOnFNR0FBE7Fwf6NaBWVGzoV2s
	 MTwyyzkPL/jWb9QHybc8tQTaEdFmTruVVlGLJmQ2gRX2GSaYwGD7mX8sDrIQlfHGdEypg
	 e/5lRxzcnMhEVZX1u3CZGUUzg92ueWJV6QNTWDhOymh9sRQkTsFrq83zHOrjL8/HB3Fxc
	 QWPU4MFjdUAJqmiaI8MCT/oIpTq5uknfab4GUdJbUJNrY7TDCHFRE5eZNWhO/Y1RtYGfr
	 yk1B1x679mwDAvGM5zlxNz4FF8xyuTDwomUo9oCJZopYVEzTcgYbEh81sxCf9WdwWAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=unIDJ2h4;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8E606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:06:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C8E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=unIDJ2h4
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3a6d30f66c9so452150a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792555577; x=1793160377; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DuIIAaqvvnxnspDSWao0NwbDdlTo4WVnKM1pf0MR9Tg=;
        b=unIDJ2h4mOfkqFxqH3okz7KXv4lbAgWEleztl+pN62Ubi1LrgJzjSoXmnPnhxsLbkq
         YF5bfHN/1SAYZiXFOv+oGOQHWvwW/S3Yzo2YwBxzT+zOXo3PRb/vu2U2QTDCaISFO7NB
         D/qpm2+bpo0Z3jnK5ERwseNNmgu30aR9de4Ikbc2xHxxqky/NAUqL34zsi77hHYQbMkC
         Sn675aeAc0IQWwTuHFnlPoigTRc+XdcBMBL7hFU3nJvMJRXsbEu3eX7fwE9Fy9BQleMa
         LdiHlpHeETqifb3QTMoFYMOhkuwHT8t74ex5S/+DojXdzaucKfCXpxa9AHXp4hvmtkbm
         26WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555577; x=1793160377;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DuIIAaqvvnxnspDSWao0NwbDdlTo4WVnKM1pf0MR9Tg=;
        b=G0b5c5qLjfgn60mzIH6LAO4Sh58sKN/duyxLbWS61I8TXrfSH+YX11SLf09tLyp5Pv
         g/oGGcRivdocooyiZQ8ZxoadOjeQWkOz4yGLveZvk9yJVaX2UMa+9TkTCGINt0Ry9sA5
         i6AwWBAx5GRSlomNiyjL2uwVMVIAyteFbajWsIgJQcYjIN+uOZ1GzaWs+bXJfXko4+P9
         6pk8n4TyzITinrtANbCMzMAJqi7nWd/lE07rL8M1qFpJUJlz3DmT/KXgL5E1p1MIYrb6
         fT2SSQtBhetBvbuqKvMqcDFTMe84cYOxQ8DTwG1MTUAuElTDe+4GqZeTRCKb+9AdQcpg
         shWw==
X-Forwarded-Encrypted: i=1; AKwUvByi7n7LtAXsZbhXb5YL4dCE1i3Zqkx9v1TVLLJFbRbqLuSJm92Rg5oz1PIceLjcPwCXG4+eN16JHS5Uhbw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSl/exNrpAZu/Yv/4q3XKs5rr6o5PZpJ436XmpYus9MuqT6sEZ
	09RwEXAnkvgHTSSEkQWYk77sXTko2Lv5Q57d/pXTBLXDkm2U3jzhAs47L/tPvYcl3VfkuWixKTM
	yOWpxr2+bCTlredMnVEnjLQ==
X-Received: from pltk5.prod.google.com ([2002:a17:902:6945:b0:2e9:5442:b91a])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:54cb:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3ad86eed516mr440687a91.20.1792555577258;
 Tue, 20 Oct 2026 21:06:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:06:12 +0800
In-Reply-To: <20261021035450.3488805-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021035450.3488805-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021040615.3566831-1-stanleyjhu@google.com>
Subject: [PATCH v4 3/6] scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
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
2.56.0.212.g129ede20d9-goog

