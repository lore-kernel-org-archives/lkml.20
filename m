Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB131F12FB
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 00:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791160443; cv=pass; b=XzQQiJZv4BVw8NHha2eoXCZpSTsK3IeZ8bbMVDJD2SJIOuy2q/sGwUV2WMqSLJCj+9ujKacpLvGmgpLVb78aOBPpTePp0gjZlSihE4fkwQpfE4CktlhP0jYZsa/o6y0PFxsKm0WVZTr2FrHMDDhoYDJm2e2vzjWTatekYwKq8yo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791160443; c=relaxed/simple;
	bh=b6Hlryzoh1ESsleEAT9aZ4B8GsUpskyJ2Aa00XZi1sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dx0Twv0KElG+zu1tPFIpYGHNCT+hfrP3JFUKxGJV5VcJgTq1hr5ZweG6wyPvp78IbeisJUdQKOo+tr8ibcWDCMkgR1mPcTBFcEXtutstJIVr+MNblEMV2hzNJKf1ZfSNs4sTfwS3+h+fowfqjppMM9zqY7sLNyw/BtgCRGvg2TI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfHBv6za; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfHBv6za"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-88c72646f03so504247b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 17:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791160441; cv=none;
        d=google.com; s=arc-20260327;
        b=TG2ca40yH8nd8rFy1C6AiJMN2E3BUYWmD2tvH1bMh4nU+G8tduVEhixGHvt+YrKw8/
         Dgfn9WPNkT/EmKzavWJpXJ6zjXOsLZnnncTkrPpBa0qFqP/B+dpzMB/H1X2Q/WSd7Aia
         hMqaQI8AGGD8TdBzRYQC77kZJn1wPoJx1w6uGjwSaMOyPlSjDjywn/ZK0VExgOzTYQ8A
         idJXZO3bN4etBsG0ysnRKY1PckhTFu/JRxUWySKw87fIIGQbQ84i73QpKvMmYhnVHeVN
         +0qIVdSLfMTkGVnJxOabt5gCwln3Rm+jENwf1igqXzcu+y4mV3s+NEOvXy2y077B7SdG
         hWIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CTIdHKSAaUYymfZczF379ygjOIZA4TO5XNyuFGQQUU8=;
        fh=7QMDJE4IwZsFuGGcOX8DHZU4pXH16+c9coKlgGgIP4k=;
        b=ll7MzS7Uazk5FQOvi5pjiyG9EYCivkW+D9Qcrg5ydLsplms1iQ0W63bqQLs/L6Itr+
         kKZbAqlsnCth20LYrICJdBHuItEu+5UpvxvU/+dqqVgTpXxBibdKGCpmedWQq5tliaM2
         0Yb3R+YVCFbevCHXRA1++DeGBvg3I3Ko9rBkhxp+GAzwJt2Zi71peZoRMrKAntBVhv87
         LrTNXf3Rj2H8rzq+YB5hKFqpFSYUsnzMgzcqJse4XqpdBmalnvvaV4sgYlxFBapCKMe5
         0pE7Hk/ymNkG33XV3ex32rYJZV6xLia2kJ1arw/Haz3DYNZPDKtmysTLbC9NWDAnpjZg
         VUlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791160441; x=1791765241; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CTIdHKSAaUYymfZczF379ygjOIZA4TO5XNyuFGQQUU8=;
        b=JfHBv6zaiDFo0kkVH59uumwOMx0bvXhsfLIn+ySwlHuKKYfk7nHvCL/LmoTkWL53n6
         KcpoQ9W3cDKLkit/M6I9YsV4oz9cxsi/Tpxx6lmFf+x1qEYAkj1y8W5CkLFp7+Pw5J9v
         sdR4bng3EfStfq3Bs0tDCt00otIsdjveJgzGapd5RkXtGlPW2TF2CzTcJaGbrQRAZP34
         ptF2McotzJrFkCSXeIKr7XvUE1WgmKjcMHG58fMeWSDP5nnsciL5Yeh33+a30QOXLRX8
         9608QqRuf9P3t/RB68gWcf8pImNNtS63mgpbGUPytXB0y15r2YljFjHw0Dhk+987joLN
         y1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791160441; x=1791765241;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CTIdHKSAaUYymfZczF379ygjOIZA4TO5XNyuFGQQUU8=;
        b=2VjdxVfOW001vVgmJrRS+gHqWaNd2KTKSx2V0XoTYucvWG7/GSBWsxo2n7viqiVoVS
         NutW73mrbc5xhnGO9Va17FsDhx4XTNvJ3twyh8tH/Wr/pyjkjiAw+jnnHsgRuXQMG770
         Ka0k4Ao70tlxoVlNIeSvjZngxr+ByeWutpO60YWonl57iqTQuGP8orThxowuwkX5x3WL
         WZN1GsuFzuPi+1XuXaEwIu7OUFgFL0D5F4oPLHTqOL+HzJvhw2tfBoTz0iDQ70reOhUI
         aIfRFn4dwCvL8vNc8hjqfr4yz3CHx8cF+w+/v1r+KxWvp5PpHktOx+rrWXCeTdQQPITN
         ydbw==
