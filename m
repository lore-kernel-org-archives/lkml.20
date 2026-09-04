Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943194F30FD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539612; cv=none; b=qcv6tnZMWh84rb43eqNk6FhQkjZwneYX4/C2kJfhHt4Cj1Fc93Pqwod/wHdyeK7LxqhQ62O9xuVrol0PfTYsGV6PEQM2eaS9GdorHRCQHQRlw30MdmBOA0S2zmSNwj+EcevL4gdIu/paKOVQyNuXpuopnhNsCIl+6hVpcHpxtxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539612; c=relaxed/simple;
	bh=VrT2XykO7ti3SCZ+T2YEPnhpT2N/rItTjH+ZUEbRVyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+qvnvI3nfJDbW0Q1zd70QZfViEJtGuKhG1fvf7K36PwFvNZ/jd8A/FD2XnMdfRdlUZ1XRLkIA9w8yy5fatQgxFgAZ9NjN0evxVS306qkEVnmXPua/c10l2uzwlqkYnNsgEIQlLHTG3dWlc7BypPZ3ZpNHKBMm/oVaccVDuSagc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M45UfK4n; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M45UfK4n"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-930f618435cso132310785a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788539609; x=1789144409; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k0RAZ+DHfHhnurcfDsBD5DXgNqK8QxFkv89PsAFPaag=;
        b=M45UfK4nAdqYxB3ZXMgc/mUBNv7sHHR18dBM+v2k+aWWD1RGL1r2iAFXOcSVYNFoqW
         XEfQpao3y7rdE9R9+yjQvCPeCNBKRRcPjUAbVls/ycvXe53EijrEDD1OVxeDOn+8w+uy
         NJiSElO7s+4zVW9atcbjYDWJ/Cnrn6xm1HIpWPqN2cOjgA+qHXqRi4q3YWY3Nfa0W41T
         9D38Vl1U/3NlUOpPRVRhTYb2p0meUbxTnnLiYUxdEdE3AEpT3sGFRB57GA3GM0CLaenf
         tt3urhd4H2rYX9TqzVmSNDgI/MWd+UVEkUQQvZ0nTyIKRw7iArEiqNlRPwxdfIX3oT1z
         /FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539609; x=1789144409;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k0RAZ+DHfHhnurcfDsBD5DXgNqK8QxFkv89PsAFPaag=;
        b=IT2PX01UtNv/m060iw1Ate3U5RDyy9rWG3IH0W7ygqjk1GWeGOxJUDCR4fr1BoiJQm
         XO99GFAFuAreXt6cLb3WiB22y3fPrNL8MzyUqWoy6QJ8cbA9XMbEHTmA4nEAII74PrTM
         qemj1SxWqvJqlXqTllcdkCzIFueqEF0SFqKDSed1VsOWgK659RHV3zyDEXLpekljIcM/
         b/CEtQobi2rtSG7hIXFjmytSHvT2dq83b+erwuiaoJgTBoSbpU7qIuOHDE+F4jS6tZNG
         LkDdtzQj3IpkEIAgUyqkmeyXl3oXvjK4WJ68YEv8M90JSw7K6oUKZxntjldNBKRD+c6m
         XK4A==
X-Forwarded-Encrypted: i=1; AKwUvBzisfun2ucbuJpAXTap+mThBaVLkF575AXAd5f6O7FVWONXGY0WQE/O5+JkAwPESNuux49pOYX4C+wU1/s=@vger.kernel.org
X-Gm-Message-State: AFuF++mDaM+SkRO3sSCX3MIQS7KqIm7ZxAfzpYYubzSGyRlXPYycu8GP
	uVI9LERgHmC23hfY/eQQZ4R2CCXsckG8Wx6xFShjhX2TbsGNa3FFitmLd8Z4w54BQWJiO0hIsqI
	vLhEdzg==
