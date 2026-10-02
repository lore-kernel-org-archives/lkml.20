Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F5CE3EC81D
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 20:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790972377; cv=none; b=VmK3IzXOA5vZqRzRO9Cnq74zy5oONCTTTex3sg6CnOYICQfEYfxO4R3l6TEuY5lgR+lobT4Eo+50MI27r5iRy0AOzPvGAtMUHNwBs4fg9al4SIo8gLAeR6FLLxmjIegHH7oYvqpBhPB1J6AwzgDZHZHanyVHLWyO45aiTn7tChI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790972377; c=relaxed/simple;
	bh=JinyKoGOOVJY0l09iGihI/Zbgz+s5g+YDaP5dT1zBBg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d2qf7taqv/C/sKvuPSv2yiQvyZ4SImE28lENX2niF6u8MUIprX/WTL5eestnROJOyishpE7oTBHfMnFRn64/xNVhAPKImf1xHEvnAKCa/D+wzEVPZQoVXQQBa7v8P36+mC8jIXC0Du5rkwFZAVHhtzJJXkiUPuoQ4UDhNSb/FBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com; spf=pass smtp.mailfrom=dubeyko.com; dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b=q4P2gPpI; arc=none smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dubeyko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dubeyko-com.20251104.gappssmtp.com header.i=@dubeyko-com.20251104.gappssmtp.com header.b="q4P2gPpI"
Received: by mail-yx2-f43.google.com with SMTP id 00721157ae682-895353e9051so82405237b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dubeyko-com.20251104.gappssmtp.com; s=20251104; t=1790972373; x=1791577173; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JinyKoGOOVJY0l09iGihI/Zbgz+s5g+YDaP5dT1zBBg=;
        b=q4P2gPpIpcoP2iFMfQtWlsyzpAHRz3i+EKEDB8OcXHJof5zo8rMoQNVHYjCneCvuB6
         k2RFOzMGPLnMEvCTS1RLZr2kPXOFeszdqjqaoZh6NcliCQ2SxH7/QBxDQwa7X93DL7Kl
         nCAcvsfhkUKhgBO/ACVYRx+JZcYT9KjxSwu/aj0gKPEtk+W4456sbkU63316dC/goVJH
         nZOe5MJGNIrj97YgdXqM00HAPZ1mDSBPy1/m32SH4m3z/LjuwVH02mAIkZTz7fHsmp3z
         7ElvoVwYnE5Usz/pQBIArWfGZlfFy27FKQx8r9Co6GbuTOCKQsZqAyRZbSGltNn8h3MV
         QRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790972373; x=1791577173;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JinyKoGOOVJY0l09iGihI/Zbgz+s5g+YDaP5dT1zBBg=;
        b=I3Tb2WH8U24YVYWvQZFXlUm0bU+aqhk8InCTSlhzdf5GqI9fcEi72VuYIuJEahMUUY
         eUiycK4z9m9Cmlg3fGWeJ0fXiqBbMPkLCrlE8MBrjJ/E28d4ONs4v3NnykhvMPR1MgB3
         MwHtPtwGig4R6VprJZrHC7WNPum9tF2/sbZ0UAxRIzZiflTdd/YC7yQyevfFr0RiXChH
         GxZ6g/oOyT4TWegrHYEwhLMqPloVxGk/7+O2OmRUBdv01YTdoFs/13eQZ0vB8OiTm/Ei
         H/S2Ff97zNeeGevCBUqPVrtPASDljEInxgGtfTQyd6seWXVsqokkAvgsPvRhIYK3nJWP
         mBAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlgVgAlwY4zI6CkgNLVuNmSo5QuvGyrfWuJgS7WBqNRmxDgc724bKI5zVrpPYfOifk1KVkNyrBNyoH3P4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTSzBmrAyNjks5UNCQVTz/4MKDggSKmio0+m1KVQBmybY5QHfE
	ZA2icAyTaA/DGhwdtIhCX/Bt33R0D7XwVX+PerbdW8JVFVwHO6ARVxdyGEmsNteK9MM=
