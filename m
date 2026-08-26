Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D27338F658
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787774244; cv=none; b=mxwGn7/RWFhPY4XXHGEfunWgj2dUX7kjFXVmMFDu3kgcjnzuuc0OF/1LzFIvAQbS2xPvLyF2lk8F3W7cVdXEQG5XHVPDld+uwwrEN8ZqgoP0VXE2lu7w2faAcXoOCXkYj7PqV/HS1NYzC+fN1bjTdydLwPmQYECqqIDeKr/ytpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787774244; c=relaxed/simple;
	bh=/RnSvf07VpZsSl/pkyWe9YI572Atic2dhICiilH0rYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gi8BkpcQI8wpmd6G1Tz8jtQzNsaLylVOpMFJSPP/ft75f0uws3Kf/ir4zvt/B4KVkGO/R65AdGm1WYjqUUIYL4nGVH1+aa6gCiZNk/krBAdanBMDHofFoorCyJMNWPE3OzdqenjV+EV1dow/+xGLpp0CAeIxaS6F6M+3Kq7srUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=M4OSj9v1; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="M4OSj9v1"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47db714766aso200219f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787774239; x=1788379039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hTsdPkFymOOtxTga6YWdOuMEYYIp5A5+bSL54jG3QCQ=;
        b=M4OSj9v1R6FC4K++kxFMjolYacGgpSifM97XnG/vDomtszkR+IfneDvN8tSdAEXOp9
         6W/L/6607OJt83Nv8PLakQC3c9NGYRtDsm3+BrnICjyI9hjaXMjSJ8DondvFtyjz7Zxb
         8mF4rm/IMibJ06YUPAT7I0TbhTqo5VkW183xMWxrAZGi9Zf0ZNN/CwiKM9M8BKk6Ao8w
         HXz2H+Rmqq7Dp4kpH49d9wowvutHq1nSBHRJ0hQGGGZZAdit9xQVVlw+AQUSee9X9DT5
         B6LpWRM/GNUk8NESwGgQJx7T2q6gY2wUm1DDWIP5t9qmvOzHfMcq6yBtr6z5hd51piS5
         L89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774239; x=1788379039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hTsdPkFymOOtxTga6YWdOuMEYYIp5A5+bSL54jG3QCQ=;
        b=T8Xxc4ryMfqrkTxSpyHKdWHxAlF/S4YD+a8i7KO/jQxsYyJWbX4Q1WfqkRBk+22SBv
         zFTy9MwDQgZckKHWLs+x+IkijGmZE9p4/ZB6/Grs9tyz+NO4xYzafbfujYAaySDQBiDG
         +2M2hXuS4F2Dx5gh0afg9505VWi4k66udZGlH1+QMbnkP48EURQJA9Mc7WL7iFnRyxq5
         xYZ5vmaThgebdHMFvqMicaGcZiDYHNchTSYluCNsEtELdDrP/xiA+qkuLlQ/xm8e3Ca5
         jnzDrqJUq1hzULFg0NZbeXxFk5proBBKNo20tRkDfYVwjiSR05DCZ/0YZL40x8C1QfAe
         JCkw==
X-Forwarded-Encrypted: i=1; AHgh+RqCSNausHCT/QoaO8GzakDFCBisZvwXYfhgNoghFI6fnnRyCzu/Sx0x2+ePS8xl5F3RtXlsj6qWPh5Uewk=@vger.kernel.org
X-Gm-Message-State: AFuF++maA+vds5jv2MNPGTj7IJcFXz+WfwuwJC5xXGSXpHfLTX+c0Ims
	SFfeokTrvjUaGXk85WfMZTU3AAjsatgjyBoUsFoKIHBlUsGdaBzQFE2cho562jNtTGk=
