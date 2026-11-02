Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793600989;
	b=WbY+vuIdybwkQIGqRq6+dbgJN8aovrxO6hq5wX7W+oixa6j8crGaK8QsrqVBD9oDHM7e
	 dymvCIdp0EDiV0cQWEG2j6r7Df6GLwXxinDbHP5oYq3Sq97JZzY7s6C0Ar7I4lsQl3mKe
	 M3JEChT4oJC2FZy3gHtvYBmkxHp4PIC9DcwF+983KkQwdIN9Zq/h+GGbgnrr1vOuFcn1h
	 q+9tqYMcVm22jkXiSR5wT1kn+vS57V4/kFTRPN2zZ5XYCAIt+1V0wfAWa5Dju1BCl8LJN
	 0nopVgnBcM/Mb8q/Z271Uied7BqrtfsDyg4fw4s/VtpVYer0j+LHlhtSVjq6Gi3NmTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793600989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f+38X7/93OJZ0w0/yOS0NSZnjJd7UdYjHJOWwQOd+XQ=;
	b=BATRXkEcKFSD8zXTRzS0F4KlvQwSPFT1VAJ/H4R+sPVpRkS/m89+LEXjGFYgtVntc8h/
	 MTvfQD/o4icLjD0NHlXhR8+oHwlZeqJTCs1BOhC5ywVUfpGiLEP0b90v14w3p5etFOQ2f
	 KDRfZ4pOlXj2q6udzJJp5hpk/uCLhZlacJ06NpGiGcPDfPuoVM42+IfZT4ksHh40AahkE
	 y3kS1QZHoxCzBJpLwES9y6URy6ecqs1SLYJMZxe8DIthzK/cash5XUCMuN6nZHbJ2WQ1a
	 vEp57SrRK5H+qCjIW9/M/Cbm3mY27870fy2VWyFoJXrxwklLOp1Umf9XOd59+mH4tvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O+o6V/9G";
	arc=none smtp.remote-ip=74.125.225.133
