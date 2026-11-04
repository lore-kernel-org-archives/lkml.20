Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833544;
	b=5O9+kPiDkO4f32MyR1JLDUN1ZVIJX478YF3X1HywBPRZQwIrfq3qiIAe3tKln5QcTXIG
	 8cxd1HuVs5/TBdELgyt3lt2WNMt8MRo8/lRghD/tKjjf6UJZLDUD9Qj8nxTmqZbOE7V8x
	 Ommg7tEd+s8tozwTBtZrAc4ZE65nUkBGkKoFw2A//C3XckzIsVi3H9t4Qqg9WpcvtCwZ4
	 OzCkHIdtLmv1kOAo2QGTokfUbteHS2ozxUW3LSY+iBApV9BD5OY54woGotRcmFYMfLY/j
	 sGUltHU5RRIkDfASe5rRjrGhxFDDoiTFHxZsuqa6Pc39FdxQfTiENWKgyp1vhKoaBew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MOpStKtlaMBvTw82l7hk12nLoKUsFYT90GYDj+kAndo=;
	b=rhtT2rl+EzpIVVdfe0BP0e1NkBQrLgduoGSx43uovdYY8SRka066fgzmHqYs3FwmzCXS
	 kpGHMAMRqnckxsAB7mpyo05o6b0glo1BnKQSfBmxvOKjjUTsRAPmUy1OO/vWzCInGRdQX
	 /rl1o64zOnKkEOwiZIQ2ZD/egy5VG8Ac+Xp0MfjPZR3qhdVrRYRS9ihgGj/EXRzJHpt6P
	 HOkf2G+IVrkZuO8FWHb43hP0M27ObUbwssrFrh5vabM7ixAoFe05AUrYQWRp4YPj3rSIr
	 8X2GvdIXkt/fJqUHYPGmLlXt4Ov0JWUV53iLvaR1HcjhLmwxZpG/78IZGW8fmxeyC0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCwcKa7X;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3271606D80A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3271606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCwcKa7X
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a5036bbac7so7665835e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 15:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793833542; x=1794438342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MOpStKtlaMBvTw82l7hk12nLoKUsFYT90GYDj+kAndo=;
        b=sCwcKa7XbJktqL3hxABBeqm06+tWavHjtuY13tBflSMCRtQb+wZIupMviVt6gaX6aY
         Gb9TJwBPCahNivxGH/4ZBVweXRACmfAUBmS5eRN1ZkDU69Anp6MagJP+cxNGL7+tJgXz
         p+Kcz18jfYceosvOUAwRmqY2+5tFQcQ5tQ2GQkpZ9xudcmbmi/Qn0s1Cd1Xza7qUK+NZ
         /vH11hu6YvBS6n6hCopNr6WXk9fwzMrVX5v74pOHwKCe8+0dkjS1vNPQjdXhvQTlu3Ac
         HJI8b6gp5lEsT/akwfpznC57AQHWn+lgT1UC70Yr97MslML0Ty938MRMwLso/ME8upGI
         bZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793833542; x=1794438342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MOpStKtlaMBvTw82l7hk12nLoKUsFYT90GYDj+kAndo=;
        b=1t2gcdhB5Le5Ze/fr4nliOb8geCIS4QpdRUBdWzrrClgD9NTQRG7Z5daALSdOAScYW
         hoh2P0woGZnfEO4hOrLoYq63BmCww6pZQNe+huJk/aZipp5GxfbUehSlOqLQTMwzjgbD
         LuWj04/5PbymKcVlNu9j2BTdErwJyTk8G2Zpa6Wfw0mb3DeqoPlCjP3rReDmsWo5tjfc
         B6spy5xWNs7T9h9VzQ40jvjEfkY+/BslTUeeHBi+WX8SxL6eZnsq1eUGsS91YZZS3seh
         LyLOaRGLUzLpy6QiCmoQ+VOJo3DlQUV25CqNhTrHop1vuivfMLtW0yDOTZLALAIVuAut
         0F1A==
X-Forwarded-Encrypted: i=1; AKwUvBwNoBEwnl+tvXgMwRyaC/CMcRwi0ZDvYMFVfMTboSn7jBjD+AszcGYyLcAjqr08JqDFsUgKL8vW0UrgZlU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Mw0RqgHpgPLqs2fiikKKG6hXqvXqZziCUy/XMc+fEQvgNlGr9
	95VZPZhiYkDTkDaokGC/d6hNBYOAugv9+yccMHHHJGRW/j83Cm5R5vq/
