Received: from mta1.migadu.com (out-208.mta1.migadu.com [95.215.58.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C34296BB8
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 03:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791258382; cv=none; b=JEJA13fOdoYL7c3/k0dXudD7sdjH0Gr8ik15rZRzKYVcQaAnm5+IZHsIy0AwCjk0F3BD6y3amfITTlhW3iSHLLcZOU1CHOudqWHpUNxl5/Mv3wrq8N9BI0hv/S+sL656GhqY69F3UNno2iKKcQovlNa/ajYwjW8J27IRj9Zn0mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791258382; c=relaxed/simple;
	bh=dJXA/6tV0b2I4Avb+qNgYbSJeMN+DeMn7NG028Us1Rs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TtbzvvmB9+AOxQVkikXB16cPUQ9YLQxx+2X+JO4NEIt95dSWvBFFa43o/XQx8nh6bIrVbU/gFOzBEb3asDeetxbAGQlj9b3AP4Enn8LOFBr7Gi0OlCUpqKjo8cIr/pcByFK4p5iRfiKD3nL41h46GsW/7pDnhJW68r0gWYLQhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=hHOmz0+2; arc=none smtp.client-ip=95.215.58.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="hHOmz0+2"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dJXA/6tV0b2I4Avb+qNgYbSJeMN+DeMn7NG028Us1Rs=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791258377; v=1; x=1791863177;
 b=hHOmz0+2FJYyzENB+XVUbQ6sfC/abpfSqRZAidUgnmzFgFNYbwyNY/IHdMotJ8ToiH5j09+k
 gXbHo4WC8MT0ASLwetNaLJXuPE5Kx64Y+Y6NvhepvfWmr5s+T9vqY/IFXOhd3coJHywwNbYQwpb
 aIm9/YqiaITu3sM0sHRftDePMovMcROsZx4T9K/E3tVIZPS8LgD2Y26W0B5NjTz8NneNbgHcHnD
 GAoAx7t7lRLHlJnAZh9THCXcLYu5clg8YfCd9C9eh6dj/c6vkf+SrOvAgVlTdM8Uk5mDcw+qeLO
 V11AGkIuF+9DPvuz4B/Jx+9WLHKgkFf13hyRXz3u+8doQ==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cbfac3dcf9219809;
	Tue, 06 Oct 2026 03:46:17 +0000
X-Mizu-Trace-ID: cbfac3dcf9219809
X-Migadu-Flow: FLOW_OUT
From: Paul Sajna <sajattack@postmarketos.org>
Subject: [PATCH v2 0/7] leds: aw2013: Add AW2027 support
Date: Mon, 05 Oct 2026 20:46:01 -0700
Message-Id: <20261005-aw2013-aw20xx-rename-v2-0-108ecbdf2775@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQqDMBBFryKzbspkpEq66j2KixBHDcVEJmJTx
 Ls39QJdfd6H//4OicVzgnu1g/Dmk4+hAF0qcJMNIyvfFwZCatBgq+ybUNdn5KyEg51Z9QPVtbs
 Z0q6BMl2EB59P7bMrPPm0RvmcL5v+tX+Em1aonLFtP2iyLerHEtM6W3nxGtM1ygjdcRxfHVIzz
 78AAAA=
X-Change-ID: 20260907-aw2013-aw20xx-rename-df233c5921c6
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>, 
 Alexey Min <alexeymin@minlexx.ru>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Paul Sajna <sajattack@postmarketos.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791258374; l=1703;
 i=sajattack@postmarketos.org; s=20250422; h=from:subject:message-id;
 bh=dJXA/6tV0b2I4Avb+qNgYbSJeMN+DeMn7NG028Us1Rs=;
 b=S94v4SivH2dR32huQGT3SuaRxQrHWg0Ive4v4hvnG1sy0zvXcZkv3E3MPizP6FFWdK3FfYBNV
 1ePjw8nmStHAlouXHO5rsLB6PvUxTaGTyM7B6pQdg5hgiol1Mdy4IKz
X-Developer-Key: i=sajattack@postmarketos.org; a=ed25519;
 pk=TwacvEOiRJ2P2oAdEqIDrtQTL18QS4FfcHfP/zNsxkQ=

Refer to PATCH 3 for a full description of the similarities and
differences between AW2013 and AW2027.

Several pre-existing bugs were also caught by Sashiko Review
and fixed in this patch-series. The joys of LLM-inflicted bikeshedding.

This PATCH resulted out of discussions pertaining to
sdm660-mainline/linux, a close-to-mainline fork for Qualcomm Snapdragon 660
devices, specifically for the BlackBerry KEY2 Keyboard Backlight,
in the following GitHub PR: https://github.com/sdm660-mainline/linux/pull/218

Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
---
Changes in v2:
- Reduce renames to internal driver scope, to prevent breaking compat
- Address Sashiko Review Comments
- Split renames into a separate commit to make the actual changes easier
to identify
- Change from RFC to PATCH
- Link to v1: https://lore.kernel.org/r/20260907-aw2013-aw20xx-rename-v1-0-c9a7df12a701@postmarketos.org

---
Paul Sajna (7):
      dt-bindings: leds: aw2013: Add awinic,aw2027 compatible
      leds: aw2013: Rename internal APIs from aw2013 to aw20xx
      leds: aw2013: Add AW2027 support
      leds: aw2013: use dev_err_probe
      leds: aw2013: Move assignment of chip->num_leds
      leds: aw2013: Prevent writes to unpowered chip
      leds: aw2013: move reset from probe_dt to chip_init

 .../devicetree/bindings/leds/leds-aw2013.yaml      |   6 +-
 drivers/leds/leds-aw2013.c                         | 351 +++++++++++++--------
 2 files changed, 229 insertions(+), 128 deletions(-)
---
base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
change-id: 20260907-aw2013-aw20xx-rename-df233c5921c6

Best regards,
-- 
Paul Sajna <sajattack@postmarketos.org>

