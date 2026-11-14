Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625609;
	b=2gIslLNQe4eg2H0hC57z3shLKro+PJyK4dX3EC3P/U+m28KnHXOcIkDTCoJXRBih1UeA
	 MpHxd7Y7wUTjvNzss1bWxowrCzIvSfEc6IAFIul7WcU76vpxZ7RARmsACKLc2paMdlrBG
	 t/IdtYTujcdTxGYlS4ruPUavfqp3Uayo6Co9dv3rd/MXCCxp/CjYQx4dZFMlrPo3sFCnA
	 xuAQRWIPSdl7AylLMFFl/Ik4y2U1N1rRaDhJXXTI36Zg6+ZT9BCn2NVYJIFs/Rt51OE0/
	 ZrqtTgeq+czNcexSxvNIsO9ddYr3nDtZjIol7Hd1TGv+H3fzAmLngk/e2cYBiASJ+2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625609;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=N+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=;
	b=seS96O0luxZqY6diWwBVcillPUR0FMAL7Llbj4z0Lph/EbT8eM/bQQ4sIWQRWQxR7iPx
	 SdreHQ9HBGwL6dmC+SNhLihSclldQCYYGxpoOML+t3gf4IvXbX02a/cDxLt491cK7HJ9Q
	 gxdlGkssQAm+outIMCzLvMQZ7b+BksYkzfPmSBcjBcTv8+lKZ6DWSZ+7K3+1LvU3gJ+oB
	 /jylBmhYKmFjbFhOjFjhdjeaQGp8sig2bEJwM6SocCwZ9yFsEL5fIDcpaJsErx/Zd/YVp
	 /MH9SBZPDLenxo/ObMGWNduFSGt4RMwzhRW7sYfzmmHIJsFs9POvf7jAxUF7SE8M1ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=hmFJBlo1;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=02oCrzVs;
	arc=none smtp.remote-ip=103.168.172.139
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461F5606A8A3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 461F5606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=hmFJBlo1;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=02oCrzVs
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 9F66A1381A4A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:06:47 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Fri, 13 Nov 2026 22:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625607; x=
	1794632807; bh=N+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=; b=h
	mFJBlo1z252QPnZhveWFXdEwvah8nHxZD86blxjM2ZZOV8D1MY9ZFxAcYdDNWPKD
	lrVlltL4N0t8k/kI1zgDn79W2OaPHUjuM0PantmGbC7KZk1g08lWmoBvyGYgPSZ5
	wILqZPLZzXUq2OUwRGWW4IFn/L5ysj9NyQnlNVMd9KISPn8lwaY5V2gd7iQkqZWF
	h5Vl/rEfLQu9pTtWHqrTRVpE2xvexSw05G3QpssqXsZQL6DI1lUl+UiSZOTpqTxx
	Mq7RZsA4CMhQT67fc7PGBFQcp1EydmdUhA0ICdhxhP0QFM0tjNvfXnlL5GuRa/pE
	yP7+IukD01isOeasRU84g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625607; x=1794632807; bh=N
	+9Y3ZHWND8ST8ERZZyyzL82Il25wWJZbVPoJhmWdl4=; b=02oCrzVsPHFU0PiH8
	woZAbQuY5YOEAqPsWc6K167EgqRbUCrrWVBKj8k73THjgy9qwEKrhVjZtWOPoPw3
	0zu7PhBN9+qmHgTQY4/U/loWisUeVU3Cwed+Zam3wrbZEX07q3h6tFZqWinRj40y
	XnlPeoosVDhEtnx6PKor9Dau39xZ/7KmNsTmg1IaCMs+m+BNVm8tK+IvTG1O9Vht
	dSDgyaa9eVTulk2vjzPdiV4Tyj/hcp7HEQc3Og7naFtdIkyjnhPPPzJGqTOhcbMc
	dbtIF61k+fo/dwzKNaOycvwNJjZNP26BnTy3NxLan/PK0FtMSh+UDfPLfCRr2zXb
	kSV2Q==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625607; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:FgX2dZv9KH/g9zcFN2CTyc4LUdlbblTy06a8aSfsX26vO7n
	Oc7SOI1XKBJd39U9U750oxQx8/D/Bz4ZkEi+/Df6JSH1xNzxj4We++YBnPgyy9rL
	IxQ+4rWr6ixfDHnj833LgBA9dxH29Cc1YUp9VjJq3UAq7Jq8Gag0GfIlgRyGtbJb
	DDAvpFr5d/rGlwGMijxpIHx3T5Lw2+t/IhXw3XcOQxEfuiCRbW4zHLTNCXantRCu
	S6/IEEbm1gNeKSQVuNVhBUESeUDX72/zGKHdNhpSACJV5InJY3MfJMLZGQc5x2VO
	0sJtkre3qE/zSE46Zke8SNNKNrzAxhHfMscuq7Q==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:G0rMrLQgBxn4OAvwTRlSphgqx9ONQzzqiiQi5Btpnrg=:E3QG1wpL1G3f8pPSmRg3P12/DKKK+lX4bpFVJJLsfbA=;
