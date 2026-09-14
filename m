Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FF547F3BF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398123; cv=none; b=Nr0lanTfWWxUqHfjl7V5e45Qxjt6y6uHTRdg6AVQXqdPaGwsdLiI8Obdtf65B/MOM4BvyzpmSAMZudYv/SG+aWO5Q3sDOPkdDRe5541tBoRZ2BJ7rRCK5IyRVfD9MQkaxrAA5qDPVY2YQ0N3tG3mRqkVkDaykEjOhJLXTUkDYSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398123; c=relaxed/simple;
	bh=+nX5Ss/JCqlucqt2lHr16phOts4ObE89IJZ0PKgOvM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rpe/NTXJvSVyanpXvm4SeR367ULMEcE521vgRK7HInq1ygaNfpCy+AA7vxxLm5xzvOys7Verl29UJ5OB7/mZcgKi0oBlDs8OJeN+jklros5WJgrSp04BjXkm978oNOLUXRa9a7WEYYaSpT428+XqnZGK/hBa9ROYHd78QdU0OWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=plfhS6sZ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="plfhS6sZ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2999018a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789398119; x=1790002919; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8ygL8wnvNbDDwp9bVOKE2bOGvJgUY1pPihHcbtZmW0=;
        b=plfhS6sZm0jdRysEEaIHNteW91sbS/0Ri0N9RXYFSWD2esesZvPFkSUio3h7nZJmTT
         CcZ2bQ6FqfoLtW3yAwvQKGi7uP8rlPR6ExCUR5cyy3VUdiK42IaF12Urh9s3JDMjrxwI
         OaWn3+1o2ybpBeWbjiogiw6dT65d9Qiy7745BbY5FIwL4nT426PULEwoa+zLjiLNib2j
         q8KxnyRWkcm2Afi24ZlAK5p7csoaRTVjYavMHN+Uqg2JX90RQfRhHPdYZDU2xUzOzaXv
         vKct35HwIfRlpW6jNhyKD4EY/SykUN1Z6VHhQi0KtDG0fsEmhi1+jreyBxrn/dNk5tG9
         XoXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789398119; x=1790002919;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T8ygL8wnvNbDDwp9bVOKE2bOGvJgUY1pPihHcbtZmW0=;
        b=ZyKxjGbhVdMrfIM74PrSU+VtpGikXIit9vrVYi0fK7toWI8N2KTRJX4Cfdw51i11Z8
         xFeeOX+KOSsrfH7RtiacTLf5S1e81u5ccijB0ormh8m0gE0pkGTNYpPcRcc7r0tYiFNo
         v+MTKdzSaMVyCG7tu0Gr+D8qQ3HfBHUczDKEHrZUe0rwBaqujfq9Fn/27tYX+btXTzOK
         mOrBiUYOAkb5PSc2HJSgHS7SbnVXJ8m7+UnhIk8uncnNZpdpKtFM0m2Th490pAvKqTzw
         y4BKWo2gpHzc3aK2YUrIgJ/vDo42otOEFcOt1ztjsbWR+FNBf+fsYvvOqYOabk7hRvoz
         yz8A==
X-Forwarded-Encrypted: i=1; AKwUvBwTf5UDigr1jb790aN3cx88M94387an6evgNLiTN9KMtOpm8AAHgMbiRo6UlKptBzg3XK052Jx9cCrC3lA=@vger.kernel.org
X-Gm-Message-State: AFuF++nTrQZ2RE4zZFOgKIdNTjEpSzHdGjoEboFlESv3dJQJqRtorZh3
	KMXfyLOvb3ozis9GofDZbeETW/IreXMzbihUT0Sq/lueaKzZf/tQ76B5yq4YaCmD
X-Gm-Gg: AYBFou2dfsesvIy/lFo6GG0hA+n5srCFEuvFN5D9lVsDfQ/zovzaV0/voljHHAjsYTQ
	X0wx7M4EuDrbG3Qm/K9MQOK6sSAE+CBtAkk9YduGhaOfQUDzAvOwQlFKEJhM48FOCsXNANv9ONA
	cgpFVwxkbonxh/HYt3EGV/1lKafgjsS5pGAzMJnplD9yUaJ9eTRtgMLudm3RFSbgT8BIXr1ZU9y
	ViWFatI4qvrYw8owiWz6EvIop0YYuOJyUbG9elZBpNXXhQ7De75KsjYoOe/OpjB4w0tNBp/JF8C
	t+iSP/PFpUBcaPl1Itg/RcNffpPC6m0Rr5lF2Z7yBirYW2M59qHxxAXXv5CRiIK/CRHk2XH66Do
	CtP9n15gc8Q6C5avm2f8w+zJAm0DQT8XgAsCILiCmiKmk8YlTwfKKS6Wp6wIvIiLFJG9YXjOrkz
	iQkc1CyxhL8ewzEAjU1CLQT67Eek5z1Zh2d/Q8bx3zAXzwHgCZfrStsPJQuEUfBQu+6JrWpLY=
X-Received: by 2002:a17:90a:6d90:b0:39d:ecb6:8d40 with SMTP id 98e67ed59e1d1-39decb68d5amr4014856a91.4.1789398118233;
        Mon, 14 Sep 2026 08:01:58 -0700 (PDT)
Received: from gmail.com ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfd8c84sm50939035ad.62.2026.09.14.08.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:01:57 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Kunwu Chan <kunwu.chan@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH 4/9] mm/damon/core: use damos_quota_is_set() in damos_adjust_quota()
Date: Mon, 14 Sep 2026 23:01:48 +0800
Message-ID: <20260914150150.1507525-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912200814.145612-5-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 12 Sep 2026 13:08:05 -0700 SJ Park <sj@kernel.org> wrote:

> damos_adjust_quota() is manually checking if the user set the DAMOS
> quota.  There is a dedicated helper, damos_quota_is_set(), for the
> purpose.  Use the helper.
> 
> Signed-off-by: SJ Park <sj@kernel.org>
> ---
>  mm/damon/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/damon/core.c b/mm/damon/core.c
> index cf10f6d725c19..dd27068cb83e3 100644
> --- a/mm/damon/core.c
> +++ b/mm/damon/core.c
> @@ -3344,7 +3344,7 @@ static void damos_adjust_quota(struct damon_ctx *c, struct damos *s)
>  	unsigned long cumulated_sz, cached_esz;
>  	unsigned int score, max_score = 0;
>  
> -	if (!quota->ms && !quota->sz && list_empty(&quota->goals))
> +	if (!damos_quota_is_set(quota))

Hi SJ,
This is more than a cleanup, because damos_quota_is_set() also checks
quota->esz, which the original condition did not.

The path that makes this matter: damos_commit_quota() copies ms and sz
from sysfs but not esz.  So if a scheme runs with a non-zero ms, then
the user sets ms=0 and commits, the running scheme gets ms=0 while esz
keeps its old value.

The old check would then return early, leaving esz stale.  That stale
esz is visible to damos_valid_target() and damos_quota_is_full(),
which also use damos_quota_is_set().

With the helper, damos_adjust_quota() proceeds into
damos_set_effective_quota(), where the first branch resets esz from sz
when ms and goals are unset.

The code change is correct, but worth noting the behavioral change in
the commit message.

Thanks,
Kunwu

>  		return;
>  
>  	/* First charge window */
> -- 
> 2.47.3
> 

Sent using hkml (https://github.com/sjp38/hackermail)
