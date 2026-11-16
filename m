Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794808880;
	b=K40wxnW4ym1lc2vv12Uj15v8VixKx6rRVdVVwpMOMBpD7Ls2a/bBJ4JLpaGZ7+r+R99e
	 Tv7hCckFUfUz25DXV3USN8ygCcDGsFjfu1ocGtYSDFajaWq78LTtJCOZrAaNJLs3IunY3
	 BZfhsljjze2JQeeJSYCmrREq+GCDz+dz58u678HnFvBbFwLmcbf6nBbLE8tTCX06r8TwN
	 k+WJzfgDZUPXXLB49Q53PPz9bUjD0q6Xz/ZOntm8TU2Uj6+rtsSd/+Z6y0kDbM2x1TTRk
	 UgMXRy8oAAkIxMdzHCjKry/M5a42WsiM7T1EcPozt5S7fp4214JyXXkS028qsDLU9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794808880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=nePOsiSE38oIpTj8kEKJWPw4XmKgSjPcHWo82NxSsVk=;
	b=rpr8+JxoBTkckwhzpnThIvcKu9qVGM+YhBiLdFj0FimoK0w04NEHD4WGqF/hJO6zHhNp
	 zG1i1i9dipcXuItCs8ABBzF6Iv4JUQCSk7H7ZgezlpjoQbSikKIGStqxI2EY2dT5q1K21
	 66UKjNwifjjqggc0pXH9gK1qzwN7lx174f5KHveP/POqYJ81FkqdBMotz2kLI8f3yQAJI
	 vSmuvMmSA+v5d7uXV6rHYWJNASmRHjWBNvFcahsCaqvw7m0Tx+Uh+HFC/Cp9u5lnMMj/1
	 5nOOXfIKjv+FMy5S0cemo+jDDyLiZh4f9XHJ1qQ9lTQMy9TNd+PSFKJd5IH/u4d2HeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j89hqomv;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582F606A329
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:01:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E582F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j89hqomv
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-86103aaac12so2739791a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 22:01:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808879; x=1795413679; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nePOsiSE38oIpTj8kEKJWPw4XmKgSjPcHWo82NxSsVk=;
        b=j89hqomvuimomVSu1CF3ItRhsmN5PYi9J+k35y7awl+izbLhdkQg395cbWoGtk2n9L
         YONflXRLAiEHubmjtDiAjVPf9G6EXs1rophJKA8ahTBa8UMoDB6LXRPokSgLTUOPACOF
         CFBALFog2JulqHIEdgiJJM0gJP2fOABJ8xbJ8pYuf0H3WQDalLm28dHLkSDEcru6lN4c
         t4y40b6WvXzxkGKa5YkqP5ngpJSVywwHzWu24OF7y4xXXCAmiqvb8zc5MH9o3qDV/yDH
         /Jk1/kcP+QhY/oQCRV37WesmNBuWyVPJDqBfC6TG7d3ci1sNNOKwDAY9Qn4i9luxGKJh
         NX2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808879; x=1795413679;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nePOsiSE38oIpTj8kEKJWPw4XmKgSjPcHWo82NxSsVk=;
        b=KQ8jLBLocKZzssZIiARZ0UkbnsP83jm445krFhXxPn+UpWjrUTenvET6vb2QP/O6bS
         Qc+pFZ3kO/QL0HkWQ/MlDyacmQW6QsJpT98dfYgPyOy/TSMz2MnIMkRPDB1r14pPRJA9
         NZlbmv/2rr7okS0ScRexDLgU5ZsXgz7Xkn7hwFf2pQrPQ9kMupxyWsuKcRHD/JNw2AZ5
         4+u0X4sMtF2jEySKXSll2ywxBppFwZwLDlmUdpvoN8JuSF9++pqz+ImAQ2rCt6ngDbu2
         4pmaTB52I0bc9G6CeBi7tPy9NWhG0O/0SwQ7nf45gI6k+IiMyqm+pzcNX/BVR+nsvo/a
         dHRQ==
