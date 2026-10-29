Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793308018;
	b=5kwtZW+VEYl7mufjq/hfwBxa1HHTG5Ikv2YUO3lwwFOSH4mU7JqaPu9oA+31cTLnAO6L
	 /XgoYvwQjnIOjp9OKStvIRvohMjbLiZEWdw9BJmiDRISR0IL9g8AWqTxx6EtXZfBAZbDy
	 pHCBjJAmNrjGkw1mnC/7XdnQTPhU1iuVEWxYx+UD/cifxdvNAmLrC9DWiitQBwtZf9FE+
	 Cw1rj8N62dTWg8t9Aw/U2hHwwr78Nj3bbbQDXdBYzNAfFVfcz9pLOqdKjjPz6tQwgCiig
	 TqMDpX44SVCS3fMqoZrugCT4usilJWii6CWYCUbyrNX3xX8Q8/dTgp7ih0AZSa2GXVw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=fb8kDJR3/eqMuwVk4mGcY8ktqHU/PCk1HgPlmWV1nBs=;
	b=A7UGa0fIRcvQjN5G7tN1p+8UJr4LRgnPVaKBvOHD3v4jF2cXXyOcAy+iTU+4TNuKc7OE
	 RU9VtYe34OhBxe/TZYYUtiRgV4EwjS7ksDVwl+Y/TrJD9C5Acaaj59lGoBnhzsGnASJqL
	 GUap1rliLp/GzFFY8EvOCQmkkhKh8XQhliLLtLocmmeMTlGLPy/Xi/i8xrSGEvsEAYy3y
	 gXS91osZLCDG72PkKyCBfCllx7/CFWg4EJhi7USnBKfTon0bdylQ7d/IAwd555bhyTuss
	 HbAb2Q0roVlgpgax1ZPok/I2HA8HVtbXnIj2guZ9KVQVlXx0NLqlJLjc8qsTab69omQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVnsFrct;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686E2606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 686E2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVnsFrct
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e00eee27dso33498f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 14:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793308017; cv=none;
        d=google.com; s=arc-20260327;
        b=rvJWCyviYFE2fUUqoS9a1BkeZ0GJakrB5nvxep54CofQ/EnHMiPSCoKjgHFxxv6njL
         hIWCa2lqNxAZrN9gTnCNRnxh6c2jWwBGpcQtZvim1rGxyn/sCXmYfC2/eug3JkHttOpw
         +Y0YddpGaXstiavMAb918+vqTDo+gzroRBFAywWLpQ7w/0GIPbXfCOM7pifNgEevFgTP
         Qv6XxciSGRsmZtq5jZ3Erbnm/zbNk5vY/aPFSXMbcNjtvRVz15BtV8RrgF7HaZHKtZpf
         8k0dLxsISnnI4LVI9UFNbFTEoOnKjxsd95JDZa+8ImF6uaVtm2wymWHCxI/ZLbtmUmeo
         0yJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fb8kDJR3/eqMuwVk4mGcY8ktqHU/PCk1HgPlmWV1nBs=;
        fh=A25ZdUh7Du1RxYOHcbQnTEX8zUdCeYltfyNn6VqVpVc=;
        b=aVzyGeuRqw0A4ZDa8dq3r/bh7ztqNAYkfYG4CN8Jow0Tkjjb5VYrb6BveqyBXxwkTx
         EGGfogKEknieihkeu++7cXEsFKHDfS8aCW5MG9s7coTu/rrm8JZwhYrfo+LScfDbAD9H
         PntA8n1yeu/rkM+ThR6WOmcNRbstj1qs1DkImEbOkPe9tlDb0TXbMlRqIUdaGklA0lE3
         MmhXAegMSAENMb3WiQdra+1VxJfTwl3LubER9FegFPiQWda0myCRUP3wHspTuFyWL3Qw
         ny0fX5UwDykqjrAUKo7vqWrfax/eY2cJkRJsagfGKaMOT2JX6hI95z2W/WcIZCJNKNjv
         4rHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793308017; x=1793912817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fb8kDJR3/eqMuwVk4mGcY8ktqHU/PCk1HgPlmWV1nBs=;
        b=gVnsFrct4ag32Tfd0wM6BzECVlaMPUl7QlKyvnZFQLzgLo2y+RIKRdlB6hHI/B21lh
         FWKGmAsmQIdiep13arb6kjNrtTtU9TqmXsw62d2qtaIaKt5deOFZ8bZBJ6Tz7utT4PB+
         ajnp7e6INqXwKe3MDpMZUlV40KK482LSDVhpShkMhWiHdp1XLLuBdqEc/e+TyQ7WXLlg
         W6/q85L0HxAeNTjHsbYUn7xKPS/9PDxF7/bUsOcAXqlaXONqboLv6v/RsG1smha9ZSI/
         97rK0sXDrQcEFDzZp10lpiJKtaApjAce+ozMcxooujHHAIg16obCz4sWaS7i3rTCJs3r
         GC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793308017; x=1793912817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fb8kDJR3/eqMuwVk4mGcY8ktqHU/PCk1HgPlmWV1nBs=;
        b=S8hK9fIMxFA0N7fiNe1qJWii6jnS3XwxGBEZ3gNT5aYTJcn7b72JP38yj9MHyPZcyH
         WYyYJ8hz3Vagr5XkIg31AdqF4jQ2YPD5m8Fy3X4WGeQQ2TqO5xtz/dRTIPGHDULSBhJA
         PA8y+OwH8OYrqjlmq0aHvlmypu9sLJML4Ly3Iv9bVK/J4/I3lLt7IZhxmFe/a+kXeTcU
         nCgXKQRESleWbtxNb19n+TYdjCh3fFsYBub8QYl84CY1pOrP3ArBRuk1azPh+J4rETjV
         hrQc1IsCOBdBOEKd/2oy46GeaSH9V9D7zEooVI3U3/klxmB5PpaoisibsjTP99tn+tnv
         c1Qw==
