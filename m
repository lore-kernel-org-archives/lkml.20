Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793338038;
	b=LzuRhFkHIvn5IEfJ+R7yU7nE71fORca+upm1rPbf6W8EGyIn2LluBZcuCMlPP+jtYAgj
	 u1iPIsGQU/u+EbOjxEf5Xh75Pk+9VvQBhob44YMBYv+QHC7EQcqQxHxmNaMJEsYWsHph3
	 dkBqpD0Y640iIotKcEmKvM6eZua/S8axdca/pXfQkVS9Gy9GLx08BhDGlMd1U93eElKyr
	 HCysn/ae2EAj1AAr1Sw0JO3uYQI84zCoiFoQuZyALscFYdKV2XUIGvu6Z5Kx9zZ6qQvc8
	 3Oh5aACSk4eqgHHYN6fkXLHbUlqctWCb/umdXLW/AogvOOr+hemAFKEtizL8vuZHHdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793338038;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=eRlwcNfvDKd1mRWFF0W7ijP4nXr2Q3+Wk2/EB7O7DRw=;
	b=0oP5QfdoB/+5bzhfZ9PPzdfRPNfqd8q6nT0EQbkxoqwnq9Zp9CcJAqJJddZbocUJOqY+
	 +3ok1nMZvQB5uXyfxL7gS0p0EloMJcW9MBwmv3mN8uCl/vKFaFZHvB0VrBSHLRPwEhEIM
	 i3i1b+RTd6Ad4VLRMJEou5z61Rfg35lRqruvM8QhD4ICZPQnFIc8CAvb1uWl41YMQlX/i
	 x0KK7XakDbN6WfFymQcTxCiP+qvphutd5JQI0/NCsBKZEqQAGi5wiPSbckbF3fySIjpIj
	 Od7LzES8NxyMqYZLH0Wc3h4EKNGRms2EGzNENr6lBCuCCv5SMyx68CplbpmdDPI/SpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=A34qUxwI;
	arc=none smtp.remote-ip=109.224.244.17
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch [109.224.244.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37340606A338;
	Fri, 30 Oct 2026 05:27:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37340606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=A34qUxwI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793338030; x=1793597230;
	bh=eRlwcNfvDKd1mRWFF0W7ijP4nXr2Q3+Wk2/EB7O7DRw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=A34qUxwIgBqB/T4qStwJMUOzoNX19bqYtt8mO9T8jloOODfh9ejGjY5sOmh63UBSg
	 yX0L0fDzunGi3WprTTmJw0cppc/mTqihl0zpUGzOLrqKnMd7oOss2qLlJMT9vYF+EU
	 qvljCYT0QNTiZIvIQ0TYFbf6fQibPrqBWqDL3BvkLJMnqaKLlaYTU8rpN7XGAbjM0v
	 rGSiOr21Tmf8Ohfihn+izkTJx/sZvUYaHLNbzb5a8qxsFevXYxUB+rth7/Ul2PLRl0
	 pNAz+3aj/I9sRV26mBUAg3rZlSkA7h9Tsa0qCMt33mXBJPT8KnMR9ry/cElw3OEgAb
	 oQ4K+6/0xLDFg==
Date: Fri, 30 Oct 2026 05:27:07 +0000
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH 0/2] Input: add support for the FocalTech FT3683G touchscreen
Message-ID: <20261030-focaltech-ft3683g-v1-0-38b2f941b039@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: aaba0d66cd2c899477298838f60b007c5a292e08
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series adds a binding and driver for the FocalTech FT3683G, a
capacitive touchscreen controller connected over SPI, found in the
Nothing Phone (3a).

The driver skeleton was written by hand, following existing in-tree
touchscreen drivers (goodix_berlin, himax_hx83112b, etc), with the SPI
transport ported from FocalTech's downstream driver. An LLM assistant
was then used for cleanup and best practices.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
Alexander Koskovich (2):
      dt-bindings: input: touchscreen: Document FocalTech FT3683G
      Input: add FocalTech FT3683G touchscreen driver

 .../input/touchscreen/focaltech,ft3683g.yaml       |  74 +++++
 MAINTAINERS                                        |   7 +
 drivers/input/touchscreen/Kconfig                  |  12 +
 drivers/input/touchscreen/Makefile                 |   1 +
 drivers/input/touchscreen/focaltech_ft3683g.c      | 365 +++++++++++++++++=
++++
 5 files changed, 459 insertions(+)
---
base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
change-id: 20261030-focaltech-ft3683g-dbe5c2a7af93

Best regards,
-- =20
Alexander Koskovich <akoskovich@pm.me>


