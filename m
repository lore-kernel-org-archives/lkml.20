Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D894F30FD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 10:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861904; cv=none; b=FbWGRpJCsYbLcgNwD5OQMOM6UhgJb5Zqe857oak9eMbn5+9mzgsHjsL3XSTdbOzDKPQw/f4mao8+UKS5r3WHX0vBBGt9tlB0gsxSmRH0PfgXeu1YFQl6B4Up/ohhoGo+Hz4LPR3PTpI3qSp62c12SiBTvpqGc6x4DAmsuMo1KIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861904; c=relaxed/simple;
	bh=utEH7pUPEGRC3i+zZJZG6jYHf7HRvGc2s25CG7mpjLo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RgRzCPC9lkpS1llxU2H5ilhV9pyclF47G5Y29VsYTuM1zTG4bltq739VJWJilb1Biu+mEqadNJSWwshuruzdB/NSUuYEDW1hhl9TuO3UAYpcP9FUguL/sNhhQplRDmK7AVLc8S0OXVk8OqQ5QNmttmdbRj5nZtB+3MYHnEAkZi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: bdaba626ab6c11f19a56ed5b684f684d-20260908
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:9160ecb6-f921-4fce-816e-bb2e7480bf6e,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:bcf8095c4c0e4b78c653f45a7ab8f1a5,BulkI
	D:nil,BulkQuantity:0,SF:81|82|83|102|850|865|898,TC:nil,Content:0|15|50|99
	,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,O
	SA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: bdaba626ab6c11f19a56ed5b684f684d-20260908
X-User: liuqiqi@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <liuqiqi@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1521093866; Tue, 08 Sep 2026 18:04:55 +0800
From: Qiqi Liu <liuqiqi@kylinos.cn>
To: Vlastimil Babka <vbabka@kernel.org>
Cc: Qiqi Liu <liuqiqi@kylinos.cn>,
	akpm@linux-foundation.org,
	surenb@google.com,
	mhocko@suse.com,
	brendan.jackman@linux.dev,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	gourry@gourry.net
Subject: Re: [PATCH v3] mm: page_alloc: add missing hooks to bulk allocation path
Date: Tue,  8 Sep 2026 18:04:51 +0800
Message-Id: <20260908100451.341037-1-liuqiqi@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <c4c29830-ad49-4ca1-b4d5-6f40d30cdcdc@kernel.org>
References: <20260908065043.217569-1-liuqiqi@kylinos.cn> <c4c29830-ad49-4ca1-b4d5-6f40d30cdcdc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Sep 08, 2026 at 10:38:46AM +0200, Vlastimil Babka wrote:
> With normal page allocation the set_page_refcounted() happens after
> trace+kmsan. While it currently shouldn't matter, it could be more future
> proof to keep the same order.

Hi Vlastimil,

Thanks for the review. You're right — I'll swap the order in v4 so that
trace_mm_page_alloc() and kmsan_alloc_page() come before set_page_refcounted()
to match the normal allocation path.

Best regards,
Qiqi Liu
