Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279525;
	b=1h2EWLQ/KaNNr3EZXVUhWYGwH1KwcOoEv/vmx3QdgwxLbrTMLhKNsYaV+U+UMWcqrlAr
	 BC824dca/INm0KPMyoRvY91jXaAPxHYNaUSUhV1hY3q8it4AOgsyeZsEH0lA4n/2xPUCw
	 c1MaU/grKKW31SWGnBGbVgv5y9IviUySqa4LI0pKHSgJqykGrzR9KaKiRbaHVqQt/pRdL
	 h74zCcmZdpeZfFt342WZMCXl7VeYqoQowqguOwam06epUusdwfuwG8dYj93TLCGfeC+pV
	 eU+WOCjRu04dRXspNfORQiOAZj1P9Etn1MyyeW+AfprghvTV1ZP77Ol/Pxn//F+q+Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279525;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=OzqxbcG+x7aXUDzg3669N6dfsYAyM5NNc3N2uGer5k0=;
	b=B91C3VDyWXtcZTeloEX1SLEFLCEtxQR5dpbWo8bECI+zBzB7M1ql4cI2C5p63otQ6t2k
	 4baXHH5Dl+RSyZXNHabiV0ys/M4Dk1slE9q6Nt9FSDC1EFgm2efcOrIV5174us2JiZMgJ
	 92nmu0oANBGq/lOZBIou2sWWmiHNLfiUqUVlfQuTnGt6INogBzsv5ycZQ76HAQ1XN0soW
	 DLrzLhYgdcpuGipWZ54Y137Tb+u3ElsikBHxhr8uFK2CAmkgaJrmL41EiFqBtoF/VS0Y4
	 5qjRjyHgV3tmb7YCbIdj7DExMNSZabhzkLGqlkCCHvfAEmNibvsjZm81b21laNxR5/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6723606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:58:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6723606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-448d51840c4so1170278fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:58:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279523; x=1794884323;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OzqxbcG+x7aXUDzg3669N6dfsYAyM5NNc3N2uGer5k0=;
        b=kO3Ts56wmlqCRsrQOjYQSN36I8OZIX9lE9c3YaTgvm83z+jB0Vk3rjoyho8k1r8bSD
         MQ2SKRS1aYR0jI6eH009p1pQuV2ZV6sipaHHwizUoD0BvMNAMj8rHv9BhwRr/lDNzLOB
         AnkwYZgs/RNEEu3cSYSF5YcIWeZYVcnfoLBlNaYkewfuMzovZkQ3SkkADFDjnvzTOLyw
         zoen1vcir7ya4dj5ZW+FRm7SCP+WGFmEPKSnucE4ZjB3J/EWj+EQ13A3DrWIfiOeg3zV
         eFKcOw8NBAB1odWNJ3D2xvyxDJV8oU1tgfMrA5Gw1rYdhJ7lU/gRBYjXhkKvUm39zIuG
         7HWg==
X-Forwarded-Encrypted: i=1; AL+hErEIA+BKeldF4aAGuj9DJ1wdKQM5V0+B70YUTnKXx3QWEl8b0e7FpLORrOGfM6/jCm4MMEeSjAHaCX+21GY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2kGzwWWCh0kk8u/MHUkqijvxNGn+gVl32P3r1wjSp46j+VkDb
	1sV3mDtFPJF65oTH73Fc3bf9s7nelai5Wgc5cbL3Hy8uUDArQ+w3MEpQ9MTAz39rMxu//IvI9AQ
	eB4CMZQ0ygn8dzJCg3TpWA/q0OkZ5+zpt30/jomsUIcC28NUxXOavXPsran8=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:ec2:b0:53e:8376:dfbf with SMTP id
 5614622812f47-5683ca7a23amr906215b6e.40.1794279523676; Mon, 09 Nov 2026
 18:58:43 -0800 (PST)
Date: Mon, 09 Nov 2026 18:58:43 -0800
In-Reply-To: <CAO7_G+wxtrdZTJu-LY-GvLhE7fih1+6LXFvVH8rfc2UE6Hikbg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af28863.59116549.28338.000d.GAE@google.com>
Subject: Re: [syzbot] [dm?] WARNING in raid_resume
From: syzbot <syzbot+8b22a0459202f76b4096@syzkaller.appspotmail.com>
To: nenkov2004@gmail.com
Cc: nenkov2004@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

This crash does not have a reproducer. I cannot test it.

> master
>
> diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
> --- a/drivers/md/raid10.c
> +++ b/drivers/md/raid10.c
> @@ -4490,7 +4490,6 @@ static int raid10_start_reshape(struct mddev *mddev)
>  	return 0;
>
>  abort:
> -	mddev->recovery = 0;
>  	spin_lock_irq(&conf->device_lock);
>  	conf->geo = conf->prev;
>  	mddev->raid_disks = conf->geo.raid_disks;
