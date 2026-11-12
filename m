Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503518;
	b=SQPGLqYl3TzF0pTqk92myhmFwgr8KF2BNLfIliLy8AXGcITslg8oMZXTjIBSsApXpBH/
	 tKypJFq9k5TKkjtvNzmhT+pBjcljkagVE/2CTg2fcmHK0Cg7L0u6C/b5rdsjpQcm4Ylpi
	 tXceKyHLl4qsJV0ApJ7SxMPfJ8x9rEbTPzl+aV9UemNpGObLGsvhiSJlcYwLkse2UCbid
	 90GrEl7TPzSNnRTI3jpbzq+g07aTmZjiVQ+v72tfznEUnyZ3uuOh3ZvIPriXSSU9tKJDd
	 GK2ZbXeHSdQP0GJCKiaSq78f7oFniFQbJ9sAQf/VfzeGKrJypvWsNVx0Sp0FWOejypQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503518;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3KCRPd7UwqaiMFRIx4N7MG3QRVArn5qzACfVK+4/t80=;
	b=wnuZSaO3YrTfdbY1GFuJq2wG4qsWhFPPd+5nnVI6C1OHMQ840D8G3f9eaVhs7pRN8R9q
	 5wK3RHF7JsBIErppLJpA4FrjUOW9HJ6Kh8vtnfx/A6nNBEiHWPTTQSU/W45vdvZs7NRL6
	 2ee5tvYH6eOhTP0BiCZOKk/q7WROOSSP6WEP50GAFWnBYu88GwLXNPgZZ7FW7pLfOEovd
	 UvuE55nrB+FPrYATIOFFwWT9LWTzXNTeIhos2M+406jStJOnjnGFqrAsmYGMSTWzAX3zA
	 cu8wIPzhS3MoaxaGZcZV2s+AYGjcEwguOZdl5MY+Jw0Rk2uom44DLKohqQizNfJoTKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b="OsX/Wv9U";
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5359F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5359F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=OsX/Wv9U
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b30cbfa628so1293397b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1794503516; x=1795108316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KCRPd7UwqaiMFRIx4N7MG3QRVArn5qzACfVK+4/t80=;
        b=OsX/Wv9UMQobNjPA06ctArQA+nB3PW1FkFuXJ7cxLoUpu2z7Eg5Uzld57YMYDBVMX0
         XCTCX4jcd9s9D+kpVL94A6UlfWJJ8C8xvA6j+5jyNiOEZqBrNjWhmUcAaCS5syRA3xUn
         gFpqdGFUqd4oQTk81ZURRnCiP3TPzrMDK3qMohmm53cW8I5Cb6m9lANezSO8GlUVTejt
         muzY0bTwLmvmJf6bNbc0VO1g8uJHLa2yfYH6MNPKpLguFucSHMb5e11CHiF4CD7AQ1oB
         M/V2aJRdpraqtlzQeT7TI4gPJgsFH0cV6fsivjWFg/d+q9o+bH8IeqpeU54VEPvWKTTB
         HmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794503516; x=1795108316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3KCRPd7UwqaiMFRIx4N7MG3QRVArn5qzACfVK+4/t80=;
        b=dqTz+eIbFMU1t/P1Y3tjMOYALX8eG9qSRXNy/VS5FTHcOSwT3XEeq/gowA3+pHxp93
         2f4SfzBsQAacO4oJFRDHRENDRHzy53ToOV/DbvZUO9ak+A0nedAv0pMaLlwtopIrxZng
         EN7TU72w+/ORfl+v6PDJ7w8qECau9ipvq7KcnunNTDosGPYwlJASY3mU3/9kTBD4UEua
         iQnUUHAGziQJoR3q3RM8TGcfHPn5XeBGujpbqvkp4i9gmApYKhf4PY9E2hdY6hKf9i8J
         2FXVGiYzwpKA91x1P6nkI3lg7XcH7weK+nxm3+0OlCCuuWGTFKygkTiUZL6opSzH+En+
         FRpg==
X-Forwarded-Encrypted: i=1; AL+hErG1WKM2gymAbazQIz9uUE146zwRBpqlM6ZWnkXY0DX6MXC5MvR8BHugtQkmGfyZB67S3h26ZqRaKZvX7eA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O/GlzYF5dmFljHfBzfnPp/POiRUNu+l1sUn12klg/VnLyqbSY
	7CiNA0kwtJO4QSGHQ2YVL75kUYJ2ezHCBljypxPTq1MLI48W3WFQbbezkBQNGysVlXg=