X-Forwarded-Encrypted: i=1; AKwUvBx8Xtu7fJdemRfExIT6ryEC65cdv09DEZlj1ISehVXr2p76/RAGEeYpOPNAtXNG9lDLOrVyNbmbo+thR+c=@vger.kernel.org
X-Gm-Message-State: AFuF++nb4jSpC3SYZe7W16f/81I86Su+JM5uJXykLfvYuqgAbLbM51XR
	lSGe7DyKy8citksbPWnJANr13nKHdC1pd1j+5vzIwXwjz4fThRMo9r6nGSU9SgRetoEp0K22rvn
	zhskiUGOP5Q3fRjPhEOeLpzGF2sVUYpM=
X-Gm-Gg: AYBFou3CsKy5xRi/DkQ1jlTRahsBXGN7B+Mh3gaEus2OX1Kfwb+w4BmjUTKiLa58Vjh
	DO3QxZXp3VGy8HcsN6PpxKqCIxHfLn/K3aPB+Mc31pJ/3u+cPEc1KBr4k0WYjlgVu5xz81Y3D7b
	ZtVjRq+Kep+vS4o9HUmJG6GIJYLzTX0O9/zv2lsjl6KjntGLVFcinl/+DRLGrIUqqZ9WdRx2g0n
	jvEv4wH35pewnLRC+GwoXb6H6tkH9LbCseQzUPTDn964LH+VEzDKJDdRd4RmhNV4QsewMtOLOJf
	+34ASUViv4zKjpeUkNfQFkeY21TcXjbv0GKFSswlJvoQ8vVPLAUXgR2WqHMz+tB7gMk=
X-Received: by 2002:a05:6a00:2e86:b0:886:a52a:316f with SMTP id
 d2e1a72fcca58-88c5fedf61fmr5096519b3a.4.1791160441387; Sun, 04 Oct 2026
 17:34:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002004127.1332310-1-adrianox@gmail.com> <4zi7wmvjhwe7xph3hxawcuhlocifrnv56545tlxbs4u2r7lto3@kbusw76tettq>
In-Reply-To: <4zi7wmvjhwe7xph3hxawcuhlocifrnv56545tlxbs4u2r7lto3@kbusw76tettq>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Sun, 4 Oct 2026 21:33:49 -0300
X-Gm-Features: AclHuK8Dy8PQBXpjGnQ2jGTWR6DrhNSKI_B_mO2H_so3srBrNO4hCjaSU6skWW4
Message-ID: <CAMGU2hUBKDMVfxfABzn4bu9mKwH=KXZqsN04dvpZgCYjZG6fMg@mail.gmail.com>
Subject: Re: [PATCH] ext4: wipe moved dirents with their real length
To: Jan Kara <jack@suse.cz>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, libaokun@linux.alibaba.com, 
	ojaswin@linux.ibm.com, ritesh.list@gmail.com, yi.zhang@huawei.com, 
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El vie, 2 oct 2026 a las 9:45, Jan Kara (<jack@suse.cz>) escribi=C3=B3:
>
> On Thu 01-10-26 21:41:27, Adriano Cordova wrote:
> > After copying a dirent to the new block, dx_move_dirents() wipes the
> > source entry using the on-disk rec_len.  Use the length already
> > computed for the copy instead because the on-disk rec_len is untrusted
> > and a corrupt value makes the memset() run out of bounds.
> >
> > Reported-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D09bec78ee77613a3efdd
> > Tested-by: syzbot+09bec78ee77613a3efdd@syzkaller.appspotmail.com
> > Signed-off-by: Adriano Cordova <adrianox@gmail.com>
>
> Not that this would be wrong per se but the explanation doesn't really
> satisfy me :) If the rec_len on disk is wrong, we have a larger problem
> with corrupted source directory and we shouldn't have reached
> dx_move_dirents() in the first place. So how come directory entry
> validation in dx_make_map() didn't catch the corruption? Did syzkaller
> somehow managed to corrupt the directory entry between dx_make_map() and
> dx_move_dirents()? If yes, that is the bug that needs fixing, not trying =
to
> suck up corrupted directory entries in dx_move_dirents()...
>
>                                                                 Honza
>
> > ---
> >  fs/ext4/namei.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
> > index a6386c1d237f..71e9e7c9a7fd 100644
> > --- a/fs/ext4/namei.c
> > +++ b/fs/ext4/namei.c
> > @@ -1860,10 +1860,8 @@ dx_move_dirents(struct inode *dir, char *from, c=
har *to,
> >
> >               /* wipe dir_entry excluding the rec_len field */
> >               de->inode =3D 0;
> > -             memset(&de->name_len, 0, ext4_rec_len_from_disk(de->rec_l=
en,
> > -                                                             blocksize=
) -
> > -                                      offsetof(struct ext4_dir_entry_2=
,
> > -                                                             name_len)=
);
> > +             memset(&de->name_len, 0, rec_len -
> > +                    offsetof(struct ext4_dir_entry_2, name_len));
> >
> >               map++;
> >               to +=3D rec_len;
> > --
> > 2.51.0
> >
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR

Hi Jan,

Right. The syzbot C repro works by corrupting the block bitmap of the
in-disk filesystem, so it
has nothing to do with dirents. I will send a v2 with a proposed sanity che=
ck.

Adriano
