Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.187
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793955060;
	b=jiNKKGnZf0wcfsiqcc6i3uuZsmpQ8Ol4dW/nIfuywNTniQVQVBfoADp6JxKyEuuFfvkS
	 U78y81Z75yl81rPgAjIOsuyPV7nebFA+a399FsLXQmCq791e9BKq26mQ6TXs6x+KyWTfv
	 02S49PwGGybzYNzQdDYdmK3VOpZydug6LiqS30KFGzMpG52dmANmyTpHN0i+T2prpmkTX
	 AAENzVivvCVLvOuX+TOqlnFC2h75D01L9Gg/Z8T+/RKqJVDiKClGyLZtWzGOm3uWDCZg5
	 mdtGpHxdfOaxrMUjNZGlBC3XzGvBlipxuIRZbATnIdXDFt9gTQoqLncqsCClExw4MyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793955060;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=MaBpahE5on5Sl4GYtu75lY6Lms5s0cdDMV8oWkRKTUc=;
	b=2C02NPBDXI6ayOrMDQE2TVtAEJCbhjT+lJjY4M2YPBIqsLus43EC8PxvuX5PfM1dRZe9
	 g7hPREa1qZv5sABLhu7P0HDLKkn+4UIM/4OejuRvpy+oYc9KVYtHZUvacZ74mlpqo3+iz
	 ZJZHYIRCjuLhUhNBuasHdZS0C9KbqkC5luDomwisitSvLyB+7vtMHWztH+aU2Nvs7baTn
	 QK2Qjys6P0hcTzKPO/6L3IFYitF5XNQ/V54yKIIcI8KBRt7NnAFD7V2TBOsrHNic6oek8
	 5wBkxzcqG2JAttdhnqG+ywbC/KWXZLt3lNRdJTdyndtA9pQ7L6PAig/QM7d/gMtZVjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwgvHP45;
	arc=none smtp.remote-ip=95.215.58.187
Received: from mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEDAC606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEDAC606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=hwgvHP45
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ws20T3ir/rSpZSbCcrdGuZ9EK9Lt6saLzdZjYEVOCZo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793955056; v=1; x=1794559856;
 b=hwgvHP454oznGGxqb9vavzgk5HJtDzCEynbqsPa5GrkJ4G9+K4zF4EmsHw3QDxrkNyU8kVwE
 b63VDpJ1Rj2HCyEJU3Ibum6MbwJo/sMDmg6B2OGG2N9xgeGzWmIeuenrhiqy7u68nhOmB4CkICW
 PmCcnc8rXGAd+gDNeV7Xq/ek=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 4b52ee87e83fa511;
	Fri, 06 Nov 2026 08:50:56 +0000
X-Mizu-Trace-ID: 4b52ee87e83fa511
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.200.71.1.16\))
Subject: Re: [PATCH v3 12/12] mm: hugetlb_vmemmap: make vmemmap PTE conversion
 folio-oriented
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <auxL1Q4S9wllEn6B@localhost.localdomain>
Date: Fri, 6 Nov 2026 16:50:37 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>,
 Qi Zheng <qi.zheng@linux.dev>,
 Lance Yang <lance.yang@linux.dev>,
 James Houghton <jthoughton@google.com>,
 David Hildenbrand <david@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <22FB374A-CC9F-4F9E-B510-88F71EF89119@linux.dev>
References: <20261104023510.260766-1-songmuchun@bytedance.com>
 <20261104023510.260766-13-songmuchun@bytedance.com>
 <auxL1Q4S9wllEn6B@localhost.localdomain>
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
X-Mailer: Apple Mail (2.3901.200.71.1.16)



> On Nov 5, 2026, at 17:26, Oscar Salvador (SUSE) <osalvador@kernel.org> =
wrote:
>=20
> On Wed, Nov 04, 2026 at 10:35:10AM +0800, Muchun Song wrote:
>> Converting a folio's vmemmap mappings from PMDs to PTEs is a =
per-folio
>> operation, but the current interface exposes a raw address range and
>> hardcodes deferred TLB flushing.  This splits the common mechanism
>> across layers and couples it to the HugeTLB batching policy.
>>=20
>> Make the folio the unit of PTE conversion and let callers select the =
TLB
>> flush policy through the folio-oriented interface.  This keeps
>> HugeTLB-specific eligibility and batching outside the common =
operation.
>>=20
>> No functional change intended.
>>=20
>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>> Reviewed-by: Lance Yang <lance.yang@linux.dev>
>> Reviewed-by: Qi Zheng <qi.zheng@linux.dev>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>=20
> Reviewed-by: Oscar Salvador <osalvador@suse.de>

Thanks for your review.

>=20
> But I have to say that I would put the vmemmap_optimizable_order() =
check
> upfront in the caller, so by the time we call vmemmap_pteify_folio()
> we now we can proceed.
>=20

Since I'll be sending an updated version anyway, I'll also remove
the eligibility check from vmemmap_pteify_folio().

Thanks,
Muchun

>=20
> --=20
> Oscar Salvador
> SUSE Labs


