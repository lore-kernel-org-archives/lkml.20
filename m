Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC23598C17
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792096475; cv=none; b=mZPgjfsS7Bt7wc0vpwn2iaIlfJgSsB/MK4Ieefgjq8kMnuIzjL8pi2wzCRBOCtj9rK7/6SVyW4ZC70Nj/Qp2twABwZgma6+yf69VbIJmaSOEvA1It42QPTSI0qtkcwB3Fxz3AtYmmMo0E8kpTRDRoIvrtaC+a+MoazIzGNZWseM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792096475; c=relaxed/simple;
	bh=qWzTRRFlBrjKxhqo/bIT5/vkMosLcfmvltWqBsG2ARo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VXhyIUY3A9LvuUsuuZfWvsTy1nMH+HH8hCK7FzEd3Tpvmc3A8q9au5ZNR7skJtfBCB0wVyPowW2i8femN+PbJDGCLyXxov4gVfJfiqx5NctsjUc1d4mpc7tvujig1mpeU3GXfUdpNHf0JsCM6599f2qI9uBMv98WaCu03sfjLBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=wRdyCTqn; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="wRdyCTqn"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-5326cdde017so421265b6e.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 13:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792096472; x=1792701272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZVnmfGOWMEQB6LCOpiT/03uLBXyo08m720hSCcSffQ=;
        b=wRdyCTqnheLsMAiS31O6SPFMMzaOLlU40iJ+4X7qvhemaBh6pnOQvZhFKksnNuvNcS
         Y1Qhenkkn3cQ//ZfQIJYlAGjnDgj+FUKXiWHNXMzrQZI5YLIX2rLNtD/KeMwLNsu/Ip2
         qNZ/dsJeRvbvq4z5hI1M+Ps04lAdN5Xbl5Gsc71XypIA1yfcJPXRBfNUMJ/GPt26daRG
         5XMayzavh3jS+72LkVG/bGFkgqeqYFO8I7lNdexmDoQSQk1sZy+gIMZvngZH6uzf4L4E
         4TudvkjHdNbtnfaH03tsnApSdds4XVIzfL70nNzeZBRHw5WMKIac+JM9xbNu5hONS4VY
         ncvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792096472; x=1792701272;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZVnmfGOWMEQB6LCOpiT/03uLBXyo08m720hSCcSffQ=;
        b=JFqzjnBOdrdm9h67jjIeaozZ6kL25GIujl206mrtHJ35/HuwayqpZcV92WfeF7w6kG
         9kA34p+cF/DH98QeQUes3kfOuhXXxQIhn5snRacA3IxEeAYeXMxBaiyPB7jv8HcAPnwx
         Z+FFP1BsA84iPpCgRot5fPvniEzi0tARyIdDTxZziE2rdaS8yOpcvMsCUYGnowuVvKlW
         LWN7cYmEGRhFVK3z0eHFOuPO2jnL4/b149N9dnLErHmPjsxuE5qQFfjp+3L91IzX5zE2
         HDfuUHQNdivJ9cxtjG/Q4BNkNc6k+82dlC372h0i46iemEV9fU/Rny6oAiFaoyYuL9z/
         XZZg==
X-Forwarded-Encrypted: i=1; AKwUvByvip0DbyjIe/C5MQ5Amfn4mzlkKwMqmUrWtcK7d8CfAonACqVYrZiHOkv3yHEUTIlTvtdTaBGLvEobZwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFv8lIByT8d3JFYh8j/iGDFED4qQOBP1K3QAEGo8e0wPib1cSc
	biQp/wTXGTgD68sjrDOyERsh4fxMgeLVqEIZb/B585g+IQresK3X3jyOXM5oacBlisk=
X-Gm-Gg: AYBFou0rXsNq+v35Oww6mgR1OW6Hfo37b1cf+gKXUemWgD7joGdeD+n35+rdTHDuMWi
	D9WRdKQp4zH3M25Fsoc+0ZucxDceUwC7+ONFTANvaRhZwdctufmePB8aqc++VgF8xuha4kD7EZg
	b8espgXR/M8K2rhpagaolCoCOWhz5/rzyU8SFD0jzxeIEgH1YCyZqMlWdLo+YLfeNAThY/xfJZv
	ih5PKSx0+is7euSNit3S3F4OaPZdRgjugePPGX55IKuH0YM6MYYKRJhbak9pdrZXKADbkU49570
	0DEITYApdfG/jov7/BSxGbeyFDdJ0hrLVHksE496PiFA19uvS+K1HNL8b/qgDowNsOwsvYz8Anc
	G9RWP+MOhU9mY+Q3dnBIvVECufvVGeYliDTxKDNGhuy3jbNsTnLm+9MrlhPY14Yfi3ig+i9AFUO
	CSlXjGpGOk+QKfdk0gVfPLFzgsd9nNCOUgSHrSv7XCRkUZTOILgqLiHwcNGfQtAnSC2ooKq1i83
	OmdneZgCmHHKMFnbscxQm/e75h8+eqhyL+3i/kkWHukqNoo4o0qICUZuVPYU7LX/XCo
X-Received: by 2002:a05:6808:3510:b0:4c4:9f7e:92ce with SMTP id 5614622812f47-50c5464570dmr18523514b6e.38.1792096471991;
        Thu, 15 Oct 2026 13:34:31 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-537b6f5169csm350539b6e.15.2026.10.15.13.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 13:34:29 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: Ming Lei <tom.leiming@gmail.com>, 
 Paolo Bertinetti <paolobertinetti200f4@proton.me>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzbot+b48868c46e62c1c4cb2c@syzkaller.appspotmail.com, 
 syzkaller-bugs@googlegroups.com
In-Reply-To: <179010105967.8478.2344875677216734809@proton.me>
References: <179010105967.8478.2344875677216734809@proton.me>
Subject: Re: [PATCH] ublk: hold RCU read lock in ublk_try_buf_match()
Message-Id: <179209646794.1861240.13664201337469739319.b4-ty@b4>
Date: Thu, 15 Oct 2026 14:34:27 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Tue, 22 Sep 2026 18:17:43 +0000, Paolo Bertinetti wrote:
> syzbot reports a lockdep splat when I/O is dispatched to a ublk device
> with UBLK_F_SHMEM_ZC enabled:
> 
>   WARNING: suspicious RCU usage
>   lib/maple_tree.c:720 suspicious rcu_dereference_check() usage!
>   ...
>   Call Trace:
>    mas_root lib/maple_tree.c:720 [inline]
>    mas_start+0x3cc/0x640 lib/maple_tree.c:1250
>    mas_state_walk lib/maple_tree.c:3006 [inline]
>    mas_walk+0x1db/0x490 lib/maple_tree.c:4458
>    ublk_try_buf_match drivers/block/ublk_drv.c:5639 [inline]
>    ublk_init_iod+0x5d2/0x1120 drivers/block/ublk_drv.c:521
>    ublk_dispatch_req+0x97/0x9c0 drivers/block/ublk_drv.c:1776
>    tctx_task_work_run+0x73d/0xa80 io_uring/tw.c:96
> 
> [...]

Applied, thanks!

[1/1] ublk: hold RCU read lock in ublk_try_buf_match()
      commit: aaf49023041bc1f887a028a164d3bac714b65508

Best regards,
-- 
Jens Axboe



