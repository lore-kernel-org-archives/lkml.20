Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355902;
	b=1FHoj6Oy9DGU6du+W+nzJS55S8itWmepxi92iALqyiudAQ+XhhVeOhjvWu/l0A1/2oSS
	 NAd4MUU7yjdQHLIEBE2bgUjSzLbexapizRFXlaeByY9McqGkcV9dHUVjmx9Ob4I3addVv
	 OUkQbqFtwO931um+lyg19XocP5CNynKadBwc6l51ab2OTxHpZZFniZq4jsMwuSSVmqAeO
	 kygp4W5+QP+8SqE2Ap8/ZdwqC08IkWAOS48kPOyjdb8+390hm3Bu4JnjUV1uhGgNQvCs6
	 1hyxT5uAttOc0drcOF/ij/Kg03giS8V+YIvrT9HImDj0fXkq/cTvP6m/sL6RjurazKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=B1hqtT8eKBTLj/QcI6rH3VmrUCTtV1HZS2iOUhxOQ1Q=;
	b=M0GlXggB+hDPjngkv+XKamGVymrPcF1rbcHXzdHB7Bqvj0626OdOx4t88LqMrKX0DmSj
	 KxVyMiEceN3vgHVgUIpTwineU4Fwrs0U/FR/xyMpWeNdH8FMU3Lw/ymJr0WwBqzvA4UqI
	 rJw52dnzB5VA1yz88ZSij0anC/y+gJGxi5lwlhlUdk+e7jDagWdYHFB23ckY/HLHdYbDy
	 95ANaUjvBLLqrv4H2XqJbESHXDCrBEOyUYE8GGE/YW/PvCUxmtdTjqiEdh4gnvbWhZk04
	 tImpHLI7YwPXqjXS5MAG3nJnzG5Zfn3p1pMW0RElkSVUnmZG+S6ALi1GuyP2WD3LoNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdsBaEyO;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3789606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3789606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zdsBaEyO
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so6307115e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355900; x=1793960700; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1hqtT8eKBTLj/QcI6rH3VmrUCTtV1HZS2iOUhxOQ1Q=;
        b=zdsBaEyOCjb10altnH7e89JJDpKcj+5QNV20HaGnijPicGf9wengOHafV4jjC1j4cf
         31t/BTZIcdx67nAjV15lfSKsUjv7Fp7EJMShnaHOg30NO/Gz9D0LpUqLd3skcIWXAGkT
         FCXA2G8vVWd9LFQAxJbgpKpiLE7ErtfY51USIFBJKwBK/LZhezFSgtxJ6fx09gbz55n8
         ayQXmvXbf8344+nX/C0meEJmjnpl86X5YnXUwVzFs6z6ZbW9tgaxikZ3VRmtTmBNyXyb
         D0tOZfyhKKCaKrpn6P5DvnczIFnkQMcqnGn5j/ktsnuKewWHG74mcJqHp+i/HDbXF/1L
         0XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355900; x=1793960700;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1hqtT8eKBTLj/QcI6rH3VmrUCTtV1HZS2iOUhxOQ1Q=;
        b=eJpaewBhuEwMEBj8vjPZP1SScfVP9bSpVulFJhGSnWE7PtwqM/8m3XhUJJHNMG9FWx
         iyDtpsL7CL3wP7iiSa3T8a9fNIKY8mDmb78TGXVWCDhNUoqx1FJKJKJ9rKie9mKlp8H8
         ns1M2D4t4U/teImc/VdqfQK627RJUexTpsDfyjw5WRZ/ltrhCLGdaJSNbCxoy/CpX46k
         6k79Oy/u/HDMJVlvXpI2vBg+S0o3ywf6PPMUtEa0U4agzEqc4WxhVfFQtjG+JmJgB1s2
         5nlnJTiJ/HLEaCGUdSK6+FzjhiNnAT/iO/2EDeH1bI71qC5WctFOPcITbZNudIasPb9F
         dpXw==
X-Forwarded-Encrypted: i=1; AKwUvBxz7cc7LNGalzKS6/rMLWvjcmFD2VXFbWhsl48ciMdAI6eizVwU6PufQmb3B/Tq/nwfAs1oO6jiR5XtN0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwY9FAoHsuoWiDtsxDuXArxr3ZlSbcSWzVsii1zRMsfTbWgNFy
	10iwGNK/FqiKLU0neRrrH+PdcnEN1EghYxpk6JXuQuwGMxqozaobze6z
