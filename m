Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BBA44685D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420795; cv=none; b=kX1PVqwiwmffSSkJU/D0yX6cVpdMzOMetQW3l3x41sOxyhZQSz46QXwMJue0s8hvifmQBbG6w/kaWqoW4tvq2ssiU84oF1pKUtGoDDlVs7bWTy6gpw9dPtAWgKuzYYJ4EMMENQsKIukZy2M+VNL4AWWmQKA3ivdCmvR7w18M9hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420795; c=relaxed/simple;
	bh=hFt1NkArimH8+qxUmJAoo3uATQRlL9qRZn621gV6oWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DBwnreZtB6vGc0Y+HsOK1cIfA7+NN9+Re6B7D3v1Jac7PP+8/BYbT8XcOXf9rg1TQ4wQ7TtPwqiX7AVNSDUq0o6hRw5MnKxMmAIL5tDEswIVpQy+tl/1Rt6WPTaeqFYCtLaz6iFcg9VzXb5mCkD9geEEVb6TDXf8kIEBQ93IUYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZJ0mCjDl; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZJ0mCjDl"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc891373e0so21380565ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420793; x=1789025593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XD10siGyv2UXcVcAX66uMHAbJieFBJyM178WgyCpFQo=;
        b=ZJ0mCjDl0/2MXooLjBxQWLecNHnTY9YtjYa6NH/sNbPYHRbyMU6JWo7JrWJ9M5acDp
         Ra1J/VSJ1m7uhw20ea58ecHwXuqy2e0w0Ke4p2zDXXwMHfmR/8GeAdbFIs6KntaWw1dq
         taQC7GBrXWaBPu8YVPEqHBiuGUjXwlVWJrsKYA22mQVAYF10ealEXLq1W5pTexJkkYzn
         G5N2kMGa69ZwSWgRIc+ilDTsLIpef18umn0IQbNJIY+1aqi3z5ZK/bG72GxYgRc6UU0K
         XHs4E9Kv/OkTjDvifBiOJ8EtW/EiEkWrLD6w7u1iT7w64vIiBertSqqq9qeVtzD6Tcjs
         LC7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420793; x=1789025593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XD10siGyv2UXcVcAX66uMHAbJieFBJyM178WgyCpFQo=;
        b=CD208CMCivIN0vdmGwWV7jvAXHfafY+ZKAXxo9yAYezbAU7EnHlgGxF08Yo6UQF6jn
         uAz+yIlHYES6+oFgH74+hekePrUXgFHRiZvPcEtC4zc8GjgtEGrxzkjfc4n453XCcH4K
         4VlpqtEIXzuMV1umm1L7ru7Mio6096K0Qvpqd6GGR9JUjG1c/6uzDF+5iKDC/oKlPerA
         dDlypLliNDVSfiE2ysZbgVlMUebfSxch+B/I3jSWyziDQbEYWgkHE0CC8K7NgpTpy+4P
         8pubK7FkLtEgYKccMx3xpIuwTRYWezxBfGpAd9DvalB6xuHHNYhOwwQEQpPOFIyytHc/
         LtQA==
X-Forwarded-Encrypted: i=1; AKwUvBw/EszBizM3Ns+QGWB4sl8f9VLmvNvyhisjWSz5HYcWAQs9vsNGcjdqyZsHgEtRaa929byskOoNE+R2YJo=@vger.kernel.org
X-Gm-Message-State: AFuF++maHXEOStjorjXPDjg/u/w4qvUvZjZFFnrWdeRm3c/0xnU0AY76
	ELRH8O+NBb05cDtS8mbFEf3v7/Nuvxcd1I5YKNyRAF/YaQUwTZD9WYo5mmN6pw==
X-Gm-Gg: AYBFou1g0XaKuaxg8yBiI2e8gNgI+1ZdFPHVZVPVYUaAxzw/rt2/58CK+RLpXna/oRO
	c8Hi32KuKEdwpTcQsZTD2QXXV0Muk3XY4kAWk2JljyIODlfs+8HYAy89vp11sBBnMwG+sXakpu8
	aOD9ZMA54RbPY6XBIGWgzsLGxEguSFUifc8I5YcQoDdmf1Wwyubp6WaLN29Mz1vkqZEkZ8gryKd
	1wekThI64apg7WWKh9lrdX4CujLJ2Dzd+a6WtHJ2qMn6tMWOb0cYTaHglzF2TmywsAbvahjpdIS
	uAOJ11iF02MOpNS06vDE6UEU8MgYM4oWC4WYCGxCvWoQDeYu4MtcT2RHhxVm7PilRAT1DRKMCLE
	p8rTVmNy9+qnUc7Pq6rsZKbHKqXnNaBaNJUhJt8WaE5Rn1GeEUgzLUXBHerUM5XQJr4FZybtbeM
	0ybxPUaUhPdWVftAo3V+QRk/S9Gtlj9eSPdXe3zQKcg6W7k7gGAjdlIQgQyPKKjZ8YoQlHo0sdt
	EgcPVX6mOccoQbbrUtM1PhAUST9E2c1H0pXazM784HOfFx1eK3Rnv3+XWU5K00jdCJ1ciTmENYw
	aLk8QvadzqrPYsM=
X-Received: by 2002:a17:90b:2d8f:b0:398:9beb:5c17 with SMTP id 98e67ed59e1d1-39aee13d992mr17057325a91.18.1788420792882;
        Thu, 03 Sep 2026 00:33:12 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v5 0/3] net: xilinx: axienet: Fix IRQ error handling
Date: Thu,  3 Sep 2026 14:32:49 +0700
Message-ID: <20260903073252.339250-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series fixes IRQ error handling in the Xilinx AXI Ethernet driver

Handle errors from optional IRQ lookup and preserve the original error
codes instead of returning -ENOMEM.

The changes were found by manual code inspection and compile-tested
only.

Link v1 : 
https://lore.kernel.org/all/20260811034715.6034-1-phucduc.bui@gmail.com/
Link v2 : 
https://lore.kernel.org/all/20260813042012.17631-1-phucduc.bui@gmail.com/
Link v3 :
https://lore.kernel.org/all/20260817105241.63345-1-phucduc.bui@gmail.com/
Link v4 :
https://lore.kernel.org/all/20260821123249.41527-1-phucduc.bui@gmail.com/

Changes in v2 : 
 - Split one patch from v1 into two patches.
Changes in v3 :
 - Move the lp->eth_irq check below instead of handling it immediately 
   after platform_get_irq_optional()
 - Add error handling for platform_get_irq()
Changes in v4 : 
 - Add Reviewed-by tags
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.

Best regards,
Phuc

bui duc phuc (3):
  net: xilinx: axienet: Propagate errors from optional IRQ lookup
  net: xilinx: axienet: Handle optional IRQ return value correctly
  net: xilinx: axienet: Fix IRQ error handling

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

-- 
2.43.0

