Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794509154;
	b=RUlUMr/y+ViG+sU7TbK0VBjFFoMFKwtc4B/jakSR9ObecpO4WJ+35A9RTvGhW7QD4KUC
	 p4Lc3yUqzx5EdvPnicJ5wmA2HPeaBbzosN4o4QymgISIusuXl+Lygb0ZLOrbUpu14Szcd
	 AjVBWn3o/UX4kE2cli7DmFiRA1joM4FLZhDajPtrwU7UXsoaRmJoGyurURB8Q3taI+cv/
	 f9rqqElPnXK0aR0lms4lAhDjYxtA6AbBVQxYF6+0VA2GEzhstl+F0uq7hynzh3p2ry9ZK
	 yrk1EB6VQCPQ6rU42r/+gUmPz/eksJK8u3xCunFsaRRlvZbakBvi/7EaXwtEeDd51sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794509154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
	b=XqXlW6g94kRd0BlMnlY0N6sCtkNgDwQ6f5RmqQZIHsK0gRwUu0P260jhv7EsLj+4Zgq4
	 C6BDLVhVsKv8mCMqK+GaWLthQT2/Pbv2BdyVlbEvTnxFAk1or30JefGAhkFVxZ6rOPukv
	 uRaY7bg1DudCqlw04G+eEkgH/o4VkzBJa9iU6NORnvQEkgQCdXhNmVeBPRaotTMCsikBZ
	 nxG15UOjSTwYqSRhAuDlaY4ms/ka6pvEJFccXZE7dRRCjRe7LKqRByzCy2VY0Xe8dvQvu
	 Fqixraet3JKhGvJsyrPk+ER16/WPuFmcHiKOoVQd1K9FPDkjKatFugk1gh5t1F99HHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kB+t9uox;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6140D606A8AC
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 18:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6140D606A8AC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kB+t9uox
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-37628596783so315646eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794509153; x=1795113953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=kB+t9uox/Lo365p9L1SC/s5gJVbFEwu1GOKo+8BeQH3MU67XG02PxoSWJvsD36Uo1D
         Cb2OmVFqzBRiWx2v7LV2cfIWeTG/rK7SyU0BN4V/Ky9G7Vsr0D1Dqccbe1/QAWY/8jQp
         MjxDAlUDqwlADUco0XWOm+FEHQRfhV8PSs/EVFkGd49PIvAvZtQeFT5qRwDnGKvhx0sY
         K9p3ju7oJw1iIgtwVia6zlTmpiVB9EwnDisbcZc+AZMUy9EIQjH6/+ueTxbXvpevQ/xo
         k5CZ5otpSHojdbA4519AopS8nZ3RyfisMpZKKXi7mqUsWmhuquCIHF3hQE1paxUN4jAR
         BS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794509153; x=1795113953;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A5kGUYlL1s6wl8StQOQ7ah5ktYL6JARyi0H/D6FL9bs=;
        b=CWGSYqlyrI8gXDjP9cKmUEj0Gyh8t80WjeHPtqCQhIyq4Dll3O+PksZZrWz/1T5ArE
         lPcadUe9F+cm6AYPbXDnOwb2gKZehx9HcRMUVnTmS+p0beqYkhWwRoozAKxOCFRRzUaC
         0AkSvYECCymB8VcxAZaihchpjsyTZ+oFaX1BZJ1Oom33YYMxoNnkQkXYagnOz1PgRyx4
         sKJlEq14UmFgfGje+h6F9eumHR82tJ3SdEf6fONoQ+UavSucyU2a4U+yEoY4CtDOaKFT
         FFUvM522Y9PUiXSFOxHxV9/8uOOlyz4meKF/8g1HpdL8yP03Y2M3KjGSaXgi/kWk9Izc
         sKpw==
X-Forwarded-Encrypted: i=1; AL+hErExyvZL9uWMbPkhrnw61iROqzV6CTc4AYienOy2knRdpTN3hhz0FOD/RTP9CZTGQmmyfjY+KwQcE+Mxiug=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JtreBGHSHLv5FVVM8QDnR5b0q27YzSmq1/GB7V8AXxmqHTX9S
	1jpx0FoUPKUt4cHv7oUKhqnzZvJu1s8BXGc2Yx1U9oC31x/cSPoWC+UP
X-Gm-Gg: AYBFou0jE1B8NymF42UcRyCsqHrqSyPlHKAyN7JU8dGcCJI9gGaqgyRX5Y/5SDPu9mc
	R7sa4KBq/BqLCQf60tlR49OWLufwLzyxMXOXamsclPO4aivmEbetnY2jVfvyYiA+nQjdLiOER4L
	wtk9sGfXo/34TOH8fVgtJyNHzW+7Y2gMmThBGd/EnLPr8cuquIvdom91KH1k7OVIQ90qZKLkuFj
	7HgiToIUxF+Pb5x91ZnwzFBUuU22w9XaxQq+/1bEiy+cRZYlHk5pWupuesDTKtUN9Tv9SgaOHhf
	oga59hxVuDw+QDVkW14Az65o66pG0VjJ1miaIVh/oayQcjlrKCHCStrxnET8R1va4Izvc0Ie49R
	g2xMrEmd4CnEe5QCDwcvn9NyGdhGg2aypEizdtyA6wW20v7Iuf9IKcXdDQooKgfvCmF9LEgdYPE
	wDrBE+6kiMOIhsPNfJ6GLmF7MIYPvKDMFG70nmpeYNoK7+xFI3asQwI7nyDDsZrQUWeAO/HJWnw
	wSJg16eRNqMGG1owYRAMIAhrMqJwX3MFFh4hipINTJShnTookoJjWBqs7sdC+psThF7XBkisFIy
	7s/JDM206q1Wzvu6a6jWBtaPnN2MrA==
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr40367eec.8.1794509153074;
        Thu, 12 Nov 2026 10:45:53 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm369524eec.27.2026.11.12.10.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 10:45:51 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0=20=28Zhou=20Yanjie=29?= <zhouyanjie@wanyeetech.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Burton <paulburton@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	hns@goldelico.com,
	paul@boddie.org.uk
Subject: [PATCH v4 3/3] MIPS: CI20: Enable SMP with two CPUs
Date: Thu, 12 Nov 2026 10:44:41 -0800
Message-ID: <20261112184441.3724150-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112184441.3724150-1-f.fainelli@gmail.com>
References: <20261112184441.3724150-1-f.fainelli@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>

Enable both JZ4780 cores now that the generic Ingenic platform provides
secondary CPU reset and mailbox support. The existing device tree
already reserves TCU channels for both per-CPU clock events.

Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/configs/ci20_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
index 90536cab417e..09d65094b1bd 100644
--- a/arch/mips/configs/ci20_defconfig
+++ b/arch/mips/configs/ci20_defconfig
@@ -22,6 +22,8 @@ CONFIG_EXPERT=y
 CONFIG_MACH_INGENIC_SOC=y
 CONFIG_JZ4780_CI20=y
 CONFIG_HIGHMEM=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=2
 CONFIG_HZ_100=y
 # CONFIG_SUSPEND is not set
 # CONFIG_SECCOMP is not set
-- 
2.53.0

