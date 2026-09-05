Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B2D367B77
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 06:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788589897; cv=none; b=hZ7R9gCtZJ+SiTCsjDRpPuIChDRsmVXoiSIViX0pIgsziMbjIhAqNj5OTRVyl3Qm/yoohxyioLv8BpPFON5tHRZfgmQn/xtz2yc9TNS/JhLQCwStoAn/ZBKUwGEnonNmJ4akmjxXWjHKKrNGwGkKzbtPIWOgY1VK03sx+4fb2HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788589897; c=relaxed/simple;
	bh=CSdPRELROkYKXy+2tVtR16UKWCgrtQnEIaCw5HxeGSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=en6gV+HUIzOsTnIRSz3ESVNtCXREmeSVn2X3VJPmctxyTrESJkpT/1Kt+nkfBT7F8Ff22Op/IkUf9NN/+EcplhwIlEUPBTT9H7sMFe8/qZs1SViicYjzX9LBlRRhH30ZF8xe3+LJ7BPUC5E+7tzcliaGhQhrMz5HmoYlykMArLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hFFi5FYk; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hFFi5FYk"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b965570d7so20454675e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 23:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788589894; x=1789194694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E0jfYxlquFYCTLGleo8vFGywQI0ODEMKtD2q20GPHRE=;
        b=hFFi5FYkEeheJKxTd6NpdlYlW6XEAX2xWBQdisIdVI+P58B0fJZPDFEYTTNjs1xHsd
         Fj869yNm/ZJQ1sDscqTmgdyrWCk9keGzKb7tDFnUlN5aytzo8FnRrc6vAib+ds0CXTUo
         znk380OhJKNGdrorzvXkCnKk708LmG3mmsIJmlUl8s7lYCMSW3ugiUrJ20+lOmfBco0J
         V5WX9Pv/jLFvowgYmxu/gj5NCKdiGSSJpZaOQu0dS7+f3pT3CXNwOU30PnLSNZil1wFk
         y/35Q1THjmaxiTqtCEqzbIcSKNbWWmirQeGiKngG/lYyZrRxwsOFU4Hu0azfnt18u2HT
         4CLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788589894; x=1789194694;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0jfYxlquFYCTLGleo8vFGywQI0ODEMKtD2q20GPHRE=;
        b=MN47Ms2TFbYLCYX067gOemfQiwmSGSbjfpgNBmIGhfkQ93xDLpZBeroNvEmU15eHYG
         25uv10cNHpCmVPixQOrof3np8pMWIbTMN0sL8JcEAGi5yICFwV5loFK745HcRgidjxDP
         aATAZPdpDjgc2ZHtS5ATYs2Sd0bFXgViFqHOkOoziiHOytUKfVHd5YMtf28srYPiXxpI
         ALdKTU5HI2Et08UqMij3fyzKo/9GCtoxCESF/lGQKixFsXJ/EKnkf6MT3DiP3DRoerFe
         GlFUPmg3RGDkJnRAgwKO7ec0CYUsqavFiU2+Hd9MGYFkLRxQlN5Qy6SQu7cg7SuqJSP7
         O6fg==
X-Forwarded-Encrypted: i=1; AKwUvBzKLDn9KTuOII45eHEdJD2YwhisY2BLmpK73NJpsZLcgGZiAdbN+Ex4fK9e2KFPNzv38lT8ZLdCPKw+R3s=@vger.kernel.org
X-Gm-Message-State: AFuF++kle/uqqGEzyBVwYJuulr5fj/PbRDqySow17mR9rQy/UMASUzOU
	KCyGS8zZgAOG75LoLYH43wDI53I6EDPYJ6LgEiG+/j9WPZ+mgk3i/RJY
