Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6860A4A091B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 13:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788356690; cv=pass; b=rOMYPuEVdqpbipkFcXOTFXkhI8mm2IUJ1XfwAKT5Mk8uuBr7nSfyWF8TYUWEkVEb7Dl3T4Fur1E5hUnI14g1pKmvE+y+Rnt37+a1ybXxa6vVi0Mnid7dNUOfI53PugkJ25RALJq2A15z5naET9lSIiNOOLpYQNuW7OeZbLyF3jU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788356690; c=relaxed/simple;
	bh=1FmV1x5QxFOQdXdzoayVGJUSKQjfwQz5XyfnM7vvKJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sy67MIyp5cv79HXiGB5PClFIWOAuF+w7Vo4TyZNPUtTPEWpkTSsb9o7rWp9+nzNWS3FUaO11EsIudUq3nV1hTJyBh3l64rHIEhSYbBvs8YhIZCGheSxmik07mtiuuGuSCzL19jzONZtAwnhEBURawzrNlDojTDR1FbjTmGSujpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PY+flS2A; arc=pass smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PY+flS2A"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-97cc700fcf5so1416205241.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 06:44:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788356687; cv=none;
        d=google.com; s=arc-20260327;
        b=Ry/GNzWiaWhS/mo1HRx1UvlOzyW8eqxL9IvEbXr/mBJ4xNxbUmSKEBC2Mfnlc4q3rm
         e7XJnn6DOVyT6A8TIQEaQFK9pDg0uklgJBdnCUv/zjt0zfMCq9IuIVs1NmmvCNSlYU4V
         Lio+IhUZugNqonWX1n3mbN5NzOllGqa+IOI5cE9jsdlLYR3y1u6ZMBUsPyxYzVrLHhOe
         RTJ9tkXeX+cYwhakl42lQYo9kNspkCm/0EzDbbDyE3QDMZFBfB/6VNpxDR5vFnE00DhN
         IxTrtwRV1JgDsSNyqQLsSe6GOQeHmCVBtYPQBhsJ0NB9vf1ngs5J/s+gcvufoF0aabTA
         mCIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dSC4i56GDCKpLLN6Iph6zr29jWx7mFCg/VcjlijsBo=;
        fh=4Ya24GNBd6rjxcXe+Pq0rjqDd7avZNwUIYVZEHznbNU=;
        b=rTudadYvEuD+uRGs65Z1Arst7IvrQMlZczFVHfv1SQ4o0kcQKbaFys0Nvjtl7YVDoM
         vmC4CQHFKj5QRJNAjQyXL0EIGhyE4hLVvNeoUUVuscjNhksZtKCpvfDKgfKCr4EM2XPo
         jKBiqN9aTS6OY6jeyrMfzVylRIwHBfj7QQuP6dAoCQNr8GXP4QtYozlK+x8rG8kllFCj
         W3LUf6dsGkJ7dFFNe3M0VFnZ8x8zEP4cKTydTM8Nm32ws86wFsUgSPwCiDGDwuM8jU9d
         COZvRY4MSH9whWBQ0Go2FKMdocM1qwR3ZeatzV2Yhg2zKsBWxjNq0zAkwXM+oUq/8WVw
         SAUA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788356687; x=1788961487; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dSC4i56GDCKpLLN6Iph6zr29jWx7mFCg/VcjlijsBo=;
        b=PY+flS2AYfW7c/WsVfXXcq47PSXzkHnQBPWB0DQgi2h+hlmuk+WNQ9IBLbzYDXTcW0
         OU1UykZC/figLH82QQvgmAL9gNw986FHtozNGKTjJs2SqYE/2GKXAph+bYJ5DO+07LOS
         gyj7yTEw7t4oskT3O4KWDtjEOH0gGjW6iDaZaRw7nve8utJhK9rMDXzHUlgsBhTEM3bg
         5GinnynACF8X4VQXlWEDRFPm4DezYMFFlCyM9/TGFPul4EeARD+XWgqNYf92xvERIQXW
         KZv2ZP34kUyLQ2fELzlfTtYdETRO4s+k7PzoEjbrqbAw5/6e8zBqz5TMNR6UHnifhLZo
         VB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788356687; x=1788961487;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dSC4i56GDCKpLLN6Iph6zr29jWx7mFCg/VcjlijsBo=;
        b=sgU627WPxEMPtRC6SBde9oISWUpCnxh82pi6whLykpXtbtkeDMnO3g2wfzyMe60sCD
         MytClFA1q74S07pFsNumZ/K/c9czahMTRj75/J0F4i8vz8aWlcMh1ymwbBAqj/Xg8JBt
         q+0R9/G2L95nzZPNeQxEacj0Oj+sJ1c94aKWIXiRpVjBOZqa7jRN6frXppq48ZjXAM/d
         IXRLSTldBIQSQK58hbVUifhMPuceCQzlmuCKiOHhEeL38etrALDpXuDWKAu+89Uus663
         AH9i3TXaI49mdoVgc79REpPJohySDI9skmPzAxNaHKroZ9/hDiziBbtTUMLPx79MK6Tp
         3QdA==
X-Forwarded-Encrypted: i=1; AKwUvBwKi0YTSLN2sBEqRjlpIOpLcBBGz0qmJBuRAVyaUCA4KxZUXBltwIBOzsES+57brLY1kMyREX98CUkTeIM=@vger.kernel.org
X-Gm-Message-State: AFuF++lEL8kSQJpL3stGqTNI50eE7wrhEEAQd2Uu4mK07Mf+CYJz3jkR
	35WkGOkd31wllh1cqiDU1AIFJUluN9mdjI7REo+BFyTifLPdd5chjJbo81qwb2YzgQuPGU8cass
	idQwSKPcBlo2uj5Qc8DLru240bbmjQAo=
