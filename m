Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830134;
	b=Nsgcn2S4roXJZc8WogVxhtZxx1EYxtLBqMUjl8rwDghRaHGGmXMtW+s3GuBzsAvxrm4f
	 rG7WR9zvH/J1tmNJ2vNj2sHd6eh6sP7EpuGbQrg5BvyqjT3e8dJrKBwjBroi3n8/J370I
	 dbpEhS9M2S+U0GxNsFFLsCJORFdyiumBhFz5mkGAdluOK5FJ7il7xLQPE3YCxsTeGCWGH
	 mB5imRLD3JFfLjHrTRdXVFUPPIn63ims2syU69/WhTspkCgkKDZVn8ZCd1PEbKI9Xw390
	 f6i9dolis4yuSeOIuhd9rDNoHGv75Mvw31/uNOslKaHApQDccK7Pv+jlU1PthrBVoJQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830134;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	b=zf+jwqKWeY/Et2olWGKr1yL4lf/Uux8QzmWP9wr+V9lC6AXCaGsHTCs+GgGiLd1xffG0
	 tszxhnTic9aOogfswdqvkRkM6xZ1GQXTHA7FI8AwK3HdgLFZdlaCNypJxQBEyf+itJNE2
	 3k6RDouNRSDaY05GjzTOdyTHcVbiuaEaDphJjvwKLnP9paV9LQi/VrFE80jRK2Ec6B5cW
	 cUj/TglZoykeETjdusb2ScvVNtqKmTdcXTVk39TrE3SmeEWdnQj7AtoEaKvYH2baNc8le
	 pe3zyFKLuK+Z7zLWf6+sjYWctvXXD8h1B14EqZVn3/oJLhLt4nZim1wfM6DLZUz5wyg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQpycu5L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FC0606A8AA;
	Mon, 16 Nov 2026 11:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HQpycu5L
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830134;
	b=KiQvKYFmA+Xclt3aJk8tc05KIloqbc60B/sHleh0YZff7WYHu0EEWkzQkZHnY0SBQlUu
	 gXgBK2lkNACymYKX6O3sQbQL67Af68WNLBlgNA6+8+nHtrFXscR63CvE3D79oujbeUxbd
	 /9z0UqeHJl2ve7kSwyMmX5q6NwgqOTe2t+Dq3phMMuY3RQJCuv+rA67RGPeKnFqqFK+sm
	 63wGkHTGMo2/mPJvDb7nFPrEQPRThx2UmY3z4bMPoUQGYYaIBHWi/lxFDjHTjmOV88C9s
	 rBE+F6YbvkvTIQF7DfS/K6MVJltK7HcoptpbCUa1rK/NMbmfXN23krNjh8G2AsBcqmw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830134;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	b=T3bYZ6vXhoAyFBzMr2pfRi05CZyRdw3KjEGkxa62noihzal/M6eC3b6Go8yTsGWwLXER
	 tZCMQ8PDUB4kLuSCyXqKHEYaDOQTAmKn5JrAQM7Cg0eA3wwEVbFthsW+/HfFod7/IwEHS
	 GoXvcg11pWB4Xw6mz94aYb5RR1hteepG+ZRPZzxGbDGxciuGmZY8xlQvm42ivBzNBJv/+
	 yDYSPCco4n2xYIL0bkhGfE5IVyCHqZ6eNP0y6sln+LTJWe44nL2bUqhKPWxj60C+GFBhQ
	 T8x0eN8Vj/ZIjnAmGUgPLfzVwn+5L+PSQhJzT3GqqRyNWds1olfjUrB/yCKiHj8n0XA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB74E1F00923;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830134;
	bh=61UlToY13TvSwwcocKDYyejjoT9WGv3HL1erg4Usm28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=HQpycu5LpWJCK1jQ8LUZ/UGSM2GUCsnsp6WM+uTl+lVIR90gfwjOc4Jpj85ZMRYCd
	 uh4fWlYbMq2FzAn+5jqAGuG5ViuxmsLNlTee6qUXXGx1xGObfPsFlm1N61uo/v2qRD
	 H7/GPaZ/w5i8bSWg8u8eG22XBqSp3197PhaT3uiIyI+zE5NKlj50gpEqWeHxa2TWpT
	 /2g14D1u6eFNegrWx8/bcYkcFQuZf+cR5ByzNtOsHnMuenun0ph9J/VaUi266KSltP
	 C+pulO1b/2mS2eebGbLEnkYfgbRycvSsKJNbJzvXPaYCB8b78kMkBFO9PmH8Z/0SFV
	 lqeV7iOa0Ej8Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6F40A4A46A;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:15 +0100
Subject: [PATCH v3 8/8] riscv: defconfig: Enable MIPS SoCs
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
Message-Id: <20261116-p8700-dts-v3-8-ec5d4b7de39f@htecgroup.com>
References: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
In-Reply-To: <20261116-p8700-dts-v3-0-ec5d4b7de39f@htecgroup.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Joel Stanley <joel@jms.id.au>, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=702;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=466tDeyPbrAH0ZZbXJHUmWZAi2oQm3IXvaEsJZHNtNU=;
 b=V/9j8MpCMt8whhuC9mZX8aB9c75Lj6yWWaWFtpQUoxsQVLHWQwc/LZbRxYxLv+BQuuAq3ipyi
 D1kWAWKu+JpDga9AQJ4b7V79T02NruFzyZs3b8GxdVt8kE0VPS/F8B+
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Build the MIPS P8700 Boston dtb by default.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511bb0760247f50d4b69b1e3a00527b..1b0b5346603934058d8348ddb3aa9d7616af999c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_ARCH_ANDES=y
 CONFIG_ARCH_ANLOGIC=y
 CONFIG_ARCH_ESWIN=y
 CONFIG_ARCH_MICROCHIP=y
+CONFIG_ARCH_MIPS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y

-- 
2.43.0


