Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792555582;
	b=JpeZVBSkIz2mfv82Kota5SsDzhWmZKqFueyr4ejvXqcJYUwStjsaVWl9sO/s48hlpfob
	 LdHTjV/Xi4QB6r47ZddU3yZ85CCtIsdSqoSmZ0KISZNWQPkbxeliE+6tsdtklMlbaz2JY
	 w6gZiOiuy4BwtnSG1aCUanIBIcvYfo9Ulk5cNqw04ZKrHYv6P7H3tS6ZQARsJ3JTkXkob
	 GACrfKr49jjHbIXcUiIyjSk+mB3dPscq0Tgpa1Mb3CPM8qPCBZTcuH4XvI5u8asrDjfEy
	 XLrHju2dVEDzGujwmbIdnu4hUwgnq6H9NsqFYJc20Wnql4VnimO5+pKQiViYpBiwtkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792555582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=nT/VS/RnRqL2ufemzKKyohkTbyAY8bWGEfnEEtY5EnY=;
	b=jotiPPL4BVb/ZiAWecxJr3BnHANNEt4AMTjENNyNR4KcR8hQrbZrT73pKoy4WjYp0PIB
	 kCpwHLb+NU1WqyzfeswEEWbpUPF5EXZ6jCMM7h6DLqAInzLvfIXcoJGwEJKd8b2XsYuYp
	 rQZjtGVHEK0fneaAdVbyc527mirCPVGy12/TPpShXNMEZzhV+m1fpnlltb1JFU4yVswyD
	 ggE4rM1jPdYfqQLv9e0gnRxnKgSmjDtRIJLr+RdHlXr/Hd1qmu0KFVSB093p5imVSZC9e
	 ZjFZ1agv8G08ephJSBRZmPHoaIQbZeExHZl4PFtDWlGR8vXLWghkUdEXST+zYtk9W7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=EyQJZLYJ;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A4F60A2603
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 04:06:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2A4F60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=EyQJZLYJ
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso378007a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 21:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792555581; x=1793160381; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nT/VS/RnRqL2ufemzKKyohkTbyAY8bWGEfnEEtY5EnY=;
        b=EyQJZLYJzsyDFKbh7s/0XwlNw4P7pO2/3wcRlA3lal8CrQla4lVJB+X6QX9n6pd/KW
         dEZnRNbM1nZXMoEJAwuJuGOr/H/HlgMYRH6Lb6SI5F6SLdgIvxH//9cCYtbGCcqQ1HE/
         X6tpSRNgUnZ2W/IMmUBCCwijmuckjqh9ZwgD1jnAPYtowjbvcPmlay8a1X1pL8JXTnSp
         4BhHXCtCIJvQAkybvMEcJ+SiMraxmrVLIL++JcxRqXxuSdCbofFCeETIkK/q5/AAfzot
         2x/+K081EElQHHmk0/GckW/FMu7Iyo4uGTfJ/CiXSNaPt55c0hHcN0TBnvVld5eLb//B
         4K1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792555581; x=1793160381;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nT/VS/RnRqL2ufemzKKyohkTbyAY8bWGEfnEEtY5EnY=;
        b=20Jc7LoS8qOj8Om/fL3vQKR2gqIirqdeUQEyHRiqyPTdiGBP+4VKdiiQWQbzqsqH7R
         PwTBAByCxPpHstorY7mc3YDZIDMmasSAVyJ1Y2YNLzu1+jNBcBmeeipF3o15KKHDgINy
         Adao3I5Ygl6nOy00Ko84V+6CRuWbhBYMB5TbLnFckV5k6w0Rayb/cGT3DBepiV8xoLGQ
         kB9jQTahxKooDT+Y5Nd5uNQbG04ivie5wDmIxbcvQoz8/eN1qE/LbDWv/O5qU452U33e
         3q+CQtBhFTXjTD4mPyXvF3jAG2QnFoetx3oAmS7kwRGQrb8rBibk2vYOk7hKfOEy26C0
         0QFA==
X-Forwarded-Encrypted: i=1; AKwUvBztEtsrenh7FPCXAI0xnuWamLzXpzs0YMrYZN5CHLE8dZVhsxatyFzU+radb3Cls1bWP3iHLQMYGAfyc6w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKp/GEIyjLH1WiRN0vlciHrdjiaZHBrsQo1U4Amw6NXEBw0mrOX
	gHMcXuV3YqN9J2toerY8/8lR72Z6wfYRjgnaQCT5ODQ/z4Ib6PS75lnjwmxroboYf+Ot+oVFhSN
	Y423jX28BxrQ6+8vXEbpINg==
X-Received: from pgca10-n2.prod.google.com ([2002:a05:6a02:638a:20b0:cc8:1e94:558d])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2710:b0:3ac:a7ee:6761 with SMTP id 98e67ed59e1d1-3ad86cc9140mr835137a91.21.1792555581186;
 Tue, 20 Oct 2026 21:06:21 -0700 (PDT)
Date: Wed, 21 Oct 2026 12:06:14 +0800
In-Reply-To: <20261021040615.3566831-1-stanleyjhu@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261021035450.3488805-1-stanleyjhu@google.com> <20261021040615.3566831-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261021040615.3566831-3-stanleyjhu@google.com>
Subject: [PATCH v4 5/6] scsi: ufs: core: Fix double release in ufshcd_abort()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, a timed-out command whose completion interrupt has not
been handled yet can be released twice:

1. The command times out and scsi_timeout() schedules ufshcd_abort().
2. The command finishes in hardware. Its doorbell bit is clear, but the
   completion interrupt has not been handled, so BIT(tag) is still set
   in hba->outstanding_reqs.
3. ufshcd_abort() sees the doorbell bit clear and calls
   __ufshcd_transfer_req_compl(). That releases the command but leaves
   BIT(tag) set in hba->outstanding_reqs. ufshcd_abort() returns
   FAILED.
4. The next ufshcd_poll() call, or the logical unit reset that follows
   the FAILED, sees BIT(tag) set in hba->outstanding_reqs and releases
   the same command again.

Claim BIT(tag) in hba->outstanding_reqs with
ufshcd_clear_outstanding_reqs(), release the command if it is a SCSI
command, and return SUCCESS when ufshcd_abort() claims the bit.

Fixes: 169f5eb28869 ("scsi: ufs: Optimize SCSI command processing")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/2e042211ca0ebc974ad5ec4c0de9f3f93b3c75c0.camel@iokpp.de
Suggested-by: Bean Huo <beanhuo@micron.com>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index ff5977f7da68..4f9b34c1d112 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -8185,7 +8185,11 @@ static int ufshcd_abort(struct scsi_cmnd *cmd)
 		dev_err(hba->dev,
 		"%s: cmd was completed, but without a notifying intr, tag = %d",
 		__func__, tag);
-		__ufshcd_transfer_req_compl(hba, 1UL << tag);
+		if (ufshcd_clear_outstanding_reqs(hba, BIT(tag))) {
+			if (ufshcd_is_scsi_cmd(cmd))
+				ufshcd_release_scsi_cmd(hba, cmd);
+			err = SUCCESS;
+		}
 		goto release;
 	}
 
-- 
2.56.0.212.g129ede20d9-goog

