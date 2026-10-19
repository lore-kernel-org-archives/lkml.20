Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B14FD78B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419468; cv=none; b=sBGa0ejDoV3s2oeJnkXrcUaN/hVXfIY8CNg44YXULC6ZkC38ND4Dic/tj6ufbdeJ34HkC4EesG0d4sW/FUF91WZldevPrR9SFES0hKHY6FikUTlV8G3oAUEXW7bNA+FgskRBHlP7/qnR0T99VLekQ4Ts5uD1c64w6AZPmIlWRrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419468; c=relaxed/simple;
	bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a8Lgy1wZA9fuggwTjYmcyTtf2wsuRCWo0c5L1ij8UZdaIZkqs4YOC91tMwcIF/6J+6QIxDU1V/1YJa2wryerlFhQr51FcJZ3Cu4Hd0sg+JWB6d5Yvk53WB+tM66Yq1aQ/K28Gr6PGUn+i1X72Y+nkCefhxqeuBL+fSTpue9bMvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/VnZ6TQ; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/VnZ6TQ"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2dd76b1361dso11027985ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419467; x=1793024267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=K/VnZ6TQhGV1S/Cr3yChf3UqaHTZH79/pnidNGz5C+Y+OL17/CDMALm708UH9kahtm
         qCJcPdOvJt9PzLTP2xjcqZShKQps6cS+lZPMczxIzwQhMQwWAFw4gIbifiEy6Z+y+mjX
         tRsuwjzy1Wa2cyQDAe4Drx6jOcJIuLLbQjYAlCLcEfFxYjWRrju9gDFb9LmzvoFUd8jR
         KmIr7yg92rZ7hXwGl9UzcHeKb111C3ps844unsueJ4r0GY/BDhp4UkY1NqMXFe5Cu6aA
         kIL7snopLCuopIctLLOiZGcL/MEEKebPXp7aR0k2KK/GcqI+MzOJCqKsUdI9MAV9CtqK
         FkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419467; x=1793024267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a9xujErffccRWJmb2kmaLMfqp7WKEG50k3ZOPDrgYt4=;
        b=YHFvh1pYrjAIHKWlLry3v9dhN9WBBBkZxW7TOGTDqsI/yv01zeKo5ErvQDzpGxcfoY
         EoINC49PdFjfNDdpTBiD6VgFG7xUM0bWsVCRR2ZfNTjpLdPE/PwAK1Z1mRSGsfeUIQGZ
         1F1mBvabS9otZJ7LIF5JBo6kygQKA1vy8vuaPeKxp4CItkj0fFHFOaD7eoeeG21HSGSX
         ngwyVRnfVYsVPtetX8yY1EhWGC7DSuL5CRXCkC1yye2YZobVQMM6+CP+d2u63gVkZTiY
         HNN57mQOo0nZZ8v9bWORlAcId7+Ak5AMEfwmAdRK9+a/LA133Qc6D9it4TPbFVGEtjYn
         F49A==
X-Forwarded-Encrypted: i=1; AKwUvBxKQBFkXWIEresAT5eNAal8qvWQ7e1vzOmO8Pd4apE9j8PR2fRPcFZiF9ZQjMKgECEjd3PTdbjYJUstOfI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJg//OUGxWNeO/NSuEnuYSloQalsxPkVLMaJ6VOey+TpyheZUQw
	FZKg9GePiFPzydpPNaDyR9Ma5zm3V5H3yl5cn3jJIUI2c3NLs++5IVWYR7ZJo5NmH5A=
X-Gm-Gg: AYBFou1ffgjULJCm/ZSB+Pz9aTrEbXgiDKEuvkbnyyLJQBv6zdQf6GY9k7TMprlKN+8
	fpQDUMXANKY59XMDWzx3iSXykeavwBbr5H8ru3Nz/UQzfod3MJNy7FnHSd2K7nqtyOBE1cs964E
	SV0m016fSwgRWQc/qaf54+3FlgvbvXMrAnE/WmZf9I3qF8ep2MVJ9P0lCEsBR4RdP+8wOyLOWu+
	4qH6bbkirh7IN4MnIF1KJJ3LNIw11wZ7ZwewZjlYUSh1O3OQuSEaiTIH+0R5pLne8VI0BdhM0+g
	vAi/4/tI6b1cDakkUYzKGjhIRiK5giUF2i7OueA4dRxpzDJytB+7nQ35Z277qve4qOupWHhUtz3
	aoqLc/AWgypkmaH7wAj/UbNRCK6zSwYkOV9TKNL/2XQiKoN5SuctRT8gPp/4z40w32PYRfg9vcB
	j6rrXjy6vGs6V9Jwv5qhiRRlBRToylskKog5biMzINcBa8ecd7s0beYlIHpt+b25Z7/gIFviu3/
	43Qyc6JPbtM6NlDnN/EiOHww8T6wIdq4r9ZCcjZEDEyRllPHaq2LHQcanmVWNDPRcT43SDXU0tU
	iieRseF+zig/Y887ZpGTcZCrhjC/3CIXQOjHIe5V4H67CmbhGEo4yw==
X-Received: by 2002:a17:902:e943:b0:2e9:79db:449c with SMTP id d9443c01a7336-2e9a6f55653mr62822605ad.47.1792419466462;
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea1501f933sm1697925ad.50.2026.10.19.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:17:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: E Shattow <e@freeshell.de>
Cc: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
Date: Mon, 19 Oct 2026 22:17:38 +0800
Message-ID: <20261019141740.2077086-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
References: <20261017180141.3477743-2-alan.tseng.cs@gmail.com> <05e0c9e4-4e27-4114-866a-ec55c33ba349@freeshell.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi E,

E Shattow wrote:
> Drop this last paragraph/sentence or place after scissors line, not for
> the commit message itself.

Thanks, I will drop it in v3.

> Presumably the BootROM does configure all of the above?

Mostly. The boot straps select SD, eMMC, SPI NOR or NAND, and the
BootROM loads the SPL from there, so the SPL needs the same
controllers and the clock and reset controllers behind them. The
BootROM also prints to the console UART.

i2c8 is different. The BootROM does not touch the PMIC, but the SPL
has to set the PMIC regulators over i2c8 before it can bring up DRAM.
I will give that as the reason in v3 instead of the U-Boot sentence.

The BootROM can also load the SPL over USB fastboot. I left USB out
of this series and can add it in a follow-up.

Thanks for the review.

Hung-Chun
