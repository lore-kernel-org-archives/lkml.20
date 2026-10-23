Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792720617;
	b=nM3YzO+7QEeFA2+/RNQ+L7BbklPMfwZW2ppxDTi1e0gmZL2FCdAZGK7VGaP78XvQosRi
	 NTmi/ACcdaHLdzcvKxNyPCoSeYYP3dVQ9sT4Rzi96YZOaY5ukz5ku/NZjnaChXqoyL3HG
	 DaAoM5rHDa8dvaLgChJhe8inr5pq52ldbjlZkh1RPZUqmX90DhPMuy/bbFcUu7NtfA7q9
	 T7WCqkfKSKuE5rXp19wTJvgz89LCtx5xg2ifcB8UWemzJH0bJpYmCBtWm3caeqyIVqKK0
	 f5aEub4NjiCYsZwwTb5D/v1bEGOrZI/wD24lYBn9dZneAZRjsAF4X5UbPSU4o6XCgaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792720617;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=lskK5KxoJp28TL3VHO7B440jfXcS3xsZ5rbvDxqFP9jNdTDYJzEUvm3WyAe3+iLfTkul
	 2SQLe8A/Xz5FoJPZhZcv9CQadGJfpNcflBtML2+K8Wel1V2bkZWsB8VeB5zSG9+Y8hd7d
	 t7Z7eSiQi+Mpetg/Yffuqj8foq1bVMw3sHbOXVM0GQUYT58Jn9nSDiBXHVPhDoUEjplfZ
	 V+NJSVJdOXYlIGSF1z5IY4c2OSbg6oGye7AxUgVtAV7TBuAShjBwzSPDE2tbuzoNWUg31
	 gad2iiwkcEaVAp5mF9Cy7NisYQ8yugXsFuJKK/0kXHM2f7pX6MkOnqyxT7vqzvN0teQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehxK1Whl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15AF606A31B;
	Fri, 23 Oct 2026 01:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ehxK1Whl
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792720616;
	b=Kn8KSKvl5LrQjGfrzJlQKuebQVWzTg1MN7U9ruHTEh4IJ5zxQpkH4Rv/QFaXtMODpX/j
	 aanMpFO3p6uxour/F2+HJ07aCuEgn/cnJpU9/G89YGZ3s9uR5WQsFai9+1UnfTCaSN2hj
	 qhH09umNwDXDdTUsrwZsxsj/gSznDJb3VciAfll9MOGh5yUYmc7UhWaubCr6Qu7guHoXB
	 +Bs5o2DjCTsqWTTX1BzyjfwdzPmoWapRYC6UCYYDwBv3qokoVkPtQHH7Jmedrus8SKSYs
	 V4E+4lLWHqrmt78vs+2hqvFuMZ37zxU9X4K8CEbYHIOuNuZzmvCYqjB3NFInC6fTEsg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792720616;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	b=3N0eyWDL2whyQlOyP8JF/bPq/l66NM2Yd9fD3jDdY+mXtvHBO0ORPci2b0X7qtJqkRn1
	 UHhBwGaJX+SwHpLELWEwF5OfsV9k6xNTPXuW0Phgsdoj135TUwWzGzAHykurAYKqmIYEr
	 o9+c6nsfM0ys+bNoinoi8kNM2r27Lowi/oBU3aqxAKBdy0g8MgWWppdc8cM/iASbQ9CBu
	 9WDXk9MPUKPouEyX/ePZQR4fth7h8+66108a/87h9lprWERbJgtXYu/r8FWiY7iUCkFZA
	 lq2lqWwef2b9wHljYA5LbhYRuWAVWzqOh2aj4DRF6gd/PlyzaJ0TjWjA0ydVhcb3aiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BCDA1F01825;
	Fri, 23 Oct 2026 01:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792720616;
	bh=asQFsxgQNnggINI+MiaVE3YX0MoEnfTw/ot13XBv/9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ehxK1WhlIK9DU6dBNyjrgsIEsRnltRg+NI+QuIM5ypIXNwy20ABvloWrGyRgjbx6O
	 7G7NQ0VmshJnZfQ1p9kiiChMDLwHt7GPrE2RzMoh18HqNS75ccSCwcblJon+qeGf+L
	 FH+bvSCoxExmgqlMEPA0BTk7TCXsNwMxaM4VkPvhX7ju1APIsQm5WhTK1kbah3aV1r
	 O+YJDvSRQ31qVtiON68Md6F4eRa46FdkMj+RSXZfc4gHHMRB3+QSybEswaGxnfwiMD
	 FTIT7mML107DxOTWEU2O1aoVLKnbs1I0wEeeduGzMsKC8u6CZj8Ac8EB4q8+UZWxgA
	 ynPOBXJW3SKWA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CF6CA42114;
	Fri, 23 Oct 2026 01:56:54 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Fri, 23 Oct 2026 09:56:41 +0800
Subject: [PATCH v5 1/7] dt-bindings: vendor-prefixes: Add shenrongda
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
Message-Id: <20261023-ultrarisc-dts-v5-1-af79dbd6ccec@ultrarisc.com>
References: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
In-Reply-To: <20261023-ultrarisc-dts-v5-0-af79dbd6ccec@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Andrew Lunn <andrew@lunn.ch>, 
 Jia Wang <wangjia@ultrarisc.com>, Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792720613; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=ZALZ4W6hYaJRZvUX0ihX5C1JJUjIqOj+UBs91zacodYTvH/Btbh+9Corbw8zhKdnyUUJJxZg4
 AdZE0IlDrZqDn2+lDS+YvdX3VJJjhyiODse2PDGbE41cqMqLTRTnln5
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-Endpoint-Received: by B4 Relay for jixincheng@ultrarisc.com/20260922 with
 auth_id=1046
X-Original-From: Xincheng Ji <jixincheng@ultrarisc.com>
Reply-To: jixincheng@ultrarisc.com

From: Jia Wang <wangjia@ultrarisc.com>

Add Shenzhen Rongda Computer Co., Ltd. to the vendor prefixes.

Link: http://www.shenrongda.com/
Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..e100f3993e57 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1507,6 +1507,8 @@ patternProperties:
     description: SGX Sensortech
   "^sharp,.*":
     description: Sharp Corporation
+  "^shenrongda,.*":
+    description: Shenzhen Rongda Computer Co., Ltd.
   "^shift,.*":
     description: SHIFT GmbH
   "^shimafuji,.*":

-- 
2.34.1


