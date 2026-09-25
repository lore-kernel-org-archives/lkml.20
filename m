Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2C148EBCE
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331796; cv=none; b=toTOxmn6o4fz0COnd2rmgZIUDrGu3SOR41Mws6wV3L5IryRfS87EWBQagBGWmVGzJ2XyC8zzJQew46k37Sq1OxUkDL0oTeM87rPZ/3hqJooCk4iyw+oWuO2UoD5imcakWcfjg23XwQBc+dA5EOIsehcde9CQjo/CVP+bugUN2a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331796; c=relaxed/simple;
	bh=851oSk38pztWaWdSPYj2QCeTD2EbbIPaI86hXHBFExI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyvEnpeD5usey6ZfMmQBpfMJDMlDm57yD5xGof8PT8nvP/ZVJOdBzMcS+kIBKSgDpjltSrPNLqPgy+FFS1vd3I0T+P8hdHfXbFm1mrqnv0geG+IGwLJ/+og4AJMIvnZCl4gcevPzhHcCiLEBjhNha37Gtygs05ZdBXc6oX6I+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6O+FoiQ; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6O+FoiQ"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-3396cec93b6so775859eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331793; x=1790936593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAaxje4aK6BVStKo5rrvh/mTmTVVpaE+mECXK0GMM2k=;
        b=d6O+FoiQ4uKnaX8ZJ/8NmjvImXN98yQNjhRTEgFfRlNfIrprpxMN0+kroT16GtfSlZ
         hg/faFMnBGYMtSBj/Lq59kkkGmgjxwIFNIePLG+29bXzC+LXEjpZq4O0xmkrwv9cHaW3
         GBpEKAnXPDdso3lFjx/iCuIObnkb7Qx+uqWhjhShN+npmPMfEp9KXSC6fxaD0XG2CyW2
         RHPKjkmVFslPYor/vAZAMQS+0chLJ0H2Z5zJhCuyP5etmTALOsp18izWZpFRtXa8x7V1
         SrYg8y8Sc6Q0jWQdd9itAAMN4iMk+AWCGKZGIDjWrxEk5oit+zSXflhh54E97mC4r52O
         LjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331793; x=1790936593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAaxje4aK6BVStKo5rrvh/mTmTVVpaE+mECXK0GMM2k=;
        b=bsoEK8lBUa361SJ08aiHSGDMuaLKtf58mwqx9u2P8ke55nyYWKdjU3z1HHiuE46T1p
         ZtEmh7POtYyBvGyhcW7V+Eq8l2wvgBAK5uI/F3kAaGCye0Lu4N5GoBgFRgtj4JB/iEUm
         RGmH420oJrphUZXjExL+yBBCpnN5ffxE3vLumwcOlwU7Iqyic9nJrJUFVNIeMCQNGyEu
         /fbDzCAk1G0Vg/ZhK1yJrM8yHWtxE5ckn5eP7hhJqmpiCu1WMihoBfTq0NX+CpB75eN9
         B0dm+f3YqwNfVCMkxAqonRhIbMX6fFOAOHrQ/vCqz2wmKYn6hC1OBDysywE4nyf/yUWL
         slMg==
X-Forwarded-Encrypted: i=1; AKwUvBwn7auNRONqOGxZUqs35CMsPnwQ2CdRFpGDuGdQn4hH/0NsMxZIhtRaRY3Oc5ghpgAYjdG+0D9bXnEVtx4=@vger.kernel.org
X-Gm-Message-State: AFuF++kzCicD/UYsgOAD7wjufRU14v3dFPpfameX1K9uIfJ1a/hbvsrL
	sFGIbfIGprfnNWUPHVVLjBIurL2tKWI3ZUtRDiFgoHsfEfOiYa2Y6V4L5Vd4aYfC
X-Gm-Gg: AYBFou3v3oESZtGvxUueJSfJZWx2vB755yGcQLo2DLqY3wKb1hjzRzdFpqWqlTMA9EY
	JLFWFJ16r9awsZJ9GY8oRHEyCvKaul2ol3A5CmKaDx3rDJ4Fz8YDS/6X8XpzZst5WPPgrdEk6es
	i4TNy9vaKMN8CfhoicJvWA49ll11QsxIknA939PVLcU6h7Fmf+Ow3VyumOATHZVDq3MqAUAFkQ9
	nJy7MdRu8TwWxKfsUMMZwGwwdReBS1SkgJ4TFkFywvHfN3Yz6mszwYDUARI6BUsG4v7qjcXyzAu
	9PN6PdVb2/C9dAkFH+6bPzJsI7gD+jOeJxA6UU6exGT5+x9RvAkMFcmp5Fl0BlciNSPaL0YsG+U
	lmKEwJU0xx3GlpHTHo74SAPEmgKnbUnh/0IKy4CIOfbamAtvf8Seh+R5EdBWrSu1CkpjMrNB8FX
	w5kloIYJsqnL11eHQDKouTulqFaj+P8Gnt/4OpIYg38mDZuEkPSzyOjILYIxWWj5jvWkxzVl3Qr
	hahEOYCZpTQEv2ZLG+ZARWh1OvwTJM3dwccW4Ayp8Gl0PxlYZWeuI8yPBAEil7Gvo0i1QhXY2zL
	ooGkF4mjs1PS7qLf+Mn/sy6CE3huJfX/DrT0DGx1tjkdxRtK6/2VFIRbD3ws3eUKASQwDK+CdA=
	=
X-Received: by 2002:a05:693c:864c:10b0:340:c464:1a2f with SMTP id 5a478bee46e88-340c4641f5cmr3563196eec.16.1790331793310;
        Fri, 25 Sep 2026 03:23:13 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:12 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] bitmap: fix three parsing bugs in bitmap_parse() and bitmap_parselist()
Date: Fri, 25 Sep 2026 15:53:01 +0530
Message-ID: <20260925102307.49513-1-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes three cases where the bitmap string parsers accept
input they are documented to reject, or produce a different mask than
the one requested.  Each fix is followed by a patch adding the failing
cases to lib/test_bitmap.c.

 1-2: bitmap_parse() treats a non-hex character directly before a chunk
      of exactly eight hex digits as a separator, so "x12345678" and
      "0x0000000f" are accepted while "0xf" is rejected.  This is a
      regression from the bitmap_parse() rework; the old __bitmap_parse()
      rejected all of them.

 3-4: bitmap_parselist() does not check for the end of the region after
      the group size of a "range:used/group" region, so since N and
      all became valid region starts, "0-7:1/2N" or "0-7:1/2all" are
      silently parsed as two regions.

 5-6: bitmap_parselist() walks a "range:used/group" region with an
      unsigned int that wraps around when the group size is close to
      UINT_MAX, setting bits below the requested range.  This needs an
      absurd group size and never writes out of bounds.

With the series applied, test_bitmap reports "all 391544 tests passed"
(UML, x86_64).  The three fixes are independent and can be applied in
any order.

smjain (6):
  bitmap: bitmap_parse(): reject non-hex character before 8 digits
  bitmap: test bitmap_parse() with an illegal character before 8 hex
    digits
  bitmap: bitmap_parselist(): reject trailing characters after group
    size
  bitmap: test bitmap_parselist() with text after the group size
  bitmap: bitmap_parselist(): don't wrap around on a huge group size
  bitmap: test bitmap_parselist() with a group size close to UINT_MAX

 lib/bitmap-str.c  | 24 +++++++++++++++++++-----
 lib/test_bitmap.c |  9 +++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)

-- 
2.43.0

