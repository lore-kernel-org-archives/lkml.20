Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792612595;
	b=PIr/GrcGq/5Ump5BeGJkLeEQbGfsc54pKJ+OYpDIZtsjbunFEF3yuqgXmsay7F5fX5ua
	 8uwuUcvcYomlY/SXZHMDSmEBbJmIP/vp/XDgmq7/1lthplrLW2mAAlOPrvYILqrs/NyFk
	 Numf+fNyirlnoUjGovl8R7yX9pDM2PZhf2vdnf0B0/08CB9mnCOIkNChTUbWz69EAp8Sa
	 0lPU3X8YYewlCX972c1zGFG/149gEe7uxAUmIRJVb1z3S/hMFZ3Bpb2dpFhE1w3OyZiaj
	 TtTjQrIaaAKpHFn2rYMWOItAXDutWpW/0E8XdSY+BJfVRWHXzj/coYUQXKEiO1Jcx0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792612595;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=hADXUFWM6q3PB+qGNm2SKwpnCLeJXT+MJ9DOT856AMI=;
	b=KxVYEoL9k0x+mtmZMF8vpR+aSvggG11et2rDNISqsGhuzvyWkvIvqlT0YWoUOgsD7ppC
	 FRXq5oLJaWwswESAvrjkOEuNBxbVDzZm8C/FHejI2LoJ0N0MSaAYyNdMRPT3SdRzM7z95
	 rRToSl1c06VtqQjuPj3N7TwdHXV52nge5Nw0RmEHYMyGkLZV3WPUdfNA6PCHcUI5t7V02
	 5jBqxkjEp6NMMSv9Acb1rxLrfaElQXrCgyICbPFqG7cEomkb1vIYS+6mf9yYhv6RefH39
	 Zebb4lqn/9smBlFdbr/zEE2VaEE42DNWgRydAp315i/fVasPpAH5b8Z5Z3ntPWaZ1fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMFR0P7p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5030606A31B;
	Wed, 21 Oct 2026 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LMFR0P7p
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612594;
	b=IRAP1894uSmTQ1AP6gLEHh2ip4F3PUxg/AP8+wFlKb25Qe6ZHLxbwFLjO+81AjCcEw2H
	 H3uxr9iwk7CdK75o/lTvU1eIN+8hfR2PRJWbj6k0PHBAzMKpsy7NXX4eT/PaOlJhrd/uL
	 NJ9zERbjoxthPwfVdgHGMhgRZf17p8p9CITLBB3Q17YCNc+9EdWUEinnFe3SpS8qyjojT
	 SWkONZHcoduuGE2pNhH/RaDauH2uVxfgGVbmV/XOVGwzcAm40U259VHe2prHSmr2+Btye
	 29Zy0CSllYMCTLj5aTY8bWQMEPNnPg8a77ErXUeEXKOIvT+4xEf++MJSzKbug6r0QRQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612594;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=hADXUFWM6q3PB+qGNm2SKwpnCLeJXT+MJ9DOT856AMI=;
	b=2oxsJnNE+CbeGv5oqHXjDmmdqWOSpvZXEvrcQB5wj3nuZAy03w9x1UYPXah/A+F+8ziV
	 iLDUC2r7/gAqBGsv4LnKOt8og2/yfLIIVZxkItlJN6vCJBWZn1vWKDjUxC3a1YVBaihJV
	 wBOVqQroi5keHjo2tW7oYmroFTcKGA7/xy3d4ifsr4Gf0Bajw0IG4RnCr+BkdQkuCuI2K
	 cnyHXA92F2sNIrmk7VXFVJuiZMiZi22YjBGmsGB5MUecHYiMzULSmPXBZrRzFo56PO9w7
	 tcX6rFU6hsDvXmfHdMk6I1P3D/liEIpYczmaZoy+WGhZZWed0guocmmcz/x6UJ1/pOw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4551E1F000C4;
	Wed, 21 Oct 2026 19:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612594;
	bh=hADXUFWM6q3PB+qGNm2SKwpnCLeJXT+MJ9DOT856AMI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=LMFR0P7pdpYslPQS3/CN2h4Aa7ZgHjGYffRPnU3AVAPHVG6J8+nqWAZabP+EdrMDY
	 +UogH3NuoH7alO9sNfuXNn+QqKCR1cc9V/KSQtDOil5iGENGUFg9ViJpt9PCAJdhEY
	 csuNrALA7eSR5QRUDaPpiu2FhH/40OLiTrXBTnxgWJNUjLxvk9lUuLLtaPzMI3YrIx
	 CkCwzemxPslr7GkI492rlPIenmjLaS8s2ABq9cOB268WWXGYzCzK3/Nbpi/aFH2Yoa
	 ME1Lg9UIQfXr0x01yzuM0yk4rzXXwa9+vlexjTZHXI3aT2qVoSg8PlvbxBC/MX10Dq
	 SfIMp1ujZ+P/Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9A6CD4342E;
	Wed, 21 Oct 2026 19:56:33 +0000 (UTC)
