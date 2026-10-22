Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640686;
	b=DZFavNT7JUou0ZrDvwo799noNxzMa1HeMTLEWBMUPQfUoGmCXucoaIstgassZ5X7wtxk
	 nKcqraWv0Wb6LtxkkKPXMiXANFcqh3kD5SKhJFOOB5KwRv8duuKdW4dh+YGpAlojV6bHJ
	 8sCqKMaL/uuUZayri74xJe8ZzvqB8L8am5KbrBXts1ZIdxuqBTRS3Qm3O9afcniR/3JEM
	 kmivPwhLGy/cEgIlCGg0qgdRiONOhXO4/dB//OSTWfmYZBgcmkWTYQQpRc8IO9HlHHnlI
	 yN03/DC8iI5gwO2yxsOn9fubN3cSvi5Uy0H738p10RmRRhQ/JaQfco7dCDxgJfFLznQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cAOkPWRp8YvKWUWIxl2IXJ8ilv8tHvpDegM+zVdAFT4=;
	b=y45iyMz1sFv/G9ZAMYae7jmyK6Lz+VqFRBl9NV6UXgqV336tYlhgKU/SxLfJFmizUi4/
	 8dI1/aRYFUqjlWsFOq6DUhoPDjokLMjgIGERx0HZ8fVAKk0tVEriLf25/A8XLNvMuVc8+
	 yl8lpUL3FPs8VmFBpjQgj7+xdMUF7DySHUzinCnAjLk5IhAflBEAcjhzeJpPTVWZOLgEs
	 CPCY8WrmdZL/7SeY4ZuZQAokkiZWWj22XHEzWMyjTgDbvMM+8MO6m0r8wx9qyAgu94tSh
	 Udkp8BiDIXms4BaGYi/L+QCvj9I1snD5MARbHYWGVn/tZ2SkJDmJ8XpRaw2OmHZh7Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZC7snNqo;
	arc=none smtp.remote-ip=209.85.210.198
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EA606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5EA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ZC7snNqo
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8862ed0539dso1476916b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792640685; x=1793245485; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cAOkPWRp8YvKWUWIxl2IXJ8ilv8tHvpDegM+zVdAFT4=;
        b=ZC7snNqoz/9upuvpChHKN54cnDw0ELy0L2uPW2Uwe3xOm461emWb30h4KjqdWiCjdD
         KvmuTMGWajGD7QTkkpn8fXDToMvmn1y9clydOHcTSz3PfFi2HOy5dOA78Ah86XctTJ62
         z93I8CIKebO0f3M8bUmZiC1Hnirvk+dIM4ku1ykzE5z1C5Vx2c+xFVFNV70JiCGLbVpa
         SfW8jf6+vvYrc64jxIpbc0KXlofZxbsIYnVO28i5ltQbYHEuXsabwg2LB0n4Hp3TPzBf
         KACBEVeK34ndwlGxSm1ebVnfD1BN90WEZSjv2c+anMq2jsEZkd9KSJ7nUE8HdYUA9OF6
         3jwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792640685; x=1793245485;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAOkPWRp8YvKWUWIxl2IXJ8ilv8tHvpDegM+zVdAFT4=;
        b=uUL02fTmMkbK/UmR7bAvuw/mx96pZRGYyzdE3FCGxbnmLpiarxl6OX4K2Mrc59iKin
         AR+Mqt0kjoYouANnEDKBtQIbAvS7o3yHT6eMZun6xbU+BAvQ7eYH5zvNzyMiSpoXw3SP
         qDzkr84QRZOMA9WD3/ETDsMpYqgz1NflGDqPjnLenGVudsI5GZyyimk8MSWNecC1dcej
         gwMQxUua9PVqvOFAbhsnCva9RPPWHlNgjTnu3lO7LxSyBlheIo+Dhpht9Gq0K31MLLbt
         WvmASYSzqFQmhOyw3TpoRu09iFIUI+THGZgNbcS69fdKZNqSEqyYhKtx+whpmnvf9y2Y
         tLWA==