Received: from mail-wm2-f5.google.com (mail-wm2-f5.google.com [74.125.225.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5122606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 06:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5122606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O+o6V/9G
Received: by mail-wm2-f5.google.com with SMTP id 5b1f17b1804b1-4a35e178418so14574655e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 22:29:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793600987; x=1794205787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=f+38X7/93OJZ0w0/yOS0NSZnjJd7UdYjHJOWwQOd+XQ=;
        b=O+o6V/9G9qcrrD5uEeY2MT+wwGYpdxNfuZr21zm4ab+1ZltYZ2gkMCBCsbjvyjVlEb
         AIUueBf5hhZ9jwJb+5cWZleACmSXRGXXW2txSSX0P+3Ne45UMVO/Y5kZNTcc7lns/Hai
         X27+LuWKvzxAas7iZ/Jz4ErRg11mD3Dx6AWxzB1KG5tRUaFe1bFfPb8zVUfcfp1KoMA9
         izPXC7IBjzrl/egWOPtKNF9XlEoToCa8s1TfmEMhrcwUmiHSsHIHfBO+FS5WOCgUVkJE
         +uDT8m2BPBg0rvyn1roa4hIW7apuYIzQQq9N7qMsl9y5w06XzdE+uYtMJddsopVt1/UF
         5Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793600987; x=1794205787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f+38X7/93OJZ0w0/yOS0NSZnjJd7UdYjHJOWwQOd+XQ=;
        b=Hsd+FH3zJ9TaGxBgBmnrRDt2x6ZG05zL2SjyXS29CtgyUfIsi9ilI46wLD7ziEvqos
         nAWadRppz2B14Jy/uUBZre8qafrzdx++QnjAIbY1BSDPOSiv2iwP6AgJ0cH99r0DFsEs
         g9e01pXV4/Ghj+u3qa8ajsoFU1qxzUO/Dt+0prqpEBF8XdClPD/cx368qhEpL07Tf/5P
         vhboMcOPU4MeEnL8HX0OtOpx+vBLoyZ2Sv1li7JVZDUcd2eJmPB/nClfBcvPQAkp9QV2
         xKxTn1d8SHZ6kViYxSJo3ji2zyQZshGvbWMjKSpmIbvbN4nVez/JBjQ9ISv2sPvxAxUw
         2vNA==
X-Forwarded-Encrypted: i=1; AKwUvBwli1a1UUnhS8biX1JEySGTRydWYPSPcasxBWYf2+KgkUgMcbihiE8HjGnxDX1I756yRE3wkDqioYHE91Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaBw9EE+ScErQvPkBW8QOVtr7ao77DsjwYEYKJ0J1qYbm6rWfk
	eTJvdU64FbipFMniIry40Tt5jHnF2+HW8W86LpsemvoMReLG2wg5wAza
X-Gm-Gg: AYBFou3GdPWIZLTcz/SSVWFZ9k2yw51kXrAPsF7uwSBAQYYEDhxhcL0f9s5a08NNUGn
	yoJ9/y5+oPJ469lUKky/V5u8uEkJPVRyHDvCDJMcV6RNTP4vGflnxAqbP3eeGqaGN+AhOrtnRMh
	gmWwh5Tx9hVy2NC9XItMDfB+2luZAqr+VoulQjLM3fz20U1QVSL+CKn7X+HRmjYALgtvHi2AEzN
	gXo7/9qwpz5+qj/oZ1bJoCVV6WYCD3Y88fWpYXl7+1OK/j+GURIjqKf+rjcX+6TwjU3TVDChhD/
	MHjE0AYIcrNDS4X8vRrhYU3q5OGtr1zFYnOOFGqnyfA4qa6XuvGrPiQ3jw9ZKHN6kd76mu5V9V9
	hAoNszmZDtG4IujSj7PhgnlM0y85+avBRxC8e9RmvvPemoXWoDLcofKHTD5Tgnkabm5mcxfWimT
	yOoKVTpwM+ro6EG9GPTfXQMhTI8n2TeNzRjWgW8e6HgSCyxmkhvdF6LMEH03gXs0hUhb+1Rhw4C
	+HQhg4lS+AcNxUN3gHmCReLHojeouy+HUnJhuQcvoTj645mh8EcYEvQEGuJybJv1afu0DZe3vOA
	suih9Jy9EV6F0OAxmzlntb30IJeQVSHZJ9rX7QHVvxBk6g==
X-Received: by 2002:a05:600c:354a:b0:4a3:5a55:f454 with SMTP id 5b1f17b1804b1-4ac17e10ac3mr219059815e9.19.1793600987081;
        Sun, 01 Nov 2026 22:29:47 -0800 (PST)
Received: from localhost.localdomain ([78.40.184.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf751c2d2sm273759905e9.15.2026.11.01.22.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 22:29:46 -0800 (PST)
From: Roman Demidov <roman.demidov.nn@gmail.com>
To: stable@vger.kernel.org
Cc: Roman Demidov <roman.demidov.nn@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	Joachim Vandersmissen <git@jvdsn.com>
Subject: [PATCH 5.10 v2] crypto: ecdh - explicitly zeroize private_key
Date: Mon,  2 Nov 2026 09:29:08 +0300
Message-ID: <20261102062913.6603-1-roman.demidov.nn@gmail.com>
X-Mailer: git-send-email 2.53.0
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

From: Joachim Vandersmissen <git@jvdsn.com>

commit 73e5984e540a76a2ee1868b91590c922da8c24c9 upstream.

private_key is overwritten with the key parameter passed in by the
caller (if present), or alternatively a newly generated private key.
However, it is possible that the caller provides a key (or the newly
generated key) which is shorter than the previous key. In that
scenario, some key material from the previous key would not be
overwritten. The easiest solution is to explicitly zeroize the entire
private_key array first.

Note that this patch slightly changes the behavior of this function:
previously, if the ecc_gen_privkey failed, the old private_key would
remain. Now, the private_key is always zeroized. This behavior is
consistent with the case where params.key is set and ecc_is_key_valid
fails.

Signed-off-by: Joachim Vandersmissen <git@jvdsn.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
Signed-off-by: Roman Demidov <roman.demidov.nn@gmail.com>
---
Backport fix for CVE-2024-42098

 crypto/ecdh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/ecdh.c b/crypto/ecdh.c
index b6f493e82812..c37e8d35387d 100644
--- a/crypto/ecdh.c
+++ b/crypto/ecdh.c
@@ -33,6 +33,8 @@ static int ecdh_set_secret(struct crypto_kpp *tfm, const void *buf,
 	    params.key_size > sizeof(u64) * ctx->ndigits)
 		return -EINVAL;
 
+	memset(ctx->private_key, 0, sizeof(ctx->private_key));
+
 	if (!params.key || !params.key_size)
 		return ecc_gen_privkey(ctx->curve_id, ctx->ndigits,
 				       ctx->private_key);
-- 
2.53.0

