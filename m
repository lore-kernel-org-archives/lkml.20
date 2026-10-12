Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404A43BFAEA;
	Mon, 12 Oct 2026 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791788789; cv=none; b=BDnqhSMevBtIwgQy0dPoc32o8DIWv+/ZpBuvLnLuDR/1UFqYyLaS8TvLd5aaH0xgBTu10SLGaOlg7xJMxjuKXXf/fQuo2xSK8Rvsv/OPak7antLc1Ynnz30r/Dvcle+HzxKrqcvUHMP1e2Szoed2B1+Oy4+D7JivUegZCOAAcOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791788789; c=relaxed/simple;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s+RhCzxXPqvnvzOIsidZ0/jZITlQ+F9SahP9vY0ybsWJ09N43+K3v+JrYQOmxtl5d1JPJ7ia+092Z71nYa1jxn/TeDzuKaUyDeLIm++LiDK9viBBE0GY5jOGgit1HXGlNomzVrESvm47cEfZd9xX9n3dFEia8x6+4bIHOO6PAyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OShEHpcS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OShEHpcS"
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0B50C2BCC7;
	Mon, 12 Oct 2026 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791788789;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OShEHpcSfOgatEsFpHxARApYwR1HN2T5cHij8j08LA/E8JqTMNVwp1ZepNRqx8Pqe
	 +09YWGEcfRZgXBRl1JSB7oHwxK5YBWlU2tUb0h09o31uek8Yl+G/B8Etad39j3IGuX
	 5PfvHH8npEZUnitnoK2h8RrA7jkCNl4XO0bQbLNKVH4hDHLsy9EtbjAwiSPFpfSR2R
	 CYTISJuj0xABhrRnLigcfGEmkPp9RbeBlW0epEzQnKAGSDeirczLh3sUu7GSi/akiK
	 5EhB4Rj0WZipLq/MXv4/wNSjlKbvyX0WU8bzPqrgOHqueh8ZPC07f+nzzqEGaImPJq
	 dQd4F8sVKnZxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD336CA9ED1;
	Mon, 12 Oct 2026 07:06:28 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 12 Oct 2026 15:06:10 +0800
Subject: [PATCH v11 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-b4-s4-vdec-upstream-v11-1-25939f85ada5@amlogic.com>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791788786; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=MfVA2Hhvbv19+YUUotHRzLshVSLumIPGiBlhV2F8dhshuQVzzlteLfkBo5SRBB92PgWrm8vNi
 /bj0EhwIxDJAOIZ9M/Wg7o0+4XDZapWG7bWTU+K9rkwEpB70WQAm9hT
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW to the secure monitor command enum
to allow decoder drivers to load firmware through the meson_sm
interface.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 include/linux/firmware/meson/meson_sm.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/firmware/meson/meson_sm.h b/include/linux/firmware/meson/meson_sm.h
index 3ebc2bd9a976..3b90b49d0552 100644
--- a/include/linux/firmware/meson/meson_sm.h
+++ b/include/linux/firmware/meson/meson_sm.h
@@ -15,6 +15,7 @@ enum {
 	SM_THERMAL_CALIB_READ,
 	SM_A1_PWRC_SET,
 	SM_A1_PWRC_GET,
+	SM_LOAD_VIDEO_FW,
 };
 
 struct meson_sm_firmware;

-- 
2.42.0


