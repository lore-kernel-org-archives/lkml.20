Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8503A1E96
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790604037; cv=none; b=l0fz1mTxUh6PWAlRnUgJv6RPFT5dJMwuowzCTfSPOHviS6FMUPpxFEkGmh3aampl03vfKpcyPI29ueOkSs3j9lb5yfVMq9VzQ6f8V/eWFQ5x1l6+XAb4hyqkpaPXlNt8iJmVP7GjZ60eNtXNNQjgd85zeLbzbQcQxeveH7zRmMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790604037; c=relaxed/simple;
	bh=ybRDgFtM9CTbY2lvgu6PS3LR5YnuBwjjGJWy5QWCk54=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=NVdMW8kr7rSGmO/XrJQAXiP0BAG2RFOVb5NL0O9mq9moeNOqFdRFg7kHQuRusMnrTh1s1+bi1NKyVCoI495a2phrcTrtZDJE73XNu6GqplY4kJaZJOgY3VC71I5yWat2gWgt/HQtDb5h0CRBBreEPSD1bIoIJmVyZJM0mIxqGZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso5068085b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:00:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790604035; x=1791208835;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7vAPS3D5j22fRhnQByC7LFpzgx00aeBjqnqM96UQQYY=;
        b=dQ5TB8xbeSCLMVowvbwgrqHEuWSlujSV9IVvJ8TD2BBid8lr27wDKe1Vdi87svW8x0
         M0/rPqvG/yOhyVammxTPSUoLYuJ7R/jSWEykXG/4JyoBHIBx+F0VG+TTBjqmfUA3H6VA
         BuNxdHowcnT47kcGfoBi9YaAfDQ8/mQuaDYJ+3EIeFAQr/G9o7dJnvZ+8JowLl64WhOy
         TVF3yMPyPPO7z2q9/2UI/hDb3pjLnNk+wQv6Wbxjq9rcuPviQqPfx1X/nNzrb2oE0W+e
         b/Sjdhp6225zlnDDDhJmGyolOqYlSI1JDqRT/UrCx8CX6Hvr8wCfYa7caWmy/H0M7B+M
         lV/g==
X-Forwarded-Encrypted: i=1; AKwUvBwEBXeHZLwqFbY4x3RAfMN2iazv8LiKNd4Qi6NL4Jkpwu/A24YF5RuMMjRyvh+lnGRqF42Lb9HTYiUpBVA=@vger.kernel.org
X-Gm-Message-State: AFuF++mkVJtediSTN6YPj+6lZnuhIE6q/8YjUDWiJ2p73s5XhSENFuYx
	+mHvavXPecbMbHgmHjLrLDnMxc8dHCG9sr8aq0/RYApBRvIy7QZj5ClhP7jRe/Rizg+iLFHv+Sf
	qClYLK3EOgpESrQkOe5Z2GGU9sQ0HiIsLjlNIrRYGtULyW0cpxQvxwaYi0K4=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:508d:b0:4b9:a829:f00f with SMTP id
 5614622812f47-4d72ca3b377mr15001312b6e.27.1790604034732; Mon, 28 Sep 2026
 07:00:34 -0700 (PDT)
Date: Mon, 28 Sep 2026 07:00:34 -0700
In-Reply-To: <20260928140010.10270-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba7302.e548f532.1ca396.0048.GAE@google.com>
Subject: Re: [PATCH] Testing for a forgotten lock...
From: syzbot <syzbot+34f63c11dab47d09ad9a@syzkaller.appspotmail.com>
To: nsvatoslav515@gmail.com
Cc: nsvatoslav515@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

This crash does not have a reproducer. I cannot test it.

>
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
>  drivers/memstick/host/rtsx_usb_ms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/memstick/host/rtsx_usb_ms.c b/drivers/memstick/host/rtsx_usb_ms.c
> index beadc389f15f..98143e13b6a0 100644
> --- a/drivers/memstick/host/rtsx_usb_ms.c
> +++ b/drivers/memstick/host/rtsx_usb_ms.c
> @@ -517,7 +517,10 @@ static void rtsx_usb_ms_handle_req(struct work_struct *work)
>  	if (!host->req) {
>  		pm_runtime_get_sync(ms_dev(host));
>  		do {
> +			mutex_lock(&msh->lock);
>  			rc = memstick_next_req(msh, &host->req);
> +			mutex_unlock(&msh->lock);
> +
>  			dev_dbg(ms_dev(host), "next req %d\n", rc);
>  
>  			if (!rc) {
> -- 
> 2.47.3
>
