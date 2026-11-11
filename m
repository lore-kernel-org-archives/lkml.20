Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396724;
	b=zT5hay3bq0rIDmgI2I1sh6xqsYA62Umbv9OTJ//BuQvFOT6JugZNZNIvn0Sx00y+PX7q
	 U3kbyH7PbEVFvlQSDLUFOXSHSh8Cwzc1+rwlRF0U9QdCKNJ/7NqlGVtWGk6BlgORO0klK
	 Tf3JbUgDovlBQoxHjjjwesD6bG2poIqHPPjr+0llMLLprJMgp5PLE/o8QA1O24dZtpnki
	 oirwObLG9pgtzkPBzpnJlDGNOaRCrvQYVBfKrTVj8O0JS+feTF1rjgb+dTODXlWQfvIuG
	 ujZ+C9IwrBJdtqoptj6y8YBkueeuPSk44cbTCSirN0+BSH+3+QKL48IIFuw7CAsdH/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=frBVeqwplwR5m53kO6bZ3ZT+hKJmGjH0RV1j/WWknVA=;
	b=YqEc13xXCaZt28zgW9USBwGbE9XGU1Yoaaxx508k2yyiX50m9DjbIMejTBxlo2oArPBN
	 YgyYtuDWtY+d+THIjAVoitvukwPDeg5/7aigSXsBoiadFfsJXvyrMUsv5z+gMuYMnyjle
	 Pms2rhMQKD/VyZLIcLeMdL7MebSyBR1l/CMwp/YLi/2CRzcQa6mLjPVzSbdt733UvoIdq
	 0ySNr5jyaHFE/X4jaLdFFgxApW2o5bLYT0L0Qr3gExLufvo/RyA+L7W29OR5xvYsga1za
	 WbIuiKE0rTQzW6kRo+MTHKx+rM1uyXXytkVn771gxEIIChp/A8oRKxnOan/nmHmaHpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4PoGpfH;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF010606A327
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF010606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4PoGpfH
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so4536897a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 03:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794396722; x=1795001522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frBVeqwplwR5m53kO6bZ3ZT+hKJmGjH0RV1j/WWknVA=;
        b=U4PoGpfHyccAxe6YWR560fSnDkpHv3Yeg5xxrEVC4Hj0TjnpBUynJsx44WtCSTeKTS
         yW8oAd70S4cmgVDBonuTBLMQChfXGVi0/BsFxBqm9znzrxrcEI9MdwEfOu9YNlg7f5f2
         w1SPvXaGLqh1N5GnEAWNaRXlXY3Y/yWzhjyGR7+TiXjBh7WSEyvIbvFTg6pNUf9znzKl
         POXH2qpaJdPBlFllhjFAS6R1ZV/KR8ht1P1XiniROewt2Xi/7a1lx5o35oTyHww9HeFD
         8ihjAUdTf/FS1+TZwnkgOXrlZlMZnbTzRBv9q1w1gghyFdCDJxUiE8PCzDswqZYZ5CEy
         DVSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794396722; x=1795001522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=frBVeqwplwR5m53kO6bZ3ZT+hKJmGjH0RV1j/WWknVA=;
        b=e8Zk3GF8l6ZXLOo5fOx/uaT1e5kViPJgVIqqlF7RgrH6lCrFHiNezUP9Y9JgPem/25
         fyshTi586lo0oiWTePBmRkwejP1lbLnRz/ir6ltT3H6ZnH76PsWjKs+2OR+jwz9gy1bl
         wWR5mEqfoFoh799hbRK+l4ne3NkNsV/mE1WFVdWKfiEtuvasNKSZmQ0mZU6iydq9bFxv
         A2KLRCPoM+0DqM5lxTvkSkXOIe3w7p4TwwksJrL50faJpkQEbXBLR+ImGhkhUGj+c/pf
         m2EWHCXImBpAMyIHaYq8pPdA/YZzeYaQb+5YOegUFc2nhKC7WQF/fkKtplxkfKd+DeAj
         /4/Q==
X-Forwarded-Encrypted: i=1; AL+hErGikBIt1A3toBVL4QFEUa7tABil+VRd0tzR9jJK3hoaPjCwX6H8dRnPvGvBIRspKjPsoYs0r0hqOoFhDRU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uo8yVSZoPW9R1V/jZnSDZtiwz7BZwWDnbWJRj847teQaLMyE5
	j7LgPgGdJH/3rJK6BCJEy8Uc4pJdQGRcOsdPLzbFeiJdg3716KGej2G9
