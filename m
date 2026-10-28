Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793213248;
	b=VoTXYpgNBqS5eVCXDlhsGPid7mLsaL1S8ywrG/P6HNgzmAz26sCI+NKzeH05WOqpahMz
	 5o32JfVh6FZ+sb2pjEyJNJDQytR03bFmDa5Yg6faDuQZweUSWVeGJz/h2A9kaENcVUcfH
	 rTQzP+HuEQNnOcRDQmFJ7+SbR36w+5gAPYeh8b8a920M5qMh+C64cekGv3WSe8yKr7Z9O
	 q7rh0N8F8DeqYRZErXctRN7omZpEHOeF6bmoobP4fv69XeXmjspSFgfY1GceEjIbpbCGz
	 sbIzuIxcFCBbx+8ik6IBnDYPUmgtU/aDnZLYt/bfPybKb/Fumz0QFYosHYoxLsqalUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=MY1Ku2+QfFQ/w+5DBXT4XGQW5hbU1oOryqCY+B4XiPA=;
	b=wnT9o46Ro4/44tgDhAEMQBjc5Z62jsTV+Qbfd/W6tGtm57I7agYQcfqgeEJzITULVZjh
	 6brBDjP7UASb0o1FyAfU0coUH9X5bKPjs8cTysLxYl+fh0sOveuL6669mzKQ7goZR3wpv
	 DeCWSZvF5ewJpk0xZOIaSk3fxgO7NYA4w5uSpuMykc8YXCFSn8iBpU4JVFbb0kjQkdv3y
	 ACqQduWI+zCYFQw8cPaC+sPX3GfIrt/9c8DsCOZi7C57yW7JYIPfhCWn2G/OUHYTm+qxb
	 3TtOAbhxBFpLBpJBnNeo16EWBCr1rbjz3m/vSsn0Np+ybrDZNQCOu6ExmA6OtlGKnVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q54cUv8y;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D00606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7D00606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q54cUv8y
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso1014455f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:47:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793213246; cv=none;
        d=google.com; s=arc-20260327;
        b=owx4xR4fWbGdIldVQ/miTiHm2QrUDZnmlZPMVGQaO5Bt5HFJ+hGnlNeEY4l3GivCw+
         mMzAxYcodAnHD75rYUv9DgZVbz3S8EZAMIrFOQiiAS0aq2ODeZ3jcHpeRVgGjZ9EMQeG
         oVf0IBoJ6yr+NcYdPgNhxxaVuUxdi1McjVWH/1nGin0y8U4yhsy9rdf+tm0fbc3UcaXI
         0znahsKj471qUx2QXG26c6pY+Lj7eWPzKD6hy5OJLIS9c8q4xLjrNdqaFBsygC2RG0k9
         IWfMlzkjf4+vUJyxV70HWpwSF4UJeM3M0X7MhqM2+Q2KKnjOxjAiSV1K1lYNUFWeZ8Yo
         Z4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MY1Ku2+QfFQ/w+5DBXT4XGQW5hbU1oOryqCY+B4XiPA=;
        fh=eTSc1PFb7sUcm7RpV/u2NwRHGq8UlcizbHy7ovlP+zU=;
        b=oDK7iDaBHNLyoIuuzl+sFKO7gZW5su9ArNvERIkO1c+6oFvpvMxxEnD6QlMdUvgUt6
         +51pyR/kiyVVUsAgdfMHiLTw4HQmjK5WVBtFUBx+kGPHqBAs1B8QnR9iQO6xG2Hd+UG9
         2jX7Jwpq1mVrQXjPiXFbSiM3cAyBnIfCoI0EbOE4UMrNR5cxXbTkkCV4kTZ2OkzFGA6t
         z9XlENXfmbKX1Y+kOBRZsROwzTjbP/eMUcEpO1tkRjrdw7zAzyw8I4STeNTbfSoE5srr
         F7CRrveaWfLomMC8g+Dbv6ByK+gzBmWRFTrWXh1Nh8bS8tRAWo9cqzVNDZ5XsEXkrXu3
         ccgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793213246; x=1793818046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MY1Ku2+QfFQ/w+5DBXT4XGQW5hbU1oOryqCY+B4XiPA=;
        b=Q54cUv8ytuWU7OwkATBQpuhT8grr1CM1cqdHQN7n5u2vWAG3ec4RsEpKGsMZOLAvVm
         f7OTK6IZtKC/huI1Tqi+mw95iBa4nX+kg1bC9PCYw02czMkivy5Ntfhf0tEK5B3OMaGm
         tPNDshFSoiADTOj9RbXLKrnSFclHqf66xEVkSeiumOa1bcwmFyBdcugkvVXdCl+aWux8
         1QRTBmoyoCEElNrPAv5RrCLbf+Z9uwYmgO1lfrH7cTrezOnGuvwzepAnViSCoVvOS3Fv
         w6tax4x4QDOZuMRwI5rHUxpDzqIuNjvJ+EK7er1v66o+v/AzHtadcGU8BT7P41I2tJ+/
         fGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213246; x=1793818046;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MY1Ku2+QfFQ/w+5DBXT4XGQW5hbU1oOryqCY+B4XiPA=;
        b=nZw4mmoWPVTRRdhEggkCmshVdcBke4jdnKYJSMRDeitJm4uZiaIRuSLKLQ8U902A6d
         ooyLuev0Rx2p9WHE4engYZLxw+imfHga3UJaiBDgOPRscN/0Br4bE2t+j9awQURHDWuD
         Bz6k/plaJbccLXwpWvCIy1c5hsOKYLiJjoOjP+TEcrgd2M3HBZgxh3d/nXsUgkmoaRab
         7SDhoHc493PtBqKIZEVQnRxEo5AU1OJOW4qQwpf/AwYPhxPdeT+4VDdxCqLZcr8/3S/w
         Bg9n7SdQU4T6RfHkg6+M/g5K9jnBBZE+7qJnwFwaGnfqa1PJ8itJlliCWxZx8JBZvHVW
         Tl4g==
X-Forwarded-Encrypted: i=1; AKwUvByYBPjj41/4gx9uV8AGLjMib5JLk1MKIzwjc/cqFfs1dyEJmOWEVUXldGPp0NRefGTV3bQn9zpeWZqaXjs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKabSw90frRXnDfgiLS3gG2oe465YV64hnBymNE9KVtSZQ17DrP
	XQjLFMEKcd550dzlpeSYwEwvsqxn2obwbcAsmoD/KJ/G8Gdp+XiJBVud7mFPY0TYh+oc6Qi0I9i
	DyleQmx2NfCZApi+sTJiwupa7tsvFpap+YMppO8o=
X-Gm-Gg: AYBFou3dVrIOgqm06QnJGDnjVi+DYa8fb429UQ2NBRiGGb+X/kV36f4wbJuAjxmcq0o
	LXPPblE2NJPlpjam1JmdILnnXSjRVJE6O4u8z28zVYOjtkWCteQAbnI0qyEdP4ig+YbGRDzC0aw
	1xUkEk24LCqCbqcpv2lVHnS7w8Cnu1V7mE/51J8LIxuO1W7ZIGdVe2HTvnIgi7KSucy0a+9yrtc
	7VKxQonlnKQXs5GYbNoHaRCfPhJ98xDvDouscWxahQefB5EqKv3aJFI1IcL65arEkSAYy0h4dWC
	rQ9I52N98Fv+aJl8SJqLZiJPBXd2xPs0l2O+gz9H0B2139grk2P5v8KfXgu/SKHKnd5knShAwcR
	LZO7xRpakrq2lMORkySl7kCe9XgxaZpz0/ucwTuuZBrFnexJu0or1flpD04wRzm93OaYZfythzp
	YuxqBIGqcZIV7peoa7QmoW5daSee+nFJ1e/qghxVvkQVv9gsLWj99e
X-Received: by 2002:a5d:5e08:0:b0:48e:460a:bb83 with SMTP id
 ffacd0b85a97d-48e5d5e55d1mr7015815f8f.53.1793213246056; Wed, 28 Oct 2026
 11:47:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028113619.38752-1-kaitao.cheng@linux.dev>
In-Reply-To: <20261028113619.38752-1-kaitao.cheng@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 28 Oct 2026 11:47:15 -0700
X-Gm-Features: AclHuK9AOn8SOZMNtF_LnCI6V3qWWsFm35NjDDUBYkIPrJA0RAhqgLPZ_tqYx2M
Message-ID: <CAKEwX=NfFNbBwhvNpYz8iWgimFuOow8J8x1SzV_6GcC_bb=Etg@mail.gmail.com>
Subject: Re: [PATCH] mm/zswap: fix double decrement of the LRU node count on writeback
To: Kaitao Cheng <kaitao.cheng@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:36=E2=80=AFAM Kaitao Cheng <kaitao.cheng@linux.de=
v> wrote:
>
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>
> Successful writeback calls zswap_entry_free(), which removes the entry
> from the LRU and decrements both the sublist and node item counts.
> shrink_memcg_cb() then returns LRU_REMOVED_RETRY, causing the LRU walker
> to decrement the node count again.
>
> The affected call path before this change is:
>
>   __list_lru_walk_one()
>     shrink_memcg_cb()
>       zswap_writeback_entry()
>         zswap_entry_free()
>           zswap_lru_del()
>             list_lru_del()
>               __list_lru_del()
>                 atomic_long_dec()  /* first node count decrement */
>       return LRU_REMOVED_RETRY
>     atomic_long_dec()              /* second node count decrement */
>
> Add zswap_lru_del_nocnt() to remove the entry and update only the sublist
> count, leaving node accounting to the walker. Split data cleanup into
> __zswap_entry_free() so writeback can free the entry without performing
> another LRU deletion. Other free paths retain their existing accounting.

What is the visible effect? Is there any effect, be it in reclaim
dynamics or userspace counters? Can you add it to the changelog?

I'm not against fixing it, but need to gauge the effect for
prioritization, whether to cc stable etc. etc.


>
> Fixes: 5878303c5353 ("mm/zswap: fix race between lru writeback and swapof=
f")
> Link: https://sashiko.dev/#/bug/linux-68d2ca49-23be-4504-9a75-b8526ec9238=
8
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
