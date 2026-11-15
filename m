Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794765713;
	b=TbqUY0OpUwm9ErS9qjYLNicm0NzD4+VhudGtTSPBOGTHzyTGCrdL1lme/KBSzxShpuW5
	 j0z56M7ogqnecYpzV+M7F+IowPinsltasIeKb1nBxnsSq9QjTT1DzsMurqvHMjQ/Q6A4Q
	 Wkm4tQR0SrVxJJudKGbHVWjARoE9aZyTJWoFo2S9V3TkLSFhF4wlUd1UDO4wbfuzQK8oE
	 XfiY3rd3RB87zL1GlYa6UmCeJtgFyxcI+hbOXLmzr0ZfiJusOdrsuV2TYChnNxXCK/Kfm
	 uSD4I+FUA/+tF7rbwv5P3A325tCK174jtV5RQr78h/1jBtqF7tGMVifWVkawVel3mVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794765713;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
	b=rG3YK0qZUEYmof/FDQ3MefhCGgPQfCmW13OjZKO0KIxdMazzODDggDystKEfHS7CmSk+
	 oTpCaqEYAYxACSE9sHEk7bQDXkhphc7ACqNZ2jdyV51TPC3NKS8CtbF2x3yIhAXAMdpPD
	 Rx3hoom8v/rgKdGzUkqLLfNyP8huQghObUr0uEe31uWPAejaOVfcGCt0J06qi2QhAJKZE
	 i8zPYsICKv+xToHJezDX5GqeloxS/DW86o7TUTthDlpf7Hjb31mebo5z2RTxexep8Ec0N
	 iNr2nbu5pVu92TXR/Q0QNCrYxdt6TWEmhYFTv5C4nYstTy06dBDh9fLtPFKIj4Jyv3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="XtSwzx/n";
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611BC606A881
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:01:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 611BC606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vamshigajjela.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=XtSwzx/n
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b18a173e48so2163711a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794765713; x=1795370513; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
        b=XtSwzx/nbNSdABS3ofNzPUu5WUAj9iWd2sCzzx/2SYxYje2plnvtlJ40Ntr4F9uQDQ
         F7H5djy/gljmrV3UP2T0/gBiv9hrripDXokExFqWnvjsYc82tH7SkH8u41B3ARrIJDab
         /uUV+z+vW++31aC2HyzjHy2C3gezHJa6phJOp/QDDW30J8KbIWNXK9XxLjpv8XItVDvU
         WqP+7CLGRujI+nU3M99MTp++DwrALk9thWRgAECRYSev3q2Afw9kPmVOO0dDr4SNuF2r
         S0tjvlFxC7PA17mNleht6enFGXZ6yheRpoyG1HEJJfFUfjjtHD1eNllU/oimkXp3mTri
         5w/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794765713; x=1795370513;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=COi1K2R59U4ZncYnAMKGjrp6Y9UhfY1ThB0yXv686NI=;
        b=D8DbzuPBSq9PxsZvLozikvR3Ne0LHjsSXbDdkh8P/JvPPlTsPhKxqV9br3xp63KsaP
         figR6YnvWmJz9XulXPPrhBe2srjRCeI51ecwNarVK6RymZ/nK8Wc35Fnkc+BZd5w8jCJ
         ZMGr6RcXdYLgzKyGk1F9ov0MDSQAx8cAtV3LOqBJEn7X5QAy8gw47bwS6FsOrZgGRlfr
         1g8BPtBOH/M2fLLE/ihuECe6qr/HMBJ88r4zR3ivcacPOaZVmwQz0PrSMvbuQuzCb62o
         j5OYEFdB8EYDNzTRLvxgQXnI5fSJEE9IyA1kmmDgOOZupFrUZgNPG1WR7bd4jeEVgPb7
         ojcg==
