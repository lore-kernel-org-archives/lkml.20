Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794054944;
	b=bqB5x2DZebv3DeLUM8mfc7SmxVrmAEsAVysPFHTKSFKC1OccRJVZ8OxEE08NLKpPRLfm
	 m9Aje81Ge/EBIrgU3wuQJbWMIb6MYLTG19SwDCB3gUaz+pFK9gs639Jw+kpC/7XuUFtTF
	 bk8FN7cZnc03YsWbFJXAXzGpgHmBeApRbmVCr3jFsT5dEy9j40bDM5RpEfu9Bp9vcpxND
	 ibjowENuApGJINeJIQFT9KvXczuw+zq88WJft7Ot97d5g0B4KTy+XvsRnKcezxL+avXpb
	 9udxsN6q3G5fYkqWnSY++X8vlsHvLxnAy2vEwCn0MOpIblXu6vry8BePTQxFXYH393w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794054944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qAh0bgBsog7Y7KnhvEREARaQP2vFlXIvO9i9mhA5trA=;
	b=b1Fj+fTmvhuGGCv1eYiim3sbtuAPYBYF98a0xpGH67c8fazg3Qo7FxxThXyVHHTF2gwT
	 NgleT2IlDZw3EjZ5w+zRq8Hv7GRzBQ3mZcbND0d2Uotx4QlJwo6PCLwOz1Qm5vNAy6qNJ
	 RYvv7AacG9muvqfRWXXFb+QMx8fsAzp20pWd2d57sH6XHBPWFQ4Gft7Z41+y6OEQcD5wi
	 5xwDmIkEFSuXHaYZg97FmeCmhA+Zthu/vFheMdmVeBwOVsZVpwVuOYjynqJkisXYekXDQ
	 fKPUDnD3b62imELAhWcWd7H6G/74oLfzUAvjW0I0kQa5ICr4RfaGdBf3xyHY8XslaDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teqGjgBJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4BD606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B4BD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=teqGjgBJ
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1792978a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:35:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794054942; cv=none;
        d=google.com; s=arc-20260327;
        b=HL/5TlU3q6RsZkDWOfzwP0TgJwvcbURJYHmZ7BzGhM/uo+1OhBFdrzecD7A5BmcfLY
         wPR61qGx8kYhWx/xNZmGAIsucMa1w9jNVzEuLml00/hF5hyhD9VhussH9A3Z0kSeQ5Bj
         VHFZqOfleN2zLpAmq0Z4A+DeD4cTHDbih2f0asa1S9bNVbaj6dOKH9WnU6wlJBgP2w/3
         2rt1U2yGXogBRTuUkL6zuKB0C6Y8H3Sps/RDvo7PiYlXuAoU1XQRktEUDBD1zAmZ2WH3
         KD2ll+REKHiTKZIroND//MeO6SaDfxdmgKHvXDgqxB/fOURtrv/+vMU3dPTx3IJdWSvK
         JXAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qAh0bgBsog7Y7KnhvEREARaQP2vFlXIvO9i9mhA5trA=;
        fh=zJKTQgCbbUKCZ5YqOOjCtfV3EVbWiPj0ne/ndFFbUfo=;
        b=K6ZREomMqZ+5gzdJiPXp70j/q5xTjoXRfDe4IeNwFniMl5a/i7/U6UF7+eYoyfAkrV
         mMasTWbDuCSlqKjHEsfgtxvKOdF/3+StsiB0GJtPNaPxAVgUf1x7G564XHoHbqfKjiOA
         uTD5eNr5PrSRu9AcaX3Q2/vrMcVhSfRvrgKiME9fI7Lh2x7G5lMsUJ403yRYA9eCHpK/
         7222SaoC57ZTlcRv/kXwMJTGPwORb+/vpwwpV8UDEEcPdkG/t7kG2WqJvTfo6mp3PUsK
         rz0CJaKKKWkKNSx6KpuIFWTMZ0QrNOeIG5VE1ag4+PooM4f+aYktokNIcXjsaH7gOoPi
         snYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794054942; x=1794659742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qAh0bgBsog7Y7KnhvEREARaQP2vFlXIvO9i9mhA5trA=;
        b=teqGjgBJvuEB9n6ZIUNiRw+r+b/ZgZYOoqNjsf/AwJ7m0jfQeBp6AWoIv+u8NooF+q
         5Ou/x3/ijsxBDoqXbtBWvSzHWWVZkLmm9NYcKzz9kVHyE1JFU5BznhW004dt0rqRfIff
         cEf5sdiho2+JUWLpvgHqoEKQC5NLvpgwqIw1HDrm0xMZ2KN8OwaSJB8oqh1Yrvwuu9aw
         uo72uhxVmvHq6UJklRMJMxJcGUU27t3utiVCXIxT3NC0duVnvSC5rvDhugqpUlspX4cO
         m3evQLzojeHFKSk5nrO76ywIkY2aght59uvmuUkUeyu1JsnogVoSukhUtSaj0a+prvDj
         X26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794054942; x=1794659742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qAh0bgBsog7Y7KnhvEREARaQP2vFlXIvO9i9mhA5trA=;
        b=X/pIUfvt7wvcS4HFpc+kLtZm//7MzHpE1nKRzw1RdSzNa+1eb6aOr/PNmBi8NXOTvy
         KrycejpigUocw9KfCCK++O8+CFQS9B63J0Hc9wIYaHqXbo/O82gSQ0N0IEOq6x/Pg8vV
         vhSRWdeEqEhPyCuf3uGNEPU+1E4X4a18DXkpwoxt/xWnrbk6bkZi1Wh4Rv+SbGpLboV3
         96FpskMZ0xD4hJfAwycj90N/CgQoHoo9KIqgnJuuxnRqVKtTjlG+zXI2hOkv3SqMvLHs
         EMqRqvoMsInSp5foquDnaM/1wVt9Us37GOkKZkGI9G60qUuO//2luyHzQnBurniW8E0S
         w+IQ==