X-Gm-Gg: AYBFou3DnCbb8uCV1bF0B3q3ZrVAnIaY4+NoskMV81oKBXEnfvPdqFW7oipCmZvkeSI
	rwFrK6jDPR08zBf637rwLfS9UZ6Bwsj1opEaDF8G74ZSb6BhaK4EQYsODDoOumIybDDh53I6wdp
	FhSHWErQY+8PiwFxKaiWl5gjRNvoVyuXElfs0PCAPqeKrgZ3zQYb/vGRlxcUeS4a/BcPI+egqrF
	J87splPy9IO33nm1lYjXphyGhLlAaq3wO8FWDoLmJrpz0SvKYx634HsyU1u0CB58cw09GpTpqnv
	Mqnsy0Dfi7I+bPHdWaEmQprIoTYeFV6EuAZWOluKw7NN+p7UGFpDgv+9n9kVWIrOsGxYURuinMm
	lABXT
X-Received: by 2002:a05:6102:41a6:b0:779:328:8a2e with SMTP id
 ada2fe7eead31-78a1f725fc6mr950132137.5.1788356687181; Wed, 02 Sep 2026
 06:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-remove-wait-on-page-writeback-v4-0-0e5e53d47eb0@columbia.edu>
 <20260817-remove-wait-on-page-writeback-v4-1-0e5e53d47eb0@columbia.edu>
In-Reply-To: <20260817-remove-wait-on-page-writeback-v4-1-0e5e53d47eb0@columbia.edu>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 2 Sep 2026 15:44:33 +0200
X-Gm-Features: AcwNN1Vvf7FpyU1HrqjBI0mng4bI8rN-Wlo5S9DqsAbNDuh3hnayuNaPhBcoE8o
Message-ID: <CAOi1vP8SCZaFTodwm3_c9cFfc4UB5X8J8vF-sxh+4TuhCS8iog@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] ceph: fix error handling when the OSD client is
 stopping in ceph_submit_write()
To: Tal Zussman <tz2294@columbia.edu>
Cc: Alex Markuze <amarkuze@redhat.com>, Viacheslav Dubeyko <slava@dubeyko.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Zi Yan <ziy@nvidia.com>, Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, 
	Jeff Layton <jlayton@kernel.org>, ceph-devel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>, 
	Sashiko <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 17, 2026 at 9:15=E2=80=AFPM Tal Zussman <tz2294@columbia.edu> w=
rote:
>
> When ceph_inc_osd_stopping_blocker() fails, ceph_submit_write()
> redirties and unlocks the folios remaining in ceph_wbc->fbatch.
> However, none of those folios are locked at this point: locked folios
> were moved to ceph_wbc->pages[] and removed from the fbatch by
> ceph_process_folio_batch(). Unlocking them triggers
> VM_BUG_ON_FOLIO(!folio_test_locked(folio)) in folio_unlock(), or
> unlocks a folio locked by another task.
>
> This error path also returns -EIO without fully cleaning up the folios in
> ceph_wbc->pages[]: their references are never dropped, fscrypt bounce
> pages are never freed, the writeback congestion count is never
> decremented, and the pages array is leaked. ceph_wbc->locked_pages is
> also left non-zero, so ceph_writepages_start() loops back around and
> hits BUG_ON(ceph_wbc.locked_pages).
>
> Leave the fbatch folios alone, as ceph_writepages_start() drops their
> references when releasing the batch, and unwind ceph_wbc->pages[] the
> same way writepages_finish() would have. Abort writeback in
> ceph_writepages_start() instead of continuing, matching the handling
> of ceph_inc_osd_stopping_blocker() failure on entry, as the OSD
> client is being torn down and further writeback cannot make progress.
>
> An LLM was used to verify that the cleanup was comprehensive, and
> suggested aborting the writeback instead of continuing.
>
> Fixes: 1551ec61dc55 ("ceph: introduce ceph_submit_write() method")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Link: https://sashiko.dev/#/patchset/20260804-remove-wait-on-page-writeba=
ck-v2-0-81f0ab065284%40columbia.edu?part=3D5
> Assisted-by: Claude:fable-5
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/ceph/addr.c | 36 ++++++++++++++++++++----------------
>  1 file changed, 20 insertions(+), 16 deletions(-)
>
> diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
> index 1f77aec8e960..d5a349daf4d0 100644
> --- a/fs/ceph/addr.c
> +++ b/fs/ceph/addr.c
> @@ -1482,27 +1482,28 @@ int ceph_submit_write(struct address_space *mappi=
ng,
>         BUG_ON(len < ceph_fscrypt_page_offset(page) + thp_size(page) - of=
fset);
>
>         if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
> -               for (i =3D 0; i < folio_batch_count(&ceph_wbc->fbatch); i=
++) {
> -                       struct folio *folio =3D ceph_wbc->fbatch.folios[i=
];
> -
> -                       if (!folio)
> -                               continue;
> -
> -                       page =3D &folio->page;
> -                       redirty_page_for_writepage(wbc, page);
> -                       unlock_page(page);
> -               }
> -
>                 for (i =3D 0; i < ceph_wbc->locked_pages; i++) {
> -                       page =3D ceph_fscrypt_pagecache_page(ceph_wbc->pa=
ges[i]);
> +                       fscrypt_finalize_bounce_page(&ceph_wbc->pages[i])=
;

Hi Tal,

fscrypt_finalize_bounce_page() was removed in 7.3-rc1, so this one and
patch 8 need to be reworked now.

Thanks,

                Ilya
