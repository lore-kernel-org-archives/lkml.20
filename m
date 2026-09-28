Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBF9484892
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 11:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790594205; cv=none; b=XYkxQwDrz7vI7e7xsX+tKzAc2H/fcm07iicahJTiXYfW7LiJnFXyhaQaTo31YCSb6YUgVUV3IIRlDp4qGBdlHi0WUwLnJHwqJpvqkFfWNrRlwfnH/pIV0XncG1+Gl1WGn4JQGgPq/+rOC37ejqWB5en81qQGArfc+D4xGQoDbFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790594205; c=relaxed/simple;
	bh=mOHb0iWkAf0/UxgI2SgtTP0M7yHAAiRCYNviMNWXans=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X/i5nbP6iE4u5kSd9Bd09QFD3OSbdBd9zmCfzv/gIXEgwm1i0m5it/6vZoORMd3DwAVaZCMLigpDbjDw8kQXHcX66k+LBSNtT4BVM87IutwQO9c61Ah/18HcWFQ8L6FDfK3UKnYB61+P3DMzxicxotRHxadftw0ZUSRivdyu+TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=u59dhuPz; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="u59dhuPz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790594200; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dQp40vdg1KvkXwbwq7QiX9CILuC9xXX+jUR4wprdTlA=;
	b=u59dhuPz7cqvy8jtRUNaZZwhwFtAJDBcoIm4obugpqALuPFCD7cLp+4QvbdCYmBPtKkaN95JNbzcmnab8qD+EvD7nZajgc56e8oQxhB/NE/IqZDi6wqPloNvtZudmwZOyqLVzEjr/baxZu6K/h751ZnctMFHf59lvGzh7JvwZSU=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=xiangzao@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBn4.cx_1790594188;
Received: from banye.tbsite.net(mailfrom:xiangzao@linux.alibaba.com fp:SMTPD_---0XBn4.cx_1790594188 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 19:16:38 +0800
From: Yuanhe Shu <xiangzao@linux.alibaba.com>
To: tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org
Cc: hpa@zytor.com,
	xin@zytor.com,
	luto@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	akpm@linux-foundation.org,
	rdunlap@infradead.org,
	elver@google.com,
	andreyknvl@gmail.com,
	glider@google.com,
	gor@linux.ibm.com,
	brads@mainlining.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	xiangzao@linux.alibaba.com
Subject: Re: [PATCH v3 0/2] x86/fred: Fix stack depot exhaustion on FRED systems
Date: Mon, 28 Sep 2026 19:16:28 +0800
Message-ID: <20260928111628.1247368-1-xiangzao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260901124013.1098560-1-xiangzao@linux.alibaba.com>
References: <20260901124013.1098560-1-xiangzao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle ping.  v3 addressed Dave's comment on the generic hook comment
and carries Alexander Potapenko's Acked-by for both patches; Peter was
happy with the rename in the earlier discussion.  Is there anything else
you would like changed?

Thanks,
Yuanhe
