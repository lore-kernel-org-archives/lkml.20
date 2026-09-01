Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA749B1F4
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 23:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788304351; cv=pass; b=sElRQfIiwuPd7/2jx7JazrDJkDmHR5SA3fPR7Yi5PiLEu2Rgr/uFFNr4K+ZtrVR6q5Auub7OOzsFxZAkI8id9b35c6jv9HwJSv+Kapwaik7cGYuvod/Rw38i+e1+2UsRTi02y6U2IVW0rj1ZECnzJT0O6D0ynvNd5ykLg2bjjHU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788304351; c=relaxed/simple;
	bh=8RFmVgoZUYYPwojEUNAJzrW/NY8oS2T/YWuIOXAr3tg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSe/vX53sMIYU2QOS64p89FvVSv7c3wgIYhi1vcHF7SRRGEF7aZXTOpcsFiiXeWCa0hPx7JpYPOWLPoxhZSy3kQt9Sv6Qwf05PaWaZKv9/XeS1h6Y+ClS31p5oF0ZC1wKtySZimGGhTrgXcJQdijEMxDePNFD/A8xqRyswHjUFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P88JUiY8; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P88JUiY8"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso346487a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 16:12:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788304349; cv=none;
        d=google.com; s=arc-20260327;
        b=TwGJgd2keDKT60xNM0nG6RQo317aOQlF3UFDEZMyNwyqFnGyswinKr3RFn36ZrHp4y
         rU3rtXrOuHARo87Fz40MeyFsXMgGZohugDy1YwTHpJv0ZmPPUJRAq1sxaH8EmTC0y7UD
         5dAHo5uKRJnBKKhLBOB3Tn0B8OVA4HLKVoDLQv65smbEqQF39s3RBG4eKjY0B6O5rG9G
         mBzwCRolkRX1KlH5az45cPolAgRaGyzizFgaVBUVjuu7VNL3ZWSy45k5ArWLMPim+vDJ
         CURFra6GzzKjKeV++cMLC4AlQNeons8M2rlBzXWDdNUODs0VmEjxNYxxOaaBgPbX3FSf
         fXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01GPFfh5P+Ox9iO1fOokqrxnZgCOOcZluKfK/EpmKQk=;
        fh=9O/FoI7dTQpqp2QXiU/nKOl602tSHZkf9Oys34KTBCE=;
        b=OYkMo0h/LJbrgRh9lF8/xjSa6VveNrAxd2zUXsefsVIjO2gKxfrn158nUDji8HtuLC
         Q7Z2U8ueolhpzUpwktQeKArqDjrSx0QMmU1PTwXn3hIyKWmBGU2/+wHdU4HgziCI86np
         QDeCqn14kwzpzPSXJNv/R+sAFimCkd1yAUPbYZGxw4SxL95q2v08N5RF36Ed/Uam6gt1
         +hcafmVZvwUjquQU5Itc/dXl05zFUdnriMpFXlbplLr4ISpg6NqXq+Q3dGYqup7J9GY3
         VAr7p6hSCcoaPwGOmFxrdgAu7JqufEkbk3WBULXrxlk+Q0o/gl+d2kkbfVBbamTBsYVC
         dpQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788304349; x=1788909149; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01GPFfh5P+Ox9iO1fOokqrxnZgCOOcZluKfK/EpmKQk=;
        b=P88JUiY8Nngh/Lk2AJon4bVnsqUoVR3LDawraGKfwhL/tjletZjvxcZXmBEDeYqrPt
         L3qWIamICf7ayGe41Bx7BYuCad5YgX5af0dnv8LMFi8K8a9gEoX5vHiv9kbmbwHe2a+i
         zbqcNqTLhzwvtS5TTuRfuVcs3u+t8mjcoRuiM4i9Sq9HvdnWbsWlgWVgtn4iHigTBxj6
         WW/U5VnKdAg5PXxd/BiR+MB4TNq5IRmoXOUqI/SULfYYxYJACyck0eeGdvZiqhlmySHR
         0T2dGkNTlkZvEsFisLRF9234ecPVzto/VnxwXr7pVeG04Zl+UYMgVDquh7O7bNbPtHoT
         ZiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788304349; x=1788909149;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=01GPFfh5P+Ox9iO1fOokqrxnZgCOOcZluKfK/EpmKQk=;
        b=DxulVCrEe2IQxOCMo7JbOtqxTLmmwN0Crl8ST3mdI6qT2Cnaxx/wz7T5ChIjrk50yS
         2i/0rfasKufxWRm9c4AcIf2nuNwrAMlOINjtj8S2z63e+ATYm9xM0C/w2oPGjHUH6Vfi
         2KJWdt2zCrWtVjoOLpdOddLzBvAgbBK0Rl4XzOgmAjIkxHWdepiLdkTLP3Ja/2DVVFbg
         kpOQljRA9Gid2k1/Kp72lNDG3m3cpgtTJXGBZ7BcQvbDvtSR+i4a+RGAP1U4wbqUrW0i
         m/YgHyKMqj+r8wYHMbxdw3i2FRsiq24ZkTrM+2fkjPLr0X327sFemJIkfsi3Wi4nRMP0
         mCbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwiSO/HWulLQzHxwPdlkl//UzZm44/1uc83mW5FLYfRXwQexI3rcCC26hidv/4hoMb3WLl1N6yMAJ2m2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++misVBfUJcYmTiucyCr51efGitthx1YKlhoai+pSgclsHiUYvDm
	mJHmLpFR0JLJtHIfh+eVV5aNWmPPKFxBm0c7dERDcTACC80RxPbl/Z0inxVAHf6C4jqJdrhaYhH
	NbPPf5o8VXxIrTJMyfiNT2kS0gqV8W+M=
