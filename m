Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792729695;
	b=rkLTzJAtPKfEdLcLEqcGm8z4M2P5OfkMza4mb+diquetZLzQ/dxbN9j/Hh0wfHuCi6T5
	 Rq1kxFi9OWuZgpW/e5CmMPyKVrZyn61ApzjPqaA9JJJi8Ut/RwbLFcf/UsnuCjNShZwih
	 Dtx4dkUB1dC2/3YSO3XI6wM5P75gXV37Lg1i9UF4TIPlWRRhTMf48zN1ucu6RrrKgJYXe
	 Irf/bu1oUJA3kXGZYx9o8PG/99bbOo4101E4QsrYA6h1u3bQmr5LfG5zdu9cB/EVUomW5
	 bgBAdyCPAJ9p+XXSs0wD/9g185F5PE8GXvaeHFlChA3k9jX7YnvqgcQfvcFCqHqrcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792729695;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Nu5uEei7n9brV9oWN6L6NOvP4crSUbqHwY6eebJuz88=;
	b=3ooX1aRLKyaiFBtht8+0r21lfrmXhsD9RTpMNCSiPMV3kCbC/RNmQG+Zi3sSDgBdhPYs
	 sICmavZXsrRkO0veZGzpUGoNw6UOjt89RqFHZRR8i1/0BDO5F4N+o3eDoZyDmy8O6JB7X
	 9Eh59PqHy2ReI/1gpogNUKX6kNMvCloNQ7LZtcDLdSmcgDolrNrwuCjEbw/mjdCffaDc/
	 a/EQKijMcc2y4M6/B8U3twDcfOeiZi8qupxIEPFToKJsOXWx8ANWOM23TJecMdZURNKtg
	 N09yxGIOB1BGnmHaqltfTb+WYMw0cgyeuKBR7kGI6oGwHD8OcWRICW5hDm++KJTgwDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b="Hi/O76tS";
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8757606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 04:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8757606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Hi/O76tS
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8ab432273c5so4434697b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1792729694; x=1793334494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nu5uEei7n9brV9oWN6L6NOvP4crSUbqHwY6eebJuz88=;
        b=Hi/O76tS/5VX2UZzhmbXhOtxOu/ptGPXyr0AruI2iyow0GMiAtjDidP83HEI9ZFphQ
         MKEogSnyEBPPKI373FMSbHaT/90otSzbWYBW3uRrD5bCrhbQeVCeroDZwQM/Ljk+gZps
         5ukN2eZ3s7d+csCiAqtx+SBR1x+LdTM0XZjI6SM+TTVVT01E0P/et8NpAMPaTyJK75fu
         RXqotWioQlgzJrOq6ZXm6lJ/Zn+xnQCEYT0LOIBL9LPKZzT8O5d0THYdMjM3K6/B0Dau
         e2vdU0CzSSl8ECGVPBIbRWTVceupMcXzdfSYzlRQKZ73GRHyx2HqF5j8N0TuTMsob59h
         LdMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792729694; x=1793334494;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu5uEei7n9brV9oWN6L6NOvP4crSUbqHwY6eebJuz88=;
        b=RNwlJoDRIr9fLKt0nXp/gsYn5iV/kTOv67rQexudTEcRkg4g01hAa+bPb9jRT6fYB/
         DWXsgaOVMkOxxhsuYRRvHxc2CrGRRkSLpvbABGleo7KA7NWY4N7+0w8suz5HoLzU3wKU
         9YUhcCE6B5ifJmV3iA7MitsWp9Sm4V2OXNgpN5g7/NoM+57/R8CjTrItXTCobO6EZPQA
         HKe59BFlxsmsnQsvxU7v4O6k/abVFUeyY6Q0CwfTo0nF9Fvx+bVMg+0U24+erzXPi2jl
         itiiyEuxBwJO4nehQnsx4O/kUFMtiRwtuK1JMB5ba0mJEnFI2T25W5cqaXJDBjqRKg/3
         7+ww==
X-Forwarded-Encrypted: i=1; AKwUvBwoKDTGecXauqlIz8z4izbptQ5EcxutVPTgeKGrXB2sv6epAOu4Qv1FQi/KWkMopzGCElQekJSOO/LNDGk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKALc37OodhP6VvpXXlBFm63AR8uVOGCz4lrV65eoo8slaQSySr
	82S0CmP8z7F/ymi9SyNLkWhoFknJhfZVyAmMqEcgPiVNq4f7wARE85M2kYWl9kS27A==