X-ME-Sender: <xms:R9D3ao4GXcVrBtILyChglSVcmY-nwVOlE2UZAOotYsYxYlP-NrrZaQ>
    <xme:R9D3amCpRdbEJTU-BU0RfXPxqr0kRdfZe5MD4TkundRlTk10xlrNHkfiNsTlRsZfZ
    7ac8hlcXjdX1snS99bjCHWj_ECEpl3jGtQIxMhPUyeHFC51k6d7UWcZ>
X-ME-Received: <xmr:R9D3agt6qvPfKvr8UPxiW5Ni1XCm7nSxgKCMumkJZ7Y-PYFFrhElxE3qCwFk_MHKts6p6QKx>
X-ME-Proxy-Cause: dmFkZTENh3Cq6bNtRDDqH//naJpK03OGhXB8Cp3eHHX2EpHYf2oBjZ1/43ruyqVDLzR5bI
    q7gV+k53czH7SJj0JMNaMvWBGkaUqaereb01ifHpul1q14DobEKJC2mDvQQE3HzqoOU9gl
    QO0UnCSJOnNpWmY1qWdj/IivEZ+5eJmA8XcRYmqsfPBSZaKqk9zCnQvCGUQuYFJdsYZGP5
    L8zECb373LU+oefpY9jKwOjkFDiU4CWxV3iExHL3zPnpeZwM1wkFJxhm/yJk+2AJ3ju4OO
    RXCknd9xSS299sQU1FiikwzYfEAyF9m0XTBIDoIn2qfRRJDU3uzKkImCFIAQPMS5Q++UMJ
    HNGti+0chsjtgHUFHERda/e1esdxvF/MLapAIbUuAA8i/5FCjBkAcw5N369Zb1h1zT9bJ5
    6m7RBUUXtquxt0RqeHkHOekFzPQ77KqUX4LxLzfAJN6IjAPwHnrvYt1MpX9r/enJ2nOEql
    bVS6HYaFJdTO5LnsW/AjFKyK0zv1VoUA5EtHmfilWRIc6TWsAZHvV6/FKjBUFjB34AyCqV
    As7v0V2ObOmVe8tSCaESH6Uh0AXx7IsFxmAIh94XZFQD2nV6GGyw+HfzGwCwltht78VCM/
    NeqYAotcOPiXJvEbQzwmLaKDYwUt1GYeDCnzXCwXhJU+QCtmjewixHGi/suQ
X-ME-Proxy: <xmx:R9D3asM9Q0m49OQPHsJ7heQWwbeqZlQW2FOL6veyn0aSVqa8lP8C0A>
    <xmx:R9D3agV1YvvBbE7Ef3wX4DvRZdJTVBP5fqdZLnNznZb5xe4P7q3ZMg>
    <xmx:R9D3avRFjImoTT6eWnfx8DGeVfZzMGP7WaiVqUfFW1Lki2nsVgRZvQ>
    <xmx:R9D3aoaDTU4LJunbR6TnjFVryxsIxtLqyJAoELuSVbP-v41H14Y1UA>
    <xmx:R9D3agw4r_dvEpyT0t3EpwPTpr23kA2D80R1Sz_25EalAwRsI1xvvFD4>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:06:38 -0500 (EST)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com
Cc: royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	sidong.yang@furiosa.ai,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v17 06/12] dt-bindings: npu: rockchip: add rockchip,rk3576-rknn-core
Date: Sat, 14 Nov 2026 16:05:23 +1300
Message-ID: <381d2bc99486ca312e1d02f482eccd37def29831.1794615323.git.gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RK3576 and the RK3588 use the same NPU block, with different hardware
resources.

The RK3576 has two cores. Each core needs six clocks, two more than the
RK3588 (aclk_cbuf and hclk_cbuf), needs only one reset, and has no
sram-supply.

Define the requirements of each SoC in allOf. The RK3588 still requires
sram-supply.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../npu/rockchip,rk3588-rknn-core.yaml        | 40 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
index caca2a4903cd..2eb9337819e6 100644
--- a/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
+++ b/Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
@@ -21,6 +21,7 @@ properties:
 
   compatible:
     enum:
+      - rockchip,rk3576-rknn-core
       - rockchip,rk3588-rknn-core
 
   reg:
@@ -33,14 +34,18 @@ properties:
       - const: core # Main NPU core processing unit registers
 
   clocks:
-    maxItems: 4
+    minItems: 4
+    maxItems: 6
 
   clock-names:
+    minItems: 4
     items:
       - const: aclk
       - const: hclk
       - const: npu
       - const: pclk
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   interrupts:
     maxItems: 1
@@ -54,9 +59,11 @@ properties:
     maxItems: 1
 
   resets:
+    minItems: 1
     maxItems: 2
 
   reset-names:
+    minItems: 1
     items:
       - const: srst_a
       - const: srst_h
@@ -75,7 +82,36 @@ required:
   - resets
   - reset-names
   - npu-supply
-  - sram-supply
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3588-rknn-core
+    then:
+      properties:
+        clocks:
+          maxItems: 4
+        clock-names:
+          maxItems: 4
+        resets:
+          minItems: 2
+        reset-names:
+          minItems: 2
+      required:
+        - sram-supply
+    else:
+      properties:
+        clocks:
+          minItems: 6
+        clock-names:
+          minItems: 6
+        resets:
+          maxItems: 1
+        reset-names:
+          maxItems: 1
+        sram-supply: false
 
 additionalProperties: false
 
-- 
2.43.0

