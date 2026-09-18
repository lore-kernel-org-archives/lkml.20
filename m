Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AD14EF132
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 13:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789737213; cv=none; b=aybNKfstEkdLkhHzNngZeATQ824xh6r7QeOWoJGUpEdSRdY/fWDy2De/h/1ikRZ6HTZnCS3cqdEljaV3OmzExeorTOVCrhuavbk15kmZmLNvT2mUc3OsixZRL4YrRp2l3PrX7N2LLTkZncgjWhtYfmMu7AMvj13F35tIue0wOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789737213; c=relaxed/simple;
	bh=1QC+jwsNR5PAa1skLhSCnS7G4xuOoA/KikoCWPXFG+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NYm/i6M5QltIF3pmY718Crz3L3pw053oyAIvMW7yUsZNDerDpfx9zLU95ntFJ74jyMYpFGLSrco/3gChndbgIeBOmGwWQvdhn58hkRggwzAtk9v/pwfTZRwoMCifDUQ9r0UjWUqVbI0RRmGBZkqv7FlTKvZA2voXnkcTRSl0KO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aVYbKj31; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aVYbKj31"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so698275a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737212; x=1790342012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QqKItCu17DpUKMJJO4kJKCuEQNfwXM7mJRhT2VHmkuE=;
        b=aVYbKj31iQU33K8J/L22YuLtsU4oTgtD7gC/2vpDF/KoE3q9ehQ6bqNwUblVZXQbqD
         ZhObBmg0nW5vm+TuC+u/ap5NJ0Y71+rwJVBfS0/1Eo/E5UZR1zZ369xn3WYbCJlqA8we
         AMkL9ILMCXwM5f+3ssoEBPR1oasg5SDGDlI7ldAH9f0fTORFRyHKFIY4EkU/IRFS9Zua
         5tB7Jr5gOtJS1KiJRfwAQFkDZkVX7+lhJJ21bkESk5sNZyTVv+dNPk2daE6RT8eyqdje
         lt+GG1e//qLLwN3LJHxyKs71m5wg7jQVwR/YCZjbBdd5O8VTqs+QGoP4ts1mrFNigpm1
         oVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737212; x=1790342012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QqKItCu17DpUKMJJO4kJKCuEQNfwXM7mJRhT2VHmkuE=;
        b=wEAF1SEp+O1xYhRj59/OFcu6mLFbYATJZDVjlbusH5U7zrULUetlj/WEW9R7ZjmYSh
         y5j4u36dEXx86NI8ewRh1jS/qT/7OPGXMkANOxWhr+o1bPyOokNDOx7k+f5B6kx9LFBb
         8pi3DeRQjqVymO23su2dwYwfLEuxscre/8ADGhjGJ+XAWpzFUe5yhnfxLjLAk6aw5bx6
         yTjChNKFmcgoF+rqgY62WlK2GO2ThC9pi02A192SJWjOcJkP7DXtxmo7AaXMvRncBk/t
         HnKZof7mVJv/ZDI2Wkc0MEEMJ0s9xdsuActYVqt4FQappV4ZG0rpdqQHiMtcaBz7qhwf
         L3Xg==
X-Forwarded-Encrypted: i=1; AKwUvByTh4yV3m/7+GHhLwX513zxpaqFETk9ihkVPsWYRCLXfk5hvY8fKjRPbLfoBPAQ9ZkUDawOrKbsA+fTkzE=@vger.kernel.org
X-Gm-Message-State: AFuF++n18f5GZzszIEC1MyeflPex+0T32r8uCuC7pSId7tL3aBPangEq
	QUEB66WpZYlbUNXBKstUZNdXSuhzKPMPjc2tW0Tp58Djl5m28wv16sLW
