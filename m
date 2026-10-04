Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BD32F764
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 04:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791088465; cv=none; b=i+X9g2ZkSb/G6AU9FkuSKeYLuIOeMgeQ60QUy8WRz1Xlt6r/d54UZTA3QvulmY5l/w4oUBCEtXxamAtDHB8srEsKIX4nDthN7nGDasWXIaVN1W6tvYt722uhs1DZcMIp549sItmdDjWJFKgR1dJfUvTiKPUe2fccMSm0LYMQngw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791088465; c=relaxed/simple;
	bh=eOJroCEzUg20LIcT5kdsMvafVDt/htmU7I2wtynufTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mLZ4UfHj0wGvg9JxW4JhoiCpcRkn5ooZ/UWnT9cLjWUmbp94zL7Svs+ejZIgxk42/Kbiw+Wr8lGYvMNlp061gMGfvDEQzgj4WfrlD4tuEQoeS9QRMgAH0H2l2bDFJ/l6/bZRgkFdup9/WOa/cnSTkPs7A2OJJ2pnpBv/FW6GGKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pXKFqMSo; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pXKFqMSo"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33fb4680717so2062438eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791088463; x=1791693263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lij0dHcd6a3wl8+hMVYGItOL2a0NxZaK7HaD/YGzx5I=;
        b=pXKFqMSoJmMkYRK8wRM3fhQc9ZU8bnKdEmvZQ3Rs4sRH9DJEAnrrOqS+JVjYRq+H08
         rBz9XVFBKf6CjUO8BAFhGF+ns9wZySDmc27SOPHhcBKrzBiSXCRMVfaj0YMtr/ygOKA6
         Ab6oUawB6SSrAgAtH/U7o7YpO3fReWyYnP3OaUyaFtLHF7+UAPlGRmC09dlo2trTECWf
         l9bJMjWF9BLMfmpvFrKr28Y+08aoC0aoYtGDvT610lboxNXDc6BWHtkkVO6CZOCeERwE
         ahoHCZnn+yjmeIFZ9v9H4STg/Un2n1YhHXN5Um4ziBJfH7+n19Fc0PX48rW2ofnbyQVW
         Hd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791088463; x=1791693263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lij0dHcd6a3wl8+hMVYGItOL2a0NxZaK7HaD/YGzx5I=;
        b=z+VdqsYRU6Kv0gzLcU/7nPYb+yNsXvH+kV+0ye15SHSfQWjweNQ+KEYOlQswDf0CCS
         ezyz0kb8/4jFZhRJrqX5NJPV9UuH3mtOFPLHB2W6wVygvcflpTnyLhWaL4ipJD5+zLI1
         0hggJJxangAVJXrW0+SWhqMcY6MvaymfCy/Jp0vIRkhaq+esTXYLNq9aK5AkKE7TjuXt
         nGK2yyu/fbCJcywWKaLLpvnOmxFF4p0nZmyr0A9JA58NGuk2sSUo8D54WebxZj3ap4y9
         sDq7yWPji/MklYMArrzbJkITBv7t2JUNThAbaO2FkBnsnaLYOR8ymMAU5rpM1E2+2OQV
         f5Kw==
X-Forwarded-Encrypted: i=1; AKwUvBzKnPDPiT8ygaWa2qhTD7RLBphM1AZt8Wg/CrdKH1NxS4MP6isSEetYs95h8gcVuc/ayeccUfsEtUOVeLE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDOao0oe7aZqsFGUYL71PAA6tTzx7ImGSuHd1C6AOuB0aIDOHp
	Os6tXW6c0Zv8x8yaAcvFLYh0PIl9f2z+26kPfEjWkwl9uqd6G9WQE8M1
