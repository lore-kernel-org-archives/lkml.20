Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792535302;
	b=i/K7P9DmAAX/l9Ntw1CCDVls9Sj4XH1jl/MPa8jlgCnr1I72FTW77zwkW+jfX/pgxrzF
	 +Zvp1Tb4V4AqNU1JaKhHp6BYJV3raiTfgF9P79UHNC8RRpgnYm0hxWsmHHQITAn5TsiSX
	 VG6tkx3MHIcRBcQGchojBO6f3Rvcd1y0COiil0pSTiw5g7/PVAqXhhZ0OR5T5erkUdaGI
	 zrFYhTmEwyJredhQ73i7bSe2EcmsXvnSn841F+WSEXQqS3yiS0QVRHHi7V5fofDfvHs2c
	 0qi7do7Rk9zERoAH9OyHxvk2vbaqDD8geKZE1oIaDytrN/v7BO4Km/H8iapxeQhF1JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792535302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tBDTgfDSGJbroG+YsfaGw3OJ2VJpPZaPJ8OxT16ARco=;
	b=XQf9B+Pn8rHWZwl1D0VA0Abwm+QbD/p7OnILCTovjxWd3CPkxJlY2yF59fzpj98xbaKa
	 wvsiweD/mzVfEUSb/Cs4PQlG+I4POBYesmsFc1AvQ4tHPX74TFJNhrg0dPZXcFVeGLUyu
	 OoOm1nRakUcgIIoqRoAudSm9rgmoWfxX18anuayfTZCHSFT7mGidbvMCVxV3EL0QTePgh
	 4dvgtb3MripjPEbWINcDMdFeCtKR7o80a1zDm7jynEaxwgjENN7ziE6b2KDh/GyGlXDKc
	 hcKbzoEmcbHqfnzeDokqYHUORGNcVcntyEV+l0LS/9TNpKJs+cej6EAoP9GmZJzVuwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kxs36cdr;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FF9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:28:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79FF9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kxs36cdr
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4956869750eso506305e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792535301; x=1793140101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tBDTgfDSGJbroG+YsfaGw3OJ2VJpPZaPJ8OxT16ARco=;
        b=kxs36cdrMWICBmBk9y6IYZZCuL/1sAC2z6EGRjWVWdVwrpSMDev14A6666MN+TCB4+
         1CBjIPpHwYxTpQEWF37MNqYGHWqTolyM+3GiBdAdwKTXvHyoQDvFg9T5WdkFhJ+jS/y7
         OUhdHsjls2w63D4iD0IU64aWudDip90OLE6/n2L/uTTxFtpbT4fwp7uUUiKnA6t9mtiK
         he/yCcCouoyk9DcqyhOxmB0CsMcEfS2XwpDOBb0eJM1ZXNuyuOh/GzMc2byd79cG7YOJ
         QWf3PZamW/D7knCCkApbYrUF+qREc6Kx8aE7FYtmfWzOsVEw/XmDH+u9UVDbmRcw1iBN
         J2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792535301; x=1793140101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tBDTgfDSGJbroG+YsfaGw3OJ2VJpPZaPJ8OxT16ARco=;
        b=qiZHNvxZY88F0e6dXj4ZywEtr3udSzFQs+5J7nonIeCbAWZt55hOH+CaCwP7ekGojN
         piwQBeuNjQShPNfJTKCO12RE3QsTtfuM7Gr/soTfNNGigMaRN168iZifS8E3TXaiHpK2
         Ba77B6D8UgoDZAo1xP463biCXUfz3ToDZSD1FpLuNNI+Sue2esgAHmXYRBdOtMtOCC5R
         01PToG2WqKu9qMveuW6iK3WOZ7vk17NNWGdFKdDxWOxnux2bjSDYlkbjrtLLJ2k2E+Z8
         YQ1g20VTMPvgH3ic/6TEKxfi/z9WKGRlqOSlKxuaMwkIhe2OV20jcUi6bixtkCUTkdUN
         +pXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwRq6lVjpR5ocelZ60DX7jQMk5c98Jain82ruyrb+yxGtE+HfcaSBNwX4zy1GMmJiG0AhrXabikSL3nHzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtgRI7J0yv0Y1Orq4BHL3NN8pOvV7dAoUrez/4ThAeLKYt8p/V
	WZU7aYkrBsLHRjWjROFWrv7g5xaDap3fdPRGyIEmXCgnWUCVPN8crNzE
X-Gm-Gg: AYBFou36RD2dSuqBIgIapn8EIOSlgtTN2iVSHtB5rof5CtrnSLCBKPs79eKBem9KHGo
	YyNRvIpOS0tyYFR1/vCgmu0cYpgXwEoCqkbg+Kr3bXqbdmRlxmZh4czsbI9XUxMaEVScLTXwMHd
	c9xEzfizrJC0OWzmb8PIZ56C1amp+45+B/gNrGr0mmE/GjhDD8xA+vuX8qx8YcHF+SbEJk4zLf9
	lkugLAZFgM0ayvBM3rB9Lf7YBslbWcDha5wSKFNkQGIN59g4r0SNU2TJF+HjUjaNYf39cJsXHij
	7XhVT3pwllsD+JbHWTf098S2wWB/p/UUDMVYZCjJkFWDBdq0WZDnidtZtyd5q7CpREnjCyZFDC6
	bZTo8tX3pdfP1YZraE9mNbrih6K1nYLiUjjR5LPZcdlT9lLmOLD8nkx7BcoWYsIk3FmgiLncGio
	YjY/slPi0E40eakARVkSuup0U1RdmmI29KrE6WhuWjbiSLt//sUio83wq6arLQYL0Mp9/eYoiYK
	efqq+wmNE0TGkr3A+d37lB3vF+i8zJglWMgXFbTpJ09/TeqdzCGmlKfXWosmL6ZRP/5HNDrrA==
X-Received: by 2002:a05:600d:18:b0:4a1:df11:4594 with SMTP id 5b1f17b1804b1-4a1fdd20cafmr1618535e9.11.1792535300652;
        Tue, 20 Oct 2026 15:28:20 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fcd629bbsm9661935e9.5.2026.10.20.15.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:28:19 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: mark.rutland@arm.com,
	lpieralisi@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org
Cc: radu@rendec.net,
	vsethi@nvidia.com,
	maz@kernel.org,
	sdonthineni@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v4 0/2] irqchip: gic-v3: fix unmet dependency on ARM_PSCI_FW
Date: Tue, 20 Oct 2026 23:28:15 +0100
Message-ID: <20261020222817.1231643-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
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

ARM_GIC_V3 currently selects HAVE_ARM_SMCCC_DISCOVERY without ensuring its
dependency, ARM_PSCI_FW, is met.

Patch 1 of this series adds stubs for arm32 so that patch 2 can make the
select conditional on arm64.

---
Julian Braha (2):
  firmware: smccc: provide stubs when discovery is disabled
  irqchip: gic-v3: only select HAVE_ARM_SMCCC_DISCOVERY on arm64

 drivers/irqchip/Kconfig   | 2 +-
 include/linux/arm-smccc.h | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
2.55.0

