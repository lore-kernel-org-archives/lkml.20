Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EF63F54AA;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886890; cv=none; b=pjNfM7MzDvggD1k07mwXWL1YtSIe+OGNY7mz1aMVPcZ2KAsz92mVgVbzPPw8jKdUpnhImzWrTPTbqlHjqV7Fde4LrVfBQxg57X+kfKWncBSUh2Kjfg7nbtxhJts+UGsZdtF76w5oqGpIV0DmQrHE0VqGqDYaW4mBvrIrH2TE0TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886890; c=relaxed/simple;
	bh=jx8p4XoDCEmHkARz3LvR8mZjbN2RulpuK3cx8pTILlM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TcJSSkoO8zRozpFjDGkC9DryjHXtF1ov/xg53/pdzy6V0ErxX/xj3/hrRcMl5L2RcDYrxnLmjJaxsxVpHGzNwXAygE8+cf3Xiplm7n6APfoHW7SnR4Mh4bAvd+YEHTdXzbcj7tGFQqsog5eiXUX8F206WjrYGz5KglltNkY2CLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t7YenWE9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t7YenWE9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84D11C2BCFC;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791886889;
	bh=jx8p4XoDCEmHkARz3LvR8mZjbN2RulpuK3cx8pTILlM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t7YenWE92FMIQ4VQUMSN5L5QxaILOS+fxuCMBT1MJjvxptONuuiqsUMu0gihFC4zs
	 oMeDw2w0sqmwY68kJiRvEdLxLBoNeUBvBDO9NiIfxIqAZQWyxhugsGy+T8nTNIvarb
	 lcEUF5AJBO1bstgDYn8AYX3QMluvaRvtWbHtBhbMy5E46E2w/6reHkC89LWhdCMJD5
	 JA7MKWL0M3kyt7BdE+t1fm2JvFlZAm5Zfd1WX1mt5m7aNrDK5bC4eSHZXOQgxmKKVM
	 SGErW2Qyd0cDkDBEIRRlYIMdBm2uekh3KnQsN5L170ZSb7ySlqTcGot7iLApX5LdlE
	 0BYdCC2468D5w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8A3CC6B08;
	Tue, 13 Oct 2026 10:21:29 +0000 (UTC)
From: Xincheng Ji via B4 Relay <devnull+jixincheng.ultrarisc.com@kernel.org>
Date: Tue, 13 Oct 2026 18:21:25 +0800
Subject: [PATCH v3 1/7] dt-bindings: vendor-prefixes: Add shenrongda
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-ultrarisc-dts-v3-1-5ff3ebb2a90d@ultrarisc.com>
References: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
In-Reply-To: <20261013-ultrarisc-dts-v3-0-5ff3ebb2a90d@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886887; l=887;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=e/Kow+cCHmWBpSOP+t1oxwgy4BH4snNIyYRmuufij+E=;
 b=TRORa6LLEVVhsPFQIeIlJSap7J/c48iovxTaryjjkuBOCTGBfHJvNfB0d4DESPRzu6GvpOsXr
 gnkDkNgA0bVBSFoxkqFSK0T+Ltkdorl0jMvMapaAYMeHxhv2Dlh96pq
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


