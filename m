Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9BC411F8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274681; cv=none; b=W7FyI7zIsnRCTFbdCFxp1VM80Be1L2jH1/M7vrfixPPgn2BMTBDIFodencNtbllkKgiV1/LLlDPqiyz7MNY6kSw+L/P08jLhSeT9hsNgI5+rg7X5TOkUrjeJ+FyZg5FmH5M1XlKsuef7R3pD6AHV92/6sxcHqPjyXgKrUyowgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274681; c=relaxed/simple;
	bh=xGGT6ev6YnlKUvS8Bw6ihAIyneNBkLYVa7+GovOX2uM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqSYycTDm8qcTGcsiVwhhNAsX8ifwGVBOZdYzq/5xo2Tn/z7Z+drKUBvxNhGIrH2JoZHI7pW6bx3i8THUejqNDsNKmg4/KhEkmRM8hMPZ+b46htZMRafsnjS7hONJxDBv2kAI0BsnxnPWkz9NYobD0uiesDmpSNwMAHiYWOtnIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wWQdt3Zx; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wWQdt3Zx"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-52d8679c149so8833911cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1788274679; x=1788879479; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3UglSJQrs9C4hmjmA2b4GF/jKcD4sITEPAg8uXUAeEE=;
        b=wWQdt3ZxSnDHOyGmMnoZhyImRigDLvLDci+w6N0HgzdwV07t02gcJnB1anz76dyNlX
         z65VQ+LTpJ+/feWrZEscojMEF34YyELPkovzn1qY3tT/2GQzbrAXJxKNGEsAbtyH0qxS
         QLnPmNAxrC8BZZh0jGJG+0MWk5udN5SE+YUtf8t9w2b+hD2xA2JmSco58I/kwVQPjzQb
         Yr7kYNNni4bNjAtrCXtI/NseUhVFllJYhGSwMoS0BhDblleRql+wHIEzrvGpYr0YEtzp
         QCRbI7Qnn0647LQOXOjOJHDPFK96dOG2wemcmwnHPNL096CbXVL5Tqy/OfUNX+gyHAQv
         R+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274679; x=1788879479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3UglSJQrs9C4hmjmA2b4GF/jKcD4sITEPAg8uXUAeEE=;
        b=flL72eu6craTJhvX7EH3KXLspsvr8BMR6gCe8Bs6zVpJ8Axd2qGLyGdp3umHhZmqTx
         fl1OIrCe2fMX4QQgCRKhfWN/UgYpuvbc9xKZ0lnNlIUPmr/lSpMi9rZBCVFnSKCe+feg
         36GRfWLBwG2aFeJIeNOD9xc9xZowaJIj3qTR095iR7M5QvTErc2c1gERiFFkLbRPbpxH
         Meq+K1C3LM6X8mZnU9gCc6fGKWm8Yz51/FjiA6SjgB+HeZUQT1SiqjiDoFLlj1fBJxkj
         N0qfbqNF6sWXeWXoBuAuNoWWzTzRqbK32iyopkiK9RC6iuKyRC1AFB8b77ka4xX8fW9y
         lbAw==
X-Forwarded-Encrypted: i=1; AHgh+RqteTqLLpbfr0wMhx0ABFtxJL0CZgRL302VfK+qesEqEntfevOpf2bjq1Ne7oD1pHR7JN1EpVoMPellx40=@vger.kernel.org
X-Gm-Message-State: AFuF++kJe3JWWSfPWy55rAD6WcxxAd1fW9YYjCVWxX3gQUyn0bBL6ZQ+
	HvfPRQHkJ/VlyS2SiKinsIf/jCN5OUOzari1Ex9qJzoO7cnZS86vptakU14FCpqWZw==
