Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.160
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727597;
	b=4JhDGNjpC68NVWyR56O6iVVOGCkDnGKOBJB0OvYOVC2uNO9VDc/1epAl9hiFvN0vXYz4
	 vsBEw4Hzu3XrPfoMy7yKR+q1mM079oLfMdrC3FewCZXbW+vPEo4MXLZsckyzvtX/LdYfj
	 Gg8GJ/rQ16bBnp7ELdwzOcZx/r6cfR/Zbe9YyTV+kxilPegF/uPw6mSMfhM++XrzDK7Dv
	 r6mcT1BZO3kXQPtbLxlVnZJwE/shTitiU+x21bxvnmRLpTYvEcn0EtSViHPjdaaFNJuIw
	 HI47Q7sCbC15HFGyujpRESDvg8gx+NywbXnlEK8duKVBkc0t3AuL9gczOueAiSQbJ0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727597;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=iWFIjtO8fXCI6gQg7xtksfY8ge2KYVwZr2dd9QfCdUY=;
	b=FBRCUl2bZ+midPdB+mQQgRwd7T0JInRIdS0d0tV8BMWyJ3YCFALkQKiNyi4bytnx8R0k
	 jKEggdqPDIFBIy3Kdkazqz2tWTZGKmdvj8E/PptJUvvgDK0t4DasJBWjRD/qC49HSEt1j
	 Upl6Eea3DhOIGsnRJ+RFmW3c6993M5/B43WhkwB+6oy8sjLKXc1AzfX79peEBDJB45eUh
	 5b7J7EbOt2wtVDfNlCJ/s78+UmCjtKKwVFlj/GVMRlkqoeKxcjs3jhvzIn6Ip1WOMnkMJ
	 fefg/Y5Vh5nE0uQIETCgPmoxo9GsfUFRoVSxMWMoPxf5Nyp/ZhAwyzZoIyjk4v/fa4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JQeUkzQY;
	arc=none smtp.remote-ip=91.218.175.160
Received: from mta0.migadu.com (out-160.mta0.migadu.com [91.218.175.160])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D249606A319
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:53:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D249606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JQeUkzQY
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iWFIjtO8fXCI6gQg7xtksfY8ge2KYVwZr2dd9QfCdUY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792727594; v=1; x=1793332394;
 b=JQeUkzQYWxbaTEtZwc8IJcHuWgNDBidRhM+r+sY0Nu6FaptC95GT8kJCqk7yX4qY3RC7L5FO
 yfJiVV534gEsrutA4IpJuF/GqXn9vyxOQ7a3dX3MH0PUYMKvDWUffetOanMw+fdDyjdXvWt6Ns3
 cbMkWHPPx5sRxbCYtPJg8zLk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9bef591184831a03;
	Fri, 23 Oct 2026 03:53:14 +0000
X-Mizu-Trace-ID: 9bef591184831a03
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
Subject: Re: [PATCH 11/12] mm: hugetlb_vmemmap: unify vmemmap range restoration
Date: Fri, 23 Oct 2026 11:53:02 +0800
Message-ID: <20261023035302.39047-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261020115824.823278-10-songmuchun@bytedance.com>
References: <20261020115824.823278-10-songmuchun@bytedance.com>
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


On Tue, Oct 20, 2026 at 07:58:23PM +0800, Muchun Song wrote:
>Restoring an optimized folio and rolling back a partial optimization
>both restore a vmemmap range, but the operation is currently implemented
>separately in each path.
>
>Use a single range-restoration path for both cases, making rollback an
>explicit bounded form of normal restoration.
>
>No functional change intended.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---

Don't see any behavior change, LGTM!

Reviewed-by: Lance Yang <lance.yang@linux.dev>
