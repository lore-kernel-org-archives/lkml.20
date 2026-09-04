Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCDF3C8713
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520182; cv=none; b=I1NCZoc7HW8Dn4evdFyNNxqrDLuose0PdEtrHOV+3K4a57rk/BrKC2DCqjAy5vouPKqdESq2DHMxUlvyxvM1u06joG/3HHclnUe9J7hU0RLJPhEMg9/aiR0WCG+rjp9OfKBdOzNKrsyvvjTXN4tlNkGQ6al4WHOBQT1VfZndwtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520182; c=relaxed/simple;
	bh=pD50IpDM6oUlv7PhGRLfiZmyvzM+0wgOcf4GFWOWDIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrLpm7Sa/FWyBVxuH1AaSL2WizUvceJ0DbZy++LKX8D53vGUtlS8y1oV5k+HUYB3hi6j/LA9cJkyJ2hSUWdKrPIbhTiGrZGxU3btb+5bSaZXoOgZLLi9w78vdOH6JTw6AZm76id5u+0kRKu+XSpHFWKpaDpClRBWAGI5pSwyr9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VfqUetOi; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VfqUetOi"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so6764015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788520179; x=1789124979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ki2uY5HH1xBVrF/a/0tYT5BFfIO/Ax3PPP4bnlMH8iE=;
        b=VfqUetOi1Y8d8XETxA+zpkTeyj4f8K500oO5Si3cIvWhvoSSZ29n1BHjsdvpywqvlg
         cka10/3SJyCsEGd51Y58lL3lNkj+WhwmtsgfWCt+o5FhXBO9guKtftr7vaqW6b1rfZ+3
         fBu7eHh/9EOjIp7pu2N307/5z4cp2UitE76gST6mhSd51KbKJNQTP9Ltwxsz9+6RZPsA
         zg7P7WlLg9EEBvkmobCIE6Z73Zdbh7OrN1fTLGxOti9igeLnSKIUtMSGgfTZS5PBfB5l
         3LhTKsY3odeW1yYNwgUyfNUwcbjpfohYzlCYWIhniGq3EQbdMuAwa9jOuZcdXLTlo1Me
         dVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520179; x=1789124979;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ki2uY5HH1xBVrF/a/0tYT5BFfIO/Ax3PPP4bnlMH8iE=;
        b=ZEdOeEpVNV2wN4x2S87wgXWpVHB47qVQtECOSHd01aOAjeMNjtbTgimi6W7LTL49C0
         usFsogABDlJ3rquVssYybP5EuJ1rqLpI5AKwh8oH6AOjIp9vQldOIDt3w5he5rZmxgxr
         e2xN7QnzQDenLTKuCF3IPf9i5E6kntWmGOXRDFkluquvaLsCTNLLGQX062MhyoZ/7TXf
         8vRxMBUnsvl36kC148/9O1/oUpIACrruTXJQkcrt18hwtGWsd0wbxgR+79ZwxE+3egG7
         oVD19aT+VpTnmtBG7uJFYR8jaQcL8Ljn9M6wiwjsd/Flp0vn1MCJYjL3zx//sW1PMJeJ
         8hUQ==
X-Forwarded-Encrypted: i=1; AKwUvBwN48hD/ULeA0vd9m7c9K5LsAUJgaNcI0lMc3nYzwth28ZE4CKs4Y5umCMmFgTqfRTN9gTbLhH/YF5cd+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++lFpSrpCqSdR/jRE9d8A4TfSqBDIf/mYUg6GqZIM21BmUwtARNy
	rHqFfl2lg5SdHfxRHuHMWuMhTJnYXwWe1ycz7VIxpSSNDWrsTqt81RCZ4uAt+YSMoMNg95SmO+e
	jRxQ1O54=
