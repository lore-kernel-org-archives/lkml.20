Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B973B396579
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787995230; cv=none; b=PYpRDqxjRZtbzjWNJCRs3BWAermPZjh2WAc/q7gomTYCXT8QHlocq48FA2UKHRYoNm4v0oum88NhEUrhT+r4GP2YsU+HZfT1Sle5rag2qUm06uqKB67+11KAIow1iWacUH3aSb6ric+AL/c4vQoeVTccCIU/hOHwfkEB0D6/SRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787995230; c=relaxed/simple;
	bh=xEJsUJXXq+AQ7oTTfzOKOEAmZg7d58nz4OsI75LCCcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TMRE/4PqucybfzSJHbnJ93f2a9wvIj+q92B95A/li8F1NNh+/cVt4cjYY36vYQ7pJEGR9alMnU0Vt3qC4pWFsY/vyC6S0UweND3hOIpQl2J1GEYGnAQotCGXn0Cr7mdrMwbWjiiP+tSO4tN7nsqC6Kz041UdjWYZSa5ZTXQcrn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H3WVR+9z; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H3WVR+9z"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so21324695e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787995226; x=1788600026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g1+HRCUsJSMaHeBVju8py9w9BV9sqUgEs0fVkhwu3rA=;
        b=H3WVR+9zSVGEDR4B1B+nf4ASE48ffTgB9KdvfEkMyzya4pm5cQsRqpzOsguV6ppDWN
         brBXDz8xRt+ZMqhrvC9nRYNx4tS6wchDlYwaW+LCzwWyGeoguT7rPy1QyKFLN9JzWW7S
         wjWJPwE6beWr9tPIdYOhpJJuq+TjDCUFGQa2oI0soTiB9lA1+cAVzgJuIadfpJaMXB1x
         dsTCuEoAsnojs86neyKJ6z/Zu5yEHMD4Q5JxEbR2se0yqy8baFpvl/X8/gD85C1Krpm/
         8ecyOTqYjH9kN5fyVpKLlkd/cnj6wpemu1hkeRZXFf/+QBBm5bh0+4bZB8ySg1Fh72+P
         zcSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787995226; x=1788600026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g1+HRCUsJSMaHeBVju8py9w9BV9sqUgEs0fVkhwu3rA=;
        b=pWXWjsLBjUlpQ6c8o6mKTbgxr4JC7Az8hJgnmusy3UmoNFr4MZiKvpiLC9ZW742oQQ
         5qvsBaWXAC6+DEbhLgDXaGEyx678IJmD5BH3/H8b8XRy8nIQNGDVWlckwx6y1psBv8zK
         6mXyazmI+rojCWC0VozrDedKgciGqrT/VXozxV2ZGn0YicGZuuszRpfvq+9QnR4t5r2o
         GAt3RVU5bCwU78oYLSErc3k+giff5WO2Qxl3pVBeyTrfw08p9njl/eMsgGWqcEygOdDz
         D9BBUskU/1sImzgJLlnXKm6d4/QGh/RD74l5gqq/7oNEY9Ti3fFij2ct0s7U+pkXB6eR
         3/rw==
X-Forwarded-Encrypted: i=1; AHgh+RoyZ9alu4ajBcX/oBRCpxOqLJZjMQKwQ58vXye//rCI6AI+aSLAS04OTsZRqYT2hmouR0mnKAs32lr4Mag=@vger.kernel.org
X-Gm-Message-State: AFuF++mZt71mO6Ms8fuYr8rgs+d7XepIph3EFNxICaS+x8tCNbtrVJHw
	Afsxfz4nGUh/SeMBqC2KQYURWuGnPdoKVZcHL54o7QZqOXZkSgIr5YqA
