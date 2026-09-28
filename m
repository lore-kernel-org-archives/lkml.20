Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E9A4DA9BA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 14:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790605122; cv=none; b=Po38U9aJEH3AyfNJM7LPygcBd6p7sSU7Fl1Qj8TEzpNXxMvdJmUWgr1QupceEAeYxXEXhK6auO8E1zGfJ7s6nDGksM87Aw8kl8aNRPbDf1PWeZYOMv0JjVhHq+x8TQZsAHBkH7IunfMbaKXldRZp9ROfkpm4CEegUE1tiLkSD7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790605122; c=relaxed/simple;
	bh=1A+5V7e23mda/eAopJEF4cs/niWxqUCVK8QHn1leIPU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=sWcMXoamhZrPieRYZ7kzC3RQl9ZajP8naznEq3LYfWdRfZsjYqpfl17tsJatcjz8reMMO5ha85Nw+WIktdSrB9jdanTTl2HPLUHqOEHqSX/h4vFcEJbfvmQnpInSCoOmLil1+yxoa46jnnSPODHcxYZJGczYyVregrBdn72jbK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4566537e644so5011223fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790605120; x=1791209920;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=CTA18ieht6JE11VVsrnCtt0UiEdZAg/1E0wJcGsrEvY=;
        b=OdDmde+9xH1/PQbdkoy72Dwmmxai6GcHGElKA7h2YunNxNjObQFEJtowEo8LGs5G71
         u0aKRZ0TeQWsgQ4pa2CWf2vztNSCyq0h/PiDFcMuJhazwF+CX20XEBAKDr9HrB/uFfK2
         gxXG0w0eGPXVA+H4Kl5qaUBBC1OfAKBWxnPcoZWa3dux7qf053SJg6G09GIgMAP+0CWA
         PlhqpzURdCfk9IktYHrk1fRm2t1FDkS5ofBZPr+VcGlndUiAWk46NZvxtMeSMzQ/zdO2
         hN+4dMnM9zNtKU/EYSeg4BqMSJo4Bx4CaV8HI5lKsbpJPNtxuDQLI5M5t2qXNtMlvv4A
         F+sA==
X-Forwarded-Encrypted: i=1; AKwUvBzgOXFKhXJCtJwIxyg+0oBR1RJeT2RhC2B7AomIo06/Zh/BGaNlSxbdRPbn9Q6m1B50Qh74PtCtJ466C3I=@vger.kernel.org
X-Gm-Message-State: AFuF++lwp0r0i4MGSufljnILT84ptaX1jxByBCr9uG6AvyRd8eNjEF45
	F/gFzs9aI986Cqa1kNwz3D6CntTwIXt04CW8hnCPcg+eyGMDqZ7hrhfoTwpgRyki1LzCirgchsz
	6CC/P3ZizlqTKS/9mGyiGl8jfxzKd4WAs4gkZk8NL3Dbkw0toIEC4ERyGwrg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c229:b0:4b9:a829:f018 with SMTP id
 5614622812f47-4d72e164b4fmr12787625b6e.36.1790605119815; Mon, 28 Sep 2026
 07:18:39 -0700 (PDT)
Date: Mon, 28 Sep 2026 07:18:39 -0700
In-Reply-To: <20260928141824.11910-1-nsvatoslav515@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aba773f.80e1c6cc.1e8e5f.0072.GAE@google.com>
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
