Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841384;
	b=05mv/Lr3rfqXIDKelZOkTVrq+HJsH7D7MQ+XpRYTywOTWq0IR83xDciryECz4lpnd0WK
	 oOrXCp+yI4haRdkcJptKdo8xK8gAii5xikwywTQXuHWsoOkQXCeueZEkQaqeSiJ3q2Yu/
	 30hvu+u9Sqf9ryFOlpcvTtdUfwJ3nGYJOtMhR1yYEbKEjhYO0etkWUV9x0+Zw6jrfQNQK
	 qB0K9jse7QCYAt83IU9T0vMWUs0Rumz0lYaJL7fTK55KXga9zy0MYN72TAZWA5NaX8L0m
	 kY0Ma1GMHyWzgBZ3uJcssxg99Q994s+KxvPxRpiTdzPQCLQAwIjXju2gBe+TY+/QlVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
	b=smW1mhrnVyxdJNPvfp74Io0K8pb+MwnuH+XJMEVuDrziw6blmTOBz3JCkT2Mil3nrR/e
	 4U2D7KLBeLV0czX9BpmtLnUfQDRWM3q+4BZtJVRoGD6hlEHkD+vZ+ovVJO+48BazT8AnE
	 BehOcgLUXXZYFyLFgnZBMdrpVwPTch8+FZUgEhnEdYc07mDZrFi0w7jVT8kEKpvLllIjW
	 PZGRjfk355/vvaZqxw9PQlRnzROQxPxQAzl1gSMJsIt+DL9zjXD35slFId5Nhuyoivnw8
	 w/xKyWXkZu/q2ldQms06JDz+zfHDCCNtHkbhXabMkgXbyse6vkTpn+56TEw3eNzTqdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58402606A883
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58402606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YEj0XDIx
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c247f6687dcso642490166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841383; x=1795446183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=YEj0XDIxnVpNPh1DI2ma2SbX2pA5ZgtjEweikP1Agh+FH9GBYjgKpmyp+ruqzqi5Te
         mEW+DXBtzmB6vAV+BVH1GD+eQAe+yNKdaNHAph/os0MGvxmO/T3cdsH3At+3krs8SAEM
         Aht2+glUmrVQCK1y5xumU0DFyXOYOm1lnAZngFvntBfbT3c31FhLv+pOytir08+XLow3
         CePrFiu12Pf6mqYIzOGPhrq8xJkwceSvVsC1o8ARLU/w1EsHBsOthRsULTp8d2287XO3
         yLVX6XYXNQ/QvPKZnvCsuXN0Z9mWqyNvtDmv8QUTeo/P/1mMKe/uEczz7wOUlykcc/K8
         id6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841383; x=1795446183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AENLxt5LQ9ja+qhvz5yRKPI/PUABSCNWRgi2+AHk9pc=;
        b=eQBDJPFqj4oqxmJuNzYFaMvx/HBniTx0Gl0LQXfEr9NbP3u+Hljqw2qRCD7H5jv6vV
         dRLZqtnXU8lofIrYbhmC7MkBauuoHnmlERsXSWNaEI76ZJjWes3AVnCSn9DjgAsDdBNw
         THzGLkBX3ybVqm4Acp4pP4CnQERy97VCuj7oKjGiocCpKTSh0qWpORnuaow1E4Bolz7Y
         YzSV2WbB9GrTUGDGkbpJZqhR4Lu7pmQ0JeQWprTxbKL77kUufv1sP1YaRAjr//0Qbrtr
         865u2E1G9GRBHjmffP206vOnOFw+RmEEN4Y28clCy6P2ptWhWjT5ionb9yefaKPUNQgo
         Icsg==
X-Forwarded-Encrypted: i=1; AL+hErHU98w+u9hQ90uygBqqE3qUw6BInVgiiL7VUxFfGDBBoGRBKmuYif9e5b2emVZNHmNXn7dH9zmH0shLvbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8h8oGmERX1GMDjzj7mxWKlLF8Uqx3Ws6pwUPJc/RXj/CI3VOwC
	u2cQt121sQdUITasSx5CQj2WSqLCER114pV7QuRxBoGCatterKWOrgK4
X-Gm-Gg: AYBFou3H41MrGqa7iW1MPI+0EDtMGq8BSBgPXkgUnpd03CM0scW7zggS/GqXHDFnfKF
	sJWHvbGS7hM76Z1NgisJDBQM1Nf6BCOafDcp8ZTL9w1U2lsXItYd81n1JsKTF2+jzIF1b0VXe4q
	Dn0Yi+g2URjh3vLJkRrD6hYbveBRyy0yi2AyAaXIa2XBx7SoPDjUj5p4YrkzGlR0vwfhHF208+y
	sxfpOfgALUHF7fiOJYRzTHrbr9fkezrZA3uAEUj9TwI/iQrKp98T/Dapnl2LWr22scMagNaRBR/
	zKKpQkhLY39igtxmqYDun/uSZpEWTH/jZrPyS5sLTzHCJE5XUgcK4iKyJ31ZNpgc/4wMrifgM49
	5Dhh7jujLWJrSauST3JDhQQlhP07wd76hxip1WbpA2ZZXbSTA/UQ75HagC/95KbZLLMUsq/oNc3
	NXz83TDdFhGU4HOr7u/VTsNvcI4HxxEmudB3/uBiR5nspxFL9mOoNdinItKsIbKkcWJFxaXOGF1
	aO7K+O9/2ZABV5cA1hFF838ojRiRDVv4u8qobysZZez9x3b2iq0nrQhYdIG1pbfQDigNyHk4TmW
	syOFp2r+71eh6IBuvN6gmdLs+4xiceEW+/nAqkCd9s4ZK73wgZoR174GzIBk85jL7VCZabeKsM/
	zoOL99NRm+tdA5HtEkByccDlzH4JmQdI=
X-Received: by 2002:a17:907:a785:b0:c46:a607:6922 with SMTP id a640c23a62f3a-c50963d90b8mr891096666b.25.1794841382509;
        Mon, 16 Nov 2026 07:03:02 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:01 -0800 (PST)
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
Subject: [PATCH v2 2/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:38 +0200
Message-ID: <20261116150239.264139-3-clamor95@gmail.com>
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra114.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index 80b7f64125d92..53899f2b1772c 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

