Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221377;
	b=LYpvHFQn6SFogMwCCgN6YNleWpriqJcORcP/AO0TkIcea8toIYfu/uLJFjuFP1c0EGZ/
	 ILC8LvNLONnCu2HyC+lz4YY/FjZ9C/j47O4CRK7bBAbewICBtmexSU5+GPUlInKEqU+w5
	 JHjzLfa+4PiDeKSbGgqPEhK384Jbqq/hap03LlPmM7JJJzFP3tO/B1MgCZrL8eXWloTXi
	 vGcu/P+jclhUM2cP2ZSplsvZxv1YPDJkj2lVppjEWazFznoCQ9+D6vTEwFL97Ts/pn03l
	 vUOCVoemzL/b7/2Olj7HIXvHW2rNFnDY58uBYXaUkixdDjfwwnltGFci8haQWVWEv5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
	b=CdEGapschDiyRNjscQ8dF+ikag4fDp6Bg6ISShs/Jh2JcLbHwtc4v8OU9oSeDLrN59ga
	 bwz9+gJtNO0qnSILUiNCRtzGRYmQAPNtH65F3SlYibrR8c00/LOWHUvGhIc7z3WGPgYhT
	 dIH0NIuxKPBV6Se2/QVQeKP/AK5VwFkGMoc6gmfvgdgghIyZ0CW20rdP+WW7l3/plTjRg
	 wngUwkuAkMAi3B5CILqLxFKpxssZazT+CyfyTseeZGvK/V8EklL2mFZGuhzuzAT5yP2/R
	 bZ742v3Okvknsiob3Ralf4CCK3LjsijK0s58/PjPYFwfaYlAWf9AWJOGncaF9BCOhmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F456606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:49:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F456606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mhuvuvXX
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ea138a3497so4111635ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221376; x=1794826176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=mhuvuvXX0rIaEIqZ3DzR1FBgAu21NuHPq7Q31T7dFQOqeblaWlH9D1o+q9ykUC+Z6D
         sfTUBtHFNuNKu/0W97XuHP23fA2bJkNE9yggNCNrR1M/vXLFuLRK/l+/fLLmYYPLiXSA
         d0xl8e8ZMlhvge/faXWUC8mqUhtRzeYCOJCc2xWMPAB5WHlH3Q9NzA6xDRWOgNpKRjds
         FZQXe5ciiNXD5CJBbKjeX9XJoKsKHtdSV3RKYWgG5adtQEhRNTl276P2PJ99JamMM5d8
         iHn8Z+3fmQOdLTzBDWrPh62ezoPUQumOtOcgdtc9VgPTxHf/U+cbZhNGnkiuuSsrDckI
         VysQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221376; x=1794826176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m084VB4ECQKsSrTuTIsCHm0bP3+UWh/KjmgdqEEXWKo=;
        b=YHDqOb2Sl4aXjdbH7Ta6VFHwwZ7oLLgdwX+HX67eWd5S7xoxzqmx9kuc21u8/GrosO
         KI1dgWWY6PESPZBKbR+u1SFKfQ0xUd3wqnCvQaMph/xMPd57pRyamuzVJJ/c9E7XEdVL
         Mq8nkkSCS272YOJNwOCgtfP1lDOWZbZKqZywTnSnuNjwauh672XeqV1ZgGJ8PcgsWsGS
         L2T2edViq5R9MvNymCI+Xe+bftQKRmfnxfjzgtyBVBmDIuBfEDsv8B42/n39T7BFDeOP
         io3WRTix5GUnF1dinqcT76LwECIUGQA8tGu0r7wd30WA11M68FMFCYGYo727M6DwKK89
         lXTQ==
X-Forwarded-Encrypted: i=1; AL+hErFNQ9iFdvtq4JJbvkVqMe56lpXI946KvUue3TltUIVFDyVLCEWSTvOQ+Gcwsv5qJr+SagbfDv4DhNyqBms=@vger.kernel.org
X-Gm-Message-State: APuU4Z+W7kVYXfupOlpNjSUERHDRD74x6JLdHBQktkSg1EcRKtrw3Hvp
	nphAePMcav3/KfgF17QgFiwAOInSHDhWLcES7hZWAPUsQOmzHeHBCi12
