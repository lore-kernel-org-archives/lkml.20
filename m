Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471784;
	b=tlXNzr0evWYbWmxpNphDowJKKLCeXwN7fWbAR2Um5OHvQ5CnISQ9s0oXVYUvcoaKRoAp
	 1XdNSZM1tZmkkkertGi1fnODA1gHHwT1PHqVOb02BQLR8sD+hAGJtlcBt3I8c63EoemcX
	 E73sGamUTpxdVktVUBWKCSC9fBUZIYyS6gt25BH/y8CaODiVuDgomyycrfnkrymUn10xX
	 X9i9UtZ/d9G39LRCPmZmQycK1J6Ug6GopSXqjWavv9nXkZeVDtUqBm9KZpzrqMib9H2k8
	 PCfyMco0F8yE/THTRQsHoaEm6oPuzuPRcMx0/ngJfcIs/kKYwhb8EWzFL7sWYkcrPuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=IMVMSY1N9cWE50jOBa7XB5ola70F+EY/IlZ2ZpXdsZU=;
	b=WmqhDHgzSnPsjS+Tw0l4CNzooKeUCZyV3nyQYz1/qx0jVaENJI1IQLJtyjsf+V+K2kcn
	 bliY9asMPdz81B5ium30Fq3LO1Xh0tXei39r6laGsfiXf4/HMH8pVE43modxmO/Tiw2KE
	 laYgK8aEC/Yaztf/S+st3VwanMkck9gaC6CoIXrzLkOnx3NW4BIIRl2fH5HSJzu6ZIvpx
	 4Umos0zu/0hhF7yxc0HitkQTpFDYBaQ40/9rmCr36WizLT8njDG+G9gsEmcnnSzT78W1n
	 InEmGNdHRUvQguEF2fONbCmKaXzlxSuU/qwOqU+itRaOVNBeid7UDNj1sF/homN3AQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqMmGXbQ;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06D8606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A06D8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uqMmGXbQ
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7f84a55cc06so2421679a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471782; x=1795076582; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IMVMSY1N9cWE50jOBa7XB5ola70F+EY/IlZ2ZpXdsZU=;
        b=uqMmGXbQnJ1MynnAHssFD7u504cZ7mF5/foFaj+J4vVrepxKy8NSjmFf7hWJdu9e+N
         JNh3HJ73kycnQqxXl7OKfBITf9hPqFRo0214onyeG4sZdpIccZ1BcoJuUWwM/3hyLLSt
         sTbCxMnMs5YGANaKsHVdZyZX9Tq0uQybi/EOesprykpNXvTfBfSnWMuAVlFVuMJROqBE
         Fqi3CzLKu8xaSVz4fnMcGC2etk+GX9yfGkaz2/hsFCqwWt8FrXt0TFTlxPqHh/bnaVO4
         vyHBRGr+kRpnDkefiFOM72+fLicMUUYFt8z+WrNuwrdUYzfONU0H22gFFwp4Ru2CBmWR
         038Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471782; x=1795076582;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IMVMSY1N9cWE50jOBa7XB5ola70F+EY/IlZ2ZpXdsZU=;
        b=LAuqy72j1s+PTOMAfQhUROop2EtMunrB5GRd1aVvHi5gs2G+dvoGsKwc0MLWBy90AF
         Z64IIU6YBtJ+5bwjMAasgbTl3MYG545Yby7D0PBeCrv4E0IS+PVXClEyqysF4qu6JbnB
         YalaoYUwxlWfu8yRR/s4IYHbvrwb2ytwlVzhZhoOwW7J0TVJaDDmxeQIjMzFIK/D+zpc
         pYBxBXpjj+sTyX+O/DTmgZrt4yc00BebLmHJJ9qbKi8PUOA0jWnyYxkIPcSoqPyVyoMd
         gBWDr9XE99kx8obDVOo+vVxDUnY7rV5OZ4+HNyhpFsy3eNqLH+BJr9mD7puxx+nCVPmr
         xFcg==
