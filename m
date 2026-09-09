Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333DE38886B;
	Wed,  9 Sep 2026 08:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788941525; cv=none; b=JHikp4HF6F8mdUFWdFxveOtLwxmy8iQzSogAhtqRvc8lMWFVfXQgEYplHZa1eIbhQeNUKXxZ2mszm0UgtW2z21CR1JF62jUSS06kXmpvlI8CqKx2rSIY8E51QgrfOUGPllQw18+gl3KO4+GzIWxiOiqYbyK8UwXy8Z75k9X0kYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788941525; c=relaxed/simple;
	bh=747bbzzG8Xt18oHwHsXAVERRqGVsEsBiQo+MmrcQJHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AC6sn6tHTLg7JYRZj8o8Wli5l7JddT0rN+PaGd8fvG3e1r6TfKnElH9Ziq9ci6NWxvYdTw4UJSHNkOUa5IsYU+zVxLS+W2gestdm1IHMMheAI0LKv2RtN/5i2DK73uazkGBIEcG2aafMw1ZKpdQlDEu8+1G9XI/wiuW4B2GghDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rBeEo0hE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rBeEo0hE"
Received: by smtp.kernel.org (Postfix) with ESMTPS id D26EEC2BCFB;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788941524;
	bh=747bbzzG8Xt18oHwHsXAVERRqGVsEsBiQo+MmrcQJHo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rBeEo0hEy/fwB918Ma0v2jOtYa0PknWgnxLGx+VweSjd1EFzzwqFmnuA+Bww/SkAE
	 3arsaJvvEkyMUhu47sHYS2GKpTQT+F4DWxhO9V+RzNUuG0cKSFf6S2hEl902vVH4Wd
	 cURa/rQzKCV+0Kq4C1rfSt+4GsZQgyrauEoC2tzcZ5HGqHfVD9MZpb0/4M1sFGtPJW
	 +zLhK0/IVf4vzxjkt1+smY1OgxLA0GlNffiFm7+voh+TArmo7gEzbKekXlDBjQUrDz
	 vkOKk+b0TmA4BkNJoqPu3xi/Q/9x/tdrhU9nocRTRGANhYGEawTntJ8QB7U66Nd0Mb
	 KUnhFF9wvqXlg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8242C79FB9;
	Wed,  9 Sep 2026 08:12:04 +0000 (UTC)
From: Joel Selvaraj via B4 Relay <devnull+foss.joelselvaraj.com@kernel.org>
Date: Wed, 09 Sep 2026 01:12:00 -0700
Subject: [PATCH 2/4] MAINTAINERS: update Joel Selvaraj's email address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-update-email-address-v1-2-94a240f9469e@joelselvaraj.com>
References: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
In-Reply-To: <20260909-update-email-address-v1-0-94a240f9469e@joelselvaraj.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Joel Selvaraj <foss@joelselvaraj.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788941524; l=744;
 i=foss@joelselvaraj.com; s=20260909; h=from:subject:message-id;
 bh=J8deV8p+5atN7V9RAY+ZWNm5S7W0BWIcfSjOFp0qHJM=;
 b=7iAatDXk6owcd/aSlf/Ltlt4ip/Wb/d7+1+ounJYLITYp+4HFka0N6bD7FDYS1kXV2H0mofKZ
 BSCR0yznXJfDAJk0dAQ2EvU/FkSIG0ZAviwkBUoD8C4g6Nu1j10M1jN
X-Developer-Key: i=foss@joelselvaraj.com; a=ed25519;
 pk=UUJ1v4UQJ/nljqj3NjsWt5H4mphWQ7etpQ4Z7JiR2yo=
X-Endpoint-Received: by B4 Relay for foss@joelselvaraj.com/20260909 with
 auth_id=1018
X-Original-From: Joel Selvaraj <foss@joelselvaraj.com>
Reply-To: foss@joelselvaraj.com

From: Joel Selvaraj <foss@joelselvaraj.com>

My jsfamily.in address is no longer active, switch to my current one.

Signed-off-by: Joel Selvaraj <foss@joelselvaraj.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 503b4c4586a41..29b6381d46523 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8124,7 +8124,7 @@ F:	Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
 F:	drivers/gpu/drm/bridge/chipone-icn6211.c
 
 DRM DRIVER FOR EBBG FT8719 PANEL
-M:	Joel Selvaraj <jo@jsfamily.in>
+M:	Joel Selvaraj <foss@joelselvaraj.com>
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml

-- 
2.55.0