X-Gm-Gg: AYBFou0mhLYnNIUOvO5UeUNwlIpE8Nonnx2JxpsLG7I+FP9ZazX3GrWkqpexIvyZY5h
	hrlH4RkCpiATfFUTXilI2NG1lkQV9IcHZzN6OUUEWyDKKxWxwmb2mFOUBm5wYQZtwufqCvAgLmJ
	xl/7peFIfEFtbKuwr2PBU5vXJJqPbD0hdxdpU/b/K8D2qvqawQ7y6l6ij3mzDBi7GCvfD/xtWIW
	yyatVCnh9MW3z1uSXVm5uIj71XZCgR2EdqZwT9rs7KNQEsoa+9UMGR/9++/MyR71u1iGSItaGoW
	r/dpUhjVRfCs7DPRZWZ+zO552O0A5/333F5/ornWuF1yaNpr0XsWvMsTlshNqjqLZTnb5M4Pk8L
	Xfadge1ZCXUJgXFWjq3IU6hCQMxDpmuax2X/DJBD3YHs4CYlN4pdhBIg4WNvOd/d0P5fxRwVicT
	vXOY0AZovDLFEQ/Ib9jHaXXYP+OUNi+pKQcYWOlSjtHnTzu8OqPnJBht+XHuM/uJCzy+XHo/g1Y
	TkxavJo3hrrM2ekI+UrlD7zoJ+fhb+FViguM4r5qcqSTjssUo7I+j2J3BlgT8csvssmAVAbaQCt
	lMkiOMjAAqBD21aZvKLD/Z6wfZ2qVxO+nLqSnUNvBLhetkQMZdTVQ9hYCMU3Ts/abLawreEwoe9
	ojC6VuoxBhXucLBmSPLfn878R/ZSKSKjsvu4dHnmtjm96u9BPsjA7f9xSvR4CoCNkXFo=
X-Received: by 2002:a17:902:d588:b0:2e9:6352:6c61 with SMTP id d9443c01a7336-2ed8375ffaamr41615415ad.19.1794221375807;
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:35 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] platform: arm64: HP OmniBook 5 16 embedded controller
Date: Mon,  9 Nov 2026 16:19:12 +0530
Message-ID: <20261109104914.1534-1-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
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

This series adds a binding and a driver for the embedded controller of
the HP OmniBook 5 Laptop 16-bf1xxx, a laptop with the Snapdragon X2
Plus/Elite SoC.

The EC sits on I2C at 0x76 and takes commands through a mailbox. Its
protocol and its command and event codes follow HP's ACPI methods on
this laptop. The driver exposes the fan speed and four thermistors
through hwmon (the thermistors can also serve as thermal sensors for
skin temperature zones), the mute and mic mute LEDs, the keyboard
backlight timeout and level, and the F9 and F11 hotkeys, which only the
EC reports.

The board device tree that uses this binding will follow in a separate
series to the Qualcomm maintainers.

Testing: the driver has run on the laptop since late September, on
Qualcomm's qcom-next (7.3, latest qcom-next-7.3-20261031). On
next-20261105 the series builds with W=1 and passes dt_binding_check.

Rahul Pon (2):
  dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
  platform: arm64: Add HP OmniBook 5 16 embedded controller driver

 .../ABI/testing/sysfs-driver-hp-omnibook-5-ec |  19 +
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           |  49 ++
 MAINTAINERS                                   |   8 +
 drivers/platform/arm64/Kconfig                |  17 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/hp-omnibook-5-ec.c     | 417 ++++++++++++++++++
 6 files changed, 511 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-hp-omnibook-5-ec
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
 create mode 100644 drivers/platform/arm64/hp-omnibook-5-ec.c


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.53.0

