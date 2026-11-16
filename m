Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841386;
	b=RbrgUYoNrmu2JVwqs8pDsgNUfU9bMd2i2v99fHcF9+eNLOPTjJHeHHpCRsXdGa6o6ejM
	 NKdc/HQ9/hHoSqYdKHUIKM8K/1i8X+ff5RN6dCjwUzewA/z+32LUVGleOIdEwoDSc2pMt
	 gm8ou0gqgvWXDWHibv2k/1ky/fzja5QYiebN5VihORVTquIDllKzjJJqDITFEPNYwg6xX
	 lAwCmmNga1RKiGrpu5OhT4SrbMEg0QlHbWhKzICqfFMtRKiVuK4lPCqMJljO6piwjlgJ4
	 mhYG34mYqNkARUsNJBXPhbNH7AJAlZ3RJH4DYf+2lji/r2ZXzceO1ivMHQ2EWkbGjCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
	b=Wsu4FBxhoMj6aEaCvMfy2k+uAJ4GvLZd7e3SGIRI67WjRz0FOvt7kkCc3sMh6jM31Mjf
	 5PPs5wojCkibaFmL4QdmVqrnvqfupPbEjazBGWArgdX3ydoRztmjfPWKArub/pGQHTqMR
	 2tBIHOpc206lSWkKv2dMy7M3XWT1zc/+ucQqrpj9tq3HmWUfU9c/9SI9iXKlTzxjtfXki
	 L+eHVdR3L4m6sbFiTZP/MJ3RIkKEJhb64i5HHVwqmtvSQh1DPn8kG2TmLI5eDNGL7P2Jf
	 VbLiH6RP+h+RmZyb1KbZF8Ea1t2dhb+tnWg5HUqK9DWFUXiuEszgFHvqSS0Ac4Wccfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="AP/7tzAB";
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E52606A884
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0E52606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AP/7tzAB
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4cac7a7d3cso471411466b.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841384; x=1795446184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=AP/7tzABd22mCHY4s/2PcdgvIfVTgRSXHQfn/bR/H134UTLYEiJlsFj5hUlwWsjVl4
         pbJWImgPIjl7qHZ7nbb8WVG2zwkVzq7hMec29IUIZpCX7Vgg11gEaiBvwkAfUsy8bXv0
         zc6ySKUbnVIkvlR4t8xa1vx6UtpTXbaWuV2WtgAaTYHXlii3hBSDu3vZh23HYpYKgHkS
         3edceBcxs8bCjUBmMIqcWYSD3VhEc8XjyApJD3M7VcnmKkbgCaM560iUATqChth+lnu/
         tOOwB4rIIoacqxa5IfVno8RJGGE4lxG5SxAn8qdpyVv6983sAp5Q8zaCvZeoDJYRD5sz
         R9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841384; x=1795446184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ewge0PkS7pbG0buR4c5qezG5oGsIFlwiB6+b/jAg7+c=;
        b=hZqtJWdpa9sVZttcv8OzaL8R6SO/Bhl466FQWQ6GiVSIQQLFRM458rotd4bbkq0wQv
         X9djUtMBVCoR+Oi4128mCn6UwC1VuWaejeJgol2/vLXGn9G7PICqMfhEoD0zf4OY1n4Q
         2fEMzdbGlcL4Uqr53k6qbwRGXKm1nCX0tsuySygo9qURNmnItvNfoFxFu8RGmbrhdR60
         ipUPgHctXT9y+RltNg5cTKLcUTcQv4sRAOWBS/OZ00luzEcvnXgCPYRCVEoKPehtqsDz
         VoSBOITsTKUa7tJsVk1yQEA13MqGcssKwJdS2OzSblLllTcc0IukNqq/bCnOAWVbcFpf
         duWQ==
X-Forwarded-Encrypted: i=1; AL+hErFRZ/iuOB5f6Nu3Bimi2WrQvgbuDrtNfuWCNyEySgR5cCb9OuvYghGXfgjzigMRHDzw2Od0V+PDYJVauwk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o0gFJvj+089xerIRlerRXJzTTlfWQ1nSqwJdbU7q3flfDhimO
	mWzXxCbM3akx0e0eHiqxGvfs2u9vP+MfoTXrYOe0PPYW1Af/LN+/osZe
X-Gm-Gg: AYBFou0pkFo0FW3rPmjRUTJKR3YzDuTHT+NhxvwaSvUzXgvCXa1p6/w4NJUMqliteQ1
	LhMPzEInY3mCqaasXwE1Upc9JQlxo/8s4o4wEPa38si/5u/6WSKmKdOVzZbOMaupTVGGT/91+BW
	pcPh9baOd3676EY/6btbC36Px1GV6GSL7+Z2rVvcpe/M689ezBnLnyL+VABmov1zBDfZS2Qf7DH
	VfO4Vl14zFI9SEHWcGmEtA8yK5HjW63RP7yt1KIrckIsOLtVl67idQe9wg0cTLj9tob62K5yp/g
	k4qPYMHcnnb6f3xU++0ykxdVWXQ8Uht6rAVdX4CopsBfFcNjFZBwpfJZUrIDAp31yTKNdmILpIt
	Pkf0m9bteKIP3kPUUAZts0c3Fc56Ko7+Q5MnFtFUdqQQ5lMKa5+S30INJM1gfjBHjjfHHwsV0Mz
	QVP24hgoXIBQnQ48wzSHZAIdadwxs43Xx8nUuAnR7QCg/hJ6Evji/tFtJwZ5R3XOkY4wirS7TXi
	ZQCRSvLvnu1yWjYZQHj7gcZ1TuXjPKd9YhKArtGCR7GC++7BQLoUC/twv6E/PxTe1Wef9xXhtxA
	F/Xsh1PciPq+3ugDJhURYiM8iD9JTLNToZH0AjQtWNbLkjsuMRT2MBSWgjZy7DhjnNRitw25ZNh
	86XeC9oGSxhA=
X-Received: by 2002:a17:907:9622:b0:c3f:dce3:20c5 with SMTP id a640c23a62f3a-c50968394b6mr992587866b.44.1794841384189;
        Mon, 16 Nov 2026 07:03:04 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:03:03 -0800 (PST)
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
Subject: [PATCH v2 3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:39 +0200
Message-ID: <20261116150239.264139-4-clamor95@gmail.com>
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

Remove CLK_SET_RATE_PARENT from CSI pad clock gates since changing the PLL
clock rate is undesirable by changing pad clocks.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/clk/tegra/clk-tegra30.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
index 61fe527ee6c13..f427786a8ba8e 100644
--- a/drivers/clk/tegra/clk-tegra30.c
+++ b/drivers/clk/tegra/clk-tegra30.c
@@ -1010,12 +1010,12 @@ static void __init tegra30_periph_clk_init(void)
 	clks[TEGRA30_CLK_DSIA] = clk;
 
 	/* csia_pad */
-	clk = clk_register_gate(NULL, "csia_pad", "pll_d", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csia_pad", "pll_d", 0,
 				clk_base + PLLD_BASE, 26, 0, &pll_d_lock);
 	clks[TEGRA30_CLK_CSIA_PAD] = clk;
 
 	/* csib_pad */
-	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", CLK_SET_RATE_PARENT,
+	clk = clk_register_gate(NULL, "csib_pad", "pll_d2", 0,
 				clk_base + PLLD2_BASE, 26, 0, &pll_d2_lock);
 	clks[TEGRA30_CLK_CSIB_PAD] = clk;
 
-- 
2.53.0