X-Gm-Gg: AYBFou1IROE3u3Yc3FaW5FyYU4yvgT+lGLg/j/pa2wofZmgi/22vTjO9NrEJuDNpXVI
	ESLvIiZOueR5mgK6opvu7BupsIsO6iwZMZxc+zTpL8xfciSYcbtHFaM7fyhE3oLNjX6W//XMu+O
	4BvB6TZ1SYNJtZfvmWxg2Q3hcRQAB4chQHyrbDYyXO5RJ5PlLB3lQ+84N/OMZmooeCxLNOzIQS5
	tmYI0EEhW5i+s/IzWAim9kWfYOOdzxScuJA/w2vD9PT6gVir5cb7rzNVBe0467mgz4jjArEBcEt
	l0NUMx7F/xv+GD6iAYDDUeIUT06G0IRorxE+ANBo6pwWWIcaj+NUCwMDEAs4ugRIgAY1FD3NhRD
	FVENuh8l59fFiA0Vi/jJrB5iXowKG+Dxrw7Qlb7UmLE+lAuKfNyCvHx50GGaJrry28T/mMAawuv
	GVjepctG5tPDEyMimoeuJDsuNIEAe/HZwhGLE07G3Blyb02DwJapskMOunBhIslamMn/GZ7q2KG
	M1BQSgKJNVhmJ53JoAM+3MJSxkvYYk3Uo2F05PIiWd9+EBSqLg1aXbeKQEJvJhH8vHvaEoFXlpZ
	KprFOaprf6IgxOMmiWFu8Ho=
X-Received: by 2002:a05:600c:19d1:b0:4a2:677:ad8e with SMTP id 5b1f17b1804b1-4ac1970b9f7mr379985715e9.34.1793833541916;
        Wed, 04 Nov 2026 15:05:41 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed5538basm5998977f8f.44.2026.11.04.15.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 15:05:40 -0800 (PST)
Message-ID: <853a133d-f332-47dc-b7f3-eb57f34d9344@gmail.com>
Date: Thu, 5 Nov 2026 00:05:38 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] mm/huge_memory: copy file THPs at fork like
 copy_present_ptes() does
To: Konstantin Khorenko <khorenko@virtuozzo.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David Hildenbrand (Arm)" <david@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>,
 Peter Xu <peterx@redhat.com>
Cc: Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org,
 =?UTF-8?Q?Lo=C3=AFc_Molinari?= <loic.molinari@collabora.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Shuah Khan <shuah@kernel.org>,
 linux-kselftest@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 stable@vger.kernel.org
References: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-0-c56d0d26f970@virtuozzo.com>
 <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-2-c56d0d26f970@virtuozzo.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-b4-prep-vstor-149847-copy_huge_pmd-recheck-special-pmd-v5-2-c56d0d26f970@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 9:40 PM, Konstantin Khorenko wrote:
> This fixes no bug: it makes fork copy a PMD the way copy_present_ptes()
> copies a PTE. Until now copy_huge_pmd() skipped every folio PMD of a
> non-anonymous VMA and left the child to fault them in again, while the
> PTEs of the same VMA are copied.
> 
> Treat file folios as the PTE path does: take a reference, duplicate the
> rmap and account them. fork then pays a reference and an rmap update
> per PMD, and saves the child a fault per PMD it touches. The next patch
> sends PFN mappings through the same tail.
> 
> That covers the VMAs vma_needs_copy() sends here:
> 
> - private file mappings with an anon_vma;
> - VM_COPY_ON_FORK ones: uffd-wp and uffd-rwp, VM_MIXEDMAP, and
>   VM_MAYBE_GUARD, which shared shmem, file and DAX mappings get from a
>   guard region.
> 
> The DAX huge zero PMD is copied too, with a reference taken by
> mm_get_huge_zero_folio() as for anonymous VMAs. A migration entry of a
> file folio is copied and accounted like copy_nonpresent_pte() does, and
> made read-only in both processes only in a CoW mapping. A device
> private entry gets the same CoW check, as in copy_nonpresent_pte().
> 
> The copy then gets the same tail as __copy_present_ptes(): write
> protect both sides in a CoW mapping, mark the child's copy clean in a
> shared one, and drop the uffd-wp bit where the child is not armed. An
> anonymous THP is now write protected only when its PMD is writable, as
> a PTE is.
> 
> A page table is deposited under the copy where the fault paths deposit
> one: in anonymous VMAs, and wherever the architecture needs one.
> 
> Cc: stable@vger.kernel.org # needed by the next patch
> Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> Signed-off-by: Konstantin Khorenko <khorenko@virtuozzo.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
