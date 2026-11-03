Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793718701;
	b=WYd+HEZZ0tqwbEiJLVIOn27OyA+it5hMKcLfuDJcQmT4xR7dexV3ho8bPUn6k4lF1bze
	 /EUR3SUK2XfDgufCo9UAzxvvOoP7bL/WsrwS1hE6MXga29pE4rFM9a0pLXPFXO2/LF0XP
	 6PAqyS/epu270E3znSffnuSht12wYFaTX/nkGAE+mP+pg7SAuRUbS2Bc5HtQzzDL57LRy
	 I4YioZeirZ/GL67OOjBXydXr3PROR/+9VVksm1WbaSdDDamgu2K5sMthuh0hoFB7Hw5Eo
	 HJ1HWjvnW8l9/7xvPaPRG4/InV1RJpmBqYXb6xNnV1qh6dfxGspjEJtQRwoc1s9gnUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718701;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XgSfrsyvan1FViNmItpL4l8DJ0Qvyo/ol/rEbF1nd08=;
	b=a86/UHwc01WgJ9MG9iVeQGNqvugSixE29V3RQsey+HHd60kOmHnmUND5fWQ3+0NYD5B8
	 wL1wEQfdg3nIvLDeN1bmxGV4SpUgWyht9biTi2RWuZD4HN+eYM8te3xIX5e+5IGhUVtan
	 LzuFHjD9D7rjcgAmumEud+8pM03QCbbUlYI66QT1KGn1XBQI3vTKanYGE4scxuNuRMDV6
	 Gr/Pez0kwubMqh49ac6xhdeO+4K7IMQU6EDrG/hh82s2FZt3CUyHczoEtxJDlyYrD4s0K
	 jzZy96UQp4vLK3T5OxpDkP7oAtjonJ38qvrp0eZzYmU/sGEnBJRtmOz22KRdi1oiIKA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLYmW+W2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E4E606A7A9;
	Tue,  3 Nov 2026 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hLYmW+W2
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793718700;
	b=et8sMJQ1SungBhg3O5+Q9NBrRY9Py5D+Hv6EOC3XifsYzzFD3gIjuVymx0PhGIT1uspi
	 YImzhSlyLag2vZCvd3Oz3nDPhPc0wxxwsvJWTgiSmJMx1R2ZDOZxx5dqPNia2VLIcmMpE
	 CAIUDOzNV7qZ3Orz7fMHjjNI0TFMKI+4kNRSjUQ8SeFhpNWd95e6G3kggm5+EvLiylg8N
	 3pISTtnZHvt2YMCCP5yQEOEUm5rjgrY7nJdjch9ydGEwJbqc4Jk0y9gWc4ZZvnRSeHlKv
	 p3h8LBZ4oeGyuK/rFbKBNfSGqRUbw3KzOnSfgm3ZYoYR665F0ZklvCzOa2dxCJDOQFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793718700;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XgSfrsyvan1FViNmItpL4l8DJ0Qvyo/ol/rEbF1nd08=;
	b=eKJhCbONExTBrrr5BLp3zYaLmAKaes98AZEiTJtyQnuZSID24Utvbk9csHvBZnYAFazz
	 39jUF0sLJJu0dXrBrs5YaGwe5clTlasRwPSl60gU18m9DS/eFUAtlLcjWBixz1jOK/3U1
	 5ozlkquU2jSP9uTP6pLLyLDOneQMO4hE1QOQF5NFxsfC9R3cmEeMtDeL/ylyezAgAJ+h+
	 rL8FIh5JzM/QNdArBzt1bS8YC2RqUqV5O1yBFgQ04e9AuE19tEPVhL32b3giz3Cth/dKF
	 dNXVCAh44/A5Yr7dluLLoW5oxZYo73Q6ImLrS1V7NwFInjdtqFhvSzutQr0+8qZ3uEg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D53881F0157C;
	Tue,  3 Nov 2026 15:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793718700;
	bh=XgSfrsyvan1FViNmItpL4l8DJ0Qvyo/ol/rEbF1nd08=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hLYmW+W2abpNv0IjV/raw6tjjyw4XUX8sqzEGollsK80BNsB0MMlWz8sVxYhjxO8H
	 35Vov9GMuuPW/q7pjjs8YURIfCVj96ijr5aQooH7KfH7IbrXA05mM3kvxwH8BoX0PH
	 jPC/LdAndR0Azr9O4yrhLqmuzSulLIRndrp065kfwut0jGb3zxWeXZtp1oBBQTHzgu
	 7EaMm/DU1bcOxpnA7/2QntYpp2cTt5Th5cI+rzZrc/KT76kfTyyN0+MEwDSmA/Rqc1
	 P6v6WUDcs+kC2F3i+GEA2zB2i5JbcTXlgGLIRd7TOMFVqTITHR+a4GqqBgQZv6ZOxI
	 XBVMSzJE3B/3g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3F545469E2;
	Tue,  3 Nov 2026 15:11:36 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Tue, 03 Nov 2026 16:11:32 +0100
Subject: [PATCH v2 8/8] riscv: defconfig: Enable GF SoCs
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
Message-Id: <20261103-p8700-dts-v2-8-3ac5d49f2c37@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793718695; l=643;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=ckrLYxO/o55vtvQsoEYaC2ibzDfEj23B4ST0fzSv/OU=;
 b=hTkIO3hE3kFgdBuUaZrAZJMx5pFDQqSCeLyCOCu8TlpRaWKISnjw2OUOC4ztK6wmLh6Thea3s
 M5RwJS/ucL3CjlJ6Wd6gdb1NPOV2gHc0glbWwVHMDMXMD0GV5CZS05/
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

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


