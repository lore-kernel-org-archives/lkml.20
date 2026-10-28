Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793217111;
	b=dP3MJnrTRQrRODTNJLnsiNzEX/MbT4HPCSvkqXO1Xh3Fd28+ROdMtDGKf6hhSw8SdtvD
	 5hSt6nRh0IlYTphgJvUXi/x5kxMLmtqEmOKu/lGm8T1hMZOUXgWqYIL7Ze1VTN3HAb8pB
	 xWcUkIsXZ/ajp83+W57A5eBgnIWMx8svt6MluuYYLdzktkhlg81TGKSbzVy2oc42uuilH
	 xy+LhgbBNryLylFNm2gsuxyoMCUXxQLfgigyobo/MPERkguf4H6vsCYfNM87gIHAcv+my
	 Orv1wYDHel0QbQSSvxKzsqFC+v5XSoRgqIT2K7E1mreH4c5FffoFlRWC8UJVl2hcThw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nvrn4WRxmRYyXZvqlPwtDdIMr3RH/GbiGM7fkNtVFmY=;
	b=psMb7YPNMvvkB2O8mSnJzFy1X5i7OaW2FuPmXiw+EIWSWtBshF7ju6vaRL9/V2oMf+vQ
	 VcNQny2zSgWz6aQdzax4HadyHEFu0NdTl4fL1gzdAQwNGsst3eylN4kKFZzliDHwfIud+
	 5Cnnn2mff5+CiXCOQOz3huBOKbelqwt2UBxg1IO4xF3Kc/Ga96HUDwbw9F7w4zAVJCrvC
	 97eAgZ2+IIxBlUCF/Ft10nH4+GXJtQ3R0csgrDgYCvd6zM4Qfu7P3tLDQ7oh68UPiFH5b
	 YnYyzTdJrlLkRGZ8CF3mG3M0x59DOyFLyI8hyGXp6hvn1MkBdyfta6pxN/LltR34ewQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdi9apkS;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2E606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EC2E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wdi9apkS
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-36888ae05e7so429955eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793217110; x=1793821910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nvrn4WRxmRYyXZvqlPwtDdIMr3RH/GbiGM7fkNtVFmY=;
        b=wdi9apkSCNG+WQgHHVCA4gASRfPqBR9MTVe5qJGMyZ/AQVSrF/+6IyE6JTTMYREoU5
         dh5hKPiIf3d9eihVt6bFn/5qBCWy3fQ0Y0c1dQET5FZd4Hx/n2u/rGunZ8DJdy77wfrC
         pylW7aaWBmHles8P7pDCGhBgXvs2yzBcwChqiEhig98DyfPrDBmsW5OLmJ4kh0bv0v7v
         oHaxe4oKD3m6Qa6aP6I44Q5MCbSTrg07nfXV5jxdhcG+/4EeWJuMu+BQyjkt672S+Q0m
         iqwbyRP0jyqgyX7gXhhLtLhSCZfgfvD6skxxJKH158WN1xTnGgXPpKf28gaFsJl+ov7H
         HGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217110; x=1793821910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nvrn4WRxmRYyXZvqlPwtDdIMr3RH/GbiGM7fkNtVFmY=;
        b=PIkE4x46WMt4z6SsKaUyoWsW4+w2oYn0CBki3GfVf0iPkYQEbp7fpr66npxtsoUwdO
         ELWkN3+kHlbhKQw9Al1fwJXzcAl8q3umBvxNRuPgyXn/MGisFXLos7UC++Dm0Mfa+CGH
         eoexbhiPITotthGf/v4KWAUmK781JY4+uIGpJA8o5d9qv0b5I+HPepjBH9XmEoG99IzJ
         Ly/aZVeL4aVyBX2hbMiSwj2Rit7WkSmSaYbpyrxRVwxiPpQUJpqvKl7n9zUzovz0rNTu
         WiCcJKTI2ssXe1O/lAPhlkS4VanYL27vkNRY9CPxXLpLK7khEvEl+qMSwpIH3WuDg+/V
         TYMw==
X-Forwarded-Encrypted: i=1; AKwUvBxpNUfyJejlWue3Z1/LkM7p9gDFmfzBxqh7eD7slDR4euZ2mR8+wv4XRX9G1hcS+yC+Vg/qGa/svs2iDrk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8WI0zO3DN08PtGVui9xvbP0U3N7Qi8rpecp0ugVRCCL7+ALdY
	j2zgtVcGW8X+Wn6a5UbyjNvSP1d0St7xqbpLzzQioPgZANNrrA2alEFA
