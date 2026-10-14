Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D449E5226AE
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998268; cv=none; b=r4+85zvF0JtIWauBmn4namnqMNks9mvhV/zOsKEAQ9td+UM1igifmbXcwmiTF+4f946rq76E69caeUdnoxU53OW/MmlVEYGRp5qLnneiSKoWGwI8hAZTQMiUIXpmiSpGjS2xGw5963eoXN48XFTzDwl5K/o83Aixtuts4044cj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998268; c=relaxed/simple;
	bh=VnDA+HtlDN5W62WGfmM71lMrSGjDZrKjgyu+mzQDaWM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References; b=qtS2ZEyc36AZWbLUY7fSEpTJKE8XU9UM2lSxxiBVfmdc4E3fF6prJ/LjR5h7HT8T22hXBM4XOmr201qJA4HSFAKTS+fjWVRx74Kta51Lc7zI1IxuUBjU614EP75FAS5yqJ+ZcqsTHwwM9r3gRqb++gvhUuPlZ8uMmJ5MysGrDdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIv+a0Ar; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIv+a0Ar"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA68A1F000C4;
	Wed, 14 Oct 2026 17:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791998266;
	bh=RxygCVIXu5CteFIzIENMgM6Mh7bbtXJGcW6HzFUcpm0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=AIv+a0Ar712wQ+h/bQfa63wQW94YGlTNeVEsqH+yJmuv6i1qtE3fYZWXJB99iwvEA
	 VsyAfZpfx9B2Ydju60OQfXamXwL+l4jA1Dle8UT3wNqV5YrLGTG1x5cg8Oy+2mC6lc
	 dtIVZ14IySYFL7vnJhgk/aeargFCkSdA7t+re0fneeIbJ6+lpol6aJPasyBkn4CLNd
	 2wLcxxmrlL1OpUk+IXaJ+w4D5iFduRB6CnJojke/5PyOsngPmAlIDT6e27+SX7EWLv
	 7YvShu/fqZ06erYXoATj+58YMi9dF96siS480KRze0VpNzggV+MwtN8rZmCqzPHMyw
	 b+dygll+xr3GA==
Date: Wed, 14 Oct 2026 07:17:45 -1000
Message-ID: <275287eda8e8078916e13e38ac4aba40@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>,
 linux-kernel@vger.kernel.org,
 syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] workqueue: mark pool->nr_running as __data_racy
In-Reply-To: <20261014154342.20661-1-ngocthang2710.1999@gmail.com>
References: <20261014154342.20661-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hello,

Applied to wq/for-7.4.

Thanks.

-- 
tejun
