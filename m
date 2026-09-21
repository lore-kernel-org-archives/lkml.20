Received: from mail-pz2-f20.google.com (mail-pz2-f20.google.com [74.125.228.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CA38E8A2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 06:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789973851; cv=none; b=Sj9oOV3bL83Xtvlx+3qGQ/C3pXbRfFlTyRfDLoc+RIBxWRr5RzmYHMT3ba9f2PXVjTByxUbeBGPCcsbMsuWtpiMIOFifSRoTSnfUkAXoCxutaABZwjC0qgEF/d3vM1Eg0ixeZelXaNBuHo+uSzQlEnulK/Z2XxwmIltJGRNwuWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789973851; c=relaxed/simple;
	bh=ux5Y/3LCQzHxHZau9PhawOjE/YHeuznlELaCm+TSCwk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KslMCuIjcG17FPQeMRts0w6tV/en3HnQBB/Qul1pX7diBxoDjqeGrOjveBQ9LPWN2dsTdwPhmLFBnWSywneJyzDDmLZlPciPEOZ8pV2a75NfLhMSSFbV46/FvagifMtfyBa20qZfoKA9A+DiAkw1G24VoZ6VppBwRgYskKmIFuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zk0bEVTE; arc=none smtp.client-ip=74.125.228.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zk0bEVTE"
Received: by mail-pz2-f20.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso1827367a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 23:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789973848; x=1790578648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AgD1qeUlj6w+/Yc9BcfnzKrqeR+7yBEE6KB5pQOTKC8=;
        b=Zk0bEVTEGe9OAtTQBt5gmrN50gWiuTqWGwuc1229LaxuXUaHqY3450iK44FR441Cy5
         U/1iX6Al4eJLqdb9Ud8fWjtVwDnUCMb3XLq4PKyRHtPFR/76gw9Gt1is7f2yhAKNElW0
         Oh68tsHWJ6nawy+oj7zlv2MW4wnG1TBFOSvrRHHRdVTHJgUvcXwrOJfGtFYZ62MZ2wSF
         FKFtl6tn4oLbomdn7mrS2YilvPYkct1vJlaDYAqzLklJ2DnCUp3ZSFI+uTBZMIMSIeME
         h+j4TzvNMAscj6Vhagn4oGvaTqaSgk8A+0vrsW/CDrvgzBIckx5jwbfsPxf+jm+wbiLn
         L/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789973848; x=1790578648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AgD1qeUlj6w+/Yc9BcfnzKrqeR+7yBEE6KB5pQOTKC8=;
        b=qBruUU4cQS0KT2kzPHqhqysNUUEtlo0fCscjl2gl/PgI8EBcKFToZWK+i1JUDrPnY4
         P2CGQ0QiT6dmuJElLXik8m1VcF9KQDkvGdLh3hoa76I9crgBPfCjIF5Ist8xDdsDnxbi
         dCiXOlFQe70BkN6xF0V0Rm89NNxzzdEaV5+fkE/eVTCZiVCGueunK3L+wmojnwHo3OME
         rJ8RJzpdLEvH/Q54sARF57wk2ddV5u1Zk2dy257vX8HtoeUGX7AqzOHovaA/O+2wLGDy
         00mW/xcvZSnyF3etOiiyonkqHCRsXsI0kCBPsRy7pXxwqsje/grTg/jl7gZ8d+C0QCAa
         KdKg==
X-Forwarded-Encrypted: i=1; AKwUvByMcrzGXdW8hAd2M6/prcOCD3jykAlN6v0f3OF6NiJPhyzGV3Ne3XRVV+mGfgJXzRpKhCt9Ni7gfiNx2pU=@vger.kernel.org
X-Gm-Message-State: AFuF++mGTNhjyQz6ZNI01qBxWpraeqEvr3RjHOa95dOCu8pOhYMxVO9c
	XuXD0NejfQjPOr75Ex711eaD2k+iEwBJvUIx6LdMA7kIhImQz/wbfWej
X-Gm-Gg: AYBFou0V1TSeB7y/Or2pmCNYydccIz27dlfG33EROxMNFx1zI5qOAbr7eeCvv9ML+1O
	p6dun6tdBxDI2XXpyMzPra3OTOZR6xVzG8L5db9CenIvZXRbjNeqGlABA65GY0J/peV3nrlbpCr
	LL9/GEnB+kcKSlsAmSF/5iNFAH7AVmhzRUpDL6IyWVqMinOHfpnvKqkHqONFcWoe6amaeB93xPq
	7N99tXpNOB6EbSCCjAi3BsdxOQ9J8Hyz78ypJRk8e+MJ+A0fg7apC9XG31GRTFUT8PQ01X+CoXY
	vaesADX8LV3JOeyZsV+U8YgDf8gNUDba2s01lcC6p8blWPK1Zu45oV/rSKERTB3jkpBRTNbiEGV
	Fw7mcTQb/XZlJX+gWtYeSyi5LOKSiv+QVbeN8EAtRzcqFHRr9Tznnq9syAjk1Zn3c8f8rdiHGj5
	xEYYbG+LtHgJ2YHk2Y1vMqIvkYXAAyX2mciier5nI/HYJSH51wmldCxuEYXpBVNqPbVFyrdUznz
	Lrk/uFR8lO88D+dugV4uQ==
X-Received: by 2002:a05:6a21:b8a:b0:3da:ec28:2cc6 with SMTP id adf61e73a8af0-3dd8c53b1c6mr16053662637.22.1789973848374;
        Sun, 20 Sep 2026 23:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:9391:ec5e:64c1:1347:62e6:6b8f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d55f299fsm31398048c88.15.2026.09.20.23.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 23:57:27 -0700 (PDT)
From: ASHISH YADAV <ashishyadav78@gmail.com>
X-Google-Original-From: ASHISH YADAV <Ashish.Yadav@infineon.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: [PATCH 0/2] Add support for Infineon Digital Multi-phase
Date: Mon, 21 Sep 2026 12:27:00 +0530
Message-Id: <20260921065702.93196-1-Ashish.Yadav@infineon.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ashish Yadav <ashish.yadav@infineon.com>

Hi,

These patches extend the existing driver xdpe1a2g7b with support
of xdpe1a2g7c model.

With Best Regards,
 Ashish Yadav

Ashish Yadav (2):
  dt-bindings: trivial-devices: Add support for XDPE1A2G7C
  hwmon:(pmbus/xdpe1a2g7b) Add support for xdpe1a2g7c controller

 Documentation/devicetree/bindings/trivial-devices.yaml |  1 +
 drivers/hwmon/pmbus/Kconfig                            |  4 ++--
 drivers/hwmon/pmbus/xdpe1a2g7b.c                       | 10 ++++++----
 3 files changed, 9 insertions(+), 6 deletions(-)

-- 
2.39.5

