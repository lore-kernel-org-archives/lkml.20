Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794774013;
	b=CXdLSrD8DTPXH6BTqpxey1VnnvLQyXQ0z9v+i1IR+dxhyu7eznTGOKlVzo85sm0DzV3i
	 RJMYC0Xc6LLS3HiD0K5kFGbuI/iPG2WCn8kbfFCK4gZODUCcQqtacxiiS5WwHLpmLicaH
	 lT/0brnPowcwMeDxoB3fQKvep/iXy+J7AavQgWHSzSAa+OsWZoNdJ25QHOkucFrLNnjnY
	 0gcvt1+LWKbRlYnWNI0zqbV9407163KkF/9Afs7TatbxUlCNT6LqWZCKGC3iigwqNXTz4
	 bMyGhg6PvRvVgXsksiAYPiZKvDaPz1xrN1oSOxGbpghtAQsnHB0cvJcIUMYdDOeWapg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794774013;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q18YCbfu544Crn/GSSjIVVbcg8KNU2EannQ1gWTLWJ8=;
	b=gvCa0KI3QO9qP0lYty030V5zuvYVXTT3SBs5fWovoftKAKfsbRkp/iTBKaTaTx8Cs47D
	 rqXM1JK35Hir2dOv0e+dB7DnyLwqR4YLgkoq7YG43XoVmClXM+1evdk4qVnqnCHR5phzW
	 E0YhjqUq6Oyc7M0DteJYbxV3srv7Ak1IuRSAW/MjmHQFIsOxuUe6XN8HDvQD2fGzyvswO
	 8ZDtoSX5ClfIlNU9BhRGuMILWiOAwYD7f0mJTC+0oqbEKfVsXlcW2d460K3ylqA0OBfym
	 8bzwMJI7RwHCBc27kFn039kI//VRceBb3+gfKuGY0S0H4M7Gn99hxotOamVpGMv99ZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTUiwliS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC4C606A8B9;
	Sun, 15 Nov 2026 20:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RTUiwliS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794774013;
	b=AwgM054Bm2YP/N5asmx595W19nCxPGBRk6/YbLXqSdnkmeyRF9z8Y1Gi1vysNgEnqQez
	 99Ie9Bs/QHh1zlq/tVszfMzoVBKow/PKeua+SEgHiTSXPzV5sIpcbHt9mmXcq9Six6Mz4
	 hikS+ZYnXbj/HDMBO4TCLydCexHt2WVgJ0xrEerw2hBmNOdZm2bTZV3RSpmZnNVgK7aUE
	 WCdm0G55OUwrAoXUi/CQi0xG5HhCHbHquFNXTTasn1+i8WMPbZledgTNfJ98sk+x1MA5v
	 Ni4VGvzZgVyPCqGIippFATFutkgcH5DXQ3HGCwbMv3DhR9KPhK54EBeUT1FWUuWhXYg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794774013;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Q18YCbfu544Crn/GSSjIVVbcg8KNU2EannQ1gWTLWJ8=;
	b=kGgK7SargDEnE4nWV25F9eIaauB+bN+2FRCZgmxXcQ89+mnfUpk+msq31iE4btRG0xRf
	 WLmQjX7zy4LQeXvSceZXt/JNkAcD2tLMkpTM/YRvS4wHHOsn3UBzoz/Bluu0NhSRV9BQ9
	 CXMZ0IRpVuHP3oyjpjPe8DUVIY2AtXeGfIYjvIiJ8kEF96mqYQEDfK3Ae/ZXTQ9jbZfjC
	 4t+5QNfMbC39SqqMcWh4qW1xizrKtIMl28zhJOnSyF5vR8ymvlyEzuV3GQx5xY8fjEJV/
	 fjvfHXOnQPXBJ8lYbwRvS7FxPChFYSj7Jn+KmqCvUTVbQC/9CCAUnoeI+6NuNLl0Qbw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CE7541F000C9;
	Sun, 15 Nov 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794774013;
	bh=Q18YCbfu544Crn/GSSjIVVbcg8KNU2EannQ1gWTLWJ8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RTUiwliSXwT9i4U1drgAAvbUO0rjyFp5t/mFcTP9WtgjOOFeNzhjKQT6IVNYst5zf
	 xId/DW604JbuZykXJW30QZdQAsa/0ozSm9pQAc2U/EtE8gAEzSjtecLb4ZPFlq56FM
	 6xRIntvJfVnwe9qxq3Ak/hKy1duq1BagvE9Wnu4Enh9++3ji0pgvpoRXsi3tdTA/z1
	 QldOkTIJQmkf2R6IUJiyWiGwpB/OzgVNe+4MYGYKL1W0v8rYHEiA9QHIB93l0ED9+e
	 Pyol2juDfACVY4O09Ae1rlck/grlrFjrxyIHu+hBHes45qo2dSpdmW5IlVGlUfHim6
	 BC76BKFhqmtwA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A81EB4A1BB;
	Sun, 15 Nov 2026 20:20:10 +0000 (UTC)
