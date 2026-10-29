Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.157.188.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266715;
	b=sdcAaGLk4cL7ERjJ8wreb4j2CiF5NojGTU02B+IhfaAvw4JNmV9A6p+wzIchXODEnlsB
	 5M4lrnbLac+C0cbcvIYWgYWveTQUxt32JM9U14z2BWYKKywtzLKAmX+foF5Lbd3UF8ZCk
	 Yrqo1ykCltv7zwQLYG5V7DoOmcupzbMRafne4H4DIrambPKIfnrHyLAnVcluBU2xuuK5B
	 nEOee294EPvN7xhheVMz7LxAyIe8BxNX7BNrYxjO6n9IZAaKv6jUMFdczdRcZPeXq4GVt
	 ZJFIJ+u1L4UOzQ8w/1fKvS8dC2sKON4d+6JkV8SrVP+XEIBN1jw5Z5lg0Rzh8DxG+Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266715;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Infomaniak-Routing;
	bh=wYFb2KtssvV1UrVJuVQzQnQHX/owbjyH0m18a3WIZzc=;
	b=X7tXfBbTkZ4a1+CZ53UgQTenjcyV4JT3U0DoD63bPppPP8GWaciOzrRR0Fe4MklHjZG3
	 J0jQiQjhdnfHSyJ44az5Qa0nGRfijSjGIaBnNhzB18WyeW5su20evx++HiFI0EcBZxAVv
	 FRrfUnt3J330D8nqk45P3wlybkylEiDET6zk0T5rcxK05tf0lcb47ccSzjHlT7v+Rua3B
	 /8IV6czXy46y+OhmG50x387CslNt05CkWZHLTUbhxXVsUx/830imMx8IYDU3JcDYvlata
	 LL4qfRU/KWYJwrutkcQC03bu/D0UYnmolCQFRelRrxDC+FHkFce15++Z4SdZwMbZIuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=0leil.net;
	spf=pass smtp.mailfrom=0leil.net;
	dkim=pass header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=jobzWXkm;
	arc=none smtp.remote-ip=45.157.188.14
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9524606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9524606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=0leil.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0leil.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=0leil.net header.i=@0leil.net header.a=rsa-sha256 header.s=20231125 header.b=jobzWXkm
Received: from smtp-4-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4jFfL96K3Rz45b;
	Thu, 29 Oct 2026 10:38:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0leil.net;
	s=20231125; t=1793266705;
	bh=wYFb2KtssvV1UrVJuVQzQnQHX/owbjyH0m18a3WIZzc=;
	h=From:Date:Subject:To:Cc:From;
	b=jobzWXkmoXRBEyxQtoXEgoxvUgk8S1c+aiehwCrq90gQyyf9FBPWTHcNCdW31UyKc
	 0mIPQNmVMw5W2cY9b2wZ9CRMVeTu7P8d5L4sbsHyHp0+eV9JUAm+zb24PV+mbpeOtT
	 TYxMvgndryFeK0ZNqj7e4vznVwVtKj+2awcMPVSvOZR4BYZq4LVdnBB9ZMPZcOsxxL
	 tJegYsCpp3rQyrlcoWhJSk0/OyZcXpNEJB1wFY3Mn3M1yu8QKHnBbZCgVvFIa2tDvd
	 1nxxGetgVSpp3ygCG69Z4KZYG1MyUWVfZAxywl5pSDMolB4jj5fdOhm95hcgMfR/iP
	 t2Z0am4kRrLaw==
Received: from unknown by smtp-4-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4jFfL76C1LznDb;
	Thu, 29 Oct 2026 10:38:23 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Thu, 29 Oct 2026 10:38:15 +0100
Subject: [PATCH] arm64: dts: turris-mox: replace denx.de links with
 official location
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
Message-Id: <20261029-denx-de-links-migration-v1-1-4ffff7db7d98@cherry.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDMBAAvyJ7diGJWqxfkR6Mrrq2jSWrIoh/7
 9ZeBuYwc4BQZBKokgMibSw8BxWbJtCOTRgIuVMHZ9zNGnfHjsKuwBeHp+Cbh9gs2mCflaXxPjd
 UWND6E6nn/TrXj7/L6idql98OzvMLXVEAH3sAAAA=
X-Change-ID: 20261029-denx-de-links-migration-f3880bb40e51
To: Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.17-dev
X-Infomaniak-Routing: alpha

From: Quentin Schulz <quentin.schulz@cherry.de>

The U-Boot project doesn't own the denx.de domain and we don't know for
how long it'll redirect to the official location (it currently
redirects). Update the links to point at the official GitLab instance of
the project so we're future proof.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Found when hunting denx.de leftover links in U-Boot where we import the
kernel device trees verbatim.
---
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
index bd00e7df87c67..159515f95ef33 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts
@@ -151,12 +151,12 @@ &pcie0 {
 	 * for IO and the rest 112 MB (64+32+16) for MEM, despite that maximal IO size is just 64 kB.
 	 * This bug is not present in U-Boot ports for other Armada 3700 devices and is fixed in
 	 * U-Boot version 2021.07. See relevant U-Boot commits (the last one contains fix):
-	 * https://source.denx.de/u-boot/u-boot/-/commit/cb2ddb291ee6fcbddd6d8f4ff49089dfe580f5d7
-	 * https://source.denx.de/u-boot/u-boot/-/commit/c64ac3b3185aeb3846297ad7391fc6df8ecd73bf
-	 * https://source.denx.de/u-boot/u-boot/-/commit/4a82fca8e330157081fc132a591ebd99ba02ee33
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/cb2ddb291ee6fcbddd6d8f4ff49089dfe580f5d7
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/c64ac3b3185aeb3846297ad7391fc6df8ecd73bf
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/4a82fca8e330157081fc132a591ebd99ba02ee33
 	 * Bug related to requirement of same child and parent addresses for first range is fixed
 	 * in U-Boot version 2022.04 by following commit:
-	 * https://source.denx.de/u-boot/u-boot/-/commit/1fd54253bca7d43d046bba4853fe5fafd034bc17
+	 * https://git.u-boot-project.org/u-boot/u-boot/-/commit/1fd54253bca7d43d046bba4853fe5fafd034bc17
 	 */
 	#address-cells = <3>;
 	#size-cells = <2>;

---
base-commit: c339f4010dea8b0d754f84ace70cd1b089878ef8
change-id: 20261029-denx-de-links-migration-f3880bb40e51

Best regards,
--  
Quentin Schulz <quentin.schulz@cherry.de>

