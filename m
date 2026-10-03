Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EEC44C659
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 16:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791043409; cv=none; b=stwEgth443nO4I4TPnB2HR7Fv1skr9wKfcFeZnSjg9WauwJvLtkp47dmPlmuyBeqcr+4077vIEh7NjH8msdyoIaOmKNs7e9eHvYvyZPlnL6yqCQ6F5ofUL1w+adlDg3CI8RfN+xwSXR6dMXYhcg0ytP9acsNVohLoCRwrUuk/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791043409; c=relaxed/simple;
	bh=JI0soRYZ5BAD8dBXxZRnsimny2m9p9Nj9R3Oq+EjSJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C9AAu7Vt5P9DfzVCbpRSb7fgPKgOiUSJGcnRdZWzNIPoQA1IM7vNB+L47QHSxZObYE7UZw0b7D52H3uMkl8RiOrKI4oTx6staqmV8NLMjV/d47fWuxjNLMMtuUhhPeb1EWp0UiaYg8hhT4pqmYEUzEvyqQhnC5/E++WfQcBpJd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org; spf=pass smtp.mailfrom=linuxtx.org; dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b=DLIlvahU; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=fedoraproject.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxtx.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxtx.org header.i=@linuxtx.org header.b="DLIlvahU"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e55db58cfso45037485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxtx.org; s=google; t=1791043402; x=1791648202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KBadGkBMhFXmrhoE9hmsF6c0zFZFOIvfrbohBEExOc0=;
        b=DLIlvahUwaLfiUTFf5++haZ0yy0UKVKrp6P+6bC3hdNzSaB4ibgN6A+txhBCXJ8YMt
         enf3dIkhPDODQUo1GYvGYJlDJ/YTWjXVwLvjG/O9KhR8SYuvdNFaGDdg3ermyShuPKgs
         MJkUY/IbQ5gIfW3Z76WZLSENh2MTW/Sy6A+OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791043402; x=1791648202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KBadGkBMhFXmrhoE9hmsF6c0zFZFOIvfrbohBEExOc0=;
        b=SptaJV4ZsyjCMI0hhNafoZdooYiTxFbaIT+3qcNXVkngVWxYUKqresz43VYUGRVT5h
         s7UWsYxZ/dwu/9GiUADvJJ9vs6LSTQcJG8FqkqxqO003FpJTaJaV9qSuXmEZQ0nt0m7N
         YoHpj77wfuKiSoqVZXwt8frA4H5WAi3tOVJ1ASPSpRl6vp99KbWzShb5UdkOUdGJKA4F
         KRP8Q6sY3YC6KQKFbp5TZSFSgbXD91CxKoDtA3C73q8W/OqwuyEO0CUSQ7evRunvf6YQ
         plViVdOieQuEyTpkSNojDaQuV2lrwa0P8PtXGnFyptVUl24Qeu4m1mE4bGAxBEDvW9CF
         /b8g==
X-Forwarded-Encrypted: i=1; AKwUvBxjMVdALt3/0nXAgi87hWejs0KJulGb6/DKfx4SGUkVok3WUfn63RvmFo97r5KW5IMBevP91LoTcW4XDxE=@vger.kernel.org
X-Gm-Message-State: AFuF++mY95gwh8XBEPo/stxUb+cRiIQzjy0fnVVhCdLnJFGVEQJqGDZM
	d2ZJe+jw2aXzgaWr67okbesm67kxzTV9wZN8srQqGDcfXKcu+ABwtnbMbHppbZneaQ==
X-Gm-Gg: AYBFou1zYYwweq3maRRW0acPo+2YmeDLzgb99WqEu/daCucqei2zSjQulpQnY9hK57y
	RP2Lp0eXWptZNPYe2V7Ll8t0J5plm+RntIYsQnrGANgUhOlnGtD5PitgXVL0QykeKUOWeROlhPi
	RsTsniXzI/Qc9O5qYkU1qM+L3XkxZ+bOGA9BL9X8hi/EFUMoTrlykxyI81AdGzATaQsIgba44SC
	LIuQvsC6m1PZ3WnkKhHIeOMVKpNXcOaqxrEZ59MvWS2mAobYkm2G/ZC+SSUXxV5IgAdfwc1+lOi
	99sXiF7CanGLpAxuEClEST87Tnj3oXX6EIYMEekU3pX/R6XbZSwv13yfQ6PWkiVTC4NlV9YmZlQ
	G4USuCLQbtcwVKo2gwXVnB55wIgMYrwmdwXtqLrTxp6HzQuHrPYYJEWyp2AX2OvI3ID4ahiAWgE
	9XuL+pBV9XKwxb4mOP4TvS8Kk3BcW5mqZMNMbho7mD2ufJcb1wrNv3VHq4rsqfKMRgWOJWlxq2b
	y8OTK9qGKVOZY3g
X-Received: by 2002:a05:620a:1a03:b0:93c:9e2a:ba08 with SMTP id af79cd13be357-93e510db69amr482479085a.63.1791043402243;
        Sat, 03 Oct 2026 09:03:22 -0700 (PDT)
Received: from fedora64.linuxtx.org ([98.97.107.167])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93e4e7b2cb2sm266910885a.17.2026.10.03.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 09:03:21 -0700 (PDT)
Sender: Justin Forbes <jmforbes@linuxtx.org>
From: "Justin M. Forbes" <jforbes@fedoraproject.org>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Justin M. Forbes" <jforbes@fedoraproject.org>
Subject: [PATCH] Allow hmac(sha512) for unpriviledged users
Date: Sat,  3 Oct 2026 10:03:02 -0600
Message-ID: <20261003160302.3000325-1-jforbes@fedoraproject.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default users cannot run sha512hmac with the current set up. This
is problematic because our kernel builds call this for FIPS compliance.
Rather than have anyone turn off af_alg_restrict all together, let's
allow a common use case.

Signed-off-by: Justin M. Forbes <jforbes@fedoraproject.org>
---
 crypto/algif_hash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/crypto/algif_hash.c b/crypto/algif_hash.c
index 6e8b5fb82a7f..0d3ec5760de6 100644
--- a/crypto/algif_hash.c
+++ b/crypto/algif_hash.c
@@ -23,7 +23,7 @@ static const struct af_alg_allowlist_entry hash_allowlist[] = {
 	{ "hmac(sha224)" }, /* iwd */
 	{ "hmac(sha256)" }, /* iwd */
 	{ "hmac(sha384)" }, /* iwd */
-	{ "hmac(sha512)" }, /* iwd, sha512hmac */
+	{ "hmac(sha512)", AF_ALG_UNPRIVILEGED }, /* iwd, sha512hmac */
 	{ "md4" }, /* iwd */
 	{ "md5" }, /* iwd */
 	{ "sha1", AF_ALG_UNPRIVILEGED }, /* iwd, iproute2 < 7.0 */
-- 
2.55.0

