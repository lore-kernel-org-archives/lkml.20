Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=139.150.92.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793943746;
	b=gtAow0lKZLYH2V+PEVu3SXTghU3u9eamyybYuvfNVMOd0n5sdVz6gQ4RCwFfd9gLxQXX
	 yp7YNNvtpkYhr1wCN2LgA+g/VqtmwlLYtHkSa0iwZXHQWfs17+CreJegjSJKJmtU9tiGH
	 oTzC8sphUdArV6dSpJUudrn2GTUUncTxAiiBMc5UfyNhtTHikXXHoI3otKO8dm6c/qLbh
	 B36Sv4xXo44aZ67eZGzSbEQx58nP+2j0EcKqiDK3rTHWZJORF0jfhgPSRoK4or8w9Kzpx
	 UE0LCWK28e68GVe8nOu3s69IT0E0HUL6DGB562Jfn1hmj4pYeRtheNRZepJIIE5SypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793943746;
	h=DMARC-Filter:Received:Received:Received:X-Authinfo:
	 X-Hiworks-Remote-IP:X-Hiworks-User:X-MailFrom-INFO:Received:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1vc04qdLOVc0oS3YblVHKMpNWYhEpjNqAFH2e1GCpvs=;
	b=oi6ewtCN0NeqiRutV72FN0OrB+4ziq1wGjG4lJq8CNXFT22paImvJxDUpLUHVLRYATIv
	 tztfyu/k5fl2lFPvxjiBhiMoKQ/8kYuA7RTbFQxijay+cbcVW89mzMYWC8nmiNPoRW/BY
	 C1YQzYBn8opbJLjursj7nU7iCikDIdQeG1LpJCYOYOSQrwTLdW92/uR0o6AzRUHI6SKDI
	 Nr2+bB6qdHyE6pyoqPXssHbqeNqCJWPyercRdfqyQkXYZIBLj72AWa+H7F/TRFyc94iR4
	 JZKgqv/3I37cerBmB4AVYZHkgWrFZLXp/ZV4un9KN1Hzqh86LhnmH+5mxz1o1SI8g3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=nirvanahyj.com;
	spf=pass smtp.mailfrom=nirvanahyj.com;
	arc=none smtp.remote-ip=139.150.92.44
Received: from smtp92-44.hiworks.co.kr (smtp92-44.hiworks.co.kr [139.150.92.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B9606D816
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0B9606D816
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nirvanahyj.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nirvanahyj.com
Received: from hi-smtp-node2 (unknown [172.18.0.3])
	by smtp92-44.hiworks.co.kr (Postfix) with ESMTPS id 4jLSk149T6z3wtqT
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:17 +0900 (KST)
Received: from hi-smtp-node2 (unknown [192.168.71.87])
	by hi-smtp-node2 (Postfix) with ESMTP id 4jLSk13x71zQLN7J
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:42:17 +0900 (KST)
Received: from hi-total-node5 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node2 with ESMTP id ykei3tjugdcceg6c;
 	Fri, 06 Nov 2026 14:42:17 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <nirvanah@nirvanahyj.com|114.203.237.180|nirvanah@nirvanahyj.com|261106144217_2181351674>
X-Hiworks-Remote-IP: 114.203.237.180
X-Hiworks-User: (SASL_USER) nirvanah@nirvanahyj.com
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from localhost.localdomain (unknown [114.203.237.180])
	(Authenticated sender: nirvanah@nirvanahyj.com)
	by hi-total-node5 (Postfix) with ESMTPSA id 4jLSk00lG9zSqYcP;
	Fri,  6 Nov 2026 14:42:16 +0900 (KST)
From: Young-Jun Hong <nirvanah@nirvanahyj.com>
To: 
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] clk: samsung: exynos5420: add VPLL rates for 650, 700 and 750 MHz
Date: Fri,  6 Nov 2026 14:41:49 +0900
Message-ID: <20261106054210.2893230-3-nirvanah@nirvanahyj.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
References: <20261106054210.2893230-1-nirvanah@nirvanahyj.com>
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

The VPLL drives the G3D (Mali) clock on Exynos 5420/5422. Its rate table
stops at 600 MHz, so GPU OPPs above 600 MHz cannot be reached:
clk_set_rate() silently keeps fout_vpll at 600 MHz.

Add the 650, 700 and 750 MHz rows (VCO 1300/1400/1500 MHz, using the same
P/M/S style as the APLL rows).

Tested on Samsung ARTIK 10 (Exynos 5422): with these rows the G3D devfreq
reaches 700 and 750 MHz, and the OpenCL accuracy suite passes 96/96 at
750 MHz with a board-specific 1.35 V OPP.

The analysis, the code and this changelog were produced with Claude
Code (Anthropic), a coding assistant.

Signed-off-by: Young-Jun Hong <nirvanah@nirvanahyj.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 400a5c59815c..1b4b0ae16765 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1451,6 +1451,9 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
 };
 
 static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
+	PLL_35XX_RATE(24 * MHZ, 750000000U,  125, 2, 1),
+	PLL_35XX_RATE(24 * MHZ, 700000000U,  175, 3, 1),
+	PLL_35XX_RATE(24 * MHZ, 650000000U,  325, 6, 1),
 	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
 	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
 	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
-- 
2.47.3

