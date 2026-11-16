Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794801121;
	b=JcK6Y/fQKEQuVkb605mOQkHvs/guTcGUHOO1a/KjdwawZJlyAuQoc+tNXP0v7aYdOB00
	 A40DOrDe8hSHKgTPalxve59LeblSCbugwkkKIBTev+fjPVFLZ8fI/XOExK708H6Cp96sN
	 OwTiBzYaaQQL1c7oXPUfL7upkM6ZgczVSa1hPPRD2Hz1yJ86dNIuGLlJRzI7N5aschHOQ
	 M+jdajMWnfz21sw6Bjp4ELd50KoYz6/GuQ2ns4c0+urk/mxUc+LDRMl2KaMZwpintAJw8
	 yZtkAW2FoeVfxawWTJSSJu9shhW4lWy5bwLR4tMTTKYs//TtCxU2Yo3ijBH4GnETmFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mHMeLHBcjlpdKQvivDV94WV6xZA1r0k1UiU5sTtS58g=;
	b=1pggKWjBfvfOBxjsPwKvBNMxMkCxfX5f5JdidFVkBhy3r+qVE9wLoAGHQXERuNZoES+e
	 7Di96oCIShNv5coVzfYCqbemCDOLLmWO2JpcH3P0Wvxxzi3i7Qt1cGYHSufnxhJuMskuc
	 T4ZQXw3s6bNvM8UBnib8WsfpbecJdAF8FaUPDrE9UkXbl7kjYsCMo7V6Tyg79abOb07BL
	 Wg5u517UBAEfBJZ8S8F19gvLQXTXqtGW3xGSisgE8Zw8Vj2bQZezH4L5YUWnSn/QtaBvW
	 sx3xUq6w5WNCabn4btHSDV9uAeQnqDgv8EOUAfOSxu9X4FI97I78ZJocbPTNvsn16Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5G3DvU+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE100606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE100606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E5G3DvU+
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c506a231b88so416581166b.3
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:52:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794801119; cv=none;
        d=google.com; s=arc-20260327;
        b=pC7WXn86uxoBCkvju3d5+H2I5elhExwraJbzjNEbdI5CnBkmoavARJ9VS6ZRbeUPro
         +lPzGrm204D168+4cknz0swiHlSb0qLikeTempRaxP3lJFS3iJBnPvN4iHDoqvAumkrn
         yzSnZDqZn7ZxzbhaAC4puvUcXuvJXWPbvF8XD1VnooC/9M3kieVA5qUib9MqMB5WTNzA
         oZOb7bpw4KieWvVXieV+hMC64t6lC7a7PUsq5tbkUKxoPsi8StWve0haevSOgqaWAVCu
         h3iGDqntdnp6UOwy1UK4Wy8XaQAQkSV9aQ6O/SG+5tWI890FIe36IgvTrC4CfY/bXqfo
         /j2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mHMeLHBcjlpdKQvivDV94WV6xZA1r0k1UiU5sTtS58g=;
        fh=RaUoyOFeP2BAVXGxrMPcmH/ToWaE9qpPpDX3daTJU90=;
        b=E2g9iuav9lRyF5NpbEQ+11DUfgBMfcAJRj7d0hNDARADih3Gse5227nm69gtUd1GPY
         4FOWL3Xf2TsKEbdIb0eVoEt02eXfkLro7PT4JVX65laVAiwMkPVOELbx2/N3NucxUDHE
         BCBLQ7zFVlX0Teiyh9sc2f3g9CVkL1hMqElAACq1YrTGXa6jCvr8/qJ3bwZUCa2/oJwg
         hLFsZEv8xWsLa9XFZDttVZNokywkfIzOnyxW9jl/pNB6TWYqspWQj9g97L7GB9vML8zo
         0SQ/pk/fI8tIlyrsqEBxa9zopuh9POZadqa73ZeHPN2Ki2BPXusnPcSLUGSss/lg4rtW
         CsOw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794801119; x=1795405919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mHMeLHBcjlpdKQvivDV94WV6xZA1r0k1UiU5sTtS58g=;
        b=E5G3DvU+Yq5hFKIs0mhcY6Hs07QWT1xclq1ysyigPuiQHNZy8hEJXg6Vez8Q21U3Pv
         y4J+5tE7Pwoi/bC7LJCcLpXBfV4PoPFGx8NrELUjUEvrqjQXL/QEiOYTe5regi0EJVst
         QCU4VTzy1xsR5rs5hhFbSSK8lEtYZTk6ohRDDtXuWo9arIzhHNf+9k6sTv2j1JiKEK90
         rF+pkTiCxpBfqFWys58HY9cWQZmGMbMeaI6y2YHtI2MJ5K9Q63kaiFecOOtSS7bK6BX7
         B+Wsaf1kJk+703Ayop/wlRglRUoNkGhZW86EYnVR/hgHK73fN2Lu7R3ZrfYKMqS3ZCa9
         QKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801119; x=1795405919;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHMeLHBcjlpdKQvivDV94WV6xZA1r0k1UiU5sTtS58g=;
        b=weh56ZpW1ayQTBTRpU2qTUpN2syEdTa8yFHsjJR7x6Mx9sgLpGNgQy+p3BiQk9CSFL
         RBguHPR45ihWaMTQNmfWIrwO7bOexNhxQL24IsITpL8zgAJxOk/HD4XHbjPtuAppf5Nz
         Guy6P60Xq8uFn951G145jBwpWXEpIIj14SCeobgjg+sDM8E5iR/RBBCC62VQujxdDCyC
         QvPzwEGYKd7dXGKDW/2aY7PcxBR3i9JbMkP+siu6vU14/TLD3I9H0sozRhL7lIjEzth4
         mZ+s5EByT+P8OMS+xY67WKWB4V/+271m18UGGsbVTMDd6gNQh9z6tm2qURzK3/jh1xqk
         G97Q==
