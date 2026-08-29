Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E484C6D
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 00:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787961689; cv=none; b=enZ13ywAkUTtoAKGvrBSUSdOe+CmBld5/GFv2wYlWj+Bx7LX8GWWc01P0EJzkej0bI0iprwvXxvIseaiZWvTUORQaQfygWep2zFzfgwesvXKouPENL7A9hrU8Prur2bTuZqH2ai/h+4txUh6dYhhcHBohw78XwJnMJZyWAN6J60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787961689; c=relaxed/simple;
	bh=XTtWz0UzJqkUF4/34oCqxMpiGnDoUtBqy/FaIC8xjoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyfGOe4J/ikKJyzOuiqt3T6HYgcL3gU2jeqCv2uKd/SoJe2WynSD7ygMGrHZuy9CH9U01tzz+WiNvJHGIQlDXHpjoLObr6zijhkOfPge3BnbjUPYRsxv7EPtBiv8HnPghfR/ASZG2UPh8VGSm5H8j07JMlXRcKWGHMgjzGoREeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L/OWsm4V; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L/OWsm4V"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47fe45db360so232757f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 17:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787961686; x=1788566486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=78uVeNXTFjv5Imt5OX67hFUHeeD2uCgnWEQFVSHEokI=;
        b=L/OWsm4V5Tm3fnlMTNjY750vRJleykx6TgBN3H/Jdu4WHg5rrRyqNq7g2UsSKPLp/S
         MsTn4Sa+qHSngLeN8OOBQTEV1JSlbWpfslodj97yWnGAo+ZG9I1wH2cT2hy21fvPHg92
         tRW+dkktgKe7nMsZh052VKLBG4ibD8I7F43vbZvbsKxUYKMZ7VoAwxaeo3xyTiRT10LP
         XTIGlzoRruz4y/UCtpGa0YMW9uwY41+sEfjmwggustk9VE1mI/S+e50p8e4N3Qq5SGi0
         HWaQxiO7/LRrdRH73arxkzmyRQMBsNc7+vhdsmnz5NYpRnP2QMt+Seo2RwhCI8GvxwGm
         ISiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787961686; x=1788566486;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=78uVeNXTFjv5Imt5OX67hFUHeeD2uCgnWEQFVSHEokI=;
        b=QveozmrwTYKpbMkogiVsUObROt9UG6LTEslRwvRZ4oM+SI6Cf3c82YgktkfPYDKkD9
         NifuJ2p33JREtCuS1iRV8pxxjefc2q3/q+ZIP+vmj2kargYGF173dnJHek/rafcLkIa1
         SP48Dis+tRJhcaFdQNVuSGHLeO0fTDsiBzNgzdjr0q3OTdFr856VDn3BHiAdhmScRRdR
         qsnZ2GWHMvBd2EdIGvOhuVOL/HZicGi0s/pRhdq3+TnQ5NbynXoEPclPB3EPfZMt46Ut
         lZkdIL6n9XOSMdzO5dQYkBlUaNgVafEahAmmFubHovAmu/N1WTn5bGjNbGARHPPVfTJe
         RbcA==
X-Forwarded-Encrypted: i=1; AHgh+RpbkhOJugrTqKXjh8hbpoI7fOyE4YEmLw4UwF/orc5XJ+LHlETJr4MU9bnXtTMkaYYUvoesv/YEZ4fKW8A=@vger.kernel.org
X-Gm-Message-State: AFuF++l7MdP4G0TK3IPU4WxN7FAbfeZGC3p78BoP3qakio/PrWR9C0dh
	BDJHMZSrukXRLMgyPi6k9KL4cTFBaBhPaVSCak9CmEQxAgEm+kGB2w6ZCWffCG3sKYk=
X-Gm-Gg: AR+sD11VMJIzA7E5/1jc6VRyJfMpGLq5ulrNU6NCdHk6YTmbazaKFE8aoNGaDdkKMlP
	zurdGRke7esnV8rhnjwT51v0Zxn2GVFypwv/Y8V+bkVB54d2WaEnswnEOi1v+uMZiG0DbOWph/b
	1tyddeg/w8V4pkzbOQVMfJbsdBGcdUcxKXP9yFUyf+0cgaU4LZFmsF74VegqGxjCbsix8GdhWhR
	nDShAmXqtst8CScv+7LROziHbFXkTQHW0M865cbApRqtURV+o2HVPti6tGzx6mrMcLGyoPCA+gY
	KU48+XQBf4XgLGCN6y/yUL3tMABh3gh4a29+8jxZgAFxHuLV3eIdvp+FIE6lllR8uTCSera+W9w
	pZToaESCXQ536B403iieVSZDy4R4/8x2/8s+iJ5CEE0pYHbHcZGSml2+ck15EzS6v0T4viNzIxN
	GT7DJT+yAvizez89AmTkS+PzUui0AL+1biNBoGAzLFFhOgnWdbPRuiNy9PYEI=
X-Received: by 2002:a05:600c:3103:b0:499:cef6:104c with SMTP id 5b1f17b1804b1-49b91c39a77mr80523985e9.1.1787961686337;
        Fri, 28 Aug 2026 17:01:26 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm1024562b3a.24.2026.08.28.17.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 17:01:25 -0700 (PDT)
