Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793217007;
	b=GLXdQy+YIdzY7raLvLbLj/AwQ6LTRBgtLlxlidGPpSgFo46T330cTzH4Q+sp/cLhqL/R
	 pKNzRN4bZWiL5neyCWJwaWMacmNWNrwYXuPGdRkZDAz6y3I2kUJbzgsqIqpqwAnuP7q+f
	 iHuAVFMuwVdP+ZHL3GO3sd8X2PgBB6S9Jff7+2F4F5JoJYniwSSC9eUGy7uFyKNRNmiS2
	 T4RJUeezSQKBWEfZ/BzbV2q2ny+msx4lQeUXFdlXlTzoi6Zy42BrPucExg+SnXnN22IlX
	 QyU/giQco53EwfGZdzGA/c1jVru+IAzmBrKxrRcO3DSBWE3alw6HvrzGednV6J9SFPg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793217007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
	b=RKRobuaISOP8rQA19/9hTu9rk26JQ9ZZNjnaUDfUUCepXtTrLfyZgdPvhIUAJJDOkQaC
	 XCRHdhjsbFnNbgI1Qcxjlh7gnEY8FozMjlN7p9dbcm6BKPfEZwjfRciNvJeTgCa4qdK8v
	 GJc1NPXLdU1lzgE9//ujOaXbPvhHKARmJZadJGSPgxFljYc+ERXXy7wgLFWkPLQjTu08k
	 XqwJX00YhkweTsOEajwc6EObj2zHWzsga/oDnWZqD9a11Ao+fxlYOrzmtNhtqeIqyJiq7
	 gh6u2WgkK/TptMqf8gBm9j68kkW2PtW8Ge27p9PKur/jwvBjAHFqkgd1XpAIuB9m7wQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+J8BcEC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5F3606A326
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 19:50:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E5F3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p+J8BcEC
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b10ac6ab7bso13116257b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:50:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793217006; cv=none;
        d=google.com; s=arc-20260327;
        b=ghWCEGjtqUQT3k3qbkfc7MDAsgkFwzJTXkKjZryvnVI42d1Cm9AffMGrTi4X5uMga1
         l7A00L08mxMviesNNBvm/un/1NCE+UY/d1/xbSCBi5IlIihr/7CdjS/HllOQubsq7Xit
         8cxNYKqcM89bThi+QRD/rNSbE+pbYVAHVvnc/RKfChysVurvYOdFSuHSTjkMRxJFf0ci
         uI8B7LTrAr7UHTbIIGZarQX+j1QHBIc+TbeXDHmAH4CVuObnYMlcYr/VJwcxrTtPHFlv
         3IiJA1KYbzXI1yC+PjaNDHdRaZ40Fz4kkAodP87c3Q7YR9p9H7hMEhhUcUVnTQcaVvhI
         uajw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
        fh=4cv2/+V4v41MXeDYoYsz+HMUdLJX4qscn30a8m8XyOo=;
        b=Kz8rPBWDpChoGOiZ4yebIN+octaSr6axAb8XyoqOJCk8cbHNfuuqgAsOOVuKPguxo3
         f+hbrMAt1YRPDu+ZGpl1UFTyZJk8mHEw0c7ery22QLCwjq8SP9ip4yYPkdyDcrJ7EjRz
         t8ZwnMJCtTW7likt2FALLjOxCafty1H6eXBTBQUQzx5N5OkgD8CFIgiBWT+1d3kyUTBW
         KpsYUuelDgis0W9ctTWyilbRB5jZnRNLT6jnK0giDvQ6H1Lr08Cl/njZICGIsyog5Tkv
         AC2oRnSmmmhUPDJ3rdEGU2OtekKCS0hhvVC2GQ3XitRofJtDP5oh/CC6vzv5trhm/NgU
         e0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793217006; x=1793821806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
        b=p+J8BcECk9qp0MqCsZAffqEEIl4vI4RMnAzxwQxLwHjhYniu3ypHCsnijQ18zCM8Gq
         fluB52VtU8Ut5Krf+KyfYPhqJRQZZ0KSer1I3sSRcmwCFTKy4BZW/WTm45zmYqNXwZ7C
         qqA6lzDY4R9wotg88gxKzwO9uWXNHWRn69o+4rCXs4E07CniuY3om8LXxqsc6T/BPerc
         aH29cbPYqNDktsgW8d5W3kLt9l1qhhgWxTgwX0lhoVoFHgfn4PCKoJPIAgQBTd2X++vk
         kXvXeMkM5CnvZLACkUNAE62++QlziRuKpCCce03ODvYuQ25FSzB1wJfdU9ejK0UP48rA
         a6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793217006; x=1793821806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x6V0ut3kqKgQIto1YCEH+vR5sKEvkw9wBhgLEXh9NNo=;
        b=DGR/NVT20G2oFqAJSZ8PtTcZ3XYl5NmvOef/yK8NKD2t0qrFspoZS7nSe6R1lxKfIu
         nlzoCxFddpvS6CSa5KCfGtBU0Z/e+gcwQHI9szjw1voFjupEOtHkv8ZRK8PQ29MFjbFM
         W5G/nPuuZhHm7VNFDK8keiSLz9ZFc9DpL5LVwhH00urhGo25H6/5GgN+qQRgKtZosm+W
         DdtTk4fx8UMcVdLySBqAM36/Ma7ANS0H1MGX1Sd6+4vE7JOUfklH0cVYMsdMb3h65WQK
         91vrQfCHcfp7x3J/Ytr03mTOOYx7MQfLlDvR75mgbOp+/FUmOoLXwaAtglP7AVgRkoRx
         APuQ==
