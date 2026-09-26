Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AC2B3328E6
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386021; cv=none; b=e0xZZOWiwZDBdFCEEWR6AeB/X06szo6ikkRovD+lrABhBWEk+NwXljhicl6XRVkCyJXQrDpgQLN10tgNxKfw2qMPg22lLZDtGW6SLd2oFSn3dicgaAMp20fBRGn1JH2HodhrK3NZ2dMa409yP4+zFypgtrUyB9dAQlKQA4eE6nA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386021; c=relaxed/simple;
	bh=5R6zxCwAeO30xRSGENQTXQyKFP1+YNPjBJ6VD9M4MKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H5S6FRzHlvsGo0JMPJRZlGHBbiVcHMfL8DdXKoI47PBA750BLjwTLXI1PVyZ1a/mGOf3aloadvhbP6JlKPSgVCICdpry1LyDanTXXEXdkLdE5Ana6c2Mddbn8/v4CCKkfPCLQG4Wur2iTBTxGXM1WyAUHlg6UjuW9TKatjLOjkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OIHR2Emn; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OIHR2Emn"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3428f70d7e7so427422eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386019; x=1790990819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAX2DC2Qj07KVXhO6M4DWhFN0YqZQz8iozKl41wB380=;
        b=OIHR2EmnZdCqpCYatADGE6Ia97BFeAAdIeeeUEYhJLomiFgX1q0q/eg1ebpAH7RBxs
         Yf68yuYr+bxJcKp8cB6brKL9JeBjIFaUBsD73w0K6fB+EFvLJU8SpygrZ6VhLlg/s4t+
         kf/iVynrpaNXeDUbUMfGAy0U+2adAK3E5GiNxboRXETA/p6JFhK094ZuEcF7B+BWAYSA
         ZKhv5hKZztYMrx3YgI6vofA7ax18g1OJJY0n0nTdH8gdacEzJZfZj4/X7XgP5b6bKxI4
         JxAhCm75Y6fHVqS9mN4ZKPH699bJZ8Xoaq2Q2nGJWEMmFc6kN06Ez6lv3otLujmQ67vH
         iyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386019; x=1790990819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAX2DC2Qj07KVXhO6M4DWhFN0YqZQz8iozKl41wB380=;
        b=yiaovrFnKW5YwC4vIytSiXLgM9HC309o1mhbxh1L588/qZr9/CR6NbmGFKE9ZTAC3u
         gAhgD1gyoA+bCfPlB8wr4RU0fjj5C9aBR0TRH1WUkzP30UWGOenA2I6Cgz5XBJuPBJg4
         tSBOE+cmP7AgfVD5dWmF8aOm3TmRAB2gghIYl2eMGk68hj4iVvuhXWJgg/9a1d+fyt00
         HAfaGsY94WwsXDz/yhCBrwjc9jPg3igVLT4P4Gdo+F3cb8gDeSc/qr4ZtTGbGdDiXVEf
         WiBWQSHVw3KwfmAE7uLD9IQfz0mZ0kWr0KXgLj/t5k3Bq2u/EeRTMjm+vc6+euao1F2Y
         bvfQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/ITnvljLTSGQRh+fMG5nGxhUGIAfo3unOwqwJMUaGNhsoh5NDl6k12OcTCyBOU4ejChy5jjZoLOKUDcU=@vger.kernel.org
X-Gm-Message-State: AFuF++mdbnvSoTeIScjd5xnM9zfAwtjIauX8IRVY8oqITp4yUtmrUrCA
	HnjVmcSOpfAmKr8MT0wODfEEnp4rIKOywCHe5pw+M2XWUk6Uf7gqWa65