X-Forwarded-Encrypted: i=1; AKwUvBy8zTT4ClPnPyLxDfp/UZWcZB3u9uz75pP76Va+fQbFL80EoMxrfd6E+Bzpx+lwQeBJ1dw41NBVW7sT8B4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAVDrC9TGLGc1qgZd/mk6HzRy86KrfDS4KDwIJZ5bTa4F+NYwZ
	AFq4hLelOcc0z+gDdvIOJ1Wohzn5n902rQM09srKton+4TfCw8iGBWgNNsfWsSGU7OQ4hUbDCCV
	IeSDbwaDRWAxOyW6tQiymvrw2acFj/HQ=
X-Gm-Gg: AYBFou1WZOLtM0ch8LTelUlPIfiLJBgct8LTzsMBxrDK2RrUOoYGMhMYHjDQ8KJYz+S
	p5x1lp+0uytkyoTVRL6LzGrog3FarU0yh4LrK5rws/yMmks21EyKVImrhRjckSqqEp9BbDgWBNK
	7XDhcYyHJtf+jT/8rZ6ER71FaNIxqFTFXNpbs8CuAUlt03uQNLVR8sGWnE2Re6JaLnYRfxqHVkW
	r6iT6YbykUIzmuP6soV4xXbTDeTq3ChiCpPyf4G0Cho4v7UA/D6/GaN/IJkMPxKoAvtf0fa9N7w
	nHewi9v7rQFMoXFii0b51YCJDe/+WKdLtCzfvPY1xJ4g2/xpoOpWPQQTyFEIWEMH3VoS9F1H9sz
	NPWGpsPF2xKGf3fpIX9cbGlISBhBDtfNGUTdzPX6t7ULrLrRqr+WiezS/CP7VhobDoVjUjfUiNQ
	BglR4JsZvm2NnfS5BqZGlIomIcesEJyjCVHsYSYrH0tuihg4oaRzF6
X-Received: by 2002:a05:6000:4b18:b0:48e:6092:deb9 with SMTP id
 ffacd0b85a97d-48e6e2fa4e1mr1121429f8f.14.1793308016538; Thu, 29 Oct 2026
 14:06:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-swap-fixes-v1-0-73f73a59f2fc@tencent.com> <20261030-swap-fixes-v1-1-73f73a59f2fc@tencent.com>
In-Reply-To: <20261030-swap-fixes-v1-1-73f73a59f2fc@tencent.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 29 Oct 2026 14:06:43 -0700
X-Gm-Features: AclHuK92wLeJ9w3J3At4Pw7sJv5ao2rkIqVVn5ak-RXKnx5xxdpjvkaqxTwN9aw
Message-ID: <CAKEwX=O+j5d874gW=ENZc7s4y2CGVKheQSK8VrfD1_eVK=6U=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] mm/zswap: drop the stale zswap entry of a zero folio
To: kasong@tencent.com
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>, 
	Chris Li <chrisl@kernel.org>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Yosry Ahmed <yosry@kernel.org>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Usama Arif <usamaarif642@gmail.com>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Chuanhua Han <hanchuanhua@oppo.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Mani Tofigh <mt4022@columbia.edu>, linux-kernel@vger.kernel.org, 
	Josef Bacik <josef@toxicpanda.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 11:32=E2=80=AFAM Kairui Song via B4 Relay
<devnull+kasong.tencent.com@kernel.org> wrote:
>
> From: Josef Bacik <josef@toxicpanda.com>
>
> A folio can stay in the swap cache after zswap_store() has stored it,
> when a swapin fault gets a reference on it before reclaim can remove it.
> do_swap_page() maps an exclusive folio writable and, for a read fault,
> keeps it in the swap cache, so it can be modified and swapped out again
> to the same slot. zswap_store() handles this, it replaces the old entry,
> or drops it if the store fails or zswap got disabled, "otherwise,
> writeback could overwrite the new data in the swapfile".
>
> swap_writeout() does not get as far as zswap_store() if the folio is
> zero-filled now. It only sets the zero flag of the slot, and the zswap
> entry with the previous contents stays in the tree and on the LRU:
>
>   reclaim            fault              zswap shrinker
>   zswap_store(D1)
>                      swap cache hit,
>                      map, write zeroes
>   swap_writeout()
>     zero flag set
>   folio reclaimed
>                                         zswap_writeback_entry()
>                                           swap_cache_alloc_folio()
>                                           decompress D1, uptodate
>                      swap cache hit:
>                      maps D1
>
> Swapin looks at the zero flag first, but only when it has to read the
> folio. The folio that zswap writeback leaves in the swap cache is up to
> date as far as anybody can tell, so the process gets its old data back
> instead of the zeroes it has written, until that folio is reclaimed.
>
> Invalidate the zswap entries in the zero-filled case as well. The folio
> is locked and in the swap cache, which keeps zswap writeback away.
>
> Fixes: 0ca0c24e3211 ("mm: store zero pages to be swapped out in a bitmap"=
)
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> [kasong@tencent.com: fix zswap_invalidate() arguments]
> Signed-off-by: Kairui Song <kasong@tencent.com>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
