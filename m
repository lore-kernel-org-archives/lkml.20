Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546F741D4F4
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 08:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791446770; cv=none; b=UfPpmFZRLDVADKeNaL9eQKNskJcCncyRunLyaOvXmmhoZ2r31xI5bd8d/ePgb7LbrkgU1F/GRfcgpyPSnowHGQWGxMEb610c3kT9HOpQUuT2tf8CKcPKn4s0xp6DC6JB6bRxPy1kCKsZ1Ctq4Jfc0ST4BXF6ZgmDWescsg6pRmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791446770; c=relaxed/simple;
	bh=zqhjOrjahKnz2HWIqkVU83xsJUR6G8K08BAJhiFtEb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGBZFcW2WUu+ENHtJVu1meCFawuh21HGX+XNstFTg/IlXeHbpEpYfeKLH7bAy0A/9NPFaqpmsbFy2fyN6q0Nj+JGq6tGo2CYW/oyN8YlAmQXIoh+86unkUZ/pCR0xZ8ndb4r8riCEOvGF+RStS9dFJQnhm6I0yqDLAbZgykYDlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkPcR/9k; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkPcR/9k"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-873a4edb243so3447085b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 01:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791446769; x=1792051569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zqhjOrjahKnz2HWIqkVU83xsJUR6G8K08BAJhiFtEb8=;
        b=lkPcR/9kJCO8fDRmPV7Q9eQIljHAxhy7OKnFMNSq95TasvBrCfZ3f7ZvfnFspqqF+j
         EDYKd/vUTbwIY5llh+PzD6/IOxpZzZ03Zb9whuVUBLvCDs4kyzHU++8sFrW7F/eeLlD/
         O7bbVJrY10t6zGONCYkJiBn0Mrn5U5ZE4Wf4MlpuYx6mp9081jUejYus1Wk+CffqGMTU
         RLzKJ9gJ7CrKJ8UnYmHxE772pcLNYJrhKDYU2Wx43+aZ0gwacJymp6B/AIJI32/zuZ5h
         7xriE8RFZbmTuFtMeZ5CfzRhaFK63JOiFF6un/UQSrLi1Cr5Psi5jEbeEWHfBOW1/HbT
         7r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791446769; x=1792051569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zqhjOrjahKnz2HWIqkVU83xsJUR6G8K08BAJhiFtEb8=;
        b=EJ1jDvCvYVAw21zsNKco0jstkpD8+ZrFQafXh+Sy8XYU6fXgG+tlryM/MB5HFM8A7D
         3HQEw8/dxzPs7O/HlBcN6/wEH+WzUogMcfJBJH8Unu+BZIBlLltoaIhuisYlo8n3TpdN
         OxGq9j5Jzw7hm6/YOuYY5iy9hmtDCzLK/eZ/wF4IS3i34FiHOc9w0H2LctOVHTHv5rRr
         MxdT9tJrp4NUyWehbcrxlOE77GMVJr7K0s02cAiPd/1oBbuMays50yoGVJ+PBOelMRBf
         MgiTyN82MCMUvkmHed3tF4+3mxs44bQlLgXSZ5Lt54WTh5UNDkSmeMjZXOkORn4CdLs1
         lnNg==
X-Forwarded-Encrypted: i=1; AKwUvBw5i1e9hxELcjJ53S76EsBTowOM8Gb+KKijHKpTPZSUdu0mMkDdOOA1lRR+bOO+826cNHk7yRoF47xRkmc=@vger.kernel.org
X-Gm-Message-State: AFuF++nqWWcPE8mflUK9Of7rgnznOeEz1zHTxRwn4uw0rQesoOoZPScE
	PGopL1ePL588DOAVGTo1glaDMkVnSkcmlbTf1EWwCmZ0fHPv8XkI/F63
X-Gm-Gg: AYBFou3MlxCG9kaPO3YMS2qDbD3ARjpctTxbmo3MvHya3wCrlXZhO8QXPZJmzIV5eFS
	xerwInkHmxnY4mwnSsl/jl/QCpkRPZe3kQKUUbRuNRaYfXxtxFV/BffS3aO2CUtlYWwPUSJ/6Vo
	onGVEHMlEnKkkZ/8+q0Y8zJslWPfQ/cenyiltSgh66be4lFcvMIsjmluiAXcWKBshSL8lJ4gVgH
	mYYxsVf2lHDBrgEMPVdnP67/M04MvDSLYL44QKTCdTSFef47QOiJUor8TGkLEkNaDA9IlT8rdEY
	5KL0NQrh6Rxh4B5/fMnVyIFUQxZQtUSkLaMDAIoAk+SGDef2T70D3sLipg98eY08Ut3WRgeLAn/
	pnM3XYsWix6K4H47ssGDt6Zj78JOMmWCxGvVuVCPkMPP+5vMMs3w4xioG/toqsioP4OrCSQgt9P
	mS2pP+x3FYpSSRyreIiL4c+obEPVzVmbce3zDadOIRiQ6O5HTxXDkIAKZa+g8vaHIu4ffE4W1Uy
	xZm5IST35xSCssayEs1EMWznmoUh73PltbU57GH/HA4IhPmO9ykI6YcvO/nBDJgZfL0gk1H9Ba5
	W+QqLdkpC4vyVE3yk7Eyp1hiXjtDoI4c6MTz
X-Received: by 2002:a05:6a00:288f:b0:890:a995:1f61 with SMTP id d2e1a72fcca58-891b138d421mr4452911b3a.15.1791446768676;
        Thu, 08 Oct 2026 01:06:08 -0700 (PDT)
Received: from cs-107073042055-default.asia-east1-b.c.uac61c9752218803c-tp.internal (191.247.80.34.bc.googleusercontent.com. [34.80.247.191])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-892bb49f494sm1276097b3a.34.2026.10.08.01.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 01:06:08 -0700 (PDT)
From: yang <yg.jiugui@gmail.com>
X-Google-Original-From: yang <ygjiugui@gmail.com>
To: Fuad Tabba <tabba@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Will Deacon <will@kernel.org>,
	Zenghui Yu <zenghui.yu@linux.dev>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	yang <ygjiugui@gmail.com>
Subject: Re: [PATCH 0/3] irqchip/gic-v3: Lifetime and range fixes in the GICv3 and ITS drivers
Date: Thu,  8 Oct 2026 08:06:03 +0000
Message-ID: <20261008080603.1987-1-ygjiugui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <CA+EHjTx-MGu=Rh90WDnTWMS4=8vcOdbhR35g42BtRBy7wqXBXg@mail.gmail.com>
References: <CA+EHjTx-MGu=Rh90WDnTWMS4=8vcOdbhR35g42BtRBy7wqXBXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Reproduced on /dev/hmv (HarmonyOS KVM). It advertises GITS_TYPER=0x803ff71 (IDBITS=0x1f), which triggers the unsigned-int truncation and causes nvecs to become 0.

Tested-by: yang <ygjiugui@gmail.com>
