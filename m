Received: from erebion.eu (erebion.eu [142.132.183.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0CC478851;
	Sat, 26 Sep 2026 14:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.132.183.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431296; cv=none; b=b1rDkm5Pvnku/jrYMzzX05pxKkxZMw7fLrZ6x6bvSbTkV+gES9MRDe8AfmcwAviJlHzryvnV996fDqkRRp99Dwv0y+KrDN2oyhIAgbXYi6qn91Zgn/iYmTfq6psmDzf0yZ9BfuUyUlqvl6Fp+cdb1q+3JX1lz0kri3EU/gxAi48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431296; c=relaxed/simple;
	bh=0T2umr98ULyJfpV3mY7YI8pH7yPBqnq7RBLD2aFpK5E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EdnRmNVmOFID18iJ2YvPQ7248snnaQ4mUjpohA+VZz3skOiik4eWl8Ylkeueyh9eb4y4QRDCy6JQEcH07nVqdgwc1bRrHBAVt/8CUOWoXgr1vsMi/Od0fwCvzt4cDxs1eMvyoxrABge+inXj9xZ0NQdjalWRe/ToZ9FN7aIRZo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu; spf=pass smtp.mailfrom=erebion.eu; dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=90daMCN6; dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b=GA92Yv1M; arc=none smtp.client-ip=142.132.183.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=erebion.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=erebion.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="90daMCN6";
	dkim=pass (2048-bit key) header.d=erebion.eu header.i=@erebion.eu header.b="GA92Yv1M"
DKIM-Signature: v=1; a=ed25519-sha256; s=202508e; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431255; bh=PKss78b9nKM3DvfREgclG+c
	uAz/DEHFE+dFn3YmF8Gc=; b=90daMCN6t3ur1jgM4URcw6zf605FEgqJWqgwkgr0ttJ5xeARvU
	mt6OZ8mrkXqtcg85Yyg0Z07j/9WO4rzd6vBw==;
DKIM-Signature: v=1; a=rsa-sha256; s=202508r; d=erebion.eu; c=relaxed/relaxed; r=y;
	h=To:Message-Id:Subject:Date:From; t=1790431255; bh=PKss78b9nKM3DvfREgclG+c
	uAz/DEHFE+dFn3YmF8Gc=; b=GA92Yv1MTswZ07mivHbcJP0oS9++wUJ/grpnoka80JylWLWhXT
	hmUjDBD6qYW8JaEUYusdhd/3Azod5D4CzAXLqolFJgou5nqEjqvABq9JqdHbTID7rl3fYVn8rxN
	clailHLkPG9PAP6k5OYSYVIam0DWqaA6FZGhmFOtTXn3CNkrYC48yB1VQfs8O7xaRY8bpT7s9ZL
	g82OFTNYDmBjP8OJAxpOmf+SJcasa60obBQxPjkmDyblNzxD5bmfShI+rb9fUtNIMpQucsSKpXP
	dEbM4rYtBUA8FEbQzQoAu987btaIRbY2ZrZ2qTRVxHePPXPk0NweTBvouxy2aaQ/BpA==;
From: erebion <erebion@erebion.eu>
Date: Sat, 26 Sep 2026 16:00:53 +0200
Subject: [PATCH v2 4/8] arm64: dts: qcom: sm6350-lena: Enable IPA
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-pdx213-upstream-3-v2-4-b4612e3eb536@erebion.eu>
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
In-Reply-To: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 erebion <erebion@erebion.eu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790431254; l=782;
 i=erebion@erebion.eu; s=20260607; h=from:subject:message-id;
 bh=0T2umr98ULyJfpV3mY7YI8pH7yPBqnq7RBLD2aFpK5E=;
 b=/KWDg9K1uotf5FT8J+kX2NUEaEP8xwxIpN5vIPLtO4yuSOpEZaQi4pkGniKntGmjlwFH4rW0J
 7BOWH0FZ1GhCn/eN6Xun0TY+xci2YSIG3fmvn1vqOXGGxkLh2nUFunv
X-Developer-Key: i=erebion@erebion.eu; a=ed25519;
 pk=rOCVlR8khmBtCFe4ZlDcbCbIcORxdaNzPDkoIiHM7xc=

Enable the IPA node for the Xperia 10 III which makes mobile data work.

Signed-off-by: erebion <erebion@erebion.eu>
---
 arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
index c58047ce3291d..f3ed6445c7d35 100644
--- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
+++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
@@ -333,6 +333,12 @@ touchscreen@48 {
 	};
 };
 
+&ipa {
+	firmware-name = "qcom/sm6350/sony/pdx213/ipa_fws.mbn";
+
+	status = "okay";
+};
+
 &mpss {
 	firmware-name = "qcom/sm6350/sony/pdx213/modem.mbn";
 

-- 
2.53.0


