Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400FE34041E
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386024; cv=none; b=Gx/L39tuKhpS527XFAB7AmGohnMffnQNEGQWJQCGx10XnBEgXoUcUiWll6/ii/3bodBEE6428pf9DlywncuEw4hkOg1JsQs3jRLwLAG7TlVK1MsH3FROF44fWHYFAQznY8QELTpRkeo0RjQeNqJp3Fl5Hbhd0hQYjpzkvONootw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386024; c=relaxed/simple;
	bh=CYN61dEvlDbOgpjalvGP/lYPKrcK1YupiTPLwsEsUMo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyTXmvcUBe1MkieajU5fmpwDNLRI6mHZ6O7JIkDBdrr916Hp/XzDSj6wZiSbtKZ2+FZoud05TL1UEBOLqUzuJU1QEh9bVo9//YwFlGGBNCjOUlBIsYwfASiG2ci8Fe+yFh7wYRlKiiip+mM9MVkOvVGIJDwH+Bzqpv/FfaJu8g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2qJ96VO; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2qJ96VO"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-341027843a5so943787eec.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386022; x=1790990822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7q++aKiyMXWRZv3MBAW1YtprkAVLWfxUEUL6GzH284=;
        b=Q2qJ96VOT+LUXsQLgDItygede9eAu5092sJWY/hECPbQiz1fLd5zKoDKpkhCD4FQFV
         qSp6i0lKejcMKtLZtIpuADmVu3n0l94nelcrmX5Z+2zqRxqQYsgjH7laKRJmKGCpcQR/
         rezqQYDW1/60QCcu+4C7VVwsAxy2SO867r4vkK9aaTtUEB3fiftjPoPE09uHiWQfg70U
         ulgE474Gh3fSW2h0jiduJSsiObbEBFF8ItxqCkBvoayQ3fWiJVYXuZqR6E/DueP55qYH
         NnSEQYRV9YczKyCXxnaEdevl5uAJaQsLYwqMEnF4D5KsiSRu6gu7n4mYMwYyAUtD5KXr
         Ek+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386022; x=1790990822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7q++aKiyMXWRZv3MBAW1YtprkAVLWfxUEUL6GzH284=;
        b=eww8t24fkBTEDaknm/2HYnYrzzHMcUW3Vy0plp5hLgAYJx/YVY4XXzPA2cyh0TWbZM
         aPd9XAvmfkuJwP/2TUsL19iqsw4IAaE3F+pPHeNpPxVFUBHqzEP5nhrDq2atCgZ0ZNRJ
         F20GWnCcTRPjhVEbzc59vEVgBBvjjhp6osXpPrDJ2zh04aPA87a+MQuQvgDZ4Zf5i+bJ
         +QN45XO2gRD/Snn/0xB0S0YmNB3/bvTXilN2vDmX/ydeDLFvI1I7NUGDuGpJo6qBF5sm
         OZ8y9KrAQo3tr6BgCzGnE/DNuZHaWZXahM9P7K2fKwIuHrBOZE7Vl1DvEzxPz4Vvj+ds
         5IYg==
X-Forwarded-Encrypted: i=1; AKwUvBwXYV2YMP0suxwFI3AIdMXhQEf7GIYHBU2RCgwSUsLtXaFEBOKepUiAB5bAy5J5nE5uvDXTqJHYujoeRWU=@vger.kernel.org
X-Gm-Message-State: AFuF++nnK1mke7DJLm/syUP0LWtPNAvguROhm6qMLkrGGCFgUOByWlEr
	d1KZzW9MocDhj/LF9Sspk/zr4X/rPbdspWaX6xqHsVYvKRBH+9m/EjUQ
X-Gm-Gg: AYBFou02UpXI+tr93V/KCJcWAtWmHBZy40YO8yAf2OSk3nUFON0VeltqVbbNJQBDXTW
	TdhxwyH1iM0dl4Z0jFNNQRx4x7S7z54NPp/+JfYq/LM6aCdAPHCdbGPsOfYwy6XbU2ODcKauTTt
	eZU6SxLHjD7LfCn3d0NIaMcPWOcqZqFfa5nlzJK7UcGngUd8/i0QvwZz/kCsgAKF2t7USzbS+7l
	pGc6TOhUCw04UusFoctWUXEWXSCKypoffu2WWDFdG/LjxVXOyEWLeP00MBtgRYGccDT/vjLI3iU
	ELTrcEnTK/JNSyWL8PJM13SPRrCJhyFSxARSqiOagELta849uNAsYOhV97HXPEi5yJMWASYOpze
	0v0gkBeFhJ0lcA9EuDgpETH5xsKe/lYkEFXP3xSgxfpcu7tpFvdxERfWP1gh2M+8zD356v5vrlz
	fR7wzOk1gxvmfx+/mxDd38eEZYrmtqFIsy9h0EIefmeeurkcl+HF0oxP5GfQPBhjw82bbhsggKO
	h1sfYqSmG+ztjkNyyFzU7nItLVrd3OJqnmQpLiNb3A2wGrppFWU2qLsC1qDqRyRiQzF0VfhAczL
	wK3euaz8AnqvnGSciF2497Mr9kgdwW5UVAG4737fthKSmPlfDFa2OiTxru1tKnpqxq+yXVntWA=
	=
X-Received: by 2002:a05:7300:7fa7:b0:341:fcbb:abfe with SMTP id 5a478bee46e88-3427217a18emr2182095eec.26.1790386021634;
        Fri, 25 Sep 2026 18:27:01 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.26.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:01 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/6] bitmap: test bitmap_parse() with an illegal character before 8 hex digits
Date: Sat, 26 Sep 2026 06:56:47 +0530
Message-ID: <20260926012651.15524-3-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260926012651.15524-1-jain.sm@gmail.com>
References: <20260926012651.15524-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bitmap_parse() cases where an illegal character directly precedes a
chunk of eight hex digits.  These were accepted before the previous
patch and must return -EINVAL.

Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 lib/test_bitmap.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/test_bitmap.c b/lib/test_bitmap.c
index 56bd23059b26..35bb18f6e326 100644
--- a/lib/test_bitmap.c
+++ b/lib/test_bitmap.c
@@ -643,6 +643,10 @@ static const struct test_bitmap_parselist parse_tests[] __initconst = {
 	{-EOVERFLOW, "badf00d,deadbeef,1,0",	NULL, 90, 0},
 	{-EOVERFLOW, "fbadf00d,deadbeef,1,0",	NULL, 95, 0},
 	{-EOVERFLOW, "badf00d,deadbeef,1,0",	NULL, 100, 0},
+
+	{-EINVAL,    "x12345678",		NULL, 32, 0},
+	{-EINVAL,    "1g12345678",		NULL, 64, 0},
+	{-EINVAL,    "0x0000000f",		NULL, 64, 0},
 #undef step
 };
 
-- 
2.43.0

