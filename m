Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484473;
	b=K0RENvP7sGmNmbnICGkwBcrd7ZJgVpop79VcItZ2RZnRca3PN0joYKiLsW+fT2fwOztO
	 BYQuDMog9NEFk9k7rtDfyEiP+/iv8/NcpPamirYBZtfJVxoIm7ltpy6RAJcBoY0InQCn4
	 67MHLLj4XJS8wBFICOOwlK2WMpXJLC7r+Aw62QZC73bEe517oRwmbdDG7Os6IteTWYaYV
	 +CntIQjVoJO2Z85KvTtDJHy4ws/zJHjF4hyHwSMKfqY41IZIZcu0PahGs7xkBr28DVbXh
	 Fltt6+1UEqSOVNPADRlpkk1c5snNZq2vrIyVgWhB8WsZSJzHm8QW4C+BPkntZ2g/m9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xE59jIBZZHvUjKrjm7mkHjm9YH7/I5FFkNh3MoDpP5o=;
	b=D8olTfd6EZ1ItWqsQCqFyGTw1Pk0Dawo00B8X/bfEIbDKZ57+l5jwmR1bCKzuCiqPa/v
	 xXMwS1UHwqvKd6G9nxufqJjiUhTac8yo/CSnh1SOyAWTpiJWEUIgRqTi+HEVcfjz0SFWW
	 j3qSiigYKM+eL6B9qwSFIkEPG6DBmLiIdI+1Djr0y2IkLpZ8OoidUPRuIWwNx6pgU94A6
	 CgYOQ/BEqPiUD8BYWEfob4LFj66R+99q9/RMbQD+EjJfDgTbd6MbsFGogj8wxc3giG8wT
	 J/sgJ656tz9P3t6GGNiOvwyViy0QE+V0uw9Pc5Vlsg+fiXVk/kJaqIssQpwEXwrpGoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=egqzuDqa;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A0606A323
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--stanleyjhu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=egqzuDqa
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5ca3840c5so3419855a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792484472; x=1793089272; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xE59jIBZZHvUjKrjm7mkHjm9YH7/I5FFkNh3MoDpP5o=;
        b=egqzuDqaROCxpA9wEPwuX8gFaIAR8VyfSaNwp22zn/Eqn7+TL6Qph5xBbaUimxZmJM
         N6LbIdAa2pBT+CUw/LaVFkFlcDqUGFvlpXeXlsl0+6XoJeQnvg2vRsgtbxMeGvLzW+x2
         f3JJesiR47syfW0Kl9P++l1hCIgtOofUOXxwaPs2ZUvo7XbG8SWvAnKFMUBUvKWKnjDi
         wKK1pT6VP6ZVweHGcJSpSnOGJjZvY38+vi66E/QvBnhilrBZ9ckPp/UPlYl3y7PMyusp
         0SMfOsGfgANkS1yAvUgfcS9Bl+hnjCuIHXI6ljQdseNqdY5CCXnyRz9Npax4nkRvEmav
         2VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792484472; x=1793089272;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xE59jIBZZHvUjKrjm7mkHjm9YH7/I5FFkNh3MoDpP5o=;
        b=F68QAnSIuZAJafWtw6+7PHtx71AjbEUfzOXMnccsIYca7WOvGrG3OSmUIdmdEw6yPt
         JbAdU57y5jA8pfBeHHDsSF3hVBkq+dBYTOTeg1yt1fQkk04LraYWmCtQD2mbjCdrTVUb
         Tz01FRy4njKvTYKTcTAF0RRVlOwqt4G0R9i3u4jkoss3zXBDxBXmBMbNlghhsERjlbAG
         kuRWe42JPgkwYmmcGSa+5GBXr2nnECthIenGjQ6fbt5UkOl+1BL+GlYq9nUElztr6Tw3
         2eBLYbiibLQVS0YlaEaARLGWuNxVwb0zIWU4kghip2Z5pDa/1V8asUaJZnQkjkZYN2qb
         QF9w==
X-Forwarded-Encrypted: i=1; AKwUvBz1NG07bIugbonZxkVU2olzuDPYrk3UEMrPY+uLa9AW0JG9CjoPFF165THLG4HMf4d5PiSTWiXcM1a3iw4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm/U+4SbSUQzXE9yx1m356oMtE7x+sjdmr1IYjLfEKRsvIO3fI
	aMOBGvnrA9ZnCJJgHc4j2u7eSTek5aS7zpnMf0yclUdlDHqrIC/3aZFz6me1eipqHVz2xR1i8ld
	Y2GqgrU5xVBEgDJtB4dRqng==
X-Received: from pgfd11-n1.prod.google.com ([2002:a05:6a02:654b:10b0:cc9:f487:a423])
 (user=stanleyjhu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:4903:b0:3e2:d8f:600f with SMTP id adf61e73a8af0-3e22613d7e1mr9017309637.72.1792484472121;
 Tue, 20 Oct 2026 01:21:12 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:21:03 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020082110.3511797-1-stanleyjhu@google.com>
Subject: [PATCH v3 0/7] scsi: ufs: core: Factor hba->outstanding_reqs helper
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

Patch 4 converts ufshcd_eh_timed_out() to the helper as a cleanup.

Patch 5 uses the helper return value in ufshcd_eh_timed_out() to prevent
releasing driver resources for a request already completed by another
context.

Patch 6 uses the helper in ufshcd_abort() to fix a double release in
the missing-interrupt path.

Patch 7 skips releasing reserved requests at the end of ufshcd_abort().

This series is based on mkp/for-next (db8b4d2bf2d3).

Tested on QEMU ARM64 UFS in SDB mode across LU reset, abort, and PM
timeout paths without double DMA unmaps.

Changes since v2:
- Move WARN_ONCE() removal to 1/7 and use __must_hold()/guard() (Bart).
- Add patch 5 to fix a double release in ufshcd_eh_timed_out().
- Add patch 6 to fix a double release in ufshcd_abort() (Bean, Bart).
- Add patch 7 to skip releasing reserved requests in ufshcd_abort().
- Link to v2: https://lore.kernel.org/r/20261017084403.875420-1-stanleyjhu@google.com

Stanley Jhu (7):
  scsi: ufs: core: Remove an always-false WARN_ONCE()
  scsi: ufs: core: Add a helper for clearing hba->outstanding_reqs
  scsi: ufs: core: Fix double completion in ufshcd_clear_lu_cmds()
  scsi: ufs: core: Use ufshcd_clear_outstanding_reqs() in
    ufshcd_eh_timed_out()
  scsi: ufs: core: Fix double release in ufshcd_eh_timed_out()
  scsi: ufs: core: Fix double release in ufshcd_abort()
  scsi: ufs: core: Do not release a reserved request in ufshcd_abort()

 drivers/ufs/core/ufshcd.c | 56 ++++++++++++++++++++++++---------------
 1 file changed, 35 insertions(+), 21 deletions(-)


base-commit: db8b4d2bf2d3e02b4ff78bbf69d00e11795840de
-- 
2.56.0.212.g129ede20d9-goog

