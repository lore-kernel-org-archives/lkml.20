Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793792742;
	b=4os9TDH+5/8cUZUPh3wlAkUTPWTNmIqJcxMzl491Sj8puYEFP0T+68uCs9TTZ8TKrmyt
	 /Bv34AXW4wXtju5rHWskQiWzjlBeyBzzQne4t1FSVZjyLAcQZhgCEX6lwiaAKMXVJejmK
	 L3C4j0Y5DyvyA3Zybm/TGAtxk8cm+2sbgq1zpjdAgO6VzHP8ei5MIFtdWFCz5mbNKEuHR
	 ln0oPL7E7R6SjH7nFv6SzwbHgxwMdFQ4kWGfAlE0fnp53Xstb95v15hpvbKnEOAPEIXJQ
	 62oOg6uSxdHx+tlDIlW4wwszGBZqKXirB3gD4cmZQgxPO/CP/1qDLBF44TTzL5h1CSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793792742;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=PycSAvgSc9xONqJbh7SrA9DU1TbX+LtklIzj5asGTnI=;
	b=wgDzUawz79Rsd+XLQXVsy40EdZZvl/S/i5V2EGfZzEVfc0oijNiEcuVxTW7JnvfOi9s0
	 YQ99dk5Dqd6mhHZaW5ZT5hr9/T1W9sTb9nMhH7QB3c1Tv/hSuTKSOc3KkakLSTV3zK8pw
	 vhikuc7hU+F+EKFXx8p9XBar0hlev+tDTWjGmSdQJ5Gx+HfkQtkWgHO5GV9mUSdXmqf29
	 r9WqQYgC5Q9NcLiDnhRI8r72ZxNo6jPWBr/3ICDhrpGI+EKG1O/jFQg5OHxU4CGuiryA+
	 Jh2fi2qN5XQiZpzI6vtAk+9XuQrUOhcpewJwHNwMYpoW8xDXWaOt8DVOUCbXVMqhSdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tBpCPDuY;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD31C606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD31C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tBpCPDuY
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-36caa19b0ffso390157eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793792741; x=1794397541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PycSAvgSc9xONqJbh7SrA9DU1TbX+LtklIzj5asGTnI=;
        b=tBpCPDuYI/hM4RRuv/X9ivjp8uwRT0bT1oHFC+ZhGKs/BVl+YqfWsv/kGE4+2ifIVK
         URPFAItPo0HPtC0jkatlNWamLzuDPrhdoq+Ient9NJI/oN1a9q+Htup90DzK7h6LLTNu
         /0fScZyZnGv1BXIWpbgyEyLjbwJMPdSpYf88Ryn550n+TOOhZjLjiFy9lAd7ZstHDT3z
         ckVpYYLM0iwMsh6VCLsUGP2sW6VtLt46PAixIR5zVP8pWGAdP/dmQ5/UTtiSk+FSMsFT
         LJOBjBl0SDy2AUzvAPl9N3eT+lFN172sgoZ3V/EEFh1we/OFrXiKi3Mn2SxINm1j/itC
         LNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793792741; x=1794397541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PycSAvgSc9xONqJbh7SrA9DU1TbX+LtklIzj5asGTnI=;
        b=KPWNM5iDmLsPKXTgsNVpTQiG8cRv4NMcAw4qd/HFmn+NPTdKrXaNB9LzwyCKrxegXU
         /b7irIsewwGOIoG0JALWWpBPwEfYRMdmCcoWyrkydPZAO+h7wDC0Hd8n0mCCdjZMujQR
         zomoHjdgt0dQcusB7EK43rwV/onuZSUqvloHNdddZRyJBsIK9v9Uzdoj2gHVuCKy+2MT
         aPsc5ZiaY5OEyokLnIeWhw2bsH6kr6HBW2lFJNIoWp1+3+wR4nCfn4xn4vpOEC7Hq2LF
         NQzB9+Oh0kSlzXoT/Sely/98x65u7rjPQSW0iYl56GgdUBYnZH4TsNjZdh96buTydX3K
         45XA==
