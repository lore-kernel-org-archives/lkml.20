Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794426032;
	b=Qzx3y9a3m1PsTuwZaiduPmcT8b11MPQDQOdY9KWlRRcYQMRMZmcSeMhrfsoHCJVToETo
	 8iMvGEQl6rSy69BLB7cl+7XHKrtPb8eCNxeRoPCHjK6wOoW8HZRBeRr1moU49qzR04/7W
	 xxXtz8hryXLQmVJ96wiadrNY33rp8i9ZmxTAPkDeieEVtGDkLQecC6vNC4sLrKnY4qHRa
	 hWDMLJ5GjGQHt+PqS41KUmMqIGw6TpGNentopXE93mNShBLhxIhJl5L66FHsSGmxzsUnU
	 H2eyE0ht36cZxaSvMkfs4zMGdlriMR6S9dTsRjO2XLI+QNq08CXEmuHR0nsrDwUil8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794426032;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=JLHMNIGX8tDW4EPIddI7SD0KvLCdeVVUDiw+ZKX10Wk=;
	b=kTfond67TWEDpjxSez5gysIZYE+Ejnjn/p6hDCtZ+djIP4mUcEjt+IV6Dxm3bArA2nom
	 8/ixpGlS37RB9PPw3vAkE9Bg7fBYoyO4ZLMjwpeCvTfd+rNh4qSf811v6qAgpoM8HLDZx
	 i/Vux7QzBwfmKdc6d9comvpOhm8HAynIcd58rdDKOYq0CK7OSh+eZbswWlAEdHqvjukg3
	 W+DK98iWMfAY8apk0pMV3Kx0ZvjQVHuN7hvYvgd5rCpG44DJ3RmpSNSIqsAwNPZd/ZPuA
	 JPkMI0JkoVlMMXUwdUYkBjE3BGw+cYtqzycoR/C+lc1Dy1Yof/o1bBvH/UXbac4nNtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tn0Ccn88;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B880E60A261A;
	Wed, 11 Nov 2026 19:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tn0Ccn88
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3209A1F00A09;
	Wed, 11 Nov 2026 19:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794426032;
	bh=JLHMNIGX8tDW4EPIddI7SD0KvLCdeVVUDiw+ZKX10Wk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Tn0Ccn88e/tw8YiYx6XcN3fnJM2YLTmRibl4bwr3mJ+4ZJwX+3Vh2+1EBk/06AMvB
	 TU+WFLUwJbywyTwut6ysrR4ALBALhN9DWMIE1kQCAilAIPbiBjwGTrDZkGF8WwP6Z1
	 L+9xEyxc0de1cBcLXKJNDeqpumsYsJPMRIahEuZQsmlBjGI6FeYKT4PJkgbu8olgYJ
	 PB7YR0E9PvHx7BZoTl3+eGzgme03RvS9ngDvZspfGoCiIm3/O75ydAeXvWgw5NBFXi
	 Jn4zLfUjDmPDl/uFflUbk6baUFZnP5zpp5/qZ1qeaoAxf9ObO5soB49TX+ZqCqa1Kj
	 y09RLybBG5wtQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 11 Nov 2026 13:40:15 -0600
Subject: [PATCH 05/12] arm64: dts: hisilicon: Drop HiKey DSI endpoint
 unit-address
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
Message-Id: <20261111-dtbs-hisi-v1-5-6c9f5f80716c@kernel.org>
References: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
In-Reply-To: <20261111-dtbs-hisi-v1-0-6c9f5f80716c@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guodong Xu <guodong.xu@linux.dev>, 
 Wei Xu <xuwei5@hisilicon.com>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16-dev

Rename the DSI output child from endpoint@0 to endpoint because the
node has no reg property.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
index 5f31569cf494..25ff7d7dc176 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -300,7 +300,7 @@ ports {
 		port@1 {
 			reg = <1>;
 
-			dsi_out0: endpoint@0 {
+			dsi_out0: endpoint {
 				remote-endpoint = <&adv7533_in>;
 			};
 		};

-- 
2.53.0

