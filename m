Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793312989;
	b=DwCvCCEtorDCAyFKB8p7bpbxYktEtHE5rBkTEseaVWx1RMEgjHSvSreIEpJrt+rxpqWK
	 X/D6d1Zl6qxzQ7LmYOcK9eDZaBrXx6avaFSehZ73l7KqOB5jWrCWudVdMgR3+Kay8WguA
	 vmzSDFf17cb9MeANdtQGYcEMK7lZIcAbJ2gOJ3dx15pEi2krVhgVKNZ3KSNSUGgok16F7
	 W88GLLIgmkFbtoZbzOTjbAkcYuleox2UYHPVmEe6wgD1qlAiIrlWG8Ze6NcXsGwmAdaIq
	 xw87ESCi3AiKCejVm5NtrbEVvA9LkGe0eN45QcUAi+Zn9r+h6f0muCdSIBIAJdzR1Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793312989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=l+Nd+2nznLFpAVzQLOmxyyP0XOy5YVodggakhVQWjxo=;
	b=y7x7R5zHJH4hSxVroIQntqkgTEoJ56ZY0WyX5ti+LG8LubutjfSF9oLiOkBd2vfnrp+9
	 v4sy2pFofmpi7/GO1UfLpvn1g5pmVeANT3GDPmp6nNMagW25zN2DR5BmBzeN1Q4fDWZLn
	 IlUZwbpBN3iKfdoqCqV+76m2aB+pL7vOgQFTt8wVtAWh9p9qDBYOoTzgmurbB9SSmKMns
	 hWafDuDhmiG18tMZXJKrf1v5VVwMKmHKrX0YfWP5lhRLcykbJUWZsJeuCQlMwFDNvyHjX
	 bOdD7Af3gsziAXjO51kbZs+F8OuAC1qVTQXTkbepHiOJHsFvczy0f0jcG7ZPPPRzC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZ49YWc1;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA2A606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 22:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCA2A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HZ49YWc1
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8256106635eso94589a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793312988; x=1793917788; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=l+Nd+2nznLFpAVzQLOmxyyP0XOy5YVodggakhVQWjxo=;
        b=HZ49YWc122jtmUgRFpQogXEHF6w5RZ2gntHef3yrssXUttq1Z9ksdhU/Gy1NT5AkWC
         IhNquALQrI5sQjMu4GQ64LyIeg9+JCxlO19Ikt55Mi9aDc0OecuYI/JuyQNlrDhcbOwU
         wfXXMmRahf5Bp4VBE0IhBGnDOolKp/SPNyYB5Y4Zv8MmkxW6IL7b6TpmGxLXyt5GEGPr
         w+qbNCjVBH+yAFUzj2ddwqdK0bVetrJZ8wYXB29ZXP3x/G1jYVYejrLC74F1Cjqm9XF2
         d81fDnBxGNWhm3M0ktWqzHOKkF6gyUVKJsaa6Y23oBI43w09ve4Wdgl0ATI4tvq6P7Sl
         VTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793312988; x=1793917788;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l+Nd+2nznLFpAVzQLOmxyyP0XOy5YVodggakhVQWjxo=;
        b=YmkWlSJyHg2kGHR7NseI865wbvNabRvQ9mRwVO/XbRp/fNQ0NR67ksEUCZ21bv9M9w
         TCth+p+Wdly8aQj0msT2xcwLXpCGPBNJKMQREyCDc0JPwYwNg2fyRZX+w8X2vajdiDLB
         sI6gcPY+pCi8JcgqDUSPmcFZI+rkgAYqO+wv8S4JNgZAU7nphp3/qpIJbcLSQrvNqxWI
         gde3hOcXLy9OQE95pZ5pf63Pre/xhIy//RIZ0kfnYbTRnn3xLLJKgHz0pbnx09c5Ujzx
         cIo1t6Ej9uf3/LB4kA5XYZMc8/tnsqUDaZrRHybqVwvcqO+4RiLAVqLBj3h9Vo6iy0IH
         zITg==
X-Forwarded-Encrypted: i=1; AKwUvByuFFNQbWEMneenSpnvKv2hyKRF+wj3d6HvoBFWyV6olk9GskNfMyDnbCrf7hA7E85VMXCok2zks+K0ATY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyF/QOMD5302Ojln2FPE2qzZFg8AwHia6kKwxY0RQfZ+p0Q+qg
	dAt2Ly9yotiq8m4uQXf5jWFLiCXhapS2SeeHdwk5vXl8UH7PTwuxrd3r6TZ9cOGH
X-Gm-Gg: AYBFou0n4FXP07PFhL4hXc3XOaL+GTitWbkmnPb548BaqLQ5EOplMfj1bTRZQ0BgNWk
	yUO8Cl5+vH7YryZaywg+v5JA68BnUUeGh6G/scQEbWxO2RXiLNToW5PWOXyBTdfKqT+HqnIzZZi
	o+wQA3TQr8QpMkvSSXyBBXQjHd4GpmndYRaLIMEIoQ9MqYj2Um4Bju8iDND/oxoeBS+KexXJN9d
	4jbWG7Gwi5JA8tqiD61rfhCBypPuv75K0afNoN/KfzqTDopXl25gakYzESEZZyx1jZXA+fAllch
	ajZWyjKPm7ELU+rvi1RXvhAAxawNaQWusPjL5cHNfu9N5KhYkUiP/g0FFla+PNBpEXRSSZH1lO8
	eZmRJ2wcj5CBBEysqVkfsqzcHQkpwQGglteAHgYTSOSUATMsqsoLht+fJff9A6gfeHoG7+VPIhX
	+yu1Zg2un19ohLz3Rl2RDV4ocu6CJHIzxzYhGRVZvrXT7vjF0IXAMdSQgP8H9hjh1xKFtXIkmok
	lSm9BfTQ5s1ByYHwiExDpXKwJ2NwGrPfftZtWH7/tHBa2JqfIzKDxtGPyl/2oRxXkc3MchikZjW
	mFUw9Q8L8wxNREI7c8mYUlhqq+LWGIx5zzewDKZcKmZ+jQ+mD4Qa5JmgHqXCczFZD2ugN/aitwh
	+CcLbzs8GIPodVvipnbKLtyFhX0BahoIVgi1qXoQlLdg08Ehv0JLSUtOLELRkMtTFHcVgaHaMJ4
	oTtTatl+2Q7TDJcIf3EuqQBqaxPLB/qGCMLcoDtpNUnzu+BFos3TRB5KZqGEHE91LpfAyF2LIRk
	A==
