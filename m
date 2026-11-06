Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793978061;
	b=4wzLGjJ+cGXKRSnFX6c8qlhwcC75eEb4R3lKHqQhJqROKizGFxDG3G7mpyD51mehPUyL
	 utlHzop0TBcxbuklzjwyxbhUizHVsK7bRFGEBLj+G55wMONdJ8aFz+mArcv2ykC4bCz+g
	 miN3eoBOMYtr0tHkA7MKCNH+RCqwnZOfQr4JvMxKuYeyKS5L2x77IlLV8WIHBBUpXI5/Y
	 ARotNaWyl9HgupWVFszSDsuXekG0tfDh5mgq7lc1oo5aSE8Fa8UMyPcb7rTQF9TH+Cq7c
	 96DdGBPkUkZgXXlliXw/ZYAjE2+47W2CXUv0ow8u3HxqPjA1huob2KLgcmz3s4xNRTg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978061;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zvPlDffqFL2t/9BJwN1g21/6oZKRy+ly9zeQZHq5SHQ=;
	b=qM+ZakGkSXTrnPPO+idTxktm2j1fOiz9IzmNBqw5w+LKV5Di2DjltFrXEcmE9BE280/I
	 +Ard2kObB9sJ7iap+VGfeVVr74MK0cSIpTQcC1l/Ce+ibLd7oaaIx7sxBQzaii3aIVtmE
	 3wsYEgDOPnFeKYJAnxsSyzU0qh0kKeqsqyYyLuKkzKiz990++pYbDJ9l7p4dsIdfoGjUr
	 9sER4V8jPnDOfXplC9DlUrRmU/aSh811G5OUOnkHDAvkTKX2a1+9ENjSBFt0JMZABJ0ob
	 xUf1ykl+n8lIIZNXnWk8dywN+jQFcYOe1TbBvh9kxrgns/NWyr2hTpAiN2XYO4BBrrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+ncti01;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DBD606A338;
	Fri,  6 Nov 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R+ncti01
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793978060;
	b=YFAoOYN1aMudurMe2ZeQptc1/g928wyPdNjFDlD3ujKFdX8+3hfTz6NTyHfe1hh07PfT
	 cEPl8+GGBWCMhr1y/mbVUsyKu2ig4nKvhzU3sZaJPigUfwBcqT35HKq6K2Fifw7L+kRoJ
	 rz8df7whlSkMgtsenyXtSRLpNjsAbWCRC6u4VCkNPvK1H/o3W4ZICrwUFb/l2udiBUQC2
	 QQbH5nXoqvT5qVlylJ2oK12qXam7B5GrumC14rz4+wcaiDo94rB8Rs+FfMOMjPs8Xv3f8
	 i+vgDszMHniqvGxxQpBx3RKyIs74oW+FOABGkfFxNkWrQzr6eX/ZvFHmdQqRaEUUxaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793978060;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zvPlDffqFL2t/9BJwN1g21/6oZKRy+ly9zeQZHq5SHQ=;
	b=GuDQQiTAkJxLrnwaVQCo46Hm9rauyJnISfxaIhdIn9pjvAeFpskXS52wphJ1ufvCaqfy
	 HE95MrDgdpNS6+yb5ilOOLkEEhZF10q9s6R9GJd9pr6lfn9kb3GaeGr+pJWNlGoZkK/9J
	 QoC+feL492XIKVlG1wHqmYMQ3/88nL/0GvIwNYVXnuMVVfpXhyKiob5NmHp3t4zOR31iP
	 a/6LkD1/4KpdSuaaj+vT2VBtWQ1t0GYDkaPfoAKyPNjNApMP+A+1QhCdKcTXifE+ahrxn
	 BbACLS22VAyTUdfhZxi3JBDE1miLblb9QukxgkdKT8/Apa9UwcOOqeEiKCSthU31irg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A38AC1F008A1;
	Fri,  6 Nov 2026 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978060;
	bh=zvPlDffqFL2t/9BJwN1g21/6oZKRy+ly9zeQZHq5SHQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R+ncti01+68LmjdC4pYHFLuzwOMzMaw1m/nrMb+8dG9/v1XYjPKm6Ek/c9ekydWWD
	 hTs6MS+kYVqf8jrbocT2rl3rzyXZJjY9Pqe26hnXd5yWIrCjzyQOhqQZ5GatLmit1K
	 TRhXUE2o1f+ogS1zE8NEcSPVjhmKzJXuNeYQHDzRT96tIOopMBl1BkcZys7sTs1HZl
	 5qo0o/dE4v5NH0OFvkVZcJ5ME196o9mQkHkf5Ibn/x125FkJLGcn4zIYuVm/cXbpAy
	 bK7jsyXq2pXm2oPVC1opk1A2L41+lqbXXi/xRZp4Pa8et5RkP0LkF/B7kFs1CEVvCs
	 BGEtyBkTXW2gQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 15E2345DAA;
	Fri,  6 Nov 2026 15:14:19 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Date: Fri, 06 Nov 2026 15:13:05 +0000
Subject: [PATCH 1/2] regulator: dt-bindings: fan53555: Add Silergy SYM827
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
Message-Id: <20261106-fan53555-silergy-sym827-support-v1-1-4e871c7f475c@protonmail.ch>
References: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
In-Reply-To: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978058; l=868;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=qUex7JnM/vla7BxxPF0GGdCxKqcEzvskd/p297Vrwo4=;
 b=0bxKsdnzMxuOfoRMy652LToiG7q3uCysciWTlaQDwUWX5I8tHYJVD1Fz/0ayXA06oqU+TaP/P
 /pu/7Y3XkQgC/LBP7iQ386jHrB1qAGp2Rl5JIcgSruXvO53r/sbGnRo
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch
Content-Transfer-Encoding: 7bit

From: Ben Grisdale <bengris32@protonmail.ch>

Add a compatible string for the Silergy SYM827, a 6A synchronous
step-down converter with a similar I2C register map to the FAN53555.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
 Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
index b35b8f365b0f..1bc22eb43dd9 100644
--- a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
+++ b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
@@ -20,6 +20,7 @@ properties:
           - fcs,fan53526
           - rockchip,rk8600
           - rockchip,rk8602
+          - silergy,sym827
           - silergy,syr827
           - silergy,syr828
           - tcs,tcs4525

-- 
2.56.0


