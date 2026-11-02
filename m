Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648059;
	b=Y4aSASAuBekCpsH5lUuxQCrVcICrOQv3a1st4JRpOQnl54pzOiaCdLmvuGfHkeaMueXS
	 jHuyVT+Am3645THT221eNQ5a4fYM1D9CDvgDKmR9Dasb15PuWgyA4LA5GL31Nn0F4wRTN
	 rE4wBmNOQQccMfuVjOJuMEII0Gz4gCeNebCB4Zgu68QkYirt46R25qz3WfgEhPc3+gsmi
	 S+Viy6PjLVJsL5OPqIn0RuI98ceSqjVEODc4cCO72ELyJ1BKLnKXzURV5QUuRpFqTJaHm
	 kKbzvBLyK46xfF2FbuOpY7gyohuKtV2uvZvqY5f6+o0O6P8XBZNTVmeTR5PqV2UDqOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=q+rdUxamFVww//fVRdvdICS8n134NRDCqiLcyvwJX0I=;
	b=KhExFn7v2SiGWbHXUZdks3YM9nGP+CB7r6nDstp/uSa+lsvHbo4aa5OLHQlu0a2QvBu6
	 5twVjjkbaSxDAaZsFHnfOHTm/ihRb7/a1OqEcQWHXgXAiUS1Gzx4Q6HHaKvvOlKXsPkS0
	 baoGFESYEaneb7toJJMm6zLP3B3oXjP4fQC56oqulJeg1vsL8/DBMAMOq1YJmUbFl+rQv
	 O9NCnfaJB+l4GEAEKzyA4QEJijmxdEZTnQ4y9HKcHjQvCgsojOn8p1ICHIoZpX5RHhHKu
	 QH2koKzAlJgDJPGMDhCJSKU3pTc2xyNRd8PbD4x/5MnzTfGTkESINWPob6udLhz0IEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJcPyCaG;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61CF606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61CF606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XJcPyCaG
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4b28d9537bcso2471824b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648058; x=1794252858; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=q+rdUxamFVww//fVRdvdICS8n134NRDCqiLcyvwJX0I=;
        b=XJcPyCaGwGGomr3dCjfS8r+48PC8R4Ov0Juox2GIMmm25Gn9vxey4/354LRl1tL3Pt
         2GnF1litqZBioV2H73zSi7rP8h1mYOCpB3kxcyhdhhAQN0YimkIbtTq5dNpNnrKpmWsK
         qaZOOQ7busMgL7icaRwDIZjTHCw5eSSLWluhMydSusb0OuuoBiZhAq8JQeb5S8/F8MRd
         piK0CC8kVl6BtNotGyXYfTh0kNJ6/er26T2yiyfUigJ0E+kMEUsQ3bMEkVzgxHfQSWW6
         ov07OYzRsFh0vdNIKqiyjjHw9P1RGrTX8W21vprfznWCavihOFvyfa5aY1FRoGBUX6D7
         rUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648058; x=1794252858;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=q+rdUxamFVww//fVRdvdICS8n134NRDCqiLcyvwJX0I=;
        b=FON5OdpYUxa2Pagj/SGpeVYa1M++l/usHJeN0C++NSSsINetouo/uUQVASnUCIpO5Z
         uOE/KD0n+RpgW1jehkoOk1svP//48gdvKYNRUb/xshDX/zofR9NlRACIk30tIfb0MAQ+
         AiUfmBhKSFYXpWdp36LAM07UbmpArThDhD1W9fEjzjj9ASDfWknV8/ycEdZB2GoKf4FI
         BUj22hNtra80jP8MDkhTGALcB3vDsfGbXfx0QlQaY02S3a1M+m4P3/77S6kiW3hTDUvx
         mRcz33LOip4UM1d48gY5FtaygmtgJ48Xsb+6XHaprV30/ylVk6KM0fdOSgpPew81ufga
         fDAg==
X-Forwarded-Encrypted: i=1; AKwUvBwmr/u/Yuum1lVh5qiNm0c46vF3anYuQvVMSxRZGpRiW80gmjpPCZgEnFwn2uCjIln5yMLHswhgRhHnV2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwuG+AuU5j8XoKMaWzMaeHdJ53mGM+9Ypkby0oeOdBM93aN719
	uPnVuqlt9LgXO1sUl3MEob4DZgclT6JgUXkTn1nWFSTBdtyX/rYm9KHR