X-Gm-Gg: AYBFou240bGmStfuHE17I1V4MnRhnLtB5jsN/XBcfJn8yqVeBu2phoH0rAWh68fAQbd
	MQLkRLjo+pSLzwg7Bq59RMbq3zBWGcEw9e5OBlT6EPzoC9si1f8T8vBR+YNKkNsOprxXMc1zwdz
	5Cu9GiS8LLqivTmLJ/j70rTo3aDcP8ar2L47fNHIDy6IOGsIrkp7D9lIq6kabipqjL0xHTdRhuE
	HGje1vjT2e54hxkcZDiv9J3W078J/hc0tXISN+wcKI7a2lgfCsX0Y7KgJlW6dfI/RmdTf0fAjBp
	TA+OfalJYQ32OTTPbDvYkP0w2st1jq1iTbXCZaReRghAkFdGEgOWCe3N5zYTiO2uvaKYcwPVOBu
	ZvaTwtVpI5/riyVd/G1xD0N9eBtpNQPjlx3jWog4zA22Aw7Bq6TPk8wgTCZSZnzV3NIn5qNmo0s
	A+8txOconBxQ0Z6HcCSA378+qJDatoZtBJr0zxeFSsg/AkWwsbbquwrAaIYYsMZ9VwdIgUT5xnS
	nQrXJNUg88g
X-Received: by 2002:a05:600c:4e0e:b0:499:bf8c:cfd1 with SMTP id 5b1f17b1804b1-49cf81e6063mr58835095e9.2.1788520178806;
        Fri, 04 Sep 2026 04:09:38 -0700 (PDT)
Received: from localhost (109-81-91-122.rct.o2.cz. [109.81.91.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm157781205e9.14.2026.09.04.04.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:09:38 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:09:35 +0200
From: Michal Hocko <mhocko@suse.com>
To: Ye Liu <ye.liu@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Ye Liu <liuye@kylinos.cn>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] lib: convert process iterator to for_each_process_rcu
Message-ID: <apqm76keXb6VebfV@tiehlicka>
References: <20260904083001.553587-1-ye.liu@linux.dev>
 <20260904083001.553587-8-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904083001.553587-8-ye.liu@linux.dev>

On Fri 04-09-26 16:29:59, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
> 
> Replace the manual rcu_read_lock()/rcu_read_unlock() pair combined
> with for_each_process() loop in lib/ with for_each_process_rcu().
> 
> No functional change.
> 
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---
>  lib/is_single_threaded.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/lib/is_single_threaded.c b/lib/is_single_threaded.c
> index 8c98b20bfc41..0682dc87bcdf 100644
> --- a/lib/is_single_threaded.c
> +++ b/lib/is_single_threaded.c
> @@ -26,8 +26,7 @@ bool current_is_single_threaded(void)
>  		return true;
>  
>  	ret = false;
> -	rcu_read_lock();
> -	for_each_process(p) {
> +	for_each_process_rcu(p) {
>  		if (unlikely(p->flags & PF_KTHREAD))
>  			continue;
>  		if (unlikely(p == task->group_leader))
> @@ -48,7 +47,5 @@ bool current_is_single_threaded(void)
>  	}
>  	ret = true;
>  found:
> -	rcu_read_unlock();
> -
>  	return ret;

This can be slightly simplified as below. Anyway
Acked-by: Michal Hocko <mhocko@suse.com>
--- 
diff --git a/lib/is_single_threaded.c b/lib/is_single_threaded.c
index 8c98b20bfc41..4f7620481066 100644
--- a/lib/is_single_threaded.c
+++ b/lib/is_single_threaded.c
@@ -17,7 +17,6 @@ bool current_is_single_threaded(void)
 	struct task_struct *task = current;
 	struct mm_struct *mm = task->mm;
 	struct task_struct *p, *t;
-	bool ret;
 
 	if (atomic_read(&task->signal->live) != 1)
 		return false;
@@ -25,9 +24,7 @@ bool current_is_single_threaded(void)
 	if (atomic_read(&mm->mm_users) == 1)
 		return true;
 
-	ret = false;
-	rcu_read_lock();
-	for_each_process(p) {
+	for_each_process_rcu(p) {
 		if (unlikely(p->flags & PF_KTHREAD))
 			continue;
 		if (unlikely(p == task->group_leader))
@@ -35,7 +32,7 @@ bool current_is_single_threaded(void)
 
 		for_each_thread(p, t) {
 			if (unlikely(t->mm == mm))
-				goto found;
+				return false
 			if (likely(t->mm))
 				break;
 			/*
@@ -46,9 +43,5 @@ bool current_is_single_threaded(void)
 			smp_rmb();
 		}
 	}
-	ret = true;
-found:
-	rcu_read_unlock();
-
-	return ret;
+	return true;
 }
-- 
Michal Hocko
SUSE Labs
