Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792839690;
	b=IItK8b2qMAXGzpF4QzdE8pc0Ew7YR8qRfTvxQ1YCR9NGlr/8SuTB5p73JxICiE7a3AhB
	 xkn+r2VbsAKvF++9kWMlEbx+HfC56CDzPKRvo1bdkzAjSmscGJkSIDEL5PCpD6Z+6LPuv
	 8pE4JqJACrxUW48M00o6X3AorW0PW44/UdyFx2CRC+WWi7SSdtVGEvAoe8m+NuCB6WVeD
	 s0xujXnPGF3GXBYJe8y4mdTrw8forYS3HkafxqxBNAs+p5cqrUbDbokr+Uyp8Fb8ISyu0
	 OMGyNlG5pwTemWGdCaTLmRdmVYS4AWBOOm9r6Pz4ifNJjqS1K7eF3fLhHJja2/yObpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792839690;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
	b=v1Wf49saQ7s4fu3NjNlyAzA5DLINDbXtJ03DKOIgIr6iqEa15njslYoJ36VIU5Qas9Pk
	 KqPHrBKJznGDJHvnu30uiWg2jdKLh8u1jVuSI37TQU9MOu6yefe13SVKO8Ip0CdLKmYyp
	 KUxkxAvQVEt5l1PN9Fle8jhN3bcKQ6DLnBFLXeg4928Zr0d3hcpVjS7++AayyX2rcX8Cz
	 WUrm3R5etZK3wl/4jP3wQ+ZatAIml6pXAJNzNeTO3uT/WHXaDtLo2InsbWaBvc2k1ywlL
	 06vYIjE+gh3LemDth7UhjI75l8Dq7+bedkbcgzc1bQTJXB+3NN3Vrkukr3trHcf6qIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NhIpUUiz;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC0B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 11:01:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEC0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NhIpUUiz
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so5733125e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792839688; x=1793444488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
        b=NhIpUUizuCr4oq7rqnXBsUKCxO4JcZRB+dC3MpSSLVHuj8O8idnQNu/f16J8a+jjwo
         UzXon4kUVJP66AJolXBJCUjoyRuf6Rj6pqqctvBk560ulmj526cukzLJyuPMcV831B4d
         Y827ZiUQRLfzyTFqQJaUduRU35uW/wxOoKRtGqzMbiXBM8+0wxnM7nYsR0udyDgldFXe
         W209v1tT1cYWlnOj3UG1jS/p2WsL96rpoM40St0JnW9raVJmN4KVpySpajJWD8RiywMq
         Td2nrXHt/tll8fa1C/eudNNv73S1d7KHeEBA1ydE/QaLqw9C1qAqA509qkRxCBrR9jZN
         sfOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792839688; x=1793444488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z/AIP7tnKK/4+bwJtDzlzu0jwt67zrCvDiXb/N418ik=;
        b=Atrh9S+9415wS53IKNSngvfE1X/R+m5RSqRXUKwi6rgiiprpSScbsQiASZ81W1S8+N
         szfpo0jM0n3lQI0fLnAFlgsuS3qBZyLouprfp67je3lvwztHlbfjiweufLDqCQf9K+Jt
         ZpSPdqkJ/hOAPSEmJUCrAXCVfNgXj3QDXrLDTIfzZMHwTcRAl8ZaBZqVqpZtJxMLFbCB
         VjcCcgkxP0WUiDaVRMkZSb7XJJeYI9nrDz24xOa/LJxw3/wsT7qkEmQ/RLjevmITFblK
         LZLKyoC+xOpPEOAjTXZGZ8n7qcOAVKh8CBtDCl6N8AnXbR79rBEN5IpLRFUsJO6CiVaM
         /Xew==
X-Forwarded-Encrypted: i=1; AKwUvBywiR2NRDCzV/CFaAIGAoMhIGDq32aRW9hZz9MuFbvP7s0A39v5q8Uy1qk2AbiTKEkaLVV1ZjRvToz+CWQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLWaq0yOqTBS6izVR6VjAINCc0X/a/ahoOhfokuNuJLSbgIRbbL
	yKh4fOt4m8j9vIrD4VOJ86n8NW6IdKVV9GJc3I2xkq4DlsT8JTzZ/3oG7Sjc+UYh
