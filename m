Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F8C53ECED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790077236; cv=none; b=aKm+UDJ0J5sPeR5GT5oHHfRTwU/2DayGPDpoJAg27kgX2qgqVoe+OKJrAV9EB0P/r7SUVKLZJSCs/HvJAXUjO3oxHmeNDMoGsTylPOElCRFCmMR/UzgMstS3oooqZ5jSxrBiCp/U4mhNZaOATQUkuAt6oIN2jnqThJyJr4jVNuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790077236; c=relaxed/simple;
	bh=tlzCI060j6L6IgPt6ESM1jcNU3DreN2TbG88T7MTW/U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utU1LBJTyaY+5llYlimw3/ngLYPydWc62oSv7mXXUqkDqrwGAEyG7R4OlZ+uR/jGZc0Jv6BxMo8DzKFIFBfDI7HOBo6/WiYl5vozF4cbuPS4bw45J+bRSvsp/tlCfQNd81asNd4QDDnxO59S/lEDohl72bEHuccB7XzsrXBLJS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=b8LPbl4j; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="b8LPbl4j"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so23601055e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 04:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1790077223; x=1790682023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hHRXa6eMg2Bs2shmzct4QOAwZZW+bRsX/lrRsgr4gI8=;
        b=b8LPbl4jJtfMIsBdeo8tILRSRsyXTCFj88lrz2Gvfa1v6T6XOaE/5mWteBw6z91vgI
         P6hO58jBN0H5l0v6vLdyAmwjtR+8t1ZkEaxUR/W4BZcCVeer82ghGAW/0GGU1vxUij7a
         LdTTbt8adHXfhpmBk07YIZjDuBx6nCY1pu/cn5WE/K99fl/jGclpOWrlDMz2qTOFjSsz
         WNVl63SrYzooRt2g+tD0hM5/z91yzwMhIcqbMGQKvsGTU8Pt+LuR6qgzRoblNGPHH21q
         KowZNNXpk5IOFCz0tjRa+lcWyFY1UZQyj10AtyGFtfquGLXyjpyX+BSyUy3nsY9pUw/W
         2G1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790077223; x=1790682023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hHRXa6eMg2Bs2shmzct4QOAwZZW+bRsX/lrRsgr4gI8=;
        b=B+93oi5dV1ZXwypWLc4/DrSEve4JZK9PVyxmBFJfcI2CiFpx4oIr9mQriN7HPDpT5J
         MuSm6fvIlqwIoJrIQuZkjSz3KSj5GbigFEfRdS34aXTBa9BqYFxumXN7IfFgz675e572
         l1KM7Sh2ST0sd6ZM5eZvxtvIM2F+v3Ka1tUUaahC4QVP4dH9o1D3yksQwj/qJlCaMnaP
         EqKsktC07pKFc1mqycInAeHgouw+2mS5+c189u9uRhTL1SUKpFPO13AdR1mwuxaoPCLu
         6hv034Bc5p7uGEb2SkLxy/zIYWZ6WolzphiZu2AKZokcsfr0z3U1iW40xhqRxF55hjmQ
         7Sxg==
X-Forwarded-Encrypted: i=1; AKwUvBwxusDCBJGBp7qLo1otRzy81Gso5xxKdAKW6lJE3TL+wlQdvMARuxNHkQBLJshfQEPYF6WAOqv85Xy54tw=@vger.kernel.org
X-Gm-Message-State: AFuF++lbp0JvJ1xYu6/UVCe3gMRyHq3kF50bWjbJngHukYOUVdOA8dAX
	CC/yQunrvsiEv3Dv6tzmV5CKXNBmt8637j/MfUhooNkMFap+w0Yzs9SMrXTRrO3qjh4=
X-Gm-Gg: AYBFou2tApXw0PXJiZBQPuwZTBoUsa37DxQtCE+YUk+e0qkoVjIm/Rsci5iWvutFgsG
	/q+5WCy1fcldBD8hEiCyAWABfJeBx8UW/zN2e1VUgiqiraCoI5w3kpL5muhaUFmsDX4FMueKCIP
	nGu0ceGz4a/RV4vBS0t843TIDEYCv+7MeN/SeAA3F/qo9TOzpAxDuuRceJqbtzajenq33HPyTB7
	cavscb63q6hoSEan24X4SVJv+dQZo93rs6o27oWxl4mc/oWpxMhxqkxgQOY5fShw0vDeLJX8PAz
	Xgy5YWIkk8I1AWP+qyviPmdex+bGjHJ5Ekk0dpdFz+RpbHlO2OgT9eAkrBxKQbRyxDJ38C7pE+w
	/X7lCwTwnQwnnrcduf8d85nge1psY9JSW8EICodeLIwmKwoJSpnc9zwiZvzLo6bzykwpmanCwhP
	mm2MrJYV/N3HM4zlFPFxkUGEVR4cywuxH0eX79nmpaVCP4g65N0ykEFtXtcdAspWvvtc6cHkDQ3
	ssuSLro9Q==
X-Received: by 2002:a05:600c:310d:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49fc5721b9dmr206467155e9.10.1790077223229;
        Tue, 22 Sep 2026 04:40:23 -0700 (PDT)
Received: from localhost ([2a02:168:9d56:1:84ba:d001:a11c:487b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fd8ce2646sm77863515e9.14.2026.09.22.04.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 04:40:22 -0700 (PDT)
From: Bruno Produit <bruno.produit@trailofbits.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: ntfs3@lists.linux.dev,
	Kyle Zeng <kylebot@openai.com>,
	linux-kernel@vger.kernel.org,
	Dominik Czarnota <dominik.czarnota@trailofbits.com>,
	stable@vger.kernel.org,
	Bruno Produit <bruno.produit@trailofbits.com>
Subject: [PATCH] fs/ntfs3: Fix out-of-bounds write in resident insert range
Date: Tue, 22 Sep 2026 13:40:18 +0200
Message-ID: <20260922114018.1829807-1-bruno.produit@trailofbits.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyle Zeng <kylebot@openai.com>

attr_insert_range() grows a resident value before shifting data at and
after the insertion offset.  The current copy instead moves @bytes bytes
from the start of the value, so both its source offset and length are
wrong.

For example, inserting 2048 bytes at offset 512 in a 513-byte resident
value copies 2048 bytes to data + 2048 even though the tail is only one
byte long.  The resulting destination can extend beyond the MFT record
allocation.

Move the original tail from the insertion offset to its new location,
then clear the inserted range.

Fixes: aa30eccb24e5 ("fs/ntfs3: Fallocate (FALLOC_FL_INSERT_RANGE) implementation")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Kyle Zeng <kylebot@openai.com>
Signed-off-by: Bruno Produit <bruno.produit@trailofbits.com>
---
 fs/ntfs3/attrib.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/ntfs3/attrib.c b/fs/ntfs3/attrib.c
index b1c315206..4bd758133 100644
--- a/fs/ntfs3/attrib.c
+++ b/fs/ntfs3/attrib.c
@@ -2610,8 +2610,9 @@ int attr_insert_range(struct ntfs_inode *ni, u64 vbo, u64 bytes)
 			char *data = Add2Ptr(attr_b,
 					     le16_to_cpu(attr_b->res.data_off));
 
-			memmove(data + bytes, data, bytes);
-			memset(data, 0, bytes);
+			memmove(data + vbo + bytes, data + vbo,
+				data_size - vbo);
+			memset(data + vbo, 0, bytes);
 			goto done;
 		}
 
-- 
2.53.0

