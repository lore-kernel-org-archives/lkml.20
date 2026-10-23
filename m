Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792772852;
	b=OGfC4POLHzqu1dECA6vDh2QQsWHYYV7XtqAyqtoZg0XZ+QwxSAo3LbHIU92rtuxaGZC/
	 U34sv1u8ANI5wJ3Im7+5FkLXSpy4HUCYEcPFKrM3v4CY4C2A5utejgBiDZBw4fdq8lfya
	 8yxsqU2L2dCR8zcM0Fya2aNTskbYTYcWk/WfLGRf/kV9++zOAgqF4s57yFGGYVSbGcmhB
	 AICpS46DdxAOyJOsAHECCkKRaiYhCKCFfJ/AiBSuLl07weWTGa4TYaDnZImTErYV062Zo
	 DLqaUdlkICO9q4lZi53EX7MZR+6ZSWirfIZf2iq0zRS6o230WpiIVnhm52/Hue3MtvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792772852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=+/zx/X9tsk1dLVBvsR31HfU/sl3UhTU0gDSVw6DLPj8=;
	b=s46fXCaHJ+XORpe5gz4K5Tu2a2SJYQA7x70epr7/EWYAruztWk7Q+KLzuDDFy4Hsc7uc
	 FP180VnQAswVATzLIPXlULcFb92ExG3NGsJVzM1/3NabL3KdyU5URxvOcxzpXpiejb90l
	 q6+BnTha2QpSO8xO/F/cuHbx0JBLghp5mtyyeQ2Fr6KKptCq2XbFinVQlUUV26Yki7wWp
	 +EDNAwk1m3Z8WifeTb0RKaqd8HQfoL8iN1Jr5A1xRMC4ew/4H18JstGOa5oRpj9i1+7me
	 BxbA2/NLPyNA8BDkQleilgOqER96mHBaMNBfZ0fWuDvZVwaPlJk9rQXpzsSOZ+2yF2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d9NaW7us;
	arc=none smtp.remote-ip=209.85.161.42
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF380606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF380606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=d9NaW7us
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6df5e315bd1so698183eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792772851; x=1793377651; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+/zx/X9tsk1dLVBvsR31HfU/sl3UhTU0gDSVw6DLPj8=;
        b=d9NaW7us/EJkEp5o9nuP+8E/HIRPDHPh57QItnhXBNNowKVPDoVq9YTFagn+6S4alT
         849UzZTH0pdXYtbWYdvSEdW/VDY4V3GoLKeMIwdLfuZEyxO6EcL1oa0XF0fokD9Uxjm8
         FWMVRqOfzcYAxRQIpUCcQT9aKxfmfbLHc7G85gYelm5C+tK2jYQAlUiwrVd0ECRFeNwD
         1ZKT6qHYmNG6Tmm534QGX4rLZTVeJGy7Tdz9AvHb5TbOTh7fKStPWlJpmM875R8vJSwf
         W7Ovg0/bRN7bKl5qsgbwbFSVCdOFgB7V796y5tP5IOYZ5G3u8j7VaCQkV+3hRi10UR2o
         Pbvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792772851; x=1793377651;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+/zx/X9tsk1dLVBvsR31HfU/sl3UhTU0gDSVw6DLPj8=;
        b=e6WccG4rxQ9BZaIKyI4zOeNdMXm/4P7IDnhAWqY70uTb60pW8D571a4BzQqtxe7fWo
         Ayr745AyToHVi+U74sm3yn6n4xBYaAipWVGbYzFyVSDWLM3QE/yd1ey4a5JVgergKgNI
         0rpPLZrukKA6bf02GGAEoA34Tkap1Mjm/IJxZUCh6DXsMyl5PIe4Zj6K6XNXHCzr+RHK
         C2f+jdgzfbMi9KBwH/fJ2eVtp03duYUGluLq3gUg8Gcz4PAP+E/nm23fAZmB0nqCu0iU
         kkoAdnUvpXMgzcp2X+EWlK0YcemmRoOjjnqGotr6r417A8YkQQLC3Whf7VTweto3uBPp
         vTSw==
X-Forwarded-Encrypted: i=1; AKwUvByzSTMUK/F4wWbVFBXCy1LlRGp8BsSnrIdYCg1fjoYPJMC0ACWeS0nNAd8+gZ73306R1AyRLWwLIWgNa5A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiVYkrh8c+MuHre+Jabb18+19cTKPMG53P0U153JsHQ2fiCVUO
	GIbt4LqG2kfFLt8xPl2Dy1qY0UPNGGJuLhmaRu8UEZvj50BBl9qJcov+
