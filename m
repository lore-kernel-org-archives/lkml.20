Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4B4AE102
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790003360; cv=none; b=L1FW0Z2tPBJP0ERsXhRDPvfhgKy6DJatdHSmRclNaRTi9Lb9RFAyHgJGoCf9l339JuK2KhH/G712+6lvLT5VRRFZx2I3oqxUXvHB6e0Qt/KCzghIBd45QxZ3yc26/iDSG12F1omS/Dcmmd27RVXylz1rxR/fWYibrSENSX/CUU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790003360; c=relaxed/simple;
	bh=hf5kjbI81u8GhWKWua09PR9zzZ8Qo0DwQU4NZxqtTl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pVXggl0MAakegKhKrRMjEz3RUEd5iyfJn4W4sG3lDVxmX1tbkeRybkzdvhi4p3VLPDkfkWxNmhHCP3mYfH6q5dl+U24oIArvL+ntWAWkYfvwCb7Vw9rB4Fp1/BwPEvbgiaflg1Os2QvRMIvxZtSfoz9v8Egymg/pr3np0WyivHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neIvGl02; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neIvGl02"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso22252685e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790003357; x=1790608157; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=;
        b=neIvGl02v/kxlbpnoE0MIH0LJjQeCurCEajPP1me/8xVAAwF+PLOZPGTKToY4DgLOQ
         1QQSq0MbyS78Ly+T+3htOd5i4mhHqwLxJt6T6JOP3/Qv0AFNIgCWR+fiNLHUVxUbXTz5
         7DmdjRUqQbYvGqz4j2BBwCyscDhwgTF6paFQ8RjzztqNXAVEMHle8zkRGD0YVFoiSOko
         ruFXl4B/jSzp5OzBObmikbmMNj4qp8xIqfQGnEbi9ZuFSrPyNvOXp6X5TsQZegHs9f0e
         Vn0T4b03IWZNDdIP9i8RjYPTk2jaFwTerRNJsEDavwRIgd9ko6ZI3spwaxLF/N4+XxrI
         3V2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790003357; x=1790608157;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6nZuDnIdpGvlJrJpl4QPHUuS58+C3sDRO9ZRmoer2zg=;
        b=FMbjBPDqNplgccmVMIA2BQWvTYBPcWDA20tZbn3iXTY0qDpS62s1iQEjAtNaulJYRE
         7C1U6E2q7+SlGCqWDUDmkKbm5pMRdo8ZYvQHKibpo0I7kDI0xbg7Ljylc46LVlVvBWaR
         33blNZPQHZs1IRtEjV5TgPg8ZM8Cnv9pEfEcoNP30ZJ2ET09hM51dJ0P3IFA0aII57aT
         fDLdkus72B/6AewgXVqjlqMffZjQemLFJFxbyArzYhhLr7tmoiBfyDI9eXkHxTMZldK4
         J+AiWsAkRmfJ+iJCAKH8dWBgBpoBqzYWbKQwIb+z5taqsAWQiwBfbm/BGQu/qC2IAsUk
         LBog==
X-Forwarded-Encrypted: i=1; AKwUvBy4C69kcSx4n6+WoZR7gQugVQZ4ULxrqcki1DgI9zDWjUOfjdAakUusJcXviFRFIRhQjfFfm4JgUuHgmF4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFIBpXeeP4NYnGteONxEVSm5Nok9269/xdO7Yb2frFF83bNduB
	NHEbrUL4i3oAgOo7Dx9KeNDSb6Fp6K4qIKZZ0d5eMb5W+6oCsJtzO+Zi
X-Gm-Gg: AYBFou0hrvp17Cn+3MG1I+e02hz5upy45gbLp/7SmXhvnrLRoA1PXmnFaUMpOVt2F74
	rq/kdsBVLzGuVTE/x1pAca3o5tmSJFpIH3bCK42sAP9aisLbl1rG4ubgAUkJ4YlPPoe6NnFBFGx
	ojDppBuF5CumL1dlK5f25FPCk9fHuYKkAqAx8ndZojzp5Fss2AqJJ9hEPWYAdTMxJmIYQ9rPppe
	xdnsaO5PGR+GvZIV3nI31UCIWuGRf6HQJKIk7PQ8O+/FNB+AhP7QbQOwuhPGpeQfn9gOYRkt54d
	PsP/H6+HWvTzG2uuAzZ1HP3uzmTYTLe+OaJB1KrPJpHAvq9fZfkg+hpIjklx3/Xcstlyw6R+rnR
	KsPCRZuYWt33Hz2S52qyxv85nc5ibzFo65tBC2JQ6uzAUZ4NnUnim35H97GSRgeR/6yb7hUgIpU
	RqM1H3tw6vyOUKjijM8o5VQ7h2hd4n8SAqp2vMabfK2wPnmMY8RJx9LYZE6lnkyUILrfyXyxpHa
	tLm1d5wADiDijHY/3qE7XKU25hKpESXVMS4Qx84fqbMf/qPu3zltsyPrW15m0U8WWo7lCxiryF7
	BbEpNbPt2eg0moXuvQ==
