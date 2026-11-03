Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718700;
	b=l9SooFjaDnWq2+EHlDP0Qy1pLm3yJbeLJ1/CbjlzcahMx0tGXVp0N40qngv/nBmyOqSy
	 qtc5lunnB9AbhcEl4wfZ0haPIE7wIV7BSTdaTNmzwETxciMTeMaSu0FAq7VPyZU127OLF
	 eKI87IjEk0TObFGn3OAR1z8JR4AVUebvt2gzoaeLxsnRiek2mY3kILPuAGZviearL/kJZ
	 FgvVXDB5snRCrvvLLECgUjBW8Tem38YagFPotCIQRsAugD6M/wmKOetuvw6f6h4QvnJ6r
	 vQf41sdfMuGP1l0DzBQKYCWhC8H14GtmTYXME3quti1pzq84VMuaFGmTxmHb5rLsDCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718700;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZhxFxQVBSsCCwVBEhg/3TJFmkdSch9FDXhPkOUs2eeI=;
	b=uD/mudPW/cQKOXQAqtvGH9GGQiJT1FsG8G8ef6aYyfZBfaHzUsNj0w8TtvBL62hw0bTk
	 xgQMwSziTLx2YTPzIb1Yu6nzS7yHkYpWRjQ3qaT6NZUuRz9IHXrFZHIaGNg8leOLd/ADT
	 n55OH2ej0Cju0AOSq2kAhFTCWmlexVJbBgab3htcThytqJlyLAFOa7a62gHZ9H1Dhkd8r
	 aNR2Se6z4WKsqveklVWbwHjEJJjyEr6MB8/HeO8024iuYQbTQsW2Ogs7jUOxw3qgjrmVc
	 Ng713Gbrhi1DrQLGGMahJF96MQFKfH2NtaCzmTCN7mG80hgrYh0DmSiCvTQkthR0mfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aroiUfdQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B5606D808;
	Tue,  3 Nov 2026 15:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aroiUfdQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718699;
	b=juVuWjLOt4jvxADm1maD6JxsJCkHX0r2yPefw43Dj5gOK7fvyGtADx+uF8l4w7A7OQ/k
	 XP1dyFPOky8AUI3f5YGZoYOkMqE1cbCNOfeMCgmluRCSIClTRl8HIBjHYyF95O0FBhCs3
	 Jj/ww48oK55rqM3h4db3IuPnodG55xJs2MAVPMhuQcUjNAkD5rXdnIH/cWPA5vKBJ0qaS
	 VVN9BG6AUrdrvSGIcMdFIKWzw1hGAEjvCPIGIm/k/xKXNus8E9N26iUSnTy7ph3F+xNPX
	 +Wqegr3z+N+Ww1PE+DzLXCnkK9tdzV5s4KL4QedXMY5HjiMP6BkqfJtIblNFwjfAf3w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718699;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ZhxFxQVBSsCCwVBEhg/3TJFmkdSch9FDXhPkOUs2eeI=;
	b=JMxP//A8KHhilrdT6yrGIQ5bbWgcgIhx8Opbp9PHF2zL+UKUuqTVbdf4KQHias+jhMu9
	 p+FG2fAT1fHA+by5cfX8rCTLOBBmj5OBJeB0+tBq39Nya/09+9qI2rkc/7f8ZeKpQpe4n
	 NIxQe6F7V0N5fgXMhCi0+sCLLy32e7756+4yVjcWB8PpyLKZAID/XP+LPST0Ul52o6h7G
	 VDep6KBIdhr0kKY1BaVNltWnygQyR4JD9oVPN09phqxjEyr2XxMPh/BJJFdyqPVd9HcqX
	 O2NaM9vwKsuBpVTSlRsH/DxkQNdInEAwJ6F4bESTp6a4kWIVX17twhgxLHdstlXLrhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 813AE1F00A15;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718699;
	bh=ZhxFxQVBSsCCwVBEhg/3TJFmkdSch9FDXhPkOUs2eeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aroiUfdQyYT9DP9COsC6ePlxaS/u60SEiMPafuYZcpvZTYK0virRvLj3SZqp2IP34
	 MlQzxvVeTUV9YEE0zz72JrHpUsWsD/cEtMCGMHT97oiAx4xJUpnG4mJj90KQGcKIfY
	 mC/7U/cQ6PkjnBfUppNyfoGwwRL//92dO9N4sJjkEdUU0GT9sh888F8+YORcl72uUQ
	 i25MpPbCVtoYIIMup1x1YQlBgZTIXf3ALIK8iT1Q6arNPP1GOxVASKtMeN9IbGubHj
	 0wV5XhXTez27Hlj84sPq9L/HAbXpetaFOv47qaahGOlEN6xA7COiHcRKb+ZtAo+uZy
	 iVPF4BMu9yIQg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E89F0469C6;
	Tue,  3 Nov 2026 15:11:35 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:26 +0100
Subject: [PATCH v2 2/8] dt-bindings: riscv: cpus: add gf,mips-p8700
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
Message-Id: <20261103-p8700-dts-v2-2-3ac5d49f2c37@htecgroup.com>
References: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
In-Reply-To: <20261103-p8700-dts-v2-0-3ac5d49f2c37@htecgroup.com>
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
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=791;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=9r+1zOKPzU+i4ZT8EB9T5a+EqeMioNWwz2te9YRWjxc=;
 b=+BnhWHkCTSsdtLXP13Ak/Ol9NEC55TjJ/xC9Uk3KZQb8Z2yNgjZsLYhToj/zwDsME5s9L70aH
 b5RbdLs5bNvDiKC7c/OxSdJE4ODCFPTigCot+Y2CJwjAXAKaST1oCX2
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

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


