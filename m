Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794830132;
	b=jxIdxowrb0Gkttyf5xlHrchsOyA14Zj+hok+uKWcWgXu1VNM3tX7Jn763hugctq41YlR
	 nFaYhtqyuP79zum5uiQUZwfDhd9XUFa3SgvJwh+KUGR6x0N083lycjOcmd9Zs2Ph8xVpK
	 KDESP33RRrtXku6QmBUHjKEq9bZRCel4QfxuYdlCDMPiXvLlIqmPO4aG2VY7gKG5hAP5T
	 MbOe6rXOUNzdsU3sMDBEPA8gt2w3vWe2pGPNWHi/goRJWSp2cCeXpIdLg7IyxJsXMIQiA
	 lTeiNznXp5I3Umj10f2PSRDo6NWO9bEWOIL29ojHbQZFji7xKj6hY7tjqrUWcfvqQaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830132;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	b=zQqD+iCWorBzrgO3hRtQe4+gT2jEl4oc9MaGHWEHyI+X8tsLAauIHcQ7kO+iNIThwkSq
	 EG0a4LhBYck+Ficv2Uc3Kvi1nns5Nvi6voTppKpdxUexfuXYkK5CMyzxAGjnsFVMuq3oa
	 KpBs35SGn7KQUn7HEo/rknTsDyKrSO4AOtsOr+83z+pxoLupkK2Y5xkI2wntYY2YUYqum
	 yp0CspJ0PyPsdsDMDevoMFc9HRimg7Iul7xy8CUI6qdXJTIqHfRk9eLvYMQBooB8FB8fB
	 WlSC05mEekUp8J82TmwHIcbQAkurF0ytgRN3jfVX83zOjMbaeQQL85P/HRDhXfP72ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cSXZtWT/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAA1606A31C;
	Mon, 16 Nov 2026 11:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cSXZtWT/
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794830131;
	b=ndVY2WGEphCPSRcu0QNGMoZhOhAl8PdW8JJlHQWJReeCOEosT46t0ecufw9f8kG898+i
	 Z4i03D6OUV0T2gKF36Tx/cMQayg1QIjjOGCu4Xl9I35SFWp+bJHL1ff7dPm3ccq33+SR9
	 6ys+Szdet+jjTuX7+9cFP/JsoTVObZUdjZgB65US8uwWc81KTmYomQacjZHH0YFpSg5lt
	 YJqjYYHBa4niKbukpWimlxJdfN0MbWLXprYQWn/7YbO2DB+HTxF6TYDj8kiLG/QMHp4PR
	 BBXbVoWftVuyqUW+pzSXmHlmHiFDcX8J4lPziL2mcZwUfR7XHGLfd+j2HV3+vQgHbWQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794830131;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	b=0iZNw8mc/cG47cib2XpiHwS0LOSwBe+BhVGUSnhJOYXJGna1hBijFRiGUmzBGhIA9ZXP
	 wrYiugQleDTF4oMuVcU7VIcBAduWnTgnRQHpMaFW8MmAScbov3eUbvsoTv7ZjiGli46An
	 tu6LDBlhWpAuVUceOr62klIq9r17rVxoShapcHCFBTcQfoEgJpkPuUrLvb4/FEBOV3Cyi
	 DYSdLG+Hl7VuMioTapYMdi2vg9CsJjnNkWeBzOalz0mPRelDaC8tItne7xIUe+XY/VohK
	 HjIDpzjT4Ocji6x5HS9w4CZn/UjGqKP94L6D6A7bX7dzlD9ufXvt9boGQheb9SQlTJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 43BA31F000C5;
	Mon, 16 Nov 2026 11:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794830131;
	bh=hV/k/f5fbJcjPJ2ZODj4J4biesErKEozmiKxvry9Ils=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cSXZtWT/CVs7hiKyLCra57wCqzeWiCdlfmUJUxov/+0wHYo9lcLjcghaNlrXtB2ZN
	 9xnP7LoE8ahuEc2qn2xC5uw4gTo8RLhpMpgeftdaZ1k+I+NJgQoCUMJuIjX3PkTCSF
	 atFndwx/pFjV4GEMQr9duASAplrVUlHr7MQ9Alb3TLb4Bm3rUTzFaJO5G/FfDzDIBW
	 bya9iMoXZlhvrf6xQLZUvFOH7QMj3D6LMgWXYMPYjl1F//oBA4loUEJGKSRcmO65oU
	 iQACjOCKDiqL/IWLLxW134/p0SMj6RJ0TvG5qaIiUfuYS3+K5c8/UFSfXTn4jBoK0j
	 DND6u3s7bLhvQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C96424A44A;
	Mon, 16 Nov 2026 11:55:30 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Date: Mon, 16 Nov 2026 12:55:08 +0100
Subject: [PATCH v3 1/8] dt-bindings: riscv: cpus: add mips,p8700
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
Message-Id: <20261116-p8700-dts-v3-1-ec5d4b7de39f@htecgroup.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794830124; l=841;
 i=aleksa.paunovic@htecgroup.com; s=20250806; h=from:subject:message-id;
 bh=lv7fN/1sfes4OW73tQF/sEOIFoYV8Fh2hXDbsngJw9E=;
 b=kN62qoyjoQ10HEK4mKnCJ3zptssPyJYyrOZaHxCayLaCKBKUW2G7Gtc3b3tu0uTnLgLJJJOSN
 FO+e8nK0ujCDdTEEcW1aGXL4NeGlcId8F2C9tnu2HXP6XrvNKnmp2kR
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=Dn4KMnDdgyhlXJNspQQrlHJ04i7/irG29p2H27Avd+8=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250806
 with auth_id=476
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com
Content-Transfer-Encoding: 7bit

From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>

Document the MIPS P8700 compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 0da219ae6769767a9b7f41f179a3559ae7160d69..3e7016687fb67c53856310f97f4ba587ba6b89e0 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -48,6 +48,7 @@ properties:
               - amd,mbv64
               - andestech,ax45mp
               - canaan,k210
+              - mips,p8700
               - nuclei,ux900
               - sifive,bullet0
               - sifive,e5

-- 
2.43.0


