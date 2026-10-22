Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640696;
	b=F92ApQDddr1lQuCHl+gg5jpcquqWEOazVcTNe24zPBCpSRjvT0SSrP30391YTkeC+IeZ
	 Q9VAegmFovqM+jlb1i7S4Hj2QdoqDZViybf7FxXAjs21Abv6KlK2NmF1ry/ZHAIAHJAqC
	 9wXagaiTQJ32HzSEsy2fN+t3BwP03VTLKFESmfnl7Hp7si3pw03n+IlSF/sg5+/NxWvVe
	 8BjP1dM64u2tey2iuR0kSf5dYNzB1PlSzaq3ZF5cODbKYq5LyPVKTaeSePXozEgz/tq10
	 AKpTaaiGDaLmPICLG5uT9kS1uwqlNBzvbEXuN7SiZY7FRcY2gJl8jyVqUqrHl0zSC9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=wyeCvhgXetiSgOWgEdlfdPvqloG5iv8dd5YZxGSBSo0=;
	b=fN2gHm2r0JDXQO8prXUNSiTRq68m+r9GbVU7RDUy6iNAMdQEykuElz+9TRyRqLkNnEO3
	 Yd0syiOjJcgMiTCcWnBb3DhxdVQDo+CDMaLAlVJGO1go2igZBdgR71WYXzfeb4JpWRAuc
	 /JAt9b4fFffuM/ZVJRqSuN4y1YtZGPC4O2BTo0JFkiS7m0GQc03wgCZqa50pHSgF5H+Y9
	 S9W59S7laRjpqrw3Aj3itmGOd2KpxecN4OPDtK7gczB62d6eMSvzOpAti1YaW5u/TfQX1
	 NaWXsJZskfLOrvjbpnmnMo3Gq8eeddm5iS+x/CY+9IPLK5TsZuHmnkbZ4MwBOgaUedw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l0CMmSCm;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9A606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B9A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=l0CMmSCm
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so1015814b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792640695; x=1793245495; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wyeCvhgXetiSgOWgEdlfdPvqloG5iv8dd5YZxGSBSo0=;
        b=l0CMmSCm14qBoR8xhnatuEgOftDf9dDNY40Gcj05JfFgki+3BO1Wn5oIITKkebK/pN
         virN8pXjEgcbLUDmpI8m8e3rVB3b8He694YHvVDd13IB1zmE5n6FM3s0WTmUS0Sf6/7A
         WIFqcCcydYphMmX+D0TVCI/vJSba0n1Hc8umIFk+PC8+FI6Le+A1y5iAZi0iUic/vPik
         vUHfQ2S8hszGZPxVk04v4OHxlHedo8tzvhcxMLXbbRIs/cemraUOpqHnnsyK+z5A2e8b
         SypQZtrmqOaikgx3/fJqmuMDCjwYpIsLetSozItj4yKxBj/1RKkyx+O/RWzY+EZVi086
         oHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640695; x=1793245495;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wyeCvhgXetiSgOWgEdlfdPvqloG5iv8dd5YZxGSBSo0=;
        b=d0ogqwqN9wrQ9kf7SOJuhIvVwcqaceEr13dcClBpAUG28YO48C1J8uCT82Twsd9Jlu
         oXwr3Yq8cqfxowykhXBCuPLfa4x5HGTgn0z7MGGyscEAJZxz1KZSP+dr4wS1d09yMOt4
         zfm6B4yTohYPjpA7RSPNYkidQ0hGcIVykm8MCi2jDQlX0LXvK7exi/KfW7Lq2q7ag0KZ
         ytEDjfPuMznNd/EF2uVsvtzXFQ7JWxtOh6A320yp7kArx4dNs6gkuJ4X2+d/9XQ/PiQ6
         ZxaqTwnycTjDTI4i1p4XinEvnITRCGfBMKp4tPBLyMlHFZ7Q5XrrXEau+PqgVYj0cnZB
         qbtA==
X-Forwarded-Encrypted: i=1; AKwUvBzN+rByKuyKGgVMe3+bHyYtaKecMh3mhja408tGKdezQH4Yn0KAyIqqCBFNxzIYIVEtXP2CadhCttab4+Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsDa7hghYPDkwp0KcmG5CjBhINL96qOVo4jv+Pmo6c07ajJ6wf
	ESQ0L4KpQWfyaQvxXjR+/yAHj8BMkiivjeMTgXQn+92cbIio3uBUoyNNwh8/htqKoBgYpBUyfQr
	UxMtVO/+Cmn3LeiiHP5oLxg==
X-Received: from pfog20.prod.google.com ([2002:aa7:8754:0:b0:89f:4790:689a])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:27a6:b0:878:3538:8f77 with SMTP id d2e1a72fcca58-8a089e90ad8mr3311707b3a.37.1792640695103;
 Wed, 21 Oct 2026 20:44:55 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:42 +0800
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
Message-ID: <20261022034443.3034432-6-stanleyjhu@google.com>
Subject: [PATCH v5 5/6] scsi: ufs: core: Remove completed-without-interrupt
 path in ufshcd_abort()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, a command that times out right as the controller finishes
it can be completed twice:

1. The command times out and scsi_timeout() schedules ufshcd_abort().
2. The controller finishes the command and clears its doorbell bit in
   REG_UTP_TRANSFER_REQ_DOOR_BELL, while the completion handler has not
   yet cleared BIT(tag) in hba->outstanding_reqs.
3. ufshcd_abort() sees the doorbell bit clear and calls
   __ufshcd_transfer_req_compl() without clearing BIT(tag) in
   hba->outstanding_reqs.
4. The normal completion handler or the logical unit reset that follows
   sees BIT(tag) still set in hba->outstanding_reqs and completes the
   same command a second time.

This branch only exists for a rare corner case, a completion interrupt
that is lost or arrives late. Remove it to simplify the abort path and
leave such a command to the SCSI error handler, like any other command
that cannot be aborted. The cost is a slower recovery in this corner
case, which is acceptable since it only happens after a timeout.

Fixes: 169f5eb28869 ("scsi: ufs: Optimize SCSI command processing")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/fdb5c391-01ef-4a23-94c2-4f3853909348@acm.org
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ff5977f7da68..87efa2925867 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8180,15 +8180,6 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 	}
 	hba->req_abort_count++;
 
-	if (!hba->mcq_enabled && !(reg & (1 << tag))) {
-		/* only execute this code in single doorbell mode */
-		dev_err(hba->dev,
-		"%s: cmd was completed, but without a notifying intr, tag = %d",
-		__func__, tag);
-		__ufshcd_transfer_req_compl(hba, 1UL << tag);
-		goto release;
-	}
-
 	/*
 	 * Task abort to the device W-LUN is illegal. When this command
 	 * will fail, due to spec violation, scsi err handling next step
-- 
2.56.0.218.g1ec904b173-goog

