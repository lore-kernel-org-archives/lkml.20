Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9357441443F;
	Mon, 14 Sep 2026 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375266; cv=none; b=skl1pIrTJDtsXXVjmmFqDjUX3M909S5nSaeBYwl+ten37A4A2zouu/vbk+lJiVsnGMXKI0ow/1tt7Xhl0SwF3avjvDlRZd3oOAWWZ2VlyuO+Y8aw5+2Q7EWKPV7x5YYPug+KpWkHEW3r29qk1OA6jl7vuME33Me46q+7xtphawI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375266; c=relaxed/simple;
	bh=Kl4BqSpbf9kZBomKYU6+DuNDNx65y0P55uZAFar9yNk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stPVkv4YjO8baLvG49NIIUZd0RIFosNYwab6Zvhxvgx3CdYNLF5EXLQYTVvg2Im0br5ctpvc7xFUQSuf1ATd7Cd4xSFjBHtgoO58zp5/4wXq+/mDYKgRjIP/g/P7lKzgoarlCfef+XIMHbwe+JFjHyXTM0aTH12udIjVTZlEx9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=De06MiKw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=R7Y3zTxC; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="De06MiKw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="R7Y3zTxC"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id E6A49140009E;
	Mon, 14 Sep 2026 04:40:57 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 14 Sep 2026 04:40:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1789375257;
	 x=1789461657; bh=CLi5z8YBcWqnU2ceRM7Yd8tzXqpUUOKntz+Aw5cnEjg=; b=
	De06MiKwRClscnF+yyR/zxKqm98yD0JGfOfdbOLwnoS2xM5azZSInt2C5dMEUC/+
	L0h0/s2o9vA2xx6imqC6pkDfPvw9aF5UcW5iZrLu1uwYD63eN8HzB3YmSF84tcn1
	rjso1WbSo7ypHBht86I80Bqv6Nrru2M26wrKre0wk8IFOBKj3rwva4Pi+27gm5V2
	/I5KudHxLqQX26gA0NWyb90DOVozOPSnr7BtQDibzEwlPuq+82ozTAGVLNIS/WVc
	j23mwbkbHRv7z3q15+LIJc2FnLVqk8bNCxGmhfLtlQJzCDg38qFVmuTVbY82Opeq
	Q7kFpgLoDMpkTPG2Vt7srA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1789375257; x=
	1789461657; bh=CLi5z8YBcWqnU2ceRM7Yd8tzXqpUUOKntz+Aw5cnEjg=; b=R
	7Y3zTxC7MwZRIZyJjjXXFMVPohV4VRbr8lby40VUsUMxAyferWairLoLPScH9NpM
	GJamx/3525C9JBOzK6ArBJYk6yHtdBv9mvrvz4ft9fGlwCYO5bi/1RaNssSnyAp2
	LwfRagT/m+aUh5XxjBQmAD2jPTabtF8ol6suCST1veFMMYye39EKAjoNDKvql8Wy
	YtJs/stDkxYp1Yj+PXe7D0vCvkRWw1VocY9eNF3Ktl6olPPG1SrDDce5Jr/OouW7
	A7IPAyZFF7GTi2HIKON9LBqmDGW9NVF4aQSDUcUEOSZqSsVC4pysztk21xFtlxJY
	y3LvZuK6h2Z5IMzJ+EDOA==
X-ME-Sender: <xms:GbOnarRXoFvkkdzGV1IM3o1F36bTzhgjyeIdYyCwzh_suWkihQtNwQ>
    <xme:GbOnasfRe42V4sX6ofVrafDlY3--ipmjDeKw9Bso5wdvkmV6_e29hgovJ08xJhx8U
    ut6-mHHlrofmq3lNG7rl3AkDQFalDO5Qs7MnhA515f7r9ZtEgBCHu9z>
