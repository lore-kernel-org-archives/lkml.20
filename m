Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841381;
	b=N6gqaJXJoXrUOQf4Qp0jkGhbW7m6gcKYw+mFQXBFar2Q7ZAztwTrvUg29O9om3kTez+0
	 GXGKqPQdzoX+uMBRrEqn7K00q+doFsT/zMn/H9Voa7ncj0Li2PIqqSfMyLWZc4wTexcFX
	 HfdAHwgmfE+ybmpUd5NHnOOWDS7hvL0Twy5Zf4piz9SUL/K3Kt82sGyOfdFKePhhdHJSO
	 vfRC/pDeDYpXu3nnjoO3PASyqbK0JOj3Qh6L3u8CEea2Kp3/OdMf/x1Y5t2jYPgOQS+rf
	 gfof/l/Vz2fkS4q0L6ct/GxItHn5JPZtlYcqR6FScXpxEIaOZjjl8WBoKEHtI5VWPDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
	b=CYdFj+UiiHUqAoa9Zv2peEpsBbZLuBNYPntzaZ/uP4CGaUpAlfLaM2cckbNv+wqyeGkd
	 I/penSoXqKuTYufxeGWBDWOAqR6ZwJXOcmGRtdqR9Q1zs4R0+YFriPfVgcS7pptfvBN6b
	 vqhpW+8m4RQbAsvVatVMoPzOyw74EkF+cCsJLNk45evivsxpA813R6OBNc+pl4jpGXpdr
	 A8E4RysWXY4E16xFH00nNzIv59tKNxPxZU0DPTjOji+o8eykP5Lkj3tJTZdjHwE1T5ihf
	 dGhz9adY6nWhSGnjGqrAkLpOfTbQWkmgS17GvncgrBYEQua8V6H0nga3SnZfOA5AunQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E705E606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E705E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d30639709so500961866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841379; x=1795446179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=drB0Ljxt7dHrG40ww1KORhWiVcEzVArQ56NMtqkUI7231QZ7f6L/AN55e1stCFjlqL
         fA7HwhA2wMsSJzPWtahQGy5Giesqt+1W3MFERRW1XpPQ1l1m4cpx5+T0OpsvtioucCl9
         16UjIvxuSj04KjPAEcWHe0ViZMCBUMoR6BEvy8+HmAl9K9Pl91itnxo3chV1Nmbzqqng
         mFFh+OmgaBqQboe50IfEx7UqDpVaTmTnpxKX9c6gRotqe93K84SNfrHxkoxy8jqpG3LM
         JiI87T0Jzbo1dwh8Gy/IsUe9iMZuef0yWRc3Lcsi9LbI9P6TrPn8w6YaaMTx1TBKR5nV
         fjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841379; x=1795446179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=fDvPYChJ87F+3KWwM8UPN8y5lofyzHxzbFbUJK8UReNiT8TTa3ldUXzDIpMTVqGP6h
         BYIRTTIbksF6tVgcSB0brpMV3nIY69lYU0hZarMYhlBxfjG6fQ67PFqytixESgr16mZL
         N9v9Y/rxQE5OUUqfDJJHf/yZtiD3WCnxH2MjKP9mT60jGa3i13UgBnK6eLUxhH8kPqNt
         +dPcf3r0oXO2CbKPafXSwOXL9qH2AwY/Bb1ApzeykNodvCmlD7/wBSRBFE/RCKWkc1v7
         bKHCyiypxYBF6k1DVVfklGrQpgx262N8UHOifK2IeJkwdABjKfmkrHV73IsD5+5veHxF
         aWdw==
X-Forwarded-Encrypted: i=1; AL+hErHlwdVAyEwaxxyyOMRItuNmqZxLwz6ATzhTEy/OOzx1fceOa2E2d+825o+XxuNE0/RzNM07JalrWw2fnkg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8KsmgIhIwaEu41lwGo7zSRI5JQFpCHLZf0hlpWz0fys03ggAR+
	BcdyCNoqtOl4RvYTLGJ+EF6tPlPSbHzPiJFPJJYAzldhyEIflrfGdogL
X-Gm-Gg: AYBFou3lhpwtO7JrVg+c5/Ekp42O0Jx+WFbPV8sVAlusma7CfAbGt0ndESWHfAGv8st
	TA5tkTKZiuxbkd4nHV50WWR8B3fGSPk0cUFDCO+xf3WkYJn976DfycqTXGTN9X6JETK+pByzKMT
	myBWV74KaptE1p4M7lN62h+cFumk4Okh+p4k5GCkqVx/WjZOjPQEHqVFH8BjmTkSpM81S1S+ohb
	JxLRnkbmFIs7JJoy03943nYl9NAGNG5Vb/aCFV4XMH3/+u+lLKT6cMt5Cm2z4MdCQU0EbExmmPI
	vb6t8gvLDZpAkA6oO79+72NzQ1J6ePwxNVY08nQojau42xaEPNrOlX/EbIWHvSJWOB8RSxYAkN1
	q6blZ+FxLjWhBTB78Ob0OgT9+nI2mFYEPDBcopVUfIPD0blFMveftluBGcOvoEExCwS+ivjpUz/
	gdpsYdMYIAIEBEnuAdM+4nkeWXEUIUnvaWON1Uhti/DBH7m3TPTzn20kGTRDHPoqis5P276T5d6
	ikQzyMhmJc5z+RX/M815bAMeNWsfI7bO3dmr2N0Epc9qlj3DOSCFuqgdZ5CCu0LDU4A0+evYwMC
	zOjPbU6wGR3y0jE0mKqfjloZRhv7Z9aPmJDJlP1pNzYKTRzhcTv1mYF84ubbRe99MwqN2x1YuTm
	pBibHfisKI/hjT7RZPbs+n80NZF25G+k=
X-Received: by 2002:a17:907:3e12:b0:c4d:4ce5:7733 with SMTP id a640c23a62f3a-c509642fb9emr826689366b.30.1794841379065;
        Mon, 16 Nov 2026 07:02:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:02:58 -0800 (PST)
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
Subject: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:36 +0200
Message-ID: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This change is similar to Tegra30 pad clocks and is required for CSI block.

---
Changes in v2:

- dropped CLK_SET_RATE_PARENT form tegra114 pad clocks
- added commit to drop CLK_SET_RATE_PARENT from tegra30 pad clocks
---

Svyatoslav Ryhel (3):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates
  clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 drivers/clk/tegra/clk-tegra30.c          |  4 ++--
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.53.0

