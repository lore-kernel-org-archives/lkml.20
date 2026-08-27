Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A32E2F83B5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787789899; cv=none; b=U9IFvV14MEM0svZ+DEPvyPYjxDlFQb3m90sn2fxVcpDuzs+YeXBkH8HE80s4zQpzWpsA3o11DeCANC9ZqZ03WM+eu8OlFQDKVUeiH9exwa5wj58vrwYfrKpWZpiRQmSmTKz32kEzl0APJsN+FeZN1TO2W96WxUNDTMo3ViRzl1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787789899; c=relaxed/simple;
	bh=Ze5sqLyqZa5nuC+FOf0pUq+cJE5u2TWrX/+MYdpIAEI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=QYpOafzyKl/JozHRC8C1yH+vijNWnrvarUcqRUVbYrR+QOLcgkCM0YimpaY4U/qFE5eWZe/iuQE7N0yrrBMZMwHK1H9ZM055R6V43IUHB/zT5BqD/qGRpXP8WE2kFqDBuLXcH41zrhLtiZ3YLghiDs8IVI8ELEWhOonQYy3/xgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4afa222912eso1418380b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787789897; x=1788394697;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vcQrjvETQgHXGxumc6O4Qs5M3ZcbI0gkeF7prA5ArhI=;
        b=df/t0Nl1R0b73PrHVcQOAxbvbDqV3n7/IvLCfF+YdOzGSNTPQXpYW7pvx+xr4irjRY
         JghFvxErvXkOmVBZBJAEixRQGx4t2PH/iAYyak9WRfQQOCoSdPPPr06JohKD9keTQglL
         q0I0Qv7WDfxtpDemDDyFnrBOFDi+vd2KYmeVT04AITA2XXZU0cY+h0pvbWY/xcbBiEDP
         p8mSn4pJpk5tedicC4RMBAk4GdTyN0iVNPRQvQTfx7uzzv67lBHMPHnpld10dXdjRxr9
         cprALH6icDZD7WuydPB+23WiM/UQP4oXP85OySweLiQeExJlBK4zJgbEzfVo71MldZ94
         3aNA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5S0jycHaUiVCz/9twSxxgh0IXqTiKz0nQ58+iQ/6A8oBhM3SGRomrsyxuP2J6Y7i1a09GrogMn+MX/qE=@vger.kernel.org
X-Gm-Message-State: AFuF++n2oJQKctMWsC6hABd4wh/MRSrA0MafWzZdjqdVYfUfu8U5gzxo
	wQ/f7sgJZfd9TILoNLXOr0eUVBgHjKKu5RqEPwMDXHcYvX/p4xLSdqNVQNqnZfcZcteAa9S9uRg
	czL3IC/oHCOeF4SHUpCWwsPKtcUHq+fK6Ipn6bMJ3XxrrIY0k7YrGCzTE7xY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1797:b0:496:3a1:e44f with SMTP id
 5614622812f47-4b366942a0emr10150632b6e.6.1787789897222; Wed, 26 Aug 2026
 17:18:17 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:18:17 -0700
In-Reply-To: <20260827001800.1711-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f8249.50659fcc.60cd.000b.GAE@google.com>
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
> syzbot reported a uaf in stub_rx_loop(), so see if it happened after the
> complete callback.
>
> Reported-by: syzbot+06fa667a0931a3430026@syzkaller.appspotmail.com
> Signed-off-by: Hillf Danton <hdanton@sina.com>
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
