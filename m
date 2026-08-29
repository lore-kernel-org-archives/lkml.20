Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6704723394D;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788008811; cv=none; b=lXN1EbjmMoC3UEWNbuPa4RLMpcuyKhWyqwDhd+mtuB8kVBgdjHgzHCrJZ+J2s734+TzslhfZ60AY1pAITMilt1ptgUVn5kse1wGL7tVACu4OLNrxeAF84iAOmWJ/EqMAqo4eO5CsZBMtA4E/uwG8yf1Z4H9VnGEY/okDYfVA8Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788008811; c=relaxed/simple;
	bh=pn5KGflifh7k3NcNdmit0vyAmA8cfWgPj83zaSLLpq0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sd5k+k9pw/u6fEkr3qeyifOvzOfmed+PaMLlk5iB9mai+2pJ8a32ZPYkgZlHAARgCsZUtL/SkbhhZwZdut+kyTH82BvpNn55pz5v8A2sEzD2WHuncwXku6S3wDKWYjA6PfDO0yHRHceskbmItcUSAtwNmUxSfDCHRI4iAsR7O9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bn1ORlT8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bn1ORlT8"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08FCBC2BCB9;
	Sat, 29 Aug 2026 13:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788008811;
	bh=pn5KGflifh7k3NcNdmit0vyAmA8cfWgPj83zaSLLpq0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Bn1ORlT8RW+Y4VUZRPf0UYJ60xAikYyAsnW8hBmMgEYpXv35yNQI2UCEOCN/XGeRa
	 8kVyW9XebhiZb7XY6sVJvu74iyVf6vLkPtuhnc24btg9QWfZbxFn9L42olBcXi78ZW
	 1NochKtGa+Ho3epvU7g3axwBS4wqTpz/viwHRtnCwXZQ14s0LGMjfSAqIoC/4sgXnr
	 cokzxyUEKMu2fEYcXILBogyWtEYtczrDibtuky68KhRsjA2ofGQxv1iomQDcG+OjMv
	 +EYCQtE4XZLyARo7T4D9owNd4+nSSZyWQaE9YGZy13wIvsz3DHO7oDYCtcdrurKGql
	 nEVVmkO5l3u2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9766C61DDE;
	Sat, 29 Aug 2026 13:06:50 +0000 (UTC)
From: Muzaffer Kadir via B4 Relay <devnull+muzafferkadir.mainlining.org@kernel.org>
Subject: [PATCH v2 0/2] Add Reset GPIO to imx258
Date: Sat, 29 Aug 2026 16:06:32 +0300
Message-Id: <20260829-imx258-add-reset-gpio-patch-v2-0-bfd27891e225@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6DIBCF4asY1p0GoSp21Xs0LgiMOEkFAsbYG
 O9eatJtl/9bfG9nGRNhZvdqZwlXyhR8CXGpmJm0dwhkSzPBRcuVaIDmTTQKtLWQMOMCLlKAqBc
 zgblJZa1sxt4YVoSYcKTt1J9D6YnyEtL7PFvr7/pz1V93raGGVsq+E1bojvPHrMm/yJN315AcG
 47j+AD0X9lxywAAAA==
X-Change-ID: 20260825-imx258-add-reset-gpio-patch-c438dd35f9cc
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Muzaffer Kadir <muzafferkadir@mainlining.org>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788008809; l=1088;
 i=muzafferkadir@mainlining.org; s=20260816; h=from:subject:message-id;
 bh=pn5KGflifh7k3NcNdmit0vyAmA8cfWgPj83zaSLLpq0=;
 b=Qitmu8ApwZ3hUILh+CiqgQ/xGkk1ZWjMDQw2js1q0jjmynZqg0foEkzw5HLDqW0hpobWdqSzc
 L9vKIvia2Q3ClsEb/OUOD96aLdh7Xxmx3ve+XHXmxj4P3VoMENd+vHT
X-Developer-Key: i=muzafferkadir@mainlining.org; a=ed25519;
 pk=4zkv4suQ3cYcO4Z7CrV8JSSjEGLBGepUtvQCFjgnYIU=
X-Endpoint-Received: by B4 Relay for muzafferkadir@mainlining.org/20260816
 with auth_id=954
X-Original-From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Reply-To: muzafferkadir@mainlining.org

I have a device that is not upstreamed yet (General Mobile Shamrock)
whose camera needs reset gpio to probe, it is documented in
dt-bindings but not implemented for some reason.
With adding it rear camera on the device probes correctly.

Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
---
Changes in v2:
- Moved error handling in power on to gotos as Sakari Ailus requested
- Use fsleep instead of usleep_range as Sakari Ailus requested
- Separated delay after enable and reset gpio patches as Sakari
  Ailus requested
- Link to v1: https://lore.kernel.org/r/20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org

---
Muzaffer Kadir (2):
      media: i2c: imx258: Add wait after enabling
      media: i2c: imx258: Add reset-gpio support

 drivers/media/i2c/imx258.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)
---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260825-imx258-add-reset-gpio-patch-c438dd35f9cc

Best regards,
-- 
Muzaffer Kadir <muzafferkadir@mainlining.org>


