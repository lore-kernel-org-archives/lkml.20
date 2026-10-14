Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC4A48C41B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963953; cv=none; b=SYvWzcTcJv5B8LU97MA7SDHY9JVFGYmOMkSV6OLK0/SGuki+HG3OArVwcHiffwP9MgS5GJ5xZ0eeVFpSPubLnjj/z7cgu9Ir1Fly7lgM/xEkZHDM9hxBDR1uxxOSemN4F+effzHK0ZsNGMuF0QBgOvoTHXByBX6/PcBZZJO/ORE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963953; c=relaxed/simple;
	bh=FG/LJNXH1VUYYc/k/8W7Og7Fpv4MygAGBEKkCvtgcNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AcI+ZlXRmdMhjOnkPoeka1ZeZ2EPpwtxkdqxdsPvEHWUXY2VhQqUqznIJ8E7lthvmkup0lvpQq1Nro7K/GbwteYzjkgHP4ytXKj+bFqZT0Ib1x9VN/UH7WP/ES5cZBufWRwMkDA5xoRdxP/s2ifENJbS+r3dwEb9+F8nQYJwDcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oBGd50BJ; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oBGd50BJ"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so580761a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791963949; x=1792568749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=oBGd50BJWqnpw1RWZLe2K/yPcnVFT1GAS8WukkO+VbH5oj6oqtLg0al0l1BqtuVM6O
         YWxtUL8OmCEMtwfhNFpSkG5I3qRc6tmuScb5YdCAtwGbjP1Jvp2fGMSMCO1WyEKQ0Hva
         k97qnbJUMvmlIXlx4zleGdFg5Jg84tXb78tkhdnkYpP1hHNiGevzU4+yBnw3juQlNUBP
         pT7atz0NOR2Ib62U+bUu91rR39mixyjDb1/Te7d0mqFn4qd3bozW9nYNt+VSb4NwLpUZ
         eeUeHJS8GlS5bx7vOepbRv88kVbS+D9Bc8gFcBZ6TETIxJ/6/PIecJRkDPLI932eq7Oa
         m9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963949; x=1792568749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCKIAVPSYo0vK8WrzKbxMMpR/7Fs8ssXef3I4R/nZQA=;
        b=UYkZCgfp38/gp2ppViKPfMT/ORfjKcnEaZmtLuAcku4kQ1nQrGavAuB+CQDBBsC9np
         yP48WVi3hfqb+czGBnTqqimwCnMOK5I9uWi+1T2XMAFCROm6/SjZmJGU6U0fQBfO/MDn
         i6GwfHDyfUTVLnC3IBTNOI0qHozwfVafd7GIanGI9/657hZf+upJQ7IN/FuWf+kqHmJJ
         YffaFayi/D/2NzILjbEkikZR7MyFDLF3FMutb6WEfuVdfKiTVnBO63En/5sok45Vkf6p
         LJK7BxxhRMXxFsQeUX1kBp9NX9DXgb2Poqd/gIWDrG24rmqEh1r1DzWGnT2JTGnQpV5H
         6Lkg==
X-Forwarded-Encrypted: i=1; AKwUvBzm8FnruWMB8i9D7MPkBbUhGuGy+TepRLOx2cqguManVbbnimzP3UGcPndc1n8moXKJS5T6geHkKe2wK74=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQIs1ubzAHfppIvYS/5oi/FSGY5WdGW9/Pqzg0HEmmcBJWDbDt
	K5XaMOqJy5VjkKP/U0wcwZsTVA0oqrLhLLj1rLJcpOuZaSNR0gRJFxyzXErxBsZYhA8=
X-Gm-Gg: AYBFou2rW79SNgbXKKUUeIt6Zk6RBa/KfTl/dZeOo/iYzh2eCLl7K1lnsdlESFoBWPV
	vl2gYteXVOKQIPq+kf0LnvJOS5vKWu74vEPZG914i/bQq+p7tV1EyDbwU+XtDnGrWLMV2vNwvtO
	g0Pj0ReJyj8u/ghg8qg9aAqkcOLuzjOE3Yj401oVw76tfS2L+CbrMqQjmDVL+AWsrKlKjUrayiQ
	MQDNbwSlCstA761TYzv/ofnRlITm0MDmPHBh2OWFmcQkpfiA9ImvAKJ14QgrazOznnNbucK5oJY
	yUVg1grZDAJkIiL+Xvljmx7273YXp5H6aLg9GbZ29InNcfkXr8uatY94WHKyWnwdFsjXr1QMh/L
	DFzoWef+03yakZLJ2ZiXLqsmQKNCGFMRsIMl1BriyOF+Mt21/f7n0TpiTKOYDwawM08GVTUQgqy
	wGS89ge9aZ4XfYh12XJykaiBhIgQuluOUiRVtacaCXPH/fORNtntkPi3BMXsMKy6e5KfAI
X-Received: by 2002:a17:902:e74d:b0:2e2:cb65:a719 with SMTP id d9443c01a7336-2e842ab6a10mr114098215ad.15.1791963949146;
        Wed, 14 Oct 2026 00:45:49 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1347sm67038615ad.44.2026.10.14.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:45:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 0/3] Add SG2044 eFUSE driver
Date: Wed, 14 Oct 2026 15:45:12 +0800
Message-ID: <20261014074516.240247-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SG2044 eFUSE driver, The eFUSE contains factory-programmed data,
and it will be auto loaded into shadow registers while startup. So
only MMIO read is needed.

Inochi Amaoto (3):
  dt-bindings: nvmem: Add SG2044 eFuse controller
  nvmem: Add Sophgo SG2044 eFuse driver
  riscv: dts: sophgo: sg2044: Add eFUSE device

 .../bindings/nvmem/sophgo,efuse.yaml          |  61 ++++++
 .../boot/dts/sophgo/sg2044-sophgo-srd3-10.dts |   4 +
 arch/riscv/boot/dts/sophgo/sg2044.dtsi        |  12 ++
 drivers/nvmem/Kconfig                         |  12 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/sophgo-efuse.c                  | 177 ++++++++++++++++++
 6 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/sophgo,efuse.yaml
 create mode 100644 drivers/nvmem/sophgo-efuse.c

--
2.56.0

