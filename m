Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ADD4EFFB0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673508; cv=none; b=h5s+smPGCSUlwmtt1PhR1etejimOBEzY+tkcj/XAx4glGj/0ltyUvv3vLVGGvU2+/797BfZNUVpCweoZWYC/DtTwIvdwDgAXg+ZsM1PB62G0XC9VK+cgJZCv/M6OkgC928gF9Z9EZZipBMPibZL8OojXatxlB+J/YJL9qLrSlgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673508; c=relaxed/simple;
	bh=xl+6SGpN5r+JlU8uWnKJTgqgf7MWKOx0cJnxdrgT1hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J2lSCmc/up8yxCwHuNG50Zq5u2/F31UINSLQ7Doi3g4ZIFEvsh0TXVt4stklm0lYzAcsyP572GZu6Ffg1n9VG1TVX913L23goomu17JQb0tEwdXCNlqlAfH5fhrIyusRtcU7bzAY58EZrkRUAL+3gW5AyGAv0KVDxsZyL8pqWVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=IeplYyC5; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="IeplYyC5"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso29535265e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673501; x=1791278301; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=IeplYyC56oEeUKXl1y3lXYw2poDIC+REl+l1Xw/6uedfnlZ4ikxBJd5rcFZqHI2acN
         7nWWetVydgVEx5ZR83i05hfVPYBiEUD7eSVy2wIYvmDKZulE0shXCsRgTpReowNiVr6i
         vMjGL3NidmuogfSA1xDUYS6ABt3qQPKFiO8dk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673501; x=1791278301;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T1qvv+WBQk97TqMLFAiiMPDCR04SnZ5MGolPSxFRq8k=;
        b=NOmCGbkKk2zr1s1wYT94hW0g6U3SYeBnVG6I4YJCxIFoUYfUVUtgpChn1u6Cc2rOjd
         QCLKqhyyk7nOLLCe62S79Z018rggyDhgD2kcN/aPuyz+rtDLrkz+EYhRAFDxwdQGnwAM
         u/+DVus5QdZl2PU0EylgnZiVgex3j9WEc/Iisr8XEiSaXXhTRv2DdlMb8I4PFqWoZ1dv
         k60FHFmRrEr9efWRKDng/EKYSFnQsohfNKCzEF4vlh4pAYhIdwZczdTf6PERlGXkIIOn
         +L0ATZp1C6bd1L8xbbmMbwC/JwNzHuwmZYLgGi8HjRfcMcmqDgPhAmnc8INQ30JL+6mR
         73WA==
X-Gm-Message-State: AFuF++kTUiI1J+WwAIdLaExySCYIWiR2pBDu7xEtMEH0/dSG+uA03oQn
	A+FZFAaNeasXYVP+aOzrMIlUmFZ4WDIraN4WLwvRKzJiU51iGUkyhz1USMgkl0rzXuFtwYm7yap
	/XiXK
X-Gm-Gg: AYBFou2Lmuo+cosBOV+mrivprX9FrmpDS5/ZtIlX+TUvFkjamoSriRw+/XNqIJuXePk
	eOgHZM7W7tBlO9aDqTS0WUYBTuQfaABgYQ2xQ5Lr6KfDAecDQnbysoOP5+kiWq48wbMWXuk6w1j
	KdUqOsKOIvZvPhVpg9Ebvvz6xqwT4PdH9k3WwMM31kZEhXZh5LKvJJzViIa8pnujKlWGzSQ3QOJ
	a68D6hosyRws4RaNa/tY69EmxaIZtCt+iotEblYi9OSJsg89/M26BJ2kYF92RZRb0jG+XW7dkPv
	u9iO1dBVW9AzMP+Gn8otr3tc0elNz5nEMO9SXQ7ntMOVnC6EIVMjTeAHUCX4Qh/6yRsBUMSLaYi
	/UASGhLZSqgpWcPsEUDkw6qo2QX9DobXc0RPd71iIkjbDJ0nZuJH0p+mNrXNtVJkQ51a2AEyM+5
	utvtPquQYg0zT7h1tndvDzcrrwuX2bJvJ3DS5BAaVTA4/uHMxTRVBjh7wNkKHpLW8DqA/LgsbPZ
	jxPdn89+wPPRbw=
X-Received: by 2002:a05:600c:8b71:b0:4a0:328:43df with SMTP id 5b1f17b1804b1-4a0032847fcmr81130085e9.21.1790673501052;
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:20 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>
Subject: [PATCH v2 0/2] arm: dts: nxp: imx: add Draeger M48 CPU board
Date: Tue, 29 Sep 2026 12:18:08 +0300
Message-ID: <20260929091811.3735201-1-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds the device trees for “Dräger M48 on NXP i.MX6 (Q|DL) and Intel/Altera
SoCFPGA Cyclone V” board variant.  It has both (the SoC and FPGA) on the
same carrier and they are cross-monitoring each other.  The SoCFPGA boots
independently off qspi flash.

This is the imx6 devicetree part.  There are two bindings as well as device
trees, since M48 is using two parts: imx6q and imx6dl.

new in v2:

  - add the tag from Conor Dooley <conor.dooley@microchip.com>;

  - it should be clarified that "draeger" vendor prefix is added in
    my previous Draeger M48 patch series;

Petko Manolov (2):
  dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
  arm: dts: nxp: imx: Add devicetree files for M48

 .../devicetree/bindings/arm/fsl.yaml          |   2 +
 arch/arm/boot/dts/nxp/imx/Makefile            |   2 +
 .../boot/dts/nxp/imx/imx6dl-draeger-m48.dts   |  23 ++
 .../boot/dts/nxp/imx/imx6q-draeger-m48.dts    |  23 ++
 .../boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi | 369 ++++++++++++++++++
 .../boot/dts/nxp/imx/imx6qp-draeger-m48.dts   |  78 ++++
 6 files changed, 497 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts

-- 
2.47.3

