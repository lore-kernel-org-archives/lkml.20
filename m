Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.39.247.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984189;
	b=fJMDJkx1G+7n+flD8z0s0KGM3DjFPgrh0R9Pn+hM1Z1a/TqiMtMiDj2f6P4vTCaIWNDX
	 bjrUhvjwgh+NPMBf+tCBDTfpPzF8uGZaVHqv2n0/W8vDibjJo9gNw3De6EjvQYZDav2QO
	 tPpJsap0aZ0GeP1Dn5vKwmDxxt1lbOKMpwkzy0juJpFkrz0XLlXqTCMcXXqI2zl1yLk4J
	 bxONxyv9iIrnCGFIGuZJKwmEFKs0BCjsl3N5gv82168EXQugMNmOIWMs1ZdComEeigQhv
	 OQ9AJQOfWHbZUyVUv2WvP9TV/NGBYiEUPPyqBdLFG47puKkvml+DjgmtdiByoUXeNAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984189;
	h=DMARC-Filter:From:DKIM-Signature:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc;
	bh=I4Bt2sXHgjM8yxfvtsqejeEaDBGREdupk+UhPUCAq8g=;
	b=V1GOAtJRr2808WPHkZ8xNkXxlEXW9px6Wk3p9D6GHYoZKG9e/C2AqIWffExh01f1TN8y
	 EeSfvRkMpBkMR+LSAjuoBYquyk0YJxf5J9aVOCXtNHWjtMTcUqjODZZXwVNLgdvhG/rgw
	 8Gvt+c8wbUHAywdak3vTAsEvdY1hvbe5JVcIsAhljm3vAe5KLiAzw2dD8Djx0OOXRBeZ2
	 moHvksEbORe0BHIy8C6c2SNbgZRMxxxjYwPdB3GrEHuoma6m/tOo5hCnJ+t+djJuEGZ9d
	 900o0VdWjRtjFSjZVwK6tF/Fp9KiBYkNfaZzflZD4i8Z832PUvOcybsUic42vt4lelg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cyberchaos.dev;
	spf=pass smtp.mailfrom=cyberchaos.dev;
	dkim=pass header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b="vX/Rb0HX";
	arc=none smtp.remote-ip=195.39.247.168
Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2FD606A334;
	Fri,  6 Nov 2026 16:56:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F2FD606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.a=rsa-sha256 header.s=mail header.b=vX/Rb0HX
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1793984179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I4Bt2sXHgjM8yxfvtsqejeEaDBGREdupk+UhPUCAq8g=;
	b=vX/Rb0HX5442BogFhvBqA/WpVt4Zza7HWNa4hcVvkfpgH8eLCC7o0OR7+3P1344gVRB5Pr
	yKSdLaIai6TWz3H13t9pqpKikF6zU5hbwceE1EePd3BylYRqKkje6KJHtCxCeBajNy+6Ef
	qtic2gwY5mJeUrlkjY0a6mgkeXQzQjY=
Subject: [PATCH v2 0/4] arm64: dts: apple: dt-check-style strict fixes for
 Apple M4
Date: Fri, 06 Nov 2026 17:56:12 +0100
Message-Id: <20261106-apple-dts-m4-dt-style-check-v2-0-1e715e80b066@cyberchaos.dev>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OWw6CMBREt0L67TVt5SF+uQ/DB9xepCqP9NZGQ
 ti7BTfg1+QkkzOzCCZnicUlWYSjYNmOQwR9SAR29XAnsCay0FLnstQp1NP0IjCeoU9jAPs5Mna
 ET8hJtaXBUp9lIaJhctTaz26/VT/md/Mg9Jtya3SW/ejmfT6orfffUlAg4USYZ8oUWVO3V5wbc
 vHyyEdDQVTrun4BWjghpN0AAAA=
X-Change-ID: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Yureka Lilian <yureka@cyberchaos.dev>

Hi,

mirroring recent changes to the M3 and M3 Pro/Max/Ultra device trees,
this makes the M4 device trees broadly compliant with
`dt-check-style --mode=strict`, leaving the same exceptions:

- the property-order and line-length issues in the generated pmgr nodes
  are left as-is

I checked carefully that the modifications do not cause any functional
change in the compiled DTs.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Also fix indentation related dt-check-style issues (mixed-indent-chars)
- Change the ordering only where the issue is still present against
  current linux-next dt-check-style.
- Also fix any remaining line length issues in the t8132 dts except t8132-pmgr.dtsi.
- Link to v1: https://patch.msgid.link/20260924-apple-dts-m4-dt-style-check-v1-0-3ec651d75baf@cyberchaos.dev

---
Yureka Lilian (4):
      arm64: dts: apple: t8132: Fix indentation-related dt-check-style issues
      arm64: dts: apple: t8132: Fix blank-lines-related dt-check-style issues
      arm64: dts: apple: t8132: Fix line-length-related dt-check-style issues
      arm64: dts: apple: t8132: Fix ordering-related dt-check-style issues

 arch/arm64/boot/dts/apple/t8132-j604.dts  |   3 +-
 arch/arm64/boot/dts/apple/t8132-j623.dts  |   2 +-
 arch/arm64/boot/dts/apple/t8132-j624.dts  |   2 +-
 arch/arm64/boot/dts/apple/t8132-j713.dts  |   3 +-
 arch/arm64/boot/dts/apple/t8132-j715.dts  |   3 +-
 arch/arm64/boot/dts/apple/t8132-j773g.dts |   2 +-
 arch/arm64/boot/dts/apple/t8132-jxxx.dtsi |  19 ++--
 arch/arm64/boot/dts/apple/t8132.dtsi      | 157 +++++++++++++++++-------------
 8 files changed, 109 insertions(+), 82 deletions(-)
---
base-commit: eea4f3b5e9e19389af3b99af64cdf7352b67c298
change-id: 20260924-apple-dts-m4-dt-style-check-6e1f9dc92807

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

