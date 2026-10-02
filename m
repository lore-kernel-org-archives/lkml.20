Received: from mail-dy2-f36.google.com (mail-dy2-f36.google.com [74.125.229.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A133C3E95A0
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790922583; cv=none; b=NoyaAE+Gx6sdFSasUCf0A/wLsTMUjTTvW57praP7T/z/oGpjxQ79zEKVk2nMz2XHnEXnwF3u3NQlA3hNovgQ/2Trnk1SMxhLqwOYduzFs1JxoQxrekMJ/Uy8PFXsC3j8ytQ5GKY0H5N8guRsxoG0rgE7lINlwm6kbgC1fPeVFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790922583; c=relaxed/simple;
	bh=gyTGqOBUT1byslEbBLowM1lzNtpyhGlub203yUcrUJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=efaW+WS3cQRPxGUSTEGLPLzjoYDUmnkIU8KLv+TKcjBrURyVV74FaVYwW92SDftqB0AjN/k0VJAv0NbOEhcVpmXgKv6u+wc8SXEhNTXHtBuolCzlLu+oRlxNgL0+ykVP1d6JTvM8AVVdi8vvUsqk8bEhUkWj5uy4XKc2RY0aPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LLvg7ClW; arc=none smtp.client-ip=74.125.229.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLvg7ClW"
Received: by mail-dy2-f36.google.com with SMTP id 5a478bee46e88-328664c2da6so6207668eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790922582; x=1791527382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
        b=LLvg7ClW6BIIXdIiLvEn8xFMVK3b76fhfefxx6FrnvkvR3uqgGl3QKFgzO9hQbcRyx
         opTjI5QMg0O595XDydJFEaufUyRMOTqruH+K6TgFZl7VR0CUIXkXTfKO15C6/tJi8yLD
         724HNmId9BbMUod/9cJC9hTzEpXADHMxFc+wMgSLXXGgF03mS7TRVR2toZ2Yx3617f1E
         La7Ny9vRcSBnU/w7PpRPiMmOIKEMJbfCQmW8C3lVke90IIvR2CIHaqomthJ/MChkWNBH
         nxzMvkO7usSiVWP5PAgQHKdOQq4LICtgWJaY9nDYKbd/d7+DmpeE7Cye2FOqDBd8W12D
         B70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790922582; x=1791527382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3uKP316TAfLOs8D6w2CQrvf9oUDjp4A6r7z6eIgLW4=;
        b=hLyE592HT1zGLZhRdLFrgC1ngaUWjHcIWLQQpi1ow7PneqvJd70filiHSdIKjiBfZv
         uYweAiv+up1gXVBkZRIINbA0UZaw/XV2R4VdpUOuNIZKME854vROdKisfRnWzX2f9iZv
         NJkQTfq0+2VjykEPmJenpmizA68Ot1/X6YZag5BnRwW9t54HpsyC5lTYfuq1QHyIQhRe
         NF8ES0g0FqR/y16lD+sl4DPbmd3RZkhy4Oa3Bi87Y1jsSMYu0O/XWuBosmkDMkOKLevh
         eut1mPwmjwL+JyM56SCsXmbCbJzPIq/qk9y7mzZgbRlYQAK8yC7kP1yFrSPMXDWSzSSs
         Y2FA==
X-Gm-Message-State: AFuF++nBaK+Ys4T1fTpjkaGlV3OYTEwvPP59Lv7h3OLMMHgVOuKcz+xV
	wYzwIgNfM4fVYAkLJ+YnmLNBxVUQp3rCuQ2cYC0WV1VlWF68jF91+Xu6
X-Gm-Gg: AYBFou1954N/nntIANYbB7/P9QYI/Bg7FcbQgNa57BzD+Neik0ASqFDzGDKNuHM+D+k
	DQvU8dMq/BAQaoelwSZgbID0D/IOcD+qISRZeKqrIgE7/Wukoc9nK6oj7+6BQrjWQGauUF/gkoQ
	AbfJXF7N9dWu4Skkpm8YXBu9We9gHQPqyIQ1cCrQk7hoeJBe1FZIxKak6xxmEF0VbE2RMXMzKfF
	utVT/YX1wMqDNMMIPjCqgyLQRVbppOtCFnlvBH+30SD680FHQBF7FSWdeu/Xq/yKLsDphs0UnSf
	qoOJcdPKrDD7dHMStj5jA66DnwTyy3xs0L4uFHNqrpoWPrH8ZSzPVhgDYnUFx2b8Mp7ZOsQApA9
	gx4yM7MmNdadwr0RdIQF+N0mHLCxBX+i96YzWyXGmZhtVQxC56FxXbvwzr3T/CK/Pbmk5g2V164
	6temEra0Ibht+G81KB9guFSkKyhROMPvPZgkf/oqBk1eySRZT4pkDTBQf95N+K+rMCK7n3TLqOw
	J1Koi7ffMalBKPP
X-Received: by 2002:a05:7022:f902:20b0:14b:588b:c80f with SMTP id a92af1059eb24-14f5b026980mr1769046c88.10.1790922581583;
        Thu, 01 Oct 2026 23:29:41 -0700 (PDT)
Received: from debian.prasanth ([103.183.205.240])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f45fedd43sm6236636c88.4.2026.10.01.23.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:29:41 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v8 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC support
Date: Fri,  2 Oct 2026 11:59:31 +0530
Message-ID: <20261002062933.26497-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v8:
- Correct the reported validation configuration.
- Validate the DTB with multi_v7_defconfig,
  CONFIG_ARCH_ASPEED=y, and CONFIG_MACH_ASPEED_G6=y.
- Preserve the reviewed DTS content and review trailers.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |   1 +
 arch/arm/boot/dts/aspeed/Makefile             |   1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 135 ++++++++++++++++++
 3 files changed, 137 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3