X-Gm-Gg: AYBFou1GRmpdnCK7bGReBm8+LP/tVOwmD9+Ll/obEHk8C2xkZKEbY9zCEqeID2H/A+v
	GOgoiCBGHWHbI5AQm+blxw/QhNqX17Pj+mi6nc7jYRJz+rJ3Pp/IelOLk/3y7Ggv6dP1PFdcQ9f
	/6KumAP+MlZ9VjiGXAragEbtiwoO2MQl5qdA6HSDerjaZoa+Kkm7pi3/f/obosEobHlckS7x/GJ
	fc5qTq8XbF8yCNQLSbQqspyu0NAtNnehXlzVVayAy0XHecw8WGu2zJvTML1/kKcAMCFpzCjJ9N0
	NwAbOTyMBCeryG8GmaHSJ71ZpjJ0EER3R0raEcYzsr6kEpzzeIcW4cRkrSPLUdb87XOw4vHPxvM
	Ay9W3kegn1gDy59440JeuptKZn9Vb82GQHsi0t5pDPpYDUoQV4vNIijIvYNyDXTTSwgnDdrvEIW
	5XCkZfg/cbsAVwXKlgfLMxvetVLoMHPr/ZvncrzV2QWBU7ZohEmhtvDIpKUPidmTuMZbHZoo8X
X-Received: by 2002:a05:620a:690a:b0:936:dc16:206b with SMTP id af79cd13be357-9398043f64fmr710261985a.26.1788539609125;
        Fri, 04 Sep 2026 09:33:29 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbe00f9sm250252985a.45.2026.09.04.09.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:33:28 -0700 (PDT)
Date: Fri, 4 Sep 2026 12:33:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v1] USB: gadget: Fix UAF in gadgetfs_fill_super()
Message-ID: <c1af4757-14de-472b-8d71-cf4172afafaf@rowland.harvard.edu>
References: <20260902050127.3767049-1-rafad900@gmail.com>
 <b99e8d15-9031-4d77-b1c1-2bd8cce6013e@rowland.harvard.edu>
 <CALp66yF0MZy9UKo_qGGeekxV0RNMNKZ_foqADVnqg+_YgEYqEA@mail.gmail.com>
 <de10753c-7504-4b55-b08b-cc8b91cd6711@rowland.harvard.edu>
 <CALp66yHc7e7QYxNhKy_zMHe7gV=KrCexu0vB+AuStCWOM3D8hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yHc7e7QYxNhKy_zMHe7gV=KrCexu0vB+AuStCWOM3D8hg@mail.gmail.com>

On Thu, Sep 03, 2026 at 10:12:27PM -0700, Rafael Alejandro Díaz Cruz wrote:
> Which changes?

I had to go back and look at the old email messages to figure out what 
you are talking about here.  Don't reply to emails without including 
enough context to let your reader (who may have to deal with hundreds of 
emails every day) know what's going on.

In this case, I was referring to the changes between your most recent 
patch submission (v1) and the submission you're planning to make (which 
will presumably be v2).

>  Currently I'm on the new v1 and all I would do
> is remove the top paragraph you said was unnecessary. Or do
> you mean add the "Reviewed-by" tag that you added? (Thanks btw!)

I meant everything that will change between v1 and v2.  Tags and all.

> I'm not sure either about adding it below the "---" line.
> I haven't done that before....

Now's your chance.  :-)

> I saw an example from some other patches and I guess I would
> do the following:
> 
>  20 Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
>  21 Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
>  22 Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
>  23 ---                                                      // ADD
> THE PART BETWEEN THE "---" ?
>  24 v2
>  25 - Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
>  26 ---
>  27  drivers/usb/gadget/legacy/inode.c | 1 +
>  28  1 file changed, 1 insertion(+)
>  29
>  30 diff --git a/drivers/usb
> 
> Is this correct?

No.

All you have to do is copy the format of the other patch submissions in 
the email archives.  It should look something like this (note that 
there is only one "---" line!):

----------------------------------------------------------------
Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Link: https://syzkaller.appspot.com/bug?extid=4a5c87a01894ca37f25c
Signed-off-by: Rafael Alejandro Diaz Cruz <rafad900@gmail.com>
Reviewed-by: Alan Stern <stern@rowland.harvard.edu>
---

Changes from v1:

	Removed unnecessary reference to syzkaller in the description.

	Added Reviewed-by: tag.

 drivers/usb/gadget/legacy/inode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/legacy/inode.c b/drivers/usb/gadget/legacy/inode.c
----------------------------------------------------------------

Alan Stern
