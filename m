Received: from mail-qv2-f32.google.com (mail-qv2-f32.google.com [74.125.230.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936B639BFF1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 20:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.160
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790281211; cv=none; b=vGni4KIdLodx76E/qoXaBCQEe4bDlGmai8M8rLuj1mYXrXNrfb5jH1vDlTnyFlGMBVWw1oL68veejUtNg2wItHvHRNOVXOXGCUDjEMX91UmPYGjf81XKU2p2VtBfXQ9CaL8769VSHAEPWeJM5ghQLUjzMWk5CfYKS98AjWcyYVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790281211; c=relaxed/simple;
	bh=Ps70omYJyjlT7EtVWHuAaTVJ8363EKJAGJonEEdc5DI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgCKaW5d/nDiSe5pzCEaATZ9qZfZOmPR2BP9sATyTee78Ja32ThHRZJMQFcoScdfOFHKwWzwlW1LD/Z9dVc0Oig+l0OgAPfJ9U9jr//jQh0KdyNUwOUeSj6Rcp09Hz12UEmoZMknUVfUEjkC2QSA033tVnmFvwhquaGW3OpP1/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=K8M2Cpfo; arc=none smtp.client-ip=74.125.230.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="K8M2Cpfo"
Received: by mail-qv2-f32.google.com with SMTP id 6a1803df08f44-90ce6d5271dso1497436d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 13:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1790281207; x=1790886007; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rij/XOPRufC7Ydvy7i9poFa79a5QAPV83S5VKBw2RzU=;
        b=K8M2CpfovUnBg5Wqi88IazQRHHnwHQrRzwQcp2bFOtmCxfkSr25umixtwe7VckiiVx
         V0YrUiUqCcNixcxW2GEuu9kj2IHCO/4o41id7xOUO7OuCyz0AczhbOevuw8SmE40drJj
         drb0zSNFqHMK70EY5lJxUERcNhtMpdTK+ojQPGJPk0+XvGTxC4zAMWqyMPybyEb+Hhvu
         s/p+rA5GbH2flZG3pONyZUx4eu3I+zbLkFwG/w03/D4Evd2n36mdzu69Qk7ElS4o180j
         cCGwbeExrzCydHg3aYj5jG7AhFvDxPIPwVQ6PHgy0KzaamYxEcDi7cb5BohMdWIN/CV+
         HAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790281207; x=1790886007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rij/XOPRufC7Ydvy7i9poFa79a5QAPV83S5VKBw2RzU=;
        b=AxrCYVKtfHkrphf6S/iZDe/rdVWFz52b4o0FS8cHFkFTvZSsNLV8AhIM3e32DH3sjq
         7U8ZnlJcyvc2jLZ6K5eumiz9gzHyUiZOI8p92OElCHuhvoxOQ3pK9gEGkgvi1QHwPlG9
         4aHsb/9VYVVBvzUpLGzPuLiQxR81XXqbTFY7Q9DNjSLhNt0bjisiE9nnqRCeeD98Rnhm
         mILeozavzulZyrPUQP5Bl9uELnPeSAUbl8exTUpZE8L5jUXGu3GVbekrc6kisDdIML+O
         yBc4v0tQwUOJKAFUhIMOGOQ7UrDuUo+BfEGwbSvDgocS3z+IIXT7rgqLmLIc9Wo9p3so
         XiWw==
X-Forwarded-Encrypted: i=1; AKwUvBycDAqZVu25Huvi+4AqcbZcIwZ44MtavzQ5EtrIca4z9u4hyfr7mkX6Wf7KnMcF2Pl3YJzYou2w79fcBMo=@vger.kernel.org
X-Gm-Message-State: AFuF++liysw5fQOWFzjS+9DeUV0JhvT07XSyetfAKeXbherrdMournh6
	9OjJV+AVQC7xvA6I9Rmt8bT90BWaEe5QzaIcBES9DQGh0NIeNrbK2RQa7aZ2xdSnt4g=
X-Gm-Gg: AYBFou32I/SqxBfmOo5OhgE2VeXCesQIbEF9nnCXM9kWZguL5LNboN0wQmPTkZCQDSB
	6RNcXyl2jNx5fU/hhv5pTJaTTuAjRHnJbJN1iw1fQIXEqOugjnjeaEpAcja6gLq9gGLQ8WDVlR+
	u8jJ7ze4fDkxnSS9MTNeOXtmMZkLzOYVG1mes58OIH+BT4F4IG6xgZgW2ujDHAqpDRZdwr3SiO/
	IjZId+Z0OzCYT7w+JgHD5z5DgXNykLz98JXWy32MyNfE0LnXkcOWVhoVtSzveHsUn6z/6ur7W6h
	rm9RxUurgRkPrkBww86NxPC0RHAjjbgcR7PpeXVQdMYXm6PidZWlLjt/XCRsfnIbK1ejy4Ou99L
	H4dhXd5v4q47dma/nKmUJqsuT5uoYTJ/BFosXNTKke0A3XWPO++IYb2i2S9uerAs0JRI/PRZCOZ
	S2um9mcwnXbE4WwSZe5VPpkKq4v/VNHqExI3M/xOcQIow/7XY7YLCNGloNfBUZE/ow5JLO
X-Received: by 2002:a05:6214:202b:b0:912:517a:7243 with SMTP id 6a1803df08f44-9142f9662f7mr6439846d6.22.1790281205969;
        Thu, 24 Sep 2026 13:20:05 -0700 (PDT)
Received: from localhost ([2603:7001:f100:500:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430e09ce4sm1581146d6.28.2026.09.24.13.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:20:04 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:20:00 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, axelrasmussen@google.com,
	baohua@kernel.org, baolin.wang@linux.alibaba.com,
	baoquan.he@linux.dev, david@kernel.org, kasong@tencent.com,
	liam@infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, ljs@kernel.org, mhocko@suse.com,
	qi.zheng@linux.dev, rppt@kernel.org, shakeel.butt@linux.dev,
	surenb@google.com, vbabka@kernel.org, weixugc@google.com,
	yuanchu@google.com, kernel-team@meta.com
Subject: Re: [PATCH] mm: remove the unused zone->unaccepted_cleanup
Message-ID: <arWA5paTALxnFGpq@cmpxchg.org>
References: <20260924191103.3475117-1-usama.arif@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924191103.3475117-1-usama.arif@linux.dev>

On Thu, Sep 24, 2026 at 12:11:03PM -0700, Usama Arif wrote:
> Commit fefc07518227 ("mm/page_alloc: fix race condition in unaccepted
> memory handling") removed the zones_with_unaccepted_pages static key and
> the work that decremented it, but left the work_struct behind in struct
> zone. Nothing uses it anymore, so let's remove it.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Johannes Weiner <hannes@cmpxchg.org>
