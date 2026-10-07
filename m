Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D27646AA8F
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 11:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374178; cv=none; b=ieaC7niRDJbmq5PpRTHBs7Wmn2kMQE4ulslEHoGu0X1nThLSWr66lFxfjm4QURTePoJerz62YAgwfAm1PYPPMV29hHPiFPKyqc9fevl/x9bRh8UXdy7FBUJg9z/WoLkWv8veF48nZSl0BcLskhkYML8UiHyBCs7Km//OgrAmcR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374178; c=relaxed/simple;
	bh=0mKzJzhvRTn23cOkp9SXQk/Lq1UUtnbmx21hUDvb4A8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKD/AC8ouy9U2aEh/3ENQUTZrpD9+Suu46dngbu35nHSQLcLThK8+YNtf6O7ZIlnxbbqguVo/t/nVkX59VO9kjS+dh+jBU7DKvMbzuRGFvszXKeR1QqfmEMFyeR6hCeLLM7/UgxeqFmb52FQxbGddvQpVf9+3a4QbsQoPhjwAxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gvsEZ9tO; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gvsEZ9tO"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-88b7d853b11so1971016b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 04:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791374168; x=1791978968; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JZQ4iJQBmWrwwDO/BcGSbLFg2HWM5GD+53dVXLWaRIc=;
        b=gvsEZ9tOVdPQ1im69qr1l2Z90ixHr05o/aQJ4zdHUAsSRDMORoIgrfdXb57eTyr0Fl
         j/uCADh4XKy9b2Z/bN/hYgObfTGdk0PQUTt/pAs535XOqGHtUC3dxsUeNH/884tSmVOS
         1UgrktG9wE/lUHSbeKZqlVb6RX53prlGc0SX2/Fe7M6FTqkMMdDNe1RF+8cd3kfxZhlF
         brQlbe4Z1Pkee6NedwEUFD7HKV2qUzc540iKT60wPVOXrg5NXiKDxfLYD6WTGjvFpT8Z
         aF9+BniAlOIiRkOwqsfPgmvwHpMrO+kyT1mE6ZLo4xBD5ZptlYUykYeNrF3NTpl8M59B
         qOog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374168; x=1791978968;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JZQ4iJQBmWrwwDO/BcGSbLFg2HWM5GD+53dVXLWaRIc=;
        b=ilLSYSfnUDRvvEVi5qTiZ2uzl0W0aUm8kHIQN+4cfnfwwXS+XNbyZlfOHLPwx+F52A
         dU/Xaq3dR0WGzaDG1J30xY77AkSk5TRn8VO8dNK6vE1GpTdrKXhS0igAwvzSuJpBZweo
         UjHRv1j0N5CxuXDt+XkiZQQRBoKlfhwhJf6n+vQ0nucuFICbTQ1SOdTZroGamZOdP8Tn
         rD7arTp0nTG2wLLKzh2LQyrxlGAHo9m4Ok1QwwLmVJX2gP7U4W83pxLyT525A18Jwksv
         MEJWgAadCJjwFUaOorFwwT1kuKIzJeoAcaf7P1Ml93B8/PHrJjkAjtKJlgs/H6Cw+xVp
         eXRg==
X-Forwarded-Encrypted: i=1; AKwUvBwIqjt+sbrxHSg3jtiV2W0UkV4Y27ZBipJImz4wk3dLqRWWZhsdcx0pNZbVmz7aHd3Gr2bbJ6amIwKiOuA=@vger.kernel.org
X-Gm-Message-State: AFuF++nGPosM9y+Clf4eQbEMxTcdtqBNwAZgbpK843L3r4Ck2e2erwb4
	FN6nImw387j++5pOna58TukaUcDzuKF5aHwCa1p6djIqQuFzFGo6zoTJ
X-Gm-Gg: AYBFou2cftybP1DWqaMsfW01xaU61vLYJroGW7SOYdHi3PCXc1wp2dVQlFtkhPcutSX
	dydJgeExP2UrfrQ8msN6B29Z57cRTIyMYG1vffuH/WbP1wp2ZXwFBWLjBAJoRkZ56ypI4xEiKSk
	GbUx3qJ403BCROXPowu+glWQoI/QsADgj6R3UtAKz1l5uB6YprDIzffJXaPGOGFGYtg/lrhxgtC
	GDV0Jgr2L3l/KLL1ukvpf1vmP9myw7RZxBZq1yC+dssthWTi6Y1Icvh/MXBoNkV3/xOOcKUIveG
	/4fooJM9KJqutQlvC3pixboxT/g9gE5FTUKQc8zvT1SBMXJRFIbRlJM9+0mFcrPtPO+HK3dA9/t
	yTJUDnIQDo4ZZb6JhRXXeiMy2D3Ee2rsyjZZRDq1UWQ8P8s6WiGpAtD088epTiRYmCVOYKFI5IU
	u87iwrI8QM4r4QhpZRD4msCwBYEDm8dU18TbsU//3llimwYp9m6FXE185ZxgrvvPwDliCvFfQN/
	UQM
