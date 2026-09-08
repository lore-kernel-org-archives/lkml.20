Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D3D57D20E;
	Tue,  8 Sep 2026 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788885003; cv=pass; b=CwVSYx1LxloHD0TqqQveDpQQ+Gqbnu46YpdAbxOm6UWZ9U2Fcv6itjX0cVJfg1u3sa6LnldjDJXFYooptYehthtBTjJGzR5pa2UZpGp/sQVC0UL1GYozNqZAWT8jKpzWch+ZmS+osaHjuDsOpbpW9pszDdxCzXrz90PHpLPVWxs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788885003; c=relaxed/simple;
	bh=M8l1jtPedX+yuhMxau3fhuR9JMGYtb7SfMQHVR7q9mA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k3q615WzWhFI/qbBsoB22qrIFJRgcn0+KgwCm4w4BMU9Fy+zj+TgQ348hPM4f9grWPPrwAMMbwvNI1Bx6h1uGVxHin1BHTkZBnpHFipNxDKLcISo3kX9YJKRS0bjAn6PvMFOxyvJffetO1DhgP0RQ4MvWrMop/avW1I+bh7+H/M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech; spf=pass smtp.mailfrom=pigmoral.tech; dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b=JCiT73TT; arc=pass smtp.client-ip=165.173.180.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pigmoral.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=pigmoral.tech header.i=junhui.liu@pigmoral.tech header.b="JCiT73TT"
ARC-Seal: i=1; a=rsa-sha256; t=1788884967; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YAojYMrh1mpl0OZTQQhhqUnrlVmeCG4cyIryNGIh9qW5JsV5rPljoOPSbkKhhJry/dmOdOMtGUEBiTvOOGGlPT02ChA7PHH5OhqPx2yu3ay99yjEQHXYICUFxY5spJmC5VQ+pWrAam8gjN6dEJiwW1MeDGF+q5bxeLYfP5Wqy2Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788884967; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DQoiqW8LFnr/Ma1L6Fqh+4FwBViHty6yiwi8fLlKFtA=; 
	b=QhsOpGixvLTuY/6tpLK0BzF+qbLiRMRs9TunsHCK36l5V22zjDLCqPehSntR+TP+bNx+t9u3dTK0N/jChcP1hK/35lsx30aBWWXTshXtlRe/47dMnMT0WZ6j9qncdpNPI5gSpQrhZbDldQrXXTD7bj5IQLa6cG1xJAc24S0eLhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788884967;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DQoiqW8LFnr/Ma1L6Fqh+4FwBViHty6yiwi8fLlKFtA=;
	b=JCiT73TTj/Yf80fzBNIf10ZoDV29mLiYy9+zofsBc8UdMH3YpCbpiJSd15xUVyiS
	JKKfz/MOG70NiUQOHDa8ERLeo63Ht4OcoZKPi/3PTM2YvrUbaw/tv/NVb/TJ1kEOCCn
	GW6Ui2jcE7tgJIgoFCsGez4LdGGsmYx89u4RD6t0=
Received: by mx.zohomail.com with SMTPS id 1788884965681902.6763923374004;
	Tue, 8 Sep 2026 09:29:25 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Wed, 09 Sep 2026 00:28:44 +0800
Subject: [PATCH v2 1/6] dt-bindings: timer: thead,c900-aclint-mtimer: Add
 SpacemiT K3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-k3-aclint-v2-1-7931e5bc86ad@pigmoral.tech>
References: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
In-Reply-To: <20260909-k3-aclint-v2-0-7931e5bc86ad@pigmoral.tech>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Inochi Amaoto <inochiama@outlook.com>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
 Guodong Xu <docular.xu@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=M8l1jtPedX+yuhMxau3fhuR9JMGYtb7SfMQHVR7q9mA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLIWmB/s6nji5DQ7tTEuom3enfonLRstKlgDfoQG3Sq+Z
 feds0+3o5SFQYyLQVZMkYXLX/yftQ7PtyMCrfdh5rAygQxh4OIUgIkkCTIynGQwMHp/TPS4weqM
 uz0MAotPuy/qPBwqctBo3/0I8YkfOBj+mQZVLakrffbkQPnBG/87WDk0fLm8lyzXPhX/6iPjlc3
 qXAA=
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External

Add support for the SpacemiT K3 ACLINT MTIMER, which provides per-hart
timer interrupts in Machine mode.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index cf7c82e980f6..082378b04d72 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - const: spacemit,k3-aclint-mtimer
       - items:
           - enum:
               - sophgo,sg2042-aclint-mtimer

-- 
2.55.0