X-Forwarded-Encrypted: i=1; AKwUvBztyz6OPOGWjcQphtSsqMtXV88lVW5GnAzjfJJ4Wro5eCl7QB0qikNX1C794R8MFN9d6uTLJz9GOwk/nTY=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5ZcnqhfO58pTsGq7N6K+RZutsnxlIAp+7LTt7TwrIqHNeDBet
	2jQwuvx4nSdM0y0zcEeRWAfGmd5SHs76ig2m2J8LHsoEVifEsHBX0DY/n3eC4ZySWmOep14mBI8
	3j2kZZ3Enw+lOrCjTu5mgh7wvQ0HlmbV/ICtyUnIG
X-Gm-Gg: AYBFou3Dna230XsTpcMz5kGY+DOIc2jtKlcs3rXco3qm7uPxDqktuCcJRckvqR8HWGe
	mcfUqpAmpCzBuA1AQ980R6xT6Y7GajQvNq8olibNTTH6YTaH7I6zVC6mlBufHHgkrrPDTUmzuvx
	LFWtqgKq2OavM6XaJ+5kj+OCU0HyrVc6MGXOlHJ/CYTLHI3N/Mv7eCZLVFRdSHp/dD5f6HkpCfK
	uzs93WJsibIJVStMOZzJ0+nTVWE62aBQfcIMgQHTB9J9MHkOVD1J3SdwyoLd46tSvhEsxUV/2aY
	OEpsNam3yLCNQgQy0pydrqYWYEHaHuzb8g7AAeGSyvGSndwWyswnLC0n5RBzx4eBsK7oVPL8a8J
	wevacWzfxxccLMXuTYD0bcPy5P6wO1G6IQn069EYXPr7ozKINjsq3cqRmnprceD/pJg==
X-Received: by 2002:a05:690c:498f:b0:8b1:a485:dee1 with SMTP id
 00721157ae682-8b1b5e870f8mr20662047b3.62.1793217005584; Wed, 28 Oct 2026
 12:50:05 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027025616.1632690-1-kevinloughlin@google.com>
 <279a92da-772c-422b-8047-ad37dbae211f@kernel.org> <CAGdbjmJ8qk7FCbGU85u9+db5_RtcrK2y_7TfNH+iuz+OJxebow@mail.gmail.com>
 <20261028145316-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261028145316-mutt-send-email-mst@kernel.org>
