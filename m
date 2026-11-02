Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614736;
	b=mjENzNIgj1xLJk5WK0nz4edMkOSSzoOEQ60kmzALfeGbxFh3RR9yy3xeLN/FpZXUZXC9
	 gxoBvrkcYxTJ+18eDk2+7QyhO45HhSvfd+jHo7ZEQ2fdoH9wpRp08NIfcxlUp8neupsoD
	 48vnLqPmTFYwOd3JsKlYfM0TdtBdE/AbJoue7x7qSoK1J8Gv38cBNf/cggEjwZIx3eHJV
	 qmHZ9DOoibBlyLEkRUo8d/enMX5o6vIYKvpuyknFQOLLezmQmAZcEqelv4wFu32r15lGh
	 ExQqMoQZDSbjsobtCi9UedMG7qSxCt6X/jLu3e2kdY6aTzhcPPlF3dNTm3QzGKuSi3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614736;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=7NDwhp7QJiOHTlc8/aRvhSK4SA3VmvKNMth+l08RDl0=;
	b=XPgLsnx5DEVcufQsSx6Lu7nNZ5henZAijcJaC49ufKmbqXv36Y85Ot/3Vnv1hI5m1CXT
	 NFGOugtRxJxHM4hGkldtXk1lGAl3svlU80YfeB2fHR01RIAdn4LucSdDJO/R0TW5hYdK2
	 J1HjvZO3Co6CYtrf0Jo1yYGWE/PyTBRRubRRldL2cGvylMvTaPQOh9T25omXDEDD2Q5G+
	 KmFwVqKIBlsEUFbPqaUdho7LOqzLQ3FeNh2CbfePVvjotpZwidMKWy5YfbEmYg38G9iYR
	 vw4YaQh8dZpVMTOCUHAjz7ErMAFQ6md0KaN6ez6fSpZFpn6Dsc8jKu0oWqzQBZ+Ydig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMbzK99u;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A06960A261C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OMbzK99u
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A36091F00A02;
	Mon,  2 Nov 2026 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614736;
	bh=7NDwhp7QJiOHTlc8/aRvhSK4SA3VmvKNMth+l08RDl0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=OMbzK99u+uG/LJfEEGDqe+8KJ6mR6VDDU7f89GuKcmdSVZ6WVd+fj3Y4ho+NjlP4e
	 ZxPo1++VhQrM3ej1YhX7ZWc1rrtU54MHZVQs+X6O4MbF9hSrQeTha2Fk7Ua1iqZEsn
	 eqv//R2HW7rB9RGTxRnLCZi9ZKw1ZWxAhHkQhCpVgE8VlywTEP5acPGZLDexdgnmyg
	 uSBGSBnBxzUBM28UJu2oeT2Lu7i5rKOZRAKREOuzrEDXPNMumrEQUgZslNGLDr1ChC
	 aBDAGM2NHD2Ix0wUpthu+3WpX+oZM7Fig/e/XXzcJ9jLui7JOwRvlv16FF6X5lGq1q
	 /DmgEcWkCrrTQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 07/12] mm: hugetlb_vmemmap: simplify shared tail
 page handling
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-8-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-8-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471104.1337633.2887300135309297128.b4-review@b4>
X-Mailer: b4 0.16.1-dev

> The remap walker currently carries a shared tail page selected by its
> caller, even though the optimize and restore callbacks can derive the
> same information from the folio being processed.  This adds redundant
> state to the walker and couples its interface to caller-side preparation.
> 
> Derive the shared mapping state in the callbacks instead, keeping the
> mapping policy with the PTE being processed and simplifying the remap
> interface.
> 
> No functional change intended.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

