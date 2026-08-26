Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73D35F19D
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787990; cv=none; b=UE7YtjAiG6+4rnutF+dS+fzugCKUdYcq8YfNiZTG9+01WDCRk6cDKf06Pa/42PKWcMKKP6t2KPxiTdlZWpTP+yfE6jZpxFwm6KeHd4UWbQxOPSm/3cd0sVft6/bkrcOJnrkVNQl0YxRT069sJ2NJeb39RHuT7h91ZjcRqEdY+q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787990; c=relaxed/simple;
	bh=xSdC/3ShSAYsVfw96/BvYeB4RlDyw1AjR9qjW5O1EB0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=EEoEooxCLrkk54b5cL7u48FYuapoa6YyoboYKHrbod9CHnUv9okpMDkoiGJlKTpmjJ1iavv9zP1NNU+tlXzuQMyjnCGiTcXUMdSGQHkHMz2Wx2zBr4R+MId4MT2CXF/qCwxQgVSeI4a0FTa77umfCWk0s6N+DxI3pyScfXxvE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4dd46ddeso1383581b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787988; x=1788392788;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KKiFxCJY25C0ZiQxPbplW8xA8xIWkE7L5otQhxFdhOE=;
        b=My2/CvFRbifPF9w19LAthuv7zgeBsLY/7BRYb/zV/17zgIiUjtZd8ThDxktHpuJFQN
         12nhktSrfSaL3BX2xexZ3JbuPpNyce0Q1GmWtogCvbpjyxhud3uh+sE9wh5yuWNrcsFo
         bLT8JznBfaps9zDev04zWU0mc0yEXyNegA20tgbAcOB177j2UqbZF7J9TcvCX9lz2xTR
         vpzP1SQ+S314KetS8NrWGs8OfZgbx8CVT8WG6/6gY0y007bI3Q8qU4G9HrN97B8E7uT0
         aLjl9IyL118GXzvk0tumAzVOKi/9a08MVwkuUal9Sc5fUl0RVmoOnSebREyiePKYxYJZ
         n9uA==
X-Forwarded-Encrypted: i=1; AHgh+RoTAUzNmo2zc52YyKaBI2BfWr55eaIchsCwpvrHCg51OO/J4b0YgJJQVhukjooAqMjivcUabPjpr1EKspM=@vger.kernel.org
X-Gm-Message-State: AFuF++nXoKeFWQtA+9I44NbYXHMs0xRjr791+KAk1HO/WYz4v6NEzxtF
	YnVth/rR5cMWxVMXjj7h0XRUA3+crxVmCwIlO1eBn+BJP7vCyJaPkrmT4spTh1Yv2Gvrn9gJz4A
	+OK9Zz+hvQsb7fF6iWwehb+i0geKvwy5VqXH7/BbrrmBBaKz4DwUkwPsmmE8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3088:b0:4b2:b4d3:f919 with SMTP id
 5614622812f47-4b366b198b9mr12226723b6e.14.1787787988338; Wed, 26 Aug 2026
 16:46:28 -0700 (PDT)
Date: Wed, 26 Aug 2026 16:46:28 -0700
In-Reply-To: <20260826234610.1637-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f7ad4.1d9ded08.62e62.00bc.GAE@google.com>
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
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 25d77d4a1061..763f79806bd8 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -606,7 +606,8 @@ static void stub_recv_cmd_submit(struct
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
