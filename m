Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794092540;
	b=2+s+Vw8sEK9NAu24Wz/T8dlhYoBv51SLGzAj0w/uGHqaOqd0q/WgAsFzfelRI0aO9zLx
	 VmUTCdHSYgcAi26GrX3OLyzhW4HFYwQw0erDYtnLoYm+7U8OOpbr0MF6h6/ElCkW3/sfw
	 vip9cqnuD8WYcVJlZ8Jepnl+F96YMTt0h78mLHeRFbEcFKKDgn7F8TD2PRwEqwAcTUvVi
	 n3wcpoJQlIpoxVmbUlW6P1M8XarFuS+k8LYXE25JjM9wTRf7wSG2Q0iuRh3X+/3CmBYlc
	 0a+Izo3h3xwgt460clwVR2LAj36LOCqIpy6bZzLtGd3phRXvzY2RXHrYfWooReYVEYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794092540;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0hFouMqOeYyeKhZ85sDPfJfrYfZA6d+gJ4WrPszogio=;
	b=Kdxt/9SexyRtFHQc6rjTgWqlxdDEz4BHFQqg91Afe8Witm67E6VFIBDURdqgZhMJTjSl
	 cqO2AuuNJmHioYn0T91NmKJ1x7rfcR+lUs73mYlP1zzs+w7SLM19aynnlg0XlbNZkm3DC
	 ZmvoevtiBOlb0U9w4F7dDBqfV8THLePNiR2D1rxBDj42cCj8pVSjqm8vgZ0l12LdEpG6F
	 /SsmYweMor2aP7Mq80qmGbuGgekplBT3nxeNN6Cotuo/5uD9fWoNkAqYiIKxWCVDe4fYP
	 zu6nAbRfSEa/uaDyf7bQUI4lTVGZ0kfKxkPnVlA3cyIEjW8qhStbYA+ofZGwFC0kX/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rLfkYRN8;
	arc=none smtp.remote-ip=185.70.43.101
Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8F6606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 23:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E8F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=rLfkYRN8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794092538; x=1794351738;
	bh=0hFouMqOeYyeKhZ85sDPfJfrYfZA6d+gJ4WrPszogio=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=rLfkYRN8PyktjxiGFlQTpKqHwO5BSUsrQZwNrMsFry+BGKSNNZq8FUToNoPLEjqMh
	 EswXEKS5BWT9MtZ8Bb79XWC46EkLGsnUlQ4no6H8aaEI7YnYDUplZkrJWhY0nSi8dD
	 Q9XWEgioUkRSX2r+doOYdOGJowkDUekYjchabW8Upevz4M5zb9pyOUlgXNfgqOxDHp
	 sVZhSwZJ8uS011IT3Rww6XdEpBaa/XBJDqgr0Y33gKSwsMSsD51fDqSqyODwssdemV
	 76Dh/22qm7ICEItfLz1urR6JlBwBlE6tjoZo/iXqrZbAd8wkkYNrp7G0JsdNH2LQCP
	 wk/ADzt5tB3RQ==
Date: Sat, 07 Nov 2026 23:02:14 +0000
To: dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com
From: Mauro Codella <mauro.codella@pm.me>
Cc: joe@perches.com, corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] docs: checkpatch: Fix DEVICE_ATTR_WO macro name
Message-ID: <20261107230208.326769-1-mauro.codella@pm.me>
Feedback-ID: 135342123:user:proton
X-Pm-Message-ID: b9297a89896b6ad5ddd8eb990ad47380ae37be5e
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

The DEVICE_ATTR_WO section refers to DEVICE_AATR_WO, which does not
exist. Correct the spelling to match the macro in include/linux/device.h.

Signed-off-by: Mauro Codella <mauro.codella@pm.me>
---
AI assistance: Codex identified the typo and drafted the fix and commit
message. I reviewed the change and ran checkpatch.

 Documentation/dev-tools/checkpatch.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-too=
ls/checkpatch.rst
index 6139a08c3..f8ab22c18 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -389,7 +389,7 @@ API usage
     See: https://www.kernel.org/doc/html/latest/driver-api/driver-model/de=
vice.html#attributes
=20
   **DEVICE_ATTR_WO**
-    The DEVICE_AATR_WO(name) helper macro can be used instead of
+    The DEVICE_ATTR_WO(name) helper macro can be used instead of
     DEVICE_ATTR(name, 0200, NULL, name_store);
=20
     Note that the macro automatically appends _store to the
--=20
2.56.0


