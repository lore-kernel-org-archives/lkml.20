Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D412F6577
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790066; cv=none; b=j5YqEEN8oUv+XP/J/a9k4o5+/eLI/8GYxLIZ6VF1ZjXgwxhRXSKsLFXmI/K2MDuyNizhz8Zbj2MhnZfM44lSXM+oyyz04jBQ/BFRTnJcCwVl/waJC1fJLqgi6Dr42Gi603mvK838z1lFdkvjqw3YP+AP9lbz5Vj+7wnJ/aaCG4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790066; c=relaxed/simple;
	bh=a/ZYnRvelZOicFuhK2qt6l2n4Isc5Sgk3rEHGzFNDws=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=BuaugLN+legSWX+oP1o7ikyqjU6KoQp0OABG7qzAz7UooUSg/QwViJGpCZHX0h472UDjTTRepbwUzfkJGy4deHlQ5viHFClBEuFBUwgHIsigla3bRqbgqNPWWwkWTZT5vnXvtUROhcVI8kaerJrppOh5tiNnndvX4UQLTuV/5Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7e7624e584dso3351506a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787790064; x=1788394864;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hp+RkHjiO5ea0uS/RoVigxdSk5Qzvbpiq6tX0tszkf4=;
        b=O7zjd3YCTI0FaNo0xV/MLkv27AvbyYvd67kv+9nphB7GDaWcMqa+BlFhfKIqRJHd5Y
         vb1bIrlCmE0xEb1QbFj6dJEnO/++iSlHuWIyGvpCOqr1RAWCi66vpXc/AoM9IAuOecP/
         Nw2lNpOxKumL8o8nK/lDoOjExlopzv0MQXcBtCY307+0gXNdA1H1LYhKRgp06/a47iv0
         NIfZhJr6ffL69Q6JtBH2rbi4WbHFWFYe9XAEdf5XgitpepRNiSKT+PfnQZfC043EcTc7
         f6uj4bcIGBN3KMwH7ZvNkZsWdOckgphLH9knZeQ2q4od3AEM8vZEhbpgC8MI192vLvv/
         jocw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4sqhb53Ghhn+H3Twi3hPU2Cm70Yd8h9BG46VEs07x8b2jKVmr/lPyk2GBJW/uTsQMlWTgrtGfDtcid3E=@vger.kernel.org
X-Gm-Message-State: AFuF++mabvFuJwpVUHDnbV/Om5I5FheHaFe1w0dwtVbKWG1yJkC29L/q
	/BLZKCchKSCDvUTUAoWDWIDCpombD50M9fMJUK/FIx6IP1pZzn3UQRs5QER1rcfkhVsV7yk5+Pm
	ACf9AjU06SCSM7dEgbLweE8to5hmPvD0b5KKp2PaR2srnJAPcXB6NgVEXWfE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d05:b0:6b1:2984:8e5f with SMTP id
 006d021491bc7-6b1a0224ffemr11005012eaf.0.1787790064420; Wed, 26 Aug 2026
 17:21:04 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:21:04 -0700
In-Reply-To: <20260827002046.1728-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f82f0.1d9ded08.62e62.00bd.GAE@google.com>
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
> #syz test upstream

I've failed to parse your command.
Did you perhaps forget to provide the branch name, or added an extra ':'?
Please use one of the two supported formats:
1. #syz test
2. #syz test: repo branch-or-commit-hash
Note the lack of ':' in option 1.

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