X-Gm-Gg: AYBFou1qCh0mzCFUkqdtzqsOwsgyBI2g1sO/vPNGdeVmYEaZFb/Up7e99oCaQEvXask
	VoM215S+euKNjxK3mV4AufcKA5/AcIvfrO3WrZSGIxJzbFr4sMbf4bQBKZ6TH0yLDgzIbxbaven
	oCI3E8DtT37kBQ4mxQz6ohc68R+qoJ3AUOftcgUs7bSo2gmStk+/yxQzSq4C52KygXb3yyLjg3u
	ODyX75Iyf7SqIzVRPhEeQAivJwg6Y1FeVvO/K11FdTgis5P9K9e3DeNmRrVMLlZViULYJrl1/UE
	ggvIEk0NFeK7TPF8G/JpqBtD7vasGSLGXSk6SqFMkp+LI5eRbdOPBwsK3FQrhs9nzoSMC4f8yR8
	uPjK0tBbbsKDr6WIfrQAnm/9zdhNItj/S8XUQe/0k3xeufkaL1BjwPPWbbCVG3ScOZjJk/Nj2GL
	Rl66snATXQbc50OmBOXjFKWZrrNAPwCprrHQOg2eae/wg9KdbSSHJnaXdMz2dgj/NlCA7IgpFc/
	AcVJ/CRnWu2c4xgdA0qWWAc4LSutkG5SNXwaG1OywZnUn2bU802hox+tas0S9lUXxnv4FzD3pPp
	4POQTFLkSX5hhO4urAEkNxtpAxc28ZLRoVab6Cizu9lyxAcGBxYy7Ws=
X-Received: by 2002:a05:6402:a646:b0:6b4:6464:8a8 with SMTP id 4fb4d7f45d1cf-6b777707042mr1155901a12.27.1794396721909;
        Wed, 11 Nov 2026 03:32:01 -0800 (PST)
Received: from IRS-520670-Linux.atlascopco.group ([147.161.188.115])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7579031e0sm2309141a12.29.2026.11.11.03.31.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 03:31:59 -0800 (PST)
From: efecanicoz@gmail.com
To: lukas@wunner.de,
	ignat@linux.win,
	herbert@gondor.apana.org.au
Cc: davem@davemloft.net,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Efe Can Icoz <efe.canicoz@atlascopco.com>
Subject: [PATCH] crypto: rsassa-pkcs1 - Allocate the RSA buffer separately
Date: Wed, 11 Nov 2026 12:30:22 +0100
Message-ID: <20261111113022.2033191-1-efecanicoz@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Efe Can Icoz <efe.canicoz@atlascopco.com>

rsassa_pkcs1_verify() allocates the akcipher request, its private
context, and the RSA input/output buffer in a single allocation.
The buffer starts immediately after the request context, whose size
is not necessarily a multiple of ARCH_DMA_MINALIGN.

Although kmalloc() aligns the allocation itself, this does not
guarantee suitable alignment of the interior buffer. On systems with
non-coherent DMA, the buffer can therefore share cache lines with
CPU-accessed request state. Updates to that state after DMA mapping
can interfere with the device-written result during cache maintenance.

This is reproducible on i.MX7D with rsa-caam, whose request context is
48 bytes while the kernel DMA alignment is 64 bytes. CAAM reports
successful completion, but the recovered output retains the original
signature prefix and PKCS#1 verification fails. This prevents the
shipped X.509 certificates and regulatory database signature from
being verified.

Allocate the RSA buffer separately with kmemdup() so that it benefits
from kmalloc's DMA alignment guarantees and does not share cache lines
with the request context. Keep a separate pointer to the allocation
base for sensitive cleanup, since verification may advance out_buf
past the leading zero byte.

Fixes: 1e562deacecc ("crypto: rsassa-pkcs1 - Migrate to sig_alg backend")
Signed-off-by: Efe Can Icoz <efe.canicoz@atlascopco.com>
---
Tested on a custom board with i.MX7D and i.MX8QXP, running Linux
6.18.37 with:

     CONFIG_CRYPTO_DEV_FSL_CAAM_PKC_API=y
     CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=y
     CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=y

During diagnosis, the selected signature driver was
pkcs1(rsa-caam,sha256), with a 256-byte RSA buffer and a 48-byte
child request context.

Before the change, hardware completion returned success, but
verification rejected the recovered output because it lacked the
expected leading zero byte. Its prefix matched the input signature.

After the change, the sforshee and wens certificates load successfully
and regulatory database signature verification succeeds.

The cache-line interference described above is supported by the
allocation layout and the runtime comparison; the exact corruption
sequence has not been directly traced.

 crypto/rsassa-pkcs1.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/crypto/rsassa-pkcs1.c b/crypto/rsassa-pkcs1.c
index 39137476ce81..87243458eb5b 100644
--- a/crypto/rsassa-pkcs1.c
+++ b/crypto/rsassa-pkcs1.c
@@ -237,13 +237,15 @@ static int rsassa_pkcs1_verify(struct crypto_sig *tfm,
 		return -EINVAL;
 
 	/* RFC 8017 sec 8.2.2 step 2 - RSA verification */
-	child_req = kmalloc(sizeof(*child_req) + child_reqsize + ctx->key_size,
-			    GFP_KERNEL);
+	child_req = kmalloc(sizeof(*child_req) + child_reqsize, GFP_KERNEL);
 	if (!child_req)
 		return -ENOMEM;
 
-	out_buf = (u8 *)(child_req + 1) + child_reqsize;
-	memcpy(out_buf, src, slen);
+	u8 *rsa_buf __free(kfree_sensitive) = kmemdup(src, slen, GFP_KERNEL);
+
+	if (!rsa_buf)
+		return -ENOMEM;
+	out_buf = rsa_buf;
 
 	crypto_init_wait(&cwait);
 	sg_init_one(&sg, out_buf, slen);
-- 
2.43.0