X-Forwarded-Encrypted: i=1; AKwUvBw+bDYJYG4CpA2es30G66Tq4zd6nB8RzK/D8SxahapE6M6EYcwLIqfyVFhCz5EUgwmS+wT6BAhYaYyS/B4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+83hf19qi5b4n6E7y7RDapkuGP7ROPWzrouFgnlUFsBPq/WTQ
	kO7HOZxMAwqUQ2VknqzXXLGPYBaX/FuJG8hzaFBUVM1840p0d5MReIXu
X-Gm-Gg: AYBFou2JLTtUaCb8lfDWdgzVfSn4wSamkervaHsehq7Gy3ZRwed2+hoGxbWyl6zVghu
	fq1J2gDuODA8HRxHYOaL6QTwTI0nIIJa8XkIO4aBOgDV/4c7SDgr0wCoBE26QW3Wu0IF8NKWg7w
	oCo3t4/s0QWfmNfN+58L+Oa+n8t2vbypPReC8ljuN4hPXbMbZ0vIKjU9zBL5ehEIV6f0/kL3OSV
	18KnXWe2IqHj1+v3bVUz8AUn5VVxFN4qHEiX+p/ddtNovBv/Fy1L/nIO556WBhbmGJwEk+MezP0
	c8FwQ3hMcJyW8oms44fuIMITe95JWLPzk1UQEPi6xGU+FjwMFk00CmtsCVbOsDL6i9NUGSsRPuA
	98KlUrmOw17GrHJQKreKYpnDE4N+5uehuGEUtzuh+LJJ05vaqndedma9H8e3he0+JYtzjAKRLj5
	3q31RwwDC/OZe6oOUKW5na0DCB4dADMjd9F0Na70RwRM9pQiLr4hwpVu3D9iibmc7mjBhb/8Xv1
	nEOnNPliknU/RQf0ZvcB9d2a58A+89gzvyB2QQmAKGgXLuS/jjbvHn2kc3K1c9sTPZdGFz1dN+z
	YB4hHgZRNBiEigJzJEw7X2/y+7+nDZfIaiu0U/XIAdDyxcs6d6ycwVnWZnJFh6QZmVDmk0u/iiG
	XMuRwVDfLLddy0DrY+6fzmd8UKe4txSOmQpbWIXxaptWU3WqAxnev8hF9LvI=
X-Received: by 2002:a05:7022:1706:b0:1ac:7044:2bad with SMTP id a92af1059eb24-1ac70442d69mr20667069c88.36.1793792740829;
        Wed, 04 Nov 2026 03:45:40 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2c2f7sm7467199c88.9.2026.11.04.03.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:45:40 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: me@bobcopeland.com
Cc: linux-karma-devel@lists.sourceforge.net,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] omfs: reject unsupported nonzero size changes
Date: Wed,  4 Nov 2026 11:45:30 +0000
Message-ID: <20261104114530.30536-1-dennylin0707@gmail.com>
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

omfs_shrink_inode() only implements truncation to zero and returns -EIO
for a nonzero i_size. However, omfs_setattr() updates i_size and the page
cache before calling omfs_truncate(), which discards that error.

As a result, ftruncate() on an empty file to 16384 bytes succeeds, but
reading the extended file fails with EIO. Shrinking to a nonzero size
also leaves the old extents in place, so a later extension can expose
data that should have been discarded.

Reject size changes with a nonzero target before changing i_size or the
page cache. Keep truncation to zero and requests that leave the size
unchanged working.

Fixes: 8f09e98768c1 ("omfs: add file routines")
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/omfs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/omfs/file.c b/fs/omfs/file.c
index 79a413f1dc0..a4bf45d73bc 100644
--- a/fs/omfs/file.c
+++ b/fs/omfs/file.c
@@ -353,6 +353,9 @@ static int omfs_setattr(const struct mnt_idmap *idmap,
 		error = inode_newsize_ok(inode, attr->ia_size);
 		if (error)
 			return error;
+		/* Only truncation to zero is implemented. */
+		if (attr->ia_size)
+			return -EOPNOTSUPP;
 		truncate_setsize(inode, attr->ia_size);
 		omfs_truncate(inode);
 	}

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
-- 
2.50.1 (Apple Git-155)