X-Forwarded-Encrypted: i=1; AKwUvBy4PzZXeyiDxIM/7C5GIHwaQTy0rDpzr91eWznwfn7P4Mkz+40CHRG4M7TZ8kCpfbqOq4mWUzTUcdfEFI4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+sUw+jU3eLVH7rWdfZfOOmULBgNW9VgqaLR2WlwavnhC7joGp
	aUX+7gWtKTL8odorp3/mm2u25vEquhy8v/0KcG0c0JtE2iB6gTVlJUXAftmR4hpkDV/bWRLxpac
	w8e8hC+xjK4mXQ+DpoaAPlQ==
X-Received: from pfmu4.prod.google.com ([2002:aa7:8384:0:b0:89e:861c:6b1f])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3e1e:b0:881:750f:b142 with SMTP id d2e1a72fcca58-8a089d532b5mr3181649b3a.55.1792640684699;
 Wed, 21 Oct 2026 20:44:44 -0700 (PDT)
Date: Thu, 22 Oct 2026 11:44:37 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
Message-ID: <20261022034443.3034432-1-stanleyjhu@google.com>
Subject: [PATCH v5 0/6] scsi: ufs: core: Factor hba->outstanding_reqs helper
 and fix double completions
From: Stanley Jhu <stanleyjhu@google.com>
To: "Martin K . Petersen" <mkp@kernel.org>, linux-scsi@vger.kernel.org
Cc: "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	Bart Van Assche <bvanassche@acm.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bean Huo <beanhuo@micron.com>, Peter Wang <peter.wang@mediatek.com>, 
	Can Guo <can.guo@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In Single Doorbell (SDB) mode, multiple completion and error handling
paths can race on the same transfer request when bits in
hba->outstanding_reqs are not claimed atomically with completing the
request. A stale bit in hba->outstanding_reqs lets a later poll or
reset complete the request again and unmap its DMA buffers twice.

Patch 1 removes a WARN_ONCE() in ufshcd_poll() whose condition is always
false.

Patch 2 adds __ufshcd_clear_outstanding_reqs() and
ufshcd_clear_outstanding_reqs() to share the bit-claim logic across
ufshcd_poll() and ufshcd_abort() with no functional change.

Patch 3 uses the helper in ufshcd_clear_lu_cmds() to fix a double
completion during LU reset.

Patch 4 uses the helper in ufshcd_eh_timed_out() and checks its return
value to prevent releasing driver resources twice.

Patch 5 removes the completed-without-interrupt branch in ufshcd_abort()
to fix a double completion on timed-out commands.

Patch 6 skips releasing reserved requests at the end of ufshcd_abort().

This series is based on mkp/for-next (db8b4d2bf2d3).

Tested: QEMU ARM64 in SDB mode across probe, I/O, abort, LU reset, and
PM timeout paths without double completion or resource underflow.

Changes since v4:
- Patch 5/6: remove the completed-without-interrupt branch in
  ufshcd_abort() instead of claiming the request there (Bart).
- Collect Reviewed-by tags from Peter Wang on patches 4/6 and 6/6.
- Link to v4:
  https://lore.kernel.org/r/20261021035450.3488805-1-stanleyjhu@google.com

Stanley Jhu (6):
  scsi: ufs: core: Remove an always-false WARN_ONCE()
  scsi: ufs: core: Add a helper for clearing hba->outstanding_reqs
  scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
  scsi: ufs: core: Fix double release in ufshcd_eh_timed_out()
  scsi: ufs: core: Remove completed-without-interrupt path in
    ufshcd_abort()
  scsi: ufs: core: Do not release a reserved request in ufshcd_abort()

 drivers/ufs/core/ufshcd.c | 70 +++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 29 deletions(-)


base-commit: db8b4d2bf2d3e02b4ff78bbf69d00e11795840de
-- 
2.56.0.218.g1ec904b173-goog
