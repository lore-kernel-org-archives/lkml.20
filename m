Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F39025B2F4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788525015; cv=pass; b=ugEfc1dtoY3oIgiXUkjzeB+2BJ6NKNo1taUK5d1dZWHATWpNCRkAeVZS8edSykYfg+MxPsjD2/ZW2V31c7SXbCGcVib3gLTi1QJiJfqBzZwz3Sa86kjqwXReymJXxS2CygYVL2LeOkF+xboo3RL+PSk1Y74sxHoMfwD70cB0bc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788525015; c=relaxed/simple;
	bh=I5BTR/HzEljtc2n+E1gWlsVC4e3Gg+56Gvfb2/y5hhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DkA1pyY9/lRYSOEtxijBWysISL8W55AwdEde4udh20myvWG870774ClcOS+S1dx7or+FVYc0S9tgLYuZ07gcXICD/9WHOi0BmeX7XOTPwgHtzd7ebBHcsfs/zsj/JBH8uPQwlIqcaljJtxOeeKcMuO/Ryn88joXBrFIaFSEAsok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KRIs7YtW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HWw5D8XI; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KRIs7YtW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HWw5D8XI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788525012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XtgStQ72qjXy85OqcnWwLSAXMnFcnfmb4j7jwPWJOV0=;
	b=KRIs7YtWy+m06cEyEE9dScwW4HVxhuOcqRm45pAMBhA9DDKOZ6BZ12/oUm7m1FiKy7VWrX
	xGUs8ZNrk+D8DQ6q1q9WZe/uTMEudsiNXqq39VJQKR9kHvrmtXo06fev6uFFT4hE0F/3Qe
	TXjPTPJ0vTCqFLM97HTv/bZ9JLQHpm4=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-507--OWDhjl9N0yjY3Tm_60z6Q-1; Fri, 04 Sep 2026 08:30:09 -0400
