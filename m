Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830132;
	b=qVT77q3e37gC4atMqlxRyC8XTU3mhVeMA1f8WrbErg5PZADcn45e2bLVW9l3WodMgz0A
	 lNATecjbxrYdEreIJ1lG6LODQTE587hXkOPgzCYZvQdzjo8h+YoT4IobCnmZRtKugbtrC
	 utrPnTTx84f60YO5XYGBxIWKMzNrRdbsr+ShYT9H/f0yrNbw77qqPl84o6R7iv49jpEun
	 Rcco1h+5nhmmUzoVoRT+oFesZxZW9Fe/0b9DxGtLn9fgpgA8iYAIO3EftbWluRb59iYeC
	 hgXDC73AfVvfCda7wgLzMIYDGr1bJ6EhBQjwxjxqIwgrPNBGi5hw9YfL63wJyS3BaAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830132;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	b=uqVfEcnocqTCZiWYd0Wfmmb/5FlRQbFuxVJxB/us8cmFOcFRrQi7Cyl8Gz1DTfehPA6N
	 q3OPnWaTurouAeLsh+ug0pvWNzj/Gtr2rFfTtiW9pg+TGvSzVWRacbhdUhQaCV8lUxhMS
	 auXFOxVXR8w0f4yZ7cCqw6WkES6AA8MPbDlX/YT9onRzF/lVfr2KRGq5ism2l7JufKE64
	 Lq8RiZmAkcKKeMkwZxiSXGWEIenKs60EUdXswPUdjlkcMycde7sgF9p7rC78I74uz0UjW
	 0oOVPkD0P2+Vrok2mINftQJmH8NLypnfgfn52WYiVlq3rRn55QHs6q7V4TwBI966D2w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o06O0Wla;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87D6606A337;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=o06O0Wla
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830132;
	b=KAJ2uQiWymrf9CdQFgEoDxhDXJLFcxg8ZU9fbDOK97gbeyTNTj4oUa74wTWxvx8Cl/ZU
	 geg9MH/xYT0d+SyEk4acjGca9ZbVC12OYgHUWlQxBhdYkvdE/kUQxtDHHFXLGUSwulnED
	 cFDYg5gkrWhVRDiXmYifQ/Gisg2ELzcuN72sXqGDGRW4+INeNI9R4Z4TGHYKYhpduyv2t
	 qqvj/rQuw/oUHG/brXGnO8LbfwQwB9iaOHgbVmDS9pPL8unTVDd3kZTaWqePZOf/X/GoD
	 aYkheUTHdku7KzO8x/wK6t0DQ90ZHeXs76m4n/V0zxX15BljyMQ7OQgG0x8azWt4soA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830132;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	b=diWtClmE6CmoE7Qd6LLsYH/zje3W43/bEjFs4af8WEhnoVwIFLRZ8a363RQuO9La8Q0C
	 Zj612WuL0Sy0LbxgXgV3wd6+5j+GVyWLn7B/NXiQoXESX16x2PqwkWSQJslR1GW+4x0kU
	 ORgkLuCujv/GSUnTiSAUjil4IwLK/F90pm+BwW9pBTGO9W3rBUZ253DAh3NrUDgV09PRs
	 xxNe5csB9yrt8wxAouOzxbEFPWYYtpVgXnESflmSl0f3amKkLnH4C8sO4MFLj5CJw/xcS
	 1bp8GZDpxe16xy9bdPnSVGL+T45eDUEjzf3q/eRUAU2VPnukhq2e1+JK3VqbNDb1jZw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71B071F000C7;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830132;
	bh=WWM/XkHqroywPq1Y6qjpupk851Qi+MmSf1AGGFT1YEQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=o06O0Wla9LzTJo7IduIZwxldyhH+RhsJyJGRlpc/fK8aFbmzGuTQ/yqfmY5ozQpv6
	 7IUiMAvTfS6QPUTpkeG7TcgvPsO8U84//TGqBdM49/YsiklliMij+/y1Vhe8zhGi7j
	 uVfLQstRrT/jGdb43W7qdJXHoRtgDwqcUknZXbZPufo90+rp7lL7LYCreSB5tlcyKN
	 IHez2Y/YYXxHmIyYwPdRyPcG2F37EWr+JBTRQSC/b5HFLM1ASC2UjdbaZIevtUPB64
	 Clod03EpbINXQSeDqp0476aiEmu+wwdE8r+MJDjgpVROpiIjJd6hIrl75BsLep0cnm
	 XHzst66Rrh6qw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 016684A456;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:10 +0100
Subject: [PATCH v3 3/8] dt-bindings: interrupt-controller: Add MIPS P8700
 APLIC
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
Message-Id: <20261116-p8700-dts-v3-3-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=913;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=nrrwazwcP9azGUHCUTNRCM9hJiAPuvFJXrmCXH0ud7s=;
 b=sghE3S8GwI2vqMWyekkp9g8y+HwNMJqSxvi6gFWDWZhz2iY/D2N/Vl67BVo+q0nWRBugPRzd4
 /G3ozQRWhEMBYMHJaSNxxt+nNUDNSL+iEWk3lMjwnv3NakGbYvw5JkB
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the aplic compatible for the MIPS P8700.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 0718071444d29fbfa36283fc9666e8cecd6f77e7..2ab60031ac5d2379a361dfa2bb334796472cf039 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -27,6 +27,7 @@ properties:
   compatible:
     items:
       - enum:
+          - mips,p8700-aplic
           - qemu,aplic
           - spacemit,k3-aplic
       - const: riscv,aplic

-- 
2.43.0


