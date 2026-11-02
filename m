Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614742;
	b=UGGpeyLDZ0BTHHtJ0H0RS9Gp9gFDHesfqbEBOBjGcqnxn41v6KZWJ91jEzMz22+Mnj4a
	 bAvaxzhVEQrewlvJNIlmfWYG8V5JPzMl2NVddrrdkG5N8XmiQLKLqJS2tgrrcDPnaYt1Y
	 IMICZ3BcarVUCcqkVHzQ5jnh72Q/Jxl3yH04qNA0elfVTMVClsz+S937G7pR8Gv7Sl1IQ
	 zEcen6hRP8/SgqCd21qx06coJmsonlFeYa088Q7P8+uwzulx1BxnScQvPVVSo+Ym8vPpV
	 z3Fj6pgUdz6u7BQfgTFNOOv8ONSZ/oF70qW4gT13LtN5QXecCDcCLht9UMQXQgRBi6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614742;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=JizxB9+/O2FYFC8VNtmlHXhEXe7Zkla/YOFqDR0abiA=;
	b=xuELilquqjymEes7YvIiLmQmVXNCDEEAGYwoGvMlLPoYNBzniBSH56X/X5rPJfo6Orq1
	 NIsnqbDjt29H+I3IBXQEKuN000m6x/2eBWBp8+GUav+L4ZksHyPWnHr8uOqJrKPiuVCPt
	 9KwWKp06OdZ56MWaAY6RnWQuznUM/YO71w5/EOov89AgOpNnYkbrW9+toSgFvYI3w/D2o
	 iiI8ZxXEvjA7n76I6fVq5J5gTUzNQp76tnQqQOHoKcNjnXFZRVOK9u9MJiIdEd5crTRGW
	 TPwxm+Y/MOojvyTJVAGtns/RBvAvWaJRdGK9cif2UYqNFsyWUE3TxvjhJsMFrMulVBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Vs+/+xid";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B26660A3812
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vs+/+xid
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C0B1F00A16;
	Mon,  2 Nov 2026 10:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793614742;
	bh=JizxB9+/O2FYFC8VNtmlHXhEXe7Zkla/YOFqDR0abiA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Vs+/+xiddGPr0d165YhQo+3HBwEpVZ5d5eHPOjFpwf2NHdVHmNbVoTEJRPYta/Ard
	 xhQRO7ndR3XkS/bIPf6GzLnqVqz4iVKXC/S8XZ3P9Qf23uyR65SdYiteSdF2zrcWFk
	 MWyQLVMhwJ7Yv9BW8sWc5QIesiIVYlOBJFsbMoxx14fieHA0UM1pBhb3kJNGENQtR1
	 DAfh+QJdhh78jiYBMUjFLA8gNkT33jAuC6uTwLlaRf3HwQRqpOOyYt0ILjwSfnrjDU
	 hgPvvr4nDCX6Z6bI9lefM5IeJnaFY/PT4u54hRiYcNdJYvudF4MYaM6gl6V5Nr1xwu
	 KHA/LJwSvqc1w==
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
Subject: Re: [PATCH v2 09/12] mm: hugetlb_vmemmap: make vmemmap
 optimization folio-oriented
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Oscar Salvador <osalvador@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Lance Yang <lance.yang@linux.dev>, 
 James Houghton <jthoughton@google.com>, 
 David Hildenbrand <david@kernel.org>, Muchun Song <muchun.song@linux.dev>, 
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261102032525.3597743-10-songmuchun@bytedance.com>
References: <20261102032525.3597743-1-songmuchun@bytedance.com>
 <20261102032525.3597743-10-songmuchun@bytedance.com>
Date: Mon, 02 Nov 2026 12:18:31 +0200
Message-Id: <179361471105.1337633.3204394103246469526.b4-review@b4>
X-Mailer: b4 0.16.1-dev

On Mon, 02 Nov 2026 11:25:22 +0800, Muchun Song <songmuchun@bytedance.com> wrote:
> Vmemmap optimization operates on one folio at a time, but the current
> interface exposes a raw address range and requires the HugeTLB caller to
> prepare part of the operation.  This splits the common mechanism across
> layers and obscures its natural unit of work.
> 
> Make the folio the unit of vmemmap optimization and move the common
> mechanics behind a folio-oriented interface.  This keeps HugeTLB-specific
> eligibility and state in the caller while making the remapping code
> applicable to any eligible folio.
> 
> [...]

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
Sincerely yours,
Mike.

