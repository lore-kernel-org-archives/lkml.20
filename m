Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AEB38C427
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788977692; cv=pass; b=mKUeGayFimmD4dSU5jIrjqtx/bZh9XaTvHJiTCW+zRhcRDvREb7OTF5adkQ7O9RnRgkIVOsB+dZIWjmXluDstaTh9TVwiOSleyVbtFCSxuPolmiKVhVTVSRD9adVAumI/dOWf1rJyR7kDyuBwphiySQjv8nAaECCVkU84FAF0m4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788977692; c=relaxed/simple;
	bh=8Rbwum/U7LCRDIoamxX4vkzVMHdBBlYCRplQYltoFwY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mztszfr+rzCINim8ZPQukYHxpJlTg0xZSU7FskRdGd9KBGzHLhuvroNcXlH3+xevbT9KQ4cCld4Sn/CQlhkD3Yf9M/us3mf1KptXdTTE+f0lkiveIb1J7R18NDrqtXisOy2B+YjKrvl3LtA7D5JpGna/xPNPOsZoq12c+r7G+7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN95Zj4o; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN95Zj4o"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f62ccdb1so877420f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:14:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788977689; cv=none;
        d=google.com; s=arc-20260327;
        b=RwbdM9F5tPE3RiolovoBKUD50sFmvrJrypoYNG63wfqOfIzkpqt4MBBt5s9sYNn+IO
         VYvy72Bzve0NrswxwUTIeuFTk4s2y5qASBHD/M2AN1lsHyID7q91qHzen/485Rf0dwn9
         8RDOuNQ9xYZSXpSs2c43QnoMy5apagtCCou4De6ezAgjdm671NnIwQUFy5HDq0uFUxaT
         VyXpMu3+CBOyDdYsIYeDqSZlXw6EH4jWIkw7BOtievn/NvssLiGXpJP84KUNkJ0UDJJb
         kRJyVxol3514V39rZ58+7TO0h8tjtQ7GfxMOwJKqePXIC2Gh51dFIXDwPeeeV9Q50MUB
         zkXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yzFysYL2ZWVkcNchNmKkU5ZyseGFGQP3llm4Y/4N/1o=;
        fh=NBaSbVF+Dz6J1StPr4N8FWZGGxcjfvsqmqnYZy9cn6E=;
        b=op9uWFTHUAkx/B2ldwbyd4tjUvUERwmP/eArl29Ksre+R/n1QLS1LqDMFCUhnULeQf
         AcQ/U1BZRvfXsoTzPVBdG2Xd04sra+wT92qHMTyLT59OnMyOcAbBPpz7EchI0k4f/AQ/
         ESNZz0sP2qboYLnPwG5nLVbcKRspRB1aB85YqicTC/Vu8QFNeTULBdAIcqaGaOCwZCc6
         jP0l0YdiJVHeimgOFG/F1WgUAlnR2cedEFbpyZeyl2twhU0l6x95JMRxbF4XtbTd80G9
         CfHltadCXLvpdEmTbLfhS/UeREyJZl5VNB0rpdLk7K1G+oHeraI08k7leaTy7O7Cmjmh
         4U2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788977689; x=1789582489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yzFysYL2ZWVkcNchNmKkU5ZyseGFGQP3llm4Y/4N/1o=;
        b=WN95Zj4oHPDimCRJ23gIbpFry0UwEXlhDdqIy7oXlIOXscy9lcHC4y65WXj4efS/0u
         aCl/y60hye6neCwBzOYsFFOQnw+oO0Gx7+a/lZdC7gkZy5YcFwb9nBiXh1lCxEzPqtlJ
         17KfwWxd5uCV+Fy8qmDe5PW5NJj40kMmgdKJ+FM8M5O4iH4scT+pwyCX3LbAsGyyvyF7
         0JdhkGfFZMOcJKjOWEK9IBYc4Sx9mSVlKsBlUKJIdUHH52ZqBvesmxKG0kcy7/1PF4Dx
         2xMRUJCPA1nfRzY5D3uM9zMFW9pNuQ47u7fWcGDc2uBwa8CGANtZMjjGrLj3KSbIK8qG
         7iQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788977689; x=1789582489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzFysYL2ZWVkcNchNmKkU5ZyseGFGQP3llm4Y/4N/1o=;
        b=iZEp38IIdvCf3+tscuqQkT18fxaV0qs8UG0cKDNMQ/owYJfo82IdDfxaA+E2Sj2nfZ
         bR3aUtAeltZdoU7KUR6hYPvafb/BcHAUY/QdCCXsYDiC1EU5cWe+E9PMDx52r4fRgG8u
         pNoz2LZgWJevz+OefpDyH7agbP5slZyW9mImKZKfSlzAe4QweRIJyqULCBizeNf2muwB
         gbMqz5/TGQhQpbtfNP2LNigpWqNN/LzFLxWk0FMtp2UqCzYE/3MGTBGUNu1OdwzaGgFw
         IOw7rWGNhObT3GMErAvqoNhhTNAv2gA1G6OMLbtNTDm1J2vXpi/xiiAm18nPMlu55CGN
         yoHg==