X-Forwarded-Encrypted: i=1; AL+hErH0Uwh4iLQfxlZpzEBnQOSUJtBEKVD8J0gKXaZl8vmGmmZhSo8Dv4+TOG+HGyvomn1f7MkgbWHM+jZIW9s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BykS89TFGM+UkDts7bQhxxlobZBn5VCKzrrhFKv9RhUYMRS0d
	xfaDy3i267j9UbOsSWadWqO54ZfX/LPbbsjM2wm55p8BWFa9fcPSeHnY
X-Gm-Gg: AYBFou1G07MxRtDpzZJ75emcGiKi01E4QygOaWZlY5QyoPeB3g2cVfooUFocsA8FiP+
	L6kiDdJUHDlzNtaW/8t60w08jmreLJSR/e2c4Lb3aUShrL/t6tPqqvp6bHuo1RIWYsFOjVPfqt9
	8rMde2xtz2XAgZZT2C3N5T1BD8mybinOqHQiArIkN5XQgW9sFhQkkgOnAha0DTceh2hIine8doY
	w44AazZsxOSjBwhJ4zH4Ydy6VuzXfmh2MhXyI0M9z4RGcr2SCfipCd80gglDj+/6qIgSPkuBPqT
	1bd7HL8anjtiTCPK88ulbIJqc8bZbfcQNqDIVOuXoOr4PY48zZDlkJnpTxykpuwJTg7OWCXfMoA
	3F6mLCsMYP1debmDm1OMXhcTywxWIGuPgo7ehW+fQaMHZdiJqtFoTNjZ/0Q4HEnMnK0FtvoZ7vC
	BWeBbKCZjLI1tQseYAhFsZPg73Ee4iDZOxLHfaKpJLdRLZGN5sJal4Nn4wzM9chj/shNrtnEaph
	wAxsWQbEBAEBvfAi/kaJOAZ2MCS4gtCaCrVHVHEnJbEhsPesPTKMaxc9oPi/HA3pHRnDh319P8D
	4OnDgb9g5psINBSTxskvV+jD63iPm3KkMX3rdqPd/9z9gdESQJgPJKb4g+ggaQUxEVe1vJAWyV8
	Avz9AYjdkAfQeHEEXqcNO9/ob9gl4j1Qwl6/lfqVGHexJ+1a8BA2NrOE9SDmuV2pRHExBIQli29
	ulz9cSQ8S+v3pWGzv57jaigowySSxyOcHFSDd60K7r6U24Xla5ndc=
X-Received: by 2002:a05:6830:448e:b0:862:bb95:4148 with SMTP id 46e09a7af769-862bb954527mr1954757a34.33.1794808878766;
        Sun, 15 Nov 2026 22:01:18 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862881a965esm9375160a34.25.2026.11.15.22.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:01:18 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v6 0/7] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Sun, 15 Nov 2026 23:00:41 -0700
Message-Id: <20261115-submit-dw-axi-dma-stop-pause-v1-v6-0-bcb23d1e7029@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43SzWrDMAwA4FcpOddb/G/3tPcYO8i23HgsaZekW
 Ufpu09pGYTCyMAX+eeTsHSpBuwLDtVuc6l6nMpQDh0FZrupYgPdHllJFFeiFobz2rHhFNoysvT
 F4FxYaoEN4+HIjnAakE2cRS8zR2ssN74i5dhjLudbhte3e0zEO8ZxZucbAehl6KGLzbxFF3r8f
 P4jgZlfNIW2+u9b0ROf5f/XR6tmUTmM3KNHVC/7FsrHUzy01VzfJJaeX/cEeUZBIjNl6+WjJxc
 er9c9SZ7UOeUALhieHj219MS6p2YPQxQqCCVTePT00pPrnibPaSFB2KCtc0vvuv3t34kmabx3/
 d5gOieXJssIhzapaILQ0SXuMpdKI3l1EtwJD4AW1W12YIwNDeBuk6NUUrlayjqBztlr1MJy720
 GS99qvbVRBEclXH8AgQsj6dQCAAA=
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: Mitch Barnett <mitch@accuratesound.ca>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org, Wang YuWei <1973615295@qq.com>
X-Mailer: b4 0.17-dev

