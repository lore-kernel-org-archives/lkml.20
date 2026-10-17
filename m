Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39DF23DAAAA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 08:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792226653; cv=none; b=aZB8FiY6gYMAc3VQO2Ho9zJBgVIpiYOK5+jL6tNP0kN8FeO+cEKS5tUP7mOS0vIcr7XwQbdbLX4sQSAmc0Fhf/7Nmm14nDuIL8nmmF/TWjBmmUGVwW9IdTWrIMRCBsvFH6qg7xgS+wzzwSz+zBjwFQ9aWFS4wNqR1PFQkZJPm3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792226653; c=relaxed/simple;
	bh=CeTmmB6SkjqW1kmZYTNNiYnurC63zXz4RU0lrAY19I4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sn3Zy6BG2O/LS5HHNzbA81kaAPijkKJ4O4FBFVmVtz4lGafKch8CNbZ9mV0ZO8IgVNyYhPv6ovZFyIF8O0cncRRVCXHDMBrbHwR0L2cFT1hc0M2kA0ysYp9AYllRuiaidiUJTrrDiypu/ZMPy/hRi5r9De+kfw2Utq9RqkHBfjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nbB77VMl; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nbB77VMl"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9572e892dso4248345ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792226652; x=1792831452; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQTu0zIoXXKNYlyq1M861vIZFFWQktsOvYVp6+FErjA=;
        b=nbB77VMlVIIRBs24fAvHvwNpV7JIncH/yH/bTdnof4w0ZnsDv9hF+9AGCLltmTwZuz
         iVVMWZ6VcBMmvDbgXfY5eQB0LxSaXUddLL7SNryQgnqS71DXg2Xt0LD5rQlD2Biv7Ue2
         /DSGTx0Yta/3ZrzN9JUSmiGMQ4osvPBdwsanTAmjmGqRgIJUs67fgByp9cWffabO6T64
         /dB4aDmH7r3SKck8ZmMO7N9xF2WS4CK5vkcI4yoB6XZgwX+TLJQsjpBbehSz2wmrFqq2
         +jtG2JleEV3AH+TuJwhFPT6J6Q1XCQXLo/CT8lmdk7OKnQEIS0xypMC0TpKmxYMe4KmS
         /f3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792226652; x=1792831452;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQTu0zIoXXKNYlyq1M861vIZFFWQktsOvYVp6+FErjA=;
        b=EXaL3841tX9TK3URmCSpC3eKF30jirp+xLwAHjLJdbV2/uxVpRfr+fNHN2AI0uZ617
         GQUMUvWffH9G/mS4YUdHHPNEFj5KghPGBCz0VNElrZsL6utiMlTtxPY0BciZ4EYifnNk
         RaO+KybAlcqquV5SBPWs+zS1/SJZgI5AF3EauAr5NxocDeYRO6fzENtovhGKgEF3oxzH
         LIT/62p/6OSZ/05M0ybEawmwHMvXimYzmSdE0LmqS40ugQ9hWvvUCFmGkjDu3sUG3HMp
         eIzaUFY9x6NcRlxeeVDu0YNQ8aWPB2CYQoVJNqlUhY+qAfApEldr/LsBCkXHChRrhPka
         CUfg==
X-Forwarded-Encrypted: i=1; AKwUvBwrdzfwaK9/r0ctu6zMNXXuAJjVxNqDxKw5A1KrOg9isaTJvWYQI0IMQVsKFemfpPewkZTdQccpU2VhK+w=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsUZOSBPS7nnZi2ef8k4YImlVmg/K13i6LwPxS+n23GUfpdnW5
	AT6SWH/aM/DdAJLIayStM9qL0yUU8I87Ce7m8iGkBo4gz6+01dSqbCFzyugsnguRThH9doQnK8h
	GDwiW5iBBo3MsLOzZjqWGnw==
X-Received: from plcj14.prod.google.com ([2002:a17:902:f24e:b0:2e8:44b9:5c18])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e550:b0:2e2:fc90:11a4 with SMTP id d9443c01a7336-2e9a6c13c67mr20677005ad.48.1792226651334;
 Sat, 17 Oct 2026 01:44:11 -0700 (PDT)
Date: Sat, 17 Oct 2026 16:44:02 +0800
In-Reply-To: <20261017084403.875420-1-stanleyjhu@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261017084403.875420-1-stanleyjhu@google.com>
X-Mailer: git-send-email 2.56.0.176.g3575e65682-goog
Message-ID: <20261017084403.875420-4-stanleyjhu@google.com>
Subject: [PATCH v2 3/4] scsi: ufs: core: Use ufshcd_clear_outstanding_reqs()
 in ufshcd_eh_timed_out()
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ufshcd_eh_timed_out() has its own copy of the code that clears the
timed-out tag in hba->outstanding_reqs. Use
ufshcd_clear_outstanding_reqs() instead. No functional change.

Signed-off-by: Stanley Jhu <stanleyjhu@google.com>
---
 drivers/ufs/core/ufshcd.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 531309c7fb79..44e571757535 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9659,12 +9659,9 @@ static enum scsi_timeout_action ufshcd_eh_timed_out(struct scsi_cmnd *scmd)
 	 */
 	if (!test_bit(SCMD_STATE_COMPLETE, &scmd->state)) {
 		if (!hba->mcq_enabled) {
-			unsigned long flags;
 			struct request *rq = scsi_cmd_to_rq(scmd);
 
-			spin_lock_irqsave(&hba->outstanding_lock, flags);
-			__clear_bit(rq->tag, &hba->outstanding_reqs);
-			spin_unlock_irqrestore(&hba->outstanding_lock, flags);
+			ufshcd_clear_outstanding_reqs(hba, BIT(rq->tag));
 		}
 
 		if (ufshcd_is_scsi_cmd(scmd)) {
-- 
2.56.0.176.g3575e65682-goog