Date: Sat, 29 Aug 2026 08:01:21 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Li Zetao <lizetao1@huawei.com>, Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
	ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] ocfs2: free replay slots in ocfs2_recovery_exit()
Message-ID: <apIhL9ZVN4Hdc6Mu@p15>
References: <20260828112825.666097-1-joseph.qi@linux.alibaba.com>
 <20260828112825.666097-2-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828112825.666097-2-joseph.qi@linux.alibaba.com>

On Fri, Aug 28, 2026 at 07:28:24PM +0800, Joseph Qi wrote:
> Commit ce2fcf1516d6 ("ocfs2: fix memory leak in ocfs2_mount_volume()")
> added ocfs2_free_replay_slots() calls to the mount error paths
> out_dismount and out_check_volume to fix a leak of osb->replay_map.
> However these calls are unlocked while the bail path of the recovery
> thread, which is woken up by out_dismount right before the call, also
> frees the replay slots under osb->recovery_lock.  Both sides can thus
> observe a non-NULL osb->replay_map and trigger a double free.
> 
> Fix this by moving ocfs2_free_replay_slots() into ocfs2_recovery_exit()
> after ocfs2_recovery_disable(), which waits for a running recovery
> thread to exit under osb->recovery_lock, and drop the unlocked call
> sites.  Both ocfs2_dismount_volume() and the out_super path of
> ocfs2_fill_super() call ocfs2_recovery_exit(), so the replay slots are
> freed on every path.  Since super.c no longer references it, make
> ocfs2_free_replay_slots() static again.
> 
> Fixes: ce2fcf1516d6 ("ocfs2: fix memory leak in ocfs2_mount_volume()")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>

LGTM
Reviewed-by: Heming Zhao <heming.zhao@suse.com>
> ---
>  fs/ocfs2/journal.c | 3 ++-
>  fs/ocfs2/journal.h | 1 -
>  fs/ocfs2/super.c   | 5 +----
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ocfs2/journal.c b/fs/ocfs2/journal.c
> index d8afbc1a76bb..a3938a03e93b 100644
> --- a/fs/ocfs2/journal.c
> +++ b/fs/ocfs2/journal.c
> @@ -156,7 +156,7 @@ static void ocfs2_queue_replay_slots(struct ocfs2_super *osb,
>  	replay_map->rm_state = REPLAY_DONE;
>  }
>  
> -void ocfs2_free_replay_slots(struct ocfs2_super *osb)
> +static void ocfs2_free_replay_slots(struct ocfs2_super *osb)
>  {
>  	struct ocfs2_replay_map *replay_map = osb->replay_map;
>  
> @@ -243,6 +243,7 @@ void ocfs2_recovery_exit(struct ocfs2_super *osb)
>  	/* XXX: Should we bug if there are dirty entries? */
>  
>  	kfree(rm);
> +	ocfs2_free_replay_slots(osb);
>  }
>  
>  static int __ocfs2_recovery_map_test(struct ocfs2_super *osb,
> diff --git a/fs/ocfs2/journal.h b/fs/ocfs2/journal.h
> index f8b3b2a3d630..19fc920d26b1 100644
> --- a/fs/ocfs2/journal.h
> +++ b/fs/ocfs2/journal.h
> @@ -151,7 +151,6 @@ void ocfs2_recovery_exit(struct ocfs2_super *osb);
>  void ocfs2_recovery_disable_quota(struct ocfs2_super *osb);
>  
>  int ocfs2_compute_replay_slots(struct ocfs2_super *osb);
> -void ocfs2_free_replay_slots(struct ocfs2_super *osb);
>  /*
>   *  Journal Control:
>   *  Initialize, Load, Shutdown, Wipe a journal.
> diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
> index f785c39d1fb8..6a8092b65bb5 100644
> --- a/fs/ocfs2/super.c
> +++ b/fs/ocfs2/super.c
> @@ -1162,7 +1162,6 @@ static int ocfs2_fill_super(struct super_block *sb, struct fs_context *fc)
>  out_dismount:
>  	atomic_set(&osb->vol_state, VOLUME_DISABLED);
>  	wake_up(&osb->osb_mount_event);
> -	ocfs2_free_replay_slots(osb);
>  	ocfs2_dismount_volume(sb, 1);
>  	goto out;
>  
> @@ -1776,14 +1775,12 @@ static int ocfs2_mount_volume(struct super_block *sb)
>  	status = ocfs2_truncate_log_init(osb);
>  	if (status < 0) {
>  		mlog_errno(status);
> -		goto out_check_volume;
> +		goto out_system_inodes;
>  	}
>  
>  	ocfs2_super_unlock(osb, 1);
>  	return 0;
>  
> -out_check_volume:
> -	ocfs2_free_replay_slots(osb);
>  out_system_inodes:
>  	if (osb->local_alloc_state == OCFS2_LA_ENABLED)
>  		ocfs2_shutdown_local_alloc(osb);
> -- 
> 2.39.3
> 
