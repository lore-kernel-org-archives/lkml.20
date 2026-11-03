Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679974;
	b=xDpoLqkts5BfL1VmoGWqG5oujQ6h/wCtTNzI/C+flDkJ1IYzg41jLu5Sekdj1Ngn2WNR
	 NG9U4VfceU4cz6NyqNwswJpui2oz2C+uiAyzZ4X7tmnVWjVkNqNkux8bsd7ltnyUxxOAb
	 9RdzBqmejl6iOn94orpfB0mUlyMmN83oekw3vH2QS/8BG7lZKG9ClxHUqCAw/f+HWVmvv
	 66XVeD6GJcnewIK+srXLNyS1dR/ZWILBSrxlZJKhq+OyiXUUUTRU8seHNGz9kaqIYnFtj
	 R/hzPaGgtCmcoc0Xf7lUDFxR6Iy4EE6CNPdt52jaUpRpKY9u/Ex1jlgJ2522uIb8acQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=PGfNJvt0jz4lC2WFoydgyKQ9YHvmNk2PJYm3FO57IiU=;
	b=Xq/a6YKBBOQy/lelZ6WFEzlV/nBU+iN+IbiQBPk79+Ga2QjfHUoBsFaov1bvcG702IYz
	 Nf0v6hRUow9fosu2YlppI0vyBK+2eRAPeEzxNPKwwGzZZSH4B7y9ZEoy7ttoJTcV6OUAy
	 Rs7Y+PKlKfVEO4a2tkF7j24JjsmKC+xKAIw4C3LG9OhXGrzlgXBvA0eFP8oimuC98diHj
	 QX09h8gTRfS5+ZU3w21KCk2I47YGRATszbIVjQ0fd+7czxLyxg/aOpwioih9Z68mJisrh
	 Lsh+jPgzaL434ry68BwrqBZxuhaxTZ/5gD9/6UF+8k13w7bdYOQjaoMDrgyiLHYggfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MR+8S+02;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD530606A329
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:26:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD530606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=MR+8S+02
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36637676140so5143381eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793679973; x=1794284773; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PGfNJvt0jz4lC2WFoydgyKQ9YHvmNk2PJYm3FO57IiU=;
        b=MR+8S+028NWHFOLgD3dGAo2Bjt89I6MGylX051UADfa55D890bNxI6alS/Ue0aIHSb
         T8fyf0+V9b4AvgsYPgEcgFuEPz9RzVf9FYMkerL86HGa/HCPo700Tg04YrQT/iYBIsJx
         Sozo23EspOBlk6drvIsKm8wheqxe3qwW3c0vbupsJNiheWRUgCQGRQ/lL/2gFKdmtFJn
         BvsBWOszgUO/plSfRWoy/abAFccUmt2s4/QchVQnC772lWAgmAWqHT4pjI8RhhOYbF//
         Ye/AlaoMuScFlXsYkr5GLr/bF4Iy4WoS9ZGyuEByudVdrzuWuQUK+voxOY3NrDqppUqt
         hVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679973; x=1794284773;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGfNJvt0jz4lC2WFoydgyKQ9YHvmNk2PJYm3FO57IiU=;
        b=WoMckqllO45oyHNKiC97FCMgI3Zm8N5FX/2ERFlfzbti7qwV/4Fxw+siIu5xQzUBOS
         wOA4YUXD3r/hIP4yeqSLlnvKfYiR2KYNOElsSYPWHwJxeHNCAY5Xtfj+BrPDmJYmXf8+
         ZrW3UB++DcGoBjnV7CY/o3Un5wnDeWGUsN3iY5n7REpgHs6pLp+Q8B1ac9Ze+5PwHI/V
         wc1VdNtKBKXI4WsO29ZxEfXgoxHnDBJT+KxlcKQqOlyikUunQgTeLDw+Vg1i7ktWPltU
         3VMYmc8Gmpv2L6oTdVL64JB8m0qBcwadOKDIdbKAFGkJmbqiq73iZeRlaRD+pNzU4JgM
         jvzg==
X-Forwarded-Encrypted: i=1; AKwUvBwHZlsoyZXFdPcRKYYBadrVSrXQgH6lSp3JGBcZHSE3oNEPIXrFEWrU6c9g0pBOLQMzSm8qjNzk91Mb+MI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLcpxLbp/jN+PLSfKWP3/zXwOXGPNRTAXdOEhYs130UA1kcQ++g
	Dpo8VD1TQv/H96GopJdAjCyKHR9cT714kVcSTe5LGDs4NBTS/rKlKfRRLemiFv5Ei3ntENRZFjf
	9gnalvOn/PMPfGujMZqXmJlTtVGkaibYTDw==
X-Received: from dybb7.prod.google.com ([2002:a05:693c:6087:b0:35d:1771:4816])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:c01c:10b0:36a:50ec:db3f with SMTP id 5a478bee46e88-36a50ecdd21mr16735703eec.7.1793679972480;
 Mon, 02 Nov 2026 20:26:12 -0800 (PST)
Date: Tue,  3 Nov 2026 09:56:04 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261103042608.387626-1-vamshigajjela@google.com>
Subject: [PATCH 0/3] spmi: Add SmartDV SPMI controller driver and bindings
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

This series adds Device Tree bindings and a controller driver for the
SmartDV IP Solutions MIPI System Power Management Interface (SPMI) master
controller ("smartdv,spmi").

This IP is integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga",
"google,lga-spmi") to communicate with on-board Power Management ICs
(PMICs).

The controller supports MIPI SPMI v1.0 and v2.0 non-data bus commands
(RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write, extended register
read/write, and extended register read/write long transfers up to 16 bytes.

Patch 1/3 adds the "smartdv" vendor prefix to vendor-prefixes.yaml.
Patch 2/3 documents the Device Tree bindings for the SmartDV SPMI
controller ("smartdv,spmi" and "google,lga-spmi").
Patch 3/3 adds the spmi-smartdv controller driver.

Vamshi Gajjela (3):
  dt-bindings: vendor-prefixes: Add smartdv
  dt-bindings: spmi: Add SmartDV SPMI controller
  spmi: Add SmartDV SPMI controller driver

 .../bindings/spmi/smartdv,spmi.yaml           | 126 +++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 drivers/spmi/Kconfig                          |  10 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/spmi-smartdv.c                   | 525 ++++++++++++++++++
 6 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/smartdv,spmi.yaml
 create mode 100644 drivers/spmi/spmi-smartdv.c

-- 
2.56.0.317.g454f8302e1-goog

