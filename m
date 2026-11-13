Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794541368;
	b=0fcEQRgMz3FeVtdDvUv+uToYx9YZysx2zRnfGIM9UREGoHpzyB94YDyqYCT8Bi/ler0n
	 foUGAwk8zSNNkRV9qpTzZ/qnD6x762axzQGp2musr8yjeERkXEk6/sHZ2KQmQ9U+Idoob
	 Qk2iQ6bmirHHwboFtCNkiwu2uuy2T3lW9DV+58qZ5FCPdiWT75gZdiOAJVkOdWmDTutsq
	 fQta178bE/3kAK01/gbOYJdRkxs4crCkAaBUKAf6uUPXTQLJ1WHUMjveS4Va88Wbpo0zL
	 A5OUrUwJ2vZ1KB5WoJ6pxNgJ4D3IppyzUqnpdnJlNUReKCoywNVziFnWSxQGeFZICcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794541368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7wqtaClkA87RYbtDZICJouKtI7I+Hc/L5x4RkEdLrEQ=;
	b=WcAGeRQdK4TqrOi8UQH/2IHe3EPOoN3KVTtEapBZrIqxq8oKgV5rFMQdNVQagHpSoqO8
	 Nnp604k99kQrLg3bncD/rmFEevzONH/Sj+OvvvOBc5orsHfmzcifNFNoku2HYtfFYZp7s
	 pINI3kVbbIxyWfmKiLe60Uulzg+V6c9jJokcUdEvZ2tJ4Imdm8O+OWoFC7LyKjRO6htoY
	 tnCTLVF2tXl2e1VF+3m+goD+4IG2oFanglApChgIly0CHyPRssfpEmjT+WrCpdBQgojT4
	 cCC0fyONd13arPqfjDPzpykjOLvC7xV0sA7gbaK9rappvlqeMwQJtVkGOBMiP88emdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMbwPxtR;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEC606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BEEC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMbwPxtR
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1106517eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794541367; x=1795146167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wqtaClkA87RYbtDZICJouKtI7I+Hc/L5x4RkEdLrEQ=;
        b=EMbwPxtR+NM1vgknxA5KLeV9RL3JWO2+M6vS1Jx3lTiHPbWfzlFq/3p52satNexxqi
         aesjksujek0zqj62RKRmV4lYPkTdQD5japmjk7N3YzkGx8Z9Slpv6WBI6b7KHoFSBhZr
         vLgSCQGEwJ5LIA6wNlNM1l5Hf9/cQGeJRXq7ZGMUxEDoAuIuCEI0cOGT0IciE1WCBoKJ
         siZWUxa/whC+YiEYfmv3xI8fnQlZ9IPvTJERzIbRxLVePibah0Hv7uav84wQfJP7fraq
         STa1cNe7I12DC9GmpyunOJJ3wtVd5SFBF/PLB9Tq7THUXpVh9HWcstnq85ML9jk3IFvf
         JnPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794541367; x=1795146167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wqtaClkA87RYbtDZICJouKtI7I+Hc/L5x4RkEdLrEQ=;
        b=AN1n2aJwPriMiFLdT8iIyI9DvxyXkycdh9jhnZVuO5NIuwnD9sEGsi01HSZQIhyfNu
         yEW4ua3yjuVXYzKUpftslYN4i7/itg6QrtvUJ3TYfMtpwZ5/YW6ukZQO0ytvgkg5Qru8
         b98VaIcxOMsv9ObVKuByBIGaaFSij5ZJOmBt4NhOHb/zpxBAstQPaFr3/AnTrb7E/oD4
         CWVdXekNTx4sFELGiAoms4X0xnjGjflmRVbhmyDePXM3f6mcW119TTiwgOAQN58HGWsj
         jbfdRrKJiOB8uDhppgOEn/Z1vO0wjNsrNT5CahYo0yg5atNzowWEZLkWnIUxuaOTTx+U
         ofYQ==