From: Vyacheslav Yurkov via B4 Relay <devnull+V.Yurkov.EXT.bruker.com@kernel.org>
Subject: [PATCH v2 0/2] Add Altera timeout bridge driver
Date: Wed, 21 Oct 2026 19:56:22 +0000
Message-Id: <20261021-feature-timeout-ip-v2-0-a037be089518@bruker.com>
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
X-B4-Tracking: v=1; b=H4sIAOYY2WoC/32NSw6CQBAFr0J6bZv5RD6uvIdhMTKNdAwM6RmIh
 nB3Rw7gsip59TaIJEwRrsUGQitHDlMGcyqgG9z0JGSfGYwypVbKYk8uLUKYeKSwJOQZK9fY0ip
 PpmkgD2ehnt9H9N5mHjimIJ/jY9U/+ze3alRY17bqrNb+UunbQ5YXybkLI7T7vn8BQBCvHrUAA
 AA=
X-Change-ID: 20261003-feature-timeout-ip-7a93630de299
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612593; l=1633;
 i=V.Yurkov.EXT@bruker.com; s=20260318; h=from:subject:message-id;
 bh=lJpE9cg9IeF8aoZNz2dghC01UkZXyo/mx2Fv4BVXTmM=;
 b=mvdsBBK4Y0BRMscdKiQHNacZqHp2e2B7AQX5fNUTRjVNztMVx8qxWyem8xDTUhj9mCAP49FEy
 fxWXBrBEl9EASbdoZfK7TYEvdASSYTiSUHrVwT9TJ9PlQCzGkFqxWAI
X-Developer-Key: i=V.Yurkov.EXT@bruker.com; a=ed25519;
 pk=snJmgYVOKlp7aQtK9tWnEI7QTYxpPpJJvxdVsnxA7Fk=
X-Endpoint-Received: by B4 Relay for V.Yurkov.EXT@bruker.com/20260318 with
 auth_id=686
X-Original-From: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
Reply-To: V.Yurkov.EXT@bruker.com

This series adds support for the Altera's AXI Timeout Bridge IP. 

The timeout bridge connects an Axi bus to the HPS and provides a
downstream address space for devices implemented in the FPGA. The
bridge also exposes status information and generates an interrupt when
a timeout occurs.

The driver registers the timeout bridge as a bus and allows child
devices behind the bridge to be described as the child nodes in the
device tree.

The latest bridge documentation (as of October 2026):
https://docs.altera.com/r/docs/683609/26.1/quartus-prime-pro-edition-user-guide/axi-timeout-bridge-ip

Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
---
Changes in v2:
- Address review notes
- Simplify error handling
- Provide better description for DT Schema
- Link to v1: https://lore.kernel.org/r/20261003-feature-timeout-ip-v1-0-8837c311d571@bruker.com

---
Vyacheslav Yurkov (2):
      dt-bindings: bus: Add Altera AXI Timeout Bridge
      bus: Add Altera AXI Timeout Bridge driver

 .../ABI/testing/sysfs-driver-altera-timeout-bridge |  21 +++
 .../bindings/bus/altr,axi-timeout-bridge-1.0.yaml  |  80 ++++++++++
 MAINTAINERS                                        |   7 +
 drivers/bus/Kconfig                                |   9 ++
 drivers/bus/Makefile                               |   1 +
 drivers/bus/altera-timeout-bridge.c                | 173 +++++++++++++++++++++
 6 files changed, 291 insertions(+)
---
base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
change-id: 20261003-feature-timeout-ip-7a93630de299

Best regards,
-- 
Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>


