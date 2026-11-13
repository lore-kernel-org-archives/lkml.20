Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581853;
	b=WclwDbRfApMIAYdG2gnqVdUdBSErNa3vcSt/IXmvSWZcwx4/Xh7UwH6FyiCnZ0YxFoeY
	 XCVIN2ILmHj7x8nKtdt2U9MBDere4r1Owk2Hxy/D5Evp16jaCFM5QPxgT5mbluqiqj53n
	 eO0Ek59wsut52yfqwetB6RwGSg1Z6TitRYR8EI8uBTStWR5cOsgistfcbvM1J67h6gK9j
	 MWn4mUGfMmagIM27OyDPlbRIX970p5ilgUDau0q4dbF4mSXkhBbdbKl3tibiFuMSV1PSC
	 vo5SPtQ9yoUbOlkxdThhvJKmkgkCObdBjUmIHEpZD8EcH9zCluxNaVg0qUEFIvtVM0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581853;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
	b=0AbRTFe7Li66at8U5BsepX4tqB5xW4DOwOTUethZStWYgNZT34r+yqxRw96nifYJyVZR
	 JtxJPaLe/qN7zumbR97zlA3jTN/5z0c8yY/JHp8/DETEN6RsUJZaB0ofX9NbNwfWZS197
	 zvJU0wBnlvwlyJYKEbzZvFQOu18npatXNHGAT/3HETV2ozXGvepGy7iqe7kRpKNel8RB/
	 koCtS2iHRr4nwKLEw5qszRHoUj3Kv72YtWgjiEUG9HP8sFqQYqz/DTkxQ9WtqmDAulzbJ
	 QW6PJq8tWTYC66MpRfFqHO97FPcp0v1uMBSOVgh/LkaFerMhTnFiAgvaQwY3hyB48ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B7606A88A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C5B7606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=owO76DdV
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso180438066b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581851; x=1795186651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=owO76DdV+intecB+gfvcaXp9qFLZHPv1oqwmheQeztT/p+qKx7StnlQPrf9T9xHAiO
         2RUEOCFi01EIq5y6j/nq2SR27fG86EGMwVX1h+hljVpRA4Ijj5eR9Z0bgRIRnBd/LOUe
         86eVB9DZnbqXjO7xcBGYT20LQmmYCZBNTieEV/sUaNTZ/SPKG5AoAppc3pfgQiYzgL9I
         /YjJJ1gUA0RUmFDJ9xnWDxuRnpSeaQaavc0gCMehJtUUU68q1Jz56JAXgfc8FJ1TzUeg
         aCkcOZGNWE9I4STm6ZaDOqZFmmsstugQ6ug7a+7umu9UU7RsN4kdEYAWOEY0zGEKhb8Z
         1utA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581851; x=1795186651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=scsWxuEwzNIQ5N/PGO6xJlWHR6rWMshg3tU60+o1X18=;
        b=LamSLnlN9qvc7slj5B+wbj1v6SBpvPH55D+B7xCoxuz38M0ynEi5V890wcQAsMwkKP
         rVoD0Z6CnKVksw7pBQ4Wd1fkZ4MKoamr75zODhWYLU1rYbcQEHGZE6YWXEWuyMQRdwRz
         DR7/WWdtfNZFRJt4251Ai89jgtyBjK4ulvvPRsgDhhl8+KRenYBu07F9z3+kAjzKRIgB
         E1CILpyLh6MH11JVkIJsEaPwn1WQdZ86gEvlVS1rW9JqkOYJI/X94sovRUm3MgE20nPu
         z+9HKpVdRH1wDTyH6vImPX1h7iVw9YyUleB5Q++G9zhgcLl3kIF3Y6kCvh23I98LWQg8
         oSRw==
X-Forwarded-Encrypted: i=1; AL+hErGaNUvZq6KCzUR7r8XyY4QEttFbC3BdZAKbr0uhVyaLP4FHZw+cWmtHNl3shSdoLhFohGP/25PY8/JMunY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hy4vhZ/TyOx+VJ8pNs1wrwP1P8sio5jfwn2hvMdHJaVg2WWb7
	GcfpuXjRBkcq4BcR/B2UedZukHcq5QAkt4xT/YHG67ricXzVSqI7t88B
X-Gm-Gg: AYBFou3pW485sdF8F2f+bjq6JOLCVT9k/6zjKNZkDXRd640NfjmE8M7KrVkgg76msJe
	Id6QVXdkcbSi8iM9N7EhP5O77QDU4yZrCWNwSRGwZ0TR8hcVfjtrPs4oulehmENa5KkxS3znckW
	QEux/oN/QZivLvcc7T02DtUKa4Ue9/2SjKwWV9pdv3uOOayoXWMeUJLlOi/MygmMqeyylHRbvvY
	UGPGM6Oc77t1UiOVCDUiRENWNVW42kbTsEHUypvx9KTT/bqMT44zUOqhZmTQjILpfpS/VWudgQx
	bozXBRSpW3q93gStqvLIcOwvzDomYRFq4nm61n8mM0zEJ3B4+P184yRXVRuELpqQR1eistaPxl0
	uyX7tKB5QQAfDt3QzEfeemhvW1p4+fPVExnyItuM1AzqqwOAYlZa7yA/T8pyDQXFycDppZCO9T/
	/FqA5UXX/+/QqsPVfJTu3c4azHWaqHCEVT0PuAb1AcJcrquR68RlzEMBIx08XKIvNZu2D/rEBQ6
	y7bcnwUf62tPustJJWM7T9XWkDmL6RRBsStMHBYKvuxRq9D9mt+y1pRWxWQf9TRcWICpGc7Qtnb
	25vM/SamcQCvcPS1DEo5aRpODIIL5+JTKkCAkzPCVhoRBUcajNC8PPx06jCVfIGoh0XBd7l3PFl
	8jw87gXeVzg==
X-Received: by 2002:a17:907:a088:b0:c50:52b4:eb04 with SMTP id a640c23a62f3a-c50962ee311mr275471466b.16.1794581851329;
        Fri, 13 Nov 2026 06:57:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:30 -0800 (PST)
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
Subject: [PATCH v1 2/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:08 +0200
Message-ID: <20261113145708.261530-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113145708.261530-1-clamor95@gmail.com>
References: <20261113145708.261530-1-clamor95@gmail.com>
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
index 80b7f64125d92..e3d8ab76db649 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -1041,6 +1041,16 @@ static __init void tegra114_periph_clk_init(void __iomem *clk_base,
 					     0, 82, periph_clk_enb_refcnt);
 	clks[TEGRA114_CLK_DSIB] = clk;
 
+	/* csia_pad */
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
+	clks[TEGRA114_CLK_CSIA_PAD] = clk;
+
+	/* csib_pad */
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
+	clks[TEGRA114_CLK_CSIB_PAD] = clk;
+
 	/* csus */
 	clk = tegra_clk_register_periph_gate("csus", "vi_sensor", 0,
 					     clk_base, 0, TEGRA114_CLK_CSUS,
-- 
2.53.0

