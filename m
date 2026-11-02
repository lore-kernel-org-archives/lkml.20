Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614368;
	b=PJVcmFiadgHeuMZDEunoN0wnCBoYBL/4LVBIzvgeKYoc8HUO7ZSR6RY1FB48by6hPGsq
	 +b7Ibv3cqFwFM+40RyMhv2d6/FWca0ql78CX0cY1QUG7DIWM/vljWPy/C9UqmNCzoSlM7
	 dij/jYKd9AVe/3KFjcyYEIkKrnW67PRFSsu5K/1zesvB2iZVWzX11TJYRI0ZbUItJTnh7
	 KgdWgHM3YcIMPgdJV8MZhgGXHzvprZAED/3L/V/VrT4z8HDdn5nT8Exfba4k0A/4J5PaK
	 HERWYG6Qg347LEPzwo7x4XSn3WDBwo5kMCDNy2mhB6qHzNahZcmoCLF9Gp4Y+PzNk9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=zhAJG7RoUXOoz7M+qXiobMg1MbFShww69uh/kTjgH68=;
	b=APmENAx6il6ylARg4FImhzY4iY6m/+xy8DKkuQIzv2JSSDZo6735FDZcox5o+/o06taA
	 JEPI3sQvkb35AtuyJQ/52B0nwRZ9tPk9lTzIRU2lzmLCJfmo+QiVANlTkFg46/AayI3Os
	 cneaqMla+9/RCC/O1l5Em/aetadgCxFK6j0YRB5kRUIDmbske1AoXF0qohFBqF2VXNrMN
	 Ow+GguG6nyIfA3aLVdJXs+TRVS9Q5XOC4HiiwqIyCenj+PL0tX5iGAb1hwS+++8cSj5K3
	 mLmyZP96vZln0qV62u8HMYNNvGojbRqJntXpvtyh/XjfHWaelgyBIqSKXhELqv5AuTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VmuCN7+4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B08606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:12:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87B08606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=VmuCN7+4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so25923595e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793614366; x=1794219166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zhAJG7RoUXOoz7M+qXiobMg1MbFShww69uh/kTjgH68=;
        b=VmuCN7+4AZROpo0l32qa7fIa38GzCV9C5RE7VWKIVqzBzIm8UL5G2FotGfej9c1OcM
         d+100dYvuuHHZ0DjCCpo9jjJ2fVhZzrXeM4uIDsoYltVvF9/YOv3EYWquqtbS5eJqSwf
         4dv4PJB4Xr1nR6H4EBRh9oQzkDrntLwyEKVPhMGGLx8ydJK9mxEIeRSbishj8frkFwWP
         k5J5B3xN93hnv5gX1ouoySBr3tjvb5zuCkTRlySP9nv6oRR79H5I+cyM5FoRwlU2yY4w
         rt65w5HFcdZi3Sp7dCrV+bT6avv1cp1nXwNTOgr71kCtFEzB4pSYcFq7AO47cM9DxB+i
         SqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614366; x=1794219166;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zhAJG7RoUXOoz7M+qXiobMg1MbFShww69uh/kTjgH68=;
        b=mtsx/xgvRijxJpk/I1UT/ZCTRq+xAgJte/P+RkcasTXBEJe9D9bJQRqfJXaS4Pjdhl
         RXbtrCIeAYnk9Wj3exgDwI1tnJVt337A+Ypirz+FSZhktL6OS/ixOjyl9X5XHSWGHxZb
         fHslyh9rfv+kjryplc5/oAEEEjqxgvZXPgO0lJKFAawCxBizldMasb7AjagJ2AmHmylh
         ViP/4qDJLcF6oRcYo9RTl6fs066ZoEaowQ506wj/+cIsesAwrmg557lQPfCEAG3nhl8a
         aZZ7Bw4Tsh4fsYVhdXQF+tLWNXss3FyRZYlmomwEdq1vSQWm2HBnzKz0RWx3dBxkC2cs
         HoWA==
X-Forwarded-Encrypted: i=1; AKwUvBwafIWpzXcoNNReqVy8IpiJ1o3cSsl+LjCFa4FvKeioPPYzU5uWZJfCxn8Ar9L+vCSgZmoSP7+8YlXimeE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJibWmQl7Pz4h2DGXRYyJOix+xUS2jpL4xSihksWHLwntKvSbnG
	wQmr+Sn3/1sTUX0CzPLolOZuXdqQrHFyRGMz9Wn+KS6XlbWVOWJXZ2iaRrJT8vTXWtI=
