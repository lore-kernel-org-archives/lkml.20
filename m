Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CFD36196E
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 20:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787949169; cv=none; b=JrPCSxNYKY2Oxos7o9YC4IzCwiv7pvWp+JSLu/1T22FywdJ4jIeFb3/9sWF6yAZjdDVyMcOmaTQMDxn7LrvygMpuv6wEyV+1NmfzS5AuCBndk60ICOwnXxjIETU+4Wx3+7vBha1sCIGA73XD141ihhy7RmZj7SPxLPTg/vmILO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787949169; c=relaxed/simple;
	bh=iKVsyQV7tKPfaDuQ+PL5CFcPAPfielgcRiVqwmMClxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DZMDbKEopk1BJpNReJvpdYH8G+TIBAbXl6ztqOKPSvcQs8Ky7Mr/Vd08wm7EObsy9BH6QSV1ANjP/nNzF+3qH3RbtLmBXFrJ2pwDgr1Q67bZ8AynpVC8jL4cIrogVLJOpte4a/wgytRb01Uib9ZBMBRZNIs7iicBVkEvuwHPJQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=wNZYTpKR; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="wNZYTpKR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=m8ZwWJclDPSOBvdgEydgxUAmIzPLtZQQkdqYB7g8o8E=; t=1787949168; x=1789158768; 
	b=wNZYTpKRQHPM2+Mkxp7xaablncDIepciy/L43GX24C/IYHEu1f2csLfse3zCa6LqklmL0QadQM+
	usmX6LCjnIQk133zGIBWoytEtMieccUop2EyHeqy7C4d/XcwNHZbhUaAHDnEqK8zxZRYOcAr3dfAG
	dt1nLm2M6nUnSFdxHB8Mh37PSJzbsKvdDy2i0Lr0AEjK+IR3O1C2OVYkqdWbcLHv0zZYaIfgFNTiG
	A4fOrXG01JDNvF7gS8860nAjVi2CV5d+G1yra4CJ/hZLV91LI4/1U1GDZF8RPkvZGcVVqe6p1XGw/
	Z1sJu4/fkpHVPbkEZVSOUG6V1UwTmnulQ+2Q==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM ZSTD boot compression
Date: Fri, 28 Aug 2026 22:32:18 +0200
Message-Id: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFLwkWoC/yXMQQ5AMBCF4avIrDVpJiXlKmJBDcYC6SCicXfF8
 kv+9wIIeSaBMgng6WDhZY7ANAE3NvNAirtoQI25tmjVJVuHSpvMUYGmz9FAbFdPPZ/fT1X/lr2
 dyG3vGO77AYv5Ha1pAAAA
X-Change-ID: 20260828-zstd2-045ce924f624
To: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, j.neuschaefer@gmx.net, 
 f.fainelli@gmail.com, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=iKVsyQV7tKPfaDuQ+PL5CFcPAPfielgcRiVqwmMClxg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6Q2PemRDZJJeGN1y0GKqep8+iG+j1cPbd3/noGtc
 VqihXxARykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABP58ZqR4XtCj7kak8w5f94b
 PR8zV2X+lxO8MX29zaeLsU90N/Wb5TP8TzEv/vvmSOMZ0V0c4jYXLstcCJ31iyV0+k5ZZ4dSQ7V
 6VgA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324

Add ZSTD compression to still have a quite high compression but with
not too much boot delay penality. 

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- rebased
- practically rewritten 3/3 (and therefore changed author)
- added more measurements
- Link to v1: https://lore.kernel.org/lkml/ZDoDYh01GYjdwp63@probook/

To: Russell King <linux@armlinux.org.uk>
To: Nick Terrell <terrelln@fb.com>
To: David Sterba <dsterba@suse.com>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: j.neuschaefer@gmx.net
Cc: f.fainelli@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Andreas Kemnade (1):
      ARM: compressed: Enable ZSTD compression

Jonathan Neuschäfer (2):
      ARM: compressed: Pass the actual output length to the decompressor
      ARM: compressed: Bump MALLOC_SIZE to 128 KiB

 arch/arm/Kconfig                      |  1 +
 arch/arm/boot/compressed/Makefile     |  3 ++-
 arch/arm/boot/compressed/decompress.c | 15 ++++++++++++---
 arch/arm/boot/compressed/head.S       |  4 ++--
 arch/arm/boot/compressed/misc.c       | 10 +++++++++-
 arch/arm/boot/compressed/misc.h       |  3 ++-
 6 files changed, 28 insertions(+), 8 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260828-zstd2-045ce924f624

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>

