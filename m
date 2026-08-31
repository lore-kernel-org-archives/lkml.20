Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAEA35DA4C
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788144826; cv=none; b=GzyJJF58Es1kE9FirNEpBrYVQEMvpu5z0ZbWT8EuPRY6BvBbWtqevO3vaXdYZCg3uro5s9UeSwJpiVveGBbM83JYBr7m55RV0y5OWIt0Xmzxm6o7viESHaoGztVMzoIbFBNQiixg81DZ96PSlhu7i7765PXHAhfTECzEQkY1oGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788144826; c=relaxed/simple;
	bh=wIckMKJ/59gc4rmmZev0GOPSlllvSuQfn3WtcE9i9mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pd0d26gMa8LObiWEpw+hRGiXMVFELLfE9ZcQgbYSbiMON9b4xuwQcTDBRoqD1DTzWKyE2h1ndOFw65IHMTB1t0BrGriOjPfLCsH8AkzWGik4G7adRBfNsWcTpReOIRTI3jqFT0cQ1WLH2oXcaHvqwhUUEp3CDx5V7uavVnjk5n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S6MUh4K2; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S6MUh4K2"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38fdeaed181so4485603a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 19:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788144823; x=1788749623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IrjCF4pM3duwCmLEW+pFhpUaj9HXx925sI9B0kRtN6o=;
        b=S6MUh4K2Ro4q3CrvcN/BMOaNCibohgyOnhZ+yT+fJUEYxJTUd+vUUO91juyiQiL4Cn
         bzUt5IYfBpYGLETc8l7iTVfkuM9/PUu881dMf3Yf5vubAVTns/+TvcDaUHUVe8u9kFNq
         f8nuRrEiZjOWhScZsvOK1ZFwfVrlwN+y1EPKwHqOB+ZCAx8/e7gjypb3PnNxmYCJlHRB
         j0EsUjddBIqr95wOGbT52B2J4AgQAeFyWcuzTJ/EmBmLNPYshcuRrNfPQje3x9cKvIph
         4wGdxBYavc/Ytm5/XoOcuG/1Q8mrRMwAb76XGG+paiSz4ixtVrZP0D/Fg1A9gbfNMNZp
         RkTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788144823; x=1788749623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IrjCF4pM3duwCmLEW+pFhpUaj9HXx925sI9B0kRtN6o=;
        b=gwf0Nvg45mrL/nXMdxq10BjARgYeS2BjLsj2Wwt0h/3V9E3e5foeKYTu0tWqA0caJR
         yTVFwGa04kiQawyOj/dv+eoaGCKuRXuFke6VExKPDgt+euPasdBvQrPiKjSESX387y3X
         V35NtTyRD0szeFLtrymc+F5kMJw/8GVps8gsD5BdKeWfG4CeA3xcpXaXrBfxP2NVooJf
         4ao83ZQ21HsB5sTv8iSM+qLMvLVrdgVmY+fIxq7Tlll0u+Of2t0urSrAI4eeGFNjeZTF
         Qe95PNjAbIQI1H+gIahGwRkkaZCwr4UbiTlKUCI4NYBzf+D1LMnpJfYacrLYG8C46p06
         vBHw==
X-Forwarded-Encrypted: i=1; AKwUvBx42BoLFslddFg7gx/jEEcrjewIelB9LzPtncSmO26kC4gCZkUjDbYthKuuOu9B0BIyb9qK7fDd3l7g3Kc=@vger.kernel.org
X-Gm-Message-State: AFuF++kre77QOc1LxPpIGkl8J1DiFjNXB5myYR1z+k4SAFkZcg0FU7li
	SbHQlupgE2amrrWkJ/UM2Ts0hSt+5bEyyX3vWqTDufIZsTldtWaZC9We
X-Gm-Gg: AYBFou1cFRzUZIwEIRia4MzfU46yYtq4ljUZAeOfnUziGbYLwmah5x6PXoQ8k0z9RnW
	b9VHhfFA/ArmkUuWENY6bUey+0qyjY7zzszlVRirLM/ZhtHa7dRKzZIhvJ80/uVU6ELSSt09yAB
	MhzqHGjy1PGZXVYdSSIL44cgMiJCVB1gUe+XIgSaHm2sCn+mVF5i5WlDgs7GTLBtOQPyHVP2/SZ
	viAQ0DkNtrWaUiPvDx/lBjTzZX215gj1/t+elBjexMb7ltIYBJ8PsupuNMhkLlEwJiMBQUmPTot
	nMf7/pD9x3G7jeAYmAbWB/wk2GAQbIgGXd5ondr1WseGaYjl/9Pwn7ShZWA3qF/fWtMfT6pweqg
	FmTXVtqQFBqVZaE7ZwMI0sa8eSirzZ3dSsT1Gb+PEXPDXLEn8lKa+iK9vWiwhC71H/KVsOdnjem
	O988Fhx6YBAaMvSIYysIB4gpnKcRC6RDOIRsUa
X-Received: by 2002:a17:90b:3850:b0:398:9bd4:d15 with SMTP id 98e67ed59e1d1-3989bd40daemr19578833a91.20.1788144823046;
        Sun, 30 Aug 2026 19:53:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398d8e493b0sm5205418a91.16.2026.08.30.19.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 19:53:42 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] phy: core: Add phy bulk helpers support
Date: Mon, 31 Aug 2026 10:53:14 +0800
Message-ID: <20260831025319.94886-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in [1], some drivers may do not care the difference between
phys. Instead, they only need to treat them as a group and operate them
together. This means a bulk operation is needed.

Add some bulk helper functions for phy core by referencing the design of
clock/reset subsystem. This can relieve the driver owners' life who needs
to handle many phys, as well as each phy error reporting.

[1] https://lore.kernel.org/linux-pci/ak9KzNFF26B0Kttz@ashevche-desk.local/


Inochi Amaoto (3):
  phy: core: Add common helper to add phy phandle device link
  phy: core: Add common helper for get phy phandle by index
  phy: core: Add phy bulk data helper functions

 drivers/phy/phy-core.c  | 716 ++++++++++++++++++++++++++++++++++++++--
 include/linux/phy/phy.h | 183 ++++++++++
 2 files changed, 865 insertions(+), 34 deletions(-)

--
2.55.0