X-ME-Received: <xmr:GbOnasehHdRrOYQp6a7O2MlUujzwBuZZeK-loLqtrXxMqS7JlEarZcLz5E7SJMkr2fFqyORHtnlOGUPdrhmVChdMrCB6Ir3nVJ8uBQ>
X-ME-Proxy-Cause: dmFkZTEDLHr0shzxwhX+29bUrq2gfJ1+uzQ4b4gKQs3bZHRMEcVi5+3e+WWMmXn4weJHF0
    3tXMcFWQblGPPDQI4M9zHrzHMMgs0LXrEWCtY0HOKPhWUiTU65Hq4BSITitLFMR/nfR54A
    QBr3yt2+EqSebK505dZuX4BQiJBC2YrhM1cKA3YLwTBOhpwZfcQEF5yaMpHRvipvp5nbhM
    qXqI61aj3JPw2SHELjXQTGsoBh2Y/LuJTzIJZd7IArzAR6+91M7O+W1wr1s1KNxWnuZkuF
    hsZ8YwXBQsE0gAiTRFJnmiV46ucM1Ygc8cn9Pw17HkJ3S5rNQ8lRntZ8AGSg3kYW6wJPSV
    OeiSFc2h4OgseGDTZyRE0V7vPoLh4oDzpY8OT2bk+UZ9o9qNHUtT4GcEkKOjFrnn0Hyjw4
    e4a3zdxRDZlIqL4xhaot0eP+xiVP+EG+FZv3Rhn2mXeWU8TL0MKiP1udhjLfpJYtqQQhH4
    PsbOzLChgfnIeBB0gB+nd3+0xZCWOgcNNLmbsN5NEtSJg2wpC9A8371pXg/7ndy7XROzpY
    YoAr3rJwuoFdO/dEOtS2J4kVm2pMf5YgQqKkdIpHIZnOQMjTu6Cf3MPuCuZNfuFoH1Qb3k
    HY66NvfYz6oz9km/+nouXQ9e3aMR55NYj8fVESHhFK4p1NnB9L3ejNDm2SmA
X-ME-Proxy: <xmx:GbOnam3vuJyXF0PpDtc8sd5fsLPU_Y5e77lZ7DIbhgmhuUAqZQfBIw>
    <xmx:GbOnak-yOhdndORqQm7zqiey9Fj4_hgiFGR7BsMiAqxuMfpIEccxgA>
    <xmx:GbOnar4A0FKluapTVcp7It6VCsOXI7jcei6MZCuS09AlRyLJfvsXXw>
    <xmx:GbOnastvlFO3QoVP-2HqqQ9ywcGlIwpurj87KS9zPDn3rx8tTFvcBQ>
    <xmx:GbOnaiuT-TU4Zo_6N3C_pSU8wRr7YyHvM_Cxv5c6qpzVQgWbBYj4nYK8>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 14 Sep 2026 04:40:57 -0400 (EDT)
From: Janne Grunau <j@jannau.net>
Date: Mon, 14 Sep 2026 10:40:41 +0200
Subject: [PATCH v2 11/13] arm64: dts: apple: t6032-j575d: Remove unused
 "framebuffer0" label
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-apple-dts-m3-dt-style-check-v2-11-e3e89c33f562@jannau.net>
References: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
In-Reply-To: <20260914-apple-dts-m3-dt-style-check-v2-0-e3e89c33f562@jannau.net>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=j@jannau.net; s=yk2025;
 h=from:subject:message-id; bh=Kl4BqSpbf9kZBomKYU6+DuNDNx65y0P55uZAFar9yNk=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhqzlm1mOF16s8T24t0N6q7hxiEnZI7WQwIeKjUpL/FZZG
 HxpFzjVUcrCIMbFICumyJKk/bKDYXWNYkztgzCYOaxMIEMYuDgFYCK9uxkZZh1/efRaHOMX9Zag
 JVFNcYyBHwxOZcr4cMmcsnmeycA3nZHhxs0zwjeYkub2n7e7nqvQ/D+Bb4/sx52i0vGZbRlLH7/
 kAwA=
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419

Fixes "[unused-labels] label 'framebuffer0' defined but never
&-referenced" dt-check-style strict mode warning.

Signed-off-by: Janne Grunau <j@jannau.net>
---
 arch/arm64/boot/dts/apple/t6032-j575d.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/apple/t6032-j575d.dts b/arch/arm64/boot/dts/apple/t6032-j575d.dts
index 1c4a0fc9bd6f..e83fdb5d8c86 100644
--- a/arch/arm64/boot/dts/apple/t6032-j575d.dts
+++ b/arch/arm64/boot/dts/apple/t6032-j575d.dts
@@ -26,7 +26,7 @@ chosen {
 
 		stdout-path = "serial0";
 
-		framebuffer0: framebuffer@0 {
+		framebuffer@0 {
 			compatible = "apple,simple-framebuffer", "simple-framebuffer";
 			reg = <0 0 0 0>; /* To be filled by loader */
 			/* Format properties will be added by loader */

-- 
2.55.0

