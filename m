Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793739734;
	b=0XQCMqj5MXcvOVht9KtLGbTGIBXPTKUz4at/L0071/upH4phMzpIQ4jaGtDP+fE2lBfb
	 lDDj4dCaEHpKP7dCNg0FbaeJhDUyxreWB7twGeJkDSLSs39qOENOxhFdHVWrT2u8YVFBT
	 Ws+RfTPlQ19MCxnwwqR+ioLkyB7muHtB2ZxND9S/mR7cWgZaTLxaC1+uWk2smD4SLcByF
	 5ACOPi0UGaqr4z2kjAOTGAoHZrL/lcZB5H7kNbsaq49GkL8MFSDTbbaDdxlV69j8yxI7K
	 xwXSew8Yf0jgScr0PXmEVuLml/ym18JrFwMePOI0ECJwbrc2wZrIiYbscV9Jd9OnykA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eLnVO73afvgaERjHXGPf5E6SbhMPv9R55TpDCQCEqgQ=;
	b=vJysXfKGWbCUWGmfkeIujo+l/hCYt611cthtYHQMqv/sXGDR9c2VzVPWmSPh4W3k7jku
	 cEeK/y9BMNSpbmGGpgw/UX9puOTy1yC8zDmi4ZAh5/Mr+3MM5r8mrHjVu0alChSgv52Ag
	 kjTc0w+x9LYYJq+M9l+ChOaibS4F3wU6q2GBa31NNdXEqjMScN2DQH66EKH4dHO0vFlLs
	 dQEn5Qs/PGX+zfGqSEBHsfNNB5TYRsSj8jHE3F4NNpgtHfKUQDtOpR/uMp8XAKs6NOXDr
	 e/FsHD0ZuBo60KkcUXSN/qKULvfIgzBpATO+/YwLVSwNPumOclJ3H4OVdPAlP/6fBGQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4AnOV2W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D134F606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:02:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D134F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n4AnOV2W
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso43276295e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:02:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793739732; cv=none;
        d=google.com; s=arc-20260327;
        b=sX4wBVt656OFnGdJ468rE6UVlqyqMuQQEE8JOE3hERAxV/vIW/1j4ZjSFRY0Pf3zcm
         SJ1PTuI9EfP3kTZYGj16whHmkPHkpJIN+OQJsVd+U9ADieWi2Z9Fgm0MD2nakYgLwE0G
         o36IpC3X5zgRpSDPCGvSYvgMFoBDEIuTC5luVgENZN38E0T+QlpFQDeJGElgSZcIuwEn
         IPV2neqc+Jp1kMygtZtC5I8rd88vpJV57v81qHm0XmYhB5f5+lbbC2nowY+fZhSbZTOb
         QhYtN4gmM19tDlYm4Be9KBjuf/XAzbqn6knV5u/6wuNYkLSUgHK0Sw8SDh00Yt2f8eOf
         bJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eLnVO73afvgaERjHXGPf5E6SbhMPv9R55TpDCQCEqgQ=;
        fh=yLs43c9fSODJk65OpWjFmXAZT00qebi+mMUxq/pPac8=;
        b=NPhRciwsCXyRL1iE8L7ko9ZBpbQYwX7hQ8biVhkZIZAQsev8SNGaiZpheQY5fRmlBd
         qFEhvk2VhIEHp/wW/e3vBCEISW0k+Cvp56CKLfE5cZ3SdGPE0tjZE4ipkYS/NPmpKF84
         EFbhFaOTQxZr7l5a62dbAq9//Nyx4Tcky11rKrrcmCfbgkboks7HBunYZ6wE32W8F3Fx
         dYei5Mvkpzzz/cmBKAOXJ4DR5eA+veN41UcAlpEc+MEoO/Hgay4EMelVTGSzcP5VHOsn
         5yiGrTPw5wwydwROxqw+aqbHQ+damdCm5BAXTo87kaYqoCNMkkRtVHbeQoSKlzW8HagN
         gsNQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739732; x=1794344532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eLnVO73afvgaERjHXGPf5E6SbhMPv9R55TpDCQCEqgQ=;
        b=n4AnOV2WwjJmlHVoT7mQkMmlllj/9Zg73CaYGeNHoYuI/301YzNlEoiIrZrz8D+r+H
         ZoC01zubBN4x0NFq3MyXwSBhvWCg//iL3Kfqb2MDwbYl5P3ZfXQ+Ykt3Im2DzF+f6+0D
         1dyt0NUDhINHAdmIjUDcPX7yntfDJuiYs9AFB2vX3gPQKasHR3Fcdr9Y5sQ64qnUnfvB
         CqLr1+GywYFlea+8mowMJHft08d/3UTFrg8tz43QArT4eARDxta5jnPU9UWf2lWgMV/j
         DFEoPf+yQQFas1fL2citqJk+pyfQ6QyFX7jhMaOaeVZ6Hlnb41xWWNLFRCA8XdHWpjAe
         n13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739732; x=1794344532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLnVO73afvgaERjHXGPf5E6SbhMPv9R55TpDCQCEqgQ=;
        b=MQT3ctnI7iC8h1eCz/nezqWyGfTlsImXe1tqJchRkD7t4UO0N4AhMbihcz2qYfaUOR
         SnR4VYd2gaQJHzE/qeaFzYyL4wNt/vo2areW7gZalwATEC0LxEwoLysGheDKjdUl3Q0i
         vdOfO+U+CYZxwlrlnEwuZwJSM76gk9Bn9/+zGC0WEbe4NHgvyL+2u9GbcCa8C+D2MyyQ
         j0Ro9plYy2EsijvEMk/ry1chk5piGxvrlz81yOL0z6sH+YbrbdQCqSRLzph/iac+5WDQ
         B7mydzrzZszycOCL8iiUdBjR3qG6y0vtbmGoXYXiKvJ1FkOqykGwehNHQNqqlr5EDU4g
         GNSA==
