Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C1654CF4E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979469; cv=pass; b=eXYIw1/Oyy4pr9RZXLY24Vp7WY1ttbEhdF5NwgpKWvR83+rR6Zo6zcZ9PpGuXllSiESCme7RfZ14AOKuOwfkTFyTv07MMGu4adzqhdPAilngZKyKQiDCZkJftNXxg+bLeTn2wATOxxWV+wv7YJvrgBHuyjOb7nFBVURTFbdrvMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979469; c=relaxed/simple;
	bh=Wi/jDrQKzRxURPUJz7//qYMt0lT0aqSKvfETFytvBAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a0Te3cmTmx9gWoplznnz/TETuyQ5ngj++C1bIMPSuVn9ciepI+bI5d+NIKsFjDYDSlodW7yaocQAsa2044PXU2tCdgEF6PTyoKnB0ET6V62edu2KFUuvEV5dV+s1SzyTcI0O/tqbn7vriqdWebZovoWklYC/Yew+vVlS4mFOnGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNGTv/6V; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNGTv/6V"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15b7aso577073e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:44:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788979465; cv=none;
        d=google.com; s=arc-20260327;
        b=WW44E54ygCxiVoLb3wYNrWFHvZEd3p3XsjyURxhjuMmGz5kM5iTfCzGl+2w3XXOTOB
         4XJPAbBT3oFZjaP5tSs8kb4jIS3XgGTPYv2826a2A/RRwJ30yktB2D6ueSn95GRn2hMQ
         SwIJIaNhqcwiLyqVfGivPiTucXhP6wVAY+TAqXeLHlwSs9lUlnMOJoz2U17A5SHLnk+Q
         0tejYviUJEaPetvrnHQHeO6YmH7wUIh5VMZLHWWhYgeyOs1515ip0JPKjy+qj3hsOiBt
         9BsfyuZ4cwVAz7wLrNKZrmhEi3d0pwL3hxBv1xciN06R70PyrmTp2buvk82ciqvbD8Ak
         lcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DDlK8Hcn9GGpXziSrv5Y5Bf+KxxDJlvMEGPxYg6Eges=;
        fh=sPilOYAT4QfMgYxGH2LjRrcqbLUzvrQqMQUicHZMufQ=;
        b=QxX1NlmKycn7uNZPXFQl8DwYcNo2nNTjkSxQgj4sdBq6iFziD9iqSJCwUxXYlcrEVo
         9SlKP56EQj5OU2ATVuRIlwF+OBepS/7ZxgfTW10ZOwKKIKrh5+vwy96S7EdUywoA7h8Y
         6dcVZvhyYuzMNR1dwHkKYF79wlj7jsDAtPwGv77U7p4rgixAEOXlZwGtw2sWM6UNpGpn
         c3dbWB+VD4CFxa3i/JA0SZZ8cITN5WG+0sXk2IovMIIs6QLOd6jFljHkf+JhaLQUFcI+
         hVskWizj/R7BcMBgbyCoxdBREzFVqatODhpvcVPfItvGKf31MMn7j+/M8Rb1z7fdghJf
         9N+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788979465; x=1789584265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DDlK8Hcn9GGpXziSrv5Y5Bf+KxxDJlvMEGPxYg6Eges=;
        b=PNGTv/6V7f2nGZ6c7hHUg+olbpABSNhKpL5mN0WQzVttwpO4q38hNRZXLHdbuNhi7K
         I8IvQa68RWQ7UPW1wYwDB98ihckDOq08gcR+Dmi54K3GiEU1KIWn/6YwrqBJbMpr0bJr
         n6alZt9Q4C7W1gr5PWg/5Ld+uRquVOZgnylDUmad7CpI1+SdMPcztQv+CX6LkOCRkpgJ
         AstAy7i+X/eWeIO28GmtM4ucxuczJEufFVxp80aGjHz6wMUkSsSO0UNT5ADQK828JuHY
         bTHGdkW0hrDUv8qqbp5OBlmywV03NJjTCJPwPfdasDNyfF3gTkv6DwVCUNdi06nqq1OB
         12+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979465; x=1789584265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DDlK8Hcn9GGpXziSrv5Y5Bf+KxxDJlvMEGPxYg6Eges=;
        b=CjPhLiB+rJ0rPGI9xFY6oJu3D9h93QmS60g17Wn+W0qGKKQbGylP0RfS539QaMcdS5
         KuktikAge81nukSoOZqtyY7OQSpOXpwN8K6tcPAFueTcRSR8TQYMIosygYdqujG/zKY5
         7BWVtuezMAO+LzKY5nujNGjJsDg4Aqzdx1fmXIxLWQxYp0YEUnEXFLRAEtJjqMQrjOei
         zfzDjqRhuO8dYbU5WZigs7Nu4LbEkBTfvQVSEOjdK46juu7VM/9mau7ZdQisHkpnAkUS
         EUcBKJLvtuEzveXmGI+1U2kmvD5scUa+qdsGvAgSCDcNAjaliaB4YBxyxU3XLu4MaZ69
         ffnw==
X-Gm-Message-State: AFuF++nUNM3HrFv7mwVVr7TS+AKqJ+hPAFwKzl1mW1nGL7RWiWzTfVTa
	+PZsJrqBtKmewkFo/PW1L/Mjq3YgVUGA4ClW+6Nlc01T63bVf51kQEulP3rSrQ7IVbUhL8ZOH6Z
	+bhmeNx3XW+b4y6F5/7DadttvB8bhQcc=