X-Forwarded-Encrypted: i=1; AL+hErFMQS+32cBIj2X1AcvnxSVfvkG1u1dWZMotSIjN0EyOWJEOHS/cCJ0Courb1X7Vz0MVt2EE1rwMob0T6CM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+an7Ir9bsom2sGZqEplw7+Qt+X7bh5HYzngQiL84UNgDGiEv8b
	Vr+YFjTog/YwoF2yyTdsznmUcHMj/aqzadl2yBoktA2K0m830+mEWt1T
X-Gm-Gg: AYBFou00OeMYDQRBt8DS5YzusHAvXJ8VAg2wBmSFq2yVSPtM7bdq1jHzftLLm3iWlQN
	L/C6N+dC3iz57GSvbNKyqMziy5agDs3vzFmx7iYNfuA9zWTso5bPsRwy8JU8AXlJebN8EjzlDO/
	5eZhwNYrOGo5j7EmLtaG014hDVJKO7bNqXmp5RbyCSdLx+WScVtoHdXBKKryHdY9EK+3GmmNOMx
	52INbu8YhnFWlidDJQ80XHNNVTRK22ykazqI4RQ90A+PifKKSaez1H2Fonzl2TkMrK54r4gG9tT
	X7a6HutaU7i8fW6rSVml71kbafpuq2qKbe7B6w0eQTWyAGIVwqUhS6JgQ8958H4WmYS74EX4DE3
	YyfQhU4wcSjKheam85NUtKRuthsLouVmcOU6BVMQ41hAzkXxujxFuFqbP/uV+QuysBMlD8HljvI
	6lBzkxvkOCJ2zN2QUQ9aRypa7/CBArcZwn5LfKP5zy6zc8BkSX+QJDHl2vZ1llAYoxJ0yxaj36j
	fa7YU9PtEJvMntdfcXJ/uQ2ZP0ZVljGH2EXmNfYAnTCCX0XyphsV/gneekM8uYgJQPSL+QCNdVR
	8/rrGhG6EtFwBFkQkwmmxT8CBM7itheawuURQcfvH0Yk
X-Received: by 2002:a05:7301:540d:b0:36f:4d62:2884 with SMTP id 5a478bee46e88-3796721cfcdmr1081571eec.30.1794541367340;
        Thu, 12 Nov 2026 19:42:47 -0800 (PST)
Received: from debian.prasanth ([114.79.136.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm2999565eec.15.2026.11.12.19.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 19:42:46 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: srini@kernel.org
Cc: joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	neal_liu@aspeedtech.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v1 0/1] nvmem: aspeed: Add read-only AST2600 OTP support
Date: Fri, 13 Nov 2026 09:12:12 +0530
Message-ID: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

Add a root-only, read-only NVMEM provider for AST2600 OTP, with serialized
controller access, bounded polling and configured secure-prefix checks.
The driver adapts ASPEED's downstream read sequence and preserves its
attribution.

Tested on ASRock Rack B650D4U (AST2600 A3), OpenBMC Linux 6.18.24:
- Repeated, paired and cross-pair reads matched.
- Four concurrent readers completed 40 matching reads.
- Bytes 8172..8183 matched a separate vendor-derived reader.
- Synthetic pre-MMIO timeout, failure latching and rebind recovery passed.

Host fault-injection tests also passed all 42 polling-timeout cases using
simulated registers and virtual time.

Prasanth Kumar Padarthi (1):
  nvmem: aspeed: Add read-only AST2600 OTP support

 MAINTAINERS                 |   1 +
 drivers/nvmem/Kconfig       |  12 ++
 drivers/nvmem/Makefile      |   1 +
 drivers/nvmem/ast2600-otp.c | 259 ++++++++++++++++++++++++++++++++++++
 4 files changed, 273 insertions(+)
 create mode 100644 drivers/nvmem/ast2600-otp.c
