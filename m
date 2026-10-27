Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793123492;
	b=RwxE+eR89PxZZw3Sx+9DmNx4Zv0K0R7NMr4nmrF73gmG37C/1HEWT2TfHIbXVxVwIrMH
	 6UU23+RVo1/X9G28wd0jHPP7PB/i30gcDt2Tcsx/c4jy1GWNM/CbNAWkH/z8zqGjfnvgh
	 va879DbEICY8tdvDCo1wkMlUBR9OB/ZjvyY3/TPFu3Ba9r0AMUbdRYKzoGibukrBJHMzn
	 7bEENNkoBxhqlJSkRb5Ua+Cd/kWPPDdDU/OX9AMi6l/6Z5+NSfVpybWXRqXJbmfTMsW5+
	 W0CKIy9Qt8UalYcRMVjzDidpxw1LPWa4+i8TWZnX50banv0jmFrNlAMVyhumsccF8OA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793123492;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
	b=Qf0ZOvC7TMSitT/bO0CsuEAUMtu4J7iL2Wk9fhcky2VWKZN0ltbnP574RQAxZ+N0bbyB
	 64qe2uCGguwdIrjerqEq2wRuHic2BXR9acS8nAaUXVS5Sps/mpQtlXlLQzkFoxFZHOtVY
	 VS8M6ypvdKcb7ntKlzobMBSTaVKHc1zfK62rPrl+p/Vr/W9KuHZnMY6o1XuS9sGGByrYz
	 sUKw7c3xslqBfc139/VjuDipkkoe380Irf4mRXCosl3FBgxW1a5hyekfTJQECN8vpVQ0f
	 J02QKtiGYiOK6qyh1XMLIktH6dib0PztXw7pvHJgldFz8un1bCHZFTDJiFSBkDnapjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KnNsRIn5;
	arc=none smtp.remote-ip=209.85.222.227
Received: from mail-qk1-f227.google.com (mail-qk1-f227.google.com [209.85.222.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1100E606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1100E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KnNsRIn5
Received: by mail-qk1-f227.google.com with SMTP id af79cd13be357-93f1e5d7450so1891685a.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793123491; x=1793728291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=pS/RE5IsFFzABmhRwxEpYOXjFWNr5UYXAis6CBUvV7r5vTCoxN0CTRn5hn+vZ2xXiI
         hERsFPHLPHuO9Vvoo0cw6MmAgnkdemOQB9Be5d3pRmKGLCjg2MpDyJ/5gI4ygHTWLV1b
         DUNPLynF60r2rU0TZAHGPl4jsPNktyhJ4CyZuIYJvNLgmF4mRgWVgqJ4p/L+dwWacnzf
         JNzZ+CCoU8lFspMpxk0X6eSKAZMHLFRoVzz6pD3qCA/+8ktouqVeK6QGHi/IsOqxDcz7
         GZlvSP1bIDgD6YgcRlk0aBXwriUb1TQexLKaPtojf/jYHYKcVxJ0pxL82fRq8Bq8vtTU
         VOAg==
X-Gm-Message-State: AFq9FYIF3fNhGvGvi2kPepl4q/gXDIl+CNoIrQ2DcbWVDbjfoe+Hv61n
	eeWI/cKVq/Jd1iWe1B9tl/y15LpiQhl0CIgAfvfbp2z7W/wpumBFQF6PLaj/uJYPRiqc1tskr3u
	3aJv+scCo0p/K/fCDdbKLKUt2VPVtgxhVtZs3euPN7/Y7oMbb17UZeAy1AJfAEgH1rTstEjMS+n
	bMpgQw9L6V3iOZTUy2upuhoo8StmVmtxOzdFUk/4FtzYIyPDufsRkfQvdYpo4tVfHZFiqTBXPV9
	EdrvAWvm1h81XpqINXFYaFWpXs=
X-Gm-Gg: AYBFou0OIKfXmrLUTT7eVhauuGUZlQdp74QgjHNObza5LtzDFhJUSVluXa7edGeC/KZ
	Tk+x5E5oCUMPF+mfhEgxIMfSf5Az35vxFPEL8lMTeW/yNeq1oBfMoCGKTGe+vVJ85yMUe68el3g
	ZjetxEATTVa4T8+hTjW2a/GyjdfNyI9slCeZ0HdQ848ch3kgrQCCquiMOlFnMXs8V7C4ew5kxQC
	GWmmqMdX/j9P088uOj3zjB1dQ6WiKpij/AG8TYH2+Bv42tuJSF/ZOToUdCfuvNvc59LeoV6OdRP
	Bu5uhHOh0pTeSk+GjpjzNMaSIq4LS2glI6rRUAvvge7NNYxhncwJCUxrcbmh1cLe0r8J+JPw5As
	W7OX6q+2zzJZNJVYDKvEEarLmO1Yiy1q2JOTqFfzTuvUQrL0oRtFWcOhXWwGwk39w8wvenurJ56
	6Pm6C/RAB5gJ19YNuK0hDL8KNO+lWYtMUWUd0cAd28T5I=
X-Received: by 2002:a05:620a:271d:b0:93f:643f:4f4f with SMTP id af79cd13be357-940ef95211fmr1442604385a.50.1793123490977;
        Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-940efc55aa2sm152255685a.0.2026.10.27.10.51.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53639e47be2so4084131cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793123490; x=1793728290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ynPryf8FPydp/yEEGiFFJxiHciJ+nwSgBGs4pEky5R0=;
        b=KnNsRIn5rPXbYlRZ3D8CkIIIZ3cjZ2XNagJss9nCusmcYzYdSEeFZr4iGUEKO1j6Qa
         VYT0q6RqN4/Qi9WDHp8awscMrllkxaVsdLomH+XO7J7FpvuOB+m+Bit093azr9MDVum0
         q0643wT0D3JWUDFN60poZNns3i8L0mQmhUMiQ=
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179841cf.0.1793123490186;
        Tue, 27 Oct 2026 10:51:30 -0700 (PDT)
X-Received: by 2002:a05:622a:5b09:b0:536:539a:af8d with SMTP id d75a77b69052e-53fc5cbfb48mr1179381cf.0.1793123489573;
        Tue, 27 Oct 2026 10:51:29 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5383970ab61sm83164511cf.17.2026.10.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 10:51:28 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Support for BCM5301X AXI trace PMUs
Date: Tue, 27 Oct 2026 10:51:21 -0700
Message-ID: <20261027175124.3518239-1-florian.fainelli@broadcom.com>
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

Changes in v2:

- addressed Sashiko's review by adding the appropriate title length and
  group validation

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
 drivers/perf/bcm5301x_axi_pmu.c               | 452 ++++++++++++++++++
 8 files changed, 619 insertions(+)
 create mode 100644 Documentation/admin-guide/perf/bcm5301x-axi-pmu.rst
 create mode 100644 Documentation/devicetree/bindings/perf/brcm,bcm5301x-axi-pmu.yaml
 create mode 100644 drivers/perf/bcm5301x_axi_pmu.c

-- 
2.53.0

