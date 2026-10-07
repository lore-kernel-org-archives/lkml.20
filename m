Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31A1490BF0;
	Wed,  7 Oct 2026 10:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369113; cv=none; b=u/68iC14NrliJ0IuJ/dGnvVOxjZ4lVhVcLZEIRpYeDPGlowFXnXS0NTiwLiCKeeQA1iPk9GpO8A00a5cUmSlRM6cADJUWGsYZ88dVi5JVZUeBwM0nVCuxhNBZHk8bi9faqc24lyw/1R5Ex/N+MUDdcqY3+xvXHoOciRKQuorQUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369113; c=relaxed/simple;
	bh=smebOwSVwlwQJeWZ+3B+c1LhBAaLuyJWFeH0+agWoSw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b116laoi7Nm/XKnxaVtH3m6NsV8eKjJ1nD47KXAu+/WZzfwjPv2zgiUjf6euukhax9ltVR9nXWg2qyFKc2dyjjkaEIcY82EQ6WO62aznNBOvtUuDnkq0aMb5pS9guLh5xNokyAebND2Y+HIy9UGIXAXW0ajA3CVZyvg1c7W8hTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TVMG1v21; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TVMG1v21"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 40A6AC2BCB9;
	Wed,  7 Oct 2026 10:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791369113;
	bh=smebOwSVwlwQJeWZ+3B+c1LhBAaLuyJWFeH0+agWoSw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TVMG1v21mxJmOqe/UAdgVdedSv9wdP2yo0gQl9HyxVqBv/IaEmozV1ICOeKujzkH/
	 ZRmUf4dpbGRYLK1Aj1iwbuLJpk3aJfzW+fCfqpUfVssVeZiflRNX1BKmC1e/j1U+I3
	 ur3agIC5PUNmGF4wmEx+1vasaKjzAIpgNm8nQIMYvIS9rCpjFiGqxTIm9g9mbPs8tW
	 9iEVqHH/5ZQos+xzT21T7ivFdedaE/YSxTKR5dSERx9VjFf97pmfDNX+HcjAx56l2S
	 SmejPaDULjtxTy1JdvZoO9EfV6Yb2BkIaCFF0TQRdv/7MefxAp1NyGfcSBFzV54SWU
	 YOXN66feXDLRA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F5DCCA5FFC;
	Wed,  7 Oct 2026 10:31:53 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Subject: [PATCH v2 0/2] media: i2c: it6625: fix MCU reset and host control
 timing
Date: Wed, 07 Oct 2026 18:31:51 +0800
Message-Id: <20261007-upstream-it6625-reset-delay-v2-0-c5d6b2522bbe@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJcfxmoC/43NSw6CMBSF4a2QO/aSPqAER+zDMMBykZvII21FC
 enerazA4XcG/znAk2PycM0OcLSx52VOUJcM7NjND0Luk0EJZaQQBl+rD466CTkYo0p05ClgT89
 uR610XYrKloOoIRVWRwN/zvqtTR7Zh8Xt59kmf+t/3U2iRCrsXduqINPrhgPldpny8IY2xvgFg
 1C0QscAAAA=
X-Change-ID: 20261006-upstream-it6625-reset-delay-3239507c5f09
To: Hermes Wu <Hermes.Wu@ite.com.tw>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791369112; l=1138;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=smebOwSVwlwQJeWZ+3B+c1LhBAaLuyJWFeH0+agWoSw=;
 b=n/mu7BNSuJnUteje4iiaMWwDjQpDsaUmpLted5+3I4AP1tNltLaPJx0rSaZtcxHdS2byzSbRO
 +gd9N/IrSVmDTQfCqVydxcHsDIthmczBZBna6SZfsEigpfAnX64ebr5
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
Reply-To: Hermes.wu@ite.com.tw

The IT6625/IT6626 are driven through an on-chip MCU. The driver does not
give the MCU enough time in two places: after releasing reset in probe,
and when waiting for the MCU to acknowledge a host control request.
Both can cause spurious failures.

Patch 1 waits 1s after reset release before the chip-ID read.
Patch 2 raises the host control request timeout from 25 ms to 250 ms.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
Changes in v2:
- Patch 1: increase the post-reset wait from 700 ms to 1s.
- Patch 2: new, raise the host control request timeout to 250 ms.
- Link to v1: https://lore.kernel.org/r/20261006-upstream-it6625-reset-delay-v1-1-e4cb3c74e6d3@ite.com.tw

---
Hermes Wu (2):
      media: i2c: it6625: wait 1s after reset release
      media: i2c: it6625: allow 250 ms for host control requests to complete

 drivers/media/i2c/it6625.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)
---
base-commit: 89a3d2a2237e017cdbefcb036db71ce74e67faf5
change-id: 20261006-upstream-it6625-reset-delay-3239507c5f09

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