X-Gm-Gg: AYBFou14Pgn7B2oHo/OJGsDo2vIyY9G08J7HrUzhzOAEhO7Tn4OU+YbxyoSIxm2oZYO
	FXIOrIz63tBXEyDj+ltIUemtehTlcQinsx1krVo0mih18QODWZxacwJciw7HqwRk+924eB//FmC
	HjH8DH7wjuads9ctyeQ+yI/IKulyLBTdWSbVIIMH6/BEKye8rIhblleS2jdLPO3Xe4UlMUAFw75
	ssx0EeYZw5q8Kiw9jU6rFSlEwqqKkuh095p2MjtwqrZE4sEXYvsjtT6nI9I1lJUYzjy0CXOoMmc
	HgO7ZnYjvAqBpn9/jw8+ybadLnm0897SSIEnZB5kTyY62Pr7/Tjy79gKEOdRzhtG+oN7Nz9igbP
	6
X-Received: by 2002:a17:90b:5208:b0:37d:f206:a2ac with SMTP id
 98e67ed59e1d1-39aedf0d47amr642793a91.7.1788304349120; Tue, 01 Sep 2026
 16:12:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260829011901.325379-1-rafad900@gmail.com> <991f3432-02af-47e7-b470-b21d36d09ac5@rowland.harvard.edu>
 <CALp66yH0C0WAgUDkXArbLHgwSdrJ0hfQP2id2xhztg-d=qK1Jw@mail.gmail.com>
 <23099c10-19ea-4626-b1a0-74a64fcb0dda@rowland.harvard.edu>
 <CALp66yGtNY1e3DFdRxMjf1YDnCLrsH_bg4gpyu-A1K0mRgOt2Q@mail.gmail.com> <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
In-Reply-To: <211b5666-1777-45b6-b1dd-9e85276900b1@rowland.harvard.edu>
From: =?UTF-8?Q?Rafael_Alejandro_D=C3=ADaz_Cruz?= <rafad900@gmail.com>
Date: Tue, 1 Sep 2026 16:12:17 -0700
X-Gm-Features: AcwNN1VAxiPHHMPuQd5xCxqSUl1RRkB9p6xiPufD3mcBWcO93Hue7JIRvuc2D-4
Message-ID: <CALp66yFMQ+GTh=3iXWWMTcvDwc8e5tR0EpnmBDt=24E9Koo-wg@mail.gmail.com>
Subject: Re: [PATCH usb-next v2] USB: gadgetfs: Fix use-after-free in gadgetfs_kill_sb
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+4a5c87a01894ca37f25c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

I kept going at it and finally realized what was going on.

I added some logging statements as you suggested and
found that my 'how this bug is caused' is correct. It does
come from calling get_dev() after the error
paths, and the simple solution was to move get_dev()
right after the set_gadget_data().

As for 'why' the bug is happening, it basically comes from
the reproducer using failslab to force kmalloc() to fail inside
of usb_ep_alloc_request(). This will cause the following
error path to be taken:

dev->req = usb_ep_alloc_request (gadget->ep0, GFP_KERNEL);
if (!dev->req)         // This is true on failslab
     goto enomem;

This will then skip get_dev() and go directly to
gadgetfs_unbind() -> put_dev()
creating the unbalanced refcount.

It was tricky to understand given that it was failing only
on the N-th failslab attempt. Luckily gdb could do all the
things I needed.

I'm also happy to share that even Claude was not able to
figure this out and could only confirm this was the cause
after I pointed it out.

I'm certain of what I found and will proceed to create the
next patch with an updated message.

Please let me know if there is anything else I should add.
I'll wait for your response before sending it out.
