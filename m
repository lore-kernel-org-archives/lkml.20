Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0624B5414
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 14:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788445754; cv=none; b=P+3nNUttQwARZHRBodKrjYToHg06f7ABJCDJwH18wOm+7C8efZb2nwiXG0kc9+VnsiQJDR2NjwsgSU+e3V2ppO3XSaljarVTsEIaIGxW1mvXJkjD8trjN4IXotjjeou4dOJljKATLqFfU+GzwrwwhEo00Q0tjD8HM+OhKjzyetM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788445754; c=relaxed/simple;
	bh=Vc4nsG4rCMbc4asB0jvGimE0BiSPYtdgvM6B8UIfOQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X8CvT/CDMSUWaX2+nyHqVe6bY2TM6hSdsY64DtOamrpOpffyWxLBRSHWVOLh/aVyqJcNGtJAS2IKppTzTFmnqAqE3ezpuLoOTgIHqf0eVlhnEsm7EKHMFmRed6Unh2Hx5/dI8qHfCqf62TAlP5F64INVYVf/A4d7yJzWc6JS9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=iS/kwITY; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="iS/kwITY"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-864cd11a932so12122577b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788445737; x=1789050537; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZpBFCA2vtIano6DcUrYmzhDoETXua24x0tWYntbBUm4=;
        b=iS/kwITYgB9P5uT6vP+QuwPVaEbifajboAg+cpz5nmQaa7fIjwmtG7yDRHTH+QcJmI
         ABQv5w8BNdnxdecG/x3YW8niN0ZTBiaIw8/K1qhe9n4cDjugQ0IEt/TbXBiNHk/cxKTF
         Q/RD4bPUVVmJpIgtqWqgicpwftNhoiJluCNIRQ25mrHq3njx90tbT5SHRgFLNVaO0/Jw
         VmmPC1maSIYsSXAYAuUKc3h19Uoib79mW4kOH7r5BMRZDj0Rz857N2KHjc73NT7QIJGy
         mq/9wQ8OGh8wLo2yxEC9j8+KVV6ChbHxqMhlJeE1cNKWA5KcRfWVtU+LXmFQ5DfFQysn
         MASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788445737; x=1789050537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZpBFCA2vtIano6DcUrYmzhDoETXua24x0tWYntbBUm4=;
        b=YGlrxkD1YbM0iqvscacHi+lP7fF2pRQvTktS22zluwbhfJU8I0FEZzogYDx+Z57MCJ
         uKcV8kAt9iJXdcp7bAyQJICE9oeNMAiVirr6+wmVENPqitBCieMcGUE4+e04aXCIjilj
         PdzFw56qEToqMzfa17J5ue/nxqUh7pS1fvUOZotnniMwss0kuZCso18O1ySve5B0OTRM
         itE1Tzx7hiz0d98CfNzK689hlE6s2QhgotEj9EsHpz2eMt49CQwX/wIcfWnB9FHFfKT7
         Ur6z+ELYGp5WmN8ey9B3xjKVJKq6muGZnmxxCUe80zs7nvM2kO/YrQM35rs+sVwE2r8M
         cqJw==
X-Forwarded-Encrypted: i=1; AKwUvBwSljP1Y+Zy8Nl2r82Rx/XyJmKP8U/EiL7cCHCrAvJYQ9uzheg1N/OLhn3SLxXkoUkekG7GK7FzB4Eq4Vs=@vger.kernel.org
X-Gm-Message-State: AFuF++kBNfBSeEUBpzaSyehXcAwI9JzSgV6Ny5EltOyTA6zLpmg9afNi
	scsB0+YnO9LHIDI43CiAdtEDayHkd8nEFI9ah4litEIPTfBXASk1ierSHRBJ30vm/g5jkHdxED7
	HJBo=