X-MC-Unique: -OWDhjl9N0yjY3Tm_60z6Q-1
X-Mimecast-MFC-AGG-ID: -OWDhjl9N0yjY3Tm_60z6Q_1788525009
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-66f81a0f5c9so1062472d50.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788525009; cv=none;
        d=google.com; s=arc-20260327;
        b=DtnIGAYw7AsVoy+IZjazRioUkpptxfpVY8BMJEDizIo0kxdP9Hcf6wZhmZTDHgwN4V
         gwAKmlosi4cqEAq/SBmBLHeJecHoluiLy4G1iygD6sUT2s6zxa/dZzKkGUbmVOC5ATbK
         l22jzQ7krSfwKuYscEpV7bfvsj6VIABBqMTKQCkmTIuy8eZRRgRBIEdFHdq7B/3j9EE8
         m3DTDqnDyi44nGbllr0wvg3KKhIpoRUTwB4x4AHtHvT3pHQ8PiQH24HpSrI4AeMkE3yO
         7m67xUgiQOtdpw+CRl2RpKzyEwfDQfI5JeTH28Yz5hxLN2Wi2prXeBVHyWL3Yv5IJk13
         Ms8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XtgStQ72qjXy85OqcnWwLSAXMnFcnfmb4j7jwPWJOV0=;
        fh=PJ6sdCotBV1qasfVc9OY3rsOSKvmrtNp92uK82PcuuY=;
        b=eTRf5msNAmNg3vORue/m8HDyDWjm8XCHyg18JwajrE+DUV1r9Xvnjo8+p6ePC7FeBT
         DiWtPFXNi9w6C80jbswy3hzzWNptoLMIx7GkuQy1kMTLooZn4Gc3GL4HKuugNy92++Zh
         qgVbRiULLQF9lFfVMIiT6NSOvvi3EVUr9U8v+P0OLAI4IQZ/KCXOxyxaRvP6JE1ddDUS
         Q7WQvvUu6iepn8MsAIxwhXdoo/JsqSX4aJi0qu1R5OW+4NoSqDMmC/iHp4OPPeVihUUN
         MHqHQo2PG06hvDZprzf++ZcgG1FBEEPy7GEdS3UAnjbWPv5HT5YmBQX4heiwrHB1r4LP
         flow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788525009; x=1789129809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XtgStQ72qjXy85OqcnWwLSAXMnFcnfmb4j7jwPWJOV0=;
        b=HWw5D8XIbLgR2wTFmyTuO47mPn+qpu9RM1DOIYEQwrmynxSsHx0g9doNSSmRR0QaDk
         FR/2ydhWBKbbqiqyNBIzb8tfceKUnzXLFOYyb+Q0uhdI49z59JnF5gevDsLfKm2GDrxa
         lOT5oGN8guWKEDRJkTDbRiMHuopos/vwkxTFOmVHfHPYwtGQkz4S6MHBgZx96oFHJ/Xz
         jlxQiT0oFAP8Mx/HYTXn7EN6B4EG3GpemyDb0QLUZK9HKwqzRUb8rFUP/rhZWi/1H0WT
         ScCe0I259GaZ6/MORSAR3ELjB0CamLCxHUmiksTyqjCQ9f889t76edSeX43SM3RNnEM/
         2i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788525009; x=1789129809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtgStQ72qjXy85OqcnWwLSAXMnFcnfmb4j7jwPWJOV0=;
        b=KH89SlTSq1ppmeQ4GZQ3fCUmaRcY5BeybRvMe6r3711ZONr1y/lK3u397ASOmPiKZk
         fhoradl08mUl0NNZt3AmGMNiB+Y8VrEBRILYsQe9R70GsXFjDBO05Pb/YutW21w0bNz6
         cKuZMq7V6DClW436LqDgM4BVJ+wenuEPKwYbBTLOarxIyoUFuQN/ti7NI/LbyCgDtfP5
         t21MxAcTVue+mBQ8Y9Bdlk6zQO1PpZFa3CRt/l2W3vuYHaIpupDKrkn1WRRoiLVp/IPN
         Smz6JieOyJDYEdp4JLuyK8CgunhWPqbKxN97d5Br2KKD3oiojQoDJ3qS+93MnplKlz8e
         51tA==
X-Gm-Message-State: AFuF++n4bZvGWkDnPL5wzpXzXcZXjTATIBCDTtAmXhLOn+hgq9R7V38Y
	oD4kURK5QksqCLUoKh6hdTPfmM2PocTL/AbvUnAt7YRYFqVuR8wA6ZkRFHWPDmewnoQaJ5ABzsC
	SYRWpbzUIJQDxSWeBe5jk0KYHr+U07Xb+4Cc1zqHDqCdMLPgGNnBuNZGM0CvXAhz4jhKpiPxQbV
	VRZcs9moYY2o5N+Ddz9bKmjYBNDEIRc7SNy4c44Q8M
X-Gm-Gg: AYBFou17WlsxE4oXyvbmPlN9aEPHX7NVG5xU8dciapyn+R0Wth0b/xCo42V62/62WEv
	VOUSEox6wBsitdI+D6o2QwTkMX9oriXW8QxBebmmdbiYt+ZIwtirz5pcaaJxT5EpvUMuA+2zF5E
	CoH2xdGabbfvxRehCvDMwpbzRff6/RSgL1JMWmjVx6G1Ig/Rxt505oUtw7Hp6HCMbTIqlrdcwkI
	a0a86uvOGaDZFGIamqg96v7OEPUaAt7bmt4KBZwv6s/
X-Received: by 2002:a53:dd03:0:b0:66f:c1bc:c07b with SMTP id 956f58d0204a3-66fc1bccb91mr66223d50.67.1788525008566;
        Fri, 04 Sep 2026 05:30:08 -0700 (PDT)
X-Received: by 2002:a53:dd03:0:b0:66f:c1bc:c07b with SMTP id
 956f58d0204a3-66fc1bccb91mr66213d50.67.1788525007971; Fri, 04 Sep 2026
 05:30:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904112429.39814-1-hemanth.selam@gmail.com>
