Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793735208;
	b=mDq5lI94Eh5KHPZRYd/2RaHczinJVneuqAFmSlR9AVQsmh18dvWwtPrh3wz9WaMoaBgM
	 zXvFzKNoLM5mmLxUxp75hK3bgkh8DjEfgW+bu91RYrAJS6TY6yi+5T5UnR4yfVUoQVUJl
	 UAH+H3IOXH5AzJ9z6mRMAXoZF5vDg5yExU3QIvAJk+QyVZJ0/F5dcgTbhE/AJVBRJNvzQ
	 UiqWuV8Ylgx36xoVjziuUq06JAr8SirpXMMKhxC1baaJAKHzqtuTS8WufRE4bZjBaokXP
	 oeyYQKWxc5B4PujFD93JTzdfz4gqfPJEJacnqKy2PwAWEvc24fNcAUIxqr6/MC0SJ8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tbhFeeAdo3cGeZk0Do0XADy8H3/aCehg8bO9iheoWj0=;
	b=kHSLU7TsU1Z39ewfZfjPDerOs3+uPyd6UxXtjGh2k3og1LhN8F3CJZmAYA5IWhec+/qi
	 QEWlLxuUlDBhB1WCV3qgRCSVs5nzLPeEron1OEmaZoCTN2sTp/UsPK9u7o5XfWPJ8/kVZ
	 L/NTsbQVmvmT0fnyCH2DWrf4uL8wbSM8QE5Xask8mhC5CM6SqCUcn9p4MdprhX/8qbMzU
	 YXaCA14w9Tx1EzpntT9MBaestykWglXSl6/rT46dUfpO4010oW4Eh+kv+MnWVtqAxNjxF
	 tIQxhZuxu6oct4i4sF2vMe0mIBNp0mvrsJTBVzhP1lk4WcsUfI9RGm9WpmQ5DjHAr5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6uMWLpp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CA5606A32E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45CA5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l6uMWLpp
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2805134f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:46:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793735207; cv=none;
        d=google.com; s=arc-20260327;
        b=r1GW6NRVdAseCPdIYWj1qfyYF5/S6QZZjIdKxUa2NhkHQwjBj25rU1xFvUcVPkxMlF
         YkiYpwFj3S6B+NH2Cus47VOMA0CUlxiGuqrncDVjzE1r143jqb5sZTcU3felxeC/qjS5
         xmT/FJzVq3H3bmNI18yhA1fDvfLtyt9CZQWkdDAdrp6i7CqczYCqV/cxnmtXiZ10xsOr
         6W0t3157ZDAs00UFESO/WR1JPr8w1hYEoEQiFq7ga0T09AKznzFa6kYpGYrW3fQSSna8
         5rz/6hlxHpe8jpDVOSn3lnvKpwuJh6hrYUN0xXxFSgAWy5EUzSpFuGf+idQZCIKUPLFV
         hXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tbhFeeAdo3cGeZk0Do0XADy8H3/aCehg8bO9iheoWj0=;
        fh=JflfrVUuMrLjFJcq/iRvd/L2EsSuU+Noe1FcZxP2KcE=;
        b=eJJOJzP2VLuvSXDaKi460FPC2V8Rmtdew73VMRvzLw89jFLlnEOC+OOec6zcBG3AeE
         hSVPuIuhyRN2Wdc+S5SGYafDHOipTjUS3BgSQZfMYJnAHdHfwgU+2kE9swYjDo63Rq4y
         x4VFwKiazZE2qwh7TKpX/SA4AuJKUF2G0Vzs+XLxfgjToVgprdiQtIvl0cNcFbxOvee0
         M2Nl1A+Oiib0VZsJWcXWqqBG+E1pHfqdKlX2N28cbXH5OiKmG8FGn+tZTIMwaiJq+kCc
         2hwAQgYOhf5iu/z5hcRCZwZzSWhmAvzT3C3jEAeYJrS2UPZvDS72F75acUzlgEYb19X4
         DshA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735207; x=1794340007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tbhFeeAdo3cGeZk0Do0XADy8H3/aCehg8bO9iheoWj0=;
        b=l6uMWLppSa8O4nTTQ92GmVEXDV3zByFuIW1dj8dsL+Q9aS1pRMHeuIH09uWqb+e2JX
         Nr38n3njrHv1S7qpZKguEOm0c8sOcoq2/45xvdX1KR2duqwzAK8cxTVMLJorvkkcVlNk
         MrqfSv96XpH6nME9Y69OHO47jc23LHSlo5UM82T7h45R86PCcmii2jxtRy0gnk5FFbUp
         SeNENUcZdn9FYaIDdGt+fjtU54rl4o0OwbON9DZQXIG67zZbFvFuoWNpHCHXwo7Zbirm
         N2aC5dbVaJQm3UQ/zIOFItXVPZFUNJtxADsl5Yb1KfW6IaostJeB8yXNdx5ARiza6zMT
         66Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735207; x=1794340007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tbhFeeAdo3cGeZk0Do0XADy8H3/aCehg8bO9iheoWj0=;
        b=Q/PhA7+MX1gBBVP1Bru/xsvpWAmNcz/AEP31NXAU/MqTu9VvPmfz6NP96i6fPiLiOn
         lPcboCmPdAHuZL0AZZGUVbrS6Erd6aDcWiL5Dr/5lYbSwxOnyQsm8O963k6XPUumdbJK
         hFvuuXxDgUlYKbVoHrRxSUQ11bl247wdcm9Md4Fu7gIcmo9tCOHC/LFTc69Kg/ArnXDw
         MYJg4CpWmw6+GXbNi6RApC+huGQWGdGChaYlp5U4LPFYdzk067AMttcIiFcrv7qb7zte
         9qB6VfNVx+fKQGS0BPbERGliEvWE/YGD1BvcdZtQZZGXBMHEyNFM3k6lOIrv/ezD1jb5
         T/TA==
