Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050A9521233
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684675; cv=none; b=YSEC/7385dLvQjzEkwJF/Qt4bYncZ5pfZQozDZ1YLZjgGuqwBnShzfXlPZ5b1XtBMAPAQgYHtI+qqMCJbQCRb5a+/7mlXgHWOtWcw5qdL+tT/otlI8L37yy3xfcHtoF4svWnYIkaVP3atOxWj+kyKIwT4TWqqp+Qg2jYMR9GRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684675; c=relaxed/simple;
	bh=l7JUlcdxUdbVr9PpUiwfgJ8/noDknqrKGPkiFy6dD5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qkBNKphjp3g50+Ir/Zpc+S86kar6tPnQ+OHlfr3TYDYEDWpk1NzjnTWxyVJW7y+9k3Qj/a3cI9xrVyd3kv90Y8n9d4utXC67E0X3ALKmno3HTOpoZUv2H7QgZD2WVkqhZzy0A60xw78CH4so6rGYGMu6w6XIU4XDwdD5fHKY5k4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEmrF/9d; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEmrF/9d"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a00713639cso15368685e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790684660; x=1791289460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBOXZc0qdz6ZNCoiP6xwhuNMyL4baEtGYSge9bdsO9g=;
        b=QEmrF/9dVOoFsyXBDu2uyiOLiaWksetKYlv1j/Z/BVJJLxgEVauCicNklLANwNe3cO
         E8Gq7OBfrLd1zirMMDQ9W5SmwgFrCWowho9c4N+Gdsa+/LNkTwhS9yb8VLTTuqOAwXst
         GleYe0PktyGgSjL6RArMx2YqR9ZXF9x6giu+m2dDa7e1nRdkMYY1BC13xHURF9ND7T5m
         mktuCImlwZJ8KHI5DpAHnl11qg9n8qO+kC74yAglR4fgvjHeU7MziOyc6typ8tElizb+
         5uIuMAex1Z0C4t2rC6LSTiKlfYs/eXpktXfSx+ViJj/oVNuRskY/zMktJ5Pd1zPNNPTf
         TDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684660; x=1791289460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rBOXZc0qdz6ZNCoiP6xwhuNMyL4baEtGYSge9bdsO9g=;
        b=kVSywKRTC3Lmg+Mz6UMoZ+rE0NoIIpD9O2av+gNFpAIwNwz3NNO4kiu2LCF7Bt9Qrx
         NxkLeZIGcUusFrNCT8a41wRd7WFHi8mV/+NLJn+nK7vw9PjOK1Kx2mFaGLwsQVsJMCm4
         fr079FCOViZF1LEec/mI4YPFlmSjJDoNzEPIzzOYJAgCe85vBpbv9PJKaNO+H99KdixT
         RFJAhw7T2dnRGr8Rp8EVUwWvGQ4qJjJfNJzTBhKR88CDla6azy059Lf6j8+VnzR8A56h
         pA6/9KDRq9ZouZme2pir/wsCFmI1hdJx1LmUx73J14/hTDX+HQiKKLJ2aed39IYs/7c9
         xm6A==
X-Forwarded-Encrypted: i=1; AKwUvBxioXNtnoslg6DSQIFxg+gEgXsy4ZaYfVcHkLYfW3ZQCMcgRJS30+5PWgYEH3i+c25Wj/QUxRW8erUGZu8=@vger.kernel.org
X-Gm-Message-State: AFuF++k2wBB5GH0U4TqBoothj6IUW0f25dFf5KJOJUrhUc3Nb7/rbRbp
	rZqoScj/Pplnkt4wxpJBNycOxbTL21B51UVLEyWjScBgySEGHjHglr4s
X-Gm-Gg: AYBFou3B3f3oSm6okHaFDQZMmh3Lvoq3OEjr8rSkAmt6kbMG67RYrYq5V14Wvi2yiLK
	CTAKSsJh9Nx0Nv292jJkdsarWVg0kZCfVx4CRHRuRcecsAxRjfUgLFlVhRQh39QBtxiyiUft37x
	3IPJX/Kp6vjAynYyPkp9PlsUNsKJ6O7ij12YlVES607C1wN2rweaeSwvOEaC0JysDquucDNu7HR
	JwV4o4Y2+GDzJv8l6NMMlkW2N8AP9wyc7wpLVUY8cSXFQsVA+nJQl47JJTstbbvuCMIaBhYC6qv
	kfuZlVzuBZX2BaasOWXMAVV7tfotxAXv+rcZtjU0nT/f+c3gI9eEI35OXTNXx3Cgox3WTixZXdg
	kSM85S488A6mg3xnnDWctwyG4M7uF9ND/GXPUwLznPdcx85n8cMMtpcl0KVQu2zRdBinb3d2gJH
	SiWlCRe8RIuG5KRyk3lKFLFvCLfEf97xrpdmZz938NQMnA3akxcxiCpUAfU3lLc9wWMG0m0qFHb
	T0wOWUSf8zb8u/fUrMIwKO7nGH9F7smZfcENR2dWmFIVTBktQknqbea2dRv759g/JyBQcKVTxBn
	gsO/geKNx5K2hurabw==
X-Received: by 2002:a05:600c:3514:b0:49f:ce72:e931 with SMTP id 5b1f17b1804b1-49fe6701e7emr276449655e9.35.1790684660244;
        Tue, 29 Sep 2026 05:24:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:be4b:8730:c872:1736])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfafa23sm70994965e9.14.2026.09.29.05.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:24:19 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] Add ADC power sequencing support for RZ/V2H(P) and RZ/V2N SoCs
Date: Tue, 29 Sep 2026 13:24:02 +0100
Message-ID: <20260929122407.219448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds support for ADC power sequencing on the RZ/V2H(P)
and RZ/V2N SoCs. It introduces per-SoC probe functions for the
renesas-pwrrdy power sequencer driver and ensures that the necessary
Kconfig options are selected for these SoCs.

Note, the ADC driver and binding patches have been posted separately.

Merge strategy:
option #1:
 - Once the pwrseq-renesas-pwrrdy driver is merged in only then
   the sysc driver can be merged via renesas tree.
option #2:
 - Merge all the patches via renesas tree.

Cheers,
Prabhakar

Lad Prabhakar (5):
  soc: renesas: rz-sysc: Make power sequencer auxiliary device name SoC
    specific
  soc: renesas: r9a09g05[67]-sys: Instantiate power sequencer auxiliary
    device
  power: sequencing: renesas-pwrrdy: Add per-SoC probe via driver data
  power: sequencing: renesas-pwrrdy: Add RZ/V2H(P) and RZ/V2N A/D
    converter support
  soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for
    RZ/V2H and RZ/V2N

 .../power/sequencing/pwrseq-renesas-pwrrdy.c  | 109 +++++++++++++++++-
 drivers/soc/renesas/Kconfig                   |   4 +
 drivers/soc/renesas/r9a08g046-sysc.c          |   1 +
 drivers/soc/renesas/r9a09g056-sys.c           |   2 +
 drivers/soc/renesas/r9a09g057-sys.c           |   2 +
 drivers/soc/renesas/rz-sysc.c                 |   6 +-
 drivers/soc/renesas/rz-sysc.h                 |   2 +
 7 files changed, 122 insertions(+), 4 deletions(-)

-- 
2.55.0