X-Gm-Gg: AYBFou15xv1ZS586NLe+atWKGgy2T8/3DpvcVUAPJP1G/xsKedNdMGH+y3dCjYQzRvi
	WKL2XR98Rni/a732TiUXlouWiZyLB9uKboc4wupuca7037dfSww2jA/KXN0Ylh1Gpo84KOYdPs/
	MBuOowqUj/XG7jklhI3duNtSsYoFoULFZ5PJd3QPxa4zUmJpiSLciGb4Qdf1JkLKAieZzKcSkCD
	KsMOKJMKoOtOvv+DKs5ztvHJbyy4dMHpc4rj8/ju9ykOEWeOgl4eC5JbPfOOfrifTsI0EvU7BS7
	S+HYBbcqIt3+86HWlYUmXaMEIo7ae7Y9crSdINgta5DNhWO8J+Tdej8KLdNkQGpPpjLLf4tjakS
	rZt+bCZT7uAy+Wk5gfwgPsf/+YHzf2q6kl/tb2XzIiKY5tr1zgxqynAbCkMhGBJg9bm+F6/CTCM
	0D5PZfEkN08IwVAPpJwuqYvWKH7evaQQYDt+Hd+V2dq7Z3BeV9ChWLs4Gm7HYwIhf/HNGk4mUol
	RnIXG514B9K29TDb2cdL8nD+quKmOAmzHGZ+5GEtky6ilzRXc/1e9ppQ/QK9IgyuWVHLkwh8xGB
	fybDlQSAg15N/WgjtXzD3BOod8Qcv4UcDFP8HLdkp362gVeU3sadUQHZ96Vi0J93s8UJqZiTtBt
	0Ru9S3CEThlnhfwSngeLhmykqx7FrHlNs1lQHpNsOAJiVhCnciP/YeqNoX3fgMFOKf8aDMiG0CJ
	Irz+QljUOTVrEBBiHNwBwaqHHg216pY7vFDWEB5lGPpOoqPCo2ubI=
X-Received: by 2002:a05:6808:17a3:b0:4d6:9133:cfee with SMTP id 5614622812f47-563efc7b62cmr7343937b6e.51.1793648057640;
        Mon, 02 Nov 2026 11:34:17 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fd93451sm8558249b6e.3.2026.11.02.11.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:34:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v5 00/10] dmaengine: dw: serialize completion and
 termination
Date: Mon, 02 Nov 2026 12:34:12 -0700
Message-Id: <20261102-submit-dw-dma-synchronize-v1-v5-0-d3207758fbf9@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OwW7DIAwG4FepOM8bOJAmO+09qh0ImIRpIRNk6
 boq7z5oL1EvmeTLb9mf/itLFD0l9nq4skiLT34KOainAzODDj2Btzkz5FgLjgLSdzf6GewZ7Kg
 hXYIZ4hT8L8EigJTiTh6dFVazTHxFcv7nxp/e7zn/f5CZi1kuOp0IuqgzU1bZpND7QC/3v3wx+
 DRP8XJruIgi/bNMHgG1do0yaGtXt2/9qP3ns5lGVsosuMVwB0PgoFBKaqU1ujGPWLXFqh2sypi
 psXNcNk4ZesTkFmt3MJkxR1rKo20dNmqLrev6B+1DI33jAQAA
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

The series first serializes completion, error recovery and cookie
accounting with termination. Separate patches extract hardware-LLP
residue calculation, move it into the status getter, simplify completion
handling and report queued residue. Channel release and
device_synchronize then gain tasklet draining before the final patch
adds deferred notifications and shared completed-descriptor cleanup.

The series adapts Serge Semin's channel-restart and callback fixes [0-2].
Polling continues to advance cookies and software-LLP blocks, while client
notifications run from the controller tasklet. Synchronization preserves
pending tasklet runs from other channels.

Based on dmaengine/fixes at 6628e7d4c6b2.

[0] https://lore.kernel.org/r/20240911184710.4207-1-fancer.lancer@gmail.com
[1] https://lore.kernel.org/r/20240911184710.4207-2-fancer.lancer@gmail.com
[2] https://lore.kernel.org/r/20240911184710.4207-3-fancer.lancer@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

---
Changes in v5:
- Rebase onto dmaengine/fixes at 6628e7d4c6b2, using the shared
  dmaengine_chan_dev() helper for channel logging.
- Split residue handling into a behavior-preserving extraction, status
  calculation, scanner simplification and queued-residue reporting,
  following Frank's review.
- Share completed-descriptor freeing between the tasklet and channel
  release, retaining callbacks for normal completion and suppressing
  them during teardown. Name the helper dwc_free_completed().
- Carry Frank's additional review tags and put the submitter sign-off
  after the review tags.
- Link to v4: https://patch.msgid.link/20261029-submit-dw-dma-synchronize-v1-v4-0-fea447d9f285@gmail.com

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
James Hilliard (6):
      dmaengine: dw: serialize error recovery with channel termination
      dmaengine: dw: complete cookies before releasing the channel lock
      dmaengine: dw: simplify transfer-complete handling
      dmaengine: dw: report residue for queued transfers
      dmaengine: dw: drain the tasklet before releasing channel resources
      dmaengine: dw: synchronize completion callbacks

Serge Semin (4):
      dmaengine: dw: Fix XFER bit set, but channel not idle error
      dmaengine: dw: extract hardware-LLP residue calculation
      dmaengine: dw: calculate residue in the status getter
      dmaengine: dw: Prevent tx-status calling DMA-desc callback

 drivers/dma/dw/core.c | 301 +++++++++++++++++++++++++-------------------------
 drivers/dma/dw/regs.h |   1 +
 2 files changed, 154 insertions(+), 148 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261021-submit-dw-dma-synchronize-v1-e550f47fd1da

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