From: Kevin Loughlin <kevinloughlin@google.com>
Date: Wed, 28 Oct 2026 12:49:53 -0700
X-Gm-Features: AclHuK-xGxvCvL4otBtvefj81uI5MhPmhwclIN6rdpDM6CRLGOUQBZrCbVhrSfI
Message-ID: <CAGdbjm+4Jqx8Xv3uvhgaaiThYuVT0vF6UGx83XUku04Q_PN+OA@mail.gmail.com>
Subject: Re: [PATCH 00/13] virtio_balloon, efi/unaccepted: support memory
 ballooning and free page reporting in CoCo guests
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Tom Lendacky <thomas.lendacky@amd.com>, 
	Ashish Kalra <ashish.kalra@amd.com>, Michael Roth <michael.roth@amd.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	Alexander Duyck <alexanderduyck@fb.com>, virtualization@lists.linux.dev, 
	linux-coco@lists.linux.dev, linux-efi@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Sidharth Telang <sidtelang@google.com>, 
	Punit Salian <psalian@google.com>, Peter Gonda <pgonda@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Jacky Li <jackyli@google.com>, 
	Steve Rutherford <srutherford@google.com>, David Skidmore <davidskidmore@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 11:54=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Wed, Oct 28, 2026 at 11:12:47AM -0700, Kevin Loughlin wrote:
> > On Wed, Oct 28, 2026 at 2:01=E2=80=AFAM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> > >
> > > On 10/27/26 03:56, Kevin Loughlin wrote:
> > > >
> > > [...]
> > >
> > > >  mm/page_alloc.c                               | 248 ++++++++++++--=
---
> > >
> > > This diff stat should give you a good indication why this series is n=
ot acceptable.
> >
> > Got it. I will keep that in mind going forward, especially if I end up
> > attempting a v2 that simplifies things.
> >
> > On that note, I believe the majority of the bloat in mm/page_alloc.c
> > comes from...
> > 1. supporting the legacy inflate/deflate option
> > 2. introducing support for various page sizes to be unaccepted
> >
> > (1) I can get rid of by dropping the inflate/deflate option, which I
> > think makes sense given free page reporting should be sufficient to
> > enable dynamic guest downsizing in cooperative scenarios.
> >
> > (2) becomes simpler in part just by doing (1). For further
> > simplification, we could potentially restrict free page reporting for
> > CoCo guests to the current 4 MB MAX_PAGE_ORDER instead of supporting
> > any order 2 MB and up. There's a trade-off here for reporting
> > effectiveness under fragmentation, but perhaps support for 4 MB only
> > (and its relative simplicity) could be acceptable? Especially since we
> > would then maintain the invariant that all pages on the unaccepted
> > list are MAX_PAGE_ORDER?
>
> I'm not sure what is meant here.
> But if a lot of memory is free and it gets merged beyond MAX_PAGE_ORDER
> and then it's not reported, that's counterintuitive.

Sorry for the confusing phrasing on my part ("2 MB and up" vs. "4 MB only")=
.

MAX_PAGE_ORDER (order 10, 4 MB on x86_64) is the maximum order in the
buddy allocator, so free pages never merge beyond MAX_PAGE_ORDER.
Today, page reporting logic scans from page_reporting_order up though
MAX_PAGE_ORDER.

Accordingly, what I meant is:
- Currently, upstream mm/page_alloc.c assumes every block on
zone->unaccepted_pages is MAX_PAGE_ORDER (4 MB on x86_64).
- In v1, I set page_reporting_order to unaccepted_memory_order()
(order 9, 2 MB on x86_64) for CoCo guests, such that free page
reporting processes orders 9 and 10 (2 MB and 4 MB). However,
supporting 2 MB blocks on zone->unaccepted_pages required generalizing
mm/page_alloc.c to track variable-order unaccepted blocks (Patch 7),
not just MAX_PAGE_ORDER.
- If we instead set the CoCo reporting order to MAX_PAGE_ORDER, all
MAX_PAGE_ORDER free blocks are still reported, and we keep the
existing mm/page_alloc.c invariant that every entry on
zone->unaccepted_pages is MAX_PAGE_ORDER. The trade-off for this
simplified logic is that a standalone 2 MB free block whose buddy is
in use wouldn't be reported until its buddy is also freed, such that
they merge into a 4 MB block.