X-Received: by 2002:a05:6808:199a:b0:4f7:a3f2:d8b4 with SMTP id 5614622812f47-5640de44246mr458040b6e.65.1793312987766;
        Thu, 29 Oct 2026 15:29:47 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fc49880sm236130b6e.2.2026.10.29.15.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 15:29:47 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/7] dmaengine: dw: serialize completion and termination
Date: Thu, 29 Oct 2026 16:29:34 -0600
Message-Id: <20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwW7DIAwG4FepOM8bEGBpT3uPaQcCJvG0kAqyb
 G2Vdy+0l2iXTvLlt+xP/4VlTISZHXYXlnChTFMsQT3tmBts7BHIl8wkl0ZwKSB/dyPN4H/Ajxb
 yKbohTZHOCIsA1JoH9Rq88JYV4pgw0O+Nf/+45/L/iW6uZr3obEboki1MXRUTY08RX+5/5WKgP
 E/pdGu4iCr9s0wZAcaGVjvpTTD7t3609PXsppHVMovcYvIBJoGDlkrhXnlnW/cXa7ZY8wBrCua
 M7AJXbdAOt9i6rle5PqIClgEAAA==
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2

Keep client callbacks in the controller tasklet while preserving polled
completion. Serialize descriptor ownership across completion, error
recovery and termination, and wait for callbacks before a client reuses
its resources.

The first two patches serialize channel-completion and error-recovery
handling with termination. The next two complete cookies under the channel
lock and separate residue calculation from completion processing. Channel
release and device_synchronize then gain tasklet draining before the final
patch adds the deferred completion list and tasklet-only notification.

The series adapts Serge Semin's channel-restart and callback fixes [0-2].
Polling continues to advance cookies and software-LLP blocks, while client
notifications run from the controller tasklet. Synchronization preserves
pending tasklet runs from other channels.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v4:
- Split v3's callback-deferral patch into cookie accounting, residue
  calculation, channel-release draining and callback-deferral patches,
  following Frank's review. The resulting seven-patch series preserves
  v3's final implementation.
- Place device_synchronize before callback deferral so clients can drain
  deferred notifications when the completion list is introduced.
- Carry Frank's Reviewed-by tags on the unchanged channel-completion,
  error-recovery and device_synchronize patches.
- Link to v3: https://patch.msgid.link/20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com

Changes in v3:
- Order channel-completion and error-recovery locking before callback
  deferral, retaining four patches.
- Require a locked RAW.XFER event before retiring a transfer; zero source
  residue alone cannot establish destination completion.
- Preserve polled completion and software-LLP progress in tx_status(),
  queuing client notifications for the controller tasklet.
- Serialize cookie updates with termination and report queued residue.
- Drain deferred notifications on channel release and let a pending
  tasklet return without MMIO after the last channel is released.
- Adapt Serge's two patches and retain his authorship and revision notes.
  Drop the Tested-by tags that covered their earlier implementations.
- Identify the introduction of the synchronization API in the final
  patch's Fixes tag.
- Link to v2: https://patch.msgid.link/20261022-submit-dw-dma-synchronize-v1-v2-0-5244e94dca8c@gmail.com

Changes in v2:
- Carry Serge Semin's two posted fixes before the synchronization change,
  preserving his authorship and revision notes. Add the requested stable
  Cc trailers and Andy Shevchenko's Tested-by tags to those unchanged fixes.
- Add a separate error-recovery fix for stale error status, empty channel
  lists and software-LLP state when terminating or restarting a channel.
- Use tasklet_disable()/tasklet_enable() instead of tasklet_kill() so
  synchronization preserves scheduling requests from other channels.
- Explain descriptor ownership during termination and acknowledge the
  shared-tasklet scheduling race reported by Sashiko.
- Link to v1: https://patch.msgid.link/20261021-submit-dw-dma-synchronize-v1-v1-1-6af85c2d6f69@gmail.com

Revision history from Serge's series:

Link: https://lore.kernel.org/dmaengine/20240802080756.7415-1-fancer.lancer@gmail.com/
Changelog RFC:
- Add a new patch:
  [PATCH 2/2] dmaengine: dw: Fix XFER bit set, but channel not idle error
  fixing the "XFER bit set, but channel not idle" error.
- Instead of just dropping the dwc_scan_descriptors() method invocation
  calculate the residue in the Tx-status getter.

---
James Hilliard (4):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: complete cookies before releasing the channel lock
      dmaengine: dw: drain the tasklet before releasing channel resources
      dmaengine: dw: synchronize completion callbacks

Serge Semin (3):
      dmaengine: dw: Fix XFER bit set, but channel not idle error
      dmaengine: dw: calculate residue separately from completion
      dmaengine: dw: Prevent tx-status calling DMA-desc callback

 drivers/dma/dw/core.c | 307 ++++++++++++++++++++++++++------------------------
 drivers/dma/dw/regs.h |   1 +
 2 files changed, 160 insertions(+), 148 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