X-Gm-Gg: AR+sD13tPhvLDECtmY1i391+oochF5IyAFL64ZNf+rvzxQFqZpmSBA+dfQq3HZ4V7vH
	ChvDciTHrjNZY6QIsQwE+UufiUBQ+TIeLi/7x2BbnNqyD77xtPx4SMtsZBpw7+ZHn7Wy2VY1fVf
	QT3rbEfDvfepg+tFxUwWAY1OaPnFeupcMtBxrYYoN/tiWeJLK5Dur/CCCvWl5Y8v90eT4H9fbEi
	MZzkytBAY3+PzdxhiNcUzH0FxVM29s6B7Hh2brq5BTXmJTffq/FIbf8Uya+Jqi2VveRJ/eNTDho
	/Qp4d/tQFK7HNzKRZn/NkyKmXFjl2U3mkG+b/hnPcl4heoDUjMkW00It+tECYpYYDT2ZSM0sbQ1
	uz3E2s+g9z+rxMbOK/ueSIek1T2/TLq7K1vhpSG35TwLgIlTqmnFH/nD0JGc+2bb7oxJ5kWFB2w
	+yESV8uHMhvqG+BdKm/6FEfdPHA/Klmp1DCfXhF4yUTUJpY0n+N+LKuwzKY5Pz7W99wk2M390=
X-Received: by 2002:a05:600c:800f:b0:499:59fd:dbfc with SMTP id 5b1f17b1804b1-49b0dea9491mr13362775e9.1.1787774239286;
        Wed, 26 Aug 2026 12:57:19 -0700 (PDT)
Received: from localhost (109-81-80-32.rct.o2.cz. [109.81.80.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dcad9e38sm38430745e9.14.2026.08.26.12.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 12:57:18 -0700 (PDT)
Date: Wed, 26 Aug 2026 21:57:17 +0200
From: Michal Hocko <mhocko@suse.com>
To: Tao Cui <cui.tao@linux.dev>
Cc: tj@kernel.org, akpm@linux-foundation.org, shakeel.butt@linux.dev,
	mkoutny@suse.com, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	muchun.song@linux.dev, linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [PATCH v2] docs: cgroup: document empty-write behavior of memory
 limit knobs
Message-ID: <ao9FHZEaSbNMlU4b@tiehlicka>
References: <20260826021753.197871-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826021753.197871-1-cui.tao@linux.dev>

On Wed 26-08-26 10:17:53, Tao Cui wrote:
> From: Tao Cui <cuitao@kylinos.cn>
> 
> A maintenance script on a cluster wrote an unset variable into
> memory.max of a workload cgroup; the variable expanded to an empty
> string, the write succeeded, and the workload in the cgroup was
> OOM-killed.  Nothing pointed back at the write, so it took quite
> some time to trace the OOM kills to that script.
> 
> The memory controller documentation does not say what an empty
> write does; the cpuset controller documents its empty-value
> semantics.  The actual behavior is that the empty string is
> accepted as 0.  Reproduced on a k8s cluster (v1.29, cgroup v2,
> two-container pod, 384M limit):
> 
>   # LIMIT=
>   # echo "$LIMIT" > $CG/memory.max
>   # echo $?
>   0
> 
>   m6demo   0/2     OOMKilled   0
> 
>   Memory cgroup out of memory: Killed process 339529 (sleep) ... anon-rss:32kB
> 
> State it where the interface files are introduced, alongside the
> existing notes on units and page rounding.
> 
> Link: https://lore.kernel.org/all/aoVUlFdZYLFn_gvJ@tiehlicka/
> Signed-off-by: Tao Cui <cuitao@kylinos.cn>

Acked-by: Michal Hocko <mhocko@suse.com>
Thanks!

> 
> ---
> 
> Changes since v1: document the empty-write behavior instead of
> rejecting it, the outcome of the review discussion at the Link:
> below.
> 
> ---
>  Documentation/admin-guide/cgroup-v2.rst | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index 86a2a0099178..8d2603751c51 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -1321,6 +1321,10 @@ All memory amounts are in bytes.  If a value which is not aligned to
>  PAGE_SIZE is written, the value may be rounded up to the closest
>  PAGE_SIZE multiple when read back.
>  
> +For the limit files described below, an empty or all-whitespace
> +write is accepted and sets the limit to 0.  To disable a limit,
> +write "max"; to set it to zero explicitly, write "0".
> +
>    memory.current
>  	A read-only single value file which exists on non-root
>  	cgroups.
> -- 
> 2.43.0

-- 
Michal Hocko
SUSE Labs
