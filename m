Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581850;
	b=Ju41hj4wPxwDb2AZft7DJXBgZ2lMx0tqqXShoQ9gSiDm9jiRhGb3wfbVU6EELAnQ6E6k
	 glj8sHwzoCQa+MQRT1FhSpUi9PvnVADqDRcWs7Dp9Rs9A6ff0OtHLZX3lit9u4TRsKJoB
	 MvMUDPkJ5B65yxZ7zBsK+MVz6rnre4vU7yLNZx7oO2vv7QHMmjFMluhWHhDJi/NDTSm9c
	 b6oTF9JrfsqrEB0eFqi2pWPgdlsHl2Hy0VTG5up9SnUfBxgwvyGxB3OAAXQbCMUalAfCE
	 6IwrvNPsUOj1GYKcaydQVIrCxpumQqpUEzDRlQzALSnW0cfPUkywRm/1+QpMkLXmWqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
	b=dcsgvBuXKN9va63hMaiNH2Hv/tT3sObiofxA6Am4PbTtKsZhQaQv+1Zwee/zQTd2TL1Y
	 wVVgi1bWCyiW+Ib2bufhPIsQy4RqGQA+EAKxgUc0D6BhVpEK++pydTLSGBGpnAYeRsfYT
	 QIru3syTWK3FDmncAg75SuoK9gaFuucclrGscOEMH12y3eFcZjnR+I+CYmAholJ6NpMV4
	 IVEmx7LzB0uz46CCaDBCg5zt7Mnk16bPHac24LWO+Q1FVUOYjqE13MYSPPr/phPCCZDKo
	 1tiNDn49R72WrEw2Yj8C45dI8ITUv7icwyZ4hAZM95GaPXRW5j18zb2gpCKZl0+Plfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E35606A33B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E35606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso180423366b.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581848; x=1795186648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=K9CSmkJYNmtAbvWCYPrP+SDpZMQQ0xdsPYXo8PsLi7q0i7Is28YK2oObjdZIdIT9Hy
         oUZeGt2AyBbZItYfe9wK+vYDeM1J8WQInwUA6ANAfPmVZ6W3eHYOh2uFtetiapb8VA7z
         2hJQEzbUki2GkUe54rvHxcY47jRM7YZ9kawcYDZpTB1ajp4LEuTAmkgk6NQg2C0JRwhT
         FJuYRGnfvm0iGRi94tXz55orMhZs2oscRwq261Ud/F+R9cedJFud5B4MJ3u8ZUVekYRC
         XXw54HRwFyv2zeglylezSoT/W0SPhglx0UvxuGoBYFkIqAwretjToNI1b3jjRZTQzKP5
         Wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581848; x=1795186648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=IwUCewDRXUmcKUU3wt+kjktDoCQjF/eg47+b0UWwmSwX2C7F6Fx98lyQJleGNiuJj8
         QnqZ1QsmHAd1ekUWiiJPD+r6ZugHyWRIYBX2SF7+lXCE/k/tFFyB6HwL82lbsiGO9b4b
         N+yvfiFwHTSnmVMuwFZqI1INozNgZy3/d9wuqE/Xe212HnvR0Ov5Vqf/bZm6wjuYq+TN
         803uva1/sd2lIx1xbkT1N1tTvtbdR+EeYhUcWaYU1zqBWZ+veSc/YZuQ0zgQnKlRZrEw
         17n9edUU38lW030Oa++udoUZs5q3KBfqOs4lVHmQPd6ArNWtmWohrOt4Bt2hMSXcS7yK
         KHHA==
X-Forwarded-Encrypted: i=1; AL+hErF0jzJFWk9xuA5zcpqZD2V2R9qSLXi6bIED91b5F3odSxg2vJZ/Y6ULTwEJPxz+nFg3K65OoCL57egKQmY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8axzhJsGHo7bKShltqf/vKlFXKeg2z1cnmdMdxOsL3O/wXD8bn
	UMqLcs0w0fDUzzuuW+4hNst6sERga5Q5c/OUOFPo9jiB9AG7JINuXJ4g
X-Gm-Gg: AYBFou0NwxNv05JwHRUBVGA45iTdE7cDixhPjO9QfuwnFkFEhjgaAcln2w81JJsMa02
	NR5Db5fQ3QW30Xkt0wI0Zj4/cPVpC0ffBApl6DVKz9yiU71vRY+oJ0rmYYZkIEMExHg73CBO8Qy
	TmtxB9I+bsfSNtqf4mhZKWMbcl1nGJ2ZdgdZXS5FppqXYeL3mE/9OwDRNEStevkHKyHldAy9p3I
	v3RzyOX9k0vtfyDhkt6XAqy3OpLP8T4ly537LbxcbAB00de2rpPebb2qNgv8LviN6Pw8u0WXTE2
	3g4BAgoS3EgNXrjQVWYn+NXcWHgA/z7GqwAbSNbEcOk8AqFx1/b4d5bRoesi0Rf/4G8ISUkgbr9
	hrIolRDepCzUHmSDUUkrVzqKya/Pz8gzrIfoZW0xtIjxmy8wDVAGQahNfxaDhTxCC3XfxlQjJ/R
	J2+42BFxJEkF26mi1omMxFP2EmSwmY6rTG6reuz7LVk9dOFg1/BXlL+hQDDN9J0oeVXLKgpwUvo
	7xp81kEZw8hXFQ+nak8l2K6tRoFcoDlGLpU+YDt9NIrJoFiySTn3K5pc/ED11wLNb0OhgRCQ1md
	eI0t6ZmBX2eUsWbcJJkHWfBOthBzEnSwCCh2HRjsU6e/nOvYaMSk7bjp00KQX12u9BlZALDbK4y
	d9V+WLgzYQUwhi9zsvo5RL+nyMIOY8KOb
X-Received: by 2002:a17:907:3d51:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c5096312247mr256633166b.20.1794581848001;
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:27 -0800 (PST)
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
Subject: [PATCH v1 0/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:06 +0200
Message-ID: <20261113145708.261530-1-clamor95@gmail.com>
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

Svyatoslav Ryhel (2):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.53.0

