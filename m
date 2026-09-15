Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D64A2048
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789483760; cv=none; b=JshgcEOT1URWuWWMBa/bdYz6bB1OzFrocaZF+7t8WO+s58jhuIa9xaCVWifG10rlZrJ8Oi19G3sCWZduCt69WizjedNYjV1ZmWFBHUm+zXfDiUs5vjKycVd8Tl4cCLWbFQqigsI0+KAyn7ZRTAdA726/h74BNPpVB5e/pnPUqY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789483760; c=relaxed/simple;
	bh=n6QVcrbQsKxEDcR1En1veCZJL63QddQckjX1cUBufHA=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HJ/tATa2iCAmhGyfkBJY3Sf5tFivuLy9WGmF8eitrS1pqMo8P8Db25OVQo9dDGKly6Moi+RIny3qvswbQGPQxJ5wK+vjiVaP4imIBP6LtKBTX3iFKqQKRQc7VQEqB098HkEmwAXnEzLLFrPTRfYbrElnVc6Ux1WWkFnWoR72pyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3ZuY9DV; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3ZuY9DV"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a99391ffb2so5897418a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789483756; x=1790088556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NtxVeAruzSzBSt8uXIvYAlTRCQtPNr3FqdWRr27iP+4=;
        b=D3ZuY9DVzo9GAm3od7TUBoBgQHpH9z4zr7T4RZuVOAMNGp1+MQFVOLKyGSucaSSc4R
         uVGic1c4jFrLyLw7q3ViGOeYPD5/BVGB5p7w2pmXGfmqgBdZrxVywQLTdp6Dt7g5XPQR
         1bB9vSVkwSj48C78nYuvvnXfVchIHF2dIN22kyF1ZmStlxWY+Gj7wyAwsJ17K+ydk6fW
         z/If5Rz4NbXxlzKqGrR108/jvZlhPQz1qQBT7vlEf5Ltf765qYYvGnM4OFQQNlEm2Gxg
         M49PTzh5zaOcqDRzVYGj83wX3jKMRaCKohbMUgfLPMCASCGaE4UlRGD7ARWro+X5GYt3
         x/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789483756; x=1790088556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NtxVeAruzSzBSt8uXIvYAlTRCQtPNr3FqdWRr27iP+4=;
        b=z2qXjTD8+sKn2J0MdCWHl1H+8th5RB+bVZIxyIN/SROQNtUEPr9qcEPkfRhyQBb/qL
         vDOOClruOF+xjM6Ng2iUYUp4NH6yrMRq4J/8fymU9XzI2XgucO6cqQkLgZqT6Om7p7FM
         3DQ5Mv1WDJO0ysNOzNxnwrgnxcu/VF6z80TSc4m+XFluWaVHFSwhnPGVlpPaPTjEVXUT
         8p9rPDEep4a5JJWWBsUF9VjxzP5zXexa2rOnE3zSm/ZM0uS+kWVybfwGx++NDoVaBX9Z
         pC5oVi55LkpfL7fxudl71o3erksnslRH5Lp7A6Pu8XsUzJHNY4waIL+86ge+SxsdwUaF
         KAyQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjI89mIHwrz4sAx4ZcymtcYHOMvMUS7YkTJ6acsJMmjEf1qgUeuHIFHiiOzRuePeuEnayjIYQPUlkvnPc=@vger.kernel.org
X-Gm-Message-State: AFuF++kvLPAD63HVW5rhgqvKY+9fP455g7THaZYic0nipg4oBTTvc6rD
	p/SFn+YE0K8YcCUVlFnt0WVUrM1v0IDN4wr2Rv1UMO7fKRNSjqiG8pZ0
