Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8F4471431;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394167; cv=none; b=oOlE5UMhNFUxFUuJ14jzeeWLK238x+Ov1Z++93qBlAAH6lgoSYimNi751fKp93bAjKhlEGA8OzHwSs3ha5c9Ghl6sE78CbgBG6YYtmWiAJbZMFYBtFD7b0Wf1VJ27CMrW037+e55UGyjpKQbysMfse3X0R/faxRYlQh9wZUIAHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394167; c=relaxed/simple;
	bh=NpwJIzzpHmKVMpGC8mQxI88Y9BcNMyyRRDBxtKSmyTw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IjBBQ7zUgDw8lSKSov6wuAb8S6NCyZcUY7Kva5rooYyLql9XcEflG+9ENqcw3d7Qbv89eubH04tAuUdJ1/MnQuvUu9UvIKLTbZla61FaUdxxCkX/xVvWSrztguLCUqV4mY37le1WnEGxSE5T66iOAoCOKj5xu+C/wuuBE9Jxr2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrE7F281; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrE7F281"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4533BC2BD05;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789394167;
	bh=NpwJIzzpHmKVMpGC8mQxI88Y9BcNMyyRRDBxtKSmyTw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UrE7F281X8zYPQ4AGzp0JkRCCEWh7E6YyJ4NgebLTtQAFIzfw27Wl15fbsUy0YM0x
	 VvjPzjbKDte0TAU27tqqq+g9nMt6r3Fu+Ax15PfOmtIXElRL4m6slxGDQDVyVj6XGy
	 B9Arfh0FDA9OuD4KkXwnR/ecjBsV+IcVuvzJqkqG8aQYBK9IdaljGwJyfRMwAWLeQA
	 pvEJeyUnKQ1uBv2CE7pE1twj5qe6rqDv/SLvIvGYhYfJD8CxmzbTNnoRl2In/luHSI
	 dgMoxcnTyQR8jr45AlJ2mIUDSY1h5gzGlPyxsHGhWmPaA6VFK45ifqe00CZzRcBfbo
	 PGo0u2To39+2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AF63C88E78;
	Mon, 14 Sep 2026 13:56:07 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 14 Sep 2026 15:55:57 +0200
Subject: [PATCH 9/9] riscv: defconfig: Enable GF SoCs
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-p8700-dts-v1-9-3267f14ebce1@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789394164; l=643;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=ckrLYxO/o55vtvQsoEYaC2ibzDfEj23B4ST0fzSv/OU=;
 b=6kklmDzo+zlV9/ocsf66KcL0PYcAytiTWmKOWykSPgWKwfy0umiG7jFG5AguVWOHwTewK8bLv
 VsnxyKh0KoBCTqTm0/kx/44MMpXtIYVOGx1dMpOmQSIAVS4sNqYnn1R
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Build the MIPS P8700 Boston dtb by default.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..eeac96a0ec878a2d0aa0887d7a7ce71207774a23 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -25,6 +25,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
+CONFIG_ARCH_GF=y
 CONFIG_ARCH_MICROCHIP=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y

-- 
2.43.0


