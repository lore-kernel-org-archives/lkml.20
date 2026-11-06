Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793924632;
	b=J8sFHgxgjAo69cgfZSKPk8F8a75gkKmI0PfBhyum7m5qGWOCGfZJhwYqQpLHg52HHxOn
	 9rkKcelfnHsOg6P8Mz4J0hOh6L5Yn1vHVMFZ3o3v0NFf7ie40ySkn6HfOezih3K3CW6vq
	 omQ3PkIzS5AFfQNw7OWvWmaNW3P09iRx6qpUw8F+Rtc5X21JE2UrlBCPKC2ho6ehvoykL
	 eWGe6yvAk94G8R46OoPNzjT6uskkPf/xFyBhflaxET/XJr3urLAdsjfT7biMjh/LAiHGP
	 hfSHNvcWLCW53LTFWnRF/BPb2wvXuAhNQf8kJ1ZWJhqb2iDLz7CfrYwudL5JHMTTYgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924632;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=9bnssphz9tPNkziEw1TrPwX8Qw76+EQZeM5ElxoXCNo=;
	b=d70cDbqli5OFwgotDPrxzmQFSEUJ6acKAfN8lmak41+aOE+A6LLHlUg0MTdasHGAV9cY
	 K8CHOrwCTdxJy8iCFFC25IZNAi5tPOJT/DkBzmq+5hzPto7EN062fZo1lcrS108nlDAbg
	 7Q/GFPCXVHtfZUBaRw0t9aGZOr1584m/dqD38FnbE1KLlFPDE3tgzHffU9ehxkcJpuwkm
	 /8aEWHgBma5oNdhBqb6Q5xg8ZqB0KCCmQnIxe+il3b5GxvxmBT2Axbw/hl7vAGkk91c86
	 CJH8IfVE4oQMadVEoeJL0I1GAVEKpFP1XF3SWdk7WBB0YUQwMFFOENl+PN2AdyIXeWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNgifxCS;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AFE606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3AFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pNgifxCS
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-89f639ba307so16589b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793924631; x=1794529431; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9bnssphz9tPNkziEw1TrPwX8Qw76+EQZeM5ElxoXCNo=;
        b=pNgifxCSQQkRtgSHeqpSybylLqUSN5WqpujtIfBAOSKPPcLRNnCi7uXVHgG02l825q
         jY4ae3eF/m+E8jZvEzLegQ//1mTUMGSrcU/W9Dxw23zC2LoQxTcdQWrgsEjL7DkByrN7
         kAL7o7ozzRVbbZlFR8Bs88OKBg9DuiSfjdsYzfTTlXo2ar9aFMWmiAs3Tt5ZKttIUnix
         nluSaEI/nB2rNu9gYcaws3sMz09fgfUJUNdxQ5wJOhv3zTK+pyWHbwRLr0uxl+zX34iU
         0554TzwiCJJbrdLN+7VwiYdj0avUNoPEzqCp5/AIkOjGBqkIXCMXIPSRcULX4TXwUW2N
         eKDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924631; x=1794529431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9bnssphz9tPNkziEw1TrPwX8Qw76+EQZeM5ElxoXCNo=;
        b=M6bIVOXH3h8Nlg2mjHBeZWMGBI+se30rInR0sxmjX8z7G9aqqVQBu+KP8LRf+vgGk2
         4Ho6Wj1itN+qx8ECsz98zL4HzoMNfkaSDPYnn/rMZpw84kl+Zayi8dJ+rWr6Nh4xH8iX
         rM9cTnLiXKSNOoYdE2YAlEZAjD63PJ63dgB5e5rVzbIEvNlpfJ4MxalLUFa/NO8F5fBr
         2Gds3pNs1Z7d7Othn333lCxAbkXZHFWoJYBjaU4CebZ+/ZxTcDwsX5uID1AWbyzJi0jt
         HM1CDFUVWuTifvxokyKWFWyH4bwwB+GOHr/KzMXqLgbibJazWJDcZhA+P5Bk7i6bJ7LI
         RImQ==
X-Forwarded-Encrypted: i=1; AKwUvByp57RXJNuS08HNpwPeDqVd/lLJ8eFyY/KPssXrZHHZcP7/I86HDAMxKKMMx/vQRBhE/bSOou/3JEPTBc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yw8srER1taJ6DPLHXevnxCEpXOozHEqYVrXsUWHOZQKD7POD4
	0d+ccWcM+nQA+3mrntWDAcbwrPh3iviAZBPmjolWzsIa3y8Vo+/TY/L3
X-Gm-Gg: AYBFou1IJC7KV4ypwK2hkJmwEu+y42myLpu4I2yv2AW8ElVkXHvx9mKvZpJUP0XYE7u
	1gg2QkTKJKSg8nLWjy9BJy1iJRDFQI/tQnsguP6RZi6ATY4ICCMLur7ktNCyQXYw2sFHToR5FJo
	6dsKnuxuOtFQs2xxP1uGwzrGojFOjvz+iEe1RyrJmhD3L19KASnieBrk2HM8qFc+rroMa0rY65+
	NNPE/eGUQmJSJGeWSjP0GULrga9HQo+J6ojueOA3vooxAlIfH1L3AV+CqlX2/8JnTQlDlB/T2xR
	w9DwKlRFrjhNq9HQOFC4Kr/YZff5ZuhYtfLYq8vN+BJ9g5h6xwZP22H9qadwUnLg4QyjCFeXbpq
	ormeRIhro8j9giSveLm4DWayoPKxmC4Zn6ZR3yc1icUJf5VvpXNceIAVoyuMCSVjLYQQHX2/mHe
	6fJX3iQJDl5d9UEGeySjvR92d9l/C2Jh6sxSiGJg9FS5xycC5SIInGKMHZdvoW5Rr8pwS1A3PyK
	gF73TtdP8BgnzhYGOQJh02Wp7u1YKJlanT/AkF6+xIR86V+0KKA9NN2alqSN0kEW9wnC+gaAX/7
	seb7tr9IU++IQHxDhfx4yqW167m6RfsBO3I9t9SHoil2a8YG4fGysMM4TrsKsOKZBMJIpXVgxQi
	Xv8kB7/Y=
X-Received: by 2002:a17:902:f78d:b0:2ed:2475:e40e with SMTP id d9443c01a7336-2ed41e914c1mr13079085ad.61.1793924630892;
        Thu, 05 Nov 2026 16:23:50 -0800 (PST)
Received: from bloom.localdomain ([2604:3d09:178e:e100::5567])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47da165dsm307555ad.73.2026.11.05.16.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 16:23:49 -0800 (PST)
From: Ivy Lopez <skunkolee@gmail.com>
To: david@kernel.org,
	rppt@kernel.org
Cc: akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	fvdl@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] mm/cma: fix range selection in cma_declare_contiguous_multi()
Date: Thu,  5 Nov 2026 18:23:47 -0600
Message-ID: <20261106002347.255584-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <6099bcde-15be-4197-905e-13dfa4c83bfe@kernel.org>
References: <6099bcde-15be-4197-905e-13dfa4c83bfe@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/5/26 20:38, David Hildenbrand (Arm) wrote:
> Do these two fixes still apply?

Yes. I checked against akpm/mm-new at dba8aba0a9a0: both patches still
apply (two hunks with a small line offset from the accept_memory()
additions) and both problems are still present, since
list_insert_sorted() and the sizesum accounting are unchanged there.
If Mike's rewrite is going to replace this code soon, dropping them is
fine with me. Otherwise I can respin them.

ivy
