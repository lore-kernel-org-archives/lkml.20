Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F348E3D45E5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 22:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789078341; cv=none; b=KJTFuuxGcigKcHCZynU+/hWZAsf+4WZfMicMqnkKMi0ZY2EbH8NCZtjesh3iNEvtf10ZeAydtHve9m1iCMD71NL9ckbWDvD459dg/fA7GyboYsR047XtXqNZCRqQJuL+8K60UST7Fp66RkV47wa0NmzJjFroeideDZh2a9Mp4bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789078341; c=relaxed/simple;
	bh=7eZ6MGYrn7UuTOMdMokn5OY5P6XozBWE80r9RYz8pa0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZIb4KDaAYIqgHlmOmTILPr80ztTGxWwMhOTDQYUF1cazgzFwkNr6EQGJjQiAsekAX9j5QzhawC4CsqBhVnqMETu7swS8ORDuIXsSYFfRHj/fSL+YCQKxXljtFFMIPemzgJp2k4ujVQfczlJFjU4nCWA5NcPW2zay4gcoA7f0/54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgy/Yiyj; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgy/Yiyj"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8523cc8262cso24125b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 15:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789078336; x=1789683136; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rIxoez68u6cYjUY8xm3+9MUMr1Da3TBEKdq2C8N2mec=;
        b=qgy/YiyjHbP7NT9NwyzQYaXOgwKg07ngmehhevd/YTY7OIrMZqWsdRnRuOlisuqk4D
         26MAi7C4V7qNia53Y+e9zzzCTXawzazS3zfPPoT1EieIWwxt7NZjPw8/F8UdlAZsKfw2
         UhjhK4Sf7nc/UKZhUFU5bvz+DrFsrq5kZyHqh8r8N4S1pkhR7X22WNZ2tLZuKs7ZU1Cx
         AqqL3i0g9SgM1TPHC8dfnql4Vt8cRYNVutJzAozEys2qDV13lzuo2zT4D46q15V6YBCE
         UKeA5gH8zQUcB0m6rLPdN0APchAvjj43zgxDYrLTvjaCmOTNscRXUw7Pnav+ZXEA1230
         vpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789078336; x=1789683136;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rIxoez68u6cYjUY8xm3+9MUMr1Da3TBEKdq2C8N2mec=;
        b=fSj8kbyabPgGRiYRk9G+UVNw3uj+E+bQP1yBilcK7bxmSTi4p0EVY08jwMWafeJwfj
         CA5mb3plOrkhCPtGiT6yVXwaMmFkWCj8b/iu55WTvTuEnEMFsaEm22L5TMARtLvKyacY
         E1dEF8bYtVpJE+qO3BL/ZVKClgKYlX2m5B+CBV8eOJRFIDh2gARREDjf583AkBDKF1OP
         VHhHhzVMp43fwxtMxwg782u29PcFEd0EAZ9477L1CyapdbL+/GeA2NnTQ/WDZoQFfcK9
         0YqJWSl+dMLjyTe53EK7D9oFP+CJzs4LzVwp9BObJcChd5j09dj5XsxxRl8yrZRyVhac
         uKKw==
X-Forwarded-Encrypted: i=1; AKwUvBxOZqS25mgsdIDfTY0PeRyWzzkY5m3xrowJ3ijs38B6nA+OxQ51fFXNYBO9D0XypmhGzobD2hXsWbpPc3s=@vger.kernel.org
X-Gm-Message-State: AFuF++kHQmQnisu/GTFiNNErcXHXy+jokEkf9CP9bHfFEipM1tBbQhS3
	d95H2FqsDwU0musbsNhFa6ajebCDVmq9sKVv1O1HcKkejZNqX/oZrMlw
X-Gm-Gg: AYBFou15n2FDT9AY6CFqjuoljvvgoNtVTC7WpuTxWlbLYXbN0BfqQ7lWqVMu74QmrCA
	X1ZIEKM4997lmMgKZb4UddkXseybJh81VkhIzZLpTZ5Ezm77JRDL4DxyVudPgAuXW1ayw8BKxf2
	PMG74OguqH0Jeh+pMAiKzIYby/LbtVGOEtkrX4bOEdx1VHi/Os/UFFBs1BF12+EVfalm8qlBCjP
	8ZIscKTtMj24NxOjG+Wk/nARSd1JqgxEMs927fANCrq2+ClbJo4hnc4RKdMHFZZQk3vlwruXzdX
	ilGHO2iegyjWlxv2pNrBImxsbEoxoir6KbL1NeTBn8hW+0zTwDr927uwQlOjU/Y4/BAhnLLnVGb
	rZKuGgS7Fi2KdxzQrwgnW5OiX6AXLor+hgts+oadZlaEJfTaY26CkbvYElwzxf11+c7LusuB4c5
	55bdHEf1V9TgCNnCO4h+47hxZspCbngVYeaPvyIlN+piRHoGzJyY6csvFcgHRgtMJ7W+J4SxMck
	sh/gUzQlAbH
X-Received: by 2002:a05:6a00:4708:b0:862:ff57:7672 with SMTP id d2e1a72fcca58-86b3160fde2mr616320b3a.2.1789078336410;
        Thu, 10 Sep 2026 15:12:16 -0700 (PDT)
Received: from [172.29.212.252] ([2409:40c2:5426:e355:af9c:7683:e7ab:273b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291bf622sm171875b3a.27.2026.09.10.15.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 15:12:15 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH 0/2] ARM: dts: ti: Clean up OMAP crypto bindings and dt
Date: Fri, 11 Sep 2026 03:41:56 +0530
Message-Id: <20260911-ti-dra7-omap-sham-fix-v1-0-c430f01b4e13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bkGNsvpKdNhqqz2UohGB9Pek4
 wzMJIgchCP0RYLAt0RxZwZdFjDvdG6MsmQGo0yjOq3xElwCWXQHeYw7HbjKg1Xbkmpsbc1UQW5
 94Kz/7zC+7weBa3bZZwAAAA==
X-Change-ID: 20260911-ti-dra7-omap-sham-fix-388a067572b3
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
 j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789078323; l=844;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=7eZ6MGYrn7UuTOMdMokn5OY5P6XozBWE80r9RYz8pa0=;
 b=0GW3lQ5bVI6HMiNuEB6pRZEm6cBmM2Hx90bycEmsXp0jnGevSiA357/A7PPohTL4EXCeHrTfM
 LePfyEqWG9tDQTNk09aVTB7wgKgUA19zbRwzZJ8NvDgs9oMbdpdlepm
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Patch 1 removes redundant "clocks" and "clock-names" properties from the
DRA7 crypto dt nodes.

Patch 2 updates the ti,omap-sham YAML binding to add the missing
"ti,omap3-sham" compatible, deprecates "ti,hwmods" and removes it from
the required properties list.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Bhargav Joshi (2):
      ARM: dts: ti: omap: dra7: Remove clocks from crypto nodes
      dt-bindings: crypto: ti,omap-sham: Add OMAP3 compatible and deprecate ti,hwmods

 Documentation/devicetree/bindings/crypto/ti,omap-sham.yaml | 3 ++-
 arch/arm/boot/dts/ti/omap/dra7.dtsi                        | 8 --------
 2 files changed, 2 insertions(+), 9 deletions(-)
---
base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
change-id: 20260911-ti-dra7-omap-sham-fix-388a067572b3

Best regards,
-- 
Bhargav

