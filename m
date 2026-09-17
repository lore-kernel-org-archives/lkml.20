Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D48768EA
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789611071; cv=none; b=X9kIkjg0LBo4WLLrkz3ChtRLqh/IVXkFy14HG5A151kB1pX4XQR1Md3X4ZnEYOea4KVu8f/M2k8tBitvemjmLvPF86HaiWME3uApdNwnYu+/syl0gYKWSP7rJ3Xjz10VzSraNWt17JHjlL8uSROvXbRjB/VRx06hzawjflSC/BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789611071; c=relaxed/simple;
	bh=l9NzN8vgsjpTBOVB467cB8h2Hx8W8Qa+dHS5qri+xLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZHjYCtAK9BCH8VI1/USC7qwe61fYNYVZQYF6T7KbwUB1fnSZ1fmvtl7Pi6WIAce7C8rZfT1oCMUn3in5fsiZvVSx/L8fGdGf/IOOS6tfPnMF6nxGi8aiMdrWSOjlGwtdxsVGBhYnwxAJVDN8cjfMiGoyKqucbN+mUHjhNfGGolw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLp3sC5v; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLp3sC5v"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b350c6920so293384a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789611069; x=1790215869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWM8vu+DSZ/y9z7h/rS6MGJwMOg+ndfjsoSVL5ugywo=;
        b=QLp3sC5v1YLwdBv+OioOQf7ESWwEx3UJ5AmURk/c3zlqgrnMjW/ezKtEI7n+qi8w+i
         nUds0a604uX+ujOalobMzV0lCGrpCjq19D+fCFhXyyPlycGtHs2f1za72a+mOlAJ6kBL
         WNHyFZmNcBV3XDccniynxgkdiTOICMlzxD+IheQVoslLgfqObrLdV67q4/6rTMDDlrlP
         mtq86mcRvw7DHuB+j3DpGXJ9OBrCH7uLsk9HKB6kUcVsUQYoZqnl3etwtXhKtX8SKwVj
         7OFj2RYhDbtHmUcrBFk5J+RtKhTKfaGhGQjW1bnvntSRkHLIh7o/mJPHICjAE8Z2xR8g
         86Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789611069; x=1790215869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWM8vu+DSZ/y9z7h/rS6MGJwMOg+ndfjsoSVL5ugywo=;
        b=o+qJzhZGq5Xk/V/rELZ6SuGB8VWy33RfcrVJeQEp1q/EPb8oXwU6CVBDS366gedqvF
         p3kuBq+87Qf467r8nxu5S/NzcVMW7Mhxj3ltPFxT/fIP2XR9gd3uOPFG80jjTelWadR5
         yKTASVo5r5l/UKL4kMhQbrwMfCfgTQLaBcWzg8m9nvhHkZv61chUfIsWoGn6YK5gekpJ
         rJ9JQ1R1RZ1wIq9bCm7sW4uDXAgQq2ujQ3+kpPrVVtXEo70N4mhoU2ybudPnXbzRzlhV
         STz5YM+cxcmaD9igwmuI4yxagm/F0+FEjkf8uCBshP3459XaTDVbYB5gfRT5Hlf1ytk9
         dXPA==
X-Forwarded-Encrypted: i=1; AKwUvBwv9t/sfbznqxFcu26skkec0FExAPr1VGNNZQp57vIa1RDrcfBYv0SCXMpYVnRPHFpRDB3Z7R6uY8D0M4w=@vger.kernel.org
X-Gm-Message-State: AFuF++mXJmCw7VjX8pARJTAisOrmZjn9ICdtO+xrIiT9+HSKMzdAt7cw
	sA7VMQBHl0ZuHtuzE8uE733VDt/6dDShs9b1GRa3/vFCQIBPm8tNSLzM
X-Gm-Gg: AYBFou2oWW/sCGOKED+5gGWt40FjLmOFNBeP4f1w2+pL8YwoHzhgkkqqKrdpHwRLymC
	FQWPNsePtUqomUfd5KEZpXNgCXM+FAdAVmAPw9wMfAl42nPaxWNKcYauBDI+toofRiN/Wd+KVtS
	3UWaSmMLILZZzXcUxPNfZipR2du0L4XPOWDFhAtflZ5fBFFHb5F8Bg0U7Wc1NlxfJC7N8/N59Rf
	VW2Ibk7wIV5FoeFEWoBOIIyjjBO0IXwf4Vj7z1DEnS7+JaD/vuTnJY8Qn+HJ2xaFNr9thWUAwGd
	mMEshuhu6gtpYrNzuTsaADEdhdPueOnxTsCNbGCzpT3rNheW9/Lz5KXDu8dPV4Ojvfz74fPpAzt
	6LDft86V5ngR1YiNk/aBLvh8nZk6wRBEjgXpfAVpBDWg0fvb9Qu7p2uITPZPaxcvbzuPjulDxpU
	6KTxP9eDQbQow+5+Y1ffKiCcAkKy5a2ndRjZcF90OJ2uveHBkqRKIg4vBN2sa8fN4fqcTkDcTS0
	gRyyS/DDgVqVfZ45gLNRSK7TTOADJjyE1/NQVv3lO5krQ==
X-Received: by 2002:a17:90b:56c6:b0:39e:2e79:7ce7 with SMTP id 98e67ed59e1d1-39e2e797eb7mr6073622a91.6.1789611069195;
        Wed, 16 Sep 2026 19:11:09 -0700 (PDT)
Received: from localhost.. (59-124-112-186.hinet-ip.hinet.net. [59.124.112.186])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e36096735sm2341821a91.12.2026.09.16.19.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 19:11:08 -0700 (PDT)
From: chipang_kao <prozac2734@gmail.com>
X-Google-Original-From: chipang_kao <chipang_kao@asus.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	bryan.odonoghue@linaro.org,
	W_Armin@gmx.de
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chipang_kao <chipang_kao@asus.com>
Subject: [PATCH 0/2] platform: Enable ACPI WMI and ASUS WMI driver for ARM64
Date: Thu, 17 Sep 2026 10:10:53 +0800
Message-ID: <20260917021055.8029-1-chipang_kao@asus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables ACPI WMI core support and the ASUS WMI platform
driver on ARM64 architectures.

ACPI WMI is not limited to x86 platforms. Modern ARM64 laptops and
platforms have adopted ACPI WMI to expose vendor-specific features
such as hotkeys and fan control.

To support these devices:
1. Removes the strict 'X86' dependency from CONFIG_ACPI_WMI.
2. Updates the ARM64 platform driver infrastructure to allow
   building the ASUS WMI driver without duplicating source code.

chipang_kao (2):
  platform/wmi: Remove X86 dependency for ACPI_WMI
  platform/arm64: Enable ASUS WMI driver support

 drivers/platform/arm64/Kconfig  | 46 +++++++++++++++++++++++++++++++++
 drivers/platform/arm64/Makefile |  2 ++
 drivers/platform/wmi/Kconfig    |  2 +-
 3 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.43.0