X-Gm-Gg: AYBFou1Xj756CmbvJPwnzZE7jELd9znkn4TyTSFFKoCxR9pLoJ9svX1bmPkHe/4TL/4
	5bgMZjwh1o/A0Z1d6ivPyXNTfwDKYkQcGC99mYgXYGHLLUO+EDseAdLsw+8p9RGJH0n4CpeV/Fi
	LFHYsU8DnaxXHEUcnAOs9hJ9kSQqoD1Tk1iN/0Q83niGS4WdwtKKqfeb02BVDirt4GIrpiDfqab
	KVzJkyhI7Ezn34yhtQZ7K5PwZMzi4zTyrlLeFx5jRB3ZtC8XTAinhMOoeC2IwIKtv9iDv/kHiSt
	WuOhDBhroGD70zbouxqJBGHvY3ONkzcDW7ieyamT9nrtwnnhJV8R5jveYId0YtVNyeSagRQvtjX
	9EHUFvIB9YIx1WsjbbDdMJzMQ6fCvoDPfTjoSfUDpjwgiPMQEaSatTJCSnL8DqL15MCmHiA2t3n
	J75kWsSjDMZycqvsfYmXlhOq+jLPjyDhfI0WF5nXUSQeYUzlpRhTQOzthifrIhi7dxew1UBnaXa
	yqjT3MyZ5BWAi23f0Jd+0DdvUEcjADXSPTzdvsQ+uQeFa5v5BTN+B4YV+p2loDfTuNUVqoYtdva
	dn0Hm098pwwDk6djbVReYdAuZdX+
X-Received: by 2002:a05:690c:e1d2:20b0:882:b4b2:c49 with SMTP id 00721157ae682-8b4aa23f086mr1270387b3.18.1794503516202;
        Thu, 12 Nov 2026 09:11:56 -0800 (PST)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9fae24sm252827b3.41.2026.11.12.09.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 09:11:50 -0800 (PST)
Date: Thu, 12 Nov 2026 12:11:47 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>, Tejun Heo <tj@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Zhan Xusheng <zhanxusheng1024@gmail.com>, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v2] mm: memcontrol: Don't lose track of exiting OOM
 victims
Message-ID: <avXzU0coRUkBdPWC@cmpxchg.org>
References: <avA1wXhTMs9eY2NF@chrisdown.name>
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
In-Reply-To: <avA1wXhTMs9eY2NF@chrisdown.name>

On Sun, Nov 08, 2026 at 12:41:37AM -0800, Chris Down wrote:
> When oom_evaluate_task() comes across a victim we've already killed, it
> backs off until the victim's mm has MMF_OOM_SKIP. This gives the victim
> a chance to free some memory before we kill anything else. However,
> since commit a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup"),
> css_task_iter skips exiting tasks once signal->live reaches zero. That
> happens before exit_mm(), so a single-threaded victim can disappear
> from the memcg scan while it still has all its memory.
> 
> This can kill another process when the first kill would have been
> enough to recover, and we've seen it happen in production. If the
> second victim is in a cgroup with memory.oom.group enabled, the extra
> kill can take down the whole workload.
> 
> In tests I used a 64 MiB memcg with swap disabled. I started a process
> that faults in 44 MiB of anonymous memory, submits a 4 KiB direct AIO
> read to null_blk, and goes to sleep. I set null_blk to take 10 seconds
> to complete the read so the victim would have to wait for it in
> exit_aio(). Two seconds after starting the first process, I started a
> second one that tries to fault in 40 MiB.
> 
> The 40 MiB allocation hits memory.max partway through and triggers an
> OOM kill. The OOM killer picks the first process, which has more
> resident memory. With the read still pending, the victim blocks in
> exit_aio() before it can tear down its address space.
> 
> memory.events showed oom_kill 2 in three runs. In one of them the first
> process hadn't submitted the read yet when it was killed. The slow read
> just makes the window easier to hit.
> 
> The cgroup iterator hides these tasks so that cgroup.procs doesn't
> show processes that waitpid() may already have reaped. That's fine for
> cgroup.procs, but the OOM scan needs to see a victim even after its last
> thread has started exiting. We already have CSS_TASK_ITER_WITH_DEAD
> for sched_ext, so use it for mem_cgroup_scan_tasks() as well.
> 
> With this applied, OOM selection backs off while the first victim still
> has memory to free. The 40 MiB allocation completes and memory.events
> shows oom_kill 1 in three test runs.
> 
> Fixes: a72f73c4dd9b ("cgroup: Don't expose dead tasks in cgroup")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
