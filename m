Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794399894;
	b=DVUj7NMJYfYMhREIM/5sQRsDLCyNAe6akPYXgX1bsx5UdetTxj9lpU0+xVP8iTeca8X+
	 kYZ7o9Hi+Ac/uqrh/XtpxzM/BqbvQHtnX2XIlw5UDCBiBRUgnGl2s3jmtV/R1zDwh/f81
	 311zPbsQhqOKR01oH7h4YM0WdASrkuur+wRIcs588/UMV/RPfyFFDAl6XMCnb7jDo4zOd
	 Xlxlsbk/PjDD3VxJ8zIm7Iazd1tA7mhCbxsd8NSq/9An2H515Hi+WRdDx0C4oyYEVZ5u9
	 eszX0snQjrh8Y5g8ClSs8FNZEWafKWqDj5vJq6CHe098e6FUiV/6kLSeu/Z4LGjdigQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399894;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ICXP/cmqLovC4R2HCOjMC4Wp+1KJ1RE5SJlC2SoQU1g=;
	b=BXsozOJiSGoOxVaABlsF0Y12zrJI3SyGJ3sbIDJJS2l9RW2avTT/8Py1IkIG78msPJpy
	 2n5zuS8G4w2T8VXc/pDg3BB/rtjOlccIaN3HJ51hzw6z7vpHeT7bYnCekCHbmJXN9MXbt
	 F1Wi0rBDxVYQQvsXoZHlSA1A8HsM96IpDQz9f0/S7h0wem8F63kdCzMiNSFXpE3HPGImD
	 TzmUJyfXK2QQwIo4KALQlrBfB/OfYnbRDMpYaSIY/jrWuJ3vdolHEW2Aaev2z3WiurWL2
	 r+jUAYtzGzlg2aDoH9wAKVFlY2nlAd83E8yx8K92rfHnXCEStxWDCsmI8li9H3giFAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncwQcdGw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63378606A321;
	Wed, 11 Nov 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ncwQcdGw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794399894;
	b=qpq4D7Slk1QnZpTkQILk1aBaPxgYwHsstaeRRPAMTzCPAFv0vdUutw6d7xmgnwKRpTz1
	 K8ry0Cij68ZJ/IVtGqRRRYDIE80f86v2OxVBijlGh0O7Fg4AdYEne8L0HYUqaNhdiVp92
	 NusRF933Q6XUpxfH7PfwGYJY9RdMVLeMkid/ARetjBQ7apzodEzWc/evRKMBxPsWjlQXl
	 zBsyLfLaaFSwUYoxDt3JY5zofb4mej0Tt6Y9YDG11fk4MfV4+EFx71p8+TSMo8+OxIRXC
	 iXOPyLi1DDfPK0ADMjoKbHGOk5kzqv9r1HwF6FuP0tMglD7wJkV2PeYrtrM2FZsse+A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794399894;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ICXP/cmqLovC4R2HCOjMC4Wp+1KJ1RE5SJlC2SoQU1g=;
	b=s+uwz2ySeTyM7ujO3L7/1xGWqgV3TRKba+6I+j+S1IwmwrmWU7/3znzzvTgbcfiLHEpG
	 +DCHoB6kmp0vSQU8Qf3YKWYpeqX3i/ICVkgDUECznCADsqCk0FrhgDan+ESlvvdCq4Isq
	 I7yWOh4aiG0qYXAjvN17PVZAmBdCU9oKqA0dyVedY5/wJaa/5vSinOFvEeetPigxYdgRc
	 ldhnQw1SYViKPTgHQOmtqQimsm784HqtamMNI6ANfhumeQ4SJUbhqLqvbcXQ85pQd33lH
	 XTU5FJp/wPjbuiqJUQUcUG8ZBnkCnkINUm/WnzHO83hEyBfAWfu9yut89k7aKPfJkaQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AFA911F00A06;
	Wed, 11 Nov 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794399894;
	bh=ICXP/cmqLovC4R2HCOjMC4Wp+1KJ1RE5SJlC2SoQU1g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ncwQcdGw3kKUwBkYrbeQXyk5ewkbwzIDBxTq8sFL6E1l4X27uSoXzUgfq0eTdDDtO
	 Vr7JVntDV3bTHZ6ov0d4DJCM7Ia4MtIp0J9x2YnmDDK3c9rhlJp20qOaAzCjm+yIQQ
	 +Xz3bSahmbtynVS6B9ALlum2IPX+xCzHDlwOye/64v98SGjq8aVKx/+0vUz0P8BfoS
	 EbstbhXdkADTPwrND3nIDVq4/ib2YspR33tC3xaDg+MjjDybRARHNZZjr6sovDGLOh
	 BAWemmcOGKCP+bvdJh2Lcpgph/lkyXmfMqza+nmtTfRYFffShJJjcv8lWgDOABLqsN
	 DAcqHRqOVH3YQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 40ED548F9A;
	Wed, 11 Nov 2026 12:24:53 +0000 (UTC)
From: Vishal Balasubramanian via B4 Relay <devnull+vishal.bala.nps.gmail.com@kernel.org>
Date: Wed, 11 Nov 2026 17:54:50 +0530
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Add Samsung Galaxy Tab S7
 FE LTE
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261111-master-v2-1-5eb864e9f38d@gmail.com>
References: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
In-Reply-To: <20261111-master-v2-0-5eb864e9f38d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Vishal Balasubramanian <vishal.bala.nps@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794399891; l=832;
 i=vishal.bala.nps@gmail.com; s=20261111; h=from:subject:message-id;
 bh=9F7my3xYNlAFa6L6qVff7o9I+F4ahR3qE81wL7FFgR8=;
 b=bf0c/fFNhMuA4w66sumeLgVl+d84Sycm7uiyCIuiYCFIvBuiPHwb70Ih0ZVrBglGljP42TgY+
 8pJGRVGkvRQBf/9Plwc2dQTNhFcuggJk3nuCkGdzlLgP2eO18sWkW40
X-Developer-Key: i=vishal.bala.nps@gmail.com; a=ed25519;
 pk=GDcoc+SAK+BHD1Eq17X/BJa9U2HZkBW+dmxS8s1xMAY=
X-Endpoint-Received: by B4 Relay for vishal.bala.nps@gmail.com/20261111
 with auth_id=1486
X-Original-From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
Reply-To: vishal.bala.nps@gmail.com
Content-Transfer-Encoding: 7bit

From: Vishal Balasubramanian <vishal.bala.nps@gmail.com>

Document the compatible for the Samsung Galaxy Tab S7 FE LTE
(SM-T735, codename gts7xllite), a tablet based on the Qualcomm
SM7225 SoC.

Signed-off-by: Vishal Balasubramanian <vishal.bala.nps@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1effdc95e9e97210bd9a63673f8ba4..abc3c0f53cc14b02d06b68aba3bfd8425ea4fb07 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1118,6 +1118,7 @@ properties:
       - items:
           - enum:
               - fairphone,fp4
+              - samsung,gts7xllite
           - const: qcom,sm7225
 
       - items:

-- 
2.47.3