In-Reply-To: <20260904112429.39814-1-hemanth.selam@gmail.com>
From: Andreas Gruenbacher <agruenba@redhat.com>
Date: Fri, 4 Sep 2026 14:29:57 +0200
X-Gm-Features: AcwNN1UUnidSo_VDSIw3MRLX-0N_YQGsHOYA7b1CtjBhz2xIhMPaB_wEABGsBCc
Message-ID: <CAHc6FU43bc6Fawpst1G_MhUuN9itSpoj10qguKpeNsBHeOyDNQ@mail.gmail.com>
Subject: Re: [PATCH] gfs2: fix typos in comments
To: Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, gfs2@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 1:24=E2=80=AFPM Hemanth Selam <hemanth.selam@gmail.c=
om> wrote:
> Fix typos in comments, reported by scripts/checkpatch.pl using the
> misspelling list in scripts/spelling.txt.  Only touches comments, no code
> changes.
>
> Assisted-by: Cursor:claude-opus-5
> Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
> ---
>  fs/gfs2/bmap.c     | 2 +-
>  fs/gfs2/lock_dlm.c | 4 ++--
>  fs/gfs2/recovery.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/fs/gfs2/bmap.c b/fs/gfs2/bmap.c
> index 73c626971163..8c734450c998 100644
> --- a/fs/gfs2/bmap.c
> +++ b/fs/gfs2/bmap.c
> @@ -1212,7 +1212,7 @@ const struct iomap_ops gfs2_iomap_ops =3D {
>   * @inode: The inode
>   * @lblock: The logical block number
>   * @bh_map: The bh to be mapped
> - * @create: True if its ok to alloc blocks to satify the request
> + * @create: True if its ok to alloc blocks to satisfy the request
>   *
>   * The size of the requested mapping is defined in bh_map->b_size.
>   *
> diff --git a/fs/gfs2/lock_dlm.c b/fs/gfs2/lock_dlm.c
> index cef4bdee92a8..47eec0c13025 100644
> --- a/fs/gfs2/lock_dlm.c
> +++ b/fs/gfs2/lock_dlm.c
> @@ -431,7 +431,7 @@ static void gdlm_cancel(struct gfs2_glock *gl)
>   * 10. gfs2_control sets control_lock lvb =3D new gen + bits for failed =
jids
>   * 12. gfs2_recover does journal recoveries for failed jids identified a=
bove
>   * 14. gfs2_control clears control_lock lvb bits for recovered jids
> - * 15. gfs2_control checks if recover_block =3D=3D recover_start (step 3=
 occured
> + * 15. gfs2_control checks if recover_block =3D=3D recover_start (step 3=
 occurred
>   *     again) then do nothing, otherwise if recover_start > recover_bloc=
k
>   *     then clear BLOCK_LOCKS.
>   *
> @@ -809,7 +809,7 @@ static void gfs2_control_func(struct work_struct *wor=
k)
>
>         /*
>          * No more jid bits set in lvb, all recovery is done, unblock loc=
ks
> -        * (unless a new recover_prep callback has occured blocking locks
> +        * (unless a new recover_prep callback has occurred blocking lock=
s
>          * again while working above)
>          */
>
> diff --git a/fs/gfs2/recovery.c b/fs/gfs2/recovery.c
> index 616c46aa3434..27777497677f 100644
> --- a/fs/gfs2/recovery.c
> +++ b/fs/gfs2/recovery.c
> @@ -155,7 +155,7 @@ int __get_log_header(struct gfs2_sbd *sdp, const stru=
ct gfs2_log_header *lh,
>   * @blk: the block to look at
>   * @head: the log header to return
>   *
> - * Read the log header for a given segement in a given journal.  Do a fe=
w
> + * Read the log header for a given segment in a given journal.  Do a few
>   * sanity checks on it.
>   *
>   * Returns: 0 on success,
> --
> 2.48.1

Applied to for-next, thanks.

Andreas

