Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F972EEE75
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 02:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.62.165.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789353547; cv=none; b=ePw7RG6Q4KC9f1ZbiTJRnU7MrQ+0L+RHln+Fy7StEAMnFmfoIPopiyQI8ZSyvOBNrVUc1sOBwE2IzX6Jim08BxUWJ8K1r0ypdaYjG9grokARZT2GZp7da5U9wuxKYGaCnYszdyLnzgSTLCDQNyjEXEpAxnquHEd3cp6KBoiolP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789353547; c=relaxed/simple;
	bh=X+r26DZeXGkG4Gm6JHRMLQCtkRNZcoO1td8ymPS5HRI=;
	h=Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=gilfDfNEY78NsXkaIDwXkQDJWZa+uMvKE9Goqk91wLJiCAIDHPgN3cDNFnmgVDJ4d5YQfVcCxIGnmcxDL1IEO6E9BMEXF8N5/Gxcf60XXtSr/Z47bN4sC2cdoTsmTl0LU/r8bE9thY9O4RosdNpD3D4Fca/5PdgeT1xmkHVXOXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=183.62.165.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hjq911jHXz5B13b;
	Mon, 14 Sep 2026 10:39:01 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 68E2cu3o020377;
	Mon, 14 Sep 2026 10:38:56 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 14 Sep 2026 10:38:57 +0800 (CST)
X-Zmail-TransId: 2afa6aa75e413e0-9f4f4
X-Mailer: Zmail v1.0
Message-ID: <20260914103857462iSBgwGihbRU3F3tXr8zwW@zte.com.cn>
In-Reply-To: <20260914020944.664339-1-xialonglong2025@163.com>
References: 20260911160421076_KNXun8Mpp9Xj7fxHG0i7@zte.com.cn,20260911161333316ISAQaj9yJhmglKT5A9OnK@zte.com.cn,20260914020944.664339-1-xialonglong2025@163.com
Date: Mon, 14 Sep 2026 10:38:57 +0800 (CST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xialonglong2025@163.com>
Cc: <xialonglong2025@163.com>, <david@kernel.org>, <akpm@linux-foundation.org>,
        <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>,
        <vbabka@kernel.org>, <baohua@kernel.org>, <ljs@kernel.org>,
        <ziy@nvidia.com>, <xialonglong@kylinos.cn>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCA0LzRdIG1tL2tzbTogYWRkIGZpbmRfbWVyZ2VhYmxlX3ZtYV9sb2NrZWQoKSB0byB1c2UgcGVyLVZNQSBsb2NraW5n?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 68E2cu3o020377
X-TLS: YES
X-ENVELOPE-SENDER: xu.xin16@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 14 Sep 2026 10:39:01 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA75E45.000/4hjq911jHXz5B13b

> Thanks for working on this.
> 
> Patch 4 addresses the mmap_lock contention problem in
> get_mergeable_page() that I reported in [1]. In that thread, David
> suggested switching to per-VMA locking [2].
> 
> Could you please consider adding the following tags to the commit
> message of patch 4/4 in the next revision?
> 
> Reported-by: Longlong Xia <xialonglong@kylinos.cn>
> Suggested-by: David Hildenbrand <david@kernel.org>
> 
> It would also be helpful to reference the original discussion in the
> commit message.

Of course. But the series is still under review at the moment, so let's
hold off and see what other maintainers have to say.