X-Received: by 2002:a05:6a20:d48d:b0:3de:3f34:5df7 with SMTP id adf61e73a8af0-3e13401e7a7mr1775759637.12.1791374168216;
        Wed, 07 Oct 2026 04:56:08 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:836d:b1f5:934e:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd0aa36f1f2sm1240482a12.30.2026.10.07.04.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 04:56:07 -0700 (PDT)
Date: Wed, 7 Oct 2026 17:25:37 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Qu Wenruo <wqu@suse.com>
Cc: dsterba@suse.com, mason@kernel.org, fdmanana@suse.com, shuah@kernel.org,
	linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
Subject: Re: [PATCH] btrfs: fix use-after-free on quota enable allocation
 failure
Message-ID: <asYzOSJqJTgD5Yzp@user>
References: <20261007090656.20609-1-pavankumaryalagada@gmail.com>
 <4851139b-6cd0-4b1a-9a6e-1af947d49098@suse.com>
 <55739226-436a-42c3-a5fa-c699b01f819e@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55739226-436a-42c3-a5fa-c699b01f819e@suse.com>

On Wed, Oct 07, 2026 at 08:29:14PM +1030, Qu Wenruo wrote:
> 
> 
> 在 2026/10/7 19:47, Qu Wenruo 写道:
> > 
> > 
> > 在 2026/10/7 19:36, pavankumaryalagada@gmail.com 写道:
> > > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > > 
> > > The quota root remains on the transaction's dirty root list when
> > > kzalloc_obj() fails and btrfs_quota_enable() releases it without
> > > aborting the transaction. Later add_root_to_dirty_list() then accesses
> > > the freed dirty_list, causing a slab-use-after-free.
> > > 
> > > Abort the transaction on allocation failure to clean up the dirty
> > > root before releasing the quota root.
> > > 
> > > Reported-by: syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
> > > Closes: https://syzkaller.appspot.com/bug?extid=947286c775f432b073a8
> > > Fixes: 8d54518b5e52 ("btrfs: qgroup: pre-allocate btrfs_qgroup to
> > > reduce GFP_ATOMIC usage")
> > > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Reviewed-by: Qu Wenruo <wqu@suse.com>
> 
> My bad, Sashiko exposed a valid but very rare race that the temporary
> quota_root can be added to fs_info->dirty_cowonly_roots list.
> 
> This requires enough subvolumes to make quota_root to be higher than level 0
> in the first place, which is not common but definitely possible.
> 
> Although all readers of fs_info->dirty_cowonly_roots won't be reached after
> the transaction is aborted, there is still a very small window that another
> thread is already holding a trans handler just after the transaction is
> aborted and the quota root is freed.
> 
> In that case the other thread may access the already freed quota_root
> through fs_info->dirty_cowonly_roots->next.
> 
> I'm afraid we need to call list_del(&quota_root->dirty_list) with proper
> trans_lock hold during error handling.

Thanks, Qu. I understand.

I'll update the error handling to remove quota_root->dirty_list under trans_lock
before dropping the quota root reference, based on the latest for-next. I'll send v2.

Thanks,
Pavan

> > 
> > > ---
> > >   fs/btrfs/qgroup.c | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
> > > index f68b696b4bf7..42be06675c90 100644
> > > --- a/fs/btrfs/qgroup.c
> > > +++ b/fs/btrfs/qgroup.c
> > > @@ -1204,6 +1204,7 @@ int btrfs_quota_enable(struct btrfs_fs_info
> > > *fs_info,
> > >       prealloc = kzalloc_obj(*prealloc, GFP_NOFS);
> > >       if (!prealloc) {
> > >           ret = -ENOMEM;
> > > +        btrfs_abort_transaction(trans, ret);
> > >           goto out_free_path;
> > >       }
> > >       qgroup = add_qgroup_rb(fs_info, prealloc, BTRFS_FS_TREE_OBJECTID);
> > 
> 
