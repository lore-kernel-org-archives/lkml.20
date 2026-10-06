Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66337F310
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 22:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791324406; cv=none; b=UvfNXFGjjMr0e8vR1OoJJisim2BtQEelwmNoJ3zyFe4hkUP9bYK1QYbj7o0BzrthbjHsLAfVXYva5WzUSUp395lUB2A7pA5TWr3rPcU02UJTX3yhFs4cjl8zLb8utdSDT0RGqHFzYuQUXMdvhfBh0IarZ9BYI6UDPHWZvZgz5wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791324406; c=relaxed/simple;
	bh=S0hzy6+FdzanYQq8RA+km9ypXgv2p7Rwg6W8f/13eaA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JOX7tVYXvA8hjwAnZ9MM29IxO8bjZMDaMPUfw5rvdf2wqD2mkF1MCyb/tl4bkk5hdtfm/bCQ0hhk37uEpEIvULNTcCZIk8aHovkZFBS+ieQLCUSnBRjN2+y50VslwlNg0gFZI6PCKtnfTiOowQuDDh7P2y1SadhcVLWBriLL384=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com; spf=pass smtp.mailfrom=openai.com; dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b=WwGVDmAp; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.b="WwGVDmAp"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-821a7bee9b2so1234388a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 15:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1791324403; x=1791929203; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nBf3erK4lQNAxshTTULuJxGlEdxTadfb57Bl++VwwQo=;
        b=WwGVDmApgz6LqmTXG7L2JSX0wxrdUDXUxTP0l+4FS/LQgJQX+HmVWDSxTIPpfg42DT
         0o5GYMcqYiet3na50sC03OfyXA5ZlbMgEPuKjcyU1rLZ2vATW6ZU0bLKXDNN9I6oKjaM
         z3+EgOy0vdXwt00aQX0UvBRek7KpvBJoqis68=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791324403; x=1791929203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBf3erK4lQNAxshTTULuJxGlEdxTadfb57Bl++VwwQo=;
        b=tmw6Egzr39e+4JX4l1s/9MnafnLKE2FopenyJe/DWCv6imObMG6Z2KD6k1bDIZHd67
         XoTY9dv3Py80N8f1mBwKPO4tYMGdy/BH0zqamyN4Njyyyd4I/XuBJWNn5tB1JejaJUfd
         MJx5VSFBc2z+p4N5Fj03m7r2d2s75r5mVe8P9Zg7GPFh/rLq9c8R3bsFgctw7SHb2Wfh
         sr9DbWWD+GyibCG9DYyRDO72SOkzsyaobXYYn5L8KJizy/rhM7pw9HzZdRbqGyG9RdQj
         8QPWhL0yfOLMMIZom7FeHNcLnL2Dp3BKcAY6sp5Y2b8/MkwjiqhV6JyCIOqctNxpXJTd
         ZYtQ==
X-Gm-Message-State: AFuF++lvdZ7Eopqy43c7OzqQySoUxpnqZM53h/AGwyiSj+GoeUlc8TxR
	IQRjuz772YphFVEHBwqK3Nx6PMM1tbkTVrUMG0Q82zXInk1FgMKz9R4uMyM1hIa3N2CzjO9pwk9
	EN7/4ce0=
X-Gm-Gg: AYBFou28SttMOMkaHOe4s7gUu8XrNo8VyrXq+2Bru3hL5XenTJA+p8rSG56w2Oqbs/D
	77IzovC9FShvyiyKOy+diOdDWAr+vHL6nrZFutzvAymNt6c+5IBstiU9apCO3B6sU12SUid1JqL
	0XUZjJ5vRSJyo1jX9tgWsM5OoldFnLUZq0u2+n5TBD6nCt/xl4OygiUF3MDQYFks3sov0EpuUz/
	1FGcRmQmoCNXmhILmfLmGaQL6Mvk3VGB/iB3guubMU3hH8jYGKMLFkdBBGdd928XD2B3oAWUcgo
	qTadcMcoc+7mjS8CoagHpMv2KD8hsJUucanSBASXWEmDbz73neOZb8hbWDGUwgOELjvt3lPVjRG
	RJ48vI32EydKpcQDjHwYeIwc4tjgR/9DaW0SnJ2JFGTjJv9oo/5txzIqud3G2Ivbj1wWpvCaqk8
	9RIj3EmZXX4/24UKhFtPIDoPYqeKLTQd3zCCLCu7dmnqP7Vf/CnFM2GKdBH7VyhgeEILge7xXpH
	NbaHyBaI1iwrfq8pH+OcusEJ9ExrTfthEnUV9l+LMoz1/8q+1MCBG+7QP4v72iB5xVH51sPfmo=
X-Received: by 2002:a05:6830:8548:20b0:814:ab94:7779 with SMTP id 46e09a7af769-82802951d62mr2576272a34.7.1791324403574;
        Tue, 06 Oct 2026 15:06:43 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-82adbded9afsm713790a34.7.2026.10.06.15.06.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 06 Oct 2026 15:06:43 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org,
	Kyle Zeng <kylebot@openai.com>,
	stable@vger.kernel.org
Subject: [PATCH] assoc_array: Preserve full words when splitting shortcuts
Date: Tue,  6 Oct 2026 15:06:38 -0700
Message-ID: <20261006220638.32195-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

assoc_array_insert_mid_shortcut() copies enough index-key words for the
new pre-shortcut, then masks off the unused bits in its last word.  If
diff is word-aligned, the shift is zero and the mask clears that entire
word, even though all of it belongs to the required prefix.  The new
shortcut no longer matches the objects behind it, so lookups can fail
for both the existing objects and the new one.

For example, inserting a user key with a different description length
into a keyring containing enough full-hash collisions can split a
shortcut at bit 64 and erase its hash word.  The resulting search
failure can also expose the pointer-dependent keyring hash as a KASLR
oracle.

Only trim the last word when diff ends inside it.  This mirrors
commit bb2ba2d75a2d ("assoc_array: Fix shortcut creation"), which fixed
the terminal-node case, and leaves non-word-aligned splits unchanged.

Fixes: 3cb989501c26 ("Add a generic associative array implementation.")
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-6-astra
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
 lib/assoc_array.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/assoc_array.c b/lib/assoc_array.c
index b6c9723e12ce..20ef69e03780 100644
--- a/lib/assoc_array.c
+++ b/lib/assoc_array.c
@@ -865,9 +865,11 @@ static bool assoc_array_insert_mid_shortcut(struct assoc_array_edit *edit,
 		memcpy(new_s0->index_key, shortcut->index_key,
 		       flex_array_size(new_s0, index_key, keylen));
 
-		blank = ULONG_MAX << (diff & ASSOC_ARRAY_KEY_CHUNK_MASK);
-		pr_devel("blank off [%zu] %d: %lx\n", keylen - 1, diff, blank);
-		new_s0->index_key[keylen - 1] &= ~blank;
+		if (diff & ASSOC_ARRAY_KEY_CHUNK_MASK) {
+			blank = ULONG_MAX << (diff & ASSOC_ARRAY_KEY_CHUNK_MASK);
+			pr_devel("blank off [%zu] %d: %lx\n", keylen - 1, diff, blank);
+			new_s0->index_key[keylen - 1] &= ~blank;
+		}
 	} else {
 		pr_devel("no pre-shortcut\n");
 		edit->set[0].to = assoc_array_node_to_ptr(new_n0);
-- 
2.53.0

