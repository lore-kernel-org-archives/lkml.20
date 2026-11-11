Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362441;
	b=1ft1i5DhZRll1FK/b/FLrY405qUtY9ZKfqvLgY84v4zPCwc0sEkwvJswwmejBi7Em4eC
	 xyZO8JLMH8AwtwqLnl6Mo7GayDExkVpLDdgFiHig+FIWSyLhA+AvwTHaaOx3Lu11NH54c
	 CJR3p41+NFPR7Su3MacDWrrs6lFUH1j6Y+Pfs9igqQMqKFbCJzdNJs3ewXPC7/T/teySv
	 fhm3iGI/rQ6j5eByPfkczpQQDIVxw0yATuZKzICEEIqwJ/mOPW22wVtQYrrLYBRb1dIyQ
	 XKFBcwtaCVMHjKX11wgSSYLqxFSe3ZU+Vt44yDNpMmPf1k2hcb58rVAdluwB0ZFSFWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362441;
	h=DMARC-Filter:DKIM-Signature:Reply-To:Message-Id:Cc:From:Mime-Version:
	 References:In-Reply-To:Subject:Content-Transfer-Encoding:Received:
	 User-Agent:To:Date:X-Lms-Return-Path:Content-Type:X-Original-From;
	bh=0sgEp7c/MYW5vEqQu51IBaPfizbqCrE+qByQrxlHX1w=;
	b=uZ365xd7IcAgc7OFkqYtZyDmxiGqYvT7VqT1iIWxKUBySYtyWnxnTVhbE7MAKDcp2Qy4
	 XUaD7/cvkLHPl0CazkNXBnuBwBH8HrjHMpnE9SjjsGpRw9TudhgsQCO5zwdFhyY5jm9FD
	 VY635ThgbewFRU9HkcgEoB7vuQw4yDAUhIg018cPmxxxmLUzne8fOTiwv4Tduc5xeOpff
	 SVqHub94bqSpO7roboYsTq9I6jXff5OJKnfJpboz0s74bZo9MfNupWXnt3ieBVmCWEgw3
	 wj+zeFml7C4cP+NNW4yrx4Nu/66Gu4dJ99/SSC5lHrnBNJP0Q/Dx+WJH+MqajchLRHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fygo.io;
	spf=pass smtp.mailfrom=fygo.io;
	dkim=pass header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=KxoffPGx;
	arc=none smtp.remote-ip=209.127.231.54
Received: from va-2-54.ptr.blmpb.com (va-2-54.ptr.blmpb.com [209.127.231.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FD8606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fygo.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fygo.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fygo-io.20200929.dkim.larksuite.com header.i=@fygo-io.20200929.dkim.larksuite.com header.a=rsa-sha256 header.s=s1 header.b=KxoffPGx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fygo-io.20200929.dkim.larksuite.com; t=1794362434;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=0sgEp7c/MYW5vEqQu51IBaPfizbqCrE+qByQrxlHX1w=;
 b=KxoffPGxIOwSmqTEEuElk5325GHO5DJvpXSwXHzWV5aGOsURq5FM3wYjuKUMQNQxCySLFV
 nxv1d3pkE0Kz5+YyYX5ZTlr439g/KBknTS4pNIFIfmiutJv+Qh+JC7SC3erSJhS6ok2lS+
 A05CQ0Wy6TtIGh2qjI/Ok9qU6JEiOZt5uKR5QhaeCURFFKRM9ARQ22iUeUPrraXLt3KYNa
 c6DgWtUBfB3r+WJH/30pY8yNcpmuJq08qAVr7cnqaxNFzZhuTy8vuJRFChXdpdTIKHeNBD
 a83KMwJjLR3hAK4NWDddYi6Q8OcrCuLmqjy5XRC1x5YvsvM2XdbZX6qGhaqOog==
Reply-To: yukuai@fygo.io
Message-Id: <c0b959bb-7128-4cb4-92f3-5a1a075a6e9e@fygo.io>
Cc: "Li Nan" <magiclinan@didiglobal.com>, "Xiao Ni" <xiao@kernel.org>, 
	<linux-raid@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<kernel-team@meta.com>
From: "yu kuai" <yukuai@fygo.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <avA3JQ6lyAlMm1Q8@chrisdown.name>
In-Reply-To: <avA3JQ6lyAlMm1Q8@chrisdown.name>
Subject: Re: [PATCH] md/raid10: Prevent data corruption after a rejected backwards reshape
Content-Transfer-Encoding: quoted-printable
Received: from [192.168.1.104] ([39.182.0.55]) by smtp.larksuite.com with ESMTPS; Wed, 11 Nov 2026 02:00:33 +0000
User-Agent: Mozilla Thunderbird
To: "Chris Down" <chris@chrisdown.name>, "Song Liu" <song@kernel.org>, 
	"yu kuai" <yukuai@fygo.io>
Date: Wed, 11 Nov 2026 10:00:30 +0800
X-Lms-Return-Path: <lba+26af3cc42+f0fb60+vger.kernel.org+yukuai@fygo.io>
Content-Type: text/plain; charset=UTF-8
X-Original-From: yu kuai <yukuai@fygo.io>

=E5=9C=A8 2026/11/8 16:47, Chris Down =E5=86=99=E9=81=93:

> A rejected backwards RAID10 reshape can leave the array using the
> requested geometry because raid10_start_reshape() updates conf->geo
> before checking whether the new geometry can hold the current array
> size. If the check fails, we return -EINVAL with the new geometry still
> in place. Subsequent I/O then uses a layout the data hasn't been moved
> to, so reads can return the wrong data and writes can silently corrupt
> the array.
>
> To fix this, let's take the existing abort path to restore the old
> geometry.
>
> Fixes: 3ea7daa5d7fd ("md/raid10: add reshape support")
> Cc:<stable@vger.kernel.org>
> Signed-off-by: Chris Down<chris@chrisdown.name>
> ---
>   drivers/md/raid10.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
Applied

--=20
Thanks,
Kuai
