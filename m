Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB6F4AFE17
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 06:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872508; cv=none; b=gD9xBT1Q4hJEDrbPws7dacwzcvR5mFSFxd9t00w803vaUkfCon+01Fmom6jhE8k4++arUHTdtRvBZiA8SGXuA7mQVaM8UCV9tqf9R5tKPDzrRrzjctq+JWCeDWiB42gqul1NjrtFNaUe+/StjbCdgAD0Bn/0L20xkEvyvwsDUWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872508; c=relaxed/simple;
	bh=+0sjJp7GUck+kmSTLcqkNlFdCrd4HH0Kges/c2FpOdw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qIfCEhXBRirmaLq2oz4zQZeUMJKI14ipfq/MjIDMWDzNtM0Zl9PMqSOYzsLdviVx+QYXYdFMMQi7n2rf4eemCGIdODx/S4qugdAqvvApm+wdCSNRzGQkoCKE3EVIFSR7NoCTtewJaPPtE3mHM2VCyhgi8gyuGbqnLgbt5IPVL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=cp5cASK/; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="cp5cASK/"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso890663a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791872504; x=1792477304; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=el7un8E4JafzRvdVXq40LHzl6eMzoAXr03vHGUr2/AQ=;
        b=cp5cASK/hp8630JFZl5CV+DYLf9TE9kVVHmk+K1UK+5mNeipxp2plUx4JyWqnUlKPS
         QEuEOgQgUEo/tK8ysO6l80aS9O8R8uR5Y2NqI25XjEF8Ip879ut2UmZn6qAOTNLklACI
         0DOH2Sl73okzxlA+S4/tRcw0Icv6lBq35ElL7h1Ve4tLOq3ppLf6CxcIcCjrQhDITZbu
         jZu4VDfJyKAO1rVVso3gKatqmeWbgl7XPC4zGJw3sUP1M1fsm6V7RoN5+sFPknt4gLsE
         Mhr9476eUeNbHK71T53o5VeRNkxzgFFTf9aYARGRfHxgV0oVtdyARbYvcsoHkYC7Vuyj
         RqgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791872504; x=1792477304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=el7un8E4JafzRvdVXq40LHzl6eMzoAXr03vHGUr2/AQ=;
        b=RjIh373u85hyfyJTC+h4yxAV4L5Dkvfi/QpdX0ZWo7+oJ9bbZWQRifDIvd1DaKyrUu
         Bw39B8OaLa9UB6maeytS/pA3UwtcqTZKkmrNa7hXTHdgi2en9BirGcJweL+I/KlTwGN9
         6vy4drbo/CgxSKUVJhVAEVUqvWtq7DAfW3oioWpDI2JvA/n5PcNQAhJBhLVbhSCGRLOa
         lZ+KY/mHimGPQi7DPHPko8GO1HfeQi64mUg07gYKdzu/hOoAOLlTBIonBnEs7AvAIRzO
         fY2pA5wKo0jdD0EMq/NAeKq0yAomoQHvzh3zwB7Wmif9/4aDEmLmaVMePxZnk+Ey9nHp
         N8tg==
X-Forwarded-Encrypted: i=1; AKwUvBxk4RpcQvGTErY0GLTuI0J+hDcqiioFIyswiz7CxIv9t6Vo+BHK7fZhvLXdfLIsD4G4zu5T/PYwwZAVTS0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFLzaO436IoI+kGsc+zbCLsxy//5aGfYiOO61ZpC1bLLqPNIoz
	Pn+rNCbIbrFuXN19YodxztZGD+0hGn4IPmLd3fYv4LF8xPBtVFTSNxj2b7uaevSLY8Mb7kHMAfE
	7klMtb2VOzg==
X-Gm-Gg: AYBFou2bZckjF+g+L+whTu7of3MH9xNb1eZKx1Z6Kn9H8/nvpGlcjq8LrIjRSwDBdsj
	ECwrjUuBclg43/xd9WX4ofr1L4ozkKc1YB60OaREQ4wRELgK7UOXftDyAawvA81QMvuBkby5Tsy
	idSn1ynFmz0bQml3Mbyu3OFt7OW8LJnXQfCtgpciwryJRnlderv9y4iiwaYcyaT/y5ewPS2Kk91
	QcvDtqbSJt1D5Ac0PBaYqiwbsNkwQPeTp0I0GfZ9jAziJRBGJ6+FBAA6dP8lNIXCiprX+m8FkJL
	5TAzpfMiCgk5NtthY5qbgBgkTEeBIAuAquFDRiLbRGPIr7ibMu9bVE+tcpWeJmgJSuKiKAk3z4+
	e0J0P3Kf6zhWDIEzGkNMpCWq+y/ZVjs+KMo70kaEm1afr9YsHi5Gdtgu2HcxVPlsG644x8gRZy5
	K0sXE2yszZGD8DCK6hkEbl/cvjIjpitkp1GcBsad3U4ELay+xLUhtZXzSG+Wvn7/58/Ws6zYpKg
	FsH3g==
X-Received: by 2002:a17:90b:2784:b0:3aa:6b5d:9fe5 with SMTP id 98e67ed59e1d1-3ab3ac91446mr10249452a91.55.1791872504286;
        Mon, 12 Oct 2026 23:21:44 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32d3b4f7sm9253553a91.0.2026.10.12.23.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 23:21:43 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v6 0/2] usb: gadget: f_tcm: fix a short write infoleak and a completion-path sleep
Date: Tue, 13 Oct 2026 15:21:27 +0900
Message-ID: <20261013062129.2568405-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two fixes in the f_tcm BOT completion path, both reachable from a remote
USB host.

Patch 1 is a sleep-in-atomic that came up reviewing v4:
bot_send_bad_status() and bot_send_status() queue requests with GFP_KERNEL
from endpoint completion callbacks, which run with interrupts disabled.  It
predates the infoleak fix, so it goes first.

Patch 2 is the short write data-out infoleak this series started as: a BOT
host that sends less than it declared leaves the command buffer tail
uninitialised and f_tcm commits the full declared length to the backing
store.  It also stops the status phase from draining ep_out once the OUT
data stage is over, which otherwise wedges the bulk pipe on a failed write.

v6:
- 2/2: skip the ep_out drain whenever the OUT data stage has completed, not
  only on a short packet, so a full write the backend rejects no longer
  wedges the pipe.
  v5: split the GFP_ATOMIC fix out as patch 1/2.
  v4: keep cmd->data_len so the CSW residue stays correct; skip the drain
   with a command flag (v2/v3 cleared data_len, zeroing the residue).
  v3: https://lore.kernel.org/linux-usb/20261013015416.2503787-1-yhlee@isslab.korea.ac.kr/
  v2: https://lore.kernel.org/linux-usb/20261013005854.2470384-1-yhlee@isslab.korea.ac.kr/
  v1: https://lore.kernel.org/linux-usb/20261012154422.2436134-1-yhlee@isslab.korea.ac.kr/

Yehyeong Lee (2):
  usb: gadget: f_tcm: queue the BOT status requests with GFP_ATOMIC
  usb: gadget: f_tcm: reject a short write data-out transfer

 drivers/usb/gadget/function/f_tcm.c | 18 +++++++++++++-----
 drivers/usb/gadget/function/tcm.h   |  1 +
 2 files changed, 14 insertions(+), 5 deletions(-)


base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.43.0

