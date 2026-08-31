Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC61408017
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219515; cv=none; b=Q4fRJyou1HqFN4LJhzJVeWUE3i9cpVtG4ztWURteuy6c//wZl7z1VCLXJI6zg3KWoDeL4ERfPLKAsOfoGkjV/XENX9OtYhbrzBvypdLeCQIYEwxikF2bzrSnIvDay/U6ob4uyyqkeuTdqDav++PWMN2tP4mZJy4gAP8ezHhqWVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219515; c=relaxed/simple;
	bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dbysEQlgYorPGyV3t2g+VIEWHxSJBj/S1+/Nftm61njKTTIQCr+PglFqS1XTWCVd9geFEgvC6Ke05HSTt0hRtwAPlNHJmr8oTAmJohxSqU8QnJgTJi19bYTEDqTzr48ngK5fDGjxMWQ+o6U6Tv5Npokm2YOF2J8NVgacAgBsygM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjyS/UB3; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjyS/UB3"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-384c94c9423so496657a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 16:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219509; x=1788824309; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=SjyS/UB36zVGKY26DiVotw/3B0Ri5BfX6aWtTcHyzNNDEwmCkCB24IftXYX3QoRLNt
         Ie+UFMATWCI95rBEg/+4bMRuGKb9lsKRPO1143In4afQ0jzp3L5nXKwaZBS+MrwYEh8h
         +qDUInUQwI965t1zJaHjaxtIGyxpmrltFPOuokVNwidQpU7zzjKP5YAj2DqUtaeHoRhE
         MxgXSjHpN09g1bD3O0MqV0qSUX4kakcGDhGO22h0AFdJZoTERnaJknCUgCOonDX3TLoe
         tL8b5B48Xbc4QiiOfbInGXilHLzKSp6Z5DAlZ6Cd88sIwW/FKQ9hR/S9Des//D9xWry2
         MRtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219509; x=1788824309;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hwQVXIa0QHzqYvJgZtRa9WuBPtpZJLxZSfo8Qc932g8=;
        b=mU0nqLCk3lgOvc9grs5nigTNIe+VTGJ7Gwg0xvl1T1qMPLUcYd3k72Ea5zZoGCDlAE
         k0FFDVV0rZNAEkNlKlO8CaZJd5dMFGD8JEXV9IuOSjmZHfPwnQH+rugO7wCdwOk1E0Md
         w06hhbcpYy+zOeqzQplkrW3AZ1+vnGrMdylkjajZhcTHzkeRKYGHT0cOYP8EkjjVwZid
         bvEdIoM9uQC5BW54qWagAzc9fWZ2NkxElmb3rbhpuEF4OAGtqrBquH1ebqHb8uk0zN/l
         h8h0ZT0UPRqZNtvU39+8r2GXRS1L19LSs11RxH712E0saL2AchKtdLjklrbMW8iO4q2b
         GrfA==
X-Forwarded-Encrypted: i=1; AKwUvBx92Mi/SOnmd5sGPy/xmkh8Dhcz3IvmvOqvawKbS82I2Dc20n/z4iCGFbT3L6ms47EPOdh0d8PZruMg2D0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSycgCbhR2oJ7bAP3VG8nSTH/haAym7IWQbuy5pxlG0p7fRSIZ
	cvvPRM4mF1arMC5tXp0KalynkGN+b9c7nS1y5jodkigKnAwuKjIXgnHj
