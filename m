Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792640648;
	b=t7mB6ov0y36nnD4i7PQN5F/wtPGxiQT3jF73A4MGZ46UNtR5OjTmpntWG8dbPF6oWjpF
	 hQd7HQydk1Qqee650JFzzcXXZsn7uwikeiP47oMvf4F07omEPUKV+0bVahPD1yMe7hlnI
	 xbdGWv7ldAgFj9rWDKOenrXamjyk1l4r8yo0z00uBXHrIolrsq/g0QeTZaNp1avsrrxy1
	 GaOoI9OKQV/m1xPAb80FTbQKv+oxbrr9wM5o9YcphAiiFyE/vh3sWl/YOrS0Vg/wUrCGQ
	 c4qE5SAWmFS6K9elS+iWRQxV6zttjOiCB4QaVkR0/Su0vtpj7GnAGE5bOkSem6mHC4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792640648;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=IGL2LF3kJfnJotSm7Ou+7Cd5xevBu/wfRGoJVJcdsiA=;
	b=tx7XdGSUFfk2ATQ6uhPiebMkD5VRd2LoiS9soCXVY76WKVymBdInY626RS6PCrWMPpkf
	 sB/BpV+PLFH4/8fye8bG61pjmLiJzMaU7pD6HKo3hq51ub1CudYUuQS8vOESoSjt4Duio
	 0wRF8hdchS0uB3kHKcb/JKAzokn/Rb7nDUl+ijdnxVVKLV3w5RLiR+RnsuwVHBJ94+CJD
	 ze4Si+QgZk6KttiFsWcZ7/PEPAy5XAJDuKFzJCLWBKyIAwGlgNHAs8+vp+8Kiu7jSDDNQ
	 Jb5/ENpBAlhJkeU+dL7CB8FT3BQZkYngo4VaLklnFl9T2Mw+fwoo2VH5TmFYj2a1o9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EemzBdJL;
	arc=none smtp.remote-ip=91.218.175.35
Received: from mta0.migadu.com (out-35.mta0.migadu.com [91.218.175.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F563606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F563606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EemzBdJL
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=IGL2LF3kJfnJotSm7Ou+7Cd5xevBu/wfRGoJVJcdsiA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792640645; v=1; x=1793245445;
 b=EemzBdJLgzf4lhA6aMHbAJOCPffQw+e5zVl+lHrgS2T1nZecoxmi8smyCmiKdWunBwVwltxe
 NOBI5nKmzuWGbL5tPS2iywxbAsiabv1KJrIgSRQ5eJqABYN7wtpc63zzCNBW5Duq2D5YooU/aFP
 2GQEogvLzX5FHGJ1umDcUGYU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d29a87ff2bdc911e;
	Thu, 22 Oct 2026 03:44:05 +0000
X-Mizu-Trace-ID: d29a87ff2bdc911e
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: osalvador@suse.de,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	qi.zheng@linux.dev,
	lance.yang@linux.dev,
	jthoughton@google.com,
	david@kernel.org,
	muchun.song@linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/12] mm: hugetlb_vmemmap: remove HugeTLB-specific vmemmap optimization macros
Date: Thu, 22 Oct 2026 11:43:58 +0800
Message-ID: <20261022034358.44302-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115306.813483-2-songmuchun@bytedance.com>
References: <20261020115306.813483-2-songmuchun@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Tue, Oct 20, 2026 at 07:52:55PM +0800, Muchun Song wrote:
>Vmemmap optimization is no longer HugeTLB-specific, so the remaining
>HugeTLB-local reserve macros are redundant.
>
>Replace them with the generic definitions to remove duplication and keep
>the HugeTLB vmemmap code aligned with the common optimization macros.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Reviewed-by: Lance Yang <lance.yang@linux.dev>