X-Gm-Gg: AYBFou0hzbFOL2YgNYTaxTHYlUhc6xvCLiq6RLnRbuWY6HX1MQ9bkW1cNIhKEykaicz
	0D41u4IpAEh2q/nzHj4B0ytzhHsGqYWWZRpJRKnNL+nxg7MYdQ/rocnfoPWJ9cP6GalmDBSIKGA
	f18xyc63YhoTfsyYCpFg6c7Mx5Zqj3oaabCC9T9s9wJsipNVOqYg1RNgkobA8SxfJCBW2mFttnd
	Olx/oSLnbCASlFEpKRtNfJDOqKDlF+nW5Wf3kmNwiI793+sX0zb0UDcdepbS8lF7MEIOL+qYE/Z
	vwLVJKhYVTIEOoXhiTCsSvbdy+u+NtqR8clPQdyT8GoJ8y4zgc2yBE8udoqdnIwIFWcQF2bpero
	1VM8qnJeB1s9RS81/fCDChZKvj4N4Qz6BMmbBXa+kzc7CzN6UKWq4mVm95aBssJCiMtXhlk3GuY
	cym7laK+w30UYtqAh3sR6Lp1/qacQBaxRNE4NtH9udAVuhp2GY8yxRADYzKCA3vwQJoQ953wT33
	girndS/FyKur7Ar5zBhiltDSQ0e
X-Received: by 2002:a05:7301:df43:b0:34e:f8bb:4e2a with SMTP id 5a478bee46e88-3511162fe7dmr4629978eec.10.1791088462592;
        Sat, 03 Oct 2026 21:34:22 -0700 (PDT)
Received: from kernel ([103.219.206.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351271847fbsm2366660eec.15.2026.10.03.21.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 21:34:22 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: ebiggers@kernel.org,
	ardb@kernel.org,
	Jason@zx2c4.com
Cc: skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	jkoolstra@xs4all.nl,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] lib/crypto: chacha20poly1305: zeroize state in __chacha20poly1305_decrypt
Date: Sun,  4 Oct 2026 10:04:13 +0530
Message-ID: <20261004043413.6870-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `__chacha20poly1305_decrypt` function does not zeroize the chacha
state, unlike its encrypt counterpart. The regular
`chacha20poly1305_decrypt` function handles this by manually calling
chacha_zeroize_state(). However, `xchacha20poly1305_decrypt` returns
the result directly without clearing the state, leaving the derived
chacha20 subkey on the stack.

Fix this by moving the chacha_zeroize_state() call into
__chacha20poly1305_decrypt() itself, so the helper cleans up after
itself just like __chacha20poly1305_encrypt does. This ensures all
callers are secure without needing manual cleanup.

Fixes: ed20078b7e333 ("crypto: chacha20poly1305 - import construction and selftest from Zinc")
Cc: stable@vger.kernel.org
Suggested-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v2:
- Move chacha_zeroize_state() into __chacha20poly1305_decrypt() as
  suggested by Ard and requested by Eric.
- Update subject prefix to "lib/crypto: chacha20poly1305:"

Link to v1: https://lore.kernel.org/all/20261003060826.7792-1-raizudeen.kerneldev@gmail.com/T/

 lib/crypto/chacha20poly1305.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/chacha20poly1305.c b/lib/crypto/chacha20poly1305.c
index ea42a28f4ff7..80904321458b 100644
--- a/lib/crypto/chacha20poly1305.c
+++ b/lib/crypto/chacha20poly1305.c
@@ -137,8 +137,10 @@ __chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
 		__le64 lens[2];
 	} b;
 
-	if (unlikely(src_len < POLY1305_DIGEST_SIZE))
+	if (unlikely(src_len < POLY1305_DIGEST_SIZE)) {
+		chacha_zeroize_state(chacha_state);
 		return false;
+	}
 
 	chacha20_crypt(chacha_state, b.block0, pad0, sizeof(b.block0));
 	poly1305_init(&poly1305_state, b.block0);
@@ -164,6 +166,7 @@ __chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
 
 	memzero_explicit(&b, sizeof(b));
 
+	chacha_zeroize_state(chacha_state);
 	return !ret;
 }
 
@@ -186,7 +189,6 @@ bool chacha20poly1305_decrypt(u8 *dst, const u8 *src, const size_t src_len,
 	ret = __chacha20poly1305_decrypt(dst, src, src_len, ad, ad_len,
 					 &chacha_state);
 
-	chacha_zeroize_state(&chacha_state);
 	memzero_explicit(iv, sizeof(iv));
 	memzero_explicit(k, sizeof(k));
 	return ret;
-- 
2.53.0

