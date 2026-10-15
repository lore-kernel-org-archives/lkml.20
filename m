Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30C849CF40
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050165; cv=none; b=T83L9A6R94EBYp25MYy4zApmXD81QUWZeOaGBIoIbX9BcMaSuTbkQBhkWbQQKi1i0HBeuFW3OYzBqqhSF0X7OGf8isAWI+uG6fFI1YeqV0lvwtdEtNLtTHWM81OTMmKWgMTdPDsH9EOiOczv/MoPX1Ur5hUd175u1XFN12/OoXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050165; c=relaxed/simple;
	bh=cDOfuyrvdvRsrhDANjxcZxfakofLAmsGw1zQ43Ooe8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QR/kJpUdLvB209K10FYo7gnSlOJoyObQcMwCqNrgpXHurkYG6JHMwl+aSy8mJi8LYXYYr2BwM9+4z7V1UvFUXFJGPCjhcupQ+UzKfvWJw2ToYno1zIzYMriIYVR8+S8zOkLlw8RLk/KnuIcHaNTWcExgn9sbk5D2M85IHT58Ggc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wuw9RUI/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wuw9RUI/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a17ce1dc00so9966435e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050162; x=1792654962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ejahELIiLsJOQNHGYSUsRkLMUyiI6tzi958QDrAOaok=;
        b=Wuw9RUI/pXLq3PjnfhLV+lZlmrgQ6yGTuv7kXkdtA/bChxf1CRyo1nDNwezaD0Y3/u
         lEY4G1ns6Xo9F7vcOhZJOgGK5Hv7comrSOqshGX02TzbLD02LlbhEbEOIPTafC6WuErk
         i0yEdcDQAFXYcQT+mMotBqkRb6QnNlqgxuLLm+l9/HsFEPcjzXvywhsM50a4uJjsda0u
         wuBuglbe0bPaWjoZj1w5k6nm/kmIp48hiZfJf3cIfvJGBssybv57jVAXHQEhdTVh9Z2m
         m/sAcjxqN73l9EZjlst95IsSUp8I37VPtZSBK2/aLORaHjlvioygxKDePqTtW/Dfb0V2
         /CIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050162; x=1792654962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ejahELIiLsJOQNHGYSUsRkLMUyiI6tzi958QDrAOaok=;
        b=Kogw+f1WGTZzR3qZ/ypeO21Km/3dZZz7HRCrEqZnCn58VMAJkUg1WNNN12BRkrPazY
         yCRmmGbA+Sj0Ef7n/lDXhGMw8AheHUHuycnhPnyaSgSuGktB+t0scF3PcoZNE+NCQhxx
         piNm9hgCojl4Jv7rPiQ3Oy5hkJ951cu9vuPo4TBVxvANOJEceasCaIRsYYzilf/prM/E
         Idgy377TDy+pApXHLeYT8p8sOOd3Vg7tdiPyNGTZHg38Dz/E8heWhR29J36cHyJnhglT
         GuPZWVf73Q4bXdZA4pY7JilQ/MPMuqYKEfvlXa6kgZjMBDFYHntuZQiZK7N1EXlCxNe8
         kofg==
X-Forwarded-Encrypted: i=1; AKwUvBzBi1Dl2CVmErIHHIhsmBDiXDnsfCH7y22+QLyGWQZPFF9WHANtxY+oI3OXr/IjHCIvJWQkMyAO9qovAqM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpOSEUJRcyMnqOcsoueeVIVGxoeLDEbfVnxTb7xZDn0ZDtxabe
	N623ET6oMhMBYw4kW1AzoUjaX8n1iQyVCSDlQBmeZILT5c1kjfT13jZw
X-Gm-Gg: AYBFou2N1ZHoiEQDrQFRxQNHuJ8WKAOMnSvDnZ3ljQnNt25Xdx7ku3aS+eMzntPdSOt
	8KtQwKQufeg1WR+sRucPF47uUpejBmwTMyeAZ9WxnkgC3WaZhwptLvXnJpYKlfwp58kn+7ueqJ6
	X8BMMqERB78XkfOQ//GpLC7s+k1OvRw6hAOJ21Jr8Pwu+IEdCf9xFnSy2nWdPfLieP6VHmZ87eK
	tXFMNzy0C7kYylF4SpILEK4TlhFaHLJvIm5P1XhDYsJFHTuAE6xT+LBrDWuMgndjVe7bj8CULxs
	VsEmDUoUF3+liaWSa+Ct+z6HTexQI+WPoIwwTgrr3T41fC8WluAGsrskW8u9e4ujeXgoExYn699
	rZQ4XEqNeP9Kk9CCrgY3jKShRUjKhYMIlptr+99h5iNXaw76/87iWgT7wCeF+4G1/SpPhAyUEmH
	u6tOLS/QSG3s5PScfZ0WEWXB/UmUbWbPnEbszhX+fDTW10ZtsPiouGXQo8udr4hPQKNgVNe/iTr
	IOds+LV1F2OorE1+Vci
X-Received: by 2002:a05:600c:8b02:b0:4a0:1973:f05a with SMTP id 5b1f17b1804b1-4a18e47e19fmr389550585e9.2.1792050161721;
        Thu, 15 Oct 2026 00:42:41 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9a88bbsm54197725e9.3.2026.10.15.00.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:42:41 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: christian.loehle@arm.com
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kayracizmeci@gmail.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com
Subject: Re: [PATCH v3] sched/fair: remove dead code on enqueue_task_fair()
Date: Thu, 15 Oct 2026 10:42:38 +0300
Message-ID: <20261015074238.2363-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <6f7ec108-603a-45c3-a5c2-6f9aebb50f54@arm.com>
References: <6f7ec108-603a-45c3-a5c2-6f9aebb50f54@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> > I'm not entirely sure I follow. With the above fix there is still only
> > one place_entity(), which is after enqueue_hierarchy() and has
> > ENQUEUE_QUEUED on.

> Exactly.

> > 
> > Here enqueue_hierarchy() adds the entity to h_nr_queued, and
> > ENQUEUE_QUEUED tells place_entity() exactly this, so it can adjust.

> ... but place_entity(ENQUEUE_QUEUED) still does:
> 
>     load = cfs_rq->sum_weight;
>     if (curr && curr->on_rq) // <-- this is true after enqueue_hierarchy()
>        load += avg_vruntime_weight(cfs_rq, curr->h_load.weight);
>          
>     weight = avg_vruntime_weight(cfs_rq, se->h_load.weight); // <- this assumes se isn't already part of cfs_rq weight, but it is (still)
>     lag *= load + weight; 
>     ...

> (in this concrete enqueue()->dequeue() due to unthrottling case)

Fixing this requiers bit of a revert I think. Or something really close to a revert.

Peter/Christian, would you be OK if I send a fix about this with a revert
(that I caused :<) and a comment or one of you guys want to fix it your way?
And is there any cleaner way to fix these without a revert?


I also need to rebase this: https://lore.kernel.org/lkml/20261014150251.30099-1-kayracizmeci@gmail.com/

Thanks,

Kayra