X-Gm-Gg: AYBFou2Q78bLrJIXZ2Lku4NXnyhnRMSHzYvYaEJ8PNUMvyQYR2NuCA7vOa13aHXZNyD
	pynCKMW/lfzYuU5FvT6ImSFnI2YigGNK2768WsXfB1vN3P718pUW0X8aqFhhJvVlamlIBdGH5IM
	KSwH/80pboy4WYirZWEf9lSLwec1i+z2+OTL0qazSyBNws/CvBDkwTY/v4yJQP+bfjyGwuEQXjj
	esaSazNCztvlkAQKudvJrLf/ARR08w/MMNhVX+901EW3hWUmRA3eRAR5BLmhnZxk7rlHf4gRNhm
	lQ+AmcSAlJT5PhlNo09vbmL15vbmgxDKIQfWOr1Dg1mW4b3jMYV7MFxlxH9v7ZvB5S76+rN1+pf
	Dix3Imc1eGlULpW4VHtzjcO17GKZIqS+bq0pHfhgWMqqki5ew+abAJQ/tYsFG1XsJnJIhqn2onA
	hVP8yvkfBzgc/WYC0isdIeo2U5bvQgO31yVl1sNA2n6rXBLkqntMK+Dy7/BNBR1kWQH87e68uYI
	/yQmHKkHuU/uXfxOVl+KJWm+xzv4ot16acUmM9Ad1vXpnGUsEWtYLQPI+H1dNEf9g4IQAfTO4jO
	9orRhvjTeczgP+CaoLajSGzGK8enEmaZsDlRXRNjHvJo9KGEZa4+PQ==
X-Received: by 2002:a05:600c:848c:b0:4a3:5da2:38ae with SMTP id 5b1f17b1804b1-4ac17a3628emr38043095e9.14.1793355900196;
        Fri, 30 Oct 2026 03:25:00 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm66892605e9.12.2026.10.30.03.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:24:59 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-security-module@vger.kernel.org,
	Dwi Siswanto <me@dw1.io>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	stable@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Konstantin Meskhidze <konstantin.meskhidze@huawei.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] landlock: Fix layer composition of LANDLOCK_ACCESS_FS_REFER
Date: Fri, 30 Oct 2026 11:24:08 +0100
Message-ID: <20261030102411.12985-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261030102411.12985-1-gnoack3000@gmail.com>
References: <20261030102411.12985-1-gnoack3000@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In landlock_get_fs_access_mask(), only add the
LANDLOCK_ACCESS_FS_REFER right if any filesystem access rights are
handled at all.  This prevents us from accidentally treating
non-filesystem layers as if they handled LANDLOCK_ACCESS_FS_REFER.

landlock_get_fs_access_mask() is used when initializing the layer
masks for doing access right checks, so this bug meant that we
unintentionally denied "refer" (e.g., link, rename) operations in
layered cases, where the same operation would have been accepted if
only either one of the two layers had been enforced.  If the rulesets
individually allow an operation, the composition of these rulesets
should also allow it.

The bug only manifests as soon as one other layer handles filesystem
access rights.  Otherwise, Landlock filesystem path walk is guarded by
an early exit for the case that no filesystem-enforcing layer exists.

Reported-by: Dwi Siswanto <me@dw1.io>
Link: https://github.com/landlock-lsm/linux/issues/67
Link: https://github.com/landlock-lsm/go-landlock/issues/66
Fixes: fff69fb03dde ("landlock: Support network rules with TCP bind and connect")
Cc: stable@vger.kernel.org
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index 428c1d9890db..693e569f5387 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -258,9 +258,16 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	/* Handles all initially denied by default access rights. */
-	return domain->handled_masks[layer_level].fs |
-	       _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+	access_mask_t handled = domain->handled_masks[layer_level].fs;
+
+	/*
+	 * Handles all initially denied by default access rights, but only for
+	 * layers handling filesystem accesses.
+	 */
+	if (handled)
+		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
+
+	return handled;
 }
 
 static inline access_mask_t
-- 
2.56.0