X-Gm-Gg: AYBFou3BN5aBvTLm53Y0wpiKQLidIEhg9jL2IQWvM9KaCG/LAmsaKWkHvnMj2v+LCcb
	iVgT0mxpLPPDDCa0WWJX04fKUI2p+ZggTb5KCu/tgYKjm/3ZeEllmHVADU4BxllWlmlZc+wldrh
	ww/m46rtwHUAz0H7TOIe//2FKSX7nIAJ3h6zVLfQ9gy3MqwnjIXbh8l/aC+NMesWjuk9Dt1oLAR
	d5n02uy3SbKiG773s0wdjG8Qa6lbUuKtvyJzf/rkbo9fIP5QfqvpbRrFsN/1A77FK9JY6pakoCQ
	mEBQYuGTGT7/3KVAOjAWskIJfKax+d9zRbAllR7BjCIuscUGxl3OPR4u7rEpPHZw7wfMZjsUvpp
	7ZuyJgKKgl9UT8wWHIPJ25PSQXHMwsEIdOEOWEh8go322nDuKCosuXqFcx9RSL8taTJaoB4sj66
	vWV5jspwGwydSZYsO6G0zktzFCmlSq4e5X79BxqWwQW/CGT/ZgImbVlQjC7X5heI55/shhvCidc
	A79gWg=
X-Received: by 2002:a05:690e:128c:b0:66e:3f5e:d9d with SMTP id 956f58d0204a3-66fa924b4dbmr2742108d50.24.1788445737190;
        Thu, 03 Sep 2026 07:28:57 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90e9ee2ed6csm43888976d6.17.2026.09.03.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:28:56 -0700 (PDT)
Date: Thu, 3 Sep 2026 10:28:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Message-ID: <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
References: <20260902050127.3767049-1-rafad900@gmail.com>
 <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
 <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com>

On Wed, Sep 02, 2026 at 07:18:25PM -0700, Rafael Alejandro Díaz Cruz wrote:
> Do I need to create a new patch for this?

You don't really need to, but it wouldn't hurt and it would make things 
easier for Greg KH.  Don't forget to list the changes from v1 below the 
"---" line.

Same goes for the second patch.

Alan Stern

> El El mié, sept 2, 2026 a la(s) 7:38 a.m., Alan Stern <
> stern@rowland.harvard.edu> escribió:
> 
> > On Tue, Sep 01, 2026 at 10:01:27PM -0700, Rafael Alejandro Diaz Cruz wrote:
> > > UAF is caused by syzkaller reproducer forcing
> > > the failure of gadgetfs_fill_super()
> >
> > Just a minor comment: The fact that you used syzkaller to cause the UAF
> > in your testing isn't relevant.  Memory allocation failures can occur in
> > real life, without fuzzing, and the driver needs to deal with them
> > properly.
> >
> > > When gadgetfs_fill_super() fails, it's error path calls
> > > put_dev() which drops refcount inside the_device to 0
> > > and frees the objet. But the_device pointer is not
> > > cleared, leading to point at freed memory.
> > >
> > > VFS will then call gadgetfs_kill_sb() after mount
> > > failure leading to put_dev() to be called on the
> > > already freed pointer.
> > >
> > > Fix by setting the_device = NULL during error path
> > > before calling put_dev() inside gadgetfs_fill_super()
> > > so that gadgetfs_kill_sb() skips put_dev().
> > >
> > > Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> > > Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
> > > Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
> > > Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
> >
> > Since this fixes a real bug, you should add:
> >
> > CC: <stable@vger.kernel.org>
> >
> > > ---
> >
> > Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
> >
> > Alan Stern
> >
> > >  drivers/usb/gadget/legacy/inode.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/usb/gadget/legacy/inode.c
> > b/drivers/usb/gadget/legacy/inode.c
> > > index d87a8ab51510..3e2bce7543d4 100644
> > > --- a/drivers/usb/gadget/legacy/inode.c
> > > +++ b/drivers/usb/gadget/legacy/inode.c
> > > @@ -2059,6 +2059,7 @@ gadgetfs_fill_super (struct super_block *sb,
> > struct fs_context *fc)
> > >       rc = gadgetfs_create_file(sb, CHIP, dev, &ep0_operations);
> > >       if (rc) {
> > >               put_dev(dev);
> > > +             the_device = NULL;
> > >               goto Enomem;
> > >       }
> > >
> > > --
> > > 2.43.0
> > >
> > >
> >