X-Forwarded-Encrypted: i=1; AL+hErEEhUiWtPXLpTwyNCiuwWDyxLCS6Z+y9TYpoDJlkzlNTkqdP3ko48tlHSehMdH50fEh9H/DHv1EhN2TA+g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tFqPEP+jDsFJ3JCcbXCw8rLPQOb2vKHnP+/0FuhoCS0h+isag
	X9JpnDjwkGCxTf5vYsZGcOkJ4a3KgcTLawKaA0Ac0NZlbwOSM4sOM+DN3x5PJHunXjkJM5bFcn8
	8QNs0sWlCddADp24qGVII4mugT4EZsIA=
X-Gm-Gg: AYBFou2gx7lEj35rdXufw9eFxxpbdfWC3kjdjmLO376298AqwwlwzZ1M6w2Titj4mlh
	Lm/+9sc1xkSv1xku46vqfVu/Wv+np4TrQwxzPC/Be8ReGnEA54faVgbkz7Oe1P//Jv2VkgiewKQ
	3xzLAOHY26ynx3ElG6a0io0lkJ83dNMRsyApDkmX5+UXGGgRmAUKzSy1ukluE64aJK34mDq6VGq
	r3soLsmJswfsMQ8yyyveWY3qAwueWV8gVCJzjaifmiP1DC1reYTj2GnXyJ4GKCIqyYWR8NRJ63u
	e6oeMHGxT1lVeA4YGGGNu44UZI368YQxhpZnma5IO+3UA6kcGtjLhBJOpWpltyq0xVRtJZD34to
	zfu5/RUXl45SKxc6n4JR8JwyPVwbULMmg33O1R9JZstm71ml98bdDuykgJJ7weR66jq62lY57mq
	RxhW9qvWKZtqhHNaU=
X-Received: by 2002:a05:6402:51d1:b0:6b6:e83b:6fc6 with SMTP id
 4fb4d7f45d1cf-6b6e83b70a5mr2926584a12.32.1794054942352; Sat, 07 Nov 2026
 04:35:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-b4-ovl-containerized-sync-v3-0-8daa20144f53@toxicpanda.com>
 <20261106-nebel-fragment-normierung-84511a5676d9@brauner> <5ba0cd611f787673e219509aba8b81a0.josef@toxicpanda.com>
In-Reply-To: <5ba0cd611f787673e219509aba8b81a0.josef@toxicpanda.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Sat, 7 Nov 2026 13:35:31 +0100
X-Gm-Features: AclHuK-7zpwSdqr5f1prmL6hTFzHE5Q5jFkb22xQF-E3GZFK1ObGfIvxTBr_qPE
Message-ID: <CAOQ4uxiRhKvZ5UJNDTF56L-q-SaB-uVuc9UhKWPG5d4VKx32qQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] ovl: only sync what was written through the overlay
To: Josef Bacik <josef@toxicpanda.com>, Christian Brauner <brauner@kernel.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Christoph Hellwig <hch@infradead.org>, Chris Mason <mason@kernel.org>, 
	Chengguang Xu <cgxu519@mykernel.net>, Chengguang Xu <charliecgxu@tencent.com>, 
	linux-unionfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 5:53=E2=80=AFPM Josef Bacik <josef@toxicpanda.com> w=
