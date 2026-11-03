Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695290;
	b=R5vnApT6CPK1oVp3P5D4AO9ZVec7Z81OSZIkm6SEDzhfUfPAem1zK2Co7iDgyIMs5NI8
	 MS4R+Afkwg/KFgMpWPUgVtrPJN6pVPB+U8vbyN6LrtYsUiKtYbT+F1TSXc5NrChhxEo6A
	 EPutTs/XC0OxYy8Rznh6uBgf4TGgsRERpsVe1sHIck6UjM7YrTt8trygNwUVdyEUpNvJr
	 owgxw24oyf4mTu/O3HfcJ8Twfk5LdQLlvhID8CoNm3f6DMw2K+FQPQIL6qw6A23URj5wy
	 ww2Jwd7r5iU5oL1W9/ANqvYtkrNzjRG1rNQElfYuMMeeD7cnBG1iUr3Z7u6ByUiV5qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695290;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cB56U3zz4BIamuL2D9lo1seRf8zlHSyiWkQcTlFt580=;
	b=N6tygZOh90Aegd0nKHBJQJH/vdXrQ1NQmQYbsHoiO9E4DjCQsKdoLUookVUKz8h3P7Eq
	 000JB7LskGpw5EsMFdFE73MTYM3d2e/aQiqsmtIiIArsMZZ6D8nQFHjn5r8KyR9QJ0zd+
	 Vwq+xOAJDr/F7Gm1AMHCShkPgt/Z/PxXVut4UScy+ejtL6OAoVsqNj59F4XobEq9lVZIy
	 ynMPTc5TlSdaJPUj4T+uWDU1PXEboQL8ZrUXjwPTt07WB0UdsF77SLrFzWR4sG7cOrvvS
	 caa8UFL6bDiQMhjtnGNdVqALK0ALLcGz1333VznOt84H0M4wKWVaPhjRcpZr0wE2MLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=faetalize.dev;
	spf=pass smtp.mailfrom=faetalize.dev;
	dkim=pass header.d=faetalize.dev header.i=@faetalize.dev header.a=rsa-sha256 header.s=protonmail3 header.b=FS3JUV4L;
	arc=none smtp.remote-ip=109.224.244.22
Received: from mail-24422.protonmail.ch (mail-24422.protonmail.ch [109.224.244.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93F606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:41:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E93F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=faetalize.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=faetalize.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=faetalize.dev header.i=@faetalize.dev header.a=rsa-sha256 header.s=protonmail3 header.b=FS3JUV4L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=faetalize.dev;
	s=protonmail3; t=1793695283; x=1793954483;
	bh=cB56U3zz4BIamuL2D9lo1seRf8zlHSyiWkQcTlFt580=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FS3JUV4L2bq2l7hW5H1Bjwb5ECygZzdzXEWQG6STvXcYK5qsnTqAaUbqMaj5gvRYP
	 zGjTtG997sdbK8pk0F9INa0zuCMP3rnzL+sHnuHHNemB5GiMAvW9oBrl6KBwLxJhWx
	 zcxY4iJ865RW3wo37mkr5agKIpg27041nnDZulllPTdcHk5DGA8mOSO9QgeyEy43FC
	 zjJEmzkC4pI4kQNIWgsOayM0Z1ZNxMwsasghOGiNNTIYUjqMHY5X0CmeZkPQEMBVF8
	 Auj805bHxBlA0jcQcHgXbDPq/clxfuabkdI41b7lrrGciE9N5yIAjVdkLmv1cUyYuG
	 2JMkZ93PBN5Cg==
Date: Tue, 03 Nov 2026 08:41:20 +0000
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>
From: =?utf-8?Q?f=C3=A6_OSS?= <oss@faetalize.dev>
Cc: Takashi Iwai <tiwai@suse.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "faetalize@proton.me" <faetalize@proton.me>
Subject: [PATCH v2] mailmap: Add entry for faetalize
Message-ID: <cS36vWzKl0opt60dfok0G86AYiayAAnWdMgSnZaOA3eLuBlv1I__uEKhQYRTd2ekP1AaMIP7LBJnPxPDBaix-O6auDO1Kt-dKxjEgU1MQEQ=@faetalize.dev>
Feedback-ID: 231676493:user:proton
X-Pm-Message-ID: 684fb195f39ac3586a176b35d4a49cd20bfdcfcb
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

From: faetalize <oss@faetalize.dev>

Map my old address to the one I now use for open source work.

Signed-off-by: faetalize <oss@faetalize.dev>
---
v1 -> v2: fix author name
v1: https://lore.kernel.org/all/Df1D8q4zSMqSYWxhXJ06Yx8T6iDutvSRCAaBTq5S5Ep=
fGghkxGxFMK7ZOvoYLpsediiuR0luoDYo3tDh22ZuC2bjRkE67nTPL-U4NfVmSfk=3D@faetali=
ze.dev/
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0d05be949ef..6cf852eb482 100644
--- a/.mailmap
+++ b/.mailmap
@@ -305,6 +305,7 @@ Eugen Hristev <ehristev@kernel.org> <eugen.hristev@lina=
ro.org>
 Eugen Hristev <ehristev@kernel.org> <eugen.hristev@collabora.com>
 Evgeniy Polyakov <johnpol@2ka.mipt.ru>
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> <ezequiel@collabora.com>
+faetalize <oss@faetalize.dev> <faetalize@proton.me>
 Faith Ekstrand <faith.ekstrand@collabora.com> <jason@jlekstrand.net>
 Faith Ekstrand <faith.ekstrand@collabora.com> <jason.ekstrand@intel.com>
 Faith Ekstrand <faith.ekstrand@collabora.com> <jason.ekstrand@collabora.co=
m>
--
2.56.0
