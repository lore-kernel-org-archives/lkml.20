Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6B379C2A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789851989; cv=none; b=t5Xw5eoadsgu1RmM2qR0+H1QI2ODHmkLqQCOfDPGBx1+4Bb4vf1Ub298oEKNggK9WYH3HywyK5uY+2sm396jZDsCkEh45ANAfQtwVn7YYVLwD6u+GXSxwCb1+Xtbkoj5cck8TE407nt7wmTkaMULTjHdvAL4NruS1yqhxdKOq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789851989; c=relaxed/simple;
	bh=YpFXCcWC+f8zfq50jLpqo2PhwT5q/u9qcZiP7EW/z5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PGCoe9s0QL9oKn7/ioXw3Blp6S5avL8RMHxO/mXMJkLSHSV+GUou7w94Wkwmvbs3Lf0ehowbnJHNuy3U3Xid6F0H8zU9ypVRnwtm9xRrphnfCX27wqIleZBRdg1RsblmfIRJHddSYsuHuACgQoLPAnXZcvyX+i8k7KQW7wUaWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GF45jw8s; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GF45jw8s"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469f20513so1557790b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789851985; x=1790456785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=esxfXy5+ZI00ZmVTGFChQhsw5tJgHXOLHzaPDUlQPf4=;
        b=GF45jw8sXIIhEY1CVoWh8USyC+mDrhXjY1qRn4XjAoKWnFSieopFFysDUfhXRKwulX
         +d13DCtxlgewFf3ZOwD/rB7zCbumxS9njOYTrOSTQBbnY67zy8TXs8mXKDJhzIZYLEY3
         h/0zUCaUnzTSta1O4m6hg+LNHwLu1+eaGeSb9xtr0ErXBMkuiwGfz8Y+plMYuJYdNqXF
         1DAHa/73neij5A3W56bp6tjApLTwjeDr0l6h+7iQtq6pRFsZSVT/WT2YgS308d+BXtvj
         F9p3nN9JgqUoQhmRng7iVMhDpTJ6VDGA4WggqmkVbPtnoYAlkyizXM5U2AkzK/sYe5r8
         Z28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789851985; x=1790456785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esxfXy5+ZI00ZmVTGFChQhsw5tJgHXOLHzaPDUlQPf4=;
        b=M5QYQRos332/26b6emnIP2wZmhGR/b5xxT0edaKrmAKC7UFvo8SdNyA3Y4D58dEFst
         pxr19R+Grz+lYtViZcEilGkH6OUalz3VBz/SC6QQTcf0nf8l3tcCUtrBFAsJCO3s4l3q
         hDjpdv+4v426krqh5DgPQW/ER3w+sxor73QMDEZZQuZA8LYt9vJdQVwjdcCFPA7uY32X
         GaxK4j3IhPWSWD13etO2eLywt7DgQ8TrMiX3OsggYg7Lvnvxhw5sp9vIBuQzadZ7RJvk
         3bTTG0XoMDWATV1sPivBMUvpvBWxKm0feQu+LR1F+RL0WuHUmPZ2hwuD/MTF0t4bs84j
         0IPA==
X-Forwarded-Encrypted: i=1; AKwUvBw6cIiTZoBuNFu72gWEOswqgjvfVaIlA3XAO9ViQZrsBc7ak6O3WuNQdM5PRttGy7wGYm5Gm/WJXyV3JDg=@vger.kernel.org
X-Gm-Message-State: AFuF++k17O7k8EKAzonRjT7kMTnWh1PuVYt4cNW1P770GIk5urYTpNbW
	Zg+3aIJcjUTbav2mOk+43YUvpqMDwN9CE6zLIEWU2TVxwmNH9cuhGv/f
