Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05EE476694;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394166; cv=none; b=riQRfJV4LAMZG7y2PlTjRaSUmy9dVl+6mVEkclNlsRVD8o5KQSwzj3mM9GxZYHUm6LnJOOg3OvvuAPaVdLwTx8zCFfhMjq6ZbEDPy+3MpfvdO7Op3UgMSTdAnqSDa4bCU+H0CZq9NzmNEFqrzH7mTRTi6uBu9L+Mmz/BCxwMIZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394166; c=relaxed/simple;
	bh=rbaaGGhMrAyh1jjBRyB+/BhoJ6jMu3hnKZff+HdRTbI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aDlz69PkfwYH/1NjlO8e3z0/ENra9UP0laBYuSDbyYuQxrAVzM08EHvoDwapmkHodmfiIuAtY9JI7GR2SNoE008U2OJhtvSXqyqhGVFlbA1RvRv2gbvmJMnSOI8q9iv+SeG7nLbFky8nWjOgyXLvhaBkJP7xRXxzfQhF2BRNO+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8izxaG9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8izxaG9"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E638C2BCFD;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394166;
	bh=rbaaGGhMrAyh1jjBRyB+/BhoJ6jMu3hnKZff+HdRTbI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J8izxaG93y+ha1k5i3DeGVpjLSd9P4Fhj7k7touXj2kOvj5Z7ZQ0qYPVB58fUSb/j
	 thDR+ZE2y8D+gN7Xod552E8H34Vw4RbM7Ck1KqI2PRy8UVBJYVcqNL4TaOhVerZym1
	 DInh/f56kj7nIjF5MNZKkHqhejTkXMBbxl/zR/8mWGEH4GlyLfgwruQ2Gf0sVgNGx6
	 gKvp8/RHI9Njvib29eCzw9JSkD9T2zcL9vwQq0jhSlCiZWlrdYkOAEHQdTlljRsCbU
	 5XanB82m3Gzz9zg64spMiVYHhKauYSABfgWI34ZCo1egJGj8lGs5OmZcxLxMtb2qgB
	 cQLOtl+JT6b6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360BBC88E64;
	Mon, 14 Sep 2026 13:56:06 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:49 +0200
Subject: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=1295;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=kuKqE2k4y4LDyGnqtj3oO0/ZCuqCwkmJo6BCsnZGNKc=;
 b=hjpmDgpH5H6bTV89dWm4yNI88HSAplU0zTEId7wlyzbd/VMhq6uaQ2u8yUUYzc40tf7c4Kz0y
 xXEvOYrF6nDBw1qeZSmCkjFYHQl3ej6nBvKpLPIsSUETgROHWybFrtr
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

GlobalFoundries acquired MIPS. All MIPS RISC-V
compatibles should be labeled with the 'gf' prefix in the future.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373433b1f48118872c46cf7bcfff276..b699935f60b96b3cfbb9c6e8ce802fcbedc52c1b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -668,6 +668,8 @@ patternProperties:
     description: Genexis BV/AB
   "^geniatech,.*":
     description: Geniatech, Inc.
+  "^gf,.*":
+    description: GlobalFoundries, Inc.
   "^giantec,.*":
     description: Giantec Semiconductor, Inc.
   "^giantplus,.*":
@@ -1104,7 +1106,7 @@ patternProperties:
   "^minix,.*":
     description: MINIX Technology Ltd.
   "^mips,.*":
-    description: MIPS Technology (deprecated, use 'mti' or 'img')
+    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')
     deprecated: true
   "^miramems,.*":
     description: MiraMEMS Sensing Technology Co., Ltd.

-- 
2.43.0


