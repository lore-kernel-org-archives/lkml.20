Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585BD3368B7
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790386026; cv=none; b=kfaXBhJKhDkFQwQvDJIcfu1MfrlJLT9GfmShYyC5dltD4AbdiE8WzycGNxnBp0RgO2Y0EalhyW7dP5pAOOxJN1F3Ox6WT0/XBK7E5Kq70QgtOJbnyTjScKYZBZRnC4WQ4g3TLHylmGo2+t4zitmbJTfGv3rdJ6NMbrONFKXzvpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790386026; c=relaxed/simple;
	bh=7S+7mZrBlXly6dqbzIW0pkdPPidTnesVho6efu3dNp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvfnAIPDbILY5SJs1dfFcjqYJ7Woz8JVe8tMJw/LgNYfWb4FfzreE3ONtaetqMzO4bodp48kUL+0WImnfFs+IcfF/hQPLv1S83d8WisHx8XRrR97a36tvjlZiGvHgyqG+os0siGnIUgdGuGW4bxrmiuADv32JQPsKIvJ4ckJyoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XfHXgP8o; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XfHXgP8o"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340fbf9c1c6so858864eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790386024; x=1790990824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NnE9gvj6WLqWFxl4/dR/hy8zltQs8d3vgvovp+5ZHk=;
        b=XfHXgP8or+wyvFH3XpjzopygVl/TV6ENDly/UAaL1r8BYBoBot+WlymjyY4NZNWS1b
         UJoYXzQzhVsmPwehSTXw6H4WFLGwjLN8V6+QKbFfdLZvDRDIlXEslqsx18jD4Rx06/F9
         7YPK4SpNOsmDsiZBX8S+GSNi8dow7ZCIt/YWxke/XO5rSuq2qPVrcv0iiTe9VKFgp4RI
         o5CtpVdz/feX0NrOCsDaodh+u9SOW3z8chOqjK/QScJLih6LxYT4pjjYrEGFDtp3dIN3
         8u/WxZfQR6bI31WFVxBB39zwD0wNizeqUrlURa2GCXV6zV3MRM02wFdrz/+yae8sodob
         AGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790386024; x=1790990824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5NnE9gvj6WLqWFxl4/dR/hy8zltQs8d3vgvovp+5ZHk=;
        b=xPHwORB3Qfxt0QwQb4MiQe57++C9hXMJMuuut652FWdF7Xog5NuJapBC3PS0u73+7C
         osv1I2SxtUf3TkxhYEqWsmbHAvnLkwy+6NU9gUuLrphhawJ7NwbUO/lxTTfAR7LQkgJ8
         cLFC3iEQuOXrq55Qkfb7rN4vWTd6XvCMJnaV0oMb2K4MAHmCiWOg/IAxnuA7JW37Acwg
         9mlBfjy1Cv3p/H+MJ5hbf1UKDn5SYEjN6/1EzpHlZbC4Br6ZLPANgW+w5eNb8KyYTKrk
         9aOI+RQxXoKF9vG3t0FN/pkbA0HtiLtGA0gqxHHn/CMJ+0qhkzrBk6wVnR9i3Nvi5Zvb
         jhJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzN1wSwnG2iPlDupLqcdC3HtvAmdYAclQz5qvsD7ze8Zs94i68A7fJonSiPt848/Ldnw8kojoj5njVsd20=@vger.kernel.org
X-Gm-Message-State: AFuF++lHUnj6Ucw+bq69Seog3wOaVDqPxI1WxNp0dZab4b9NKee5wkbc
	f19RoFIebHvsTJG/8G6LJm+/hAG9GZOowr5SxlES83WoRvYbTMJw6ELr
X-Gm-Gg: AYBFou1eWYb+8ujHP9fRB6mcK6y2cdBMexvY1jUeWgKTUctfwTV45+7ImwrP5t5ovnS
	Rjg61ZFO3J7Z5/j9rGRTYm0sipqWED8ufPJVcoXZ4l0Zwwqthrg7/EL9yjG4bUyuz5RC5x/OTTm
	Z5qk5iK1UQU4Ahh1ulb/vRSPts4/mNLXBxw5UcWohf2FRHvkWoL2VJJPmrVpA/pgy/TL9JkXCns
	19zkJtpOizOYib5+BsbI6RbO9HAdVGfxX77dTdLeUl1guIWq50XKxNxgzvHL5oKxrCYNIZkiXY2
	8ta0L+0NadiJPhDIUsJq1WtHdeD5KgKqwnXkZXvy68DHcI963hQbc2WJZS+DCeY7zvA8oYbQXIO
	w/I+SVkgHeiUUBdUt5Is9gSK0tVfPBANr87Dd5a4R9lXPiDG0BpdwQ7yXtc2cAQpsTiAHOvaWdp
	GjpZRjYTWbh281yXaHNpH3BTvdN0Z4WNhJ+jAVJI4ZpWjAV6ex0GHtKbnfNI3+ErQF7G921+wsd
	9pqKB3Sk8Ph4i9M5T03Q0E0vxzuEaq0YuTs0bVZzdA4ixt+8ZqyMqFZYGXidIzr2WZQ1hx/PPEf
	DQttjyawXaO7rgtUMje7YqyuZ2/FqrLrmxKcIzQ49YfqkhhZfw5dYFKUrbMsLZALQGqFSAfukU3
	gxjJXQuO5
X-Received: by 2002:a05:7300:6027:b0:339:7204:9490 with SMTP id 5a478bee46e88-342730560eemr1313089eec.39.1790386024208;
        Fri, 25 Sep 2026 18:27:04 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341f2b18cbfsm6746171eec.30.2026.09.25.18.27.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 18:27:03 -0700 (PDT)
From: Shashank Mohan Jain <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] bitmap: bitmap_parselist(): reject trailing characters after group size
Date: Sat, 26 Sep 2026 06:56:48 +0530
Message-ID: <20260926012651.15524-4-jain.sm@gmail.com>
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
Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
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

