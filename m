Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86951485505
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331803; cv=none; b=I1flz4vi0Z6p0v7DXR3EINY1JdIUcw5bcGLAU/yuJ6MUDBK1RJBQSlHI+fnWj6Nhb8tN7JYeDY5mo8Ovjp+JJuk+6oRvDmw2WJcqID2oa8ru6oObSC9cGEh81o2xE6OFaWo2MfHlxymg9GvgzNbge/79WEObIPwGZtqSacun8Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331803; c=relaxed/simple;
	bh=ncljv4aAsEtAdDNFdadYa+U+I1UkJWgrpnkUGyeCuLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bTjqUYgVGJgshHNdxeok/tYp/2sLTQ6zoNyEzMANzIHFxzVX/ozclAxVlUe+LyCvWmNy35TxawHYiK2Vf6aVxUgo3YVKv4fhdVreniV5iIjhyGGDNSU9I3mxEAiP8OUtu+0UsuRQRHAH5E6ZhQbMbsrRx4ZtdoLqMl25g4w5S3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m/fAFqsY; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m/fAFqsY"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-34182b58c7eso421376eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331801; x=1790936601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+I+5cZ6MfyOgTWZC9PzzSGV6QxmBE2TGwDaDF8tlYAo=;
        b=m/fAFqsYMqQayWgbiP3WOv9RKNZUumfTaJnztXjIsCRoPTz2cwIMUwExj7GpxVG+KS
         UrzZfVQQpks4GMWNSOOqekCCSvwy+NsYDO2kXyf0h568lxCf+1cGCjslz7R3q+XXin6k
         J1k0Exyj471wwd3aMsDO9FI3Gt/QI/qrWCqT7m5kNdX26GbQ3r7/+sYyHaaJqI2mXVnM
         5k/YC+Kto6bxb5CjIBb5O6pstdnp99pqnwFQLSlfh7gD2iPrgL1mCZzS9P22vE6RrCBQ
         C3UECwWt91x+mouCKER8KAfnhHLQs3FU3336/2WRAXxVJ3saR8515F5h5+MRMnmcywAS
         p8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331801; x=1790936601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+I+5cZ6MfyOgTWZC9PzzSGV6QxmBE2TGwDaDF8tlYAo=;
        b=pg2/AB1cKxKknCiNnadrkGIwxkkM7fGggrVbyiW4MWXLq9LBpGYUjNmWb45uC8jCJQ
         nrwQkRuXA7ynzWTRk8Whc5+uK45UjI5OsYeU90MeSZbP2W3KuJbjyqFqGhAOTjcH5NI+
         1RNy1MIoddfCnsRHntimvZq28i1IT3N3IU6lx4RWQP/BjeDhk1QaZg8hsP65/GDJZp07
         wgxn4IR89PHAvIZ3rK15OMRECQXWBe0F/dcTBFMDotgTXx67MFMyZMYsd3Ogj1V6VMoG
         hApGSNY7e+QMR6WiN2PfiIxC/RvGmVvyoAtPyZeR+hlALsVtnzNGmtBaXyd7BsRnh+AU
         8S6A==
X-Forwarded-Encrypted: i=1; AKwUvBww76ye11ieAx3jNFvFVXPlrEwQbJO95h6WSg/2/OUyzAhp0aZngNgVJVhyKMwfpFQ4PRKJr8Cxc72hwFo=@vger.kernel.org
X-Gm-Message-State: AFuF++kiCCJj22dt/pCw6nM6XqGfOulGPKVibZjgij6RFP35UYlD4R6m
	IHBxVAdnfemVwVCf8XBEQkEFZxQbSQ7ZDfD3t8uBoykQb3ojtjloFmORR90lip8/
