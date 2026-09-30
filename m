Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104614D954F
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775448; cv=none; b=Md4JNeKp8CxDB02XFXTc9J80j2ZNiUtYI8EV0ulCJ5YytEeqesdyyDHTWNO28LCqdoWvb1SfvGmjVIN3cu7ta2mSKe+9mjMOAQwIEasONtDt0y3KvyKpWdnxbwoQQu1FPBTmzVH5qZIFPUrjEYExCBt/zfnFMBLOwnu/WjSvE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775448; c=relaxed/simple;
	bh=mUvnr95vAy6T8WgPrmCM9BQJn1/bnppSyDaE2UG4Dgw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YBMbOsHrgosSC6gxweWsgKNE8X8kDU1vV5t+zGh9nY+qCj/p6uKTeBm8BNo8a8ygYsa3/5AdFEPl57ABu2lnNsBksq1YLNhP3h8zdBsce1d9PV8hHIJKVZZDhTjjFd4PbkcE1BJ3IwwNz4KdzVpxu/ngGCy8262/A7T2BMatCSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=haikyhUV; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="haikyhUV"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fe8beb8adso2388735e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775439; x=1791380239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cshqp6RE9jBzVD9g0ekw43SKrU3oD1vq+ZLuQw6vgg8=;
        b=haikyhUVH/OSZ8yB+71/vN39t9N0ZeLna85AHqYeFUFNm6v3i/Ok2jiuID0zFIj0iM
         V7zQj6ooeD4OTsRgpDoaPRG1MoFYiC/H5T4g7QLchGUFKEdu+b7lOtSPyoaQOWkeINwz
         cMg6R3MesyVjheydcQN+jZ1cpFrgM6fhhziXAvD1w6lV3cUX4ri64Q/DqaTNxGjdi5/i
         ZhiUhg8WsO4hzOZjCzVsxPboo4SNpsJj7FD6/IBUeeZhRACnPie9DS2H4jHgCHhc60Vx
         bUspJTZdTj1ctr6QUo7ZiL/9iECFAXG6prbi9+63Zgot+DVhtGRK0dN8566Qo34rBhu7
         H5xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775439; x=1791380239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cshqp6RE9jBzVD9g0ekw43SKrU3oD1vq+ZLuQw6vgg8=;
        b=MzUNPWHdWrX6JZ5wbI71RIQMPYT1AzZHW8xyBkVSW4hoVF5LyjfEZOEZ7t0liP1q6p
         YlpwEXQlqc0eTKjmZG95LgM4IYPjlfQrPkXpDuHmWM7igTXdvImFB2AdXznuCvxtLeck
         ISRIb+15erx2I5AtsXC6vMRdXoLUP+jrzpF8Cwr6+A8f6NjGtCe+zuz9XCaWOBG9focR
         FhQwPOTU/9zvbYJh1gfB3DOyuwpAncJTWHQyqQvow29omDqEIaTcOMMo53+E17Uvco4U
         0jkuyYDNCxXbTUavajRoCN/6svyM6cgB6Fifmj1N7DKtpsMFGCKkB8hD4EFH3Zx8SVzx
         otzg==
X-Forwarded-Encrypted: i=1; AKwUvBwlYs62XYisjiSSHYkeDhufvaFy2FEtw7Mi4bRBrX6fIDMeBllhSwezGUoYaxVXlYG7Jz4RfszVKCP1vCo=@vger.kernel.org
X-Gm-Message-State: AFuF++kMEb7xGw0I+paFPexGtWIlapze8OUkU1pYeYttKFq0Lmc8xc9K
	LtFuFL4v2e1iWi4/79KEi8kPLPY9sPffGI48DaJRP7yVn0yRoMTwWjzC
X-Gm-Gg: AYBFou2NsjPgcGGxBn6K/ese8d4UITBiHtSIqmysmzjz19VowRmM6hoYbSdCziDHojw
	LtA6eofrTZnJWRbi8XokfKnGfK90bXd3PctFjbFUaZJhkJLJkAe+yYwG8D6Hm58u/QnyJbg8rnA
	4icwmYtM0rDoNDLd5djC/DWdPV9oYV+XyQQq5PZLGgMgT/SxvouPE9VrNM1E9A2BEmLLqZvP9KU
	sidYMszxbNFsdO2qQSc4Bnuw8XTbLtGOHGbLu/mltJMRt4TN+cRn/ITBZTaGEWqfVYgl2lCsz0F
	E9B45H8WKkAHRCLfvWXJTblxF3hTBf1Cu92lwF8yygG1skam9xqDELJeYVH5RFzFM+yxPzruOjW
	ImiNFwtCwdNigHle5+/MnBA6y+o94OAJLn5MvaBjrvSZaYuU+FJMGomZ6pl9a3mdQuTk++7Ou8i
	jvpLQcYP9CR4ONeRCHGHVPRs0KLIwaJrOvWI+W8Vw+KNl66ukRXdjkEWdeEnKnv7GLuIBjuE0RY
	5+z7/l4hscuSbevtH98