X-Gm-Gg: AYBFou1VL11RhlFxZLnGac/JVcPtZsnB9Kpqp93Wk7TiFUTMU5OgsyLe5zksbNGx7VA
	2LmjWLylu89qe5aV1GqVZOazTJrv73jo72DpjdDf8CD0o/TOSIHrLoR4tPNDZFVHt8XNofUZblN
	prmliJRLmozBzJ+PYZxzWmMIsQnJbJIB+4EUXBdSwVfrL/9rtNtX5ZGBWotZXp//8uYYCK5y7RK
	8+6XnvI4B8itnFFZ/AxCEa86pbJaU2MIZplTtQOwv3EmJnyiLtA148YXePrLhaRC1tsifoGCpH5
	dtXTnnMAT9C8x/SMH0rJurl9CI0+C0CIsrDm2XKKNgitIw9cFWdGkoltNVgA9XSojfSiXqwWZQx
	gWoLNx/3eR6Mc8YGH3F0EFJZJasclSwaTqz4C0NI3zvkDtfnQjRziXydqLnGKYLYn3ELcaAe18+
	UA8Ensc51mJEZA7SXZ6vYMsWr1aYVcPlqzi0FFa66XCGQ9ccUX7sFKioMyh7J7VTXnVyR+3bfcY
	dDgp1tpZnGGh9k0r2PLARv86f+K32ZTnyHi3IzBfP5D4TxzKnZD/6r4l/IY70PsbZXnCPpLYWPy
	6YLkDSAW4S9DRl/JF53wNIAdTBWSXRUSFbhcjq4j0m9EZxxKcEbnUMtd
X-Received: by 2002:a05:7301:1622:b0:36a:1807:75a4 with SMTP id 5a478bee46e88-36a20075471mr4923982eec.20.1793217109527;
        Wed, 28 Oct 2026 12:51:49 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a2398fa4csm10895569eec.24.2026.10.28.12.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:51:48 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: miklos@szeredi.hu
Cc: amir73il@gmail.com,
	andrealmeid@igalia.com,
	linux-unionfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH] ovl: reserve space for the casefolded name terminator
Date: Wed, 28 Oct 2026 19:51:33 +0000
Message-ID: <20261028195133.86636-1-dennylin0707@gmail.com>
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

ovl_casefold() allocates NAME_MAX bytes and passes that capacity to
utf8_casefold(), which also needs room for a terminating NUL. A valid
name whose folded form is exactly NAME_MAX bytes therefore fails to
fold, and ovl_fill_merge() falls back to comparing the original bytes.

For example, when two casefolded layers contain directories named with
255 uppercase and lowercase ASCII letters respectively, readdir lists
both names even though lookup treats them as the same directory. The
same names merge correctly at 254 bytes.

Reserve one additional byte in both the allocation and the folding
capacity so that NAME_MAX-byte folded names use the canonical merge key.

Fixes: ee95c5fc86dd ("ovl: Create ovl_casefold() to support casefolded strncmp()")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/overlayfs/readdir.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/overlayfs/readdir.c b/fs/overlayfs/readdir.c
index 7d6f7f6022eb..6113d690f8ad 100644
--- a/fs/overlayfs/readdir.c
+++ b/fs/overlayfs/readdir.c
@@ -81,13 +81,13 @@ static int ovl_casefold(struct ovl_readdir_data *rdd, const char *str, int len,
 	    name_is_dot_dotdot(str, len))
 		return 0;
 
-	cf_name = kmalloc(NAME_MAX, GFP_KERNEL);
+	cf_name = kmalloc(NAME_MAX + 1, GFP_KERNEL);
 	if (!cf_name) {
 		rdd->err = -ENOMEM;
 		return -ENOMEM;
 	}
 
-	cf_len = utf8_casefold(rdd->map, &qstr, cf_name, NAME_MAX);
+	cf_len = utf8_casefold(rdd->map, &qstr, cf_name, NAME_MAX + 1);
 	if (cf_len > 0)
 		*dst = cf_name;
 	else
-- 
2.43.0