X-Forwarded-Encrypted: i=1; AKwUvBzEO/hSTGifUAc1QQZW4Qx+qMA1CPpps2sgadGXQHrjQ+PPUqr+oXOSPZKJTkrumq7NY79v8kfhgeJx6ZU=@vger.kernel.org
X-Gm-Message-State: AFuF++ktgUhxWcfKHXDGlqUdgcVZGLDPyooSCoiDTqMrX0hFSXQpl7vF
	fSbOpZ8jdCwl/2NwdhloM+gaeWit1B/ZxB24pwDs9z8Tj/XyBRizWSuZKZkxtoYhpgl9pK5LkXP
	VgGNsmVec6ZOD2xAwud2+GtXF841YIzs=
X-Gm-Gg: AYBFou2Mp2SUhhPsQ19qCcXFRlJDet7v4YT8KCAQkW8ToEpwjkGLjj4drH8a1dgiB6w
	5sZ7/Rewh4yL/IeYWKWOhogYxAghvM+YmjS0VHKEbLHdLZ4PnmLOb0EouuZwuy691YwzovBP8Q5
	DO2cMJjVUyI0p6SKCYDo5XoE/6CIvg6yO+5jbeHHFurUyNgWxfhJqpghaCgGOsvGubKyKyQtexa
	CFDtieabZVkls8n+JY4BpiNRaA3EJOd2mDU7jkb1Aezo/Cv0hf21wsh3LRVXua8Uha7au6wMJiA
	ul0CoduH8wRs9OrzBpeebORJznjteC+u1Ia7C8Wg1eOWfvM3aH9JAr5WRs81lnvVEaqpjFzo+AQ
	yITWDzzVATVI=
X-Received: by 2002:a05:6000:1a87:b0:485:8ddf:7a5e with SMTP id
 ffacd0b85a97d-486e0f6c965mr825042f8f.11.1788977689104; Wed, 09 Sep 2026
 11:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907161938.1932355-1-usama.arif@linux.dev>
In-Reply-To: <20260907161938.1932355-1-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 9 Sep 2026 11:14:37 -0700
X-Gm-Features: AcwNN1X__zB3pEsdnxmwwgsAIlWtg2QfI_AHwOPpV_fdj1oiSItGXQAyV9ijLiw
Message-ID: <CAKEwX=PDTPk3d-e7z2GYka33jatuqxy-ES3uSfyg=-L65YMaLw@mail.gmail.com>
Subject: Re: [PATCH] mm: zswap: don't fail a large-folio swapin whose range is
 not in zswap
To: Usama Arif <usama.arif@linux.dev>
Cc: yosry@kernel.org, Andrew Morton <akpm@linux-foundation.org>, chengming.zhou@linux.dev, 
	hannes@cmpxchg.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	kernel-team@meta.com, stable@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 9:20=E2=80=AFAM Usama Arif <usama.arif@linux.dev> wr=
ote:
>
> thp_swapin_suitable_orders() and shmem_swap_alloc_folio() sample
> zswap_never_enabled() to decide whether a swapin may use a large folio.
> zswap_load() samples the same one-way static key again once the read
> reaches it.  Nothing serialises the two reads, and in between the task
> allocates and pins a high-order folio, which can sleep.
>
> If zswap is enabled for the first time in that window, a large folio that
> was correctly permitted reaches zswap_load(), which rejects every large
> folio with -EINVAL.  swap_read_folio() treats anything other than -ENOENT
> as "zswap handled it" and skips the backing-device read, so the folio
> comes back unlocked and not uptodate: SIGBUS for an anonymous fault, -EIO
> for shmem.  The data is intact on the swap device - it was written there
> before zswap was ever enabled - and the not-uptodate folio stays in the
> swap cache, so every retry of the fault fails the same way.  With
> panic_on_warn the WARN takes the machine down rather than the task.
>
> Scan the range instead of rejecting the folio.  The caller has pinned
> every slot before issuing the read, so zswap cannot start a store or a
> writeback into the range and the scan is stable.  If nothing in the range
> is in zswap it is all on the backing device: return -ENOENT and let
> swap_read_folio() read it.
>
> A range that does have a slot in zswap is still refused, because zswap
> stores large folios as order-0 entries and cannot reconstruct one.  That
> stays reachable - a slot shared with another task can be stored inside
> the same window - and refusing is correct, since the alternative is
> returning the stale device copy.  Report it as -EIO rather than -EINVAL:
> the request is valid, zswap just cannot serve it.  The only caller
> distinguishes -ENOENT from everything else, so that part is a
> documentation fix.
>
> Fixes: 242d12c98174 ("mm: support large folios swap-in for sync io device=
s")
> Cc: stable@vger.kernel.org
> Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Acked-by: Nhat Pham <nphamcs@gmail.com>