X-Gm-Gg: AYBFou23yofRoYBKxAhNjZTrKmVPFl3YssaSOFtLznE5g//HtMIZwdAJKU28qFfe1uB
	T5g+V6xP0M0KUbhW1UkopzdVcNwkjk18X4GSFraAtEYTYb3hDyYXWlRgEeLghPRM+LRJ0Juh71e
	3yvZRN5Iwx4e/+pBBBDKuZ+VJvGWlW8eY5SkMgitfrxgFLA86WfSzrTOxnqd6coes9AXb6ZjQ2q
	/R4+KtYOCdz9JOEEicGF1nvjKE4TdMcdVLxvbT93kAzR5K/sxOI/Qq76jd4cQxn0EN6b8uQ2v9i
	Md3xwwH3Kiw3CyAayph+Fpxt77B34ZnGQiHHE/wIdT8HvAE1rvd3oPw0CbQuLpxQmBaNEeAJbjw
	YM1Zk2nMy8xGPGvnc0yaTETWbgMwkDJOtqjSYKqrkGZkXCgWwWG6D1hCThI8dw8SqhriSQOgq7I
	LoMxkfe1rxkRdI/xH5Do+0Qq6Bx2aouxSltG+kBX+YU3zHZfwymNKw4XM5C5Wvxqwl693JRImja
	5nDZClDm7n2KhkKqXCaVTvOoR///SjFdlzBN3/7iCD3yPhZ32xwxXF+s1Sh2pARvV0+lOiMzomz
	T4eKjOqtUogBDGka8AgEyVfj7t4tq8YqL3+ql6WLbQUgUjqyKPlbYUF3HNZ2oCc9K2MwJBiYnLd
	Ub3goIsYV8YG23c5RAUj66quPscK9WbZsFOXxwqAe84bljfBT5gevOYtZl58mCZKgV7T/AcccJT
	n4qfBf
X-Received: by 2002:a05:6820:60b:b0:6f8:fcce:a40c with SMTP id 006d021491bc7-70b88a828ffmr1837803eaf.35.1792772850706;
        Fri, 23 Oct 2026 09:27:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-70b9aed3144sm372801eaf.12.2026.10.23.09.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 09:27:28 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v3 0/4] dmaengine: dw: serialize completion and termination
Date: Fri, 23 Oct 2026 10:27:21 -0600
Message-Id: <20261023-submit-dw-dma-synchronize-v1-v3-0-c62bf048f5ce@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwQ6CMAwG4FcxO1tlE1A8+R7Gw9g6qJFhNkSR8
 O5ucPGmSS9/0375R+bREXp2XI3MYU+eWhvCbr1iqpa2QiAdMhOJyHkiOPhH2VAH+gm6keAHq2r
 XWnoj9BwwyxKT7o3mWrJA3B0aes38+bLk8H9F1UUzXpTSI5ROBiaugom2Iovb5S9c1OS71g1zw
 55H6c8yYTjk0hwyJXRu8uJUNZJuG9U2LJbpxTcmfmACEshEmmKRaiUP6hubpukDpH4zp0kBAAA
 =
X-Change-ID: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Maciej Sosnowski <maciej.sosnowski@intel.com>, 
 Dan Williams <djbw@kernel.org>, 
 Haavard Skinnemoen <haavard.skinnemoen@atmel.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

Keep client callbacks in the controller tasklet while preserving polled
completion. Serialize descriptor ownership across completion, error
recovery and termination, and wait for callbacks before a client reuses
its resources.

The first patch adapts Serge Semin's channel-restart fix [0, 2] to require
a raw transfer-complete event under the channel lock. The second handles
error recovery under the same lock. The third adapts Serge's callback
fix [1]: polling advances cookies and software-LLP blocks, while a
completion list defers notifications to the tasklet. Channel release
drains that deferred work. The fourth adds device_synchronize using
tasklet_disable()/tasklet_enable(), preserving pending runs from other
channels.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
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
James Hilliard (2):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: synchronize completion callbacks

Serge Semin (2):
      dmaengine: dw: Fix XFER bit set, but channel not idle error
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

