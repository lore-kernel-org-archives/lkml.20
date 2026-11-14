Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794625619;
	b=s63PgQst5BbOyoXHNggAgR4Wy52Wsu4L2vLcotJ0kmd0JFNKZ2qUSHhKC6hVHRk20oqU
	 t4JVu6pLH2+Zvf9o5SXZlzOvhMv85MgNnV86Pjr9iaQ6OK7sNcsB9b01A4JS7QDz/0bR8
	 OrxdavN1GWiJSU1TkRz7GCaMF2cPodQIXkG2yMdD/PZ8xDzqHnFdwDfRn5PiOVjVpiZWv
	 0P57y6qwUfcPZwl8VKnX+O7MZHIGiBvyODzR7oUoKG8VCdNOl7FpUi1IhtK3kjF4uOl5N
	 SyGJn6+s1KWaYHUKzx7vcJStIvLibLO4om0UatNuhi0Hi8FWVuDCnOagpBmQntsqiHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794625619;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=6x2DdXPRXEfWTwXK9W5PcsBc7yr8Bb9BaYYA36DgAhY=;
	b=01M8uldEFStLsbSpdwr7DfsKOaO5/VCytjrPdUdSQZ0uGm/lFRBdBt/1APgfns/SBulE
	 Nfx8KI6TfKmF5Es2hQh5LkeC6wt+1C2TMEQ/mQavKURKsHqICxZ1mTsUQhApXMq6yrx/4
	 D6ZYrG9ZtWqZr5riQQpcKgw6A2R1M7gmYcZO/P4K09PsQFwMRYeiDHS5tm+myj3rmYeKA
	 drjyHq7CC1OU9163jjEadNqgOqH5nRbJW/gz9EBL4xGRpuJUJarESLWi6uzbdzSC2Akyl
	 +cmbURKR8Wqc9K90VjIEgcu+1fehu99/JyWT3LbDIU8M/UdF519i5mOB+qQ6Gp9bK4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gahingwoo.com;
	spf=pass smtp.mailfrom=gahingwoo.com;
	dkim=pass header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=JOyZ0CFr;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GAFzTvD0;
	arc=none smtp.remote-ip=103.168.172.139
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CECA606A8A3
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CECA606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gahingwoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=JOyZ0CFr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GAFzTvD0
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id D6C731381A50
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:06:58 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-10.internal (MEProxy); Fri, 13 Nov 2026 22:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1794625618; x=
	1794632818; bh=6x2DdXPRXEfWTwXK9W5PcsBc7yr8Bb9BaYYA36DgAhY=; b=J
	OyZ0CFrc5h94lMOBy1I/MbIxQTNbfZFe/ma9Zcp7QWWAoi8lm5u2Gv/PC9yGqF7j
	oumzmUj27S2v/Xzj1Fv/2ruxortxHN76VunmsvZr0hFlaVAvLTmL8Qonx+02Atbv
	IwXFwgF6JVAeZpl5B3ElH6H3fx5Ewjy7ptdzPS7bJy26O5TDGUlTmU1SPAFtFgtS
	+E0RUWfb+Kav8ZcUlKzjFTbzCH5HsbwPvJlUEhBb22FY1gGKlioTbi1Qfqat5ePw
	3O7WCsS8lEUhxL9EngPXdkAF45DLIkeJRkvjLZjgJbcJWroIrafv8ctRHBXrwJxw
	anjXaYOprKfj+aZ3xL2nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794625618; x=1794632818; bh=6
	x2DdXPRXEfWTwXK9W5PcsBc7yr8Bb9BaYYA36DgAhY=; b=GAFzTvD0voW6TAMrF
	L0u2FO9DBlnV9kNHR2Bch7rKfiBlOZywpeFUry1+DoO1mPn1ZyrXV7KyFQCRAYwe
	XmKkqwjRB+HYj8uzBL61tdeWtqM7H5zgcTVL27pVScmzd2cYVLhdi5s7GusSXtBd
	uOmezDELh8D0SEir88q+zwuYaEKmgGOOIgvDVAEeKvueHm6LtxjEjHejBp308CuY
	/qudBwTYLw7DzkDDPhaf9Kb/Rh3jK5TjLS3sIo1uD4qYBCESmEpdzkISoHTL3VN9
	a5boz5pdhexkaUBG13Nop/kw3bbs23NY+62MXxF/7V1KxXZ57nX8N7ywxl0brkoC
	QvvCw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794625618; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm1:rsa-sha256:Ie1Ao8xdlcNffkvSRrIpOhoo/ow3fZnBU922fiXOdP0OTBf
	+6yKxVQxtKGsT1KNq7U81bSj1ngHNCQvwttbF3snt2g/7XRMvAMq5vikHDw5CAYb
	X+ezloB1ksRQHOsMNyHz5Vnv7FWGwo2U5zhbpMRboee/s74Hwr2vLxKLtNpNiCrT
	Mm3Etp3mcLFgQm/cutSKwy4bdJMdSFvXeUfUaFO81J4vXN4Q1h/mWH/xZ37iAx+P
	1lU4wYa1BKNWPCFYs01gfFvmMeqfv0Kcm5XIlZcsfXxPhhcsmlPgTu3e+luGRoGw
	Y/ZHd2NqrlID3+RqWeiije33R6WB4XMYQgd0gNA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:QUCw6nHb/ESRMlEU+4iCUgaybt4lsW+WIT1tNwjwXlo=:laoGVPMLf2LRqPKwP6T2FlWgv2jsQM2NXAuJVqlbhm0=;