X-Gm-Gg: AYBFou3+D9FE+hTy3B8tWgCAoi6/31CGilcOuF9vPk3KZsuaLSWdZDz1Boc70f+6cVe
	pxjxEHOeiZNfKz4CVR30WnjUnkMg5re651/S0bLqWkeDbszbGLx7xmHymc9lQic7UKlULgX5j9N
	K7xmrTzpAd/D4gZdEi/nKJDY4tjods3pj4khtfIA/oHpjhOm3Eiiz7vpvDFetoTARiFUx8eUllu
	RLPLXdKMy6zNnnQWihLUkrQ1visXaI/NdpRWshvWxTVDuacuhg9NXBKIDFrT2XVaFoyvvXnscUk
	aNIu3FgPr1u3g+nu/sw1uPiH+9A0AYBbdgN3KKk1U7RCqN/48Xh6pUoa5//7pfQ4wy63ZNXTM1d
	t6ksDHX1N4etwqzqn02A0x8cQvi/Um1EqjjOPnzIhdmT+HsFDbpMYXsfpdvQ3MoYNwKzY35+lEf
	+ICvIHH8BsHUYwthjgxAajemIl98NjEQAJLzZTE0Q8bAP4H5L0gnCTeXvZwuJJcwn+U4woa4e54
	uz+GQtuldJAHZAw6e5KON1+rihynJAl6D4fcm60nH3dqPYJHwGHUtg1d7UCpZsEbp+3KTR54/bM
	sgUhfGGWmnUiuaYBRWu+fo8cjbmG6ztVttJUcMHImCtaj+jHia13eC98WST4DlE9/zR+kCsBXA=
	=
X-Received: by 2002:a05:7300:d80c:b0:33c:2873:8ead with SMTP id 5a478bee46e88-342711aaf3emr1499377eec.16.1790386019057;
        Fri, 25 Sep 2026 18:26:59 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.26.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:26:58 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] bitmap: bitmap_parse(): reject non-hex character before 8 digits
Date: Sat, 26 Sep 2026 06:56:46 +0530
Message-ID: <20260926012651.15524-2-jain.sm@gmail.com>
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

bitmap_parse() is documented to return -EINVAL for illegal characters,
and it does so everywhere except when the illegal character directly
precedes a chunk of exactly eight hex digits.

bitmap_get_x32_reverse() parses a chunk from right to left.  After it
has consumed eight digits it looks at one more character: a hex digit
means the chunk is wider than 32 bits and -EOVERFLOW is returned.  Any
other character is silently consumed as if it were a separator, and the
remaining input is parsed as the next chunk.  As a result:

  "x12345678"   -> 0x12345678, returns 0 (expected -EINVAL)
  "1g12345678"  -> 0x1_12345678, returns 0 (expected -EINVAL)
  "0x0000000f"  -> 0xf, returns 0, while "0xf" returns -EINVAL

bitmap_parse() backs cpumask_parse() and cpumask_parse_user(), so the
same inconsistency is visible when writing masks such as
/proc/irq/*/smp_affinity or the network queue rps_cpus/xps_cpus files.

__bitmap_parse(), which this function replaced in commit 2d6261583be0
("lib: rework bitmap_parse()"), rejected all three strings with -EINVAL,
and a "0x" prefix is accepted today only when exactly eight digits
follow it, so no reliably working input is lost.

When the loop falls through, *end is known to be a non-separator
character inside the buffer, so return -EOVERFLOW if it is a hex digit
and -EINVAL otherwise.

Fixes: 2d6261583be0 ("lib: rework bitmap_parse()")
Assisted-by: LLM
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
---
 lib/bitmap-str.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index dd9aa0635fa5..e02c5bc80951 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -414,8 +414,12 @@ static const char *bitmap_get_x32_reverse(const char *start,
 			goto out;
 	}
 
-	if (hex_to_bin(*end--) >= 0)
-		return ERR_PTR(-EOVERFLOW);
+	/*
+	 * Eight digits have been consumed and the next character is not a
+	 * separator: another hex digit means the chunk does not fit in 32
+	 * bits, anything else is an illegal character.
+	 */
+	return ERR_PTR(hex_to_bin(*end) >= 0 ? -EOVERFLOW : -EINVAL);
 out:
 	*num = ret;
 	return end;
-- 
2.43.0