X-Gm-Gg: AYBFou2uD5oqMALXUTmNiUZ4eRUxRU0Twr2o2oW27tWUXup73vT55HWD6G1wglYX8UO
	s+o6IYL36m52sav8D3JS3sbYI+bueUHlsD34NBWcoOz6XkArAynccXKjckUfwiImMdphQQ7ynZC
	Uo30z6xT+ko90VR7ud3lCcWQ2J/ENWAxCEM2N3SncUBB+rVa2oz20XPBf++br4m65TUN818C42s
	+2NvzeSeTMR63S7n94ikclwa6XzBOH2g3beSym4uEGh+8RRMtFfQM05vPGUCCFas6NgX9oAVxyy
	SznSKXitPxDwAUZPz+aWHOSOyR0U1/JcxDpJwPf30Cg4jAMx1y9UVrIKfwWZurqOoIrIVmYDwFb
	6UBfeJL7y7RD2FZSWCeKguwzxT5m0ksKfmnb1ztH9iiONFGsDMuLKN2a0c/kgONd+zdOfJKXRsr
	jb8Ltrz4a6x2jUIGvyQxwN/JpoqWgH/yS7xfMsRC475OV/Id246q6+0ItubbJYdruSUWkZDtITW
	uEJb9iU3P2ZAtVuCkQKCE+jAm0qryaZIzW42V6UKoJBlX5fPEfbFNMn+5UFoYxjFDm1A5iQ0+6J
	6j8sBrUsK1yike4l8xLP
X-Received: by 2002:a05:6a00:37c1:b0:878:391d:b217 with SMTP id d2e1a72fcca58-878391dc1e0mr1745784b3a.60.1789851984644;
        Sat, 19 Sep 2026 14:06:24 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a8dfe20dsm1341051b3a.19.2026.09.19.14.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:06:24 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xfrm: reject sub-32-bit or unaligned alg_trunc_len in attach_auth_trunc()
Date: Sat, 19 Sep 2026 21:06:23 +0000
Message-ID: <20260919210623.3030144-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In attach_auth_trunc(), userspace supplies `ualg->alg_trunc_len` (in
bits) via XFRMA_ALG_AUTH_TRUNC, and attach_auth_trunc() only checks that
`ualg->alg_trunc_len <= algo->uinfo.auth.icv_fullbits`.

However, ESP and AH convert `alg_trunc_len` to bytes via `esp_authsize =
ALIGN(x->aalg->alg_trunc_len, 8) >> 3` or `ah_authsize =
x->aalg->alg_trunc_len >> 3`, and pass `authsize` to
`crypto_aead_setauthsize()` or `ah_init_state()`. If `alg_trunc_len` is
not a multiple of 8 bits (or is between 1 and 31 bits), integer division
by 8 truncates the requested bit length (for example, `alg_trunc_len ==
7` yields a 0-byte ICV in AH, or `alg_trunc_len` not divisible by 8
mismatches the ICV byte length between AH and ESP).

Reject `alg_trunc_len` values that are not a multiple of 8 bits
(`ualg->alg_trunc_len & 7`) or non-zero values smaller than 32 bits
(`ualg->alg_trunc_len > 0 && ualg->alg_trunc_len < 32`) with `-EINVAL`.

Fixes: 4447bb33f094 ("xfrm: Store aalg in xfrm_state with a user specified truncation length")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 net/xfrm/xfrm_user.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index a2587c7e796b..d56a0095113b 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -698,7 +698,9 @@ static int attach_auth_trunc(struct xfrm_algo_auth **algpp, u8 *props,
 		NL_SET_ERR_MSG(extack, "Requested AUTH_TRUNC algorithm not found");
 		return -ENOSYS;
 	}
-	if (ualg->alg_trunc_len > algo->uinfo.auth.icv_fullbits) {
+	if (ualg->alg_trunc_len > algo->uinfo.auth.icv_fullbits ||
+	    (ualg->alg_trunc_len & 7) ||
+	    (ualg->alg_trunc_len > 0 && ualg->alg_trunc_len < 32)) {
 		NL_SET_ERR_MSG(extack, "Invalid length requested for truncated ICV");
 		return -EINVAL;
 	}
-- 
2.55.0.1082.g2b9226bbc0-goog

