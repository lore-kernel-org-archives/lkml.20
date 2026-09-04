Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C00D3DB63D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 07:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788508627; cv=none; b=PUMYNW1eouXlEfI6N4hYrF1H5BJ6K2flZpWHQzYK0GMIELOary8vSvZc2YHQbxmOM35QyNboyUoUAt4BYAvEfnmv+0tIquEWcFkHu+IixZMjrU+SosIkaeLv3JlB+gEnwl/7O4TXj2CDY0P0PdSL8Hp5ZS6Dp3WYir/eR1GJk3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788508627; c=relaxed/simple;
	bh=aVDnSf0y+hMXWr8hLybg6AD3WaQCpewMz60QImDAXo4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jS2Do0YvfBe9FwPp6BZFmn9jx+u/qAiQGSwZeJYvegET5FrvUVRZFoVeiySycCgiTJxhX/42RpojY32pNLKlRdFVBWTxShT5P3TpdWaFX1OKVV0arZ1Q+G/TX/OT03JyJAaNzadRkbtSrAv+gKWdSXph7yxQQeJgpBdTLg/hxEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amfyVfZy; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amfyVfZy"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38f0f3c8da5so86084a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 00:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788508626; x=1789113426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jWQHmm7FHocENum1rYYpf4ViVc4iq1jYrch0jAvV5fM=;
        b=amfyVfZy/wGOpn8p40yB65QgXV0kAEAn1iPbjWRERHkGEpYVPRxeCzWM4ceL2UbDvN
         K6Y8zgW5xLn1sDMI/GtAgKFT18bTmtutXjL5B48CagAeGpc7qpcUgCgjiPduFAeFTPeU
         hP8cg0kxrDVAOri6YXGGl+aYJoAVRC0OJHlKY+x1i9+wlSM52tORn56n0Ojl7olu135f
         jtzzRN/3HrVfPR99HbfbGl0+l4EVDLvwEvt0YgNovz+pXufqqyxxH6Tubt8EmRD+X1MY
         IvJA7pyFkVJFMkN4di5aPOR7s7yHxMkIOV6nzuU8WFu9z8/8HIZQJTdPHQbB4vYzhZIC
         6tLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508626; x=1789113426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jWQHmm7FHocENum1rYYpf4ViVc4iq1jYrch0jAvV5fM=;
        b=LqQ3wys9BjBQM19XitDOiBpWGex4V9kJtNq1jGu9v9vM2bo2NkuxVaJ1maQTbQBDdg
         o0qdKW5iPYq8zUi9kHOoLKWaHTJZnBKo2yzwLPP1cqB3Gab8pizwTUYads0/fb7/KoMi
         epv7RKYnqN0iZOn/3D4ZZ7j2mYj8P6Q/MwtzaoaM+Y7+5kbiWgQi158wZoJCxAnTBAE6
         KVPcpsK80U6JL595PfPsBKiToQ5SIUY9xRP6CXXGWsCNYRgUUmC6KyPr3nO3RPJQSUxf
         NXWiddJSTYnvOO9sI6oZtaVqo0Ija5edLuMTphKan9NQWEJe2a38YDOwi6Ht6/3CUAUx
         dWbA==
X-Forwarded-Encrypted: i=1; AKwUvBxSePe7a7cYH1FngKYIri2F55BdrmNcQ3hPn2g8IcJ9yoSUeWL8y9tXGYwId9nHy9u2RxuLvdffPu0acKc=@vger.kernel.org
X-Gm-Message-State: AFuF++lclb0PKE/QIw01tkYgDWWywo/Q2EVhr+GWvaJpfBLLx4n/9F39
	xNsCbd+LnHLMJ6qQ0XdRY3YH/YyPSDr8RJcDn67dD3PnEi7GLoE1oiAaZdhvUA==
X-Gm-Gg: AYBFou1bjfABgRfCjRIoIKIzpf9ObhMqUFJONs6prrXqelthJiam7+8pvxWUn+drnWp
	af/Ypm1r3qTPjJiW9ZDE7dPvheIWu0gkJ/SjZSYag/EbCW2dwF9B8JOnIL1drGjVuw/jNkQQrE9
	qyZmFtZkMmggol2OYrODXQZ43NKPv3kJqZdwDgAqE2ybMoDUIqAxUs3bEtED88+fKvgIeERUTOk
	J8YgQ5HLyTNLZDC+3/+9cj2MUXjXzFmHDAccaq63ac0gIrtbXE1VCKtS0B/IQORiLABSocZ5V1K
	G0fXQDHtvrlZkc4y25G0HHHp8A8EjNbRT6vQVrhBKM5MVokpxTKcyBLW27XfEUISWrfHMt9QLR6
	ft4OpSQg9ZTo2n3mHjf0qfadUeXVdjPXbj+hdIKGwmylls4Mdktyp6yKfDmt1eakbm4EtcR5aPm
	otqQzfj4tsM69ywUTbcy+ykcekitPMnIz/WbmbubTt+pKDfbpSWmVW/YY7wOMAIKmdj+1Asr06B
	fPwkHMHh3Z4Wg==
X-Received: by 2002:a17:90a:ec85:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-39b26301360mr4300158a91.6.1788508625750;
        Fri, 04 Sep 2026 00:57:05 -0700 (PDT)
Received: from fedora (45.62.127.193.16clouds.com. [45.62.127.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b261549f3sm3139517a91.16.2026.09.04.00.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 00:57:05 -0700 (PDT)
From: Frank Zhang <rmxpzlb@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] rust: rcpufreq_dt: add module alias
Date: Fri,  4 Sep 2026 15:56:35 +0800
Message-ID: <20260904075635.14840-1-rmxpzlb@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing `platform:cpufreq-dt` module alias so that the driver
can be automatically loaded when the platform device is registered.

Fixes: 06149d8f2216 ("cpufreq: Add Rust-based cpufreq-dt driver")
Cc: stable@vger.kernel.org
Signed-off-by: Frank Zhang <rmxpzlb@gmail.com>

diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
index 10106fa13095..32a508d82f68 100644
--- a/drivers/cpufreq/rcpufreq_dt.rs
+++ b/drivers/cpufreq/rcpufreq_dt.rs
@@ -219,4 +219,5 @@ fn probe<'bound>(
     authors: ["Viresh Kumar <viresh.kumar@linaro.org>"],
     description: "Generic CPUFreq DT driver",
     license: "GPL v2",
+    alias: ["platform:cpufreq-dt"],
 }
-- 
2.55.0