Keep cyclic mode in each descriptor so failed preparation and queued
work cannot change the completion handling of another transfer.

Use the layout-aware channel enable check during termination and retain
transfer resources when the channel does not stop. Preserve suspension
status for the pause and resume paths, including acknowledgments that
arrive after a polling timeout or during another channel's interrupt.

Keep a pending pause across cyclic segment completion and resume the
segment only after the client releases the pause. Track the active
descriptor until completion so queued work cannot reissue it while its
interrupt is pending.

Retain terminated descriptors until their callbacks have drained, including
cyclic descriptors that error handling has moved to the completed list.
Serialize interrupt status collection with channel reuse so an old event
cannot complete a replacement transfer.

This series uses the shared virt-dma descriptor-retirement helper [0].

[0] https://lore.kernel.org/r/20261115-submit-sun4i-dma-callback-lifetime-v1-v2-1-fb7d258702f8@gmail.com/

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v6:
- Retain descriptors through callback synchronization using the posted
  virt-dma helper, covering pending, executing and error-completed cyclic
  callbacks raised in Mitch's follow-up.
- Serialize interrupt status collection with channel reuse and clear old
  completion and error status after successful termination.
- Link to v5: https://patch.msgid.link/20261113-submit-dw-axi-dma-stop-pause-v1-v5-0-8523a27b5788@gmail.com

Changes in v5:
- Use a positive enabled-channel condition in the suspend-status helper,
  following Andy's review.
- Initialize the resume result immediately before its first use.
- Separate the lock-protected channel bitfields from the preceding fields.
- Link to v4: https://patch.msgid.link/20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com

Changes in v4:
- Add a preparatory fix for cyclic mode leaking between transfers,
  following Sashiko's review. Store the mode in each descriptor so
  failed preparation, error recovery and queued work cannot change
  another transfer's completion handling.
- Link to v3: https://patch.msgid.link/20261110-submit-dw-axi-dma-stop-pause-v1-v3-0-35fdfba8b61d@gmail.com

Changes in v3:
- Wrap the atomic polling calls by argument group and correct their
  continuation indentation, following Andy's review.
- Move the termination return-value check simplification into the
  channel-enable polling patch.
- Separate the pause-loop conversion to atomic polling from the
  pending-request and cyclic-restart changes.
- Annotate the suspend-wait helper with its channel-lock requirement.
- Pack the lock-protected flags into existing padding while keeping
  cyclic separately writable, following Andy's review.
- Link to v2: https://patch.msgid.link/20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com

Changes in v2:
- Use readx_poll_timeout_atomic() for the single-argument status helpers
  and express the termination polling interval and timeout in milliseconds,
  following Andy's review.
- Track pending suspend requests separately from confirmed suspension so
  resume can handle acknowledgments received after a pause timeout.
- Use the atomic polling helper, including its final status check, and
  report -EAGAIN if resume cannot yet cancel a pending suspend request.
- Defer cyclic restart while paused and track the active descriptor until
  completion, preventing resume or issue_pending from reissuing it.
- Reset pause state on successful termination and channel allocation;
  clear stale status when starting a new descriptor.
- Link to v1: https://patch.msgid.link/20261108-submit-dw-axi-dma-stop-pause-v1-v1-0-c48ec19e9ee4@gmail.com

To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
To: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>
To: Sergey Khimich <serghox@gmail.com>
To: Sia Jee Heng <jee.heng.sia@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
James Hilliard (7):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests
      dmaengine: dw-axi-dmac: retain descriptors until callbacks drain
      dmaengine: dw-axi-dmac: serialize interrupt status with channel reuse

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 183 +++++++++++++++++--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  10 +-
 2 files changed, 130 insertions(+), 63 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git fixes
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
prerequisite-patch-id: fc343480330da5ff95e5271997fa71107977c2b8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

