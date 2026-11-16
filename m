Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841382;
	b=Bj1cE8BO0dCnixlD7/j7ehHyBcGMxKaRmUgAKgSIVOp/hHfHU5Cy3k0gXteogKUEojsY
	 kB4ZSr1VwzmyQ20zqy3qpNBWUVAPoXuJxJ01nCm5VR/LPaQqarYQHqxpQEpdia+gESUsE
	 +hT0oCOkKkx0oSW+AzCG73El7VxDyyf6PktmBqjOPUwnIE6yeeBGNJWOe4jhTP65y7NHD
	 WWtEMv87NaEBxRFagBDLnw/Oh06N3UYtdV2mt0HvXslG7a5W/Cvg0rSQL4hHkPl2G5X11
	 4Shakj331qjORQrnRj3aXRSZafjWP1khL48qy02QesfRjhdCTjMHytBJPbTaRE2lEAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
	b=s6IAtKmycAScsjsv/etTxgV3mCO1RDi67ImKN7ysi9N2UgXkE1fY2B5MNS0pUBuf3CMl
	 1gOmCyuomMlRpuFdNlQbwLBxc05IaVtzImfrkKCq14Qus6O8giwVhaPibG2K3kgVgb8s0
	 4+acfvEhMCpnwPZcZYSgfB3KbjAc8DzdxUD2kPDK0V8FKF1rmPgZ+hXUJhJuVHnjDBRZe
	 v71/GR3L1szv3AAzjpPq563hu4jVcBWK0M0bI0gMq6chhaHswJC2OFAX06EL7vze/1RMD
	 cUwoFESvvCpwSAN9rvgJxxOl8Y4Y3e5c3fFuNGFkJf81Wyna+Qz/xg3V8XtS+Sv8EtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803CE606A336
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 803CE606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TPfo0MX5
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50604721c8so577020366b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841381; x=1795446181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=TPfo0MX5/qR4L+XUpwvsAIulq5SLhgctltzs/MtnrLc94IsHZh9WyYogU/a5Fo090J
         P44VtWX2wvpxPaGAuNm8bNS0K2a6KFZy25TiIU4NwSEwwBebQhpe2WhBJ5xz30Nl5FMm
         BRteK9fkLxsQEf6pvhNlcw55G7ooH2VR2xkHw1vAhq40GhVQ/IxTBlowyywiAzzYG4Xv
         KdlImwY5zYQhTScNfcNar6QHZSXTorGI4hKl5c8sVSoPO5hISss3807MAe+ZTVjre4MJ
         lGMV9LJ//U6Cj3rlFVp3Z1JcaSYXBZhIbGnZcnFfB/ijGBgDMq6+2xZTkYxU5nur6IXW
         1pRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841381; x=1795446181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C68V8Zp2azDaDb/EYiYQl69ZsdzwyG+42yAMIe0A6Jo=;
        b=YCEWZst+cMbQGNBAbHYs+Uj3Z5hDEKL2jgusvzDaoA1dO66rEymAPzWVJCHFEBAjdr
         uEAbQFtbfI3HCX2UfS1V4vg9fkuDRW19CVm6O9VJJ/KUg3GzOpv81isS7o4AjEWmwl1w
         /LLkx8gMogSxxBRxgdmU2UBh8Pi6c8Gd+EVQXMeaAM+asknTc6AsL6WQcxse15Iouqsu
         yWgEU7Nfo4D9qdp7DQZXj64vUxcec2AXrTGxujndHf0O8ILM3j5zesJg9/V3EvMjNqSo
         6te4T5cTM/wfkUGnz4kxOip/DzXlqO+7+EoI9+pfkBpBXXXZt6Gi95cIwHuSHdbpx3OK
         WRZA==
X-Forwarded-Encrypted: i=1; AL+hErE+npNWxoDfdMYhFj/opDvKxiymhj4pn9pvtD0lRyrJLALFYe4NtBpp3nO77+/VLKt4u2PsvZRC+9KpmxM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oufx4uo3wK/LVm+3AzDWc96vD6UP0rdacrTS70U5zZ1BYdmQ3
	KN/3VJm0AQ3yUxcETS/YbBidj+1kMnQFpY+cc4qOn5kzbEUNDR4+k4H3
X-Gm-Gg: AYBFou3As/MKSNQQonr71plZKMkZ59Ew8skA9QExDJ7add9XOkWc6Z2V5R9C9Vf5gqd
	W29REZ+v/6vr6yGU8KpttEmhb7hqkDiC5PmDq6pB65TsCNplKAiBN5kHJVZJrFfBDYRNUw3nU6e
	w4X5zH3n1BkgXcknaIAYuuPXE/jaaNbO16sXmurWWj6ANRWFGZN7Q8BdQhuQ7pFrk0Wg1D8Ux0Z
	ZiSlmRl+0gKZevQRsQ9n+QtyZFzfCg+jeTDLjllRbb8DPPY1NT43xWy8IoaP3Art++0RhmCzBCg
	xZbGHSnALSfxj+wQGO1LGFdQhRD9wAVur64QjJAGHKfvFVe2Mrt9XB+Ntqug/er5skSDNQKz+pq
	kK6cVya+sNcf3QmGCW+FQYP/U8Vbg0+Jlw3sDILwzidFK28daPgg0CHzPs6+MmPPi4tJ6mX0srO
	FxRh3PWJcFz3sVkUbqFjptfPVqIzUn7gQy5gqXA/DZjrlWxjBZkfwHZ0SV+QkfO+Wtuzdfgl0NQ
	pf+DTWGU6AWCBwicEMU5alR9C1xkzcBEagwN+GFd9ckU/1leNKLYSm1v/mVsCzZTWR2raqVjvlL
	uUpVl44BN/PJBiV2je96ERVyY1hZMIeVaWey5i8CcejCMftVMLbaUmT08mxFNCZ5LkmLwfNegdj
	Gj2+4HKxmv2yvsZkWmLhF49XEjtXjcG0=
X-Received: by 2002:a17:907:7b96:b0:c50:62ca:6f7 with SMTP id a640c23a62f3a-c50963b3398mr889831966b.25.1794841380793;
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
Date: Mon, 16 Nov 2026 17:02:37 +0200
Message-ID: <20261116150239.264139-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
clk-tegra114 source.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c         | 1 +
 include/dt-bindings/clock/tegra114-car.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 97f5500b13b5f..80b7f64125d92 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -47,6 +47,7 @@
 #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
 
 #define TEGRA114_CLK_PERIPH_BANKS	5
+#define TEGRA114_CLK_CLK_MAX		314
 
 #define PLLC_BASE 0x80
 #define PLLC_MISC2 0x88
diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindings/clock/tegra114-car.h
index a93426f008acc..b53f5942f4bae 100644
--- a/include/dt-bindings/clock/tegra114-car.h
+++ b/include/dt-bindings/clock/tegra114-car.h
@@ -341,6 +341,7 @@
 #define TEGRA114_CLK_DSIA_MUX 309
 #define TEGRA114_CLK_DSIB_MUX 310
 #define TEGRA114_CLK_XUSB_SS_DIV2 311
-#define TEGRA114_CLK_CLK_MAX 312
+#define TEGRA114_CLK_CSIA_PAD 312
+#define TEGRA114_CLK_CSIB_PAD 313
 
 #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
-- 
2.53.0