X-Forwarded-Encrypted: i=1; AL+hErG82lcF6UTJU0ZmXLZlzfdUKGSMtT0OCw/gTDW1Lop8pWr7Tstk33HJj8H2bXzWTrbn3qMQjSFG8t8YG4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xer5jU71u7wpEzEZQfDJwwnRIJ8dWiGKrxf4Vg5J1uLuMB5s6
	3q29waARgFk6PWgo+iNf1zmQuuSEVt7r9LqRcIqrSmc3wEN62/JNHhj7p4urvBppQmhKwY+d9fs
	QL4R7S5sAMn88TbRa11RENltTPaOlh0s=
X-Gm-Gg: AYBFou0vmzEQjPd4LTGPsQuZgLPoQyHcKxxOFj3nejsCSkvXDlC4L8GBhJ1+Cekxy7A
	YK8THftgt/5R36o4L4+qFnKb8JsTUxA1vvXqShsdzAqTDVNe1RLeRfOgOzeUVxSRGNVuyPw+bHf
	vgyexZxkteuLSKacy9EnAVQvzBmZR/9sgMnuLUrRnNo0RXD1/P+WCwHnWiSoU5xtA5O/N9uF92S
	HK7V6+n0x1ueNJke7pVYbDEto1YWMay+Ff/RHBsXu+bSVZoRJkfFPWsDBlyrHeCS1rGARHkn2++
	ooX7ekxOOBEekWzgBTRk9p6/Jf73qI18cg+8R9uiyjCyvtl48NXJN8Iy4j5wBC8Bx56FU+5NGBm
	96gX/6+tckQ5r2Wy4wsKqRq5/MbxSMyEeZKPLzn4oD51A1cg3/rSxgVTG68WTdSDyWL42Gw==
X-Received: by 2002:a17:907:8687:b0:c4c:f85f:aa2b with SMTP id
 a640c23a62f3a-c509641c620mr670977166b.24.1794801119103; Sun, 15 Nov 2026
 19:51:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1794666741.git.lianux.mm@gmail.com> <62dce3641b589e9cd42edccf0d4e9b31e7d91e36.1794666741.git.lianux.mm@gmail.com>
