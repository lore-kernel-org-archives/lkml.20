Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9525C55D891
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873257; cv=none; b=j6DBve/s6azgJ/tfajJa9MdfkNZg6560en5iHJdMLrw5PvXLGeDyq1Rpfsp/BW1XsVOnBSiGDN86eOdgNL8mhZQMn2Yb6T37fa7a+iQERaPyEBXfCMaOMM0rvMQ+fcVnpSW38jF+L4ctH0rXYYRtpAAUR6QDhIBhJ56qsCbKZXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873257; c=relaxed/simple;
	bh=lv26SAeJxy+BsWe+88/ox4O1QD8JH8gEB6CZwLn5x4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=onGhepgzTkYqUe2B1brV86tksYDN05oRHwufwSk8OUbxI/7Iqye+Xhz/Gk3Fxct56ssbK9o6a5Uxkd94aqgkiEJoWS83VERpbGzPmWp7ZYzD0nlt8nmZ4hcYH7E9pKVZxA1n05HBgK6/H4DulW3jdbhxm4Rmc5Exl5XPyd7r8OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jnwGr5H3; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jnwGr5H3"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c253425b253so675118966b.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788873240; x=1789478040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZmngaVsUToRipCvkV5xzkVfvhYV30Q+0QWGu1nqLPY=;
        b=jnwGr5H3ZAo5E8jbk/ncQQDxgMRLwVDQYIdi8+T8YfJh67kAOlFriHCA8hO1Ow+9cS
         J7s0d7l/07H5EwtnsWThW10S4z7DVR7xvuWKETFVT8PqMVVGmVYONfMpeAHtjO3Jrqzj
         EdUPlFAegdVRpLXjgtlJiZobT2LDF5RSv3Kath95/Gfb/+safwYs1m/DSFniqkOko8XR
         UiojAv0TYniT36u84cPBasAIOqJVk/HL0VFYdOhmeD0fS4HuGWoiQ0WUoOhEJGy/89+e
         cdji6JfvrMqR9JRMws6NQnsqpw2et7P0aYREA467yAqT0kSYsVkWfdTRvmjLXx+Ya4cx
         s7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873240; x=1789478040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pZmngaVsUToRipCvkV5xzkVfvhYV30Q+0QWGu1nqLPY=;
        b=CPPdROLW2qE+y3aaoRqljN6gW5LLorTxRKcNE4hQDEbkYS3UkkuCzAnodPagevMIYq
         GufxO28FmZTxAap/CXMIeABUFcZB7Yo3MW0FfwTcc9K0O8yplPx/76mXpXCRh6EzS7lI
         VUkj1h/si+msUXHA91IhpadmBynBqTR5JV4R2X5wC/E4iGejqJh8zJXQyEiLnF4vwJhE
         GNZ4pwhKWitbjO9t5mC0zKYT8H6JyNsiPzsgle5IKokdW9dT1mp8VaJcH8erB6mLkGHi
         sfQce/+SuO/bVrNcJOqE17vPFW5BEEb1SXPElofpRTpcOej+CPvh0XdGcXodT99rhiIU
         52xw==
X-Forwarded-Encrypted: i=1; AKwUvBxlVTljEenImhJdjKxXBiJExdn94f+QQMC3DjVugOrbXF9QJVWodIsrdo2WbHa0rzX3qlNS3hgXNHfCObk=@vger.kernel.org
X-Gm-Message-State: AFuF++kPvfaAlIr7Z1sPKj/AKDKTz6uOThtKnpX1Nd3kxRE8cxkkIzKS
	F/nNrqeIus3u/OPaQ1qhLgvYAJQag0oghlXpPsHhOGjx/TJ/GFJsdj8C
X-Gm-Gg: AYBFou2pmvDkQ7lZ8pjTtEKDgWGMW7UMOJOtGj3r4CKE+vMnu22vOYqImx7RoEdyQvE
	eFlmWaSu8QMtzjOnBO1ApLpJdk4KVEIvegGDRQMVPD89oakhx41Fa5XvO3n7m/doJHfej1lWU37
	3uEEYmS9tQWiGlp19mNGGwFkjWz/3+aJLKXkLp/b3KotCGObA1ugyUQzuF14kRjtCYiqUNSLT4X
	jiRBTtZESyO8Mw6gEXW+6Sz2vG6qRArD93YZdk8HLHa9lxNK76CfRGXeouThnEM8VDs7jZGrUDM
	J/jIjMmGd5uHzzAMzJ3dcx1AmIf8xSr8w7WOgzn8/awq+HH8MgLP1fDYnEiSDv3IZGSdxaVv4LG
	qglRUJbFHnJzvSFlgHkMNLi7SDtm6u0imWjB1FGCgwFEZU8Tgb7in9fh5JeIpns0rx+vbxaXtoO
	4El31tD7u8zX5JOJfU5H+XtEuVj8UyoQt/bqsai7VTS3axU3YZBA==
X-Received: by 2002:a17:906:2082:b0:c29:18da:43e with SMTP id a640c23a62f3a-c2918da084fmr93675766b.12.1788873240393;
        Tue, 08 Sep 2026 06:14:00 -0700 (PDT)
Received: from [127.0.0.1] ([2a09:bac6:37a9:1e5a::306:1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6e1c93sm625170866b.63.2026.09.08.06.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:14:00 -0700 (PDT)
From: Caleb Kan <calebkan1106@gmail.com>
Date: Tue, 08 Sep 2026 14:13:41 +0100
Subject: [PATCH RFC v2 08/11] scripts/gdb: reject trie-backed stack depot
 handles
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-stackdepot-trie-v2-8-1996d5cef732@cloudflare.com>
References: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
In-Reply-To: <20260908-stackdepot-trie-v2-0-1996d5cef732@cloudflare.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, Vlastimil Babka <vbabka@kernel.org>, 
 Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Oscar Salvador <osalvador@suse.de>, Caleb Kan <ckan@cloudflare.com>, 
 kernel-team@cloudflare.com
X-Mailer: b4 0.16.0

From: Caleb Kan <ckan@cloudflare.com>

The lx-stack_depot_lookup command can reconstruct stacks only from
contiguous hash-backed records. A later patch will encode trie-backed
handles as dense stack IDs in pool_index_plus_1 and offset. Without an
explicit check, a trie handle enters the hash-only out-of-bounds path.

Reject pool_index_plus_1 values above stack_max_pools before looking up a
hash pool, and report that trie-backed handles are unsupported. Supporting
them would require the helper to walk the side table and parent links,
which is left for future work.

Signed-off-by: Caleb Kan <ckan@cloudflare.com>
---
 scripts/gdb/linux/stackdepot.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/gdb/linux/stackdepot.py b/scripts/gdb/linux/stackdepot.py
index 37313a5a51a0..82aeb9f532c3 100644
--- a/scripts/gdb/linux/stackdepot.py
+++ b/scripts/gdb/linux/stackdepot.py
@@ -37,6 +37,10 @@ def stack_depot_fetch(handle):
     if handle == 0:
         raise gdb.GdbError("handle is 0\n")
 
+    stack_max_pools = gdb.parse_and_eval('stack_max_pools')
+    if parts['pool_index_plus_1'] > stack_max_pools:
+        raise gdb.GdbError("trie-backed stack depot handles are not supported\n")
+
     pool_index = parts['pool_index_plus_1'] - 1
     if pool_index >= pools_num:
         gdb.write("pool index %d out of bounds (%d) for stack id 0x%08x\n" % (parts['pool_index'], pools_num, handle))

-- 
Git-155)