X-Gm-Gg: AYBFou1R4JreO9jpt2QCGDjzQwyzUPblioB6rTTuWAsJN9mpDhC/hBme6D3eyLZMIGr
	jWfTTdfReYJE2PKjnLYpmnJ9zf7YFOaGnMCRVZfTF0NbFWNE/czqV2SMl2/l875vlnrY6YsGWVt
	Vk34tmMQrbySfw1zrzLcZ71faZ4WOkSyWIGcp66hoWggBVzmY/jUv6IU52kojDhNGw21fVPDOdc
	3/1OiKJbSnjOj4DKtvALMV3WSV6zw6zIPkHb0bGBBNoitRf/Np1qImed410K1aSIg8T0PK5Y7KT
	WyELbXmZkvXz+3BfWtwQsO1JJxaMUHpeYSewsvzvcjQWko7/18u6o/R8Mj7kziAruk4OL5dSgJL
	sb02W2Dgqf5TTAMjN+c4QmVE1qqALtrsAOnN4u8GZq8RGk1ILu6KL2wSQtw+NbuS/kYYANsTrw2
	+x3vBmhuqPSuyT6ssfH1GX4TAz5OhLhKtNCoQmWERYFPpz4154U4FbBX1+TKnF0AfHsE/+9ZKty
	srKdximBACBMlkAsPAA/M9RU2Q5jgd46Ujkuw6CkIkx6agrQ0DtYEX3fI5lqCgL8hkpCeJLhdKB
	QdqPcwMl1JTHO3g3FJlJDbVIjkLcJeqsVtuN8lQ=
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr217205325e9.34.1793614365911;
        Mon, 02 Nov 2026 02:12:45 -0800 (PST)
Received: from localhost (109-81-32-81.rct.o2.cz. [109.81.32.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b9a3b1sm20935867f8f.44.2026.11.02.02.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:12:45 -0800 (PST)
Date: Mon, 2 Nov 2026 11:12:42 +0100
From: Michal Hocko <mhocko@suse.com>
To: Zhan Xusheng <zhanxusheng1024@gmail.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev,
	penguin-kernel@i-love.sakura.ne.jp, tj@kernel.org, mkoutny@suse.com,
	cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, zhanxusheng@xiaomi.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm: memcontrol: don't miss processes whose leader has
 exited in OOM scans
Message-ID: <auhiGqKJeukk7t3P@tiehlicka>
References: <20261026120248.2188024-1-zhanxusheng1024@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026120248.2188024-1-zhanxusheng1024@gmail.com>

On Mon 26-10-26 20:02:48, Zhan Xusheng wrote:
> From: Zhan Xusheng <zhanxusheng@xiaomi.com>
> 
> mem_cgroup_scan_tasks() walks with CSS_TASK_ITER_PROCS, so it sees only
> thread group leaders, plus a dying leader that still has live threads.
> Moving a process whose leader has exited, by writing its PID to
> cgroup.procs, moves the live threads but leaves the leader behind, as
> cgroup_migrate_add_task() skips exiting tasks.

Is this a desirable/intended behavior? Shouldn't we move the dead leader
along with the rest?

> The destination's OOM killer then cannot see the process.  If it is
> alone there, every attempt ends with "Out of memory and no killable
> processes..." and the charge is retried indefinitely, and
> memory.oom.group kills nothing; otherwise another process is killed in
> its place.  The source's OOM killer still finds the leader, reaches the
> moved threads' mm through find_lock_task_mm(), and kills a process that
> has left the memcg.

While you patch works around this seems like something to address in the
cgroup core. Should CSS_TASK_ITER_PROCS iteration see all processes
regardless leader being alive after or prior the migration? AFAIU the
thread group belongs to the new cgroup in both cases.

> 
> @@ -1452,9 +1482,10 @@ void mem_cgroup_scan_tasks(struct mem_cgroup *memcg,
>  		struct css_task_iter it;
>  		struct task_struct *task;
>  
> -		css_task_iter_start(&iter->css, CSS_TASK_ITER_PROCS, &it);
> +		css_task_iter_start(&iter->css, 0, &it);

Shouldn't this be CSS_TASK_ITER_THREADED instead of 0?

>  		while (!ret && (task = css_task_iter_next(&it))) {
> -			ret = fn(task, arg);
> +			if (!mem_cgroup_scan_skip(task))
> +				ret = fn(task, arg);
>  			/* Avoid potential softlockup warning */
>  			cond_resched();
>  		}
> 
> base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
> -- 
> 2.43.0

-- 
Michal Hocko
SUSE Labs