X-Gm-Gg: AYBFou2O+YGnSXQ3ZtkbXl+hyf2EzPo+YD3wuj2JNCgd8/XebQlH4fou/cjGflDayh2
	zW2HOxq10c7w0VS9pDBS5sB38HS2UQuae15rIt1dDUZmaBHREC9SdFrudYha8hNsiGiQ3zOyR1a
	/RA491w77sKL+Fo2XOCgrfpJTWddw62HUTkMskOjdatlUBXiYte80ZlW4uDgjmWbt6FsGwjCD4F
	NVoO0HWqLCraruZKUHnhZtyK6oShfF4N+t9YVpijdHjX3tB7tG3xfH6YmGaTTlx45jijoG5ZFLD
	J1HXYowBWMLmY1FHSldmufbX9Iew3p60PAT9UhiOfnO6qWqwJAs++zZA6gWIDidp3CSfC+xqY1P
	dH4ZxJUqfNM3CVcc1PUUl69V4aQ2S8WJYBakmWOl5ZgqXX8+zJ95od0au1jvTdVH2MMMyydVc+J
	5BP3zmP/6XMKXR7hdbXoZfkJ97oz8F5Mv1cAiAn9ZLbLMT5bAj8oHdRo4I9jbQNf4yxMA7r0YBq
	Ddm2WARYcZbcQ7zsF8fK1n27ZIhITQiIqdiKf5i6FRe1ggyC97gY6QsvrDWRuO241lekCqWqtPQ
	3jQ=
X-Received: by 2002:a05:690c:c510:b0:8a9:8021:5cd1 with SMTP id 00721157ae682-8b157ca79acmr10826087b3.6.1792729693767;
        Thu, 22 Oct 2026 21:28:13 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b1560cba07sm8375047b3.13.2026.10.22.21.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 21:28:13 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: yi.zhang@huaweicloud.com
Cc: linux-ext4@vger.kernel.org,
	tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	dave.hansen@linux.intel.com,
	akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] ext4: do not advance i_size on a buffered write that copied nothing
Date: Fri, 23 Oct 2026 00:28:08 -0400
Message-ID: <20261023042808.2336810-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4a0dc078-a3c0-4571-b23c-25a30d988d38@huaweicloud.com>
References: <20261009044656.1993196-1-hengyul@cs.unc.edu> <4a0dc078-a3c0-4571-b23c-25a30d988d38@huaweicloud.com>
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

Hi Yi,

On 10/23/2026 10:00 AM, Zhang Yi wrote:
> As Jan mentioned, this issue actually also exists on the iomap path,
> although in my view the current approach can fix the problem on the
> buffer_head path.

Thanks for the review.

You are right, what I wrote to Jan was too strong. The iomap path
faults the source in first, so the reproducer in the patch does not
show the problem there. But iomap_write_iter() still sets i_size to pos
when written is 0 and pos is beyond i_size, so the same thing happens
if the source becomes unreadable after the fault-in, e.g. through a
racing munmap(). I think that part needs a fix as well.

> IIUC, 665575cff098 only increased the probability of the issue
> occurring. Before it, copied could also end up being 0 in some
> concurrent scenarios, because in block_write_end(), if the folio is not
> uptodate, copied will be set to 0 as long as it is less than len.
> Right?

Yes. Before that commit, ->write_end() could also see copied == 0,
after a short copy into a folio that is not uptodate, or when the
source was unmapped between the fault-in and the copy (commit
ea51d132dbf9 ("ext4: avoid hangs in ext4_da_should_update_i_disksize()")
dealt with that case for i_disksize). ext4 has moved i_size up to pos
in that case since commit bfc1af650a8f ("ext4: convert to new aops"),
and the delalloc path since commit 64769240bd07 ("ext4: Add delayed
allocation support in data=writeback mode"). The wrong size then
stayed only if the retry could not fault the source in either, so it
needed a race. Since 665575cff098 a single unreadable buffer is enough.
I will say this in the v2 commit message and keep the Fixes tag on
665575cff098, unless you prefer otherwise.

>> +	if (!copied && pos > old_size)
>
> I think it should be if (pos + len > old_size) here?

Agreed. Then a failed write that starts at or before EOF also gives
back what it reserved past EOF, as ext4_write_end() and the error path
of ext4_da_write_begin() already do with the same check. I ran the
earlier tests on the dev branch again with this change, plus new cases
where the write starts at or before EOF (4k and 1k blocks, bigalloc,
quota, large folios). File sizes and contents are the same as with the
patch as sent, e2fsck is clean, and the blocks reserved past EOF are
given back right after the failed write instead of at eviction.

There is one cost. Since 665575cff098, an append from a source page
that is not faulted in yet takes this path once before the retry, so
it now trims as well. On a kernel without debug options, such a 4 KiB
append went from about 2.3 us to 4.1 us, and a 64 KiB one from about
18 us to 26 us. Writes from memory that is already faulted in are not
affected, and with nodelalloc the same appends take about 10 us and
50 us, because that path already truncates in this case. So I think
the cost is fine, and v2 will use pos + len > old_size.

Jan suggested ext4_truncate_failed_write() instead of the new helper,
and my answer with test results is in this thread. I will wait for his
reply before sending v2.

Thanks,
Hengyu
