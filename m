Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B7C334C1C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790119149; cv=none; b=i4fxedwguoThjvWBjHauyvfkjN2n6Rjt5f/8TH8pQA+KsO1ByRP9F6ayi/6gIKeTdVSfIzFJ7nHZCG5fBtQHSij6ViVreMtBgtLB7idxH4vG6KuPZONCYfZTuBD5/n3l1qIm7CwXr9uuPyrn+zSqYXNd9wCv/DVRWTk52SUG7KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790119149; c=relaxed/simple;
	bh=H7gmJiEJ7L75WynDh8xl+jcAnaPeaov8swQaArvFogk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HxPTKia0JIKsRhr77AHGIohC8PM1YyBDpwOLDXiqw8jPtm40zimz6jRjMRyIcjRYZy75KUj1vw3uZpjxS9uRQ74/cQdOjQdxi7mZcxeb5/+jIO25CxcXhsaEGiHRH2olUkRmBZcOxfY4If+OcaCtyOpb0ttW+hfxjT2Iss8tzzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sCmvR0Rp; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sCmvR0Rp"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485ac898fa4so409574f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 16:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790119146; x=1790723946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gQ44cX4ajnfIo4kZAd/0Ua+K+UeEg7vA1TBW5i/GjgU=;
        b=sCmvR0Rpgzz9VBMRAz4E8YVW47nsbVKaaAy7u65dKzUVq+KePabhXl+FX+BTZvzu/f
         LmsYgPpkMSOvlg0KUIB9Vz3pd7DIeFLX7LXtU966K6rGAh8+cnYF/vhGgZoxvdlocrKU
         3Qr++fxu4Bu7PQVvd5bxb95h8xLTUWG8yWDzpsmXYrthexBc344DDkapfDucyS7d2dvL
         4hgBzEYf76BlBcIoEAzyEuMjg0UlPmIa+dIqWSY3ae5qcPZggVfhumtakrzc6ivi8Zun
         o4VwIj1JXx3W4FxBKA79exKRtpD7hET7bQytJUt8VsqBDP7jF2pdGHDHR8ls3IYRkzcS
         ytKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790119146; x=1790723946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQ44cX4ajnfIo4kZAd/0Ua+K+UeEg7vA1TBW5i/GjgU=;
        b=vLPcj7ZJ4ZFoO4oUEoiDYlOdxZfUaMJRHk/GQATAsYbXAizv1Xxjn0zunmFwuzElvn
         jQmXGrpleewjnyxLc8Jx1n4gUv//ik/zVwFbfQJGFLizfOW9otNOZhttEM8fIJhWdfJu
         kUXsY9Ly9NGzB9BHRoKxlOGx6IPvqd9HEE040Zbk7mUlAI8qQOtY1wCzMxIV6EtLSuJ7
         JHY3IGi7Yx3+je1G5tnDbC5j6do15fwhdXmVu7RqJrcDIVYMrfYFV4rdUIGgzDhHTOm7
         snkS6lfqojhIccoV59bAFgxvBck24vpGGRcj7KOR+EcHzBoLvkhckavfX77IzDp1Qn0H
         1WiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyrh51hUjq89omlyBYYhhsQOqInkuTiX8na8RhOghhXbPesHKxsWfHUfJ208++n5QAg7xzSyOoZt24LzI=@vger.kernel.org
X-Gm-Message-State: AFuF++kuw8rD8/W91UQbXrsONCwLHiBlNgauueQsPDsSgM1d2NUmYMx3
	bM86XQfJLJb1jYY5K98E/VUdtjDojHmwTEipFG/S6tdsKNaG78OH33qHGUm7TveBRt4=
X-Gm-Gg: AYBFou1N70jz9XfzdJ6BUPgvOhMVm+Bd0W4ygQcWW6wvQxeUKwXh7W+kDAXANAvkSUS
	dwqwJPWz5aY1+c3Fw+aV6/oNeUVTUV4rKX88UGRCcvjF63xtySORidqm29M1jua1liUWTiBYCgT
	m4DkT0RvyQJ/lz6WGLoAxjarY4oZW1Zt9CgqTkKoPNm4gfoeVW/6FGCA7hqGiLu5GGL3cyPOdN5
	0nTwP6XSIJJRDGuEgZzQUtNJZiwv+LZvm0PXVyd1bILKqiiv2ACx6AX2IMeGKISZ5REt0JdVnDj
	cfcoCgXTbClnz2ajoCPkr7M5PEZX4+9rOZQNXrZD+H6kxuQwLJyk80nvF/0AWFOhDW4ONJqNohk
	4BD5wlnS3Bl5rGqJMQFxzOx21AVuzeFG2/nTU9Q0sVfsyiDYldWrusW2HfPeJxAcRPtpcVVKF0z
	RG68gnSBY+Z2gAlABelL28D0GJ6Hd9TutYItxPiAIuOalgfded9JLDDhLve4S9twJvEbpUmbPfi
	UOV+z1BX3OD4XGI7D5uLVcFeDGU+s3f1yW0ffyWTgPqslHB9F4JNTMU6aBubjbT3lauo0Lv3the
	z4zhrXD6
X-Received: by 2002:a05:6000:25c4:b0:487:1266:5be7 with SMTP id ffacd0b85a97d-48867090ad8mr1431876f8f.26.1790119146144;
        Tue, 22 Sep 2026 16:19:06 -0700 (PDT)
Received: from localhost.localdomain (brnt-05-b2-v4wan-169762-cust1351.vm7.cable.virginm.net. [81.101.101.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868889337sm1875902f8f.34.2026.09.22.16.19.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:19:05 -0700 (PDT)
From: Bryan Chan <bchimhim15@gmail.com>
To: Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	linux-edac@vger.kernel.org (open list:EDAC-SKYLAKE),
	linux-kernel@vger.kernel.org (open list)
Cc: linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bryan Chan <bchimhim15@gmail.com>
Subject: [PATCH] EDAC/skx_base: Fix ambiguous bitwise and logical operator style
Date: Wed, 23 Sep 2026 00:18:53 +0100
Message-ID: <20260922231854.108188-1-bchimhim15@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code works fine and works how it should be, the fix is just for
uniformity/consistency of the bitwise operations. Also fix the compiler
warning.

lchan here is always 0 or 1 here, replace the inconsistance logical
operator by xor operation resulting 1 or 2. This remove the compiler
warning and make the switch case easier for reading.

Signed-off-by: Bryan Chan <bchimhim15@gmail.com>
---
 drivers/edac/skx_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/edac/skx_base.c b/drivers/edac/skx_base.c
index de749413ff9a..ae2fda006632 100644
--- a/drivers/edac/skx_base.c
+++ b/drivers/edac/skx_base.c
@@ -356,7 +356,7 @@ static bool skx_sad_decode(struct decoded_addr *res)
 			break;
 		case 2:
 			lchan = (addr >> shift) % 2;
-			lchan = (lchan << 1) | !lchan;
+			lchan = (lchan << 1) | (lchan ^ 1);
 			break;
 		case 3:
 			lchan = ((addr >> shift) % 2) << 1;
-- 
2.55.0

