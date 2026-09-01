Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028339021C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 21:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298953; cv=none; b=sDJ/jS1ZaZvsZsGuOfqmx7eUu/DwaiqbrE5EqRQyGf03NqwNlMZlAsM2GRnHzSCxHmMjDJzWF8Ag2UgrxNRCtwzzhl3l41bbiObaU+sYeqXhAQvnGMqgQ11NZvcMZ9kkKg/dENhX0IPmmBewmCVLew1LN6i6mIq5y/6x8mcKf20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298953; c=relaxed/simple;
	bh=81GtuhM8WPaQORq30yLJ9T7RnVg1D0CM09jTFAW6Whg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UDwrkxZkeKB9YLDY80cN8ZsrHXShliwgpm0+pxyKxd49IG3S22HjyGc6mBBgnyrClUiMil6I1TV4qj/3wz6rFNor77XSWTjuV1jFgRKpXz9+ZyAczsJmtngaGHmW9mILAjl+bKLVHXbL45ObfsfKxJ35xEuOtpPU40LmPKg676k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mOaowlb2; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mOaowlb2"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f57db8b5a4so219628a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788298951; x=1788903751; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y249H53XhLZ2onZan6XPWtvu2gNoxIJKlrKV115uQNw=;
        b=mOaowlb2nBqpA2MI2X9Q+0Oy7O0HGn49oi6X/L32JIQ8IB9uXwckHU+rdRSJbtfM13
         ewJfJvInM+eDOnpta/LlkkqZJfN5qpd790gj7UrVDuCmS5PDNKErvjBhDkxcSngNTtgO
         bYAjgbqoEfQ8KVvdY4EARjiLQsIFXVpku+geSOdsrcAbdjH8gOMXZYCf2wUGMfZtu8pa
         GZ7A9CKJhYVnygNSyli+iEKnJ4fGbHxo5/nctCjQDw+mmuu5deRZ7WyIfDCob9Lu19dA
         dRtmXMgk2EbAtm4AEnlZl4h3mfVd5yH0tuMXrfFEbmQn7PIOLd5WqOR01XYsDnlrTAdE
         S7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298951; x=1788903751;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y249H53XhLZ2onZan6XPWtvu2gNoxIJKlrKV115uQNw=;
        b=fMZDlfvaEPzN/QTJDKMu0IqcIPSmZUSZ+xpBAnbpFHJMQhXIa7p6N0SUuThyx2x8si
         9nj9o5psKdCoWQsiEQu6tkZGcMEVc+UJHip4j9TxgZTGQjemAwPQ/iQWAtPNSBS3IfgY
         0hqoRuMu1DNiWjwZPPmr3Jd+exVMvM1OgIEowPikeFTUckE18x427bUjhRJj8dWdInqS
         36B0RWNp38/aV4JsPaDAkg5lF9yFJpivLjG/Qn6ktB0XmDc6zc74iwBpu8FKVYCfxAgm
         vLEZg42wHQ0ADzq+9OLjDpDRZPLZL6afBoawHeCVVTRIWEIrWEKHdFAWVGWJ8dZuTiXN
         r5dQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNf9SRN74WbQQTEj3OxjUlm4U8yncBGSSv1RGznT/UU2DTaRSwMxMryWGNp6sBFbC2FklBtJIfwYr/AUc=@vger.kernel.org
X-Gm-Message-State: AFuF++lsCpvQCrhQoqBDVibWMFFI8WfafAqWqmzC5Km5ykNvsad3HuMV
	IsgeD93MvZUnIrOzWl1EevEkQ8+op517MkC/0jtiqRVBz//pb8GnO/ajqawtsYO6
