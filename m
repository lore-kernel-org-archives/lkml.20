Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426043;
	b=k2Up7Q2mJJi53F/TbadMwjLoeS0NYLQkruBLgU2U+xWYcsHNY2KAYxcE9h1mqRTAh2iV
	 L2nc5qF4BLPepPY11kzMmjQP5udj+NBN5yYYr4HvX5LvqVI7dHcviqczDOLxo+IGal52d
	 FPItTOX2rkk6FqttDH+InkZv1DU89eMFWCxQoGeA3AGUKN0qSJG1JZRd5DiTAICqmPETv
	 hAtJGk2d6nNbVFCArh5kPlh9EWs+7OPRS5fvHTjbgSnWWh5ybdAmFTAhradkb8uVDHS84
	 4yYZZ9TW8O9vpPCdd+GRCqzqtdbnf96jRgfqaH8lX7AY4yFbWwXBh0VGPcLeC6wIzsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426043;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=GIh0JgBeSlgzNMT54G+6N1qhYosRWFevhHzDYuWLq+Y=;
	b=j+1y4amGqCZjX+JTnDxGV49bpU5g+3rOwTzG4BS5dyIuhLYSW8LoDnp8xnKTXXmeEwDO
	 8XO8G+tebbfZW45vg8sPSGt9EBAkv2weVp9eFNuP7fjM5Fe0k6QaRFpGRJ5k/E7cK27Rj
	 CzaQZf30TXQ/a49VtgQ8qO9DrBbB6GIUu8bftzB+KQOntbVB1NMzgeoJ6DOjU2Wd6k7ZI
	 /TuZJRARr0XP5kNSXosi/4FABKDdN+EM0fPwXCIb24zcf4g+Qx1vGByupK3zQ7h4pC7ez
	 jm9917rraGRllO82A1/htyAVRcpO13bv1skfRJB7w7YP8tlSx++IvVYtTmdUI4AFqMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZB1H5uiv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F5606A88D;
	Wed, 11 Nov 2026 19:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZB1H5uiv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFB11F00A06;
	Wed, 11 Nov 2026 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426043;
	bh=GIh0JgBeSlgzNMT54G+6N1qhYosRWFevhHzDYuWLq+Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZB1H5uivISFZvnC5aAhyn0BXJrVaJOHcCYkp5UO1ymN1cND3jr7ycm4hvlITjeqvk
	 vGKd9MIejYLLoumonQJOp+R58kXZQ0LYmer+uGkN67ECRBWlI6mOrGUX+9D96Hn3Wy
	 eOtjWKVonyVCBXOK7XMxs7A95HletKgXTVRN9lICgD/hKTJsBvFzOYS53fEcGG55id
	 H/qGN0VIJEp+Tye1H0VXHsRAV7GxLoVHI5Mk28KexVGW+nPB8qti2EEbyuwnf23AXQ
	 gQpdSbkPh54LgeZvTkc7/zstodfF5JQRAqbF34hIVdrqCpzgSwEpwojtsQpCIeLZLe
	 AnYrpIHLrWN8A==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:22 -0600
Subject: [PATCH 12/12] arm64: dts: hisilicon: Remove unsupported SBSA UART
 "reg-io-width"
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
Message-Id: <20261111-dtbs-hisi-v1-12-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

The SBSA UART driver uses 4 byte access width by default and
"reg-io-width" is not supported in the binding, so drop it.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hip07.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip07.dtsi b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
index b815c1fff6ea..08c8a57e5471 100644
--- a/arch/arm64/boot/dts/hisilicon/hip07.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hip07.dtsi
@@ -1196,7 +1196,6 @@ uart0: serial@602b0000 {
 			interrupt-parent = <&mbigen_uart>;
 			interrupts = <807 4>;
 			current-speed = <115200>;
-			reg-io-width = <4>;
 			status = "disabled";
 		};
 

-- 
2.53.0

