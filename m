Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C64D0CC5
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 13:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982958; cv=none; b=MfKQ8UoZCEngjD3kB7q7xab5tBsMcqPGski4fGNxu4MNMfUlxeehEvSPRbUxw4TUEe9yI3hDlCsTEka8H8Ol0IvVx7brFiI4dodkmeRsj6jdMnWJYtaxzQFOdLFBwPD/5ad7SqKr/olXgMQ1SS8NaRtfsF3KX40Dh+sP4g8bnSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982958; c=relaxed/simple;
	bh=KXyvJPLF/vSAM/caa10lK9dv/v9bPIPN3s2KWGEGFA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WC0mSc42nJ1oB/FkwVDBMl4j5Zx6eWHp8aT7P2PhgwOFvkff2VTo0RZedKNnj6o0FZ/xfrnfUG49PWp6N146jr/yuJdbZNEGFYR9UNKyWI3559zcbUJ4dtsmT7oWkQ4sa7m2yEvKfuA6d4b6p203ft0gxCLEJ+T2LzeU6QFZ+5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=Osn5aoT8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="Osn5aoT8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c2e7131b94eso375426866b.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 06:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1791982955; x=1792587755; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vxyKhbcbGfXBX8NmJ5hn58Jy3BwI4hVbi59p47lfNoI=;
        b=Osn5aoT89xgl6N1me3v/pIUPzTPAhP7pc9lzs7Tby6k0o7XgnRvQ4h0GjKmuyRxwBJ
         eGj57wr+WmGsxxGdXYnm3dq2H4sej96PXIZ2wegskGvGt8UljnQWzYQ6mlCaZG/9RvXj
         JQTYwQEgGUjPjNZcXphcrDz9Z04w4vgW1cdpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982955; x=1792587755;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vxyKhbcbGfXBX8NmJ5hn58Jy3BwI4hVbi59p47lfNoI=;
        b=s4ufbBBoCirR2EvlzZ/vCko+sLKdEZKqRVo4gpIeglRNj6m3KY5b+W8nXn8uU8VG3f
         8/+kqDBNCjZ9fhRII7kPKgfI3D1gKS6yj+qoSQqsthZEPDzHVIjkxcTHPQ7hVUIcww0K
         tDUwljizjasjJuN2peh2K9KUb7rve8UHL+XAn8pxrxzegXEKYRkjSSDa7RUFuZcopEE0
         X2FZBSsVgFV+VhoJIIjLwCwFN905Nz12HV7d0N84x7Aw8Vyb+4nd8yXKytm8hVn/vA8N
         6/Gu+Im+DBHUd5OAihV2hIz3HvwUnSXI6l86YTrlmhiFY4ZpC9UJciACIagWXcvKHSt2
         KTEw==
X-Gm-Message-State: AFq9FYI8zPmbc19bMIMcafb0rl5UFmr4WjGRfU7eRKcjstJlRXq20CQ0
	KZqVbmxBrRLJRnIavytlqgq5uOuxDss90yie6MAdAqk6Kk1/psWwBhL5O0tLHV4zNxieaaenyBK
	a5Igf
X-Gm-Gg: AYBFou2fOwde5m9YCHWPx7+E70mhXm3CtBORgdMLyEBSBVQeL2J5iSPQ0k3eWPvG/rF
	RJtwiVeWMjDET6oTklcZSuhAFdm/a140pz0cZSgdduHI+YVo5rbhatq28v5fi360RLPvIbo/IMR
	nczLJt7ZEe10xAWyAx7MIKiQ+rOmLH/bES03A3KRaNJzrlK5v7IAS/z64q0eefa403CySHHXuqo
	BJnq8E/n0kqFFE/F/C61f//i4DQsnI6hv+W2M8wK/rjxLU+yNEIFMXwiiUK7eWHduhLEBITbiWd
	At4gIhZugy6SLQKsLvi+Hb8RikPxsCsT63hocg/sNpBr7QGdfCdw++ZLKfrs4CnReoFeAbphdu9
	HyIpZ5STH7m8FAHmiQcFqAdrmhYYW+qhxxZCzPHcdf9dIeiXX0XRXjf1qV653OBl1Jp0gPsGWbb
	UaDWQjhNulPuGKyuKWYyp5lFCFKrceTNUR3rJ1fIbh8gGI5Ugf7C0Jzq3lieMZOpSuJLAXdTJs4
	Cz1AoQzUANwQjiMjqu/ytIQ4Q==
X-Received: by 2002:a17:907:3e8c:b0:c29:519b:3aee with SMTP id a640c23a62f3a-c31a7125b30mr1550342066b.33.1791982954660;
        Wed, 14 Oct 2026 06:02:34 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab5b03sm12608292f8f.30.2026.10.14.06.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:33 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dinguyen@kernel.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v9 0/3] arm: dts: altera: add Draeger M48 CPU board
Date: Wed, 14 Oct 2026 16:02:23 +0300
Message-ID: <20261014130228.2780803-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adding the device trees for “Dräger M48 on NXP i.MX6 (Q) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the SoCFPGA devicetree part.

news for v9:

  - remove the name property from the memory node;
  - fix a typo in a comment;
  - attached phy-specific skew properties to dedicated mdio phy sub-node;
  - add Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

now in v8:

  - modified draeger,m48 to draeger,socfpga-48 because it is more consistent;
    with its other imx counterparts imx6q-m48 and imx6dl-m48;
  - dropped gpio3 and gpio4 bindings;

new in v7:

  - replaced module with board as this seems to be confusing to some;
  - add Acked-by: Conor Dooley <conor.dooley@microchip.com> tag;

Petko Manolov (3):
  dt-bindings: vendor-prefixes: add Draeger AG
  dt-bindings: arm: altera: add Draeger M48 dual-cpu board
  arm: dts: altera: add Draeger M48 CPU Module

 .../devicetree/bindings/arm/altera.yaml       |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm/boot/dts/intel/socfpga/Makefile      |   1 +
 .../socfpga/socfpga_cyclone5_draeger_m48.dts  | 100 ++++++++++++++++++
 4 files changed, 104 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts

-- 
2.47.3