X-Gm-Gg: AYBFou1hkTd7LMQfOp5pGuiT1JqxqS6rQVLStOF36zgu23HB4hVgzyHCiPKfnMJIH3y
	7vbH0Tm6RXW3jeArihw8xzG0Ae5+FRfkG+/BiFP4BMSTKSm8DjgvwEu3ew2c4viVVa1cJ5psjBk
	pvF6efa5aXKKGJzFY7grmx9FtX9MmSH5czGQsjZC2wklB9EUXJbs3sOdQZpFxSLpZPS5LGyqYya
	Z9KlTfxnITf5A4Eg4F2ulnMc04JrMNRI8gYiIr7U9hJ0raQK5Tp5U9bN6yIhPoqGbsJn5kWnGZ2
	2iRGJuVwTRrLewpLfLIax+D+q6EN+NMsv9hkS2staeHHrePnbvvVtBvnFhf4i9qRvCKoT496pZG
	LAA5kQBYKm0CFtBNz5N+rVnPrYZFVZmyL2x0mAZyQ8Sd8qsWIOrsjhjs6+0htzSVszaoKPI0SPu
	l4cmtSH1v8CaCh5a4YmORAHvk8aM06tYYJoMpTkA==
X-Received: by 2002:a05:6402:a510:20b0:6aa:80c:e67f with SMTP id 4fb4d7f45d1cf-6aa080ce811mr1509941a12.39.1789483756171;
        Tue, 15 Sep 2026 07:49:16 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9d0ef7228sm4345063a12.9.2026.09.15.07.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:49:15 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Tue, 15 Sep 2026 16:49:12 +0200
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Shaobo Huang <huangshaobo3@xiaomi.com>
Cc: Shaobo Huang <huangshaobo3@xiaomi.com>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, akpm@linux-foundation.org,
	david@kernel.org, kees@kernel.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	vschneid@redhat.com, kprateek.nayak@amd.com, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, ryabinin.a.a@gmail.com, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	kasan-dev@googlegroups.com, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>
Subject: Re: [PATCH v2] fork: reset pointer tag of vmapped thread stack
 before vfree
Message-ID: <aqla6CyhEPihIznP@milan>
References: <20260806123020.90869-1-huangshaobo3@xiaomi.com>
 <20260914093300.100495-1-huangshaobo3@xiaomi.com>
 <aqfBDEkiRmlb0WWZ@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqfBDEkiRmlb0WWZ@gremlin>

On Mon, Sep 14, 2026 at 10:44:26AM +0100, Lorenzo Stoakes (ARM) wrote:
> +cc Ulad for vmalloc stuff.
> 
> Please don't send a v2 in-reply-to a v1 or any other email.
> 
> Send the patch entirely separately.
> 
> I really need to write a bot to say this :)...
> 
> On Mon, Sep 14, 2026 at 05:33:00PM +0800, Shaobo Huang wrote:
> > thread_stack_free_rcu() frees the vmalloc'd thread stack via
> > vfree(vm_area->addr).  In RCU callback context, vfree() routes to
> > vfree_atomic(), which calls llist_add((struct llist_node *)addr, ...)
> > and writes 8 bytes to the base of the region being freed.
> >
> > With KASAN_SW_TAGS, vm_area->addr carries a random tag.  If
> > kasan_unpoison_task_stack_below() has rewritten the shadow covering
> > [base, sp] to KASAN_TAG_KERNEL (0xff) -- which it does on every CPU
> > resume for the current task's stack -- the llist_add store checks
> > shadow[base] (0xff) against the pointer tag (random) and reports an
> > invalid-access, although writing to the base of a stack queued for
> > deferred free is legitimate.
> >
> > Reset the pointer tag to KASAN_TAG_KERNEL before vfree() so that
> > kasan_check_range() short-circuits the check, the same way the task
> > accesses its own stack at runtime via sp.  The vmalloc lookup is safe:
> > __find_vmap_area() resets the tag before comparing against va_start.
> >
> > Fixes: 9f7d416c3612 ("kprobes: Unpoison stack in jprobe_return() for KASAN")
> > Cc: stable@vger.kernel.org
> > Assisted-by: zhipuai:glm-5.2
> 
> Thanks for adding this!
> 
> New convention is to say:
> 
> 	Assisted-by: LLM
> 
> Rather than to list the agent.
> 
> See https://docs.kernel.org/process/coding-assistants.html
> 
> > Signed-off-by: Shaobo Huang <huangshaobo3@xiaomi.com>
> 
> Looks reasonable to me so, with nits addressed:
> 
> Acked-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> 
> But I would like Ulad's input on this from vmalloc side.
> 
Makes sense to me even though we do it in the __find_vmap_area()
but we also use an "addr" in other paths.

LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki
