Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793982377;
	b=rDyYg73qOZE5q6yDCH+qh4dwOTjRPZB8I5AV9eXvu5TFvQ9xK7wQ6Ln+BbrFPRMwGK70
	 NNAiUxxS3QcJOA8QRjxAlITb+o+o8OX9XessZ52hi19aKEkbQZ9D6s8Yec3ZesOPvs/6F
	 2D+8ofO+4zzRFo8c5NnGQP3SrzUdkjKQCWSf+Uoa3Bi60Khh2pVY2er3NDP+mrLvF0URl
	 Nr4et7vKx/MV71tV1x8DSBCRoQY1EiO5PLCpSGJRi0N5oktzrW6R6zg9lRH3PUKL4UT/e
	 Hs039I0qxbVyy4R/Ie++09N2t7G6l/kxsuTjGkycc6VkZJ1nk64By94zaQT/aWjVk5A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HdRV2fv9sn3Zv1QD3CF2qLLoDxMKfmhR4N5vPY7tcE4=;
	b=rVzC8IQod8naGjGkVOhMajsBzO3JRwkrKylXyhgS+RvcRD/Yrvcv/FNr51Cu0FyiEXSB
	 lg7/VLpcryOBzb99nwQGkrS7jU2VqUgGl2fjBgDoZDE02EMVjz+HpObfPBMQ+ugEZnE35
	 b/POUvU9/s1VMcYgM2J33+FjUI/KVsSqvmjtuEhEEg2LK/Y8vX4qeXHJGCZ49gXPLl10K
	 IjrFuAAHNClbbKkbAiKNmBYEBHAvbdZcjfhjWSeVGHYa3vKKbFWXSh9lusIC7/aA18OI+
	 gkDOYFiesPPSnWKNzf55rT70lY8NpvujujbzBNRFpbjo5+42gEgU+KaqOUscbaq95Lg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chYuT4dl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D49606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92D49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=chYuT4dl
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3acf6feee7fso5848821fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:26:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793982375; cv=none;
        d=google.com; s=arc-20260327;
        b=bPQEvfIHVO+xc/z7mMb1KWlZgy/98QaUR/3gOb54kp3vKQCjxpanuNsVzEyGFv5teO
         uAwt2/VX8ax3BqIdLrArZedxfImjYvOKWwXOrK4v6XKOCOrfy8UUilKzYOrJcORVmERA
         qrKTQEaODIy/1JYrugKzz0NgvERhBoAOx+wtoDYDT3SZy7vgVaIIp6jVedwx+CaUVaYq
         kxiX7N+UUEJFjCQopKpXtlCfo8+rFMAV/Ef+fijTfdW4aeRp7YECcj8aRRXXLGRbG489
         KoE0eutxRw2FTWW7FhczwyexeUGIDByO6DsDNKWmm2e0lMAov3QPMQS7vOuw0LV8Pi/y
         ToZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HdRV2fv9sn3Zv1QD3CF2qLLoDxMKfmhR4N5vPY7tcE4=;
        fh=QBJZyqkauBwamhxrgeB2HSrUXqguVjWuPBQpUNwKfYY=;
        b=sPaEQpMSA+NtXZKrb0WBmea/D0pOodgdEyN+7iTlaKX+gXFGrbPZDADvdsA7xi4ht2
         bqtsruIUUN3wfb03rHs/mgYgQbL2lyGUPHXBKYjL4t/7rpwHF9DJrxJ0Jr7hzShVUVhq
         1MpuLeaO8HQkyTDjZzBKr9VPuqeXC3IXfz8+pHTaDBnEcnUR+5ck0wjQbakuIVc4M7JA
         BVhBoOBnvBUXLp4sbzAye3ZLIvRJaon3bPDemWGwJedGT/VkMj1Avu3OL02+ScMDlRU+
         Z1uPwcahylop4nIij0n2Vsid3m+wzbmeghWpJsGmNh/MAt/dPKiG2kon2Xd38jSFsnAe
         eYfQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982375; x=1794587175; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HdRV2fv9sn3Zv1QD3CF2qLLoDxMKfmhR4N5vPY7tcE4=;
        b=chYuT4dlhrV5n91Cwk5xc4IKnGZmDnb75G6V76xhlPdJjK6CzszPmCUIwgYWtEMPrc
         rCf+6eSekt0Et4/h0iIFSD8Tf0M3HRyeyWyMbyFVUDNtzRAmug9SAmwoQ4LxKnZn8TOG
         l1RQvSFSEuv/2+yAD/RK9W9a3nT+D9JXTlo4jInWw3dGdVHEB3xY5FfO3vO2Pc61jD7r
         QKc5VeC7dDIV7UnRjJ0ndROZr5PyPX9HOcpTlyohwbF38gdxP5BQeOqghoG59B41WUjB
         wjf5MfHnhCAxS5DFdOQ7U0OJvviJ2jxjjLUJP2y+O1DmjdvWqxQufIZoVKDthUKrOHXD
         LnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982375; x=1794587175;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HdRV2fv9sn3Zv1QD3CF2qLLoDxMKfmhR4N5vPY7tcE4=;
        b=bFH+CzTaQR+PlUJfGovHkgoCdQ5ydYEPaBhw9s+dqJSUNwmGF0DOoluCJMNWrMcvYi
         XVoX/9T+H+9JWxlLav5phe0jwTEfxZbrfHlpgPGDeZJPmRzQAdRXfJFha39VpUDLETn/
         1Vw8QeiTjynxpsQJ0Lt4IOQEJDf/n98rfa53MZ6x4dam7N1rzcQMWNKCi/OiemrS+wvT
         rUiuY4NUcWGfoDD03f4GUv85hfCY1IXnSILf6POhieUMFSdeYDpfTy7My2Hfdc5XgDRT
         jusNdZD6oTEGIl1szNAQG0MhKjJ6uhe8sNpkaKq0NtVhqRtSQ0483a9IPjefsqHc5Tzw
         P+Pw==
X-Forwarded-Encrypted: i=1; AKwUvByWqoeQ8FtxyCOPjND/tJhMzUeh/vCA1t5D3HpOPMZhY7ezRW2jODJjYHZI9AikX+HRbmsnHMyJ9udQ+5U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9va2Hv5CT05Rv/wQDeMzCEaJ88rWPByWSRJg2mv7Hg07V/caJ8
	dDSjsFCjzKSYPx9Hfdy0CozucrecLL0CBcRB7UK8aY757Qk3Qt9ZkTvRZHhR92ow+cKvJ4O5ZMN
	HUIt5VEi5jy97zc28pNIf1Y5ktbafACM=
X-Gm-Gg: AYBFou13vyYCn52yTblKCQ3RKfnPJuy7tljo2m8XO/XcjvVDX5XvJtUsB0edPGL6h2d
	OLoGH7CoseCw+eOBmC6CEiLu42hJJUN6vatGIf+deinGg8HqKUmg5W7gsuEEcKWOIu3PT6nFBq8
	Mfuw1QaewYqp4GZ5qXvtXWjf3Dw5vdWqLtvD0AZG7ZeFbMLm2FS8FfhxaIYeHuxw6KxQScNmWu1
	E72/0uznth+/uwvJ4xEPcWPaDTxalaDUGzC10xjRC+/T3EIsLBy1T/adxLnDl1B3XwSKzaLMDaS
	GxEa6Eg3HJd0VjEHyWfOlExgHfQOBsDAgeexLDxg5mKO9pog5BbC/KTu95T2EbuVwRuG5iNM3KU
	L1Ersy2OoCO7oW1z2nZK62LYqc2NnxRk0B8mqdDC4+O1pr2clT+v3FuaFB/wMoZyRNmwqudhpBS
	vZ6qq4GygQtlC/sLzE+4/oW2RRJbFYoU9BIseTRFlblCoq6/8xBtl+
X-Received: by 2002:a05:651c:1581:b0:3ab:3f1c:c2c7 with SMTP id
 38308e7fff4ca-3acf36e3c14mr5753981fa.0.1793982374444; Fri, 06 Nov 2026
 08:26:14 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105183940.2236717-1-usama.arif@linux.dev> <20261105183940.2236717-17-usama.arif@linux.dev>
In-Reply-To: <20261105183940.2236717-17-usama.arif@linux.dev>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 6 Nov 2026 09:26:01 -0700
X-Gm-Features: AclHuK-EQG1rFsL9_37CcQp4-MiQ2_X7-vdSo7RZgU-ncnM9jHkiaTfyM8fgSFs
Message-ID: <CAKEwX=Od10cXx5Xz8td4Zsg2rsMkU+_t0UdqcQoXx6dZwfFU0Q@mail.gmail.com>
Subject: Re: [PATCH v9 16/32] mm: zswap: reject high-order swap cache
 allocations backed by zswap
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, chrisl@kernel.org, 
	kasong@tencent.com, ljs@kernel.org, ziy@nvidia.com, linux-mm@kvack.org, 
	chenhuacai@kernel.org, ying.huang@linux.alibaba.com, 
	Baoquan He <baoquan.he@linux.dev>, willy@infradead.org, youngjun.park@lge.com, 
	hannes@cmpxchg.org, riel@surriel.com, shakeel.butt@linux.dev, alex@ghiti.fr, 
	kas@kernel.org, baohua@kernel.org, dev.jain@arm.com, 
	baolin.wang@linux.alibaba.com, Nico Pache <nico.pache@linux.dev>, 
	"Liam R. Howlett" <liam@infradead.org>, ryan.roberts@arm.com, 
	Vlastimil Babka <vbabka@kernel.org>, lance.yang@linux.dev, linux-kernel@vger.kernel.org, 
	shikemeng@huaweicloud.com, yosry@kernel.org, qi.zheng@linux.dev, 
	luizcap@redhat.com, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 11:41=E2=80=AFAM Usama Arif <usama.arif@linux.dev> w=
rote:
>
> zswap stores swapped-out pages one at a time, so a range of swap slots ca=
n
> be split between zswap entries and the backing device. A high-order
> swap-cache folio over such a range cannot be read back in one go: the dis=
k
> read would return stale or zero data for every slot zswap owns.
>
> Reject that in __swap_cache_alloc(). Do the check after the folio is in t=
he
> swap cache: from that point zswap can neither start storing nor start
> writing back any slot in the range, so the answer is stable. Callers
> already fall back to order-0, which zswap_load() handles per page.
>
> Co-developed-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
