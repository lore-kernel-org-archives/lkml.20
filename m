Received: from mail.savoirfairelinux.com (mail.savoirfairelinux.com [208.88.110.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82547547054;
	Wed,  7 Oct 2026 20:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=208.88.110.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791404354; cv=none; b=XwBW3e/m9O5y+YI6zpGSTCqQtxgF5V/XfWcXKNEI+uWanUTGuinSRKXE52FJBre3+/dEsmAjbtyZd9lLtjddgU0JKKi0vIPvvZdUCP7gSo/c2bVA8gvg7OidGZxkoWHUceoy16W4wAzlfXY1pqUA4m3IGt3DSEXnpEU1YHCSYBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791404354; c=relaxed/simple;
	bh=O/xdmeMqfGxhVZZK8NJYUlSNjvBtezDyTo/+OGAVQfw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i07cL2Vc/HrYlqmZuvFMY3J0/cmXy2ylYj7O3IZmKtbRDp8RmLJUT8W5Gbjvi1mKutSf3qy2x6GDrY0SgSYxmXs7LCpnD5yjBMkrOJ3/wBYZzklftO5JTer+bw+DxdD3gY6kCLeCmQjRZsQc7b1PRXvFJiePQZUOZKL0uRCM0Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com; spf=none smtp.mailfrom=mail.savoirfairelinux.com; dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b=e/aJHkPZ; arc=none smtp.client-ip=208.88.110.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mail.savoirfairelinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=savoirfairelinux.com header.i=@savoirfairelinux.com header.b="e/aJHkPZ"
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id 318FC3D81851;
	Wed,  7 Oct 2026 16:19:05 -0400 (EDT)
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10032)
 with ESMTP id oEEistIXMrW8; Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.savoirfairelinux.com (Postfix) with ESMTP id B45473D8187E;
	Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.savoirfairelinux.com B45473D8187E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=savoirfairelinux.com; s=DFC430D2-D198-11EC-948E-34200CB392D2;
	t=1791404343; bh=smx0DskrKC46rYvmhES7EUHN2vwiKNJHN3tiZFLC92A=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=e/aJHkPZ4PF9yV0VaFrpGeGLOVUpOuNkIcUg05oQsp80cocAY2zRQ10RLDy8/IVJq
	 wJ5uGJkX9GAyUkpaG6SY5bbD4pddYchHACbPwmF0fq6U8MF8O1Yx2n7tMFhReJysgX
	 j9hQKyKIsmH35L9ph6gdHRm/R9ZRUFc/Zr0mCDo4fx53J5v+hIVfpH5jyh+4ERFhNM
	 XOi371VZr+YqiyKDWqbWtat1I9k8P8jOtQsUFVJbxpA95c13Ez2tyfXFdiDgWAfR+O
	 qg9OI/HlPK7Xx1rcpI0qfuvRaLhMypYYeT13D9sHiAgu1cLl2I42sitf4Wylr0lhEe
	 9H0h2op55MOnA==
X-Virus-Scanned: amavis at mail.savoirfairelinux.com
Received: from mail.savoirfairelinux.com ([127.0.0.1])
 by localhost (mail.savoirfairelinux.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id kx2w-qYr-YC6; Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
Received: from localhost (unknown [192.168.51.254])
	by mail.savoirfairelinux.com (Postfix) with ESMTPSA id 502453D8182D;
	Wed,  7 Oct 2026 16:19:03 -0400 (EDT)
From: Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	=?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Ondrej Jirman <megi@xff.cz>,
	Purism Kernel Team <kernel@puri.sm>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marc-Olivier Champagne <marc-olivier.champagne@savoirfairelinux.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jerome Oufella <jerome.oufella@savoirfairelinux.com>,
	Felix Boucher <felix.boucher@savoirfairelinux.com>,
	Quentin Lehoux <quentin.lehoux@savoirfairelinux.com>
Subject: [PATCH 3/4] dt-bindings: display: panel: add compatible for DCLTek 300248 10.25in panel
Date: Wed,  7 Oct 2026 16:18:58 -0400
Message-Id: <20261007201859.3709656-4-marc-olivier.champagne@savoirfairelinux.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
References: <20261007201859.3709656-1-marc-olivier.champagne@savoirfairelinux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

The DCLTek dt300248 is a panel using the Sitronix ST7703 controller.
Add a new compatible for it.

Suggested-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
Signed-off-by: Marc-Olivier Champagne <marc-olivier.champagne@savoirfaire=
linux.com>
---
 .../devicetree/bindings/display/panel/rocktech,jh057n00900.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/rocktech,jh0=
57n00900.yaml b/Documentation/devicetree/bindings/display/panel/rocktech,=
jh057n00900.yaml
index 91e06d6a6819..b05f3e8cfcd4 100644
--- a/Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.yaml
+++ b/Documentation/devicetree/bindings/display/panel/rocktech,jh057n0090=
0.yaml
@@ -24,6 +24,8 @@ properties:
       - anbernic,rg353v-panel-v2
       # AYANEO Pocket DS lower 5.0" 1024x768 IPS LCD panel
       - ayaneo,pocket-ds-lower-panel
+      # DCLTek DT300248 10.25" 440x1920 LCD panel
+      - dcltek,dt300248
       # GameForce Chi 3.5" 640x480 TFT LCD panel
       - gameforce,chi-panel
       # Powkiddy RGB10MAX3 5.0" 720x1280 TFT LCD panel
--=20
2.34.1

