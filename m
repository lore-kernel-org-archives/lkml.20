Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D874B44BE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657754; cv=none; b=mdjsOpqm2+WoRZPCPNWr/isjq71T009+TezKytPUe+ZapcIniCaoo+3WfV8HUsbsuhdb9z807M2DpLcN0+hl5msyFCTrP3g4ZhijzHKOBy4jziFQKdRBaa/k5OYxJv7JDUO78dS8RrkGO8ZkeT4RKwDjsIKVkGeaSFG2uIoTlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657754; c=relaxed/simple;
	bh=MsImb+1536QAHQzSwaHjm6KM9sDbSoEHlPqn31ZATNA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oOWWCn/nu2okIMPzSgDxSOymlIypO7vMyRVUFsL3TgULpPgM0s1upLW3kO4xRlzCY1DLVpXLs1GGxygiswOviuKNACykOfgBMljX66B9c1ljzyX91UD0bkGWTLr7jY7tCbqjMNF76PXzb6lNSH2y3PAl3YZv51CY/BO/62k2TX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qyLflwAE; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qyLflwAE"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so5224395e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657738; x=1790262538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=qyLflwAE2B74jukdhVBBxeQs/UWgjtmcc9nF/TwWi4WU2qoe12WxTpEXb57aGJQt3D
         adYFW4g4vWB73DSJn3L3MQ5gP7CdjXjkcCr+g6b39mDeC5u87aQJ8sZQuIrOC7JJ0oZT
         YJUToVpBIgQVRc6WlQLhinjyz1xXbrfMmujR5UUtbGvz7AxO0w2jLcEcS1eD9yZdK4Pr
         WarcRBmPyXlVbN3nYarapYJrVk8ipK0FbEzj2stnz39eoj7oLWZkXDAqQZqpyKjkp3bV
         IX80HUS/afH5O/guh9X7TgWo9p6ComZEOruFGwfbBUMbmwIXek1Wp0CH2lTLwqwOuGul
         Di4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657738; x=1790262538;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq40chmiQYOJ0gNp2bpIfeyZ0OR86JtTGyJZDUn+cjk=;
        b=eK4KYvhog0T8UZCnAuOjhpwjUg63QDxc3CmKyrqNo1up/u+fDQIIc4wfZiDmQm2j0Y
         JmSPQYJcCW4UNYIbVxXIPBHT/LQDmI0Fx1IANPajt6/pIUofaYE0ituJLD+Q550pxXac
         Wv0DIvjFeJ6g2IS3P+bUmqp6UpO+vBsVrBakcVhdlcBWxuT+kAUxYNQ6JHV8xz4K3fG2
         mbU3CSr11sDXk8keBJZAZewRGIVT/5g4jNAyaVsn34Mj/aH+QNKtS8VgyBMScy+Gx0BG
         7uEJaL4KR9lY9bmE9jPcU/4Hcf95v9ckEUkM3/vklbz8zPfjyxAQ4Ccq3p78HPX8Htqb
         EzVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxPxCYiD2Tk/anRS8PXIIYZRauz67k9X59L8UejuQweSyZxyytgNrjwgi8xuoAM6Kz7e7R+2IZgy1nLBCU=@vger.kernel.org
X-Gm-Message-State: AFuF++mplblcsbyMRbiRWfiO1jS4Kxok+evqM8DiehfALE8zLHuYl0Iv
	oU25GNW8LnJaJCkt4Y5DmeEonqV3lwkENI8cA8x7p1Zxndq74pm3Kwdm
X-Gm-Gg: AYBFou04sbvFUnJtXhq8dBIZmPVGaREwKT2hgWwUyxbfKEoqwk7VghqYGRVlOBp5qmy
	cCb9Cu2n0oXRLAWIoX7e72Xi1HrU2K9Pw8PtV6H8LKaey4EohyVyVnbv0qLLJAtqxXe9+nM+AGB
	AABsbtLbuMvQoAOSMKHMl+s7PUKpctI3JS7+Ekno2fqaCQ5w/X2RAiYGxxe5L3pXfdWz2+VjFil
	xOzmEk0jEo6NWMjXZe/Ktlsz7Jb938TyXOPi4DdM88BnYAPfPLgdj6ZoHTBjbk6khHCVWywUFLA
	axpjxng37/DnG2pG/odI6oB97mgpY7BC5fwhcfg0apOyICN+NSHIty4O777EOFd0+DTSaSFu0Id
	/nKPcl7wKm0Bz3Rm3v42i1H/+EcmVO4z1mBLY4JdVIqVUfK1UrgXIiRt/+cGcenIAfB9tHDKs9G
	hyNSp5BtatSF8ldB1KU3y0Z2btJj+D2kTbZUgjFvNAWDWpBrYL2E8p+bBQ4sxZsKXhjEtB4xH6q
	/0feMKcl2pQDFwq9Y+njfEA4TDSxTwPhKtnmlayXaTL5dbiIhuRHk2RgyfknJb3DtUJoBUeGQ4S
	NkVutMw9z+yh4dTyABqYUQ==
X-Received: by 2002:a05:600c:1992:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49fbd1af43dmr50366195e9.3.1789657738046;
        Thu, 17 Sep 2026 08:08:58 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ef3sm82531345e9.1.2026.09.17.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:08:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:08:42 +0200
Message-ID: <cover.1789657399.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series updates the Variscite DART-MX8M-MINI SoM device tree to
better reflect the currently supported hardware configuration.

The changes configure SAI3 in synchronous RX mode, add TPM support,
and increase the Ethernet PHY reset deassert delay to improve PHY
detection reliability.

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 arch/arm64/boot/dts/freescale/imx8mm-var-dart.dtsi | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