rote:
>
> On Fri, Nov 06, 2026 at 04:32:50PM +0100, Christian Brauner wrote:
> > The thing that's a bit ugly is that overlayfs open-codes the tail of
> > sync_filesystems(): ovl_sync_fs() calling upper_sb->s_op->sync_fs() and
> > sync_blockdev() itself is one more place that needs to know what
> > sync_filesystem() does.
> >
> > So we should probably add a helper to fs/sync.c for the ->sync_fs() and
> > block device part and use that.
>
> v4 went out a couple of hours before this, it only swaps in v2 of Amir's
> patch, so all of this applies to it as well.
>
> I've added sync_fs_and_bdev(sb, wait) for v5, sync_filesystem() calls it
> twice and ovl_sync_fs() once.
>
> > Eheeeem, isn't that kind of a bad proxy for this? What ->sync_fs() +
> > block device do is a property of the upper filesystems and how is that
> > related to RENAME_WHITEOUT? There's a few counter examples you even
> > give:
>
> [...]
>
> > So on ubifs a syncfs() in relaxed mode returns with metadata still in
> > memory. Meh. I know the flag got droppped but that was an overlayfs
> > speicfic thing. A generic property of ->sync_fs() is a different thing?
>
> I dropped the flag after v1 because nobody liked it, me included, and I
> don't want to touch every file system for this.
>
> What relaxed leaves to ->sync_fs() and the block device is only the
> upper inodes that have no overlay inode, that's whiteouts and the work
> directories. With creation fixed (below) everything else is on the dirty
> list and gets written.
>
> For the file systems that pass the probe: ext4, xfs and btrfs log all
> metadata. ext4 without a journal has it in the buffers of the block
> device, which we write. f2fs writes its dirty inodes in the checkpoint,
> f2fs_sync_inode_meta(). ubifs writes names, whiteouts and links to its
> journal when they are made, only setattr leaves an inode dirty in the
> VFS. The only setattr overlayfs does on an inode it doesn't track is the
> chmod of the work directory to 0 at mount time, right after it was
> created with mode 0. That's the counter example from the cover letter,
> and it's the only one I could find.
>
> Anybody who needs more than that has fsync=3Don and fsync=3Dstrict, which
> sync the whole upper file system like before.
>

Another way of putting this is that this entire sub-thread revolves around
what should be the default value of OVERLAY_FS_FSYNC_AUTO
for upstream kernel, because the distros are likely to change it anyway.

AFAIK, the only upper fs which is going to be getting the wrong default
with the current OVERLAY_FS_FSYNC_AUTO=3Dy is ubifs.

My rationale regarding ubifs is that it is a very specific and unique user
base for embedded/IoT/mobile devices.

The durability of overlayfs is already wrong on ubifs without
fsync=3Dstrict. We tried to fix this without opt-in, but we failed,
so using ubifs requires fsync=3Dstrict anyway for correct durability.

I admit that this is a weak excuse for regressing syncfs for ovl+ubifs,
but I am still leaning towards leaving OVERLAY_FS_FSYNC_AUTO=3Dy
as the upstream default.

> > Afaict, creation isn't covered. ovl_instantiate() ends up in
> > ovl_inode_init() which now uses __ovl_copyattr(). So a new file,
> > directory, symlink or hardlink only dirties the parent but not the new
> > overlay inode.
> >
> > Fine for metadata, but a long symlink isn't metadata. We should mark th=
e
> > new inode dirty where it's instantiated.
>
> Yup, ovl_instantiate() marks it in v5. Nothing gets lost today, ext4
> journals the block of a long symlink, xfs logs it, btrfs has it in the
> tree and f2fs writes it in f2fs_symlink(), but we shouldn't depend on
> that. I've added a long symlink to the fstest.
>
> > * ovl_park_inode() calls mark_inode_dirty_sync(). Jan's deferred inode
> >   reclaim (cf. [1]) removes exactly that from iput() because it does IO
> >   from dentry reclaim.
> >
> >   He replaces it with queue_dirtytime_writeback(). That moves the inode
> >   to the head of b_dirty_time and wakes the flusher.
> >
> > So it would be nice if we could base your thing on top of Jan's series
> > (I hope he'll send v2 soon!) and call queue_dirtytime_writeback() thing=
.
>
> The one in ovl_park_inode() is called from ->write_inode(), not from
> iput(), and it's on the overlay inode, which has no ->dirty_inode(), so
> it only moves it to another list.
>
> The one that does IO from dentry reclaim is iput() of an overlay inode
> with I_DIRTY_TIME, that's sync_lazytime() -> ovl_sync_lazytime() ->
> mark_inode_dirty_sync(upper). Jan's patch 2 takes that out of iput(), so
> it goes away without any change on my side, and then using
> queue_dirtytime_writeback() in ovl_park_inode() makes sense too. It
> would have to be exported for that.
>
> I only need patches 1 and 2 of that series, and they don't depend on the
> rest of it. Jan, could those two go in ahead of the deferred reclaim
> part? Then I'll rebase on top of them. Otherwise I'd rather do this as a
> follow up than wait for the whole thing.
>
> > > An overlay inode that loses its last reference while it is dirty is
> > > kept until it has been written and then sits on the LRU, like with
> > > any other file system.
> >
> > Hm, Jan's series fixes that as well afaict. :)
>
> I don't see how, what am I missing? overlayfs has inode_just_drop() for
> ->drop_inode(), so a dirty overlay inode is evicted on the last iput()
> and we forget that the upper inode has to be written. Patch 6 keeps it
> around until it's clean.
>
> > There's some Sashiko thing btw you should look into?
>
> The only mails I got from it are on v1, those are fixed since v2, except
> for dirtied_time_when of a parked inode, which I left alone on purpose,
> it's in the v2 changelog.

I am not sure what the current policy is for Sashiko and emails for ovl rev=
iews.

There are 3 high severity comments on v3 that are still in v4:
https://sashiko.dev/#/patchset/20261106-b4-ovl-containerized-sync-v4-0-6ddd=
e0b7dd8a%40toxicpanda.com

Thanks,
Amir.
