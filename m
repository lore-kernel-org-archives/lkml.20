Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCFB47140F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788526114; cv=none; b=S0f/PbLwCEO+Lk5dMbBXVPMUlwqUgxr87t4AH9w+p8W+gaZx3SQXnFfcDbBGupmMwNc5JX70K4iccFjLYfXvvP+X9v3KWit9HhWJ+AobGsTS9rDQwf96YmK5Gv50+Zc/h8CZ9asC4Ux1navfHJUO++GgyApehvToF9quT9GMHkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788526114; c=relaxed/simple;
	bh=g9LdAadAtJGK6RqR7HDIfb2VvRgfe6mcHH0mudZfMpI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxn7h6WzKlm7z37U3CrejzoMrSnTZRDow1gWG/D87V6reggt4A1xPKA6eOP0wadKZroJNNsYu90/lzWlK2hFO1e7XuBXTFWyTZuKrWmetUbqDZGQD9TsP8GC+Na9C+CdJ23d3KoSUYESbFlrOL1zXCWVUs5i+OxBBJ+NNjsP3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rzo4ugzr; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rzo4ugzr"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-459281bc13bso665369fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788526111; x=1789130911; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TWn5zE/4ywVNMIe1WvKfWNKisJcFEJDCvB/UV2P/7NE=;
        b=rzo4ugzrFHswgSDR0U7nO7YzcAnzImSbccbCh4W3BQPrub87F0LKF5Nu7MCiCKtD6Y
         sWwYMWC8s9xhGJNw3UUg3qG2x/lbDqmbo3WtT1EqBp/BSOtNam6rxB8ld3JlL4e/TuV5
         qfEdyivIWZyb+4VAGusNJavIOPPl+yTtL9MUaQxFgxO2hIFw6CXIHJ1rAY7daYwZjSV4
         xWV7uC/NxmWHq+XitSgOuPexFiRwGeuB8Hg8SEJM8ei6jf+pKp32HFNagprqZNzr3q13
         aKBXM5er7zRltjK4Jo0ToX4dmPSh5jP691kEeAGykfxdqmB9xnI7jn345WB7V725MMbb
         s+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788526111; x=1789130911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TWn5zE/4ywVNMIe1WvKfWNKisJcFEJDCvB/UV2P/7NE=;
        b=LAqm15wNay2/L8gUoKkFUR0NftKnCEHl8+BzUuBsVo5PASIbmWUlXAgyxYzk3Oe0KQ
         oHkqacE8ndlc3QhB4IoYFENm03Xac8XdrCuGq450BfZQyk9lRqZ+ae04kHFlsHrBBusn
         cvlSDZaTUWjybhhkCxTNHjzRKW94oaONMrMybg0yCAWoIKsldqgKU3II7gxoSE8eLJ0l
         7OxxdjEiiH0PWokvxtQnMzksxVroYXMvXKcNzvsRbaQU0EA5BukJk5LH45WqSSE1Fl7n
         9EHBBvjOVLW5H/QPghq4X7JspMffQvDeluCmCkCR+1IqN1ko6jJPTSVZl33whMv2W4tX
         OeCw==
X-Gm-Message-State: AFuF++nT8H+uHDcsvWBRz0ykZCcpkxVXLXGgwM34U2ClTJ+20yF30P3V
	cmIzc0Wxr6HUlhAWTyLWAc19tNa06wzwVB4cPxeddd1A3VWIpefMn04X
X-Gm-Gg: AYBFou30NMC/FLSEETQQgnWy2mzoSmzUIAWMhMV64/UWfBoDn+/B48hIhh7DTTO72GC
	vZNAzpoVQgBCo7SV8AHzr3KEbvsCg7PKl5rQf1qGEmm5tqA75gGPBLqwEE3uiKsnMlKd/sF8mSa
	7niWZvS49xjMQmcsJsqKqfFO1Kw+ZX/qSBuaVVJmvorRBf0pZ4VFc35rjsPkmLsfo6D24TqvBH3
	p7uEgqAyXBFq0q+7Up8HvuUooXrTHTVf01iPgP2eza1rt/ftT2cNWXR4ZpzcA7s0jfdsSDt2cqf
	wXogCOoYImPpg+J1rg3/iBQFLroOzkC9wEg6DX1ToioRaKYBRf2JeNOR0zlSRot9EoV/LsTE5jD
	kTRv8IX+7bBazg0sJHm32TWa/e/yqZdrn341yKBPJtCpXOXGGfGSg1jBnZPnieiyYhuScRo9vC7
	grnAgTYxxUXBOXfW7yWEMK1gNL2iuf2KWk5AYPVOxQHPT27o0tCu8BTzU1tJjqd/akS8mu0M+cI
	+oKWYVndHbIg38=
X-Received: by 2002:a05:6820:16a6:b0:6b7:8415:d779 with SMTP id 006d021491bc7-6b78415d96fmr1566458eaf.36.1788526111318;
        Fri, 04 Sep 2026 05:48:31 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339befe870sm7322412eec.30.2026.09.04.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:48:30 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>,
	Li Nan <magiclinan@didiglobal.com>,
	Xiao Ni <xiao@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-raid@vger.kernel.org
Subject: [PATCH 1/2] md: fix typos in comments
Date: Fri,  4 Sep 2026 18:18:21 +0530
Message-ID: <20260904124824.9585-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904124824.9585-1-hemanth.selam@gmail.com>
References: <20260904124824.9585-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/md/raid1-10.c | 2 +-
 drivers/md/raid10.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/raid1-10.c b/drivers/md/raid1-10.c
index 3b0e230692ba..852346420848 100644
--- a/drivers/md/raid1-10.c
+++ b/drivers/md/raid1-10.c
@@ -87,7 +87,7 @@ static inline struct resync_pages *get_resync_pages(struct bio *bio)
 	return bio->bi_private;
 }
 
-/* generally called after bio_reset() for reseting bvec */
+/* generally called after bio_reset() for resetting bvec */
 static void md_bio_reset_resync_pages(struct bio *bio, struct resync_pages *rp,
 			       int size)
 {
diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
index 1093c798d9dd..2ac2dadda19a 100644
--- a/drivers/md/raid10.c
+++ b/drivers/md/raid10.c
@@ -1921,7 +1921,7 @@ static void raid10_status(struct seq_file *seq, struct mddev *mddev)
 }
 
 /* check if there are enough drives for
- * every block to appear on atleast one.
+ * every block to appear on at least one.
  * Don't consider the device numbered 'ignore'
  * as we might be about to remove it.
  */
-- 
2.48.1

