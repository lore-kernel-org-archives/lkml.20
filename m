Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E61CAA6C
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789208; cv=none; b=g3jUolx86Itk3YLHQotXTENykP2Vol7coQY4lt3aRTZV8x4G91r9ZuS2YX+VvHvyRsCBstYlNEWdzmj47+pa8KnZyKBwZWFARsf4hgZX93tVGfh+uuTZLYG5Lx1M/PFdE3n+HldKCR1ww6GiPZR4XL39cXKm0Lr3rMhhFvCHDEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789208; c=relaxed/simple;
	bh=rAOi7Wc+Nz0MugYWy9Ltkksbv7W6WoMs/0UNWhtUnVQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=u8mFo6vPiVIxTjJxBSDCOIDOmVdNSx80P1VckwHrPFVwozipyyImq405tqvAbylERMd/b8/WHulv9OrSjDNhZqY1Rp04z+0e5RI9JAznB+XxLClgRnCrxTBPA4FjB+29G6+8QiBcfmZZnlbo/R76FCvZuzBkRw3RBgTD56eTXfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b2d1eb484aso3507724b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789205; x=1788394005;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+BNWgCHoBOcFY7vRXB4cjOtsuyEMPFV3Akh3GJ9mk5g=;
        b=fYU0TD2/441s8uB3l3BD9Bje309nZMQgCgli803IvaD6q4CHNHVb5JqzjPy5MoXQx9
         P5ZM3p1LznJNkeAEXuM0rlyDim1NU5U+XZXa6lCLk28qtQBWy5NgV8qBr8Nb2t74y71j
         Lwi/WDztUtOlZrFu4BZCJJjr9AIZ4JrwcFv9gt28gcDNqqqfpWYy4l76q31GamFRAnDm
         ObfQLk778B8czSstOx+YlYjV0nqnxR2II/JsHf43gI2WmsvQNOCR3DseN+ezz5qsLw9X
         jBHjFifPOCizJFt4dEbkqC1WIPfPwbMSh9QLy20/ptx8xMusATG4qCE3tTxif0Ym+cLK
         9COg==
X-Forwarded-Encrypted: i=1; AHgh+RpTr+/Ggd5KgXUKzo87VitRZfXZN0lDl9I52pTxplFpzauhX/HJAYCihgmyIwZvOmqIDNERQ8TblQnmZqw=@vger.kernel.org
X-Gm-Message-State: AFuF++nrxcnAt3V7dhEEOMgm+MimAwQP6pYzAp1GzGdgdAQooz16PBwo
	51XTNR3i90Gc12lFdooWS/IH+HfrlTFtwtSMepQkmRyYrVfsqoO1AshPf3sUr6i4mcF27y1dypp
	FTkPlOhRw9ZgKAiEunq9iXm4l4ZX3o2ltKAy3NKvIGk7e8UGhcIh4VeGKH0E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2224:b0:4b2:8ea1:b9dc with SMTP id
 5614622812f47-4b36690616cmr13488163b6e.3.1787789205590; Wed, 26 Aug 2026
 17:06:45 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:06:45 -0700
In-Reply-To: <20260827000625.1685-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f7f95.27659fcc.2ceef7.0009.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in stub_rx_loop
From: syzbot <syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com>
To: hdanton@sina.com
Cc: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

>> Date: Wed, 26 Aug 2026 09:49:36 -0700	[thread overview]
>> syzbot has found a reproducer for the following issue on:
>> 
>> HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> console output: https://syzkaller.appspot.com/x/log.txt?x=151ce979580000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
>> dashboard link: https://syzkaller.appspot.com/bug?extid=06fa667a0931a3430026
>> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
>> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13a28d49580000
>
> #syz test

"" does not look like a valid git branch or commit.

>
> ---
>  drivers/usb/usbip/stub_rx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae57..26233ca 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -606,7 +606,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>  		return;
>  
>  	/* urb is now ready to submit */
> -	for (i = 0; i < priv->num_urbs; i++) {
> +	num_urbs = priv->num_urbs;
> +	for (i = 0; i < num_urbs; i++) {
>  		if (!is_tweaked) {
>  			ret = usb_submit_urb(priv->urbs[i], GFP_KERNEL);
>  
> --
