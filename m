Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793978060;
	b=Crku03s9nMxKRxZUKLmZVmo4OQMpqli/X3H6ol0dQ9rq16/j19dcX9sYwTdnz93U7DzA
	 gMhb2v9bgQ+d+Q+GF6oN8mfiXt+z2gymn57iPV7PJi8zIa3xjviOb7LT0zNzxerio4Ds1
	 C89wKPZGtWesW4kXVOBx6Q6WxjXcEtjwwmkEGoVILuVatPzGctJ0RmNKWWJwNy4Xiw/z4
	 7cu7oa2sGvatrnoKoRZGvivJ3G9vmfuv/PPeNB9PhhJOjavp/hI9kGNTTl6PNiXpoqHT8
	 fMZ8gJWuBeB5AHLlEmbxrQ6qq386LyyVWOXMDdkehShwr5ncsmxHyRxSUVMt1TjzKNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978060;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=5XIhwxad1f2Uz897lwoENzRd5fDGNsc5Bs1ceYoFTIo=;
	b=gOitEHy/3gA61svEGH/+MBShktLm8LHeFBGHlQgmYX+lIYnkJ99wubKAqMVN5GmPP9Fa
	 S/MHOCq8CKthD+w2GGzdLIX6s+kjk96B3tZmNvrqlWc4cU9vFusg6dsxX6umEmtSwoh9v
	 Zecps8Y9/7YkoQuWv4kfdNGOPsu+CgM/CNZaDnCwI/0FrQAemEK1leSUKNGZjK38VvWJT
	 n2v0M/U9j/Hw4lwLik92R5eYeE+PDjdLTJqINuZZ68+ogO78Gtoi8wV+I6peR6XN0B5ia
	 8EM59oOqW0t8gID1Q7lGUGZALu2ZRpm7Bk9JJOryw1hNstQ5J/efd0AO/4pAs3h0hUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCP2v6JA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D7606A334;
	Fri,  6 Nov 2026 15:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jCP2v6JA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793978060;
	b=fQ+31fEQmjT85vx/FrbgPREhT3pUvobTLW8q4U40bbSPexRIQ2s/T8Q/Fakv6TpKjA0p
	 iI5DN4ZN4xOUhSRENdlvSTEQ5xGe2fRj5ezzmYOW3sl9qOw2+60KzDm+zBKOsEnbqXXER
	 FfY3oxgVLUFpSZSjS03s8mtXdsT303FoxMZW28KtpoSBUUMa1UtEBLwc81J68NNvRQ4Ax
	 r8t/KbYfNlYr6liHXqdLoxQoC8oRUagXmHVCoBw4GfeMy73TVJfSuBwQaswssL6v5k2BD
	 2ccfdbil7Qf4J/b+jEd0m/yiq2+jfHu5JL8nXptLOphanwDOz/ypAuWvaAZ+cEV9UZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793978060;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=5XIhwxad1f2Uz897lwoENzRd5fDGNsc5Bs1ceYoFTIo=;
	b=GD0Wm3x5+BsAeSpXeXm9VqshCYPZaDtXm7lbge99diZVzjC8P/jN/tmgydypuZ4CMtCw
	 wflGr1Z/Ne8L/YL8HxBS+3zOVFkNa5diMFRkjofwroWiIhhf2yfVWBGLnNcgERzjpqdKg
	 B6QInIXrbrm6r+kpJ3hxlQtAPqOvbiGibI7nEMucOlM0HV78nOxTDuZaLYi8dJS1GIRH6
	 YbmyNfCqU2EWtWgR5xvjdzX4II67Dz5Xolf3HdaWBvkKFpy5Jj1mmCxxRCl+nX516AC9r
	 rOD8150Etz6N/ykvFiGSzLxsCruKdFZUDLFW4pNc9cwF/S9qlrI1miVTgxUsV/6aMsA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A394D1F008A2;
	Fri,  6 Nov 2026 15:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978060;
	bh=5XIhwxad1f2Uz897lwoENzRd5fDGNsc5Bs1ceYoFTIo=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=jCP2v6JAsY6Nu2Om0T1e3EhebOT8V89uvfBb7JMzpTLDixnlE86Ofdi97XRm9mKcG
	 +1sZUZ+lzJ1jtCVK32AYGT9H8hvt8j3cz1Gn1V2EQoj8D2s3ClaucbOQRb0MvxSBVK
	 CNEjueEp3X6PKX48IX0vJ43MsqvM6uN7uW83l9BL0jKhU9RQBODYgTX6TYvT7TN8Oo
	 PKsmm1k0XHT5ZLo5holnuXsiiX6v6vSJ3iKAVZ06inrjeiaUbiS7IGCtEzO3V7L7qs
	 35euxRtAx42GCIu88bglfoAQy7ffrQ3Id52udIvP08zKAD3KavDJm11QinNd5yi27f
	 gjjLQxKPGKv3Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F35E745DAD;
	Fri,  6 Nov 2026 15:14:18 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Subject: [PATCH 0/2] regulator: fan53555: Add support for Silergy SYM827
Date: Fri, 06 Nov 2026 15:13:04 +0000
Message-Id: <20261106-fan53555-silergy-sym827-support-v1-0-4e871c7f475c@protonmail.ch>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTsJLRlAr2JYUDrFMQpNB4yEc
 HerLt/m/x2Uk7DCpdgh8UtU5inDnAoYbv00MorPBlva2piSMPQTVUSEKg9O44a6PVvboK4xzml
 BH86tb6j2lXOQKzFxkPfvcO3+1tXdeVi+WTiODyw8U8iDAAAA
X-Change-ID: 20261105-fan53555-silergy-sym827-support-df98d756d3bb
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793978058; l=842;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=luqQfSxLzy1m2Cu0B0ORh9PcmErSggIyVznVMub0yXk=;
 b=vVs3KvxNaznyT1s+5qudB8D7vZGpKURnN8holT3JVNTv2aSHtsDBYi0JJ1Vqa0PNi/wK5MKgG
 LrbCNq7rtJtAedUCZhWKYGwzmVq8iCOC2+rhEYCqMDg058btcbGiNHr
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch

The Silergy SYM827 is a 6A synchronous step-down converter with a
similar I2C register map to the FAN53555, found in MediaTek MT8163
devices as the external VPROC regulator. It differs from the already
supported SYR827 in its die ID and output voltage range.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Ben Grisdale (2):
      regulator: dt-bindings: fan53555: Add Silergy SYM827
      regulator: fan53555: Add support for Silergy SYM827

 Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml |  1 +
 drivers/regulator/fan53555.c                                  | 11 +++++++++++
 2 files changed, 12 insertions(+)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-fan53555-silergy-sym827-support-df98d756d3bb

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>