X-Received: by 2002:a05:600c:e556:20b0:4a0:1c98:de52 with SMTP id 5b1f17b1804b1-4a01c98df5emr8353025e9.1.1790775438767;
        Wed, 30 Sep 2026 06:37:18 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e63f574sm185795e9.3.2026.09.30.06.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:37:18 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: dietmar.eggemann@arm.com,
	kayracizmeci@gmail.com,
	linux-kernel@vger.kernel.org,
	mingo@redhat.com,
	peterz@infradead.org,
	vincent.guittot@linaro.org
Subject: Re: [PATCH 2/2] sched/eevdf: Keep expired protection expired across reweighting
Date: Wed, 30 Sep 2026 16:37:15 +0300
Message-ID: <20260930133716.214471-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <78ce8f8ceb4f5c7fda14216d3dff9d74e17f55ac.1790756779.git.christian.loehle@arm.com>
References: <78ce8f8ceb4f5c7fda14216d3dff9d74e17f55ac.1790756779.git.christian.loehle@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

> reweight_eevdf() rescales live slice protection, but leaves an expired
> vprot unchanged when moving vruntime. A reweight can move vruntime behind
> the old vprot. For example, reducing the weight of an entity with positive
> lag can do so:
> 
>     before reweight:       vprot <= vruntime
>     after reweight:        vruntime < vprot
> 
> protect_slice() consequently becomes true again, even though no fresh
> protection was granted.

> This also happens from task_tick_fair() after a queued HRTICK has
> requested a reschedule. A four-task rt-app workload with 100 us, 1 ms,
> 10 ms and 100 ms requests can then repick current despite a runnable,
> eligible entity having an earlier deadline. The stale protection takes
> precedence in pick_eevdf(). Cgroup weight changes also expose this with
> HRTICK disabled.

> Separating vprot from vlag allowed the expired absolute boundary to survive
> the lag update and rescaling. Previously, those writes to vlag overwrote
> the shared storage. Commit ff38424030f9 ("sched/eevdf: Update se->vprot in
> reweight_entity()") subsequently handled live protection, but left the
> expired case unchanged.

> Keep an expired current entity's protection at its new vruntime:
> 
>     after reweight:        vprot = vruntime
> 
> This keeps protect_slice() false. Retain the existing rescaling for
> protection that was still live and leave non-current entities alone.
> 
> Fixes: 80390ead2080 ("sched/fair: Separate se->vlag from se->vprot")
> Signed-off-by: Christian Loehle <christian.loehle@arm.com>
> ---
>  kernel/sched/fair.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 868c3911337a..d10eeea75f13 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -4951,6 +4951,9 @@ static void reweight_eevdf(struct cfs_rq *cfs_rq, struct sched_entity *se,
>  		se->deadline += avruntime;
>  		se->rel_deadline = 0;
>  		se->vruntime = avruntime - se->vlag;
> +		/* Reweighting must not revive expired slice protection. */
> +		if (curr && !rel_vprot)
> +			se->vprot = se->vruntime;
>  
>  		if (!curr)
>  			__enqueue_entity(cfs_rq, se);


Okay, so scene:

we have a rq like this:
      +----+
      |root|
      +----+
       /\
      /  \
     /    \
+------+  +------+
|task_a|  |task_b|
+------+  +------+

When, sched_change_end() activates for task_a, (Assuming it's Fair Class and weight is different than h_load.weight)
enqueue_task_fair() calls reweight_eevdf() with on_rq = false so the block never works. Then we call place_entity() and vruntime goes back.
On normal enqueue, this will be tolerated with vprot getting written over. But, sched_change_end() calls set_next_task()
that calls set_next_task_fair() with SNT_NORMAL. On that case set_protect_slice() is not called. reweight_eevdf() is called
again on that path, but because the first call did the job this one just returns early. 

I could be missing something tho. If I'm not, should we fold this into 2/2 or should I send a patch about this?


Thanks,
Kayra



