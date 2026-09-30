Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E53E51CF60
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793101; cv=none; b=WvPdRQX6woP7pzS+0LctzzTKOXYozQrnAA8YaWXqDkxOklxNQhIQCltNlttNmG16gkuOcDRPUbRCTPopIamy3mtdkZvr3nBBrPvCjlRwjPQSaSWI6nW4Ha+r2oa2Qx2soGRRaVYHfCLLWYVCEP5JDCMUT5T0SVRx0YUaUe8jho8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793101; c=relaxed/simple;
	bh=7gYzO9xANaW+GQ0pOVtXr+MstdzOHT2PWbr8BgiB2vs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FxbT8mONWHjtENzuLlEn42BQrlTTLUOG4SKyYVutoa258wFg+BpeMzOOqY4R5+YpcMaiOIaj+M1M9kO0PAClwSYIwiLrhAv0jTfLPi1gtk+Ydx+QPTbPLf4BZDME2fbQJJVK6aDkffg8o3KeGfkYMgsZzA/OBZQt3EAs4Nzfd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZ7ttFna; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZ7ttFna"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso19821925e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793098; x=1791397898; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yNtRQU0kHw7yMy5S6NDAzNgYXNVQererbxMxfyyIy6M=;
        b=CZ7ttFna/inPfqqThTqsgy2uKMDdHNpTPIpauKllPX/KbCWzappzPq6bzEJHt+kDkR
         apVtLRIJ79tWJZF1HbgUyLc3hrj6mYx3LSMHd39KwWXcVckhL5aRkl5gvCWDidjW8wNX
         g6NaL1lZpOeER7AeAfVhJ6ADMXlztr8SSvAo48gukPZ0vlqsJaHTfMU9vPQtNwCF7H3U
         MPFw+N7jYFOk+sMvSLogT9xFkQJRXk+nVO16w19mfgDzigp0K9Cgmso6+Ov0la1dng6u
         QMWeZb2YC8gZ2SoBhCLyBSwlm9iN2M7qwqg16xlbyuihZto8uijBHci398ou+txoW8Ug
         eCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793098; x=1791397898;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yNtRQU0kHw7yMy5S6NDAzNgYXNVQererbxMxfyyIy6M=;
        b=Z0+vAdUVH7ulgEY/bi+MYLtQsJ8LZ1YIuDxx41Umt2s/tj6jdt6eFmZSUo7NlM/tw9
         X2k2uFORN0scNxHZIk9eh/aGk2dHXXBDkEtFtYScaiDy7YOrzBvg/nILZYMZwuGaFwZd
         eQC0e7ToCRu/pOlbzfOvqirxtvJJKuSS6czRt8HuBciXcehbgSJmddfZs5Nggaqliz9N
         NoemHFjFZB0e10AV8IPtW4DaJuxuQ4S64P33KkRDt3ka5JVZofKUO6WGi2yRsRa78mtc
         eXlw3OF1WYgZU2LDzEZALsJhF5Ep9Ucox+IKtUE5vLJum0sj5PM7anmqtZkyN8qNDemh
         /xtQ==
X-Forwarded-Encrypted: i=1; AKwUvBzpgG+OwX0ggNTPF4B+9566vMuAfuYwXhEXE1rIQJyIAVxZZEw3j3U5KIS9U1Vs7gY4VWtSL74NhR7z5/s=@vger.kernel.org
X-Gm-Message-State: AFuF++nXhM23FZD+I2XnB23bKo8oOBpKkSjM47U9l38oOx1ANliP3+wr
	Pniek5nElAO359vdeVWgsP9Xizlhpvj1jAxLwnA4qJ0vLtp90MzBxHRY
X-Gm-Gg: AYBFou0DG/qmyUa7kS/4D4PWw08LWS3k49ngIRpNTyihyzXXfYXjS6V+up3l0YFNwCa
	YWghQOeWSpzr4SB5+hmmfkSNzTc029H6hwhhaB/zBArhLztvtHfKPZorhqN5yHYCsCHUa239Xrj
	PQPXnmknF2IB/kfpadOf72PxbyHE6bG7L2nBJPrRoFgBlg7eJCeI5TS4+FghtHKb1JeBWzyc7RV
	a2QOL3ZtLd6uKmucUSNUxsWg4XXLeT1G9eD3oD25ZxilzMONSOQXqI6Ytb2E8bqnR+UbydQlGAV
	AFCXPOUw2ejbo6dTnSZ2838nFvBRDgiQY8nhTOcIhc10CzDwUQePN+dGANU0EoAbmlCDRpTqix4
	5f4xbX5HldFGeaDPqG5Q9ZvojBWxuzRXugG1Dulw8VinrCqGn8biWxhdqiPiIw5S7+SBm0Wisf0
	4Q+QgO17efk+Gso+SkaS/riZdEcnwRz5LirEnwFut7uxsgGUkXOBrTaPokYl9DkWNYh5KXxlxVw
	CcMFdAokqVGXX4FLBkfrL9+kXtmNvwcSSfd2odAGF9cePDDLtsM7es+GHQb1HzE0mMhPeH1ig==
X-Received: by 2002:a05:600d:82d0:b0:49e:7c4b:1753 with SMTP id 5b1f17b1804b1-4a01ade8ebdmr47115115e9.12.1790793097909;
        Wed, 30 Sep 2026 11:31:37 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f90cd4esm3294525e9.1.2026.09.30.11.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:31:37 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: jorge.lopez2@hp.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: andy.shevchenko@gmail.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v3 0/3] platform/x86: hp-bioscfg: string buffer and password fixes
Date: Wed, 30 Sep 2026 23:30:15 +0500
Message-ID: <20260930183018.49629-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix string parsing in hp_get_string_from_buffer() and make over-length
password writes fail.

Changes in v3:
 - Drop Suggested-by: Andy Shevchenko from patch 2, tidy its includes
   and declarations (Andy)
 - Return -E2BIG instead of -ERANGE in patch 3 (Andy)
 - Drop a blank line in the declarations in patch 1 (Andy)

Changes in v2:
 - Split the hp_get_string_from_buffer() fix in two (Ilpo)
 - Drop the lib/string_helpers patch, use @only of string_escape_mem()
   instead (Andy)
 - Add patch 3

Muhammad Bilal (3):
  platform/x86: hp-bioscfg: fix OOB reads in hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: fix non-ASCII truncation in
    hp_get_string_from_buffer()
  platform/x86: hp-bioscfg: return -E2BIG from validate_password_input()

 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c  | 79 ++++++-------------
 .../x86/hp/hp-bioscfg/passwdobj-attributes.c  |  7 +-
 2 files changed, 28 insertions(+), 58 deletions(-)

-- 
2.43.0