X-Forwarded-Encrypted: i=1; AL+hErFdlxSbgHkVd8J4987hWyI4goWEa9xhq/wVb3oI9eawANt3cP7ns3g5ps2SppsxND7dt397C7WRK6Wd3vM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZBBIdXdJfyzWBo0qM+z/tiVh1iZeimAyMTlGbkGIkEPbUA2WF
	T19G6KehCCtSR/Rm7ZbGkGttDU1JbwmUj3F8fizlNuLPP7Kf4gJI9T0ToGqgCl6ij97wgjryC5o
	rBJDi/0Ha7NqVbsWdScHFahh4sA3gN/vqjw==
X-Received: from pjyq1.prod.google.com ([2002:a17:90a:e081:b0:3b0:99cf:4070])
 (user=vamshigajjela job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2246:b0:3a4:945e:bc33 with SMTP id 98e67ed59e1d1-3b1b0ba1c76mr7285600a91.47.1794765712405;
 Sun, 15 Nov 2026 10:01:52 -0800 (PST)
Date: Sun, 15 Nov 2026 23:31:45 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261115180147.1208082-1-vamshigajjela@google.com>
Subject: [PATCH v2 0/2] spmi: Add SmartDV SPMI controller driver and bindings
From: vamshi gajjela <vamshigajjela@google.com>
To: Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: "=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=" <u.kleine-koenig@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Peter Griffin <peter.griffin@linaro.org>, 
	"=?UTF-8?q?Andr=C3=A9=20Draszik?=" <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Jim Wylder <jwylder@google.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Vamshi Gajjela <vamshigajjela@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Vamshi Gajjela <vamshigajjela@google.com>

This series adds Device Tree bindings and a controller driver for the
SmartDV Technologies MIPI System Power Management Interface (SPMI) master
controller.

This IP is integrated in Google Tensor SoCs starting with the G5
generation (codename: laguna, canonically written as "lga",
"google,lga-spmi") to communicate with on-board Power Management ICs
(PMICs).

The controller supports MIPI SPMI v1.0 and v2.0 non-data bus commands
(RESET, SLEEP, SHUTDOWN, WAKEUP), register read/write, extended register
read/write, and extended register read/write long transfers up to 16 bytes.

Patch 1/2 documents the Device Tree bindings for the Google LGA SmartDV
SPMI controller ("google,lga-spmi").
Patch 2/2 adds the spmi-smartdv controller driver.

Changes in v2:
- Dropped v1 patch 1/3 (vendor-prefixes.yaml) since no "smartdv,*"
  compatibles or properties remain in Device Tree.
- Dropped standalone and fallback "smartdv,spmi" compatible; use only the
  SoC-specific "google,lga-spmi" compatible and renamed the binding to
  google,lga-spmi.yaml (Conor Dooley).
- Dropped all seven "smartdv,*" DT properties and moved the per-SoC
  CONTROL register parameters into of_device_id match data
  (struct smartdv_spmi_config) in spmi-smartdv.c (Conor Dooley,
  Krzysztof Kozlowski).
- Dropped "clock-frequency" and free-form clock text; made "clocks" and
  "resets" required alongside "compatible" and "reg", and switched the
  driver to devm_clk_get_enabled() and
  devm_reset_control_get_exclusive_deasserted() (Conor Dooley,
  Krzysztof Kozlowski).
- Updated company name in descriptions/Kconfig to "SmartDV Technologies"
  (Krzysztof Kozlowski).
- Removed <linux/mod_devicetable.h> include and changed sentinel to "{ }"
  in smartdv_spmi_of_match[] (Uwe Kleine-Koenig).

Link: https://lore.kernel.org/lkml/20261103042608.387626-1-vamshigajjela@google.com/

Vamshi Gajjela (2):
  dt-bindings: spmi: Add Google LGA SPMI controller
  spmi: Add SmartDV SPMI controller driver

 .../bindings/spmi/google,lga-spmi.yaml        |  56 ++
 MAINTAINERS                                   |   7 +
 drivers/spmi/Kconfig                          |  10 +
 drivers/spmi/Makefile                         |   1 +
 drivers/spmi/spmi-smartdv.c                   | 488 ++++++++++++++++++
 5 files changed, 562 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/google,lga-spmi.yaml
 create mode 100644 drivers/spmi/spmi-smartdv.c

-- 
2.56.0.611.g1030f0b940-goog

