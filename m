Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF883B05A2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680629; cv=none; b=PHqw/Y78PWGl5N72fgwPbyfDRTvie3SQi53rpNNWtM9QzZRpGYy0p+sLSljBM1coNeRMwtxGy5BahCZXsGlFQmnDaJHf5TlGlEvzywunIJnW7Q6MRlJ5H3a5jJRAvNRHHlEkptxURt3KvAR0wDOSUUHWrETSraDNN3p3qdE6D9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680629; c=relaxed/simple;
	bh=1A+5V7e23mda/eAopJEF4cs/niWxqUCVK8QHn1leIPU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=Mgb+rTql3WbXkwvQ0kmg6HnUPP+3uiO2utpUqzEqlUYAfFhG3cpr1vqRv1856zhjtxY3hGYEBXQnD0LKEjMZ12AgyCSnwkHmLeGrJFpFzKoCZNyoDd67CFsV4kANRaGcuTwLL2iSlGm72UwgvTiNU6DEChyQuO8asrMr/8NB88M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4cc89e86e4dso6354297b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:17:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790680627; x=1791285427;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CTA18ieht6JE11VVsrnCtt0UiEdZAg/1E0wJcGsrEvY=;
        b=zYRhje1U4dw1KBypyOpV3A3vmjjZMvH0LRYtd5688fPl73QLVjj4Rs5UjqWYRU88EE
         xWcDGPpIu2jbtOVGF8yf7ORZbOQ6j9wNOe1b0SkjVorMCkRaC70/1DHvqhv2ShNrky3N
         wsnLrGLfGK4bWNp2Y2jHt066MlVzHj+Z4f5YdAW0yVxqxPES9baa+HIkNuN0PFzQwg1N
         2fpI3/x/xkqLlaK3COWZCCYtrN883yIv37Q+LEGZVxhyYt0nnaZGOCFQ+qYvD+n6x3CO
         raZsJq2gM/MLqbGHx0uxvRrbkxUaOJn+0PsZlqSAFnZAyhwMs/Ko0UCtJv2GJJMnWzQx
         su/g==
X-Forwarded-Encrypted: i=1; AKwUvBysa0azJc5h8IfHwzL443OnndEInfw+SUSiDqU7aArvU6A1Ft6oLw6kD/O2eeFfK9Dz98Q5PuxOS+YbsyI=@vger.kernel.org
X-Gm-Message-State: AFuF++mgGwXhWofcojSD0iNcOi/J7jwE4/3ctcceGb7uemQjL7Oe1zg4
	7SY1Ilk4RLmPMgB9U6mosMVE1CHjMYhvteP1nO+6fV0RYA/KF7F+XTfhktZpmJIBwvoJ5F3sWr1
	TG7gd1oeRZax/edCmcqWH2jdQTxuhfy3wnqJ3A4TUWUy1LjhwcT1bplq/1CM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2381:b0:4ea:18f:64b0 with SMTP id
 5614622812f47-4ea018f67a9mr6541098b6e.67.1790680627356; Tue, 29 Sep 2026
 04:17:07 -0700 (PDT)
Date: Tue, 29 Sep 2026 04:17:07 -0700
In-Reply-To: <20260929111645.1954-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb9e33.c6a7fab7.e5ea7.045f.GAE@google.com>
Subject: Re: [PATCH] Testing for a forgotten lock...
From: syzbot <syzbot+34f63c11dab47d09ad9a@syzkaller.appspotmail.com>
To: nsvatoslav515@gmail.com
Cc: nsvatoslav515@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git d58dffe9ee2c

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
