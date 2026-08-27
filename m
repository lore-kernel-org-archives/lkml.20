Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FB93CB548
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787865255; cv=pass; b=kFcAQyxUxW3l96vRzyO7httFbD4KhDZnPfU3tNgKC0FYs5tgfeRoBCTw4fhB20K9L41z2FpVCug8ySQa9jRnTb73bp5Dx5RgRVa08b3wjgRL74eQLsX4of1Zngl8De1AlzFOvgz6qMoWLzIDoXlAwB6AoOQL6O4xJAS+194KWZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787865255; c=relaxed/simple;
	bh=y20HPvf25bqPGekR7z2KjDsTU5NU7Ya1ET/uFIGNJMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kZq1lzTu9KH+Kf0FeBfNhmkUIYPbF0LUXdMW6so+4lO/gf4NobjffhWhbeh51Bb0L8fRg9Q3AxNCpsAWwqrPKNmzU8iCaXVv0H9nY65ck1Em7vmqq45Fd8YJ4aSe5lnrSdMHMDwjfZdPJKGrmcgDzJiRDpjWqZ1lwcYu3nfwhI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nEBoPK+9; arc=pass smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nEBoPK+9"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5b4aa47bc97so101873e87.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:14:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787865251; cv=none;
        d=google.com; s=arc-20260327;
        b=N6leYveBO4uVaQGxhoHdO+vC2sSF8E7PLqCgzy3rts6fxELXXg9lZa5sgZFj3Ef1Ai
         48gXaKcc9rfJJnzn8F2xGFvvNckKeHjdxG2lztelD9kdsQgTqssJ5yGYxGfqdxw+N6Ww
         Ygn3JwtdxfVx28qx6rYvS8ytYQ8e8Okt3cxKH9Hzd0mFlfSih1qAzeF7KFLdxTF685vy
         72u3xiQYHxEhX6r+M92LROcDOcfGQphPdIJlYAYbBsHofvckvi6HBbjHsMi0fstzi2pW
         GrSLF5r5nWYGKxLthBH+wsXW8LgwkAO2cKiid88BMfHfP6UbsReyAj+VX2DlQoDr7HQf
         AZ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mOKfIjKDsi5vbf6BNYTw3bs+X2e675H/MTpYgvrPT3Y=;
        fh=J13Aaed8DLIcyBhSVfyugTMuHByHHDXuUNZVlL+NexA=;
        b=dyn1Y+SVRHM6HknkCc01pv74d3nJ0yxVqB4NZa9OIU5jnRze+kcuNYy7gmz4SI+4zD
         LF+nHDgCd2y/oSH2tCtBHCHnSD615z6zrECKBiahFGY55i7LHmPleL0CKw7uocw7rH65
         BkMIY/wPCkNRo7FdEq0+Xv6A55Cxu0JCd7RSaZFV6VWeUzfmwzpZdPPs++hzmTj8zggS
         dDLgqP2oD6JBqxt8y24S0fVva9msVjIKvRvy4AvOj+NbRPJ4jVA8JAOGWOg2x+w3TuMi
         q7uOI3RoroKf97WgDh53MTVjwf+8xkJ6C11RA6nv4upeI7I4b29xQksj484Awp1AUaBn
         qecw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787865251; x=1788470051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mOKfIjKDsi5vbf6BNYTw3bs+X2e675H/MTpYgvrPT3Y=;
        b=nEBoPK+9rLNKv84dTw5pdGzxQEy45G0pJ3sAOeHQvDLaf8N6Hww04qAbWpKV2fM3qB
         /9hkUhmYOlSuEmj/pT55ZZUlCzKOYmYo66JStcTWCW9d7NBC5DhlHeot5pUBAlF/bQRd
         CwMYWfEEjtZXtlwCG6HvVV2rQ3iXl93bzpGaNVTIFCl9o3yKnRetlQ0wIt1y17X5Qdf0
         2DZJuPUKP4HHKU/38XwQFTzRyynVqjFQt7ifJQA/oGkg7KYhteGzy+ivP1a0GZFC9tAw
         ElF2NXjzOH5CFl5zrZWpQmlhkydlT/IEky1ETESFyiLm/4VoUQzAM8J2CKoag7d7lXpV
         w/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787865251; x=1788470051;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mOKfIjKDsi5vbf6BNYTw3bs+X2e675H/MTpYgvrPT3Y=;
        b=WFYST0FJdt15PxYxpZnIbQXmiMFpNxSzTWiM53jF6g7dStWGkaiIaHer/v7BB9MpbR
         YeWRdQvgR7dqlQTq+2qtTvLy8fG6g2NUx4dTGyLn63M9hc72xrPvN1i/7TulCfVq5f7G
         0adcg1FCu31MxLP36E18cm+f8TGNW3ST8fjnj3DJOeid81IFPZYPkIV3jE9mVHCnLzF+
         FbxEbhB6mTeK5AtJ44Bmumas7khqUt3/vfChkkqqdaPnGwv9Z9BiZ3aJDtgVTPvIMcB9
         Y4eoPxMowjhtMwu6/lXaGa5+NfuV76Jo2lu25EQ/WFsT/RawN51iYCW9+zI87U/PU+S2
         cazg==
