Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAB947668C;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394166; cv=none; b=fyBythX7Sf3nxlLHqCPiNrBQefORwC/L03q8v/2fL1o+NcxZc1eZp/MJQj5c2OHSo4a7ecrfEoCITx9DR/GtuYoulYw5C2NnAqeka4S5gb4DHn51wxhHoldevhxKRLftlADpZc+Lu5fmVvVAncXj896ZkccOmJFpuToHAm6iN8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394166; c=relaxed/simple;
	bh=DM5y/tWXMbxpLh9TtMl1Y3EoywBhI86QLhi0kI9Cc50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DwNpMUinnGlR/arBK5PPn+jEE/ih1mhj1NEc3Aq7yX7hEBcQ+/HX/u82thHR27boU+bsJDKOPpSe3Duh3+ThJmiESCtccC7JxpQKJtFnv40uaZH6S5DUOHfQ7ozStsUb7YHKVAlfFKXpEbexr3BmFvgmR1OaNYQFEC9hX+16XDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggYTQR9E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggYTQR9E"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 733C3C2BCB8;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=DM5y/tWXMbxpLh9TtMl1Y3EoywBhI86QLhi0kI9Cc50=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ggYTQR9EB8YrNLS/OGrhlbSYaKfo4G3LpQTf5kMarFwFOQAKAKQ4QTXEnEjTCkjv/
	 ujm09Jp9n8SnM13EffpCy1WpMlu+LyPNXGJGOQ2t9s3VhbGAk0dOCufyG3VeAHyDXu
	 6s1jHTZsXaUGPE7Z6+/YrOdbsB+9S8K8Ue08ANR3lBB8b1jflpprFOpMBHHmcxwsHh
	 d8Cq2+L+LpCjFgJ9f8QG2fODM0q35A1ffY46+YLHrNeIszAENFBsJFimISvUogR75y
	 ztSfUCOSCidjy3Yg+w9eR4klD+nilpda66rTFgPzAM6Yrz217JDvrcYCiWX7uNMaCu
	 JErphVWHHOTPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E517C88E73;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:50 +0200
Subject: [PATCH 2/9] dt-bindings: riscv: cpus: add gf,mips-p8700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-p8700-dts-v1-2-3267f14ebce1@htecgroup.com>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
In-Reply-To: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Inochi Amaoto <inochiama@outlook.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=791;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9r+1zOKPzU+i4ZT8EB9T5a+EqeMioNWwz2te9YRWjxc=;
 b=qgNSzK3mbpWHykXXt3BoXSbAo4L8C3Xt7fmDL1EpdA2TahWkXO/lt8DoAQpwkGw5h7HwV5t6Y
 SyjhbPnzIX5D6TYrQYhGZOi+KYYTpxvqh5nta7qS3qkqObPIskLfNTH
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 compatible.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769767a9b7f41f179a3559ae7160d69..c7f1cf1db6eef5b25403d53bca7cffd9bc1f2240 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - gf,mips-p8700
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.43.0