X-Forwarded-Encrypted: i=1; AKwUvBx62a24EGLbGzsNnik5tlbkdfEbucb7lvlNwEwN7Y9vLarK/G8D6nOL3NQO7HhDTurkgOwfRT/ogG64bPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+o9zJBu12SYQULbmZDL82Ztn3ZgdUCOByf2KiHUea3xTA4g9Hq
	SqWCKKqGCIQCezmSyLc5ZPIBdUZiPVsuyF1+f+BpgEK4fWrHHKR1Hte18zIdzYcy+EC2zuUtGDN
	yS8xUVDhk7Lj2YH6bu0jG0i0KAMiQv7vdsyNq6MY=
X-Gm-Gg: AYBFou2Qaeywg8bhX3DCRRVih4+ffihBwZmbRBHHL0GCuLjJ5p95YXrGWVikt2BtxNV
	8Ww6hHNfDZhRlLaGx6IcqOeb+fUgOCLhZxpo82OzYqOf+MbJMjvTA8G/84BJPw8zYj0cgKt7duc
	oSNK3n0izoiXWZzrfec6o5oA54J5GakfRwcVXPTjjm44dhsD1Dk1bNPkkAH5rYvowjZu8ET0e65
	SXyA5Anm/LG8qmw6IMKjlvDs5BXXw0M7WDCHWnIFNJk+u7muOeaehCzfXaj0gFzwo5UWBVJm7Xa
	kocGmx0NIUjNMt9JiFDTGo8MeL/YOFhdNbBfLTvKrShfLdDXlQS1u4TwImOltmQZKb61U7OxruK
	EnVM6NLWHSodzEmKslel2n+CRx7ltfEWEmZeYFt451cs4SuTm0AamuQAbsVEunLD5Zp3EX6Oqdt
	S7HiknnwE6gIx2b/5lKXiywI899YphaUBTW37af6DmQros0a681Ci4Kg==
