Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426036;
	b=L8E8p1r62IeksESLe6NN1MgPR2xAhd1IcPiaZB6T9QqYnibIbU7GhEP/x/WRfMdd2/1C
	 pndYu19jWsncnkLpVJ1nRKV41+Vw2doyoIboE4DrPoyX1/zBcS3v5N1wfXqP9+7UESvj5
	 UAUxI/+hWHunulLbiO7HAhGKHNvJxOkY7KM8OWm+8lISADjkkUe08x/hlu30RvIEnAK0K
	 hscK0+FmXvqRE1jmQshIzxxGpWHTa7PF0JYbRlv8QzjzJIv+mejxYbcwlYjsFbmsRtui6
	 qMKnukQmA9FdlLg/hPKzuJXMW2NOS5KGb1Stf5LfTeUfvWn1pY5QpVmFZ/k+LBhiE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426036;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=HdU0c+9MCu+S9e4QMISypHwh6GOzgrr45bqF81gq1Co=;
	b=fke5HAScl0AfqLUeH4PPDDDHsTFapO+dBmeFmYDzfjIEEdlY8li9T3SGp7NuJA72ZdMI
	 OZenv5scboiuoV6XhJYDCZqEh7N4vidHCGInm51wdfka4u06Xh9aVPyM0g7EGtkTaoP5b
	 LT86rsY7u9wiptLqRWdDhc2O/nflIkisB5NuWqRaaFvKfr7KODi3xi4dOJykJj1T+KZgG
	 O0izTNyIxavvye+BPbx9bZrWSk2yAX98hSzYsLl/E5Lg9rjAk0zg0bJYPvlDV+7mTzzuS
	 EtonaQPT2QVJso3hERbfczuli4fOU5gELB3r0TaYi86VMH/2/mmHKM7AlJ5WiVujk8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FG1KLOi0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 011C360A382F;
	Wed, 11 Nov 2026 19:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FG1KLOi0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C1271F00A0B;
	Wed, 11 Nov 2026 19:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426035;
	bh=HdU0c+9MCu+S9e4QMISypHwh6GOzgrr45bqF81gq1Co=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FG1KLOi0MLv5S8xAsErfvsG+Vay1vMhZZvgKRRM1n4VgnsGQu9iwaQXQCE/2KCdxw
	 49S4CZGMt7tK1s6E7hIU4EOPHPYWGpemLbYjSd+CLib3XEvuS0YjW0I7CKb7bKGZ86
	 qkngRYjLVj6gGxQSa0MV2HLTxyaVh6+p/onin7GsFtLglKnmL8vsrB1LtbRhoUF3WH
	 fTXI7LE7pHKUtNtLZwqOhcHCKGHl4sqFFURxTcINNg6/tClCF2RvobVidtVEBHKBj9
	 jwWqCDFpfUbUq+z8D46YkWfs/e8EzvS436lJ/bmL6njikZrx3t9g04BKwI2q93zhzv
	 e6PgyJfeF4I3A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:17 -0600
Subject: [PATCH 07/12] arm64: dts: hisilicon: hip05: Rename the HIP05 NOR
 flash node
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-dtbs-hisi-v1-7-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Correct the HIP05 flash node name to be the documented 'flash' rather than
'nor-flash'.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index b7792d443189..eecc09bd8fc9 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -54,7 +54,7 @@ &lbc {
 	ranges = <0 0 0x0 0x90000000 0x08000000>,
 		 <1 0 0x0 0x98000000 0x08000000>;
 
-	nor-flash@0 {
+	flash@0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "numonyx,js28f00a", "cfi-flash";

-- 
2.53.0

