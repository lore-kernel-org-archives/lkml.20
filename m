Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9329E3B4EB0
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 15:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788015930; cv=none; b=uem8uzHyMrd1hWuryQjbPENW3dIdTS4FRzVdmV1qq6vnmCFV3tOPWCEY0rCvYA+xK+m8rcqvQBfIIJq++B5+z65fLfNL6RKnAxQMplkN2VwTNdcgpy4e7u3+EHVlHHZvWVerm3zvZRucVv34UWaovuaZn07HF74nvfPpaRF0EbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788015930; c=relaxed/simple;
	bh=QTFugN3XEm5Io2UG/Z7aka8kxCbDYn3ZHIkEujYiBAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bj+rvDiz0GotInp6OP25Bw/5uGNd4nMBEw2b33pvnufmbDoXJ/UjDFoQh6W8Hb5L0tDRx56p7dEHx5la/L6rkclsa4Nc6TYahWdlvEHSpjKj7gAj1M1iwbqWibrou0+tciCGO2pDcV1sJGsp3tCMEYnAe/yNQTbt1YJAsESVAtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nswK7NuY; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nswK7NuY"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c2a449c57so18112541cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 08:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788015927; x=1788620727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mmph9+pVk/2tp5+TOCdi/jGTsY2OdEHY2KXUFQ9mzGE=;
        b=nswK7NuYqzH0yShtO2hnLfONHKXPw7G7cl6NlpQLseTLfNGaTMDIxcztxeSdgo/DPX
         VlDoYvf9nqIA1KOItBtKW6fjn45xrpSgMAvPTNzi5YXf0hcjychwGPTsb9K5mDzQgTW6
         Ec1AOHxxddyn3EtaKxy4xMiORxmEder7l4jg/wK2+7gTFkKyJbXdIh+60WjUbC4jDFw4
         8WTiQxoVYnu5/dq5aTy2BrJtQ8xu20klhZfh5zKLW3ckLZNY9QLEs5W/M+9Ww8a0MdlY
         J6xzdvhsLxEPn3l92OsfECrcDM0l/Ihj+uIFxjkLSZVehESK1PtxjbD8YDrw2WFVMd8q
         uXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788015927; x=1788620727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mmph9+pVk/2tp5+TOCdi/jGTsY2OdEHY2KXUFQ9mzGE=;
        b=dVeApYbE+2GzZeTDEqpQfMnlXetONMeFFf7qArTeYwbP1vZWpb1LBdT/OrwV2L79sU
         Lhv3znJfwCZIJBd5MsJkbGOXjLxhQ/AYc0L1bhK4b3Qch8Cy7CIjUJhh+7unnd+QWqpR
         BVBDtAb57U+aTZU9VheSGEmSdkMZSykdtUjh1k7EGR4NZrTOToM/ipZI5odbyBG3CUzM
         ZbGYUHMeiqF9ddGbKUHKsawsXLcumDxbc+u8kt+QJkJAqBs/L+73B4iQeX5NsxjhQPeO
         tMyvdD1mI5D8ScFOBV36U0v5ytfOO6CYXK8FvkmLK7fQDSulJXzvhRGChBPzY4o07blg
         AZAw==
X-Forwarded-Encrypted: i=1; AHgh+RpWEaaHQLquQjh3t0678pH7796iWwzZysTCYeevM6GSyGuZpI5XyF7hWHByhHJOIHbimZPaORU0aWBnUlM=@vger.kernel.org
X-Gm-Message-State: AFuF++lgvfq9C2Adg4ZTBYle1oDzur+rp8gt6gi3L6Al2g9uKf9dBZEy
	iZRQB5GEn3BzpZyflovhU3LkERnytUc0kDxeM9eZgdhlednSxOC40P4EeTJRgO5RiA==
