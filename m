Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287094D7D5A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 09:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790846817; cv=none; b=GjGPdbebrZo2WuuhAVdN/9Tu9cA2F+twPFz+IBSWrrYMHuytrLT99IvCSNVmMYdKDMMswmbqHa4hzkIrXY2oz/zWtZrCwedmV5g1m6ZaBMwCzsDalZFTTJywW9fQkSIOWeIsOnlx4ZBvYMJkpoTOMqhyT17fBMRY8S2gG7jRKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790846817; c=relaxed/simple;
	bh=9+09TMmkqPd8XV+CQZAUSYrFzRyU+gP5BOnYyuehyb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WdkjpcLEWZlD361oxjZ6mS+DLYMAX/laC3ySDXvLpZE6ImWq4MglEuwSDppgBRv3y8tBtIxo4YgKh3k3vkpMOWSKBkrH6846eyJIyMo4RjvlobT9okD0UoVIr8s/gCXXzAboFR7mAqCPIAkkTOAxEJhRl8iixaoJ4Pfxcvm0OGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itRpMD1h; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itRpMD1h"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-81bea216172so3060712a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 02:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790846811; x=1791451611; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vh2jiIbia6eRFOfHm82FIh8xzcPZydWxSZdH0BHLn+Y=;
        b=itRpMD1hY/YafuayfbwqexJD16qIo1YYCMyxJZiYEXQ/r36w0T7yyW0Bpq3t0rM2bd
         6b09BnW9IsG4XGJcrngz1iB4R2+lgw1U1ASaHZt2bMxi6ch/296ShirJKdw5VgvJuFmR
         23XDvpPKeQFrosIlHtsR3KVIGUjkGIW0Su/QsvX8mgOKJhoB4u6P/RNoJ+wO94DWMOv+
         y85GE+OZIqaStAKYoaPGuzRCABpNm2QaFESsvn19HPPa4GqcxPUqhZyUPulDjLiGh/wR
         4FCR+WWgcF8aYC67x5DkcXvoX13Ry/zSoOZcHt2Pv/aj3SycJcvLcikTNL3AyOYUOc71
         MT2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790846811; x=1791451611;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vh2jiIbia6eRFOfHm82FIh8xzcPZydWxSZdH0BHLn+Y=;
        b=TgTfseOLIgGSaJ0hi375KdejoVEbqsCs4/nF/ythWFfFVFX+Tfjhdsr0afQVETSjZz
         yftdbP0QJp31hfLHfJ94VWKByWeeEVFrftBuFNCtJaUSIs4ciydMdLbez/89s5fzExy5
         ohJi0ZXlOrjZ4xUH0eMKcY7I/rd4WQNo/9J7f4ZD4lEBM93SMtys1FYXa31Rnx2f62g7
         jGp7MiazAFwpCLsxEUYykOOwolYTr3f9oH33gsa/5+O8NzaM7hQ4TuVFNM9zmtnm3Xjq
         w3Un6rsCeGAOUL/pKtjNf6wJP894sxby2qNKwYj8sGXuLp4ECnySnfgRRCAe0zLseTzv
         cDSQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC01+7zhx5reZsC8NsbA6BnOWbrkG+aM1x4iUQVv1NpKFIQ4GmeCmUXAEdfVZPz3Jitri4yXtAQYk0H5U=@vger.kernel.org
X-Gm-Message-State: AFuF++k+B0sPkscrKesSUpAQS7QDV3308AU8HDWpa22ABDnl0Z8kP+I7
	Epki0ZxCecmh8brezEyS/l58OWz9bdKIAKMO0VNXQhUwU79N3qJ1uY7P
X-Gm-Gg: AYBFou0zRdWEycjvDs6IoztKECTTOwFWeyYKMHfQiXAzVsyhdJbkrk9KlxeapH+WIoY
	JHN2SB5On8v4UlhekyfKGirc1taPWiUgOxpWVjhxcPz118OKtdyd2uHMdnFwhILennZNiHzYrSB
	nhfeWKodpnCMuRJ+j0hZ61SX4c9/j6GpL9/+midwSr9hrDYRcjMrlGKkqe457IDp6rBp8i1ogIL
	G6Bhjor8e2SJeOwYogr61pqqtLybtdtar+AGJgwLrStZaPrIdfTmeXAnHIgnu5tNcDuJeX8akIo
	gbJARGdexnlZKN/usopFhDu56BrtKWYWSTrOH9gswRlQTmeZ1SzUS8uiBCX8PBbvBGzrWF5/+iV
	nQIRJWPj1PE2LpUkB0b/nWGcV2Pvr25KP81POz77GNVWAs8+XevlpVi4Qgr4b9Pv3SPONu+kRKS
	HRda/EfBLSi6wIDS2/rFIB3v/4wOaTb806nAAegCcol2H/gRyDCCTV3aAqqpg6XftbnyG/B+TSq
	5/S4ssobC2p4qCRrQkdVb0N3yK+mM8E+ql2lKmV8Jg9JheYXOucnDfa4ziH/Xdn4T6icCQAK+vb
	Kl0=
X-Received: by 2002:a05:6830:d15:b0:81f:8f5f:f1dc with SMTP id 46e09a7af769-820491154f2mr4634046a34.8.1790846811279;
        Thu, 01 Oct 2026 02:26:51 -0700 (PDT)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8212a413937sm2252075a34.8.2026.10.01.02.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:26:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:26:43 -0500
From: Ming Lei <tom.leiming@gmail.com>
To: Qiliang Yuan <odys.yuan@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: don't use an I/O scheduler by default
Message-ID: <ar4nU5bVWKdBZXsB@fedora-laptop>
References: <20261001-bug-ublk-no-sched-by-default-v1-1-0bc91b6f075e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-bug-ublk-no-sched-by-default-v1-1-0bc91b6f075e@gmail.com>

On Thu, Oct 01, 2026 at 11:10:40AM +0800, Qiliang Yuan wrote:
> Requests of a ublk device are handed to the ublk server through
> io_uring, and the server does its own queueing and ordering, so an I/O
> scheduler in front of the device only adds overhead. A single-queue
> ublk device still gets mq-deadline by default, which costs throughput
> on every I/O and an elevator setup on every START_DEV.
> 
> Set BLK_MQ_F_NO_SCHED_BY_DEFAULT so that add_disk() selects "none", as
> loop does since commit 2112f5c1330a ("loop: Select I/O scheduler 'none'
> from inside add_disk()"). Doing it in the kernel also avoids switching
> the scheduler from user space after the device has been added, which
> waits for RCU grace periods. A scheduler can still be selected through
> sysfs. Zoned ublk devices don't need mq-deadline either, zone write
> plugging serializes writes per zone in the block layer since
> commit fde02699c242 ("block: mq-deadline: Remove support for zone write
> locking").
> 
> ublk null target, single-queue devices with depth 16, fio io_uring 4k
> randread at iodepth=16, 16 vCPU KVM guest:
> 
>                                  mq-deadline       none
>   1 device                          111K IOPS   342K IOPS
>   4 devices                         286K IOPS  1070K IOPS
>   START_DEV p50 (1000 devices)        8.53ms      0.36ms
> 
> Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>

Default none does make sense:

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

> ---
> Zoned ublk devices were not tested at runtime: none of the ublk servers
> at hand (ublksrv, the kublk selftest server) serves zoned I/O.

rublk supports zoned:

`cargo install rublk` or https://github.com/ublk-org/rublk


Thanks,
Ming