X-Forwarded-Encrypted: i=1; AHgh+RpIfd4B4EZN+bW0c+sFM1zlBITIR8PSESPMob5eS4asQr+bRb9wqKecgBsnEll92ux6LC5bS/roe+kORfU=@vger.kernel.org
X-Gm-Message-State: AFuF++mviAodByASAAM2v4TI5k8Eog2srxQrfew1xcyHFGCItd2iY+vF
	yzzF1AFhsHzYl1KC4NUpgICl5jP37m7gR5dvvzH2vCtVP3Fi+5mgX9tfjtSFwPPifSk6WrcQBx0
	9GtfmKKp+yLhOA6MU3aYNXnU429H1haA=
X-Gm-Gg: AR+sD123sV4enPvZjK5zgCA6qfldRgf1ibJeGKAHFHzqOUbJMrgc9WFkl5LG90Re1V8
	JIgOY8GeXwZZmFkdsb9MTg+J0Lmq9ytR+3M5IitkMK+uUyZNJ5lPja8LKTQ10wZ+C3VA/Yno82G
	s9V59+peQoVlbm/9h3adjgRNLIr4UBLP/RBjCS+FH9Rn5QX4uVBA1Xol5kPax0TSXzPEO+ZCMtU
	UvDxPaEvKllSb2TBG8zAlJbn18hmRJoP7CvogK1XtuTn25swhEHZ/xIc0n6vxrfAbtTvFYO0bWO
	+JBKM/nrGDJVjQtfSPQTdqGmfxEMyUHDrPJWtUSGzbuvE5TCkbDturaEKlINOBmnV8nDdMNmJXc
	avjTi2pfdrPHU6AY67LPouVfONWq4Gxk=
X-Received: by 2002:a05:6512:10cd:b0:5ae:bba5:aee8 with SMTP id
 2adb3069b0e04-5b5e6b0b37dmr447324e87.24.1787865251305; Thu, 27 Aug 2026
 14:14:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826082641.2007658-1-zhaonanzhe@xiaomi.com>
 <20260826082641.2007658-4-zhaonanzhe@xiaomi.com> <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
In-Reply-To: <83fe187e-e3e8-4328-bbbf-a6751873b9e0@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 27 Aug 2026 14:13:58 -0700
X-Gm-Features: AcwNN1W8nm2w2DanFFCZ3YoWwp0TmG4oz50cWBJcbqk_GnqSTNnx-LGUQ-HpWpE
Message-ID: <CACOAw_whxoNZW2X4s675hg=qBcARtFYpXEU2B7qVTYhjQzbLjA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH 03/14] f2fs: support regular file buffered
 writes on large folios
To: Chao Yu <chao@kernel.org>
Cc: Nanzhe Zhao <zhaonanzhe@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net, 
	Jaegeuk Kim <jaegeuk@kernel.org>, Barry Song <baohua@kernel.org>, Juan Yescas <jyescas@google.com>, 
	Dev Jain <Dev.Jain@arm.com>, linux-kernel@vger.kernel.org, 
	David Hildenbrand <David.Hildenbrand@arm.com>, Bo Zhang <zhangbo56@xiaomi.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Nanzhe Zhao <nzzhao@126.com>, 
	Pengfei Li <lipengfei28@xiaomi.com>, Ryan Roberts <Ryan.Roberts@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 2:00=E2=80=AFAM Chao Yu via Linux-f2fs-devel