X-Gm-Gg: AR+sD10QRSBJsYjZLO5m4UzsIuryL/srXskFme2gdEKtJgQFTKtitIQevAwNi9757cx
	Cg13IwpRacHVNmCWI905vZZSB/dC8+qCF4tAyiU3ATF7mpbk3rkAlvkdxQOciyFhV1CP5bemQeP
	mCA+S5nMXFJOlrDA74wtAOOayusaEcKHts05WDLzfANoqWuLw7ELItX+pT/W/1MZntJ7CmIquZb
	b9B5OL6KBOeEFJUJmF9m6HX8fQwjfWFYaOIlDIkTRmDB9y+M6K86I7nOJxDueOIl1SWzp6YTsv/
	hexAgFCXw9xIoTQsYz4fGf+91xBCDkn4gDeOWgcBw7QgP4gSDM1l934ydhGSVI/B5AMawf0baaz
	S8axoElPPLntBJ2/y1naLnZxcjsIEvCpfqUUeIo5UInftstIHcETjklOLa3wNioXPzFxJjJbIas
	wLyJ00Ffp0tlvAeZ8PfRa/DqhVqhMsbifEqU7nKVHWTfdxLm42b+l8OvP283npc0iu4gqcT4SuA
	aUMO1B1ygVfXc6yBgHci6m9gYwRuVU6WbZDIfQNM+/AP8+KSdrQOIAxaDSsl2MhN67HimkZylqv
	D+EQYtp9uigXWNzyACzG
X-Received: by 2002:a05:600c:3493:b0:499:b65e:49c9 with SMTP id 5b1f17b1804b1-49b91c4792bmr196921055e9.10.1787995225544;
        Sat, 29 Aug 2026 02:20:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-077-007-015-136.77.7.pool.telefonica.de. [77.7.15.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c510c9sm80468505e9.0.2026.08.29.02.20.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 29 Aug 2026 02:20:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Haren Myneni <haren@us.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Streetman <ddstreet@ieee.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] lib/842: require a complete history block for repeat templates
Date: Sat, 29 Aug 2026 11:18:50 +0200
Message-Id: <582dd9a92a793481f9836e1b90726935e90f5414.1787978627.git.kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <cover.1787978627.git.kmehltretter@gmail.com>
References: <cover.1787978627.git.kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An 842 repeat template copies the preceding eight-byte output block. The
decoder rejects a repeat only when no output has been produced. A
short-data operation can produce between one and seven bytes before a
repeat.

Such a stream makes the repeat copy read before the start of the output
buffer. Depending on the surrounding mapping, this can fault or bring
preceding memory into the decompressed data.

This is also reachable through zram's compressed writeback path. With 842
selected, targeted corruption of the compressed data on its backing device
to a short-data-then-repeat stream made a KASAN kernel report a
vmalloc-out-of-bounds read when zram read the page back.

Require at least one complete output block before accepting a repeat.

Fixes: 2da572c959dd ("lib: add software 842 compression/decompression")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Review notes:

  - add_short_data_template() has one caller, immediately before
    add_end_template(), so valid compressor output cannot place a repeat
    after short data.
  - QEMU 11.0.2 TCG with x86_64 KASAN reproduced this through zram. A page
    was written to a virtio backing disk with compressed_writeback enabled,
    then the backing block was replaced with SHORT_DATA(seven bytes),
    REPEAT(one block), END and CRC. Baseline readback reported an eight-byte
    vmalloc-out-of-bounds read starting one byte before zram's output page.
    Fixed readback returned -EIO without a KASAN report.

 lib/842/842_decompress.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/842/842_decompress.c b/lib/842/842_decompress.c
index 87d1e0f8a4926..45a9815abd637 100644
--- a/lib/842/842_decompress.c
+++ b/lib/842/842_decompress.c
@@ -309,7 +309,7 @@ int sw842_decompress(const u8 *in, unsigned int ilen,
 			if (ret)
 				return ret;
 
-			if (p.out == out) /* no previous bytes */
+			if (p.out - p.ostart < 8) /* no complete previous block */
 				return -EINVAL;
 
 			/* copy rep + 1 */
-- 
2.53.0