In-Reply-To: <62dce3641b589e9cd42edccf0d4e9b31e7d91e36.1794666741.git.lianux.mm@gmail.com>
From: Kairui Song <ryncsn@gmail.com>
Date: Mon, 16 Nov 2026 11:51:22 +0800
X-Gm-Features: AclHuK_Gbzghz_9r5pcBeCg-HWxSEX1oN3xYkrnwlrCQzsB1W6e7M40eujJdLuM
Message-ID: <CAMgjq7BnyM76DR8cdaz4o5PEg0=4rBAcGvWwoHqFDfPpoqu4BQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/18] mm/swap: add priority queue for swap device allocation
To: Lian Wang <lianux.mm@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>, 
	Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Barry Song <baohua@kernel.org>, 
	Youngjun Park <youngjun.park@lge.com>, Kemeng Shi <shikemeng@huaweicloud.com>, 
	Jihan LIN <linjh22s@gmail.com>, Kunwu Chan <kunwu.chan@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Thomas Gleixner <tglx@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 10:51=E2=80=AFPM Lian Wang <lianux.mm@gmail.com> wr=
ote:
>
> From: Kairui Song <kasong@tencent.com>
>
> Swap device selection rotates swap_avail_head with plist_requeue(),
> serializing cluster transitions on swap_avail_lock. Separate selection
> from device-local cluster allocation with same-priority device rings
> ordered from highest priority to lowest.
>
> Keep membership and sizes stable under swapon_rwsem during each
> allocation walk. Full or disabled devices remain as masked pointers.
> Serialize tag writers with swap_queue_update_lock and use READ_ONCE()
> and WRITE_ONCE() for complete tagged-pointer accesses.
>
> Each CPU has a starting offset and base-page quota per ring. A task-local
> cursor snapshots its starting device so retries visit every peer once,
> even if another task changes the shared reader. Disable migration across
> the sleepable walk. Large folios retry same-priority peers before asking
> the caller to split instead of falling through after one fragmented
> device.
>
> Prepare reader storage with GFP_NOIO outside the topology writer, then
> recheck priority and required length before publication. Transfer the
> prepared storage only on successful installation; otherwise free it
> after unlocking. Keep per-CPU backing allocation outside the writer's
> noreclaim scope because it filters caller GFP flags. Constrain small
> queue/ring allocations with a scoped noreclaim context and
> __GFP_NOMEMALLOC, restoring context before cleanup. Deletion keeps reader
> storage until replacement or an empty queue, avoiding shrinking backing
> allocations beneath the writer.
>
> These boundaries prevent queue updates from reclaiming into a swap
> allocation that would acquire a reader behind the same writer. The
> cluster metadata fallback also avoids direct reclaim while the walk
> retains its outer reader. These recursive paths were identified by
> source inspection rather than reproduced hangs.
>
> Publish swap_file, the live reference, queue membership and SWP_WRITEOK
> under the same writer. Complete the disable flag and queue mask
> transition before releasing that writer, so a new allocation reader
> cannot select a device that is no longer writable.
>
> Mask the off-list flag from the old in-use counter before its full-device
> comparison so concurrent freeing/refilling keeps availability state
> consistent.
>
> Keep the old available plist in parallel while migrating its remaining
> consumers.
>
> Link: https://lore.kernel.org/20260714-swap-pcp-priq-v1-9-de9b164ed419@te=
ncent.com

Hmm, this patch is now quite different from what I posted in the link
above, e.g. there wasn't a "struct swap_queue_cursor", and some of the
naming in it is quite confusing:
e.g. "ring_only", I think what you actually want is "fallback_allowed"
or "no_fallback".

And since there are three iterator-like structs, we better reorganize
the naming; 'iterator' vs 'cursor' is confusing. e.g. maybe reame
swap_ring_iterator to swap_queue_reader_head.

And why do we need a "cursor->valid"? I see a following commit dropped
that, so perhaps accetable to keep it as intermediate step though.
