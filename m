Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794922198;
	b=TbmdYJPjnA+RVZ/Z8MhWlxIi+DF+SPNEfoiH8cKM5mIfn1MnZg8EC1Vd4x5wZi5h9S5t
	 QnfDqjqPokH9c8ozamzD8ImYww7UIEWJrGlFJ9dWFjbXruesR2rCGCmAErF4wIklfNRmS
	 dFxG6e5N2FODEk24CajwbzjJn6pyJpHoqIrJQEbWklVS19kbXgEIU/8qOqymYxjOZDk36
	 b2W7C906DBJiYhKL3YiFnuHS8iKH6C/66OthMUrIBflTzgcLUcHqiEisjsePFT+x9pXGx
	 O8iBq1xGwYuuNb+RCcx2OnROVME1XuuN3sy8tVCnDc20DD6hajq0P3F472rpuSHwUqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922198;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=1M+tmkiw13zqQg92Zh2bUVUQ5Nt1cC1rTeaNa/qKMXY=;
	b=thSKPeVILlU30YFIlzJmtfiPoF7nx8VdnR0+7NM2poFs9rajIoCQUW/81H7eYyUjis30
	 fI+ibw8YMc9dEO5PEZvQvqxubcqBbmT8hWcHslEtbVQhXxoCuSh6XEeOfBfeplYB/z2ca
	 ODaMsJg9nkJYSkpqGVSLVR0pT5qQWKdYO+z2eyoPTWfHjUjdAQCBBzPdxaifMuiyeI1DB
	 bSXy104wxaDf/Z8LWG1/xxAFTDwQQdH1FDwVqz9hAiCy82t1CMPUWv52snxXopDv1HEnK
	 23pxyGkUxKuHY26XZV7bFHiFLD+jow8lS/pEDRnxH5TdJL7Pdb9VBDCuduFbdxfqtmA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g52bDE6B;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F372606A332;
	Tue, 17 Nov 2026 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g52bDE6B
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794922198;
	b=n2db2MGvTywahUHkwi80igfopV6xLT6ClyGz3/1lzVI9Grnqr7KMf7F7Qe6uBDpXyfri
	 NpbyIDdrbNYAp1JlOKMKXxbGB2FwXnQXLaA2HmHLpmwKeqxcjo8lS0vazVUCkRTDPa7Lu
	 YzDoeErcBn6GCx5QLRf3uvJHVryr9AXTVBR4P3YZBh+uUdzmkzwqXN7R+zFkMsJYd/s54
	 +NN5HL5HlDkM3oV5pYFBWx9PmczANu2ODcJjSdMzCr80Sqsz03+3Xe3Sds8OHJbqUh1yC
	 PxTLRfTBSlWzU92Mv7os2aF6SJ6RPWWLHMIIovAl6ZCL+9wT/IQvuPpwHsTess61gNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794922198;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=1M+tmkiw13zqQg92Zh2bUVUQ5Nt1cC1rTeaNa/qKMXY=;
	b=GjFJ8rldZ77NgOwRtPByvUmxrir2/ELYJOJ0khjZjkc2wDofBI4KFihOsXtd7r26x+d3
	 FwXXkDBD211KGtmPveT1yZK+fQQijRJDhx47V7v/rxKdBEznmsaxFIbKxrtbLOvWXBaqs
	 RJzRqD2RjvAVz0OtHSuObTBWFiNJc9uQX3qyjIg8rluJ+8ybdQifuAfFdwdP8tvHsUbOj
	 PYGyX+tPnikhiSjxYmf5oGxafjqzd+8oAd3lmDjV1HFeMUQCA49feGKUv+bU+17nz+0Ur
	 fzItNU8Mf7HnNGN0RzJH1ZsZ9qiKMNi0zTmXZYz6cgZXYk9Ff8L4uVvGh1RQcKfojvw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6E901F000C6;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794922198;
	bh=1M+tmkiw13zqQg92Zh2bUVUQ5Nt1cC1rTeaNa/qKMXY=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=g52bDE6BvBVq65dKA+1ImApcX6TTHPWrZhbdZJef1hdRIx7bVRAMDuPvZdds6Z9pz
	 Hn7rNbP7sxbvzoQxmckmJFWRt7SnGVKbUbm6L8eHvMMHyhqgWWCyHraLBSjojMTW9Y
	 Mu02fDQTd/erLu96A/VMxyW88nNeCRQA9YDxnLbudAg6FSwYBntuZ4YonEtAF7VIK8
	 IQ76//GjFTw8vKNF5V78YIkfGrvS0oKQ4pdDh4XanOPxWEfSbw8Rb0PDArMt/4L8Bh
	 LdWyZhU7yIYoQFouWX4AMYmupgha9r3sgfrS5H3kxsMf18LwdpRQ8SGQSbzS+bexZU
	 cLws/y8ATs/4w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0649A4A993;
	Tue, 17 Nov 2026 13:29:57 +0000 (UTC)
From: Ben Grisdale via B4 Relay <devnull+bengris32.protonmail.ch@kernel.org>
Subject: [PATCH 0/2] soc: mediatek: pwrap: Add MT8163 support
Date: Tue, 17 Nov 2026 13:28:07 +0000
Message-Id: <20261117-mt8163-pwrap-support-v1-0-b00fa10035a5@protonmail.ch>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm1CK6LxKsYFzBStidBMByUh3
 N1Rl2/x/wouScXhXK2Q5KWu01hAuwrCvRtvghqLgWtuieiIz3yido/2Tp2hz2ZTyhgic8915MP
 QQEktyaDLb3u5/u1z/5CQvy/Ytg87GfMaeAAAAA==
X-Change-ID: 20261117-mt8163-pwrap-support-cd22b20d25f4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794922196; l=935;
 i=bengris32@protonmail.ch; s=20261018; h=from:subject:message-id;
 bh=H/UCJ2qAfxJA3SdM4D1y0mgjHFPRdqf+v5XoA4KVnSE=;
 b=W0fKT3k00Nmsp06bXskA6eG5czcF25ffOkNp0AHPQ5MNuJDV+/5yhMrFAPHpN1uFZ4TZQ6EmC
 09oK9XlsU8wA1UhSSRYGCSFuBvUVmpwz23XJ59d0O6lFyjjMolv/YjC
X-Developer-Key: i=bengris32@protonmail.ch; a=ed25519;
 pk=4ewFRC2yNph/tXokHVzIDlgOA9Hxecf1AlBuD4eOnaU=
X-Endpoint-Received: by B4 Relay for bengris32@protonmail.ch/20261018 with
 auth_id=1233
X-Original-From: Ben Grisdale <bengris32@protonmail.ch>
Reply-To: bengris32@protonmail.ch

This series adds a new device tree compatible and driver support
for the PMIC wrapper on the MediaTek MT8163 SoC.

All known MT8163 devices use the MT6323 PMIC, which is already
supported upstream. Due to the MT6323 pairing, MT8163 can share
the same reg clock init as MT2701.

An additional series will be sent in future to make the MT6323
device tree usable for arm64 boards.

Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
---
Ben Grisdale (2):
      dt-bindings: soc: mediatek: pwrap: Add MT8163
      soc: mediatek: pwrap: Add support for MT8163

 .../bindings/soc/mediatek/mediatek,pwrap.yaml           |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c                    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20261117-mt8163-pwrap-support-cd22b20d25f4

Best regards,
--  
Ben Grisdale <bengris32@protonmail.ch>