X-Gm-Gg: AYBFou0LuaXcRFqcdtlUVSXEn5Uymser5IJrqtFntz259h2Q2AwPParquQtYL8h/jLp
	sKBEEc1vlcWMBxlMDUqc3byLcUbwcw+3xSuBzxa9mQDckvOduay40B94lRMmR+qyDUUdI7aSnE2
	OtfmXCgewxj+YQ4QX+XjnIhc3xLJpA6HoY2yfzxBbkSgMiC0Fvo+E+ahpU78GoP+nSQTbE9TbzK
	/8B+zoM1+SY9KC89cFej/QKha52K5QYHf/3xzSaytKQSVYfKWKzdCJB6stdOfCs4c9dZ4epbESv
	rezqZQJqO6pHf7qP0dVvfzOgRqsmFlm9gWEPcaprXL0KPMhwE1SavJNq4Lza59xnlbrjXo2uv+9
	D9sATPkCMTO2jQyJi9y979jLr+FktgRWylRMxEjALB6VUWJF17BSLNCUessK35djo2XneZ9lCVc
	9Fdw11h2EiumM/HsMkwAiLhKKsRA8M5LZ0jvSKH0FrxhgoGNon5Zu331/SqIqEVcV6vUWVBhGGH
	eJt2u4pNVgrR2dqcnEwRqDgEzHwWFsJxtaQ+TxBLznsSWyX9SxaoAsoN9azePmf3PkBymijiENd
	xMgV4FGCw/Lfj+YRCx2qiT05I/S1/7uo6kTvA0FyxrDGpcvIGTDwLnwMtssyIG/as0qPX+VdnZQ
	=
X-Received: by 2002:a05:600c:3b02:b0:49b:9202:6f80 with SMTP id 5b1f17b1804b1-49cf8220edemr113027825e9.6.1788589893900;
        Fri, 04 Sep 2026 23:31:33 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7710aa5sm123259535e9.7.2026.09.04.23.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 23:31:33 -0700 (PDT)
Date: Sat, 5 Sep 2026 08:31:32 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Paulo Alcantara <pc@manguebit.org>, linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] super: make iterate_supers_type() deletion-safe
Message-ID: <apu0mCbJ4S0TKIQM@gmail.com>
References: <20260903013336.92081-1-kmehltretter@gmail.com>
 <32afuwcqxfzvc2qwsvx6ecpyvbunr45wnvmezbbqzz25qtfn35@tvotjvtm3soe>
 <20260904-astronaut-anpfiff-unbebaut-743381f4995a@brauner>
 <20260904-rockkonzert-bergtour-dahin-23c9c5c87d0f@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-rockkonzert-bergtour-dahin-23c9c5c87d0f@brauner>

On Fri, Sep 04, 2026 at 01:11:53PM +0100, Christian Brauner wrote:
> 
> Draft, feel free to grab, Jan or Karl.
> 
> ---
>  fs/kernfs/mount.c |  4 ++--
>  fs/super.c        | 39 +++++++++++++++++++--------------------
>  2 files changed, 21 insertions(+), 22 deletions(-)
> 

Thanks, I found no issues with your draft.
All the tests I ran on my patch also pass with your draft.

Below is my proposed changelog. If it looks good, I'll send v2 with you as
author. Could you provide your Signed-off-by?

super: make iterate_supers_type() deletion-safe

iterate_supers_type() drops sb_lock while invoking the callback and keeps
only a passive reference to the current superblock. That reference keeps
the object allocated, but does not keep its s_instances node linked.

After the iterator releases s_umount, final teardown can unlink the current
s_instances node. The iterator then advances through a reinitialized node.
With the current hlist it stops without visiting the remaining superblocks.
The unlink moved from generic_shutdown_super() to kill_super_notify(), but
the cursor lifetime has been unsafe since the helper was introduced.

The CIFS DFS lookup can consequently miss a matching superblock and return
-EINVAL.

Move removal from fs_supers to put_super(), alongside removal from
super_blocks, so a passive reference keeps both list nodes linked. Keep
the filesystem module reference until then, since unlinking s_instances
may touch type->fs_supers.

Make sget_fc() skip SB_DEAD superblocks before invoking test(), and set
SB_DEAD under sb_lock to serialize with those callbacks. This allows
kernfs to free its private information after kill_anon_super() returns.
Keep matching SB_DYING superblocks until SB_DEAD is set so concurrent
mounts still wait for teardown before retrying.

Fixes: 43e15cdbefea ("new helper: iterate_supers_type()")
Reported-by: Karl Mehltretter <kmehltretter@gmail.com>
Suggested-by: Jan Kara <jack@suse.cz>
Cc: stable@vger.kernel.org
<your Signed-off-by>
Tested-by: Karl Mehltretter <kmehltretter@gmail.com>
Assisted-by: LLM
<my Signed-off-by>

Thanks,
Karl
