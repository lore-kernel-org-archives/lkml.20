Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CB941D11C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787747275; cv=none; b=dJHae5v+sAjvAtsOygpjWybabRWCoMpSMXRfLEcpCV7I7ui1UNqZH6zbnBI4QbMmIoNE4dsDQtJRWORYO4+wNMGnHrlM/0FypxjSGv9t/eDQ9j6hcLmEYcEnV3tbaOtHC3iDYqQ0zxwQqmjmjdniAxu2K7bkW1i7d5ceiMPM/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787747275; c=relaxed/simple;
	bh=HHpMaLVjnGjFOwMozhkdZ7etIGpCQqPextMgPphQpJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoG5IDioh3Xn53bR8hs5CgJ3U9fSltyRw9wg8a9/EvdAeY0pUqW5+k+bPcniUgNEscTBziQI6VOUVYuEt81dHy/QB20wMPbOHCA7KGmMEJ/rxWnTmMc0HngmlM25ubzlig7MlWFRaRulQNuzMRRBFfcoWg/Chk/0txjBsAO/RaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXPrGKjD; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXPrGKjD"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15e592da74so124177966b.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787747270; x=1788352070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4KfLaf/pGQgfW338gcZcWd4Hv0dWo004/Besidd35wA=;
        b=WXPrGKjDGMj0xbqFhb7S7sR8A1k9PEJf2HAiUGke29yE3fOzDTdqcpILYI/CQRxWdo
         nHF/5xtOJRTF+AzciQdLz9sZVBj6UKvibvSqTJ6nZFUXt+RqQt1BXv70wHVmNhlWrQfI
         VRovtfs02FkyWxpjYcYLi+ZMIdoLDoxzkWEKDs6ltGcWDwSrSe6AmH0fffVB2NKhOlCg
         4IIo2GDJVjNR4IaDCDKJDuZbxTtudR2rZW0IYZbRCItYKEhG68arw3o8QpCxqzjF43zQ
         ihcxrlaH53GzVHMKXvbu4OOCdlnIvpAKyQ87F6naEJktqOWcNrmXWPBfo6EtNCV4QVx6
         HY1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787747270; x=1788352070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4KfLaf/pGQgfW338gcZcWd4Hv0dWo004/Besidd35wA=;
        b=HhIYc5sKrjnDnmQtgsNkWpzrwUla5gFA5CQJ3+OSzZnYfbVqBLIMHlnjdI4J12Xo/H
         6YJqVFx8fGTYwFGkP9ZcVKiNV0k3vOaP6L9FXvfdvWz76Cy6of/FZrEheuRjE8hh6R/W
         sk6AfCyWUZ7plpXmZZgpVfG/mj7ZIQHiGhMyumKAdw+EJIB5mcNskzefSXBNrkIP/AK4
         w37XbmsXVqv1/N3UTc2P0F2mUMql02BVDAUrHgq678bl6DdabMZsGislMFUtwEDmR0o2
         q4J1k4Qo/EB3U40Uxuxxvuy4bGe3lxt29DlvvfT7U/MdvZad2RvumUms1hDotrzdkTHb
         4iow==
X-Forwarded-Encrypted: i=1; AHgh+RrLGeHUCkul66M77bEfpY3jT5ELLLdBPQWN7ohZvzKy7jdlcZ95NUynYCrumXzI7vZQ6G01W5CoAlT26Sc=@vger.kernel.org
X-Gm-Message-State: AFuF++m5sMwKGgVvlDnvd7hPQWAov6c2nJ01mcYwZgEc9K+nfWRjOySV
	WABeznmflU/FFiTJ9fHjAzjlt9azpV1NoEN24D7ehxay4dMcqb5lIvyw
X-Gm-Gg: AR+sD11uDTiBiF3G6JQ8ZgSpTPL2QkNLuaf74kuATjqaHs+eSP7HnD9MIddB98K1ONT
	/p2e3qf0KYavZhm91rqzeYkSVqNCu+Gmu/zxP7lm5isSXCZanf/NsIv0R6D9Mpq3nS+yd9bGWJR
	ajAQbzaZQq1QRqNQQAj0qH9MsfdJRA7wevJvbnh5oerNCEnlMIJgHw+GIUIe0O4ePjZ1jYbjOeU
	ikorImUWIThejf9XAenNfuADIzHtSoX0q+wt3/nZd2UyjG4eNu0XTBNOtMh3DIKhd6pHFGboLML
	IyRCbGr3fMMBhnzsi+5XWPq/yy6MngksqtntcSC7i8E35yDHp8Esr7StJW1uKO+mPZk/vqxXKrp
	6+Ep0TX2q2sqWa6gJ8XELoO4yrgAs68+s6l828SSHmQCPmZ2iy8bgXiEKgAhco/wryobWJ4yCGO
	14BkFq6Pj31WtgQ1Ytk+zs0ukMxQOTI+vRQzs0JkfvD6VArPJ6DhmS0W/pOY4XmYqxbpf2QBgPy
	5SkE2JJxqGsTQ==
X-Received: by 2002:a17:906:7947:b0:c15:f598:60c0 with SMTP id a640c23a62f3a-c250bb7e838mr911315366b.4.1787747270128;
        Wed, 26 Aug 2026 05:27:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:aa64:3da0:a259:ecd5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a9b4e9csm504890266b.54.2026.08.26.05.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 05:27:49 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 4/4] soc: renesas: Kconfig: Select POWER_SEQUENCING_RENESAS_PWRRDY for R9A08G046
Date: Wed, 26 Aug 2026 13:27:26 +0100
Message-ID: <20260826122742.153643-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
References: <20260826122742.153643-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SYSC driver registers a "pwrseq-pwrrdy" auxiliary device to
handle the PWRRDY power sequencing, which requires the
pwrseq-renesas-pwrrdy driver to bind to it. Select
POWER_SEQUENCING_RENESAS_PWRRDY from SYSC_R9A08G046 so it's built
whenever RZ/G3L SYSC support is enabled.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * Collected the tag.
v2->v3:
 * Kconfig selects POWER_SEQUENCING as POWER_SEQUENCING_RENESAS_PWRRDY is
   defined inside an if POWER_SEQUENCING block in
   drivers/power/sequencing/Kconfig
v1->v2:
 * No change.
---
 drivers/soc/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 4929ea350cec..987958d494a5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -495,6 +495,8 @@ config SYSC_R9A08G045
 config SYSC_R9A08G046
 	bool "Renesas System controller support for R9A08G046 (RZ/G3L)" if COMPILE_TEST
 	select SYSC_RZ
+	select POWER_SEQUENCING
+	select POWER_SEQUENCING_RENESAS_PWRRDY
 
 config SYS_R9A09G047
 	bool "Renesas System controller support for R9A09G047 (RZ/G3E)" if COMPILE_TEST
-- 
2.43.0