X-Forwarded-Encrypted: i=1; AKwUvBwpFLI7rCmQeEn7lU8Zh8ZIvqOMZY8JGBISN9eG8JZ1/jCTQOp1CZuqLy6jWmtWpy7LFbL16P0eC2ef9DU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9t/DeXnfRu0UDkXIAzJ8Td3RH0qUzDQPA9Kd1d+j/dAbSDmWCu
	KTaSrA46sS/X6xRIgwtfFmuK7BS01yGfxTWdCkphzBXoBK5+dm5pza1F1AiJ8+j9XCnHbPrinok
	2GHOjbmTOqH5PPqq4dh9vHBuCSVS52yU=
X-Gm-Gg: AYBFou3jmk1ZQHgZDtHmltj9SNXKvr6TQXM9bt7JVdJaYl34LtfVv0sNdLb+l2fBVH0
	wXC4s0udBzhP5RZA42z+1Grgqwn1FYL9J98WGBk5HGi/agIEkVuDS/iyQAXapmxhs4LP9AoQmxp
	I11AZ3y2xkx9lLNGzfIc+XJ8exjMnE12HoAlV4dZs88b8YWxhsebzbaA/qpIGTCROIEkyBl48/I
	jnN9BgtT2CRagDzq+atWk+zqescD1y6oemd0wj3hFwZevaRgJtH9gWUIiZ6H1TTOLCOHejqXIcF
	cSalWXabZVcf3/4m5sNUnxpgP2dPJmkZsUCUasKhPNFKxExsYhUbZYubtm2djIYU5k8T9wIBuCY
	zwW0zwMRJQsZtaQInAkhI6rW/6t0SLSbaOI2ioLbPLoUaqkzokRNgJFRaTK9Y60lUJ4QvgvQt8b
	GGso6HeSkeR/ME/I2Tu85PviyEDAKiqUSROMKOkxdNYn54V/ni0eyz
X-Received: by 2002:a05:6000:24c7:b0:48d:f460:2c62 with SMTP id
 ffacd0b85a97d-48e6e50da1dmr33623603f8f.33.1793735206702; Tue, 03 Nov 2026
 11:46:46 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-swap-fixes-v2-0-204be064be5b@tencent.com> <20261104-swap-fixes-v2-3-204be064be5b@tencent.com>
In-Reply-To: <20261104-swap-fixes-v2-3-204be064be5b@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 3 Nov 2026 12:46:35 -0700
X-Gm-Features: AclHuK-ifuPPTCYvHoJl5pkRRgKpd0YlnXnCuFZkcIsac1IPAugr69fjd2WTEQY
Message-ID: <CAKEwX=NY98sJMcCwT6M-Mke9aenfd6fpBLZLy3r_18uFPKsk=w@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mm/swap: account synchronous swap reads as memory stall
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Usama Arif <usamaarif642@gmail.com>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Yosry Ahmed <yosry@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>, 
	Mani Tofigh <mt4022@columbia.edu>, NeilBrown <neil@brown.name>, Christoph Hellwig <hch@lst.de>, 
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:18=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Josef Bacik <josef@toxicpanda.com>
>
> Swap-ins from SWP_SYNCHRONOUS_IO devices such as zram are no longer
> counted in PSI memory pressure or in the swapin and thrashing delays of
> delay accounting.  Refaults of the workingset from zram, the main input
> to userspace OOM handlers like lmkd and systemd-oomd on zram systems,
> become invisible in /proc/pressure/memory.
>
> swap_read_folio() opens the accounting window with
> psi_memstall_enter() and delayacct_swapin_start() and, per its comment,
> means to count the submission time.  For synchronous devices the
> submission is the entire read: swap_bdev_submit_read() does
> submit_bio_wait() and completes the folio.  Since reads are batched in
> a swap_iocb, swap_read_folio() only queues the folio with
> swap_add_folio(), and the bio is submitted later by swap_read_submit()
> in the caller, e.g. swapin_sync(), after the window has been closed.
> By then the folio is uptodate and unlocked, so the fault does not wait
> on the folio lock either and the read time is not counted anywhere.
>
> Fix by submitting synchronous reads from within swap_read_folio(), as
> was done before the batching, rather than from the caller.  This gives
> up batching of readahead for synchronous devices, which do their I/O
> inline anyway, in exchange for keeping the accounting simple and in one
> place.
>
> Fixes: dda8fb68b590 ("mm/swap: also use struct swap_iocb for block I/O")
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Kairui Song <kasong@tencent.com>
> ---
>  mm/page_io.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/mm/page_io.c b/mm/page_io.c
> index 65681eed9c80..83ed0246ebfc 100644
> --- a/mm/page_io.c
> +++ b/mm/page_io.c
> @@ -500,6 +500,13 @@ void swap_read_folio(struct swap_io_ctx *ctx, struct=
 folio *folio)
>         zswap_folio_swapin(folio);
>         swap_add_folio(ctx, folio, READ);
>
> +       /*
> +        * Synchronous devices do the whole read at submission time, subm=
it
> +        * it here so that it is accounted as memory stall and delay.
> +        */
> +       if (synchronous)
> +               swap_read_submit(ctx);
> +

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
