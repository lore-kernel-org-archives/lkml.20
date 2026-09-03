Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7FC4AFE38
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788443816; cv=none; b=isrMvRXJAnG8Y0fdlmXo4pDCWGo4D5UYotdayrIxRZ9usUb7zlb2aBoG//xV//gBbaink3pwxXz9Q4YUiIAUcMz3/MyYRY+yhm0VAWdfrwRLAmcNnD7oc7cC8MNwUWk6p/2YyXDyNvdND5L/AjkbIkoB0g77RInXwWqY1aqpSDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788443816; c=relaxed/simple;
	bh=tH84jB1SQvYfsu4BoMGMY3To7AhVTpXgX9TrSUDtRoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eYM+KIEQY7yV7cjZqlKQSwCackywnna3j7mT1JDgrUsmz8hefWWTYSxpcWcB42BEvVTi5r3P8AqFc106AhroBo7iTZ12Iq5XRAx3hiR3MbLHBKGsRl3TyOCLKnI1D3YBZIwQJkEA6lcQ/GD41WPhiL3i+NYAuMtNQ4zl4hub7pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LUR5+Oi6; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LUR5+Oi6"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39682983a0fso3064111a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788443802; x=1789048602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U5QSQqPQNQQf5u4kt0k5Ugm7eSjsSUE+ivZY0S0TJ0o=;
        b=LUR5+Oi6Dx2utD3A4lcogL1uXb65RojPOANb+KypjkGkhI/4dS3BvMwMWm2i2vDhrJ
         S77/tjN6f+CmWtPXot78InPxrE9R/R+YcAYLeQw4hiIN1qnDrsAd44LJ1uiTbHFrAdl0
         HbeoFvjPIHSmSCuoCuJj+JKr0voTKCarvMD21a1/qHFiAzDJXvMVEtBXbTNgo6y+u/Cz
         F7crlkuAnhVSy9ydwasjG+4Ruri8y9Qtkmi8b7HIShZdhgqPI+YiUOZFWWi5t1bkxNNy
         8ubVCziveN55qL7ro2eEyncsjry0KseCpjbGnzJX4bPn3bYiJenDb67xxvSqLE2zRgnq
         kDbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788443802; x=1789048602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U5QSQqPQNQQf5u4kt0k5Ugm7eSjsSUE+ivZY0S0TJ0o=;
        b=Waqe3QHnfSySY3dIiQu+1Dh8KwpnZHm5mK12UWyAFZ1Rq8A0cwfUYB/8S3+k5U3qe/
         pRAE0lrEcfVkiBm72aCNRGdYt6XPpskxAJVnbTOPfSX2Y70Z4HlBXqyB5AcddlVtKdmr
         1FSrBhwObDhPab93dT6q3sifJkVu2iM+kDUddGK7PF/mgj+g+8KSOwfS2oHZuUfsvs/v
         q6qTyVzg+sCtvVBe8uvS2/lOueZgopAcXT8pqWEDr+xWp5Wd5J/uv2dFk1O7Zf3rIayc
         twgVlUQa6KyJ6z2Hq6i9ie9j3BvQ+ZL8435n2PjrYrJvraT3l0s7KVYc1NjqFA06DtJi
         6b0w==
X-Forwarded-Encrypted: i=1; AKwUvBz759FD73Bd5q7WBn/2e9rcWuiZ1JPHubg3LAe+OXG/RTaeZU7zrGCR/qeTRvknAA9PF+2dhr79mMWD/qY=@vger.kernel.org
X-Gm-Message-State: AFuF++mGglOzBnw8TBKUM1/K8vD2M6fcyVbr3q7eFBSfvBq6xuxrbExp
	TV4cT4KhLyoAMzAjaGUiB8TpGXJvL5+APf1M6hxRJb/o7Yc2QJtIh85k
X-Gm-Gg: AYBFou3aid8FC+/nPrgCe6aDZncKwfLDFu6GdSVAg0V7guTau6axGqsTEFkQl3ulMVk
	7BPZyx8XvLRuFTZuKwX4tirC0trmjQIUguML1mZ08SGL8fOKToz4n9j4vZQ14x8QhEP7BIBLlW1
	m9YtMxZocivykKO2HQEpWIk/0LVvrIp+3NquXOjNRxAWxLLmgflSuvocrgDyyQhU2AApT+gU/Z8
	zR5wIZx4JQ+KTdy/yRSzuxnrCk7vyijgI3k4scuGWAQr5oGpBGm6MV5XUEolcjoH09Hskw+lU1J
	FhSb9ZDQ5b58BtUtg+IBIELxOXv89mp2+7cjmTAE5QvdlVFA2lfo3iJt9WCQJxA9v1NyXH0+R04
	PN9/ThAAQKVXG8H5Cv1yWbpsLTs5ebEylQcfKGd9DdKgh71CQkr3pH1HYuqbTOibVEVgk28e9iU
	vyJnjZHcBlnkMkRaQpusyTj1tKYAWZ+fcSfO+MYwocRYnh168TaiR8HcoU4HsDLenAFlSAOea+g
	GooEQ==
X-Received: by 2002:a17:90b:4fc6:b0:398:c315:fa6f with SMTP id 98e67ed59e1d1-39aee04acdamr21381384a91.14.1788443802462;
        Thu, 03 Sep 2026 06:56:42 -0700 (PDT)
Received: from zhangbo56-PC.mioffice.cn ([43.224.245.235])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b0832b85bsm5726614a91.4.2026.09.03.06.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 06:56:42 -0700 (PDT)
From: Bo Zhang <zhangbo0325@gmail.com>
X-Google-Original-From: Bo Zhang <zhangbo56@xiaomi.com>
To: xueyuan.chen21@gmail.com
Cc: akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	kasong@tencent.com,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	zhaonanzhe@xiaomi.com,
	lipengfei28@xiaomi.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 4/4] mm: adjust free_pages to make __zone_watermark_ok() mTHP-aware
Date: Thu,  3 Sep 2026 21:56:16 +0800
Message-Id: <20260903135616.4106443-1-zhangbo56@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260903024629.574484-1-xueyuan.chen21@gmail.com>
References: <20260903024629.574484-1-xueyuan.chen21@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 03, 2026 at 10:46:03AM +0800, Xueyuan Chen wrote:
> >+		free_pages = zone_effective_free_pages(zone, order,
> >+						       defrag_mode & order);
>
> "&" should be "&&". defrag_mode is 0 or 1, so this is just order & 1:
> works for order-3 by accident, always 0 for order-2.
>
> Same for the zone_page_state_snapshot() call below.

Good catch, thanks. You're right - this should be a logical "&&".
The bitwise "&" accidentally disables the block accounting for even
orders like order-2, which is exactly the mTHP case this series targets.

I'll fix both occurrences in v2.

Thanks,
Bo