X-Gm-Gg: AR+sD13AQl2t1T6YIRSeJk8sj0g2w4vPaoyM/ZRhW4MKT7o9i2PDAF1oR86ORs8/l5w
	bTsf4gESVTFM+L6CjuOhOOIJrA9NKuwXkOJEkbd20TZ79kbtURkzQrkPPJXKbXZdrsTK4Z4lRtq
	fhIRIWSr9PRNPlR7dPv4jo9GeALl4UhPfnAmUVIW474oGmyMZvlaFI0hMP5NWAugtt+VQa/G7yo
	A9k3/qTFMeF+VjasWunmFT5EZZbNxh1qrRVsoiKuaqdUa2Chf4lVczxclQoCpYrjKqttb+OovMy
	DuXDC0Zk43fj5dnDP+922jaUXp67NCzCM8/gjM6N59dsbm6Dce8ZCOrIu3Q8mShtamKo3+uqpmf
	x+YwpcX2T0zq4tXf1WB4EkSMsA9F/iF3NEUzeDVo6njHuGmsppu2pbA/O6uOJV9Gm4Roy9hhdQL
	tBsyhcz2f5HlTuNHMBvQtNwPlD7s0X8njcTjwafl2fUBL9DSkRM5f5GKJj0yF1wA==
X-Received: by 2002:ac8:7c4a:0:b0:52d:7b2a:938 with SMTP id d75a77b69052e-52fb9379683mr161723911cf.6.1788015927082;
        Sat, 29 Aug 2026 08:05:27 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce87695bfsm31568456d6.12.2026.08.29.08.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:05:26 -0700 (PDT)
Date: Sat, 29 Aug 2026 11:05:23 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260829011901.325379-1-rafad900@gmail.com>

On Fri, Aug 28, 2026 at 06:19:01PM -0700, Rafael Alejandro Diaz Cruz wrote:
> When gadgetfs_fill_super() fails, it's error path calls
> put_dev() which drops refcount inside the_device to 0
> and frees the objet. But the_device pointer is not
> cleared, leading to point at freed memory.
> 
> VFS will then call gadgetfs_kill_sb() after mount
> failure leading to put_dev() to be called on the
> already freed pointer.
> 
> Fix by setting the_device = NULL during error path
> before calling put_dev() inside gadgetfs_fill_super()
> so that gadgetfs_kill_sb() skips put_dev().
> 
> However, if the fault injection from syzbot failed 
> and it began the open()/write()/close()/unmount()
> sequence then close() and umount() will each trigger
> the refcount to drop once via put_dev(). This will 
> still cause UAF since refcount is only incremented 
> once on creation but decremented twice. 

I don't understand this last paragraph at all.  What fault injection 
from syzbot are you talking about?  The earlier part of the description 
doesn't mention syzbot at all.

Why do you spell "unmount" the first time with an 'n' but "umount" the 
second time without an 'n'?

Is there any reason why close and unmount shouldn't both do a 
put_dev()?  Doesn't the open increment the refcount to 2, so close 
and unmount will set it to 0, causing a deallocation but not a UAF?

Why is the refcount incremented upon creation?  Normally refcounts are 
created with an initial value of 1 so they don't need to be incremented.

> Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> ---
>  drivers/usb/gadget/legacy/inode.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
> index d87a8ab51510..77efa984ce84 100644
> --- a/drivers/usb/gadget/legacy/inode.c
> +++ b/drivers/usb/gadget/legacy/inode.c
> @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
>  	if (rc) {
>  		put_dev(dev);
> +		the_device = NULL;
>  		goto Enomem;
>  	}
>  
> @@ -2066,6 +2067,7 @@ gadgetfs_fill_super (struct super_block *sb, struct fs_context *fc)
>  	 * from binding to a controller.
>  	 */
>  	the_device = dev;
> +	get_dev(dev);

Does this have something to do with that mysterious last paragraph in 
the description?  I can't see any relation between the two.  In 
particular, that paragraph doesn't say anything about adding a 
get_dev().

Alan Stern

>  	rc = 0;
>  	goto Done;
>  
> -- 
> 2.43.0
