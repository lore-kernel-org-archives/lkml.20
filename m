Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337034;
	b=XsO+McKL0JVDO/DHgI2maTCmJWGYg1UHL163Um+9G7T7LOD+uQyjk2eZ2m4cYFNNydHQ
	 ZGn7wiGDRZmnyaLdg8yqhA4WCO95scv25j6uuSH2m7igrTMkq8Loz/mE2CyL0IL4JNl3G
	 3c5VTpCb7a51cZ2zgCUzggEd14gJ7esqBR+J4N6agcakTgTB7d2EBKfQCRJMRX4NHtwLQ
	 LIcefK19RZVHjYecvvujBf9KQLXTdAbkDiJV7JU9cwNsix4D9hLtGRy2wfa5C6sjTYPzz
	 Hhz4MnWNhdln2S7bd73VoyDvvTSy1+gFmLif/V/eRO+WRpquYsjXNr7vlMSmRKEioyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337034;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=OzqxbcG+x7aXUDzg3669N6dfsYAyM5NNc3N2uGer5k0=;
	b=f9XbXpLGmye9jki2Ve/AvCqmrzGN5l0E88kkQ4TKBMGsArI5aaeNiGohtMn1varKP+tE
	 Y6r9zgXFVd37SJipkO88d77IZFSpsc5VQMS+ib8IIN5G783jHy4IyREj08oiTO/bCb7c0
	 J1rpHjv9X8GKFqlVT9qnDBtZx3V7If4D5exQ3l4XzDSAQ7IET4x7OdDunPjfO/9soi5Eo
	 rphGmgfBZLrr5psVKcpQ5GWvDCCoUGhy0abpKVZ7+MLx/gXwouJqqYSrMQ7eZGfq9BaX0
	 6Ngue1+iQtQab4DewgpBo+UuomHeONsLp1fDRiofMIQvd7HOB8seD/kMPEwEkepbKfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6B606A327
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 18:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DF6B606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab260600easo3446194b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337033; x=1794941833;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OzqxbcG+x7aXUDzg3669N6dfsYAyM5NNc3N2uGer5k0=;
        b=SAspWWnw86Mb2JT3s67bM9EV3D/+jyWVwDWkJiVva6vIhx2u4A2M53gbj7B7sGO80r
         ueZpwXuITQJJImKSHTnSkQB/0ZVlYQq9zoBKcMc4QxXHe3iVClOKnd4m33IbFkkt9WrP
         5AFvwLmnTeWVmjnjDPvdXmcA1+lt54W+lUs77J/2qBZtrFIOKYlpIf+0m9kwLqVabA1g
         2jDz0U724CqRNL5qc6ZdXFXAiMB3qujfIZfF0JVi3Ks1l4l0fmHEXfnJzkVZkwHZ2QoB
         uV7qD5r0Y3JM1VD9mNmpEv+K6hR9PXY9c82uk3buBIWyiMAzMAUF932qYWszIdHFx1E3
         adeg==
X-Forwarded-Encrypted: i=1; AL+hErH/8/NQ48SG4jUcXRjfDDf7tNPaOQwVo80RA9uA+GzkG3rqObKM7K5iAE5iyy/JsSejnkdkqGcP4e2Xv6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qdfvp25a5/i7JDneMwSU6a3GNSnTUvdD/86ilNGh3crycRp9U
	d8+kqzExwTaVIZuTIz1B7m+2eSlxDQf8QGH2nDHv/8V1yRBw7CpharZmIsdUj8AfRDkKuRNN/sd
	3rnHuEqLn+25g18bhPe9e8YkjIl9ZUEYgP1pKwDrn1IEiqgQdnZGPfMqea/o=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0e:b0:55b:f88d:6e84 with SMTP id
 5614622812f47-5688135612fmr1701610b6e.37.1794337033616; Tue, 10 Nov 2026
 10:57:13 -0800 (PST)
Date: Tue, 10 Nov 2026 10:57:13 -0800
In-Reply-To: <CAO7_G+yqA88z54Foeps7J-aWeFG-t1LdgjTEnsLQyJJS7W=dKQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af36909.c2a1e073.10a5a1.1173.GAE@google.com>
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