X-Received: by 2002:a05:6000:2dc7:b0:48f:88ad:7b75 with SMTP id
 ffacd0b85a97d-48f88ad7ed9mr6170165f8f.15.1793739731970; Tue, 03 Nov 2026
 13:02:11 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-swapin-large-unmapped-v2-1-87c70e597250@columbia.edu>
In-Reply-To: <20261103-swapin-large-unmapped-v2-1-87c70e597250@columbia.edu>
From: Nhat Pham <nphamcs@gmail.com>
Date: Tue, 3 Nov 2026 14:02:00 -0700
X-Gm-Features: AclHuK-dU-jDbeAA-AyxlAsBt3J5xyfKTDwVAoojWWH0SE7Uz8Xv3jSOSRyptrE
Message-ID: <CAKEwX=Ow38Y9OK69Y+Eps7k_sdKdkLKuO=Lxn0xisVkuHVePLw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/swapfile: drop a large unmapped swap-in folio in unuse_pte()
To: mt4022@columbia.edu
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, 
	Kemeng Shi <shikemeng@huaweicloud.com>, Baoquan He <baoquan.he@linux.dev>, 
	Barry Song <baohua@kernel.org>, Youngjun Park <youngjun.park@lge.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, tz2294@columbia.edu, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 1:12=E2=80=AFPM Mani Tofigh via B4 Relay
<devnull+mt4022.columbia.edu@kernel.org> wrote:
>
> From: Mani Tofigh <mt4022@columbia.edu>
>
> Since commit f1879e8a0c60 ("mm, swap: never bypass the swap cache even
> for SWP_SYNCHRONOUS_IO"), a fault can read a swapped-out mTHP range into
> one large folio in the swap cache.  The folio only becomes anon once
> do_swap_page() maps all of it, so if the faulting PTE changes in the
> meantime the folio stays in the swap cache while not being mapped or
> anon:
>
>   Task A (fault)                       Task B
>   do_swap_page()
>     /* swaps in large folio F */
>                                        madvise(MADV_DONTNEED)
>                                          /* zaps the faulting PTE */
>     /* PTE changed (F not mapped) */
>
> swapoff then maps it, which marks all of its pages as mapped and
> exclusive, and the next fault on one of the other PTEs crashes in
> do_swap_page():
>
>   [    6.424485] kernel BUG at mm/memory.c:5195!
>   [    6.424503] Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI
>   [    6.427654] CPU: 0 UID: 0 PID: 67 Comm: swapmthp Tainted: G        W=
            7.3.0-17087-gd865f2677c44 #1 PREEMPT
>   [    6.432665] RIP: 0010:do_swap_page+0x24eb/0x2fa0
>   [    6.451035] Call Trace:
>   [    6.451567]  <TASK>
>   [    6.453841]  __handle_mm_fault+0x13b5/0x3b40
>   [    6.458525]  handle_mm_fault+0x16f/0x480
>   [    6.461143]  do_user_addr_fault+0x312/0xa30
>   [    6.462044]  exc_page_fault+0x66/0xc0
>   [    6.462846]  asm_exc_page_fault+0x26/0x30
>   [    6.476708]  </TASK>
>
> do_swap_page() already drops such a folio from the swap cache when it
> can't map all of it.  We move that check into a helper and use it in
> unuse_pte() too, so swapoff drops the folio and swaps the entries in
> again as small folios.
>
> Such a folio was never mapped, so it shouldn't be dirty.  If it is, the
> helper warns and the folio stays in the swap cache.  unuse_pte() then
> returns -EBUSY so swapoff fails instead of retrying forever.  With the
> fix, the next fault doesn't crash anymore.
>
> This bug was identified and confirmed with the help of a deterministic
> hypervisor currently under development.  The C reproducer below however
> hits it within about 1s.
>
> Fixes: f1879e8a0c60 ("mm, swap: never bypass the swap cache even for SWP_=
SYNCHRONOUS_IO")
> Cc: stable@vger.kernel.org
> Signed-off-by: Mani Tofigh <mt4022@columbia.edu>

Reviewed-by: Nhat Pham <nphamcs@gmail.com>
