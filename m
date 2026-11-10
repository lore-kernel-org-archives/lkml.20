Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279970;
	b=up7Vgdi9TX0+xdIoeyPLCXQD1JcoSKzj6Gi+PVEIc7ID1nKhKnojWJpa3dqJOp6ZN4Hl
	 BslYl0f9mhi3hPuurOBG4FnsUZZ1uq9STYwz0gs9ibtvpVyYavjMY3HHhJw7Sw69fOkrM
	 2k56PhJ7lnuQutrxVLmkFpDE/WYhUcT/sEHHwqq5lIAtGqsOWqBCdR/8a+8Jo99gidEdI
	 RAIF7HF8gFJ9Bc94otAEjqAt9vS9ws6Luw5SuLO+I6ew+WbdAqprLSrAluZcpzI1vPas0
	 jeqDxnNNVMM/MCNleTD/8X2DD2+Nx6N7g8gbefQj1wjd2QS8Sm7tVOE3YlKPeI+HSPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=/SYARMV8I8wsqdjQWYUWZSLyGBS+FqhbkB8i/PouCPA=;
	b=fyeUE8SxYaCaEea4zdnLNL9EOZVSCvSmK9o7bYuBkCJPHHIJ9L0kPcqIIq4DMk/3NdWZ
	 GDXNcU9m5wOrQ+s1FkvG2/O1osL/wZWgDpTYwJrwj9/q9WJ+LnTT2R5lbJ3O+feVgo5sM
	 hobD4KP/0m5wPEX8FluB9Ge+7JF3X0Q1327RJEWyjiLePTlDHaedW7yTwQ3QQ4oHNeVKg
	 0J7uI0ild8FdgLsLK84ZI1PI1UKABISW3IC4FbA0/arzsjkRHDVMCzNFqK7GwS9P9jaMT
	 QWnkKubw0VuTYm7tCjcOhDdWhLM9fBoXHNWrWtvhA34J3ml2oNx2gxlFFLK373KgVuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2hZugRe;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C0B606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18C0B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2hZugRe
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-490d838b425so841183fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279969; x=1794884769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/SYARMV8I8wsqdjQWYUWZSLyGBS+FqhbkB8i/PouCPA=;
        b=X2hZugRewfOJgt4gy5Y4JYZOmHxUH8N047o0reWVoO/+9T3InzQM1JpUL3dZ8nWIOk
         OjEhESJNnXehBIqTvZvJoxqh3flahsh1fuhpD9/XnH4i7gf0sn7+S2F+BjlozaoZPNsB
         xAMWWePGkg3YIxa8s8Vxd6IsUXIrH7bWaHR6iMQ7t8qcSy26b4tsMj67iDBReK4xeB76
         ZvVs2xWNZq28VkAqaIWUBvYL5d7kK7n4l+FC7LpwuA3bc2c/TcArBw0+wkMIHCipf90P
         FNsjek7M34NRS11/J2Ccx8cV3SARTsbSW28y7CbjzHYwxU+4kWB1Iy4NypY2YnoukTch
         4mow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279969; x=1794884769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/SYARMV8I8wsqdjQWYUWZSLyGBS+FqhbkB8i/PouCPA=;
        b=xNbpRLKYDgwbnUdbbZ5hiVU8HRw2b3CeWMu5maDLH1rg9YI4ybnD0zuKP1ph0XWQss
         nOKs5upwX7VABlZNB8pdK8BrblLe7sBWUAvqx1Ly5vKrieFmU+3z1TvEIO/hggC4cDiL
         Vyk7e1OraySqEJ3v99lvdwAemLTLUWXH2IdQbcqG5TBtj2lnuzLLB7wdyalymZVwJVAX
         FrERvg9bdjdOkXmUwlNCKES8I0bBnl+eFeuiMW6tKt55lYd3/i0Aye/ZeTLLw9fWYRqt
         hHlF5MzTp2zg8h7D3ktYsGBdh6wppq/Gaw90uCapil6buuLGRxYip3TH0Bj36jgUiD4S
         aVQQ==