X-Gm-Gg: AR+sD13JHU8Dd11DdIlWnYRNkKOcVj7RBfOAbPqlCO/kXrBErjkPQTWGW8iMyGcZbP5
	Gzez4jjL3Wh5qeoUG8/nAGYgeyCmiJV05R1Bdg90z1AP6Xu3f1iRPs4LOmJOAU5hqbNswMhECAt
	06vCFnFh6pwkYoj2az+NaEhzr+no9wEMzR7odpmsaUrogzEMFd+fJXjbRpHY8c95XPVDb1m4HjQ
	y0mhdq6ZFJYHIpxBJ7FHPasNOmTdfOn7WRxP7dmCnH8zzwO+FOOIlIyiuZmt1Gj/dyWt0Ik4YWJ
	2EiFZzbupiBsobbZIUzmUgfDFNzb/OyEy+ZWFEyiYrMLUK3pYEGvNdIooAZMi8+fmkOoVq6fabe
	dT9Lnn1IfobWBxzQkSJRBc9GwbwpauQFo8E/2nXiYA+aIL71e1YqKtvEGk3IKiZNiONN3atc09B
	xSc+uKc8azAhcKKYI6khFi/ZNEHDC/vPb8PETsqLk/z81cfEBSxlBKB9MMy0Uyf4Zvzz9G8saeg
	5HRDjwyHDP9NZuScMkQkRJmut0HDtRXuAS1bx3lpvf6htOXObLZU+EINI/MUPcb2VlxfsNMqBIW
	BPw/Meot6hbXZtVwhVIcns6rXC3l3sitS22LXuOc+3BUVQ==
X-Received: by 2002:a05:6820:824:b0:6b3:6bc7:2ea7 with SMTP id 006d021491bc7-6b36bc73476mr11612524eaf.7.1788298951280;
        Tue, 01 Sep 2026 14:42:31 -0700 (PDT)
Received: from [127.0.1.1] (140-186-136-19-dynamic.midco.net. [140.186.136.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40ba648f6sm1094703eaf.2.2026.09.01.14.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:42:30 -0700 (PDT)
From: Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH 0/3] Add support for BeagleBone Black RevD
Date: Tue, 01 Sep 2026 16:42:20 -0500
Message-Id: <20260901-v7-3-rc1-beaglebone-black-revd-v1-0-f521950b777a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxGl2oC/yXNQQ6CMBCF4auQWTtJS2OJXsW4mBkGHCXFtEhMC
 He36vJbvP9tUDSbFjg3G2RdrdicKvyhAblRGhWtr4bWtdGdnMe1w4BZPLLSOCnPSZEnkgfWeY+
 dEIfBUzzGADXyzDrY+3dwuf5dXnxXWb5V2PcPzG7msoIAAAA=
X-Change-ID: 20260901-v7-3-rc1-beaglebone-black-revd-7cab3f1a6563
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Ayush Singh <ayush@beagleboard.org>, 
 Robert Nelson <robertcnelson@gmail.com>
X-Mailer: b4 0.15.2

The BeagleBoard.org BeagleBone Black RevD and Industrial (00D0/EID0) are
redesigns of the BeagleBone Black Rev C3. They feature an IT66122 HDMI
PHY to replace the EOL NXP TDA19988.

Signed-off-by: Robert Nelson <robertcnelson@gmail.com>
---
Robert Nelson (3):
      dt-bindings: omap: Add BeagleBone Black RevD
      arm: dts: omap: Add support for BeagleBone Black RevD
      arm: dts: ti: Enable overlays for BeagleBone Black RevD

 Documentation/devicetree/bindings/arm/ti/omap.yaml |   1 +
 arch/arm/boot/dts/ti/omap/Makefile                 |   2 +
 .../dts/ti/omap/am335x-boneblack-ite-hdmi.dtsi     | 184 +++++++++++++++++++++
 .../arm/boot/dts/ti/omap/am335x-boneblack-revd.dts | 166 +++++++++++++++++++
 4 files changed, 353 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260901-v7-3-rc1-beaglebone-black-revd-7cab3f1a6563

Best regards,
--  
Robert Nelson <robertcnelson@gmail.com>