X-ME-Sender: <xms:UtD3atyx9XcV4JYgGux7RZ5m5aXt6dzTZWkZTG_gvhVC_2ZnLZDmxA>
    <xme:UtD3apvjx3P719V9fqo8RTvhBCXY_kJC8aIEZc9n16Pjxei8zJ_Pqq7ON6tf7Ks5W
    iMajoKTfXFHIwWIEV2MqiKnOOPaOg4-XRUWKsCy2Q-_yk1FnjOK0_c>
X-ME-Received: <xmr:UtD3aul1WypVUr3XzWXUVL_o_sxMkuBW19nixzbEBAow5F_Nlx6IHd_gXqK3VGs1nUXzVCCK>
X-ME-Proxy-Cause: dmFkZTENh3Cq6bNtRDDqH//naJpK03OGhXB8Cp3eHHX2EpHYf2oBjZ1/43ruyqVDLzR5bI
    q7gV+k53czH7SJj0JMNaMvWBGkaUqaereb01ifHpul1q14DobEKJC2mDvQQE3HzqoOU9gl
    QO0UnCSJOnNpWmY1qWdj/IivEZ+5eJmA8XcRYmqsfPBSZaKqk9zCnQvCGUQuYFJdsYZGP5
    L8zECb373LU+oefpY9jKwOjkFDiU4CWxV3iExHL3zPnpeZwM1wkFJxhm/yJk+2AJ3ju4OO
    RXCknd9xSS299sQU1FiikwzYfEAyF9m0XTBIDoIn2qfRRJDU3uzKkImCFIAQPMS5Q++UrR
    WNEsUDtSeFBcBLt71bjQrvXXjb3WFgLUhsbvDWF80ZOJvDja3u+zakrCtyEU1urx1F6ck1
    6F+8USBSfsd0wejYoVC9t8qjupZOwoSsBjG3q0ewwaUG6VRRZ/oDrWvdfAbQNuabm9mzH8
    /BL5Nw2T3bIFzu3ItLq4PVCVIvnchLyuy57qeQrNb6X6qS/noci8K9DlljvDG7eMCy7Tna
    SeoXVIQOlFrSqDLv5yt63f6wvnCWhk0p0PcEA6IH5GcynMFezoctP1nehgj7tijUh2aAd+
    zczBCZ6zuHNG0zlVYh+D7cfW9NSI/FTr55zdEGblHoHReNCLIkjVHMJT0cpQ
X-ME-Proxy: <xmx:UtD3amCmAbO9I8j2oAWINT2bwsq7fUcrVKwzS8WyHgSNlish6endgQ>
    <xmx:UtD3avR7kadzBjo9OlY1hqWr7NVniMScNrXwQa-tNPAt60dVPqws-w>
    <xmx:UtD3auL1vkGOR792CIpfzNyS5GxJBxgt667RCKfbg_BqWB53LaqAZQ>
    <xmx:UtD3ag2ycQzQWCpTODyfrBed_NBZ3DS5bwaGccWr7ZxbVmJsuMsMvg>
    <xmx:UtD3amG1kHLPu0HQitsT2mvQOhQQflP7JmDKsHnMJgwo76z463zfT6fr>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Nov 2026 22:06:49 -0500 (EST)
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
Subject: [PATCH v17 07/12] dt-bindings: iommu: rockchip: describe the RK3576 NPU MMU
Date: Sat, 14 Nov 2026 16:05:24 +1300
Message-ID: <f2e91cd17bab66e4fd8901704c89ce0d717cff18.1794615323.git.gahing@gahingwoo.com>
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

The RK3576 NPU IOMMU is compatible with rk3568-iommu but needs four
clocks: aclk, iface and the two CBUF clocks.

Measured: with only aclk and iface, the IOMMU reset fails and the NPU does
not probe. Without either one of the CBUF clocks it fails as well, and one
of those configurations does not even boot.

With all four clocks the IOMMU works, and the npu clock is not needed.

rk_iommu enables every clock listed in the device tree (841363ebb508), so
this list decides whether the IOMMU can reset.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/iommu/rockchip,iommu.yaml        | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
index 6ce41d11ff5e..e40c9ac2b463 100644
--- a/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/rockchip,iommu.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - rockchip,rk3576-iommu
+              - rockchip,rk3576-npu-iommu
               - rockchip,rk3588-iommu
           - const: rockchip,rk3568-iommu
 
@@ -42,14 +43,20 @@ properties:
     minItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Core clock
       - description: Interface clock
+      - description: Convolution buffer core clock
+      - description: Convolution buffer interface clock
 
   clock-names:
+    minItems: 2
     items:
       - const: aclk
       - const: iface
+      - const: aclk_cbuf
+      - const: hclk_cbuf
 
   "#iommu-cells":
     const: 0
@@ -72,6 +79,25 @@ required:
   - clock-names
   - "#iommu-cells"
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: rockchip,rk3576-npu-iommu
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+    else:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
-- 
2.43.0