X-Forwarded-Encrypted: i=1; AL+hErFiXc+RxwOBMISLhCBTqu5B/lDGUeG8FbQNm/ubYs5WDzfEX+X9MNBSWFJDTSI75qeug/Pm9I17A5BZWT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z86abv90f8xwd0kea8szExps4t/Lomkn/Hag1vQ8QU9KPqoSwOP
	IrVTrso2SFw1fWdlsnjHnZ5YQ6oTKQFw+8I3EveHyGGhPVSM9gpcVlrp
X-Gm-Gg: AYBFou2xbK0lAQf8M48XqLiVV4TqN5hxqmWe4Tjm7iA8o/dz2d6ONplNR+C+tI9oIA2
	XNoXOg4Yk2snvei0DkYwKoI0zX/P05sym88kan0OjH32+M/uPRy55Z47quRx1dF4tH9p0an5vqL
	z2joJnrKx97pZaTx5TwfdnPSEpxU5sSN+4xxqI5CnDddZiovEKaXcOH2vRBfSlIl2S/s5vVQCbN
	8boeFhAqml831jIRmIx0k3iOdFZLC7ymb+mVo74IlqCAO4nuBeF+I2nGd2C5jlIZlkkSlW7eCl1
	Xre17HcoFcpJnt2wVcEvI7q2CFJr6IP+nJvBB9rNaj80QQgh8djbibDi+Ucobu+r8DhdYFApchL
	IcbL6bUFP1Ka9LmjHIaTEjj29qN72/zoV1FEBYi8GSEB4KFfHzOL60Nl065Yb9ALzC2pv//zt3F
	Vmfg/hQq/PqybIO4Al2m/uCh/iVO49gssSb5lX/cuFarPYfeOgVOMT9x/gzoUuSrQWHsnQXF6Bl
	awz9fryu8vT7Vp3hlxSKIBilN5bAsUydR3U8ujeyypwlZG/c348+YVm1J2g79wTDjcph6yq9ZzP
	1zhKPzg48x3dbBI8GkpswrIMc2XovbSrJTsOZ6wqE+iJkOEZRt4vAjBxc0CthCoS24pvPJQgBEq
	3MczaXCsHHguuQQvDeM2jhICzf10s/Y0Zn9UGmKJVcFc1N+tySN86Im5CD1do+nfwcfdmvm7rhF
	FcFHhpI1ES8/Z+RF7cTDQvpjIqEQ7F0Aj1+sekcw+wcodXoLFVyY9j
X-Received: by 2002:a05:6871:5826:b0:48f:e107:317e with SMTP id 586e51a60fabf-4ae2271656cmr758240fac.49.1794279969033;
        Mon, 09 Nov 2026 19:06:09 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22fcdc93sm683389fac.10.2026.11.09.19.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:06:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH v2 0/3] dmaengine: dw-axi-dmac: fix termination and pause
 acknowledgment
Date: Mon, 09 Nov 2026 20:05:59 -0700
Message-Id: <20261109-submit-dw-axi-dma-stop-pause-v1-v2-0-64adc48df793@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OwQ6CMBBEf8X07CpFAtST/2E4lLLAGimkBcQQ/
 t0t/IDJXmYz82ZW4dERenE/rcLhTJ56yyI+n4RptW0QqGIt4ihOpYxy8FPZ0QjVB/RCUHUa/Ng
 PMOjJI8wSjLrVErM0k6kSTBkc1rTsDc/i0Ix4oRkDNjhKzcnSaWva8GIk2oYsXo8cO1riDvfdR
 84ykP7fwxeBSXI0UqFCTB5Np+l9MX0nim3bfkDiaRwCAQAA
X-Change-ID: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

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
James Hilliard (3):
      dmaengine: dw-axi-dmac: poll the correct enable bit during termination
      dmaengine: dw-axi-dmac: retain descriptors when termination times out
      dmaengine: dw-axi-dmac: preserve pending pause requests

 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 118 ++++++++++++++++++++-----
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |   2 +
 2 files changed, 96 insertions(+), 24 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261108-submit-dw-axi-dma-stop-pause-v1-c93f1e767169

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