From: Venkat Yadlapati via B4 Relay <devnull+venkat.yadlapati.yahoo.com@kernel.org>
Date: Mon, 16 Nov 2026 01:50:14 +0530
Subject: [PATCH 06/11] dt-bindings: arm: qcom-soc: Extend pattern for
 Molokai
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
Message-Id: <20261116-molokai-soc-v1-6-3b2ee920fa3b@yahoo.com>
References: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
In-Reply-To: <20261116-molokai-soc-v1-0-3b2ee920fa3b@yahoo.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Venkat Yadlapati <venkat.yadlapati@yahoo.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794774008; l=1603;
 i=venkat.yadlapati@yahoo.com; s=20261023; h=from:subject:message-id;
 bh=QHvLPvLiJ1Dqr/RV/17J5wVpaE4qTvD/h/kXrfk+9/c=;
 b=qcFtbPr0LZVm38jgETflYyLc/JSyVzqpiy+8mn0jMu08dxhHCudmcE1gHA5c6CnwqbRmQMg7P
 gbGmxQd8leKBscC/s4eDzXOk/pmgOUj+Gku6GiyQDOMnZiV2Y/ZgoOg
X-Developer-Key: i=venkat.yadlapati@yahoo.com; a=ed25519;
 pk=e8KStCtEMvUP1Se/riB/KVnDAQFEVR2Dw2PcuA8/eME=
X-Endpoint-Received: by B4 Relay for venkat.yadlapati@yahoo.com/20261023
 with auth_id=1303
X-Original-From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
Reply-To: venkat.yadlapati@yahoo.com
Content-Transfer-Encoding: 7bit

From: Venkat Yadlapati <venkat.yadlapati@yahoo.com>

Add the Molokai (SM8845) codename to the patterns of SoC compatibles.

An LLM was used to help write this commit message.

Signed-off-by: Venkat Yadlapati <venkat.yadlapati@yahoo.com>
---
 Documentation/devicetree/bindings/arm/qcom-soc.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
index 179aadc86a9f..19904e5bc947 100644
--- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
@@ -30,7 +30,7 @@ select:
       contains:
         oneOf:
           - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
-          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra).*$"
+          - pattern: "^qcom,.*(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|molokai|nord|shikra).*$"
   required:
     - compatible
 
@@ -42,7 +42,7 @@ properties:
         - pattern: "^qcom,(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$"
         - pattern: "^qcom,sar[0-9]+[a-z]?-.*$"
         - pattern: "^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$"
-        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|nord|shikra)-.+$"
+        - pattern: "^qcom,(eliza|kaanapali|kuno|glymur|hawi|mahua|maili|milos|molokai|nord|shikra)-.+$"
 
         # Legacy namings - variations of existing patterns/compatibles are OK,
         # but do not add completely new entries to these:

-- 
2.56.0


