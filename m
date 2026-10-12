Received: from va-2-59.ptr.blmpb.com (va-2-59.ptr.blmpb.com [209.127.231.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F19225F99F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.59
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791771238; cv=none; b=t3aWetwrx2S/i8B5be16Y3t0Facj6zcAcd88CN3XG1p90XM1MlYm5XLT8ea/gL1vGHhgVln5HSBUYP6gXpVbT4CYyRMAw/u1WBzUZWlpIDkqFlQ+vKGjZC6OzL2rMX0oGJQ7DWJZjl6U6cL3bTtAsyfqkyNWOo8zJs6jwdqSM2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791771238; c=relaxed/simple;
	bh=j01GDBmR1TIM6DVgkFqGpR4ryULyVXSnsoFXKqh9EYQ=;
	h=Mime-Version:Content-Type:In-Reply-To:Subject:Message-Id:
	 References:To:From:Date; b=Pu+EIvQkGJRK6pZDNRDBdjbc3NdvrpEmIPCyFzlNEJuS6NonEyo9pLzzurFVySPW//mSFePbwhhg/SOMjVbQDkxL0JyxIwehGf8Wr6Zpg9vZD+n2ZPJhrJXKz5p1NoD0va24IMjZ0Ib9UOfHy/NpAM2JVrW9eXTOJLFNkzaNnmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b=nvN5eFuK; arc=none smtp.client-ip=209.127.231.59
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.b="nvN5eFuK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1791771225;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=lu7XLhYj/wAdPd451zS/VZFck9tcvSV4+oZcODROWk0=;
 b=nvN5eFuKKj2lFOWMQy31lJ0ZflnpIkG1WyofdQ9Hqm6c3HZMV2+7JMH6WJlva8B3+Kj4ys
 ZhBhZU0Dp7vBRv8yObb2WRL6ueoZg3FaLRcWxc176PEs/QxbD2DEuvBclhXICjBLQs0Sgm
 1iwYCGKWAj+hVP1PbTfjyZ4QBkG5SIF2brL6zKY8HCdWvhd+PJVytxUB5WtCGMHBRCHufp
 1oohzIEwHTtSjl+kFa24dR2rmSJI3qRqQvegb+pi9jOaNYp5dxFu7QnI1Q1AMTG/dFD1GF
 uvi0eBGORShxfAc/IEZZi8OS4fG4ODDPfJT49MZ2RWLdXHZO5OcbonxI16/+2Q==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20261005104142.1871-1-lirongqing@baidu.com>
X-Original-From: yu kuai <yukuai@fygo.io>
Content-Transfer-Encoding: quoted-printable
Reply-To: yukuai@fygo.io
Subject: Re: [PATCH] block, bfq: initialize active lists for all actuators
Message-Id: <9980eae7-e9d4-43e8-91d4-ff38e32121f2@fygo.io>
Received: from [192.168.1.104] ([39.182.0.63]) by smtp.larksuite.com with ESMTPS; Mon, 12 Oct 2026 02:13:43 +0000
References: <20261005104142.1871-1-lirongqing@baidu.com>
To: "lirongqing" <lirongqing@baidu.com>, "Jens Axboe" <axboe@kernel.dk>, 
	"Damien Le Moal" <damien.lemoal@opensource.wdc.com>, 
	"Davide Zini" <davidezini2@gmail.com>, 
	"Paolo Valente" <paolo.valente@linaro.org>, 
	<linux-block@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"yu kuai" <yukuai@fygo.io>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+26acc4258+bb5548+vger.kernel.org+yukuai@fygo.io>
From: "yu kuai" <yukuai@fygo.io>
Date: Mon, 12 Oct 2026 10:13:39 +0800

=E5=9C=A8 2026/10/5 18:41, lirongqing =E5=86=99=E9=81=93:

> From: Li RongQing<lirongqing@baidu.com>
>
> Commit 2d31c684a053 ("block, bfq: inject I/O to underutilized
> actuators") extended bfqd->active_list from a single list_head to an
> array indexed by actuator, but bfq_init_queue() still only initialized
> the first two entries:
>
>          INIT_LIST_HEAD(&bfqd->active_list[0]);
>          INIT_LIST_HEAD(&bfqd->active_list[1]);
>
> For devices with more than two independent access ranges, the remaining
> list heads stay zeroed by kzalloc() and are never set up as empty lists.
> When BFQ later adds a bfq_queue to one of those lists, list_add() writes
> through head->next, which is NULL, corrupting the list or crashing the
> kernel.
>
> Initialize every actuator's active list using bfqd->num_actuators,
> which is already set up earlier in bfq_init_queue().
>
> Fixes: 2d31c684a053 ("block, bfq: inject I/O to underutilized actuators")
> Signed-off-by: Li RongQing<lirongqing@baidu.com>
> ---
>   block/bfq-iosched.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Yu Kuai <yukuai@fygo.io>

--=20
Thanks,
Kuai
