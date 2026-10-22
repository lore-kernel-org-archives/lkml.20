Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640704;
	b=Z7nHssQh4RFVq8PmTPdpv6nva8Nb8+mzU1TmoZ5kL95Pffptx5OWQajwAZSSEyWgJQDJ
	 S26xC08QfhJRnGP6mK81Xd1wC3L+Gq3k+ZAA3L3XFCbigW+EjcJQTXy7QODt+JSXBw0P1
	 kEc+xHWDwP6Xcoei651B8eb+0nI5UEruDp2+idG1wsjTu+IP1r8vtDX5YDlUPfRv8KuUb
	 PNazfqC1buBZXplJZ+xj/aZOQSPXZF4VFu/KzfMf5e9fOdEt55Ej6N45xDAv3W7/g+j9e
	 NzFqXGArtfwU+IDUsrgmhR4KRE0e0dZfc5d2iiggetQfrpWl7p3mkI/7ITsY7VKoSSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=akknKNV58WXQ7nC2UkOhMmYCn/cmxofWONSsK2knhEA=;
	b=ROQu+oF/c5/TmIk1uBsiP17d8T119r7qtZiYlU7OelqBXEF5peqoyauXG6IobJdg7Ro8
	 ldRwskyOGMoWJ9WBq4PVKMwi6VVnEUhJ3qH01ZYRKvPIvm6AHtjXEkQjQKno5h9jK+kQD
	 ixrnSWD0NhVki/Wjx43dkBWkc9nwlb6H7fwkLwye9bbHJtF8D/iUZnLuCXXddFAu9Eaw3
	 3a98wOK9EkY3rG0p06b9mdPaFLkHSjGXlHcD2nXihJliJ/7BqZhYTAx8Z+SwjWn3s9Ob2
	 +6nJ87eaX0xLh7LH01SiSELmaMCU3elx65qFOLeIUWLvWs6KkwmUdkZTyRtzijUBKtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lgF9307k;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E158F606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E158F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=lgF9307k
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dfb24dfedfso13593275ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792640693; x=1793245493; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=akknKNV58WXQ7nC2UkOhMmYCn/cmxofWONSsK2knhEA=;
        b=lgF9307k0B+RV6MQs78VnTvGLKvvUA0s01nSQSBIyTU6EC7geyYXyKYz7wOUCOYGsy
         50z3azXN+7BC7x+hHdZvnAlHQtoUAlUVblarpQ+DgfNMMYp2XnjnMpu5wwbekpIotQj2
         kPYE4ojxEoeOIMA4F1haw/8+fBkRVJ+HiRkKBl0+7vbYhClGUlQTZsw0wQzCS1tj3imL
         rTQxTX9IRzecAF0E8SaWjVYI2jw5cpt3VT/3ENSHFqEIuzGy/4lO8MaIQnCM1Sfnspo9
         H16yBbPJtHIqT5whr9L+g23RbdXH85KU5ZPkALD1Jl7RrC5yakrAyMibqoL0e61UCyWn
         JTHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640693; x=1793245493;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=akknKNV58WXQ7nC2UkOhMmYCn/cmxofWONSsK2knhEA=;
        b=y4oHG0WNA2hGvBv4CBWjzAlCr0ui7e8D0YxnAeleCWTejCa6tjCWWoTIRIaC738f4w
         Hkh00cj9SeUPlvRbFldumBoHUdGfLlF2Cn/Ut1hAotnT/Rnk+SIGkizB9YjQF/Q7WSJg
         811faLKCOItJGoZ3zneQ6CK8FbhsjBDBY4sL+Nu/nJbn/F0GfxqQeh+kTKDM/lGxLCRt
         15GOmawN9dt4/iT88jt7c5FVO7MbGphmCMgu2xFPqDWtme+7lJhqCOb4jWj6q6VD/MSU
         oIB24tkoNZtVlNbhdXI2ibRgOS8OstHW5S14Jvr2nY+/5cI7DkwjvH1eg14JXoGpK6ry
         5Dlg==
X-Forwarded-Encrypted: i=1; AKwUvBz/j3Im5Wf9L4JeHMO5vJ2g55o7mRcK4qXEnMz0zFW3JPF0aAtKTzOrrTKSsIRQzoD3dwcxwBmLQc4PMLU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVEW/JlMlTI8nXhKo1udsH0VVP+E4PnJG3oQTuvVThoatUVUbe
	mnN7XU4RNIPQiQRtqA/os1Jg0CoFjy450sIsX2rxGkINkwPivyZCtTbBXhf3OX5mhzuizC+KYRq
	wWnE+r/7xi8K2fuz4+CM0mg==
X-Received: from plso12.prod.google.com ([2002:a17:902:bccc:b0:2e5:e1dc:c5])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2b8c:b0:3ac:7c52:faeb with SMTP id 98e67ed59e1d1-3ad86d0bc21mr3695120a91.41.1792640693097;
 Wed, 21 Oct 2026 20:44:53 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:41 +0800
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
Message-ID: <20261022034443.3034432-5-stanleyjhu@google.com>
Subject: [PATCH v5 4/6] scsi: ufs: core: Fix double release in ufshcd_eh_timed_out()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In SDB mode, a command that times out during a power management
operation can be released twice:

1. The command times out while its normal completion is running.
2. The completion path clears BIT(rq->tag) in hba->outstanding_reqs and
   releases the command. It has not called scsi_done() yet, so
   SCMD_STATE_COMPLETE is still clear.
3. ufshcd_eh_timed_out() recovers the link, sees SCMD_STATE_COMPLETE
   clear, clears BIT(rq->tag) in hba->outstanding_reqs without checking
   whether it was still set, and releases the same command a second
   time.

Return SCSI_EH_DONE when ufshcd_clear_outstanding_reqs() returns 0, as
another path has already claimed the command.

Fixes: 01d5e237b339 ("scsi: ufs: core: Handle PM commands timeout before SCSI EH")
Cc: stable@vger.kernel.org
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 68b53f89f8c6..ff5977f7da68 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9660,12 +9660,10 @@ static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 	 */
 	if (!test_bit(SCMD_STATE_COMPLETE, &scmd->state)) {
 		if (!hba->mcq_enabled) {
-			unsigned long flags;
 			struct request *rq = scsi_cmd_to_rq(scmd);
 
-			spin_lock_irqsave(&hba->outstanding_lock, flags);
-			__clear_bit(rq->tag, &hba->outstanding_reqs);
-			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+			if (!ufshcd_clear_outstanding_reqs(hba, BIT(rq->tag)))
+				return SCSI_EH_DONE;
 		}
 
 		if (ufshcd_is_scsi_cmd(scmd)) {
-- 
2.56.0.218.g1ec904b173-goog

