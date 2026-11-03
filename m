Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793694480;
	b=zk6TiJuG2+6yI2yQosCBIxABEI0CidvKtX20RrX7GP5iuOUAzpjsO04+VklmIbOp6IvT
	 lqfu2upmMORHWnUipPemm48xOdAPYzHMJOVSjzHcKtjZGDvEYTVkVFLHKv3vktBeN8Q2V
	 naHy5/0Up6VmY7TWakciJ4x9NoYHsB2g44g7Qu1VABRz0VHhUL9IfA5/G9rxxQ/xChjIA
	 dx9Ax4AdpDqYHR7OvT+2B0v8+Lr2b0ophuX3uoBYKOB/HUVxifUT1Xyc797zxhunDjjHv
	 SI0tHrKHE7kZA9ovQJ/Sk2otHPeufz+v0pPeSSfW7U6n8XbEjmwXU4n8hLXKbJ5j2+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793694480;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zxlaWc7wQDwJ9tuEiGJ3OcHic1J0dXJBxZTg2iHgry8=;
	b=WE8ABYFOoVPuwXT/OUidjj/hoR1c+fGELN0qASsdOv+yn6/oVEU5Bm+BHPhbQAe69o63
	 qILBHVR2UBMq/QsdVklL6L3tc9N0xILwvrUf9Db07QPiRC4+HFXtMUveIiqgYTm/UcuTS
	 1DvE64sUCJHbyOv+Qs9GXpV7G52mwfSlar7Wv61XylrXxic7M7hhD4N8I09pC+5RRDC0N
	 M1OMCRuZqYAvPm8H7+iDLQJkG1qRgm0FV9q5EHK1waPv/zuXH7UEH6DmnWZGWx0RUOFHh
	 hjwgIMZRqV5ij1BtIB1mq+wMhOh0N8ilE3tMEl2vQ6SrrO9u7yk3Dj7rwYghi0kA3hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=faetalize.dev;
	spf=pass smtp.mailfrom=faetalize.dev;
	dkim=pass header.d=faetalize.dev header.i=@faetalize.dev header.a=rsa-sha256 header.s=protonmail3 header.b=TjLngSmN;
	arc=none smtp.remote-ip=185.70.43.23
Received: from mail-4323.protonmail.ch (mail-4323.protonmail.ch [185.70.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD628606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:27:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD628606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=faetalize.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=faetalize.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=faetalize.dev header.i=@faetalize.dev header.a=rsa-sha256 header.s=protonmail3 header.b=TjLngSmN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=faetalize.dev;
	s=protonmail3; t=1793694477; x=1793953677;
	bh=zxlaWc7wQDwJ9tuEiGJ3OcHic1J0dXJBxZTg2iHgry8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TjLngSmNz/W0LGUPjbtQgRDWL6Nj1SLZRC+51Q+cZUdFT+Q3SBkd+pBavcoJvp9o8
	 GU5D7XRxYwJa4gzetjHh2Z2voBB1p01birFJqc0jqc/8/FbYvBbvPwyyzaMUoeXCQK
	 Dlq2iPzCSgvwjSqN7iIImQfdg+SgDFIn9Mf28XttGZ3t+T/VeHoLEF74tp5HGq4xuT
	 NeZhEuwzAewEezmxOBZ1wYo1uu+GWM1TKNwznCzrttg4W+BGKDIIjiTtcSa43LPIdR
	 MX8lqs9PURIvrbOEXjbFCqzKmeh22Fz8DppVRTS60lUd0Wmy7wNqLhNJXKRp9BMxiy
	 gmXOYk5q0Z1gQ==
Date: Tue, 03 Nov 2026 08:27:51 +0000
To: "akpm@linux-foundation.org" <akpm@linux-foundation.org>
From: =?utf-8?Q?f=C3=A6_OSS?= <oss@faetalize.dev>
Cc: Takashi Iwai <tiwai@suse.de>, "faetalize@proton.me" <faetalize@proton.me>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: [PATCH] mailmap: Add entry for Valentine Altair
Message-ID: <Df1D8q4zSMqSYWxhXJ06Yx8T6iDutvSRCAaBTq5S5EpfGghkxGxFMK7ZOvoYLpsediiuR0luoDYo3tDh22ZuC2bjRkE67nTPL-U4NfVmSfk=@faetalize.dev>
Feedback-ID: 231676493:user:proton
X-Pm-Message-ID: 955f42546ddf297b63b19011645fb9f6443ef068
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

Map my old address to the one I now use for open source work.

Signed-off-by: faetalize <oss@faetalize.dev>
---
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