X-Gm-Gg: AYBFou0lCHAcb9cOBHx9pX8NqA3ePu5J69RD51nyDrZfH/W5Od9i3o5VoKptunc5ipA
	dq9JDVeb12veLnxwXKuZdGp7syKuiaErCZ+YoFuIA5hvV7e80aSk+dl4RfrdpZSxroeIGCwWOjy
	rBzcKujaP1Ia9GdZLIHk2UO3fwy/OuAMcXGZFb/BskqiX6wSakMoZLFOw7i4aPrLYkOYDp/o77A
	LF1NurdzoAcym1KaXnWMnfsWkheHKIjBBaD0IDgqA8FEd5aOL8r9VHU3y9SY8J7QX1M93zzID3f
	hL2IetLSfxEXISUiJSCQYeYqTnGKMNkczTPaSpFHASiPJYUyHXFTRkGafXcJPTv6l4gEhoZVXLO
	yyjVVoaWyDK4sqr936UFbA2gO2E/I+HzgbDLTJasqrOb5maclJEX6g+rkKYdR932TJauwNeTQ2P
	zpOUIjIkBqPmDaL9HOPNUp3aWCOszoDuwk9ACHkQhrQxkyOndQr8Gm1Z7UT6xMvWewROy3DUhRz
	+9L6CjEE3xlFVHaqTVHsOaiS9dzwJTbnTnNvSXjpeVmNE2VWksPx7d6/KNHlhoQseEaK20OBio1
	hQZhcXrwSR4KaSK+q2JoESvaOkxqk3yxdKWngjOkGVql8ukMZHLmisatgHQdwGeQ+v+3sTLFemI
	hPnRBvUus6OMmpPQ3waTJr5j181+fIXHsDtCRJXghqmI/M6EUs59ss3aMa+I=
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr24174315e9.7.1792839688051;
        Sat, 24 Oct 2026 04:01:28 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9da9-5f01-d5f0-7ecf-afa4-4bc6.310.pool.telefonica.de. [2a02:3100:9da9:5f01:d5f0:7ecf:afa4:4bc6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm56863845e9.1.2026.10.24.04.01.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 04:01:26 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: tegra: Fix Tegra210 IQC2 clock lookup
Date: Sat, 24 Oct 2026 13:01:13 +0200
Message-Id: <20261024110113.63341-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
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

gate_clks[] uses tegra_clk_iqc1 for both iqc1 and iqc2. On Tegra210,
gate_clk_init() overwrites the TEGRA210_CLK_IQC1 provider entry with
iqc2 and leaves TEGRA210_CLK_IQC2 unpopulated, so looking up
TEGRA210_CLK_IQC2 fails with -EINVAL.

Use tegra_clk_iqc2 for the iqc2 gate.

Fixes: 88da44c5edb9 ("clk: tegra: Add missing Tegra210 clocks")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested on a Jetson Nano 4GB (Tegra210) with a small probe module that
calls of_clk_get_from_provider() on the Tegra210 CAR node. Unpatched,
TEGRA210_CLK_IQC2 (220) returns -EINVAL and TEGRA210_CLK_IQC1 (221)
resolves to iqc2. With this patch on 5b0764a53235, ID 220 resolves to
iqc2 and ID 221 resolves to iqc1.

 drivers/clk/tegra/clk-tegra-periph.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
index 4dcf7f7..47bb657 100644
--- a/drivers/clk/tegra/clk-tegra-periph.c
+++ b/drivers/clk/tegra/clk-tegra-periph.c
@@ -813,7 +813,7 @@ static struct tegra_periph_init_data gate_clks[] = {
 	GATE("apb2ape", "clk_m", 107, 0, tegra_clk_apb2ape, 0),
 	GATE("cec", "pclk", 136, 0, tegra_clk_cec, 0),
 	GATE("iqc1", "clk_m", 221, 0, tegra_clk_iqc1, 0),
-	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc1, 0),
+	GATE("iqc2", "clk_m", 220, 0, tegra_clk_iqc2, 0),
 	GATE("pll_a_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out_adsp, 0),
 	GATE("pll_a_out0_out_adsp", "pll_a", 188, 0, tegra_clk_pll_a_out0_out_adsp, 0),
 	GATE("adsp", "aclk", 199, 0, tegra_clk_adsp, 0),

base-commit: 5b0764a53235d3c77e1ed674e836e1b3fe1a4b1f
-- 
2.39.5 (Apple Git-154)

