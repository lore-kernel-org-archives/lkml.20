Received: from mail-yx2-f42.google.com (mail-yx2-f42.google.com [74.125.224.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2B54248BB
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 08:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843025; cv=pass; b=FCQfzW9dt7c/wasahzdXYTQty65ZHat9KGqAPBtWH5FWLGHx5mod0Y6NHBZcdmygHKG4upvJrDs/I+gnRDaWrcQZhrvzR/XJ4fjPK6+rZ/TxfmwmBw9U9Xq0uWBZcONNzmlzBeqsPzficqhfKIdEHYiKB762+nPhuke6T8D8VZ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843025; c=relaxed/simple;
	bh=lHQDiiV/WUvzs9De5jG805tKo/GgvxYUYTY/p0xl4tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i7Xmhx+KQNKnSgG94Q2l+GT5e3rTluIvZ2Yva1HpISk1R9yrGsT3c6wTkXOCl38mAtC8TR6x4so6S2A4TismheZmVjicHAgqfFKi2iHByb37VaIrCdDbYQ3i3m4VBanjDVaBvpAyvUcAaHfKfqe6Cw60Bv+u8D8TfKEijC6GcUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crCLqmv2; arc=pass smtp.client-ip=74.125.224.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crCLqmv2"
Received: by mail-yx2-f42.google.com with SMTP id 956f58d0204a3-672f4b7091dso3309724d50.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 01:23:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790843020; cv=none;
        d=google.com; s=arc-20260327;
        b=QEky+8PSSr2dBLYUzzH+/PHXynzvsLiqwuNxr4B93SJ6BkNE9Sibf6h3Q1zevnYOqH
         Z0I6SknDzfGJI+0H/ZoJhk6OmlH4Vhurpkoz9q5mOrxucPOPgSEwMn13kimM2aN3nkbl
         dLhZzB5+TVEVxckxQBxDOxLEwPW18rL4kqwOaA/LP/vyb8N+7xuc7U7hwFnao9oh335W
         a8xEEBGU9U/gLlx0lK01hank8XmQpdMiH4ZaSWK/1pJ09zuxXo+a6TNhAVbuBYHnFyGG
         n9s5GAXJwJ34KQFAZEc3LBQXaY84tHeMhq/bJM0K95DgV0DPHbwfDHZhpdulGXbSLo3A
         BTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bbedR3iTIAKAz4DArSRZRO28ONnwzU/LJzRUQ18/bQU=;
        fh=nmptsHNHojdFCyhbzaDpVIxNnu3QghCsjbH8ORQMvwc=;
        b=DjabGnK0EAuztMyonCJNAw9Ve3MZb6TTLFAzQfMBXXAyokm9qHH9kS44tG9lcZzK8K
         FJUBs0OLuNVxcxaYw2CCbZ/JHiVCaOSoOTVGGDHA31GCE/Kk5q0w4KclmpGzoZBJ8Dfc
         DCFJz/dVsJ/XLgu4N0BrewreI372mva41rbqh4RTuvkzJ+LQ4+JbZYvtdpJoR3OdkIs3
         Yv/d2rC/MVdL/rLw1abKloHQdk46FQlCI/ZZSCBUmhxJcU7D6/jVqBR0c1skBz7oLjw0
         ZHfA18sKcmGgCORl5tqQNYPwEQjjJWXkH0BiHwnhSUI0HLQE36D24aqD9as8rPeKiqxh
         T2SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790843020; x=1791447820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bbedR3iTIAKAz4DArSRZRO28ONnwzU/LJzRUQ18/bQU=;
        b=crCLqmv2+ZztbpivsZT/AWh+TbbOQVOTra5NQWno7FXadjfkGKoXVvkI2yzXBfspIm
         5yjHkqWJONHBB2UEvz4L4T6+XfB1fp7Ymj43kuGqcntLMb17h3Wm5r6w1fXUkD6r9K/X
         NCH+S6xko3Ubz90mJSi9EfrDMG3OCRzj+FvrzwP365+/7jPkEVN0zqoT/15+4tZpeMkU
         D/RBTYuZElKyNAKz/dKgP5Leugs0/zqzypaLgcocPB2nU4DxtsWmLknXsQaaS47JnZid
         8J4ukhFENwnRpkxZzMOtQCUncj5rGASqcgG9EO5AtObAY2LBqBCrFtJ8r+EUeJEvWXLh
         m2aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843020; x=1791447820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bbedR3iTIAKAz4DArSRZRO28ONnwzU/LJzRUQ18/bQU=;
        b=Qn1IBIVPLXUDQknOBAqoR9qRJEVzgISHH7g3Xc9SXwyGHeFKUJOj00RcyuWkLc7WHQ
         WNMK0RzyhsmyeEcBSa9tW4qCAFNcZCXCeFcqqEp7tLf6jn/crX8D/qMeiVil9ZjEQxHO
         EndLXROXkG/r6KMTKP3vNiz/X4ZmA5NYMqDEA8qNaE1gJxvnznqUA8IP+iOTUdQl0DtM
         utreNoy84Tgzk9RzInVej1K6N6C/AiRIOfiR3141knxIDfGhR8ncGDH+Spc1ZB1qxC3v
         y6GPi7PsM7vTxs3dp5jQPkglaM6Sq105qnacA5xM4bFr4hnlC9tMh7DGh2pPh1qJUdyv
         IPXw==
X-Forwarded-Encrypted: i=1; AKwUvBwLa/LjDqYth56cfrDDPBDfSnIT19TpeZsRmxBEeyl0F1GpWL/1sqbfKkfC4pkWzaQ1Pue7n0KJKApIoq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJUAmXUdK/y/13avJApkrbhwwsmL114LEo1TxDhEJmWT7opz9Ks
	GLWC++t7yL2b2yZfDTGnYTVYoKzum5q5bz/fB0u2im5ctD2Ft41s6yBwpz5//Nkfj0Vyn1pOPmj
	gvv+BjgzNmwzjyeyXSnnGHn68XhpElFGDeWVK
X-Gm-Gg: AYBFou0nnxDMwAUiw57/cgaBiFkDBNAXe5hQZbyn4Q77gdsK/2xJVtCD98BpPDlmMUO
	jxV+aIV5AM3qpAX+2xjbnZb9W6q67tN/qSDZ3uyfDGnD7gqh5ooRhIjwe+E/DON/IRLa7iEu9yX
	aqOhfHw24wZ9Ek2xKBbgwLVS1Cp+Ndahh1/p8b2RuSYcxWOmAlTB94qlsXsobjIq/fht8U2l9Wp
	jzf71CKqg0drcMSvQrUC3E3L8UOvVi+p2WBH9DohtCsyVEvKMlJHVxMZwlTvHAwIy4Mh/9T9SZd
	hFVwtC4ksePBPKCXKyUF/8RGPIm4FO9p1GvJ9tm7zpBnPYBdq67wtc3kFF5hEnUsB3LDKx4PRwA
	2+5Gex3ODpG1V2hbMuGiDVKPHghOMOn3pY3dYcpT0T4xJrbm0VjIWvQ==
X-Received: by 2002:a05:690e:480a:b0:675:34b8:78a9 with SMTP id
 956f58d0204a3-676910a8875mr566395d50.37.1790843020410; Thu, 01 Oct 2026
 01:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904235710.16317-1-kartikey406@gmail.com> <4f62bfee-857e-4343-a194-9afd6dceeca4@linux.alibaba.com>
In-Reply-To: <4f62bfee-857e-4343-a194-9afd6dceeca4@linux.alibaba.com>
From: Deepanshu Kartikey <kartikey406@gmail.com>
Date: Thu, 1 Oct 2026 13:53:28 +0530
X-Gm-Features: AclHuK98YRavuogSrofipE2fkk4-Usw-wEQF_cqkXn9it1rSmCFq2Bd0LASJrZI
Message-ID: <CADhLXY49iDq=pZCXwn8Mp_jL0Ty3WyQ+D6KLk-AynBLcXO=jiw@mail.gmail.com>
Subject: Re: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, akpm@linux-foundation.org, 
	Heming Zhao <heming.zhao@suse.com>, brauner@kernel.org, jack@suse.cz, 
	zzzccc427@gmail.com, ericterminal@gmail.com, ocfs2-devel@lists.linux.dev, 
	christophe.jaillet@wanadoo.fr, linux-kernel@vger.kernel.org, 
	syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 5:37=E2=80=AFPM Joseph Qi <joseph.qi@linux.alibaba.=
com> wrote:
>
>
>
> On 9/5/26 7:57 AM, Deepanshu Kartikey wrote:
> > Concurrent writes to a region's "dev" attribute can race, letting two
> > tasks both allocate/free reg->hr_slot_data for the same region and
> > causing a use-after-free. Add a per-region mutex to serialize
> > o2hb_region_dev_store() against itself and against
> > o2hb_region_release().
> >
>
> The description is too simple.
> Please describe the issue in detail, better with a race flow.
>

Two tasks can concurrently write to the same region's "dev" configfs
attribute, each through its own open fd.

The only guard against a second writer is an unlocked check near the
top of o2hb_region_dev_store():

    if (reg->hr_bdev_file)
            return -EINVAL;

This check happens well before hr_bdev_file is actually assigned --
several validation steps and an fd lookup sit in between. If a second
task runs this same check before the first task has gotten around to
assigning hr_bdev_file, it also reads NULL and also proceeds, even
though the first task has already committed to setting up this
region.

Both tasks then go on to call o2hb_map_slot_data(), which allocates
reg->hr_slot_data, and later, on any failure, o2hb_unmap_slot_data(),
which frees it. Since hr_slot_data is also unprotected, one task can
free it via its own failure path while the other task is still
populating or using the array it allocated, producing the
use-after-free seen in the syzbot report.



> > Fixes: 1d3aa0b97c55 ("ocfs2: port block device access to file")
>
> Why blames commit 1d3aa0b97c55? It seems it just renames hr_bdev_handle
> to hr_bdev_file and swaps bdev_release() for fput().
>

You're right, that commit is just the hr_bdev_handle -> hr_bdev_file
rename and the bdev_release() -> fput() swap, not the source of the
race. I'll update Fixes: in v2.


> > Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D3025e3e8fc0b928af8f5
> > Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
> > Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> > ---
> >  fs/ocfs2/cluster/heartbeat.c | 23 +++++++++++++++++++----
> >  1 file changed, 19 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.=
c
> > index 1c3def99bb07..6f03de1b6d4a 100644
> > --- a/fs/ocfs2/cluster/heartbeat.c
> > +++ b/fs/ocfs2/cluster/heartbeat.c
> > @@ -273,6 +273,9 @@ struct o2hb_region {
> >
> >       /* last hb status, 0 for success, other value for error. */
> >       int                     hr_last_hb_status;
> > +     /* Serializes dev_store() against itself and region_release() */
> > +     struct mutex            hr_dev_write_mutex;
>
> Please use tab instead space.
>

I will this in v2

> > +
> >  };
> >
> >  static inline struct block_device *reg_bdev(struct o2hb_region *reg)
> > @@ -1616,7 +1619,10 @@ static void o2hb_region_release(struct config_it=
em *item)
> >
> >       o2hb_quiesce_timeout(reg);
> >       o2net_unregister_and_flush_handler_list(&reg->hr_handler_list);
> > +
> > +     mutex_lock(&reg->hr_dev_write_mutex);
> >       o2hb_unmap_slot_data(reg);
> > +     mutex_unlock(&reg->hr_dev_write_mutex);
> >
>
> Seems frag_sem in configfs serializes store and rmdir. So don't
> understand the race.
>

I'll drop the locking in
o2hb_region_release() in v2,  the mutex is only needed in
o2hb_region_dev_store() to guard against two concurrent stores.


> >       if (reg->hr_bdev_file)
> >               fput(reg->hr_bdev_file);
> > @@ -1879,9 +1885,6 @@ static ssize_t o2hb_region_dev_store(struct confi=
g_item *item,
> >       ssize_t ret =3D -EINVAL;
> >       int live_threshold;
> >
> > -     if (reg->hr_bdev_file)
> > -             return -EINVAL;
> > -
> >       /* We can't heartbeat without having had our node number
> >        * configured yet. */
> >       reg->hr_node_num =3D o2nm_this_node();
> > @@ -1906,12 +1909,20 @@ static ssize_t o2hb_region_dev_store(struct con=
fig_item *item,
> >       if (!S_ISBLK(fd_file(f)->f_mapping->host->i_mode))
> >               return -EINVAL;
> >
> > +     if (mutex_lock_interruptible(&reg->hr_dev_write_mutex))
> > +             return -ERESTARTSYS;
> > +
> > +     if (reg->hr_bdev_file) {
> > +             ret =3D -EINVAL;
> > +             goto out_unlock;
> > +     }
>
> This seems buggy.
> We have to do this before the hr_node_num assignment. Otherwise it will
> conflict with the logic in o2hb_region_dev_store().


You're right, I'll move the lock and hr_bdev_file check back to the
top, before hr_node_num is assigned, in v2.

>
> > +
> >       reg->hr_bdev_file =3D bdev_file_open_by_dev(fd_file(f)->f_mapping=
->host->i_rdev,
> >                       BLK_OPEN_WRITE | BLK_OPEN_READ, NULL, NULL);
> >       if (IS_ERR(reg->hr_bdev_file)) {
> >               ret =3D PTR_ERR(reg->hr_bdev_file);
> >               reg->hr_bdev_file =3D NULL;
> > -             return ret;
> > +             goto out_unlock;
> >       }
> >
> >       sectsize =3D bdev_logical_block_size(reg_bdev(reg));
> > @@ -2029,6 +2040,8 @@ static ssize_t o2hb_region_dev_store(struct confi=
g_item *item,
> >               fput(reg->hr_bdev_file);
> >               reg->hr_bdev_file =3D NULL;
> >       }
> > +out_unlock:
> > +     mutex_unlock(&reg->hr_dev_write_mutex);
> >       return ret;
> >  }
> >
> > @@ -2149,6 +2162,8 @@ static struct config_item *o2hb_heartbeat_group_m=
ake_item(struct config_group *g
> >
> >       config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type=
);
> >
> > +     mutex_init(&reg->hr_dev_write_mutex);
> > +
> >       /* this is the same way to generate msg key as dlm, for local hea=
rtbeat,
> >        * name is also the same, so make initial crc value different to =
avoid
> >        * message key conflict.
>