X-Gm-Gg: AYBFou0QPjCKd9PsIn7EYLLV6vUHOGJePrDsW2j+mtRDqTU5jgar+zUPDW7Ss1KOGNK
	CLQHpNB7XmGTQ88E+7TlGyxa7H8M7t/MxCqEha539QS43TFuZKB6VEiqQGbB/+K696eVdlssfNz
	yZnh0/WJHx89TCnjvIUVbm/A89BkmqobiZ/lCo2V9rFWqTSWePc3UCj+cmti7VxUyq++i0cmmPe
	cG4FTL9NdOm57rDftauanJ2qTjiH/hh6JBvEy/rJPw2kOwylpOQ+1OMMwpxBaaci8t+S36z+eZA
	JRHIjfqldRSYW0OW3L45eLBOfdNTiMVKPi5TR/Ofe+5DW4WqMxlFJGcadibI+67Gr4ufSXtVcU5
	HdM2SaN3bexwEqGS8/snFtYHYlxH8Dtkb4b+6/lG5W8rBWf6oPXPdKicVJyGBusE0Z5Qr6crr84
	2tsQJr0ogd64nl3TcH6zAmi8yLVoJECstebLg/Gvh5gVl/TpUpjt9diAP5ntrkHFPU11rhn3fBn
	m2cei5IQblWsRjb7cXJVXFZz3OAm/3BCp+FyYiAgShnyNekDsiWeKAbLG6i+OdxwsEFhI536f9Y
	6YAXOX2U/zr04L/3kvwGgRk/zsjwMcW0EOw2Lwar1U1vDUSaVRQ9U/PLfgbuFskk3mzYKa50qaa
	TJ6SVKYuK
X-Received: by 2002:a05:7301:719f:b0:342:3bf4:77fe with SMTP id 5a478bee46e88-3423bf47bc0mr301067eec.11.1790331801201;
        Fri, 25 Sep 2026 03:23:21 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:20 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] bitmap: bitmap_parselist(): reject trailing characters after group size
Date: Fri, 25 Sep 2026 15:53:04 +0530
Message-ID: <20260925102307.49513-4-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925102307.49513-1-jain.sm@gmail.com>
References: <20260925102307.49513-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bitmap_parse_region() checks that every region ends at a separator
(',', whitespace, '\n' or '\0'), except in the "range:used/group" form:
after parsing the group size it returns the pointer to the following
character without looking at it.  The caller then starts a new region
at that character.

Before 'N' and 'all' were accepted as region starts this happened to be
harmless, because any other character would fail to parse as a new
region.  Now text directly following the group size is silently parsed
as another region:

  "0-7:1/2N"    -> bits 0,2,4,6,7 (nbits = 8), returns 0
  "0-7:1/2all"  -> all bits set, returns 0

while "0-7N", "5N" or "0-7:1/2x" are correctly rejected with -EINVAL.
bitmap_parselist() is documented to return -EINVAL for an invalid
character.  It parses cpu lists from sysfs, cgroup cpuset files and
boot parameters such as isolcpus= and nohz_full=, so a typo there is
accepted and yields a different mask than intended.

Check for the end of the region after the group size as well, like the
other forms do.

Fixes: 2c4885d24e64 ("lib: bitmap: support "N" as an alias for size of bitmap")
Assisted-by: LLM
Signed-off-by: shashank <jain.sm@gmail.com>
---
 lib/bitmap-str.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index e02c5bc80951..b58966864657 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -299,7 +299,14 @@ static const char *bitmap_parse_region(const char *str, struct region *r)
 	if (*str != '/')
 		return ERR_PTR(-EINVAL);
 
-	return bitmap_getnum(str + 1, &r->group_len, lastbit);
+	str = bitmap_getnum(str + 1, &r->group_len, lastbit);
+	if (IS_ERR(str))
+		return str;
+
+	if (!end_of_region(*str))
+		return ERR_PTR(-EINVAL);
+
+	return end_of_str(*str) ? NULL : str;
 
 no_end:
 	r->end = r->start;
-- 
2.43.0