X-Forwarded-Encrypted: i=1; AL+hErGZ4NdJeWc8ENVXYyDG039wJL4c2+WRlpUY+eBwbZMD7PMrefQXpysK9ZSYmMIl+U50B5f3SwSBCIsNpto=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vqxAmOkvHav6rKiQ8uDytI9MFBp/eG/nKCPF/IM84myWvEmA6
	t6ZzQf0Qk2Gu5IAygZOTo0kZ5lqGySna+Xk1ig8yyg6rPeJYm3lAPxId
X-Gm-Gg: AYBFou2aShqSLPEMLcYkhYTfhJIN2nxa/tTJuHBDfogCNlbFZFNdTqfWOqUdfGM3AOJ
	4UaaJp8fU4V1JAxBwRtOSwNhLHGLnMhaDz7Av66gy5WhzkQSHh16ZF35wPuCE61urfhJX64oiNL
	qOiEVEiyvAkjzE5pDrn9tqoOyWXR+pOapoo0X5eaWx8FvvZF6gPFeiwWvo69CVnEPD9q246KbP4
	vp7ktQwH4Wb1iCL2SfYI396bJt81gDBwelPg+Is3Uy9ACpqG72UHgrsl2D+iG9UMpYTo3y4UOVi
	Fo+DGTBt3CuNGvOh945CP23EYoy9ItHPzl53rGdb40uIxu+a4QlLthyI+jmwFButyoZlFZithhC
	zj0xZlnvW02Nr2BQbzX5F0PHoaYUe8KZPTqpg9IxfIoI0YzrK6fN5Zr/Vx7W+18pncglB+65Rb+
	lRuTKeASMke27Sgm1mYas7Y8WutnnZRoeSG2A7s9vXW+zs2ey78EE1ukhEWvBimpDjOlFo9WDcP
	o0UqsJqRV8RKpXY+qb4pyvDcy8zt+emSZC+z1CttowXqrxPXUj9LEmjf5ypfv0BCPEtq6KdwjLD
	F94BD1P3fODxM1qpqZ6W6ndwHmU73lk88Po6nJFYsCC1WWCY/DEWR8BDyYgIYa697BLnvGJKLEg
	1gK4Y5SstSeGsmbJVQwIzPLm4UPeych+AZfEkCYBjQ3R8tgo6QmxUetLjvFnKoFQ6gGBqXFPfCG
	U4DZ1gdD9nE8mmV2CU97y1cZRynB8snkjjWWVnmwzR8TnDql2oQbI=
X-Received: by 2002:a05:6808:1645:b0:4e8:721f:2824 with SMTP id 5614622812f47-56b98031f11mr4803302b6e.60.1794471782468;
        Thu, 12 Nov 2026 00:23:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v4 0/5] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Thu, 12 Nov 2026 01:22:49 -0700
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTW6DMBAF4KtEXndajKnBWfUeVRb+GYOrYpBNS
 KqIu3ecbFA3qeTNs2a+eTeWMQXM7Hi4sYRryGGKFJqXA7ODjj1CcJRZXdWS86qDfDZjWMBdQF8
 DuFFDXqYZZn3OCCsHq4Tn2MqWS8VImRP6cL1f+Dw9MhFfaJfClgmjadMkHe1QvojE2IeIb489m
 hgC3Ug/95IrL9L/+9CrwDYdWq5QITYf/ajD96udRlb6rPXeU8+9mjzZaEem860Sfz2x83j13BP
 kiXfvvNGdkdztvW3bfgHG2N2aogEAAA==
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

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

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
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
James Hilliard (5):
      dmaengine: dw-axi-dmac: keep cyclic mode in the descriptor
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: use atomic polling for suspend acknowledgment
      dmaengine: dw-axi-dmac: preserve pending pause requests

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 149 ++++++++++++++++++-------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   9 +-
 2 files changed, 115 insertions(+), 43 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

