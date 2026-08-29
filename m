Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71EE1409129
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 19:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788032603; cv=none; b=QcZa8J93OYuOUpKKgKByQuxkqA6//lMmmqsnvyZyOIGnR5O2oIOOprG2tCfLJUm/Lck+yqqi+Vtp7Dmr6pOINnbTVlXnfzwQ1k0+P8ytZrCe+6z63z90+P6I4gLb7yNdDLXP0Mme+dQjiTyP1BIzQi3CJPAwqNIgRtFjQZPejzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788032603; c=relaxed/simple;
	bh=IFvVvmjX2mZpey30mo30J5RQZMA0IA52T4KOH0GMTvM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R2pTzFOKOsIreJcNbxVL0iFy4sdHZacigw6y5QR3gTAq2elmtTc0QPe7zOELtYUaU3Od6otnPimRQ4Im7O5ehYQJYv679aZmySRe21rO9WPLIF+jPTfWYUFXyJdcw2KMAs2QG0sMr52rRXZzNHVe+u3RzccTtNptdD+KhGu7bV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCeFa6be; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCeFa6be"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-482e1bfcc63so1583740f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788032598; x=1788637398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVYKdNB/XEBKGA3j23bRZsJH20yuQZjaM4yMJs/fEPM=;
        b=ZCeFa6beg/pxKRD9RvraxbPWpph8Qb2jACVMOSZ9j5z2rFkXzaF/fxGJ1UZ8f2QRTe
         6P0RH2xUKdT2lhH8PNwfSAL+J7py4lKIZJwP1Palu/DH2VLr0xMdeN7CiY38K22KCysx
         Dhn8U/NXRIehLk1Zs3HmcyPHduutd0jyPWl5/rrWW2Qxo3CF0IdClrdCnIFHH3OTcvxh
         znRA51Ge6LZ5BfURBPUT6h4KwbttfpT5BQfU5Ty7hGnOHpWlwKiu/E6rlqtW5VB93lC1
         M1QA03GyNRE4yvAzL+oeZzOVlyd94Tk7CaP5ECOkq5qB0oA1ohc8GpfS4uQRXHg5rGfS
         1Fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032598; x=1788637398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVYKdNB/XEBKGA3j23bRZsJH20yuQZjaM4yMJs/fEPM=;
        b=D4B/oKEN18uOnwKQd5mD08h/Gp+OIzwRrwLWILEy/xH52B9ewIk/cGuAoSLzNpZm9k
         EcJeJq2xhpzdHIxPpT361CpRrQ7ZNIoiPeYLst8aUuNE9UzKTXMblVW0Mt6a+2tq33rh
         DQWf2Se0M8yE6HeEO18sfEDQKRnTsmkLqlOtG+I3WcA8cpU7NuiWSOpganmijKXVMLd+
         GdjpeX1OgJmwHWdtxVkN9SjozV12ggFC0BX3uxo2/bcgNURTTkUetNmPfbDdzrZG5L8Q
         vggOUh+BV3UuedSKnaWIygFjg61Gj1NbuxA15A4wm5Tc0kOcb3J2Lw5gCU2gVbcQdMMm
         ZVDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwvCk+FFLIzEX3KwaU/eVYMkEZCpYLecdnX5s+trH2KO+t/l5CaDiHQfbViIF/p/ndUw7EhlgnMfzII4+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGPWh91Y47xnGluNyRPRTwqbhnRapch157GJ79zh4iOVabhPCi
	lolAoY+F1ZckoHf1i7P+Wxf6cXCcrW0zGRGyXS8Gmlr3AAY021gSnPay
X-Gm-Gg: AYBFou3ecVW6wPSW8ED/Q10FOFygQOSAkmRMl8tFVjLoOmwX4KtUyRGqt+eE6qpBGrU
	+jCu/a3Pzfk8CI5He2cGwGAHCG5TsIEy0qNKIJT3DyMF4hwE09NQycekiraDj1XUstrET64UhB8
	FzTjFUWO7ePyigKZ6n7kPgbDrjD95MLy7nKdJjn4+lD7viT1bvCZVfauXO3sAP7R0gYF9OS84Sw
	nl2zDnzufgP8m8fpg3AKZJbGo/1+xsSZFu9AemxD+cK+bZKiCY7DKVdJ6/nuaJmxxzBJ9z6YNXI
	UkJLc4WvPTcAzpLGF/7yHuwkIKs8tRj5fmyhL9qI1uyU09TGBpomKpXEnjBRW/PByEdbdTotdK3
	6zQ7jibEvFN4LA4AfE0bmHEhJIjiyfrKK97bH9GJqfIzfLbuWVPfP8EfKlNxSSFyz5HmppA/rRD
	/l4katKNDjEc59N5CoVymhwO8geJ1VT4QskbKr2HKiVdPZJtg/qcGWIXJdt80VhqX6FbKJVRRtN
	/bEjZPDeQmUIrEw8MZ/HxgfroN/qX+bpPSqa2Fu0078vC/kEomPmWLNPoGdjN2xvMx7qLC8Y4BW
	t9aEYVRT6X1e+H3LE5FIO1NYMch0wyXJpv5S37kQmLcFX1qgqTBLV3oam9PX6uZKHjU=
