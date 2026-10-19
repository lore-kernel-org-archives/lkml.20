Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8446656061E
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419479; cv=none; b=QuKa3UZe74INx1fVUgmn0Yo4Gzk4g2nkdTK0I1FsH1UpyUuT9977Qa9iIoG/zJDaMXfwAABOreZkJFmyaKF3dHfEZsp3UCiaLkkgPJHw7f0gFxEiDOSPIAC9YL/7bTGeBlKOcDV3hOyAp2HPL6OkiKoawDDv0/JmOPvfKO5/m4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419479; c=relaxed/simple;
	bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aQ0E0Eg8xjuut5RbxtZN3/MkASpgLUkBBJ+Vs1+WxIDXGobbj6MVJykUAp892t78GLz+1iiAycYur3F/1s1UPTD6XfFW3wufSmDRP1kDhm8ncyqH1qxQc8iDMcvK/Jim+ZTJuIDH8cWN2biTBE9ag78+08W5LxFUSa22ui4NhDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pSwubVJh; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pSwubVJh"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8520161fdb9so1286157b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419478; x=1793024278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=pSwubVJhDHMGhiX/NWATXv9OmjcPmQZyfaBxM6C1JkHPXiK63WHqeQfGNrG8tRxwgQ
         5o4YwVGrWPxibnDG+qEaSUgHzLKi03XwjImEOIfuUIsoJ8Ad4VDcEVZvntdXTeP+W6wS
         ynUmnqdal+OCQw5ODaD0rETCYM2SNj1HbvHwoaf+QOwUgrVtoK/SNBdTEAIt2bxIzb9s
         AovBiA1lKjI5Bi3vzGN+edbmno+mRj76ddTbeKrrzUTM/s11BemeYFK+0HG64o9n/ATR
         vrQFF7MD2Y37lumoEhE+n0xPZbS/vOAq2hlLMkBt5fdnzKk0LbM+GNlzPBHtNm8FB/dI
         gnqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419478; x=1793024278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEkTb6R44VHT7GxETUcQDEgxO+rMUGdHk6yjf37a7BQ=;
        b=bGEi8KPYnVpYTAn/foYFW2n2fpWf4COMWSxfBm67g4hOeYoNJZruSxB7l5MVr8NtUm
         DBFzGSEhdI699Fng5L/C2Ow7DaAM8bfVI9Jl60U1gxETyAL4PwZlMEB+VNzovFbjPEGl
         bQ8fuB4/BMyRIVHqiZLLpqbxQsMzfAErudC42zVXclCdU6ERiHOhyJveNrHVORrmayeK
         Rzg2Sfex8lbKDTEiI4UYmelbvK8iN7T7XszBFiemICzXZmG/8C94hq4elxhiTB4F0rje
         ZQG5YZ+epeEkcK9YfhWA9IRKqr3NoJykgNMvv/f69t9EAqzWWVJPH0TvzaB1mySHhDKD
         hxcA==
X-Forwarded-Encrypted: i=1; AKwUvBymEKms7BapK27RnWnQyHFBmc+ZQUwDHfc764rM3bQ+2eTyH523p0U2U6hbmYJcY+NuvOyFasYlR/VNQJw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRxTNYrWU80/e2LUpK3SVnz0HRirj5Nv+rd7jNlTqrRwZE7S8t
	VJSb0n663IdxjUiD/iuOctpSsgYXvoiFu3tsdZqwGVIUwnNcNQV9fFzl
X-Gm-Gg: AYBFou2q+L0CoZ0MqCEZakCdXM1t7bn0kfV583siKcFGzL7W2kbOUBWTwLTQsvcHe26
	CiE96VALtXOsS2yNnLcnlhvN79vbyzq3AF77/ahAy+siW3vlWY2QA8N6W28/kddVdmKxsKzfH2V
	jFQgOhg7uxRg3xPDDWQ16wsj311G62EWq5EmpNya9kCeovFVHSYX3/cGteWs8g1rjNOXzXz/wnB
	3VhiDnulKp8AxJ7prt9Ur29imhAoCFz1BQWHpYC0G/k4DUMxTGqI4aIxzUs/ZWb2h2Zq6CBFvmp
	X7AH9rDXgy33MI/tH5tQL45Uq2qNd13LwGtG7RVWH2+OYUTF+DoAGTC8ZSfw/4MVyz+iZuU3iIW
	UKs9/8yDrQS1PVxieck2CFyV3mVYOxhQTt1sSTo4BDYPfRToxwwzB6obdRZ2BVVva9Pjo63GeBJ
	aG2JsSX3qOTleJKsYCXFc+WgQV8GuP9U/MN13mMR1oOELrVk2mXh8zNiXSy5KlzBoKV+yTOOkth
	JTFdqEolrifKGXJYFUjaC+GLUbdcEvaAJuTUtXKAolnGVghNkZww0Wl59x2PHEJLL7oM0pKcgjq
	I052XS1BLrz1nEO9bVIdu3DJkE/zpD+AA5xZk8Zz3VmJZXcdmd9Nqg==
X-Received: by 2002:a05:6a00:a8f:b0:89d:af47:905e with SMTP id d2e1a72fcca58-8a04cb096b0mr5594670b3a.25.1792419477810;
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f8aa31341sm3825523b3a.51.2026.10.19.07.17.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:57 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:48 +0800
Message-ID: <20261019141752.2077207-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
References: <20261017180141.3477743-3-alan.tseng.cs@gmail.com> <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Does BootROM configure the EEPROM peripheral for access? If not, I
> think the justification is weak here to include this.

As far as I know it does not. The EEPROM is only read to tell the
boards apart, so I will drop the i2c2 and EEPROM tags in v3 and keep
the PMIC, whose rails are set before DRAM can be brought up, and the
SPI NOR flash, which the BootROM can boot from.

Yixun, is there a public description of the BootROM boot flows, or of
which peripherals it sets up in each? That would give a clear basis
for which nodes to tag.

Thanks,
Hung-Chun