X-Gm-Gg: AYBFou3tugt+LMHjcpNUPXXMVWzUCwq1aIgXOlMmPNbULCWJP0HDgWMYE6ZoaJy0rMY
	dYyjptKK7/UxVopVV/ZvOHAlfXJx99JErYIMQf1VKJMzM+b947XfdgGZmQnk1qO6sz72sHdUfC3
	EeTmfa0rx2GoOfFCnCfPuh3zOLCquz54ZwrC8+mTaRCJDP83CU8aq1FtNzoOEUxd0lCSlto558+
	+Fyqfihtymd8Ds5ZGllSAR8wuURsUYNaKrDx4ci+3OSsjT41Ei/fTfRrR1D5OwDLngGMtqFdRMG
	KsG5TgA4fcUhEYCkGrVx52rxxsmBuXLUS2kr+e1QPyPibzPjSU3wkfC2opq7FyEXCfJ+XKURqYE
	r/iinGVfcU0rRF6JbMOJbuGUkrv0iIB1MR29O3adqT3F2jC5yEZKumg1Pszgk9i8QT0YqZyKhZc
	qyHfsoErB5IPFt7rOBi1JjoUser4SmK4pEhBvzKs7vdve5Wh7mJFsmg5Lgou8XCjTsSpBg75aDw
	sSnrALOX1tIBqGpqWKvH4MeyuC2T79vuzFvjmycq4NGiEx/6LmzX+qti15iulG+r/SRVBR3Di/i
	mg5XstF64mjMTyv0tyMzDHzRx4gpVxokDm4n8yDCPp9DyjH3U4Bm6vG4DBo=
X-Received: by 2002:a05:690c:f09:b0:8a8:675b:2ba2 with SMTP id 00721157ae682-8ae399a847dmr20742977b3.24.1790972373509;
        Fri, 02 Oct 2026 13:19:33 -0700 (PDT)
Received: from ?IPv6:2600:1700:6476:1430:ec77:47c8:250:c58? ([2600:1700:6476:1430:ec77:47c8:250:c58])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8ae334e967dsm14218117b3.38.2026.10.02.13.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 13:19:32 -0700 (PDT)
Message-ID: <8078649d8c1405e0a207d06efe4ec0189d3eef76.camel@dubeyko.com>
Subject: Re: [PATCH v2] hfsplus: annotate extents_lock nesting to silence
 lockdep false positive
From: Viacheslav Dubeyko <slava@dubeyko.com>
To: =?UTF-8?Q?Kullan=C4=B1lm=C4=B1yor?= Pasif <guvenlik@noroxi.com>
Cc: linux-fsdevel@vger.kernel.org, glaubitz@physik.fu-berlin.de, 
	frank.li@vivo.com, linux-kernel@vger.kernel.org
Date: Fri, 02 Oct 2026 13:19:27 -0700
In-Reply-To: <CAHfT-UCvvYX+24tQnBDGm5=_QgApsNnDJ5GpjeqMXvHgFSXj9w@mail.gmail.com>
References: <9f8b8dacee5d24c94185bab75ff905eb51a95999.camel@dubeyko.com>
	 <20261001215304.1520907-1-guvenlik@noroxi.com>
	 <bac16585adf37c9eb1d093176ab6c34c54e77de1.camel@dubeyko.com>
	 <CAHfT-UCvvYX+24tQnBDGm5=_QgApsNnDJ5GpjeqMXvHgFSXj9w@mail.gmail.com>
Autocrypt: addr=slava@dubeyko.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2026-10-02 at 23:18 +0400, Kullan=C4=B1lm=C4=B1yor Pasif wrote:
> Hi Slava,
> Thanks. You're right that tree->cnid and inode->i_ino match for the
> special inodes. hfsplus_btree_lock_class() itself can't be reused as-
> is, though: it takes a struct hfs_btree * and BUG()s on any CNID that
> isn't one of the three B-trees (CATALOG/EXTENTS/ATTR), while
> extents_lock is taken on regular inodes and on the allocation file,
> which are not B-trees.

Technically speaking, we can rework hfsplus_btree_lock_class() to be
applicable for both cases. This was my point.

