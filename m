Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36163D8908;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788165135; cv=none; b=awDdwFwbtyYkIOmvl1na/vkPgvCkkWb6AEj+fBD2WAvB7jKlXXVzTQqkIsrO8TZGB2aXb5G6a4C0BWkufK1H/1jCCWNeui4CwqjlMQ0KsSCFRvmXREYKDVeErA3zRIPDIP1c6wjnzzJr5yOtUcPNmyFfBSK/O3v72rdkjCc+398=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788165135; c=relaxed/simple;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XnNlFhkN+UwkYlFlE1AY4lz7AIPg5X/h46JuZAKt3JxT1synprMi8g88ODJidNEaaS3LGiDQScl/leozPZAsDniXoh+ye0jC+LzI8K3+tz34hkyq6Oz1pRIF1ifLwfD5ExPSjJL60v7PkF6r0nfDkvcFowpGsis2eSjJ8viPcMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WXmCxUw5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WXmCxUw5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10DAAC2BCB8;
	Mon, 31 Aug 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788165135;
	bh=PynJ5xo9Sdp/Ik69/y60OZIBerQ/6DJ4h2lEOta72bc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WXmCxUw5ykfZUxUD/OWDuO5krPooPricRx8DbRUKrK6DxTKzYxbCFK6PI4p9yLP3n
	 YHNo3Eg2W2HD+dndWyQAgSHrd/z16Opt4PFf+KyGycXcj8BGefn4HhGewiv5jZU3Bd
	 x4tNg9ZFsEdDG/yvosSUGLUBbbCa5IAL91cXxlORNOtWJzEsKP8fyYddF3ouqolo30
	 Pk4tY6aORLj51g6QpUyKMN9qHFqXk77jxXlilepF/2x9s2oPLlXVY/4kAXqYCOZ5uO
	 m5mz8IjyN8GK7af+DAsTrHDwzvPGsHsblr9dzjo8ZGM801aLvwWDxCiUxlssUekCDD
	 sKEEqPkIhBYGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D69C61DD3;
	Mon, 31 Aug 2026 08:32:14 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Mon, 31 Aug 2026 16:32:02 +0800
Subject: [PATCH v8 1/6] firmware: meson: sm: video firmware loading via
 secure monitor
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-b4-s4-vdec-upstream-v8-1-830195b9bd91@amlogic.com>
References: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
In-Reply-To: <20260831-b4-s4-vdec-upstream-v8-0-830195b9bd91@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788165132; l=670;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=ioNPQiZsvUfM7WHdEfF4xb07l7H3o3hVIdC2XZUtO1g=;
 b=6Z+ZCQ7Py7qGzILOAelA5yhL91QqXe5khWCbyXBeY5XszS/uRnxMfjMkbdQrYZohp9sdze/yo
 hXXl1ZfQ1V1CuT92qpHnTGAsvK/T+T3Lb+wuH5lgUjdL0ArKf8sN5dp
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


