Received: from va-2-55.ptr.blmpb.com (va-2-55.ptr.blmpb.com [209.127.231.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B7C37BE64
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792303049; cv=none; b=sUIIQwf+Fp0Pz7u1b/loNkpJXa4lYe5wNQLCCem6JUFChRk2BOtHnHXTP/UX1FMsTqf8rp3cx4gBYz+7/JMI0wQGHLLTzLBYfJOngfOy0sTRlfU14TUIX0cjaqAkpd4juzUcS+NeEoLFD+l1bq4I2EtrJVN+XeH/Mz5CngHXCUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792303049; c=relaxed/simple;
	bh=goqEBU/3PR4aWWXtr1HXI+1I7UX5mf/orgIJFMWeXMw=;
	h=From:Subject:Date:In-Reply-To:Message-Id:Mime-Version:
	 Content-Type:References:To:Cc; b=glEkKrqvsmaCH9mPfpKkin6GVnEXGKfmLEMGMiafzU/L5tPWes/yGv9zXRowoGaJjLYTfEJEVcEvawv7/qHpS7Sg/7p7lJzJE6Nq38ouGr9tvqhlcq4h53fQxDpc33yCyYPnPXHJqn6lJhq9j0iJ4gj5QqapRAkkkJW0xtic67Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io; spf=pass smtp.mailfrom=fygo.io; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=b2PklnFv; arc=none smtp.client-ip=209.127.231.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="b2PklnFv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1792302922;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=xN6LXlieOAnUNyOALUMJdRkH7TWXP1XauLMuC0smiB8=;
 b=b2PklnFvmmS9Hw1dg2YaQ2r54vjqXH469eHyBgRPdza+PQgWSCAgc+MjabjZGNf7rxJicc
 PlC/7Or33u9dDU0OXhTmj+HObXnarWdu2GgwQDwFu/K37q1tmA542StRBF78DKwELaN3U7
 RYKuoEThLg3at86QSzyEvN5GfKn/FGPkdpz/vi8A5x6U7a3GVc82+liSJJJjhdtQDuQ5QE
 iWqu6a5ltvVOV0sVjk4Kp9Ew4z12A8Wtzb6SN6IfNxz/xIOwc7kH6tJyOjE7p1tMGy2+zY
 O9WgFCDeAaoXajl2MnpTylIMWN0/GsmszGSg18+FOfzy5M7A9iksxlXmD69nGg==
From: "yu kuai" <yukuai@fygo.io>
Subject: Re: [RFC PATCH 0/5] md/raid1: improve choose_best_rdev read balance
Date: Sun, 18 Oct 2026 13:55:18 +0800
X-Original-From: yu kuai <yukuai@fygo.io>
In-Reply-To: <20260818070646.1029149-1-chencheng@fnnas.com>
Message-Id: <3247ba55-ce22-4345-86f4-99d2769efd34@fygo.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Reply-To: yukuai@fygo.io
User-Agent: Mozilla Thunderbird
References: <20260818070646.1029149-1-chencheng@fnnas.com>
To: "Chen Cheng" <chencheng@fnnas.com>, <linux-raid@vger.kernel.org>, 
	<xiaon@kernel.org>, "yu kuai" <yukuai@fygo.io>
Cc: <linux-kernel@vger.kernel.org>
Received: from [192.168.1.104] ([39.182.0.21]) by smtp.larksuite.com with ESMTPS; Sun, 18 Oct 2026 05:55:20 +0000
X-Lms-Return-Path: <lba+26ad45f49+908595+vger.kernel.org+yukuai@fygo.io>

Hi,

=E5=9C=A8 2026/8/18 15:06, Chen Cheng =E5=86=99=E9=81=93:
> From: Chen Cheng <chencheng@fnnas.com>
>
> Prefer a nonrot disk when one can take the read. When pending is
> the same, use a real round-robin among the disks we may pick.

Please note that adding new atomic operations per IO is not acceptable, fut=
ure
solutions should also try to kill all existed atomic operations as well.

And your solution seems break an important case that if small sequence IO a=
re
issued to the same disk, they can be merged by blk plug. I don't see test r=
esult
for this case.

In fact, I'll prefer a simple solution, keep the sequence IO to same disk u=
ntil
they can't be merged(by io_opt or hw_sectors), and choose next simply by rr=
. IO
work flow can be complicated, and I'll prefer the simplest solution with mi=
nimal
overhead.

>
> fio libaio direct=3D1, NVMe none, SATA mq-deadline (stock -> this):
>
> - 2x GM9000: 1M QD16 j1 7.031 -> 13.886 GB/s, 50/50; 4k QD1 50/50
> - 2x/3x HDWG740: 0.294 -> 0.514 / 0.630 GB/s
> - GM9000+HDD seq: 2.468 or 0.280 -> 7.112 GB/s, 100/0 NVMe
> - Fanxiang+HDD seq, HDD first: 0.278 -> 0.562 GB/s
> - GM9000+HDD 4k QD8/16: clat -47% / -45%
>
>
> Chen Cheng (5):
>    md/raid1: balance reads across non-rotational disks
>    md/raid1: do not move nonrot reads onto a rot disk
>    md/raid1: do not send random reads to a rot disk
>    md/raid1: use rot policy when no nonrot disk is readable
>    md/raid1: clarify choose_best_rdev comments
>
>   drivers/md/raid1.c | 122 ++++++++++++++++++++++++++++++++++++++-------
>   drivers/md/raid1.h |   1 +
>   2 files changed, 104 insertions(+), 19 deletions(-)
>
--=20
Thanks,
Kuai