X-Gm-Gg: AYBFou1AObXDW8xG5CNOQdJCwwjrxg2AG/7fQ0wcwtyoefAux3EPL23TM7hW3A+YKuE
	6UlWgnSTqQY6f0J6+jtFRnbqP98wGJWv5AGYeuaKu1L1taxzzgrRlwz4wfwpym6iO823S8cFnYB
	Lno0gXdm2P1p9JnCm3WBe+B4wVf6JMfgf47HvhGr+hZhkrMPOE/TcR7IYhhkcU+wS/VnuNWQpUv
	qPcyxmwO1W2nv/XnNFjbbjcR4PqtNkjqodCz4/WNzCVDEQyilQASoQ3Lgu4UGPTEI5vpso/NtGa
	aV7JrQdBArSKtAVj8bIGgwDWV3JFXh5oN9aDu1lwbIRgkX2km6WJNxXV1gvXDQNorawg+noT7BL
	u24R2UWyR45Glb+xQvfx0mqU1U5sgP0aNDs8RWziiPICu
X-Received: by 2002:a05:6512:3c8f:b0:5b4:4c28:2249 with SMTP id
 2adb3069b0e04-5b8988e910emr981843e87.24.1788979464739; Wed, 09 Sep 2026
 11:44:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904145923.1936598-1-daeho43@gmail.com> <90c7fbe0-3f06-48a1-a9df-6b9ae6a3d9d1@kernel.org>
In-Reply-To: <90c7fbe0-3f06-48a1-a9df-6b9ae6a3d9d1@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 9 Sep 2026 11:44:12 -0700
X-Gm-Features: AcwNN1WKiOH5Uc6PiJElHi-TeunKAfxK32KwaDjqsWz5qFfHiuKoawksEE8GEBA
Message-ID: <CACOAw_wQvkwAZP1d9KkgmZx3Jkt8F-iOrRKoD+XNEyWDhyj8nA@mail.gmail.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix livelock in f2fs_sync_inode_meta()
To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	kernel-team@android.com, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 3:23=E2=80=AFAM Chao Yu <chao@kernel.org> wrote:
>
> On 9/4/26 22:59, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> >
> > During checkpoint, f2fs_sync_inode_meta() iterates over dirty inodes in
> > the DIRTY_META list. If igrab() fails on an inode (e.g. because it is i=
n
> > the freeing state), the loop continues without moving the current inode=
 to
> > the tail of the list. As a result, subsequent iterations pick the same
> > inode repeatedly, preventing other ready dirty inodes in the list from
> > making forward progress and leading to a livelock.
> >
> > Fix this by moving the current inode to the tail of the list
> > (list_move_tail(&fi->gdirty_list, head)) before attempting igrab().
> >
> > Additionally, if igrab() fails, the freeing inode may be waiting for it=
s
> > pending writeback data pages to complete during eviction.
> > Submit any pending merged data writes and yield the
> > CPU with cond_resched() to allow the eviction to make progress.
> >
> > Signed-off-by: Daeho Jeong <daehojeong@google.com>
> > ---
> >   fs/f2fs/checkpoint.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > index ef22692cef0a..5597033533b0 100644
> > --- a/fs/f2fs/checkpoint.c
> > +++ b/fs/f2fs/checkpoint.c
> > @@ -1460,6 +1460,7 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_in=
fo *sbi)
> >               }
> >               fi =3D list_first_entry(head, struct f2fs_inode_info,
> >                                                       gdirty_list);
> > +             list_move_tail(&fi->gdirty_list, head);
>
> Seems fine, if so, do we need to do this in f2fs_sync_dirty_inodes() as w=
ell?
>
> >               inode =3D igrab(&fi->vfs_inode);
> >               spin_unlock(&sbi->inode_lock[DIRTY_META]);
> >               if (inode) {
> > @@ -1469,6 +1470,13 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_i=
nfo *sbi)
> >                       if (is_inode_flag_set(inode, FI_DIRTY_INODE))
> >                               f2fs_update_inode_page(inode);
> >                       iput(inode);
> > +             } else {
> > +                     /*
> > +                      * We should submit bio, since it exists several
> > +                      * writebacking pages in the freeing inode.
> > +                      */
> > +                     f2fs_submit_merged_write(sbi, DATA);
> > +                     cond_resched();
>
> It uses the same implementation from f2fs_sync_dirty_inodes(), after git =
blame on
> it, the implementation was introduce long time ago, I suspect we don't ne=
ed this?
> because in .writepages, we will submit cached bio anyway, right?
>
> Thanks,


Thanks for the review.

1. Regarding list_move_tail in f2fs_sync_dirty_inodes():
I will apply list_move_tail() to f2fs_sync_dirty_inodes() as well in v2.

2. Regarding f2fs_submit_merged_write(sbi, DATA):
The original intention was just a defensive measure in case the freeing ino=
de
was waiting in f2fs_evict_inode() -> filemap_fdatawait() for writeback
completion.
I will remove f2fs_submit_merged_write(sbi, DATA) and keep only cond_resche=
d()
in the else block, and update both f2fs_sync_inode_meta() and
f2fs_sync_dirty_inodes() in v2.

Thanks,
Daeho

>
> >               }
> >       }
> >       return 0;
>
