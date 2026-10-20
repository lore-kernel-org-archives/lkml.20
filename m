Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506180;
	b=0S1EllG9sheLeCDu/qk74GHV1qOQzylW6u7VnP3AvdyA1OTQuxvbVxHl7ZFdwNss3roE
	 u2CaafC+In+x7Zyo5hIDArYPvDBZ+MfZwRnpY7PWyXLp1fQ0zOfwFArNWtOZp6hOnvAMM
	 RE5zmdfDH401zkGDm70/zgjYtkbRLLN0yvhVbwgxu5VmSxMctrD5TnJ4lWnFeUWZ0elzP
	 h5IL1DB2GNrf/D12su7b2zn/zy3UJS1oDYADjmhUx+nSZ17HBkWX39D0BUbct8U4/LWM1
	 giJhi9qY1g8HIB+qWRcX9oXOLNz+/UUe2lyyKyvooU8pT4gEUYIQxK+sbXCxL8lhOCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
	b=BphrNIP2PyCi2tEWcF+Qp4uQ6WRTFtjFSCn3JVbCn6BcKVRAXI8Yl1xqTsjKmtTkO+4c
	 UF7vIb3nWZ8yg8ab9sorncvOul2bIr/zcy1goEnXQ4cJRsBiDKLvgv49EAFoQ+umrbRza
	 arSxAeQPlahNRY8W5kQAqnnfRyHtl7rT+wa7EQWG85sRjdNKkboNPY1RaKW4HMD9eMh8t
	 M3PQ1HG2ha/18mKdNXuUg9tpvdjY7PDvvsssbYJfgkLr7MPmue1k9ddkZFguxhVZV4LII
	 tc7A8WccN8LMtdji3jJ2vZYOXezA86Ln0B6CxmV5WY8PL91GNGfXjs/vV3Vbf0Apu6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQA9krVu;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6D760A2607
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:23:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6D760A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQA9krVu
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-18cdcfc05ffso2113635c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792506179; x=1793110979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
        b=VQA9krVuTHut3IPDhuI0ClpvD/OmII31kBiOwwHNN/oNIeETn7hxgt7BlputxZUBcE
         PbUSk4hCl8QrSze3laotuKiNCnSkgu3J9h+wpoPv0G05m1dhyeHuSPay9Wqicmb2cDy0
         QJIdphlpcCG5laQS8NlO2KdJhtzUYCPGAKdhs7kKz6G1Sk5mPz2EfXBgAvkyXcHeHAkJ
         Cb6RQ2uL9a5cZcNEzA1A0uupAFhXTS/a5xgyLd8O14Q9LnIvm5jJqCCsEcKL3wGScGib
         WDSlNxfqdITRAcaYs5HwaXV1fGbm4AYc8vNptNvNxJNMmFzCdyuju+Ht7ohbOTMXc/Ba
         CmQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506179; x=1793110979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PZ8KNvjhkMdxTOHBC8Sl45C9JTaKlKVWxrChdR0rBwc=;
        b=Er9YJFFDmCqkK/Ro5Sf3RmgM1EUMgiKlHLh+hTywKthHCz00Zh2F3iPOcKrW/sQ9Nt
         V7nL9zgUvV8+q0+0dkPoN2lo0Dv0k1KDVNqxnWVlMik1dR34EIsPXyb3LawGEUoMfx9t
         kVRQwKHM9UiYZhyX6dYBYaPYUz4UFC/aP10Ls9BjcZNFb/pr5SUhOaqsnTQsPqntkv3p
         Bk+6+Q8fNXU/pK/YlIWQY+gBiKx/dU/uaLnKQcdi8xnfECZApe8gVyX4In4fn6IJ7zot
         JmXJIb6CqGQ94T+g1cN5oz5pWXoiJqu75McQrXA0erk+CuEHWCKx5nxyV9ZIL20pjhef
         9TnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzUg+QZPl8FVISKjq+4sPOitf4FEt01GQvrF46m4775uXJNY67zwXnEWcAdzdWE+iFhEgHESB1OJ1Sx4Mc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLnzIg04tET9LjvTyPcXGenpQaFxR+uqIIbHjIeitGrqJ9DS/+T
	t5ft03frHmQFzHIbOzgt2BLWcj56jQeRsknqC5TT9gtZjla9ILo9URmD
X-Gm-Gg: AYBFou2XBQcS7klBe3MA4Yy4b/U4q48QxWuleJA0TKsuWtfN3a3wfoduiCmQtujPqDp
	0yp9C/6dgPhnM80QFu3KNOzFcM82q8YbpbkQT9iD3rSdhPFWtb6O+gSFWOC6AWPdlpkN3xz26gA
	HFDRI+IAFLP+3iGcirGSr8Bbi9edEIOFRWQc3EqXq8huK1WdttHH/AuB1dWCQjFklHPDNL9goNY
	J9vIJo5qdp57gDciSE1XF+fgykdB2bnWO8wIUoWPWEW4cMP25UT6WA2FfKYa3AHRBMRG2zJ/moJ
	Xa+0u3i/e4vgk2e8lm74fcm6zv1GllE0JhBHDm8FbLYyWkFop7HeBsEhEBbVOoNCED447j7dGL/
	t36W89+K0ObZ6F4vjQ7FC3HZhhWYQZia6gwJty27IQ2n9m82BpYhClTV5bnwBw8oJpDN09isn/C
	uoYJ2LJhodzXm5CAHBI2osHFUqAlkV86jTdtfgWWvboN2BsxlOLplFylKZYmvgq2++I1tPc5LFj
	tzxIhVlBEk=
X-Received: by 2002:a05:7022:7e8d:b0:151:2e62:fe8a with SMTP id a92af1059eb24-18514256ee0mr16829571c88.40.1792506178808;
        Tue, 20 Oct 2026 07:22:58 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36081ab80f9sm66917444eec.12.2026.10.20.07.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:57 -0700 (PDT)
From: Sushmit Singh Rathore <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sushmit Singh Rathore <sushmit718@gmail.com>
Subject: [PATCH v2 1/3] clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
Date: Tue, 20 Oct 2026 14:21:29 +0000
Message-ID: <20261020142157.1749-2-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020142157.1749-1-sushmit718@gmail.com>
References: <20261020142157.1749-1-sushmit718@gmail.com>
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

gcc_eusb3_0_clkref_en gates the XO reference to the eUSB2 PHY, but it
has no parent, so its rate reads as 0. On SM8475 the SNPS eUSB2 PHY
takes this clock as its reference and rejects a 0 Hz rate as
unsupported, so USB doesn't probe.

Parent it to bi_tcxo, as tcsrcc-sm8550 does for its clkref branches.

Fixes: db0c944ee92b ("clk: qcom: Add clock driver for SM8450")
Assisted-by: LLM
Signed-off-by: Sushmit Singh Rathore <sushmit718@gmail.com>
---
Changes in v2:
- Use full name in From and Signed-off-by.

 drivers/clk/qcom/gcc-sm8450.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index cdae5d9c8aec..56503a45b64e 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -1500,6 +1500,10 @@ static struct clk_branch gcc_eusb3_0_clkref_en = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eusb3_0_clkref_en",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.43.0