X-Received: by 2002:a05:600c:4691:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fc572f297mr139363745e9.22.1790003356583;
        Mon, 21 Sep 2026 08:09:16 -0700 (PDT)
Received: from [192.168.0.233] (2a02-8388-e6ca-5780-e161-768d-5c97-84d0.cable.dynamic.v6.surfer.at. [2a02:8388:e6ca:5780:e161:768d:5c97:84d0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc56eff84sm255659435e9.1.2026.09.21.08.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:09:16 -0700 (PDT)
From: Andrei Lalaev <andrey.lalaev@gmail.com>
Subject: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Mon, 21 Sep 2026 17:08:58 +0200
Message-Id: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBG4auQWTsJNEDEqxgX0P5CTew0M0pIC
 He36vLbvLeTQSOMLtVOijValFTQnCryy5hmcAzF5GrX14Nr2CQvs7DiKSvYS1bxMBPlJAHcovf
 dME7dOTgqkay4x+03uN7+tvf0gH99q3QcHwa5uTWCAAAA
X-Change-ID: 20260921-sophgo-remove-coprocessor-node-4e6c59ab58d2
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Andrei Lalaev <andrey.lalaev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790003355; l=1759;
 i=andrey.lalaev@gmail.com; s=20260901; h=from:subject:message-id;
 bh=hf5kjbI81u8GhWKWua09PR9zzZ8Qo0DwQU4NZxqtTl0=;
 b=GWyRcQp1oB8Sh4EZuyzCScn2OIWBgOKi080vPgH/ZvEmbEh78yfsQHts+sQRZUH9qqncxyCcU
 SRwo1HzBuu3AZg9vJqEr7ZCrzi3yECFcHcvQk3vfnM+Il1FVWF7qKSA
X-Developer-Key: i=andrey.lalaev@gmail.com; a=ed25519;
 pk=YHk+K3q98GV/1CigmrEAQ+Vc0o+GlFWt3j94jvrEh6o=

Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
the end of RAM. It is not correct because:
  - FSBL can be configured to load FW into a different region
  - if no firmware is loaded, the reserved memory is wasted

As explained in [1, 2], FSBL should reserve the region at runtime.

The latest FSBL can boot the system without coprocessor FW:
  FSBL Jb2829:g6f8962c394dd-dirty:2026-09-20T13:04:17+00:00
  st_on_reason=d0000
  st_off_reason=0
  P2S/0x1000/0xc00fa00.
  SD/0xaa00/0x1000/0x1000/0.P2E.
  cv181x DDR init.
  ddr_param[0]=0x0.
  pkg_type=5
  D1_3_2
  DDR3-2G-QFN
  Data rate=1866.
  DDR BIST PASS
  PLLS.
  PLLE.
  C2S/0x0/0x0/0x0.
  No C906L image.
  MS/0xba00/0x80000000/0x43e00.
  SD/0xba00/0x43e00/0x43e00/0.ME.
  L2/0x4f800.
  SD/0x4f800/0x200/0x200/0.L2/0x33334c42/0xcafe4b49/0x80200000/0x8c200/0x8c200
  SD/0x4f800/0x8c200/0x8c200/0.sys_switch_all_to_pll...
  Loader_2nd loaded.
  Use internal 32k

So it is safe to remove `coprocessor_rtos` nodes.

[1]: https://lore.kernel.org/sophgo/6e4b5c98-7d48-4629-a6a0-4d930327f9a0@sifive.com/
[2]: https://lore.kernel.org/sophgo/aqrhRic7Ww6fPhxg@pie/

Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
---
Andrei Lalaev (2):
      riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node

 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts    | 11 -----------
 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts | 11 -----------
 2 files changed, 22 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-sophgo-remove-coprocessor-node-4e6c59ab58d2

Best regards,
--  
Andrei Lalaev <andrey.lalaev@gmail.com>