<linux-f2fs-devel@lists.sourceforge.net> wrote:
>
> On 8/26/26 16:26, Nanzhe Zhao wrote:
> > To avoid the complexity of unlocking a large folio in write_begin,
> > preallocate partial blocks for inodes that can use large folios.
> > During write_begin, read only the partial head and tail 4K subpages
> > that need read-before-write, and skip read I/O for the full middle
> > subpages covered by the write.
> >
> > Signed-off-by: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
> > ---
> >  fs/f2fs/data.c | 289 +++++++++++++++++++++++++++++++++++++++++++++++--
> >  fs/f2fs/f2fs.h |   1 +
> >  fs/f2fs/file.c |  17 ++-
> >  3 files changed, 293 insertions(+), 14 deletions(-)
> >
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 8649d443ca74..7ce96ae02cfc 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1249,6 +1249,40 @@ static void f2fs_submit_page_read(struct inode *=
inode, struct fsverity_info *vi,
> >       f2fs_submit_read_bio(sbi, bio, DATA);
> >  }
> >
> > +/*
> > + * Synchronously read a single 4K subpage by reusing f2fs_submit_page_=
read()
> > + * so that iostat, trace, blk-crypto and post-read handling are all pr=
eserved.
> > + * The caller must have already allocated ffs for the folio.
> > + */
> > +static int f2fs_submit_page_read_sync(struct inode *inode, struct foli=
o *folio,
> > +                                   pgoff_t index, block_t blkaddr)
> > +{
> > +     struct f2fs_folio_state *ffs =3D folio->private;
> > +     unsigned long flags;
> > +
> > +     /* Add bias so end_io does not call folio_end_read(). */
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     ffs->read_pages_pending++;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +
> > +     f2fs_submit_page_read(inode, NULL, folio, index, blkaddr,
> > +                           REQ_OP_READ, false);
> > +
> > +     /* Wait for pending drops back to bias which indicates all bio ha=
ve completed. */
> > +     while (READ_ONCE(ffs->read_pages_pending) !=3D 1)
> > +             f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
>
> Suspect there will be potential performance issue, as timeout interval is
> large.
>
> > +
> > +     /* Remove the bias. */
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     ffs->read_pages_pending--;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
>
> Looks hacky.
>
> If large folio has 4 sub pages, first 3 pages are uptodate.
> Then we use f2fs_submit_page_read_sync() to read last page,
> in f2fs_finish_read_bio(), we update state bitmap of last page to 1,
> but as read_pages_pending is 1, so folio won't be set as uptodate.
>
> Oh, in f2fs_write_end(), we have another change to set folio uptodate
> though, so the flow is a little bit different here.
>
> > +
> > +     if (!f2fs_ffs_test_blk_uptodate(folio, index))
> > +             return -EIO;
> > +
> > +     return 0;
> > +}
> > +
> >  static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkad=
dr)
> >  {
> >       __le32 *addr =3D get_dnode_addr(dn->inode, dn->node_folio);
> > @@ -2582,6 +2616,112 @@ static void ffs_detach_free(struct folio *folio=
)
> >       kfree(ffs);
> >  }
> >
> > +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t ind=
ex)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned int idx;
> > +
> > +     if (!f2fs_folio_has_ffs(folio))
> > +             return folio_test_uptodate(folio);
> > +
> > +     if (!folio_contains(folio, index))
> > +             return false;
>
> Can we check this out of f2fs_ffs_test_blk_uptodate()? and add a sanity
> check here:
>
> f2fs_bug_on(sbi, !folio_contains(folio, index));
>
> > +
> > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     idx =3D index - folio->index;
> > +     return test_bit(idx, ffs->state);
> > +}
> > +
> > +static bool __ffs_mark_subrange_uptodate(struct folio *folio,
> > +             struct f2fs_folio_state *ffs, size_t offset, size_t len)
> > +{
> > +     unsigned int nr_subpages =3D folio_nr_pages(folio);
> > +     unsigned int start, end;
> > +
> > +     start =3D offset >> PAGE_SHIFT;
> > +     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > +     end =3D min(end, nr_subpages);
> > +
> > +     bitmap_set(ffs->state, start, end - start);
> > +     return bitmap_full(ffs->state, nr_subpages);
> > +}
> > +
> > +static void f2fs_ffs_mark_subrange_uptodate(struct folio *folio, size_=
t offset,
> > +                                    size_t len)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned long flags;
> > +     bool mark_uptodate =3D false;
> > +
> > +     f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> > +
> > +     if (!f2fs_folio_has_ffs(folio)) {
> > +             folio_mark_uptodate(folio);
> > +             return;
> > +     }
> > +
> > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     mark_uptodate =3D __ffs_mark_subrange_uptodate(folio, ffs, offset=
, len) &&
> > +                     !ffs->read_pages_pending;
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +     if (mark_uptodate)
> > +             folio_mark_uptodate(folio);
> > +}
> > +
> > +static void f2fs_ffs_mark_subrange_dirty(struct folio *folio,
> > +                                 size_t offset, size_t len)
> > +{
> > +     struct f2fs_folio_state *ffs;
> > +     unsigned int nr_subpages, start, end;
> > +     unsigned long flags;
> > +
> > +     f2fs_bug_on(F2FS_F_SB(folio), offset + len > folio_size(folio));
> > +
> > +     if (!f2fs_folio_has_ffs(folio))
> > +             return;
> > +
> > +     ffs =3D (struct f2fs_folio_state *)folio->private;
> > +     nr_subpages =3D folio_nr_pages(folio);
> > +     start =3D offset >> PAGE_SHIFT;
> > +     end =3D (offset + len + PAGE_SIZE - 1) >> PAGE_SHIFT;
> > +     end =3D min(end, nr_subpages);
> > +
> > +     spin_lock_irqsave(&ffs->state_lock, flags);
> > +     bitmap_set(ffs->state, nr_subpages + start, end - start);
> > +     spin_unlock_irqrestore(&ffs->state_lock, flags);
> > +}
> > +
> > +static bool find_next_valid_block(const struct folio *folio,
> > +                               size_t orig_off, size_t *need_off,
> > +                               size_t len)
> > +{
> > +     size_t start =3D orig_off;
> > +     size_t end =3D start + len;
> > +     size_t head, tail;
> > +     pgoff_t index;
> > +
> > +     if (start & (PAGE_SIZE - 1)) {
> > +             head =3D round_down(start, PAGE_SIZE);
> > +             index =3D folio->index + (head >> PAGE_SHIFT);
> > +             if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> > +                     *need_off =3D head;
> > +                     return true;
> > +             }
> > +     }
> > +
> > +     if (end & (PAGE_SIZE - 1)) {
> > +             tail =3D round_down(end - 1, PAGE_SIZE);
> > +             index =3D folio->index + (tail >> PAGE_SHIFT);
> > +             if (!f2fs_ffs_test_blk_uptodate(folio, index)) {
> > +                     *need_off =3D tail;
> > +                     return true;
> > +             }
> > +     }
> > +
> > +     return false;
> > +}
> > +
> >  static int f2fs_read_data_large_folio(struct inode *inode,
> >               struct fsverity_info *vi,
> >               struct readahead_control *rac, struct folio *folio)
> > @@ -3975,6 +4115,102 @@ static int prepare_atomic_write_begin(struct f2=
fs_sb_info *sbi,
> >       return 0;
> >  }
> >
> > +static int prepare_large_folio_write_begin(struct inode *inode,
> > +                                       struct folio *folio, loff_t pos=
,
> > +                                       unsigned int len)
> > +{
> > +     struct f2fs_sb_info *sbi =3D F2FS_I_SB(inode);
> > +     struct f2fs_folio_state *ffs;
> > +     size_t ori_off =3D offset_in_folio(folio, pos);
> > +     size_t need_off =3D ori_off;
> > +     int err =3D 0;
> > +
> > +     len =3D min_t(unsigned int, len, folio_size(folio) - ori_off);
> > +
> > +     /*
> > +      * When folio minimum order is non-zero, the fsverity
> > +      * page_cache_write() path enters f2fs_write_begin() via
> > +      * aops->write_begin without going through f2fs_write_iter(),
> > +      * so preallocation from f2fs_write_iter() is skipped.  In that
> > +      * case, if FI_PREALLOCATED_ALL is not set, we must preallocate
> > +      * the write blocks here.
> > +      */
> > +     if (!is_inode_flag_set(inode, FI_PREALLOCATED_ALL)) {
> > +             struct f2fs_map_blocks map =3D {};
> > +
> > +             map.m_lblk =3D F2FS_BYTES_TO_BLK(pos);
> > +             map.m_len =3D F2FS_BLK_ALIGN(pos + len) - map.m_lblk;
> > +
> > +             if (!IS_DEVICE_ALIASING(inode))
> > +                     map.m_may_create =3D true;
> > +             map.m_seg_type =3D NO_CHECK_TYPE;
> > +
> > +             err =3D f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_PRE_A=
IO);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     /*
> > +      * Skip read and ffs allocation if the folio is already fully
> > +      * uptodate or the write covers the entire folio.
> > +      */
> > +     if (folio_test_uptodate(folio) || len =3D=3D folio_size(folio))
> > +             return 0;

If a large folio is already uptodate by read in the page cache and a
buffered write updates
a 4KB subrange (len < folio_size), this early return skips allocating ffs.
Then in f2fs_write_end():
    f2fs_ffs_mark_subrange_dirty(folio, ...);
returns immediately because !f2fs_folio_has_ffs(folio).

Subsequently, in f2fs_write_cache_folios(), writeback sees no ffs,
allocates one,
and marks the ENTIRE large folio dirty
(`f2fs_ffs_mark_subrange_dirty(folio, 0, end_pos - pos)`),
causing every 4KB partial write to rewrite the full large folio to disk.

Fix: If len < folio_size(folio), we MUST ensure
`f2fs_ffs_find_or_alloc(folio)` is
called even when folio_test_uptodate(folio) is true, so
f2fs_write_end() can track
the dirty subpage.

Thanks,

>
> Do we need to adopt fsverity like we did in f2fs_write_begin()?
>
>         if (!(pos & (PAGE_SIZE - 1)) && (pos + len) >=3D i_size_read(inod=
e) &&
>             !f2fs_verity_in_progress(inode)) {
>                 folio_zero_segment(folio, len, folio_size(folio));
>                 return 0;
>         }
>
> > +
> > +     ffs =3D f2fs_ffs_find_or_alloc(folio);
>
> f2fs_ffs_find_or_alloc() will never fail.
>
> > +     if (!ffs)
> > +             return -ENOMEM;
> > +
> > +     /* Inline data must have been converted before reaching here. */
> > +     f2fs_bug_on(sbi, f2fs_has_inline_data(inode));
> > +
> > +     while (find_next_valid_block(folio, ori_off,
> > +                                  &need_off, len)) {
> > +             struct dnode_of_data dn;
> > +             pgoff_t index =3D folio->index + (need_off >> PAGE_SHIFT)=
;
> > +             block_t blkaddr;
> > +             bool get_dn =3D false;
> > +
> > +             if (!f2fs_lookup_read_extent_cache_block(inode, index,
> > +                                                     &blkaddr)) {
> > +                     if (IS_DEVICE_ALIASING(inode))
> > +                             return -ENODATA;
> > +
> > +                     set_new_dnode(&dn, inode, NULL, NULL, 0);
> > +                     err =3D f2fs_get_dnode_of_data(&dn, index, LOOKUP=
_NODE);
> > +                     if (err)
> > +                             return err;
> > +                     get_dn =3D true;
> > +                     blkaddr =3D dn.data_blkaddr;
> > +
> > +                     if (blkaddr =3D=3D NEW_ADDR) {
> > +                             size_t off =3D offset_in_folio(folio,
> > +                                                          index << PAG=
E_SHIFT);
> > +
> > +                             folio_zero_segment(folio, off, off + PAGE=
_SIZE);
> > +                             f2fs_ffs_mark_subrange_uptodate(folio, of=
f,
> > +                                                            PAGE_SIZE)=
;
> > +                             goto out;
> > +                     }
> > +
> > +                     if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> > +                                               DATA_GENERIC_ENHANCE_RE=
AD)) {
> > +                             err =3D -EFSCORRUPTED;
> > +                             goto out;
> > +                     }
> > +             }
> > +
> > +             err =3D f2fs_submit_page_read_sync(inode, folio, index, b=
lkaddr);
> > +out:
> > +             if (get_dn)
> > +                     f2fs_put_dnode(&dn);
> > +             if (err)
> > +                     return err;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int f2fs_write_begin(const struct kiocb *iocb,
> >                           struct address_space *mapping,
> >                           loff_t pos, unsigned len, struct folio **foli=
op,
> > @@ -3986,6 +4222,7 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >       pgoff_t index =3D pos >> PAGE_SHIFT;
> >       bool need_balance =3D false;
> >       block_t blkaddr =3D NULL_ADDR;
> > +     fgf_t fgp =3D FGP_LOCK | FGP_WRITE | FGP_CREAT;
> >       int err =3D 0;
> >
> >       trace_f2fs_write_begin(inode, pos, len);
> > @@ -4033,9 +4270,9 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >        * Do not use FGP_STABLE to avoid deadlock.
> >        * Will wait that below with our IO control.
> >        */
> > -     folio =3D f2fs_filemap_get_folio(mapping, index,
> > -                             FGP_LOCK | FGP_WRITE | FGP_CREAT,
> > -                             mapping_gfp_mask(mapping));
> > +     fgp |=3D fgf_set_order(len);
> > +     folio =3D __filemap_get_folio(mapping, index, fgp,
> > +                                 mapping_gfp_mask(mapping));
>
> It detaches from fault injection, why we need to change to use
> __filemap_get_folio()?
>
> >       if (IS_ERR(folio)) {
> >               err =3D PTR_ERR(folio);
> >               goto fail;
> > @@ -4048,7 +4285,7 @@ static int f2fs_write_begin(const struct kiocb *i=
ocb,
> >       if (f2fs_is_atomic_file(inode))
> >               err =3D prepare_atomic_write_begin(sbi, folio, pos, len,
> >                                       &blkaddr, &need_balance);
> > -     else
> > +     else if (!folio_test_large(folio))
> >               err =3D prepare_write_begin(sbi, folio, pos, len,
> >                                       &blkaddr, &need_balance);
> >       if (err)
> > @@ -4069,6 +4306,14 @@ static int f2fs_write_begin(const struct kiocb *=
iocb,
> >
> >       f2fs_folio_wait_writeback(folio, DATA, false, true);
> >
> > +     if (folio_test_large(folio)) {
> > +             err =3D prepare_large_folio_write_begin(inode,
> > +                                     folio, pos, len);
> > +             if (!err)
> > +                     return 0;
> > +             goto put_folio;
> > +     }
> > +
> >       if (len =3D=3D folio_size(folio) || folio_test_uptodate(folio))
> >               return 0;
> >
> > @@ -4129,15 +4374,20 @@ static int f2fs_write_end(const struct kiocb *i=
ocb,
> >       trace_f2fs_write_end(inode, pos, len, copied);
> >
> >       /*
> > -      * This should be come from len =3D=3D PAGE_SIZE, and we expect c=
opied
> > -      * should be PAGE_SIZE. Otherwise, we treat it with zero copied a=
nd
> > -      * let generic_perform_write() try to copy data again through cop=
ied=3D0.
> > +      * If a short copy happens on a folio that isn't uptodate, we tre=
at
> > +      * it with zero copied and let generic_perform_write() try to cop=
y
> > +      * data again through copied=3D0.
> >        */
> >       if (!folio_test_uptodate(folio)) {
> > -             if (unlikely(copied !=3D len))
> > +             if (unlikely(copied !=3D len)) {
> >                       copied =3D 0;
> > -             else
> > +             } else if (folio_test_large(folio)) {
> > +                     f2fs_ffs_mark_subrange_uptodate(folio,
> > +                                     offset_in_folio(folio, pos), len)=
;
> > +             } else {
> > +                     /* This should be come from len =3D=3D PAGE_SIZE =
*/
> >                       folio_mark_uptodate(folio);
> > +             }
> >       }
> >
> >  #ifdef CONFIG_F2FS_FS_COMPRESSION
> > @@ -4156,6 +4406,9 @@ static int f2fs_write_end(const struct kiocb *ioc=
b,
> >       if (!copied)
> >               goto unlock_out;
> >
> > +     if (folio_test_large(folio))
> > +             f2fs_ffs_mark_subrange_dirty(folio, offset_in_folio(folio=
, pos),
> > +                                                                copied=
);
> >       folio_mark_dirty(folio);
> >
> >       if (f2fs_is_atomic_file(inode))
> > @@ -4218,8 +4471,22 @@ static bool f2fs_dirty_data_folio(struct address=
_space *mapping,
> >
> >       trace_f2fs_set_page_dirty(folio, DATA);
> >
> > -     if (!folio_test_uptodate(folio))
> > -             folio_mark_uptodate(folio);
> > +     if (!folio_test_uptodate(folio)) {
> > +             bool uptodate =3D true;
> > +
> > +             if (f2fs_folio_has_ffs(folio)) {
> > +                     struct f2fs_folio_state *ffs =3D
> > +                             (struct f2fs_folio_state *)folio->private=
;
> > +                     unsigned long flags;
> > +
> > +                     spin_lock_irqsave(&ffs->state_lock, flags);
> > +                     uptodate =3D bitmap_full(ffs->state, folio_nr_pag=
es(folio)) &&
> > +                                !ffs->read_pages_pending;
> > +                     spin_unlock_irqrestore(&ffs->state_lock, flags);
>
> f2fs_ffs_mark_subrange_uptodate(folio, 0, folio_size(folio)); ?
>
> > +             }
> > +             if (uptodate)
> > +                     folio_mark_uptodate(folio);
> > +     }
> >       BUG_ON(folio_test_swapcache(folio));
> >
> >       if (filemap_dirty_folio(mapping, folio)) {
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 31ddd321daf6..ae6031693700 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4342,6 +4342,7 @@ int f2fs_write_single_data_page(struct folio *fol=
io, int *submitted,
> >                               struct writeback_control *wbc,
> >                               enum iostat_type io_type,
> >                               int compr_blocks, bool allow_balance);
> > +bool f2fs_ffs_test_blk_uptodate(const struct folio *folio, pgoff_t ind=
ex);
> >  void f2fs_write_failed(struct inode *inode, loff_t to);
> >  void f2fs_invalidate_folio(struct folio *folio, size_t offset, size_t =
length);
> >  bool f2fs_release_folio(struct folio *folio, gfp_t wait);
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index d440231b8cb9..e40285d4f9c2 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -5405,9 +5405,20 @@ static int f2fs_preallocate_blocks(struct kiocb =
*iocb, struct iov_iter *iter,
> >                       return ret;
> >       }
> >
> > -     /* Do not preallocate blocks that will be written partially in 4K=
B. */
> > -     map.m_lblk =3D F2FS_BLK_ALIGN(pos);
> > -     map.m_len =3D F2FS_BYTES_TO_BLK(pos + count);
> > +     if (mapping_large_folio_support(inode->i_mapping)) {
> > +             /*
> > +              * Preallocate all blocks touched by a large-folio buffer=
ed write so
> > +              * the regular write_begin path does not need to unlock t=
he folio for
> > +              * f2fs_balance_fs().  Rechecking large-folio state after=
 unlock is
> > +              * unreliable since partial truncation can split the foli=
o.
>
> You mean buffered io case, right? so we need to check !dio as well?
>
> Thanks,
>
> > +              */
> > +             map.m_lblk =3D F2FS_BYTES_TO_BLK(pos);
> > +             map.m_len =3D F2FS_BLK_ALIGN(pos + count);
> > +     } else {
> > +             /* Do not preallocate blocks that will be written partial=
ly in 4KB. */
> > +             map.m_lblk =3D F2FS_BLK_ALIGN(pos);
> > +             map.m_len =3D F2FS_BYTES_TO_BLK(pos + count);
> > +     }
> >       if (map.m_len > map.m_lblk)
> >               map.m_len -=3D map.m_lblk;
> >       else
>
>
>
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
