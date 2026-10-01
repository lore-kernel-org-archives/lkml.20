Received: from mta0.migadu.com (out-247.mta0.migadu.com [91.218.175.247])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65263A8722
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.247
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870957; cv=none; b=Sr9tbF6t442nMWoO48XuGYe8VECwoSAQFEBr0YEp2sz3UZmmU+6uaaRdqCxxLGmYYUHgQR49ptfM73pnoOfN6nJAWDc8Fft7OV0g259ypRF1AAlfYltKPWw6/+ZYDVbYgsPIgoROCjno62a5vA40lAxHNhc6wxAssgSwFdMxuLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870957; c=relaxed/simple;
	bh=m2WhXekatGyTe7NNA2QDA9cNUaDy0yKLA81NRXFUVU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LQTyYWyJOlM1v3w7kNyGOIU5qL8tLsGdVnd+S6IYB7AGCdiH/IqG06FlXGnRE0ZVtRztgO3xN4k13ITb9CL3xXlCkg5KzOk1HPPgKnbvCoup3KnX9rrAMc3zt+p5KvVMpI36bMS+pQmtpQyIuujsM9osWoPGb03UPBkPHacbwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QVBbfxux; arc=none smtp.client-ip=91.218.175.247
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QVBbfxux"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=m2WhXekatGyTe7NNA2QDA9cNUaDy0yKLA81NRXFUVU4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790870953; v=1; x=1791475753;
 b=QVBbfxuxgsYOrmjIcMSb0o43Duk2Mj2lXbjKD2+nC0HWiqdCb2VIC5EzrkeCyoxIMnRwV086
 8TxEEnCIaDp80rwWDHlKGgjqVJ/04q3CTGGEx1Jy31O2Af2/myWegCaeMiqGyadEcOdGFWLKCIe
 1qqH5X0KwsFlAMkNZPZaQIzc=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 991aeb1c7099deb0;
	Thu, 01 Oct 2026 16:09:13 +0000
X-Mizu-Trace-ID: 991aeb1c7099deb0
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	qi.zheng@linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	muchun.song@linux.dev,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v3 6/6] mm/mm_init: add zone mismatch warning during page init
Date: Fri,  2 Oct 2026 00:09:07 +0800
Message-ID: <20261001160907.25429-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260929053231.66085-7-songmuchun@bytedance.com>
References: <20260929053231.66085-7-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Sep 29, 2026 at 01:32:31PM +0800, Muchun Song wrote:
>For vmemmap-optimized sections, tail struct pages may be backed by
>shared vmemmap pages. Those shared pages must carry the same page zone
>ID as the struct pages initialized for the section.
>
>Warn in __init_single_page() if the shared tail page has a different
>page_zone_id(), which would indicate inconsistent initialization.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>Acked-by: Qi Zheng <qi.zheng@linux.dev>
>---

Useful sanity check :) Feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
