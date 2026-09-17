Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6651E4ED188
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 15:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659714; cv=none; b=eR0gS5urE8yDNak+KjkZPbO+wi7b9hHU15kn/Nh1PMVrUhYYeHOf16c1JLJ1zehgnpXMCPy4Jb9kmeU32dEHOxom7j/+zKPL6FMFyxTJrUNCxpC6kJTSxO4+zaQry0vTDLdtX4AIqPfz+9FKQoibsCJDCkLhLTqw+T/HncMBLoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659714; c=relaxed/simple;
	bh=UDNJflXLP21/068t+43/BbPA9K4CsGbb7V6J7alYdPE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJa02sfWzlJar3yhyKLrffTzfbZ5K4AiSGml6L4OeM0y/sXksW2/Cm4EZ7Qb8H94k5YTmvO61QHn7k9eMKRMt2SfmU9sbNQ29SKThvOhZKx+mxqx1YjFpMzcRJrDNFZf/HSRcxwxvzcJbXYBuHq4k0Ns1RqagMkpH4yQN6CyaoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDmxqEIF; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDmxqEIF"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so7242855e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 08:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789659700; x=1790264500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=;
        b=mDmxqEIF4De/VITkdJXDLYvMIChy7s7owOJatQnZ8Y16IzNKxVFtmtUc5JqvjMnMhI
         /R/qA8Z7j2TSlGmWiaFDsHQ/V3gZKGKB/AZm+SL3LuD4fgW/b5kghbQap59A/uGO9Elz
         1NiS6Q4FSTpf2ow6Mul3nZPVvrFa1EiZKA87734AjdpwQISGbj/k6rUaQ7ubKaV+9O8M
         ucFqlKMhi9iDdCRllLhvDo5lFvbwhL8VJDOa73AiJmf7OZ4qNZa9jrYqaACzo+5qiISo
         sf59D2nGiV49zwIFdVGXg2JoC+0O9niQp6DsJHHrE9A+ZA/e3+t7e1vY8XIJhZDCyg0C
         Ks2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659700; x=1790264500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hYwC+8YXd3ZBbv37u4GOv6TST5pjo7r9wcpsmJejTU=;
        b=BpvLP6FazuPjYAUZHV3PnkGhauRfm7FURCqDY09ik/fayFLObMNXDmIz1hK7ohQakK
         4VMrx6YFBrRzE84Pr8DGJRaLY1GpQWr1CzgcyBvddmolUUS26dpWZOFPhy/F2IN+hEzU
         dIk5TaoZfv9i0JSgXPEv8TxAm9B9NzItU7jTQ2Mruh0pM09Y/KWWjmxVqYmr72oMtfXV
         sW2QP6YYfGe9oV+u714BUGm43zLaVyHCAwrO44cvTBQ6NUPPsWVBZc1oahOU2zzHJk9t
         8gW/9ac/41Nwl4kEz67D1mr5OBAq80XaqjtcCxJkLIUNGM5fHJ0AyA594SKOx2KWNm2G
         Tr0A==
X-Forwarded-Encrypted: i=1; AKwUvBzgk3FX9i7JcRC//YvJ4dy3FhoAIZjTbmL5A5orlj8ld+k1LT8hrrPEDHU+EyQOomWIBVdhpZIq1IsAk5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lCjRi6i1YnWMTv8aNJ65iKrxe894VV9No3eZpPeVQYUDZHghuw
	OV9ERnJl0FgHpXazuoaYIYjLrdqXU3NNkcdjOA5Cywmnp7JjfIen3wUK
X-Gm-Gg: AYBFou3CHyz/byL0LTqjXeRI9p2fdQP2EKxxaRmlvsfohix1xWVMe0d4vGBbuK9keq4
	ekrhLy+6IduD1QZjxEr3JhCtc1fGhjXJbvu4SLjxaG0j8N5xhU2m+6y8bX7cRKHHF//gdZc5a0L
	ivyja+GET9V0NpquR6S8IhcfybUKiQUgUOXdJeX/k7nQDsHuRYMjSZxbnvWAJ6QbV4/SQ2NTr6+
	0VRgE704EDBG6G8YFktli2TBxXvZWmSpY/j+diNikVSPbXRHhQCM92QuMEzLio1q1aN0+JOjy5Y
	KJSguV/6dY4WGy5+hcq0XhmAlcSO4TZ557R65/zzaJfVqrkAnyEMliZZGHpUfNjJodyutccPFGI
	PcZE8rC5NwjOvN5kbe8OwlyzS59GRdC5pDKJAYLlgdlM963e8GZZ1V/2JE62Sq3mzqYh7njam55
	HqMCZM1t7Zl98k/hasuQJvVWyHj8ItqnuGeF7S6efk12kOhVtVLKWK6WuH2RVs3/aCVXgjYUt09
	ERMbib6njEFI6mFugGZezcHDRoSs0qQThPxcvzcorriDYGBrjpkMgOsoikYlq6eHtE8t4ndNCb4
	czuDIfTwBXlS0RV14TzAdg==
X-Received: by 2002:a05:600c:6298:b0:49d:16df:8521 with SMTP id 5b1f17b1804b1-49eb73143bcmr86991055e9.4.1789659700261;
        Thu, 17 Sep 2026 08:41:40 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd227141sm100124235e9.2.2026.09.17.08.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:41:39 -0700 (PDT)
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
Subject: [PATCH v2 0/3] arm64: dts: imx8mm-var-dart: update SoM support
Date: Thu, 17 Sep 2026 17:41:27 +0200
Message-ID: <cover.1789659585.git.stefano.r@variscite.com>
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

v1->v2:
 - Add tpm pinctrl
 - Add comment on tpm reset line

Stefano Radaelli (3):
  arm64: dts: imx8mm-var-dart: configure SAI3 synchronous RX mode
  arm64: dts: imx8mm-var-dart: add TPM support
  arm64: dts: imx8mm-var-dart: increase PHY reset deassert delay

 .../boot/dts/freescale/imx8mm-var-dart.dtsi   | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)


base-commit: 46d8fa682d263271f3ef7bf95166b124c19d6c62
-- 
2.47.3

