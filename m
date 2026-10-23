Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740794;
	b=LDw6kISzemjB5yTWTLC7jAD9K7biEii754a/BnqWpalHSOc98BBHL+KKiAQzBGch11eQ
	 wBX8LVA1puLY8U6uNwwvAIcw5Lqgyuc2VPDv3FHp86dEMc6JrMg8dgNzErH0GhJE+D62q
	 u5D+f+wLMw8N8FOjgL8XJvPmKrtTI9UhlMtd7med2wugv4h4gs0MSb9d5tPAg5JQVafR5
	 kIy8ABDDgCynP6CPicr/MvCCNZLhFmdqnnQy3XSPtVQY4VV58rdhIV+yf3m52zc09zuhs
	 KpyKY3aa61fGdbFs4fJMtqU20jdPsHEUvJOnZTJ9/awSVS4wAL1lCqwoZARK4q4PRDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740794;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=GCPeXdVtsAIGZmNIgcd/gdVcV03xEPsGBvi1mGdnz00=;
	b=wArpKe/+Czjs3WUxcX+BTq3QYIzE3z55p64LuJNknmzDtw+Ad0VxpTPhMkJCPR3BVgWl
	 UTYmVogVOgz0kdEXNgr6WX4wm6SuJGKKPBY2lQ3Fb5mXvaTrbbdsLsOQARUWC6iHh7B8/
	 n5+EE53EubLwHrUsEfze3dPZ/6mPCDBA/KYzeVN/JaB6LBvRfnSnZ3qqcw1MzgkC4V1QT
	 gkbnMy+aAblfeHDdgpFOW5NLZTNKhdfI+8ik6lBTbt/sRXc41cKLiflqQoo6vUqmC93Q0
	 FmXbOtu0w5LwIXFGvO+iyFSMfWvFP898Pne8tIoGFH6EvoI+vus+OWdeyX5/V35KDZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EVbRIxhR;
	arc=none smtp.remote-ip=91.218.175.6
Received: from mta0.migadu.com (out-6.mta0.migadu.com [91.218.175.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35840606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35840606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EVbRIxhR
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=0k5lukGRbTSNqdymG8Q7jy3MBEvP6PLNPDsNCvsgCNU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792740790; v=1; x=1793345590;
 b=EVbRIxhRd2WKhWwLCBLWHeEPX4x+INc6XdqV7wInMLUbJnSQGRK7n9CATxTQrslUzhy8jD6p
 z64DZ2fv3cFW5Z+aTWz+EAbjexpgWsHMIAMTifzjcIixWAcDWR8az8lYvkPhBK7K/SutmBv8Css
 foFRytcIx1nZTiuV4hr3KABg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 0fec9d0276b536b5;
	Fri, 23 Oct 2026 07:33:10 +0000
X-Mizu-Trace-ID: 0fec9d0276b536b5
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
Subject: Re: [PATCH 12/12] mm: hugetlb_vmemmap: make vmemmap PTE conversion folio-oriented
Date: Fri, 23 Oct 2026 15:33:03 +0800
Message-ID: <20261023073303.66682-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-11-songmuchun@bytedance.com>
References: <20261020115824.823278-11-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:24PM +0800, Muchun Song wrote:
>Converting a folio's vmemmap mappings from PMDs to PTEs is a per-folio
>operation, but the current interface exposes a raw address range and
>hardcodes deferred TLB flushing.  This splits the common mechanism
>across layers and couples it to the HugeTLB batching policy.
>
>Make the folio the unit of PTE conversion and let callers select the TLB
>flush policy through the folio-oriented interface.  This keeps
>HugeTLB-specific eligibility and batching outside the common operation.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Nothing jumped out at me, so:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
