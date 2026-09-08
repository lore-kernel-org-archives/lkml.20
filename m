Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CA3517BB1
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788863863; cv=none; b=Ebh+m5OzFJwZU1JnY/vfHA6pZa7tnIVYANf37p7Q7ZMgXE7OL66INpgWunkTfnUR2rLZBfdrYuZF91FXW/EqGUCm0JIMxa2dArdI+/7WZy0cH1i+tDZAfk6tCf8WoIk07mivZjfOnrq9eU2gn4tANRP03HoziZKFIhNPDcy2XLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788863863; c=relaxed/simple;
	bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haa7TC7eyJctbM7jiVMZJs/X4cIUmu+Num3zUt5w+QEJ1JSZoq6UYIU4N4ngcJHsX1bFY+A0QOo2FIq7ciS9y6oXJt56Y6BcxMAWGhXnsHhGcQ+3hb7kSaYoO944mGG3ZE3pw5RuQepq+7PW/b+IitYvofsPlSMP7KNnMgmAqPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svDT/v7W; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svDT/v7W"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so3107375ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 03:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788863861; x=1789468661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=;
        b=svDT/v7WbPQrQ7qpfyUV9xMt2pnSQcf5ETp4dXJsFBBa7El8y4K1REtrvUnvS/xY/u
         n4G1ZPjbkVztBT0TjwRvyTq83ISo1ziEDK6En4XEK5M/IIkwid0I5cr28CL1xobWolGn
         oBjxt/G+w5SqAXyrHTK5+MN3QiHjIOwrZIxINnZhmfK3BNss3JLmorpxP6mEe2sBAJFl
         hbayC4GWOBei84k2ktSWq45zjZzcCSYbhIv+mYhXldBgLGyJonqbjoHugiXbziRqxp0C
         xkdoHErKCpV/BOvrhD1xEw3x+rSlfv3T5ubAltrCnSimU/ENQkKZ+sTmhUNX94POx9WD
         7aSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863861; x=1789468661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qekOjTKAbV3bYAHV0cqmxxGdYf6A7xrJOKm4lVlExn4=;
        b=dLYVyqSQI8A0noWBh9jdgqMzMgG32u5FnGuEIEj+Jfr+t5AQGDCfbveT+Nyd5cyHT/
         ytOf4+kPKdwlZyv2N1DcjW7DAfNxBL1CsDmSlEnyFXPFBhBaI8eCleE2VbuTKPSmXgrY
         2czxzSnRmL5pawT6KcKcm/H9ztocd3r4AaDLzchrKzuSETVQRWVPM7F9Jz0diz0fJnH3
         HtEAuejwzyKTyQiL1xvypoB49K1fDdixLGFj3oOVVuz9rWnyV7+UzGF0hXnQqlYM/I7T
         TbjDO42XNEjcbEIooyxGaUnB4BugzCBQbCDIoN465unpH9zYXL3Mo12HKwVsQ6O/we4B
         JEfA==
X-Forwarded-Encrypted: i=1; AKwUvBwj8PwifQck6HV/+xUhqGsOOX2djpt9LzD4K97HBDQlpC5iTPGZqEg+XebGKOAvf9mG8X+jBqWFGWdeOZg=@vger.kernel.org
X-Gm-Message-State: AFuF++n6gjwAbdt4Qd7psPogxlXUp+4+j06D7KRE93+tVWHr8wXNlhRN
	HkhNUZRA+ZTYsXLJOC/l5yVY2rUu2EFyCaeN3D63ImXkfOfssLL4r8gK
X-Gm-Gg: AYBFou0SBdIsy3eR+mv/F7NS0HsT6nzQ8PVq6x1HZmWF0D+MRnRZaVKXsmsrFrZeqsm
	IiJpI6OOzGU6erqC9r7WrP+GwM3ef3PDenpV3u7DpZPUBE+BnPN6Oh6DiLIXdmO2yo39Cf8/hdf
	r1KByLORJ9lJ/qCLVXenLU9DwjfZWkfgzrrRmJz7cV5/abH5ms0YfL/n72Y1bWCDAU38+Nk5VB5
	zUP3yUHiqVC2o5aLwTsFj9dCpjAvu8+C3dGfNOAg4+PvaGHUDVUhl+pugC5h3yDzhwjJar06t5T
	vXpPvvDLQ3mpu7HxXZ8fshNLLo3/CigPUkBvIXxbaIXmmtnOvXRePIzeS5gJAryYVlq0vP1Ddq7
	fyYfN5R7pB5C2T/p47Vr2Wk9OHA1JRvoLz2WViWDItYLvshF4arG0uxgzslPOx0QNf2Jx/mxvLb
	fvRLCZ8MLg0uWW3vvn6x/UQqrGSCMTk3DEyFJmQ1RzZv1h+4DlYk92r5w+W1w8hyLzTDJ0VBPCt
	pygV7IbIQAiw9QAv5V9FuRhPI3ESILgcEbX0ONZW20yKtblgVBB
X-Received: by 2002:a17:902:fda5:b0:2d8:d4cf:fe47 with SMTP id d9443c01a7336-2db70292fb6mr58987095ad.13.1788863861471;
        Tue, 08 Sep 2026 03:37:41 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14ae4b5bsm57362155ad.77.2026.09.08.03.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:37:41 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Tue,  8 Sep 2026 18:37:36 +0800
Message-ID: <20260908103736.236803-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720102222.251179-1-a0987203069@gmail.com>
References: <20260720102222.251179-1-a0987203069@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping on this series, it's been about a month since v4 with no
further comments.

Patch 1 (dt-bindings) already carries Krzysztof's Reviewed-by from v3,
unchanged since. Patches 2/3 (arm64 dts, phy driver) haven't had any
review since v1 -- could I get a look, or is something blocking?

Thanks,
Joey
