Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6354736EA98;
	Thu, 10 Sep 2026 16:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057980; cv=none; b=f3bpiLKcQGDJagySo8DwicWgw0PU908IyLT9C1wS2X+7+WgO4pcC278CyydT73U5Mlqthe6TPgoYINh+MgEST9kcjtXIarujPhL14MuctS0K4WUHqc4Cm/VuheeFtxGh+35AVi//56J4/FK6M1iaeUJBJyM9ias8uaoCBLtlDn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057980; c=relaxed/simple;
	bh=Th51M9BCateIl9TBihSGO9j60HRPXhjHMcz9jqjrkoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lIUWEdfq1hFXee4OS84NnlCvVps2ev+lCBfVWuwoDp9gkJS3NxleVxxg2Txc37e804mAu8HE5CRoHEwxJfkbfuIDS38Gm2aTDJhj37oU+NTo8OmX4LXWGsb9TX4+JQ5GrHvZK+OjHHqCE29uX5UJw+nBGvpb6aMB3WBt1sM2m7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=g8mkJRT+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="g8mkJRT+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C301F000FF;
	Thu, 10 Sep 2026 16:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789057979;
	bh=4e/lHMBOqQKn3tV9EgQ5nOxZ0TJdWTfi86ircsxOjv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g8mkJRT+VpsF1LDqf0QbPdjXUxdW0lDDUcsT5E4By5cMroV01BhURWAqDqMpgF4OJ
	 eV0DzNlZd/U5ub5NFGR3EmWVI/JZanQQDacgdZarU+GY5tTsOnsRVYOe793XlLtesW
	 leZN06nK3tz0ndTsEeeEIjzKn9jYIN6MsA2qxEsc=
Date: Thu, 10 Sep 2026 18:32:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Chaithanya Lagisetty <nagachaithanya9911@gmail.com>
Cc: christophe.jaillet@wanadoo.fr, kees@kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
Subject: Re: [PATCH RESEND] usb: gadget: f_loopback: fix descriptor leak on
 unbind
Message-ID: <2026091028-launder-jockstrap-be0c@gregkh>
References: <20260808181504.462492-1-nagachaithanya9911@gmail.com>
 <20260902105153.3516793-1-nagachaithanya9911@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902105153.3516793-1-nagachaithanya9911@gmail.com>

On Wed, Sep 02, 2026 at 10:51:53AM +0000, Chaithanya Lagisetty wrote:
> loopback_bind() allocates descriptor copies through
> usb_assign_descriptors(), but f_loopback does not release them during
> the unbind path. On every bind/unbind cycle of the gadget (for example
> by repeatedly writing the UDC attribute through configfs) a new set of
> descriptors is allocated while the previous ones are leaked. syzbot
> reported this via kmemleak:
> 
>   BUG: memory leak
>   unreferenced object 0xffff888016b8f180 (size 64):
>     comm "repro", pid 5613
>     backtrace:
>       __kmalloc_noprof+0x3bf/0x550
>       usb_copy_descriptors+0x6c/0x160
>       usb_assign_descriptors+0x48/0x180
>       loopback_bind+0xff/0x120
>       usb_add_function+0xca/0x270
>       configfs_composite_bind+0x667/0x9b0
>       gadget_bind_driver+0xed/0x390
> 
> Move descriptor cleanup to a new loopback_unbind() callback that frees
> them with usb_free_all_descriptors(), matching the lifecycle used by
> other gadget functions such as f_acm. With descriptors released during
> unbind, the usb_free_all_descriptors() call in lb_free_func() becomes
> redundant and can be removed.
> 
> Fixes: 10287baec761 ("usb: gadget: always update HS/SS descriptors and create a copy of them")
> Reported-by: syzbot+28cf08dec5895bd562e6@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=28cf08dec5895bd562e6

How was this tested?  I don't see syzbot doing the test, did you?

And did you forget an Assisted-by: tag?

thanks,

greg k-h