X-Received: by 2002:a05:6000:2583:b0:484:361a:1c7b with SMTP id ffacd0b85a97d-484361a20b2mr2894856f8f.7.1788032597670;
        Sat, 29 Aug 2026 12:43:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ae86-1b01-80e2-8851-4221-68d8.310.pool.telefonica.de. [2a02:3100:ae86:1b01:80e2:8851:4221:68d8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843310ab41sm4441984f8f.7.2026.08.29.12.43.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 12:43:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH] crypto: lskcipher - preserve state across unaligned chunks
Date: Sat, 29 Aug 2026 21:43:14 +0200
Message-Id: <20260829194314.42685-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

crypto_lskcipher_crypt_unaligned() splits a request into page-sized
chunks but never sets CRYPTO_LSKCIPHER_FLAG_CONT, so a stateful algorithm
restarts from its keyed state at every page boundary. It also marks every
chunk CRYPTO_LSKCIPHER_FLAG_FINAL, which is wrong but harmless: chunks are
trimmed to a multiple of the chunk size, so the trailing partial block that
FINAL guards against is caught after the loop instead.

ARC4 is the only lskcipher with internal state, and cbc, the other
in-tree user of the direct API, never passes more than one block, so
this went unnoticed. bpf_crypto_crypt() however hands
__bpf_dynptr_data() to crypto_lskcipher_encrypt() unchecked, leaving
both alignment and length to the BPF program. An 8192-byte ARC4 request
offset by one byte comes back with its second page identical to its
first: the keystream is reused.

Set FINAL only on the last chunk and CONT after the first, mirroring the
progression used by crypto_lskcipher_crypt_sg().

Fixes: 0ae4dcc1ebf6 ("crypto: skcipher - Add internal state support")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Reproduced on a Raspberry Pi 400 (Cortex-A72) with a BPF program that
creates a "skcipher"/"arc4" context, takes a dynptr over an 8192-byte map
value, offsets it by one with bpf_dynptr_adjust() and calls
bpf_crypto_encrypt(). Unpatched, the second page of the output equals the
first; patched, it matches an aligned run exactly, final state included.

Rebuilding that needs two programs: bpf_crypto_ctx_create() is KF_SLEEPABLE
and only available to BPF_PROG_TYPE_SYSCALL, bpf_crypto_encrypt() only to
SCHED_CLS/SCHED_ACT/XDP, so the context passes between them as a kptr.

With CONFIG_CRYPTO_ARC4=m, load arc4 first: arc4.ko advertises only the
legacy "ecb(arc4)" alias, so a cold create with algo "arc4" fails with
-EOPNOTSUPP before reaching this path. CONFIG_CRYPTO_ARC4=y also works.

ecb(aes), cbc(aes) and cbc(camellia) were checked the same way before and
after at several lengths and misalignments and are unchanged; with generic
ciphers they have alignmask 0 and never enter the helper.

The helper is not dead code, in case removing it looks tempting: ecb() and
cbc() inherit the wrapped cipher's alignmask (crypto/ecb.c), and geode-aes,
padlock-aes and sparc64 camellia still declare one, so those instances use
it today. They are all stateless, hence unaffected by the flag handling.

Not an unprivileged surface: the crypto kfuncs need CAP_BPF, and
bpf_crypto_encrypt() additionally CAP_NET_ADMIN.

 crypto/lskcipher.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/crypto/lskcipher.c b/crypto/lskcipher.c
index a8b07594005db..6c30436a11354 100644
--- a/crypto/lskcipher.c
+++ b/crypto/lskcipher.c
@@ -75,6 +75,7 @@ static int crypto_lskcipher_crypt_unaligned(
 	unsigned ivsize = crypto_lskcipher_ivsize(tfm);
 	unsigned bs = crypto_lskcipher_blocksize(tfm);
 	unsigned cs = crypto_lskcipher_chunksize(tfm);
+	u32 flags = 0;
 	int err;
 	u8 *tiv;
 	u8 *p;
@@ -98,13 +99,16 @@ static int crypto_lskcipher_crypt_unaligned(
 
 		if (chunk > cs)
 			chunk &= ~(cs - 1);
+		if (chunk == len)
+			flags |= CRYPTO_LSKCIPHER_FLAG_FINAL;
 
 		memcpy(p, src, chunk);
-		err = crypt(tfm, p, p, chunk, tiv, CRYPTO_LSKCIPHER_FLAG_FINAL);
+		err = crypt(tfm, p, p, chunk, tiv, flags);
 		if (err)
 			goto out;
 
 		memcpy(dst, p, chunk);
+		flags |= CRYPTO_LSKCIPHER_FLAG_CONT;
 		src += chunk;
 		dst += chunk;
 		len -= chunk;

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.53.0
