Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C11833BBD9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582348; cv=none; b=j4qUJLU7SYSRaBPW2Lb3JnXvA/27ia5M6GFOdZdoIe1xsyawTlTRYFJjFGszVHgBSwmGnOVDg1QfKloJEWSct5Y8qQFpmoueE2rbPyqxl9Rq7I9PBLWAUmySY5M7aYWBt6Jqd0u07tB4v4RL/sH+gd2GLJWns/cqe/KrVbiSAGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582348; c=relaxed/simple;
	bh=ASEmCLfRwgQbxLWnkf5or2hRdg6uzSekK3ayF6wdI2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gW4JCBJby+Ka9U/u9ag0ZTIboNTfKZHuZ45/rm/F4zYueCIEBhBBxNH9l8HNKQS1ThfIsr0TC0xHEnXWGbssJBN0jKl73gFW866NwkA87R3p3ZCQSe3QC69XbyWOpqsrotiLsY4h2/JCqCTUBnvi81q2w4bBRf8fOm2y8SZtRA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TSk+mZjl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TSk+mZjl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso1022145ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582346; x=1792187146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJGj1uJaimgWxWRNZxMFXky2zyOGTWtfYM2CHs6J2DQ=;
        b=TSk+mZjl3xaPFvAWLtW8KYyK22M0FFTRc67nNbFKjtfuHPaFawfcNgmcPat7X1TXdV
         YkRnXZ2p7ofIZDUIvkVT5u7r4UW0w6Hnlc8x9GKPn1Ksf5qYmJNiYsPANxyrogHuU9+/
         6BDMVBhNYvtmVE+DUWFDAX8UqGl1bT2YQIN7889ujsybOpbH6U9SlmPLgDX7w55UbSU4
         dqn5dvCZtXJz6oTWqIgLyyhA7QVT66KzfAI7IG8J9kFYdbHOIo5aeg369xz+N7SezaCU
         OwzZt/RLGMFuZyuttkWo7WGBf5AV6JPeHzFPT2Jrmi73njH2oO/FmDUCAS32U5jLCobP
         jnaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582346; x=1792187146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJGj1uJaimgWxWRNZxMFXky2zyOGTWtfYM2CHs6J2DQ=;
        b=jDh2Kcti+HQaYJfK8ml9ADKcdznZYpHqU2lC83+4V7RILp82Pa6eKbkEBT/q09QUK7
         9mlpSrXQu9GE/IInl+UsR8wRwdomHldhv51NDWaU2R65/4I0T8CajwPNrvZX0OTKEtZt
         jj7lDiYFDA6f5YxSZFiXPyT4+JzHRwS+fklyXoVLFKyQfuzI8rjy6d56UwiqXoiY0CMa
         +zejGZAdLVYit0Vuutpz3PkU+X7ts263d5oeorXE8umfzRVdArvpf+j8YdtLS2zQuSEq
         eEqSjTfUCK2bm3BhH7hghpYKxDagkC2m/4C7LpdgtoaLTPkLLs4yEmlv3Aib7n0L1u/j
         2d2Q==
X-Forwarded-Encrypted: i=1; AKwUvBydG3yhIpIJIl1Gmi1wEiSAcXqwfIlVIW/fAGizhXtGYw4U2IRXVL6j46XtJwjCrug3wCzL1Yx8CfiJ690=@vger.kernel.org
X-Gm-Message-State: AFq9FYKeBviuorFutDCBfJpBRv+mcfYJwWjn9ljWySRpytcZZafF2sRC
	x3d9LW1tBdcQzGjuBjY7lwct6LC7S3HnXJkNyWx6PNdTLYgrFIxSY41Z
X-Gm-Gg: AYBFou2dlBXdvhn97e9tUASUuJL2nydY0QF6knMmf75+LLlqxO67MxIfeaLShq+/WDB
	q4Rpg6lHMx1OL8ThdfLnflUxHq4dv9wOxvKQ8l44GqZyegxQBb8zJ3N5+UyQMS3VfWWjkfnuz4M
	98JdDlwmC/8ztTNlHxuKLfuf9kZuGxNCj+17XsS+b4cv9RNiJlixoyzESFf/fdMuceQKVMbxG+R
	NGA9FuvAudQD4Sro0qA3WfJ5nOFglO95fHrljZaAPPM3yEve+vo0Y21clZULrBIt1u9CfiZw6ZR
	+MKyUkC8TpeJxaue6YamknC4vzEUfz0fGGJ4RdhbzrG/+MWNcxxL5900PVAnQ6IVM+KaWUGQxDF
	nixZ48t9OCoExxwOEnyMFQ0p3NxvZPvNSKRQuI/FR9/OuOETQeR/JXRFThzxF0SVInnZ6T8Ug77
	EMdnEOpahwoUIHX+dz2ptZsJOEPhv2bQyQL8lloJVrUWwgNjvu3nNj+m/2+a0qclrLenJIWAAUZ
	8IOld/NkxFJGnT9koEv/mYzdJy/FPnWJRpGzND4NPbFB6z0
X-Received: by 2002:a17:902:db12:b0:2da:e967:7953 with SMTP id d9443c01a7336-2e842ab81abmr25712755ad.12.1791582346293;
        Fri, 09 Oct 2026 14:45:46 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([104.28.215.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e84219e54asm16615975ad.13.2026.10.09.14.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:45:45 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: David Yang <mmyangfl@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] regulator: support the HiSilicon STB PMOC voltage rails
Date: Sat, 10 Oct 2026 05:43:38 +0800
Message-ID: <20261009214404.722628-1-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HiSilicon STB SoCs regulate their CPU and core supplies with PWM outputs of
the PMOC block feeding an external converter on the board. This adds the
binding for those registers and a driver for them.

v2:
 - naming and doc changes
v1: https://lore.kernel.org/r/20261008155727.3801095-1-mmyangfl@gmail.com

David Yang (2):
  regulator: dt-bindings: add hi3798cv200 regulator
  regulator: histb: add voltage regulator driver

 .../hisilicon,hi3798cv200-regulator.yaml      |  48 ++++++
 MAINTAINERS                                   |   7 +
 drivers/regulator/Kconfig                     |   7 +
 drivers/regulator/Makefile                    |   1 +
 drivers/regulator/histb-regulator.c           | 162 ++++++++++++++++++
 5 files changed, 225 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/hisilicon,hi3798cv200-regulator.yaml
 create mode 100644 drivers/regulator/histb-regulator.c

-- 
2.53.0

