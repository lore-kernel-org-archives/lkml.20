Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793049123;
	b=hk47j4z55XxjP6Qia0heEiJ47yvVSugOtnaczue7tWooChgnR4r+nZ1+LpQhBwXK/gGy
	 kLXiw1KnpG7B/pdRyosfI2N6hVJTV942hJ2sHz+0YfTZasIzaDSS34Z586XJnjhUWMzNr
	 YNfv/WJicH+6DehR+08GoLKzkgbqQRY/LpTfOKfRZ/TY4aygsKOBLF5Pj0NL03mys1bRc
	 D56xIFFnzbN6MzI+EViUL8Yy4827kdMi1e8dD/GtY1+ZRQPJpLgSddTAjcj+wMUGtQQ/L
	 0GsDdDZyM56cPCVOmU0JNOb68l/+bZbzfwpRSLX8jZrwXxdPRa3UYHTPEfyKTk5+8RA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793049123;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
	b=ZwiuJrdVz2lhbc7aw6yZCHN7wTTiCZTfekVl+mkoBgNDo1+/4ZxkdPPm43JF3SismTmU
	 UMSSuC241SY0CL1CDQ5CjoTfaotnBHnBVgk9Ny5hSA9nOSkoZVMfqcLR0puP7i93x+YIQ
	 4OGTIk37tASvW7rtgPXjRaj0jxLZMjcCDmczvaSy27a+huB3huckeA0wksDXnKmNcqAtr
	 dL6SXu6LIFvJggsjavZqk6A3KtTCu7UbKMPv0Lp05eJ7p34GkRNwueCMlqWmITK5tltWK
	 Kgv+xtG+Ubwn+60O5QF2UKD5b+mECB4QuXaiJplls9Wn3LhaLDu2+0mhtnQziNlFrFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="N7msw/Lj";
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0B3606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:12:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C0B3606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=N7msw/Lj
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8a06c60065fso2654353b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:12:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793049122; x=1793653922;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=YCI9fuo6lAsU930u4Kv7Sq9Pt4A2yYajy9cY9nZzabxWOtYx8aHNUwI95Nmo6cz9mH
         tUcucxygrRrRUbeJW9NNSLYGrYuhXe2oxsM8djIvYgCbmf4G66N3QL2iYlElpj7ZB7by
         9zoINJJqB6EcyLBxUVlLfdZhYKCBYTfgt2WuyGTiscNrxw1o1YO5TS2ewpPkKM9/eKs4
         89AeLQJ7pEubwjZ3hnRXZ12/M6wUNNYkf16ok3lJz7vS1d3aejPH5sOhEZctDDM/C/bC
         vzSlug2kSveP5RG/WO0aWGCmNEE4PD5tBA7TY4pjWV9hh0WXA9PvXE48ZzgQZ1VUn4YD
         jnDw==
X-Gm-Message-State: AFq9FYLRmPBgHXOdWJ4jhb2Pvrp4eL89EObkMnK9YEVcLRu1lGO2xMfF
	MKnylsbOwfndM7ebl4iwGX5r2Hzt33RQT/MuhYGEeORYfxi+lh0UK3yUVEqkvfZG8ppqM8Rs/XB
	KP/jvZ34syeFDS1mTuBwu1CJzUrxi08Lz4EaDN0cyz7cy2bHEAhM+Vm0rQIduchWUzy1m3Dhyks
	CpXj7w5kq/3wbV4bq5lHAJmK9DWmBFTgWiSny2K9vyEQ/M5XUmofniG52ydc86+nDBTNNUJJ9r8
	GP8PWTDjcUDixAbhmvN07uWyH0=
X-Gm-Gg: AYBFou3zJ6ifnMMa1kUGcX9Mp/abuVwFiw/IzVs58l1wQ6P+mDS8ld4gfRKce9J8fj4
	o2NeawUu/rqqmTVTWX6jqo+W2Iy0TXKeCYVmCXTPqQA30aFU1y6MFwJ18MT4iKaFdBIVHKUZZ6T
	Y8QC7uvfjUWJuCQR74HCyqSf9k3Bj0HZlzPD3M5fAjC/JfC5sWxnZuFs/ffAZdomO+JYQJ0vN25
	+nXEhq8HHcJ3qClgmXUJ6RBSd7a+bv/Wo/35rgJZLS/UtKFLLaeBUs/uPHM9IhYT5Q/8A2xi5hY
	vHFDp19GZ/etchw6Gh90nnLMW/pKXOo/xIr9DQHAET78hGZm2lBSNtXgls1V1Ez/6Z/JbwXuy0L
	oAKxXfD4L7BVQgabyOwmr0xtYmuF7vdp6/FXEBnsQzCuN1anX7M+kxN1XDNyJo4orFJGrVbQNxk
	y4F8eHdXs0PTgC5UIx2rmRBxjdYSTOT4S6l/9p5ndz
X-Received: by 2002:a05:6a21:a109:b0:3e2:a412:4f1f with SMTP id adf61e73a8af0-3e7af7fc643mr5468199637.9.1793049121781;
        Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cd8cccdc86csm99578a12.23.2026.10.26.14.12.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:12:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-186c1aae818so3301971c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793049119; x=1793653919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ESG1GK92x5B58pgVYf4SxkXNGgkEl2iePaEHR3ImRM=;
        b=N7msw/LjUAO06jTT33HAeE2jfXss/tWdcRa9CMPvn2AKZ84mrvNCO+U7NZQpgULCVG
         ktJvfFKjLUPxWZyP7zlpGrpw15mIHiNENiWyKewSda7W+LPLvHHM0zs50wssyTonX1Jn
         HhxxF+MXnk2PkUrCusJPEKXuOzENWxd0e7gWw=
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809698c88.26.1793049118944;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
X-Received: by 2002:a05:701b:42cd:10b0:165:4b88:abc2 with SMTP id a92af1059eb24-19936e394f2mr11809638c88.26.1793049118184;
        Mon, 26 Oct 2026 14:11:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a0f81ea9sm31915678c88.11.2026.10.26.14.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:11:57 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM5301X ARM ARCHITECTURE),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-perf-users@vger.kernel.org (open list:ARM PMU PROFILING AND DEBUGGING),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Subject: [PATCH 0/3] Support for BCM5301X AXI trace PMUs
Date: Mon, 26 Oct 2026 14:11:48 -0700
Message-ID: <20261026211151.3212237-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patch series adds support for the BCM5301x PMUs which are AXI trace
engines present in the chip.

Florian Fainelli (3):
  dt-bindings: perf: Describe the Broadcom BCM5301X AXI PMU
  perf: Add Broadcom BCM5301X AXI Trace Module counters
  ARM: dts: BCM5301X: Enable AXI PMUs

 .../admin-guide/perf/bcm5301x-axi-pmu.rst     |  92 ++++
 Documentation/admin-guide/perf/index.rst      |   1 +
 .../bindings/perf/brcm,bcm5301x-axi-pmu.yaml  |  43 ++
 MAINTAINERS                                   |   3 +
 arch/arm/boot/dts/broadcom/bcm5301x.dtsi      |  15 +
 drivers/perf/Kconfig                          |  12 +
 drivers/perf/Makefile                         |   1 +
 drivers/perf/bcm5301x_axi_pmu.c               | 450 ++++++++++++++++++
 8 files changed, 617 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0