X-Gm-Gg: AYBFou3BhqgHulmxe3699zIaZqmLGLEOq/lwKLjGsE7uRcAl/OHC5ow9c7yiLgWq3mK
	ZOQ+ngsSy4g/O6nqQFX8KeEBm/GfYIXf4fNW59FZl7VmNF0JU+5zV46E6LxGLx6A+n14mzccp3v
	j4qV9eXsDZQ+VKXR08FLtfQ/P4tJWRWF/GM/XcYlMr9+omyWQ9iEbEs94JOan/uuH9cWNd3/V7B
	mM//VAJQehGGLL7QY0ga+rItP6Hn9ADttsyXJpTfcQovu4yrB8dOba1sWagoPi4wtpoipF2L+8O
	xmjj6IAooaUe4iAHYDWnDhJfWGTPZDyk1M00fGdNfOd/3+r4FxgzG9Yh0iagR33H7kXn8ml1ska
	O7ZJINfwRsGsmWcr+vzsFRF5w8puGjHCigcvMzEe1K0xFnK9eXBeSJiLWtEyPIsGGWNmsI09mCp
	gVE/fnxu/kPGeyEBuEPx5TX6JGYYVW7E2msJ2PDEfDyJYMFdQg4lU0BLL2I931q5Xj2On4BAZXx
	Y54YVnUkCyQzekv61EtRFNpbTfhW5rudvH5YMScxdJOoXSsB2arnqAZcs2K7DP4bml/yTNq/UKO
	/uC9rILQ7HVwoQE6mUCqKO5OrxFJgk3VDJ/YxapA28siHr05deyn77uz
X-Received: by 2002:a17:90b:574e:b0:39e:1fb6:9659 with SMTP id 98e67ed59e1d1-39e54f0772fmr6160682a91.22.1789737211777;
        Fri, 18 Sep 2026 06:13:31 -0700 (PDT)
Received: from LAPTOP-97G9G880.domain.name ([106.222.202.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a50cd09sm3259882a91.7.2026.09.18.06.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:13:31 -0700 (PDT)
From: Karthikeyan KS <karthiproffesional@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Karthikeyan KS <karthiproffesional@gmail.com>
Subject: [PATCH v2] mm/damon: document that a zero sample_interval is accepted
Date: Fri, 18 Sep 2026 13:13:01 +0000
Message-ID: <20260918131301.75879-1-karthiproffesional@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918023859.13556-1-sj@kernel.org>
References: <20260918023859.13556-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

damon_set_attrs() accepts sample_interval == 0.  This was reported as
a bug in v1 of this patch (rejecting it in damon_set_attrs()).  A
similar patch was already declined for the same reason: a zero
interval is intentionally supported [1].

Document the behavior instead of changing it.

[1] https://lore.kernel.org/all/20260722094304.3132750-1-dayou5941@163.com/

Signed-off-by: Karthikeyan KS <karthiproffesional@gmail.com>
---

Hi SJ,

> I'd prefer adding a comment saying zero sampling interval is
> accepted.  I think damon_attr kernel-doc comment is a good place
> for adding that.

Adding comments instead of code changes.  Let me know if you'd
rather the wording live somewhere else, or be phrased differently.

Changes from v1:
- Dropped the damon_set_attrs() rejection and the KUnit cases that
  tested it.
- Added a kernel-doc note on struct damon_attrs's @sample_interval
  instead.

Thanks,
Karthikeyan KS

 include/linux/damon.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/damon.h b/include/linux/damon.h
index 0c8b7ddef9ab..1a7ef416ec46 100644
--- a/include/linux/damon.h
+++ b/include/linux/damon.h
@@ -787,7 +787,8 @@ struct damon_probe {
 /**
  * struct damon_attrs - Monitoring attributes for accuracy/overhead control.
  *
- * @sample_interval:		The time between access samplings.
+ * @sample_interval:		The time between access samplings.  Zero is
+ *				accepted.
  * @aggr_interval:		The time between monitor results aggregations.
  * @ops_update_interval:	The time between monitoring operations updates.
  * @intervals_goal:		Intervals auto-tuning goal.
-- 
2.34.1