> Looking more carefully, there is only one actual extents_lock
> nesting: a regular inode's extents_lock is held in
> hfsplus_file_truncate()/hfsplus_file_extend() while block alloc/free
> reads sbi->alloc_file (hfsplus_block_free() -> read_mapping_page() ->
> hfsplus_get_block() on the allocation file). The catalog/attr inodes
> are not taken nested under a regular inode's extents_lock (the
> extents-overflow inode returns early in hfsplus_get_block(), and the
> catalog/attr trees are reached under their own tree_lock).
> So the parallel enum + HFSPLUS_FIRSTUSER_CNID check is overkill (and,
> as you note, FIRSTUSER also covers folders). I'll simplify to a
> single distinction: give only the allocation file's extents_lock a
> separate subclass, leaving every other inode at the default. That
> removes the duplication and the file/folder ambiguity.
> Does that direction look right to you? I'll send v3 accordingly and
> fold the same into the HFS side.

I am not sure that I completely follow to your vision. Simply, send
another version of the patch and we will discuss it.

Thanks,
Slava.

> Thanks,
> Mahmut
>=20
> Viacheslav Dubeyko <slava@dubeyko.com>, 2 Eki 2026 Cum, 22:10
> tarihinde =C5=9Funu yazd=C4=B1:
> > On Thu, 2026-10-01 at 23:53 +0200, Mahmut Emin Kurhan wrote:
> > > lockdep reports a possible recursive locking on HFSPLUS_I(inode)-
> > > > extents_lock
> > > when unlinking a file on a crafted image: hfsplus_file_truncate()
> > > holds a
> > > regular file's extents_lock and, while freeing blocks, reads the
> > > allocation
> > > file, whose get_block() takes that file's own extents_lock. They
> > > are
> > > distinct
> > > inodes of the same lock class taken in a fixed order, so it is
> > > not a
> > > real
> > > deadlock, only a missing nesting annotation.
> > >=20
> >=20
> > As far as I can see, we have the same issue for HFS code.
> >=20
> > > Give the special inodes (allocation, attributes, catalog)
> > > distinct
> > > extents_lock subclasses and take the lock with
> > > mutex_lock_nested(),
> > > mirroring
> > > hfsplus_btree_lock_class(). Regular files (CNID >=3D
> > > HFSPLUS_FIRSTUSER_CNID) keep
> > > their own subclass so a genuine regular-vs-regular recursion is
> > > still
> > > detected;
> > > the remaining reserved inodes use a separate subclass instead of
> > > being treated
> > > as regular files.
> > >=20
> > > Found via coverage-guided fuzzing (syzkaller + lockdep) by
> > > Noroxi.
> > >=20
> > > Signed-off-by: Mahmut Emin Kurhan <guvenlik@noroxi.com>
> > > ---
> > > v2:
> > > =C2=A0- shorten the comment (Slava Dubeyko)
> > > =C2=A0- rename HFSPLUS_EXTENTS_LOCK_NORMAL to _REGULAR_FILE (Slava
> > > Dubeyko)
> > > =C2=A0- use HFSPLUS_FIRSTUSER_CNID so reserved inodes are not treated
> > > as
> > > =C2=A0=C2=A0 regular files; add a separate _OTHER subclass (Slava Dub=
eyko)
> > > =C2=A0- hfsplus_extents_lock_class() signature is 74 cols (< 80)
> > > =C2=A0fs/hfsplus/extents.c=C2=A0=C2=A0=C2=A0 | 12 ++++++++----
> > > =C2=A0fs/hfsplus/hfsplus_fs.h | 26 ++++++++++++++++++++++++++
> > > =C2=A0fs/hfsplus/xattr.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 ++-
> > > =C2=A03 files changed, 36 insertions(+), 5 deletions(-)
> > >=20
> > > diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
> > > index eb7c11524d..54a05eaa8f 100644
> > > --- a/fs/hfsplus/extents.c
> > > +++ b/fs/hfsplus/extents.c
> > > @@ -150,7 +150,8 @@ int hfsplus_ext_write_extent(struct inode
> > > *inode)
> > > =C2=A0{
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0int res;
> > > =C2=A0
> > > -=C2=A0 =C2=A0 =C2=A0mutex_lock(&HFSPLUS_I(inode)->extents_lock);
> > > +=C2=A0 =C2=A0 =C2=A0mutex_lock_nested(&HFSPLUS_I(inode)->extents_loc=
k,
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 hfsplus_extents_lock_class(inode));
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0res =3D hfsplus_ext_write_extent_locked(ino=
de);
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0mutex_unlock(&HFSPLUS_I(inode)->extents_loc=
k);
> > > =C2=A0
> > > @@ -261,7 +262,8 @@ int hfsplus_get_block(struct inode *inode,
> > > sector_t iblock,
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0if (inode->i_ino =3D=3D HFSPLUS_EXT_CNID)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EIO;
> > > =C2=A0
> > > -=C2=A0 =C2=A0 =C2=A0mutex_lock(&hip->extents_lock);
> > > +=C2=A0 =C2=A0 =C2=A0mutex_lock_nested(&hip->extents_lock,
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 hfsplus_extents_lock_class(inode));
> > > =C2=A0
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0/*
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 * hfsplus_ext_read_extent will write out a=
 cached extent
> > > into
> > > @@ -454,7 +456,8 @@ int hfsplus_file_extend(struct inode *inode,
> > > bool
> > > zeroout)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOSPC;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0}
> > > =C2=A0
> > > -=C2=A0 =C2=A0 =C2=A0mutex_lock(&hip->extents_lock);
> > > +=C2=A0 =C2=A0 =C2=A0mutex_lock_nested(&hip->extents_lock,
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 hfsplus_extents_lock_class(inode));
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0if (hip->alloc_blocks =3D=3D hip->first_blo=
cks)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goal =3D hfsplu=
s_ext_lastblock(hip->first_extents);
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0else {
> > > @@ -576,7 +579,8 @@ void hfsplus_file_truncate(struct inode
> > > *inode)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0blk_cnt =3D (inode->i_size + HFSPLUS_SB(sb)=
->alloc_blksz - 1)
> > > > >=20
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0HFSPLUS_SB(sb)->alloc_blksz_shift;
> > > =C2=A0
> > > -=C2=A0 =C2=A0 =C2=A0mutex_lock(&hip->extents_lock);
> > > +=C2=A0 =C2=A0 =C2=A0mutex_lock_nested(&hip->extents_lock,
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 hfsplus_extents_lock_class(inode));
> > > =C2=A0
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0alloc_cnt =3D hip->alloc_blocks;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0if (blk_cnt =3D=3D alloc_cnt)
> > > diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
> > > index 916e6552e3..7e2411b8f1 100644
> > > --- a/fs/hfsplus/hfsplus_fs.h
> > > +++ b/fs/hfsplus/hfsplus_fs.h
> > > @@ -37,6 +37,15 @@ enum hfsplus_btree_mutex_classes {
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0ATTR_BTREE_MUTEX,
> > > =C2=A0};
> > > =C2=A0
> > > +/* lockdep subclasses for extents_lock: special inodes nest
> > > under
> > > regular files */
> > > +enum hfsplus_extents_mutex_classes {
> > > +=C2=A0 =C2=A0 =C2=A0HFSPLUS_EXTENTS_LOCK_REGULAR_FILE,
> > > +=C2=A0 =C2=A0 =C2=A0HFSPLUS_EXTENTS_LOCK_CATALOG,
> > > +=C2=A0 =C2=A0 =C2=A0HFSPLUS_EXTENTS_LOCK_ALLOC,
> > > +=C2=A0 =C2=A0 =C2=A0HFSPLUS_EXTENTS_LOCK_ATTR,
> > > +=C2=A0 =C2=A0 =C2=A0HFSPLUS_EXTENTS_LOCK_OTHER,
> > > +};
> >=20
> > After more careful consideration, I think it looks like a
> > duplication.
> > We already have:
> >=20
> > enum hfsplus_btree_mutex_classes {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 CATALOG_BTREE_MUTEX,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXTENTS_BTREE_MUTEX,
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 ATTR_BTREE_MUTEX,
> > };
> >=20
> > static inline enum hfsplus_btree_mutex_classes
> > hfsplus_btree_lock_class(struct hfs_btree *tree)
> > {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 enum hfsplus_btree_mutex_classes class;
> >=20
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (tree->cnid) {
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 case HFSPLUS_CAT_CNID:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 class =3D CATAL=
OG_BTREE_MUTEX;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 case HFSPLUS_EXT_CNID:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 class =3D EXTEN=
TS_BTREE_MUTEX;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 case HFSPLUS_ATTR_CNID:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 class =3D ATTR_=
BTREE_MUTEX;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 default:
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BUG();
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 return class;
> > }
> >=20
> > Why we cannot reuse this already existing logic? Suggested logic
> > uses
> > the inode->i_ino. But tree->cnid and inode->i_ino should be the
> > same.
> > Maybe, we simply need to rework existing logic and reuse it? What
> > do
> > you think?
> >=20
> > > +
> > > =C2=A0/* An HFS+ BTree held in memory */
> > > =C2=A0struct hfs_btree {
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0struct super_block *sb;
> > > @@ -568,6 +577,23 @@ hfsplus_btree_lock_class(struct hfs_btree
> > > *tree)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0return class;
> > > =C2=A0}
> > > =C2=A0
> > > +static inline unsigned int hfsplus_extents_lock_class(struct
> > > inode
> > > *inode)
> > > +{
> > > +=C2=A0 =C2=A0 =C2=A0if (inode->i_ino >=3D HFSPLUS_FIRSTUSER_CNID)
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HFSPLUS_EXTEN=
TS_LOCK_REGULAR_FILE;
> >=20
> > The HFSPLUS_FIRSTUSER_CNID coudl be as file as folder. Please, take
> > a
> > look into my above comments. Maybe, we don't a new function at all.
> >=20
> > Thanks,
> > Slava.
> >=20
> > > +
> > > +=C2=A0 =C2=A0 =C2=A0switch (inode->i_ino) {
> > > +=C2=A0 =C2=A0 =C2=A0case HFSPLUS_CAT_CNID:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HFSPLUS_EXTEN=
TS_LOCK_CATALOG;
> > > +=C2=A0 =C2=A0 =C2=A0case HFSPLUS_ALLOC_CNID:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HFSPLUS_EXTEN=
TS_LOCK_ALLOC;
> > > +=C2=A0 =C2=A0 =C2=A0case HFSPLUS_ATTR_CNID:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HFSPLUS_EXTEN=
TS_LOCK_ATTR;
> > > +=C2=A0 =C2=A0 =C2=A0default:
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return HFSPLUS_EXTEN=
TS_LOCK_OTHER;
> > > +=C2=A0 =C2=A0 =C2=A0}
> > > +}
> > > +
> > > =C2=A0static inline
> > > =C2=A0bool is_bnode_offset_valid(struct hfs_bnode *node, u32 off)
> > > =C2=A0{
> > > diff --git a/fs/hfsplus/xattr.c b/fs/hfsplus/xattr.c
> > > index 21a1c196c7..7bf4ba8f18 100644
> > > --- a/fs/hfsplus/xattr.c
> > > +++ b/fs/hfsplus/xattr.c
> > > @@ -264,7 +264,8 @@ static int
> > > hfsplus_create_attributes_file(struct
> > > super_block *sb)
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0 sbi-
> > > >sect_count,
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0
> > > HFSPLUS_ATTR_CNID);
> > > =C2=A0
> > > -=C2=A0 =C2=A0 =C2=A0mutex_lock(&hip->extents_lock);
> > > +=C2=A0 =C2=A0 =C2=A0mutex_lock_nested(&hip->extents_lock,
> > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=C2=A0 hfsplus_extents_lock_class(attr_file));
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0hip->clump_blocks =3D clump_size >> sbi->al=
loc_blksz_shift;
> > > =C2=A0=C2=A0 =C2=A0 =C2=A0mutex_unlock(&hip->extents_lock);
> > > =C2=A0
