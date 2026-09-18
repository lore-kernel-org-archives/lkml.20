Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658C38E5DC
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742293; cv=none; b=iLv2KDQf27QNELkct1MlCtx3lmaOKK9N8ShWJXukT07zxE3KmSoM1st9yXV5Cl6PIh7Xa3yEI2n7s9KO2ziuhlgQjAh1Aj4xdghTYxVJBnSr8VaeLB+E0wxzvLEbKPdxY/J2b+Eznpvc+UXd6mw4r6GSgwj1Pg+Hej+n3yklYiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742293; c=relaxed/simple;
	bh=ALnEEwpHOzDzKQ5ZfKXrVVwr7CBVn2mhElkd105Nrx0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bHYx1h1kAftRn6uKwcXO/j0bQf0n7FxdJUqvgrIkVA0tzsnVVOBkf99kHoOvwPTQ3/x3ybTCz+X44UANAnZMUQDJjURq/BlRa4eYctT7IB8gMA/cWGM4KT0Hsdpkv3abUdJJI1hVgQA7RTSGElAp6OQ5eXRyQCE08Lbrs6QjOuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lsuS/gxF; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lsuS/gxF"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8688139460bso975369b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 07:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789742292; x=1790347092; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mVsKL8NE/0t29NRucsWzOF3ilHFFoLHZPjXxcOdF8T4=;
        b=lsuS/gxFWAl7XkEA0SC9M4kOw/YejZ5HGleCHtX+MU4Bp0KiW153Q6QFMTRH6jiDZ5
         zBfFGAfaWCllaLX5Ih/LcNMsVjYlhH9foyad7nQRi6Jnw+lf0Aj5NhftrgX4Pq+iv0s9
         Z7Q3o4Z6Sy5WXAwWa8oNIX0onmzPsHxzbmXs6GfXbd+RnJE0Y1d+e4TAreFhQENmPyac
         m8BYpB+MnvTm7nZk6cGNxj0SIyAM+EVxR9WZgRHai2EfJvqjK5vevS93jkNUYAYny9N0
         g+BB1OM6AOl2a9XKp76Z3IhJUe0/p6xXqq0FHP6hZ8j4jUQCTxcEol+MIB5pazwBVnRN
         u6PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742292; x=1790347092;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mVsKL8NE/0t29NRucsWzOF3ilHFFoLHZPjXxcOdF8T4=;
        b=eveGsWhizgMj8vFxl13yU92i9Pcpz6UrheJl4HsNxeLz9dK2vSlOrGH8tqGr7B/Ia2
         O4Lb+68i28p9M+HY0KNHL0Yp873X3KgjjeEkbRhMfARq0LwrojglA5vnEmGOknoBLEjr
         FesTkhKJK7pT09oowk9rheBFe5Ts6fkQzX2NAQwcHr3I6I1+X2FPMoi80qPhLayuvCY2
         RrlALZsNDuA55pZdYOoMhx++IMRtkIv6S/SQ/JtiIIO+Xy1bMWwGbE99bGSJimwnkLit
         tVkpVYHycSJt+vdA4abLrZiHXME/lXkGrzGJsi7ZUzuCG39smRxlBKIjwx/Qu1v7HKHS
         nk3g==
X-Forwarded-Encrypted: i=1; AKwUvByWuaxcKkwkXj5SBPDeHp4S4uPj1Fk/UlOMTFFzVfYgKdWoI3WAXrxlHxcOxcG2/0NbYkpyT9+dFcFCcJU=@vger.kernel.org
X-Gm-Message-State: AFuF++kMhhoa3mJfJqOvd2CnVT8wUAFtH0xBOXe1wE4VNsVVu9j8gx3g
	qW2wNdbVKvOSp2+DFGEKVwtin4BEBNncpUNnEDNzH4ypRc/AlXeo8hQHl0csST0H3rb+cAytR5i
	57LcpK579R4zuNRX22rsXeQ==
X-Received: from pfqp29.prod.google.com ([2002:aa7:9e9d:0:b0:869:37f5:4d1d])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:2913:b0:874:706d:962c with SMTP id d2e1a72fcca58-874de20be19mr5756265b3a.30.1789742291327;
 Fri, 18 Sep 2026 07:38:11 -0700 (PDT)
Date: Fri, 18 Sep 2026 22:38:06 +0800
In-Reply-To: <CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918143809.3034592-1-stanleyjhu@google.com>
Subject: [PATCH v2 0/2] scsi: ufs: core: Fix unsafe MMIO reads and redundant
 CQ sweeps in MCQ reset
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>, Bean Huo <beanhuo@micron.com>, 
	Bart Van Assche <bvanassche@acm.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Peter Wang <peter.wang@mediatek.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stanleyjhu@google.com
Content-Type: text/plain; charset="UTF-8"

During Multi-Circular Queue (MCQ) error recovery and host reset,
ufshcd_mcq_compl_pending_transfer() sweeps or polls completion queues to
reap pending transfers. Two bugs exist in this path:

1. Unsafe MMIO read and spurious errors while HCE = 0 (Patch 1/2):
   ufshcd_host_reset_and_restore() stops the controller (HCE = 0) before
   calling ufshcd_mcq_compl_all_cqes_lock(). Calling
   ufshcd_mcq_update_cq_tail_slot() at the end of the sweep reads CQTPy
   over MMIO while HCE = 0, directly contradicting the function's own
   documented contract that reading host controller registers is unsafe
   when the controller is disabled. In addition, passing expected empty
   slots during a full-ring sweep into ufshcd_mcq_process_cqe() prints
   spurious "Abnormal CQ entry!" errors.

2. Redundant per-request CQ sweeps and polls (Patch 2/2):
   ufshcd_mcq_compl_pending_transfer() runs hardware queue completion
   sweeps (force_compl == true) or CQTPy polls (force_compl == false)
   inside blk_mq_tagset_busy_iter() callbacks, repeating whole-queue
   operations once per busy request instead of once per hardware queue.

Patch 1/2 synchronizes hwq->cq_tail_slot = hwq->cq_head_slot in software
and extracts ufshcd_mcq_compl_cqe() so full-ring sweeps skip empty slots
silently. Patch 2/2 sweeps or polls each hardware queue once before
iterating residual requests and removes ufshcd_mcq_compl_one().

Changes since v1:
- Split into a two-patch series separating ring sweep safety from
  per-request tagset iteration.
- Extract ufshcd_mcq_compl_cqe() to skip empty slots without double CQE
  checks (dropped Peter Wang's v1 Reviewed-by due to this change).
- Decouple hardware queue polling/sweeping for both force_compl paths
  and remove ufshcd_mcq_compl_one().

Tested: Verified MCQ host reset, I/O completion, and queue pointer
  integrity on QEMU ARM64 without MMIO aborts or spurious error logs.

Link: https://lore.kernel.org/r/CAE14pdek6ynze+muDZrK+yNX-3ioe3vprxOA4W22qokg352tJQ@mail.gmail.com

Stanley Jhu (2):
  scsi: ufs: core: Avoid unsafe MMIO reads in
    ufshcd_mcq_compl_all_cqes_lock()
  scsi: ufs: core: Decouple CQ sweep from request iterator in MCQ

 drivers/ufs/core/ufs-mcq.c | 35 +++++++++++++++++++++++------------
 drivers/ufs/core/ufshcd.c  | 31 ++++++++++++-------------------
 2 files changed, 35 insertions(+), 31 deletions(-)

-- 
2.55.0.1082.g2b9226bbc0-goog
