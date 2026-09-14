Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF11947668A;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394166; cv=none; b=SfnOSlY3UlmfSC7W2SNsZ4X1vPxa3aAjWQjZAyd43D9DRAf7k0zTOC/c4/2B75IPHl/cPjQ+6uUMEADv6+HpfQNSQgV04KxqsNMUQPzo0bIcaIunm4/pb5LmoNScFCVeIsBTIW4CGIpiWcbKuZ5zxiWbyTCyxbS+OarG2KvWJnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394166; c=relaxed/simple;
	bh=3k7OK2R+JVk95d7ZbSVMWT5kfSxhLAndrkjKot0fHlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DKY4Gu9QdDV5zzULTkPz7nStR1pJYq/ph2Kejo9ysuVn66D8+XyzNv0aF5z7Vu2O+4QmN1evKqlKMZYc/tM4fq/UU9hwSaVWq4JoNR5OUkUv0HbHdwV5MXzMJiJ/YQ+/IayZdoIu5bCFcYx/jykNnjoyLhj1Lbf7idFjNp5W2BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tis4FnoP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tis4FnoP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9615DC2BCFF;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=3k7OK2R+JVk95d7ZbSVMWT5kfSxhLAndrkjKot0fHlE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Tis4FnoPwmGzDWl7+x9cOfQX5taa5XYO1ESTvgIO6jAkQbVPx0sm+EIjflOEjtc7C
	 5zz6zAJQvlR9YHmGD0D5Kyom9Vg5/h7NpE8bEa/sm1EDmiul90ph6ONDUPrkUunpaW
	 5DmFredta5het18X0HCJVRo7UsH0f0hrSP0Uuj/I06w/kC12C8cOkQDx9yscP3OYMS
	 hEDPP0xtSCHnqxWtwnOwNBghhI8cU8CcsEmOiAuAlU5wbAg7eobjfHX88sZ9x6VJbk
	 bzGBv63HbseblgTzUWmG5YFSnoKMqllFP4CP8k9MdkNp2tt2KNSOfjM72Wjs0pjKgR
	 jJajRRTQ5pH8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D370C88E76;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:52 +0200
Subject: [PATCH 4/9] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-p8700-dts-v1-4-3267f14ebce1@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=863;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=2lms0SOqaM4I4/vPB5czylxQz+VKnxBbKrzIdfMCocU=;
 b=pdualmBvpCJ7AaExrS9EobaKfsRz+XEv3vjHXig1bgjTvpnVoFtIKBfJL8id//uMC7qRLjIRq
 2RyLMdwdAIOCjBrYn4r+E+CRop9zsquBz80f9jQWbwQ7zrWKJRynjSc
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aplic compatible for the MIPS P8700.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..9b986aa1a1c62316a1fd08fe535075111601b80e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - gf,mips-p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0