X-Gm-Gg: AYBFou2v32aemMc1Ozeu3zC1et1IdiwLJRB/+tTNruxCVJjiNw5EU8r75MNUI06qi+D
	BgJfyKaaN59tEWGj7r0iGTHX4XA3/hSazqniyB36r9Srsp41Ao7e4arSdN0FNszmoR0ddWZNUmP
	/7ozUu3EKpu3fdqDWfTdzvsyTovkTX/YG2QEfXUcu/MmuZ6MEpiF+7s50KsChbsrBlq22MtvZUz
	VjsJ2XtWqAUAdkQ+Aylnpii3IwEZ3l9DM35QPhD5WSfiL7AMpAtFOYB3sPdxAEA6boMlIl//k/3
	LrlPZXVRmVNcdgydnQzl5V7HPhiysuamFRXEvL50Lb57Ro0YzUWHnPLCL5Qehdg66Q56gbSqgz/
	ZIIky7Z1cBsGlJlaML4ezyByiFnn6eNtL2XJPjkbLW2qxeT1ooN03RTx6BAaTtj6Nc0H3i3GaEU
	MWAUHovxafESol82wQ3SVhKUmiZHo0cDD5kE7V7BK0H1j5yTYZFW/9DB1MlVu+0MdHT7A2Y3g=
X-Received: by 2002:a17:90b:58c8:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-398bab4a682mr15645724a91.2.1788219509209;
        Mon, 31 Aug 2026 16:38:29 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:28 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Subject: [PATCH v4 0/2] ti,keystone-devctrl: Convert to DT schema and DTS
 cleanups
Date: Tue, 01 Sep 2026 05:08:11 +0530
Message-Id: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NwQ6CMAyA4VchO1uzbjDBk+9hPMyt00YFM8giM
 by70xMa4vFv2q9P0VNk6sW2eIpIiXvu2hzlqhDubNsTAfvcQkllZI0aBoYLjf3QtQSekhviFQy
 VjUIVSFde5Mt7pMCPj7o/5D5z3o/j50nC9/S/lxAQTJDW1hvf2FDvTjfL17XrbuLtJTU3zLKhQ
 EJlj0ioHVYOfw09MzQuGzob0mAZHB2tDF/GNE0vFcnxUT4BAAA=
X-Change-ID: 20260813-ti-keystone-devctrl-6e49212fe35d
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=1991;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=rA4QIuFO1naxnZ7iJUUs/gm+e2xWDF9gudgR2Nn64Gk=;
 b=H4FZ2/dn30PCO3uXPEo/aR1of0PBoI48JMMqoDbWkWPQDQBUKVtcpjEkQ/M0rbwDir4sxD+je
 qH6LYUnKY3LAKQd/JIeAiazlV/rSsSrA8xyw/e+W5KjAUYZrf7+m4E3
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Series converts Texas Instruments Keystone Device State Control binding
to DT schema  and aligns the existing dt files with standard naming
conventions.

Patch 1 aligns the legacy child node names with standard names.
Patch 2 converts the ti,keystone-devctrl binding to YAML schema.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
Changes in v4:
- add compatible as required for child node
- Link to v3: https://lore.kernel.org/r/20260831-ti-keystone-devctrl-v3-0-0614fceba0f1@gmail.com

Changes in v3:
- Rebased to latest mailine 7.3-rc1
- Removed note in patch 2 as dependency is already merged into mainline
  and there are no more warnings.
- Link to v2: https://lore.kernel.org/r/20260816-ti-keystone-devctrl-v2-0-5ab1e13c15c1@gmail.com

Changes in v2:
- Fix legacy node names containing underscores in existing .dtsi files.
- Dropped 'minItems: 2' and the conditional block. Made 'simple-mfd' and
  bus properties strictly required, as all in-tree dts uses it. 
- Updated patternProperties to strictly enforce standard node names
- Link to v1: https://lore.kernel.org/r/20260813-ti-keystone-devctrl-v1-1-6f0aa87d9af8@gmail.com

---
Bhargav Joshi (2):
      ARM: dts: ti: keystone: Align devctrl child node names with dtschema
      dt-bindings: mfd: ti,keystone-devctrl: Convert to DT schema

 .../bindings/mfd/ti,keystone-devctrl.yaml          | 90 ++++++++++++++++++++++
 .../bindings/mfd/ti-keystone-devctrl.txt           | 19 -----
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi    |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi   | 16 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi    |  8 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi        |  2 +-
 7 files changed, 106 insertions(+), 35 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260813-ti-keystone-devctrl-6e49212fe35d

Best regards,
-- 
Bhargav