X-Gm-Gg: AR+sD10wkdR5J9wBboQFRDS8zRdfbNLrd4gEIvP5DTVahofi8VlzsiJvMwz667IeY71
	SFJNfysOJF0fpV70nY5oQtxLsUi3qJZyherjpAeusrwnaXiBFe92e1QREgHDEm5X8JZm2X0tJ04
	CZaoOkN4QIEqTRWRBA7nMdaZwAVyZIxyPq4NRc8yBggkQH0gJVlNisAFAHh3BQ7YdCRkgP638tC
	BoZiQtFe9PypjpyeZjAbwLtYtCSAQcDBDQuSElWW1Csag69Qq0DnFdFmLW76oRSAA+JmFDxD29Y
	1K0Ofb+2vkHbREeGgo6R7Z9FjXXkfpmuKM8YwkpQqVaitBOhvUdeSGaEBPAZiWNVmuJTeBLsV7k
	8ouag5qzCfRsJXo+PncmjnQo1Z2FZc61BFiBaCX/yBNWLdB4gzKTiDX4yxgVshqcpRdmJAPoo4d
	v249THGMbJE69l8FJ2q5NYLftfmO8iS/0RKb6j8sX3Brq8FkQLdutzNqJ58Iadzg==
X-Received: by 2002:a05:622a:858b:b0:52f:b9ad:9dc1 with SMTP id d75a77b69052e-52fb9adaa2fmr352866411cf.20.1788274678874;
        Tue, 01 Sep 2026 07:57:58 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::7544])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52fbe581f8fsm97181971cf.9.2026.09.01.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 07:57:57 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:57:54 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Rafael Alejandro =?iso-8859-1?Q?D=EDaz?= Cruz <rafad900@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in
 gadgetfs_kill_sb
Message-ID: <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
References: <20260829011901.325379-1-rafad900@gmail.com>
 <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
 <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
 <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com>

On Mon, Aug 31, 2026 at 10:06:23PM -0700, Rafael Alejandro Díaz Cruz wrote:
> After spending a couple hours staring at the code and
> asking claude for things I might have missed, I did come
> up with a better explanation of how the error happens,
> but not why it happens.
> 
> I began by removing the get_dev(dev) line I previously
> added and keeping a mental score of all the times
> that refcount is incremented and decremented and found
> that in most cases, they are even. Except in one case
> inside gadgetfs_bind():
> 
> static int gadgetfs_bind(struct usb_gadget *gadget, struct
> usb_gadget_driver *driver) {
>      struct dev_data *dev = the_device;
> // ........
>      + get_dev(dev)  // HERE
>      if (!dev->req);
>          goto enomem;
> 
>      if (activate_ep_files (dev) < 0)
>         goto enomem;
> // ......
>      - get_dev (dev);  // Move this up
>      return 0;
> 
> enomem:
>      gadgetfs_unbind (gadget);
>      return -ENOMEM;
> }
> Somehow the reproducer is triggering one of those two
> if conditions and sending the execution down the error
> path directly to the gadgetfs_unbind(gadget) and skipping
> the get_dev(dev) right before it.

That definitely looks like a bug.  The get_dev() call should be moved up 
before the set_gadget_data() call.

> Inside gadgetfs_unbind() we call put_dev(dev) which
> would be an uneven decrement. I can confirm this was
> the problem by first making the change above and
> then triggering the reproducer on my local QEMU which
> does not trigger the UAF.
> 
> Yet, I don't understand why this is being triggered since
> from what I can see, none of the syscalls coming from
> the reproducer are directly related to this. And these
> .._bind(), ..._unbind() functions are not part of the UAF
> stack trace but rather, something that happens in between
> the reproducer triggered by the usb protocol.
> 
> Not sure if this is good enough. I don't know what else to
> look into.

You can make debugging easier by adding dev_info() or pr_info() calls at 
various strategic places in the code.  Then the kernel log should tell 
you exactly what is happening.

However, no matter how you decide to attack the problem, you shouldn't 
submit a patch until you truly understand what is going wrong and how 
the patch will fix it.  This means thinking for yourself, not relying on 
an AI to do all the thinking for you.

Alan Stern
