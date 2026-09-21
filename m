Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F9B47B435
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789991172; cv=none; b=ekpy8YvcrRpZoXlBwaAQ2bHR3oA03bdOcy9rHys1eI8VQAbYGhoh85FVccDmqd6fK/AlJcgV+nCW3QtAAzNhueAfPxt4FUxEzMQrju7R1XBZLHzNFXeap8pKRx4W0QNtm83tWNfqEYCjyCZgrTk2gZ2TpxK9VX2lq6RftX11gnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789991172; c=relaxed/simple;
	bh=7JeXBQLqae/WhahNYE53gzs3rKK7p/5RFDwmui2eLnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVzFo8JrtSUp+UdiACgxa5+dhljSjccBDzwF8Za+20kdGAkH45Wr64+H5apdkzURXHYnXOHcrfhmtYy85muGB0vslfosKfAmr8E//1w3x/RfA39wHVXfyN6dMLeJVoZ1M0YuwWI1Fkx/55b3zbWmXQCJLQUfIiQpekQ0ORvecBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=tQVEHSG+; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="tQVEHSG+"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso1567916f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 04:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1789991167; x=1790595967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7NySXqRqBMQS4yyS45j4W45LZP8TO8LAexSEh597hdw=;
        b=tQVEHSG+q1FiJt8yl0xxUwmuc3hCNFzcAmz+NVuIiIBO0c+fmXiev4fF+PBek+Zy5u
         sxfgeOdqB0evAXf6b0IpPss1wfpvxFYZuqcFil/UGKfDNU0B7xWVRFxSgxDhREp3+NeY
         tMDVeKRR7LWOKXxZBCdTBsMkmzLoLGpr/Rx0AmccBovIZudJeNzdM2hhZUmKHnAzqovZ
         n4mZKq5gRhCpT0vGUXZazOwtURDI0Z+ISwwwRXIjShy/ja1q8WHh1CbRe6D15HCeo8WZ
         miEi8qnGu/WieaOzBQFrfnHpQFQk0Db1KwIOeJHQsNYm+CQK2jKYA/YsSS+hwgm0arWq
         5K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789991167; x=1790595967;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7NySXqRqBMQS4yyS45j4W45LZP8TO8LAexSEh597hdw=;
        b=czVtxUcPzACFCKEFNVTM3zAmqiyK/hIraDUHMi/NH/bEiIvHCl1VsE/+2c2W0QGVHy
         aMJAaoltxUP01/7LtdM6zviZUH9MdMhRAV8SUyyjqIefK207NPSUrnLNSyWXPEX9b3WR
         TyVQwVqQWQX1eqZ2Ps9BGakmVBxaulj1VyPJX17qkQzmxX6u90DeujEPF4JwI8TO3hsJ
         TLU9bWHuNeiTmRaupw9kc32gUN+ok26i8nbzhF5UM25RO2eYQUJd+f+1tsM1B07SDvxm
         8Or9KiEM4g0r65VsMrpE2+N6sjnm7eO3QozdSfIAMF2ztR1cZcqwr+fR2L/ppXowaEmw
         QS8Q==
X-Gm-Message-State: AFuF++mvr6clKZqjzaJ8AVUSY6JBNigdzc5vtPRsondxHTfztOtLliAs
	1tdo/5mw6r9ZO145N4OVRDzp6xrR8aVE96tw8Ho5eCNCgG9lBjsxsMLkhsFNHNUeXhY=
X-Gm-Gg: AYBFou1/EVsWOOMOzmNeGle9JV4PzYVnHerAPoEUJzZRKmHBrzJe/SDzs4y3T0snqVc
	bXLggglP8yG/pbtrTrBU4Rtx4LUkivRcO/zubbRMSuHrYu2klUA3/HsXY6yZ25qLays/cM2Agoq
	N+Q/92R5eyeqhMmkxjyaqRt4WURQRJ2ZqWcWw+R8jORxn4VuAWeaNmwChm4h3XZkFP5425o8WvH
	ySsOJX+NFAiMTj33XNYSXMyPa29QqYio1Ls/hpGIRfV055PxFotQn0kEwfNQUs6B0lw5QZyC/A4
	HNFLuD6/tfGT/W9DV1aGfESM32ZeRMB7EqGLvseSV8ZXhselHzHw+e4g72bf7Us4p04/ze4L3O5
	87H32SYJrBUaxCyiynYTaCdw8U4GJMPPn1JfapUAKuZmdNGDREK0JBVnxjP+uZW7opmcDAyFgv1
	RGhs29LzXbay5h1jonQtzEI/etRBVq+VCGcOKzE1NLJmweyJyYbJjcvjq9wpht6x+OPcMwZQBLR
	WMEWzVZ7P/PezSdKiU4CNIjXIFvHUSUFZFuVIZnABWGosS6uGgeXwC5Xqln
X-Received: by 2002:a05:6000:2909:b0:487:355:4619 with SMTP id ffacd0b85a97d-4871e2159a6mr15005534f8f.4.1789991167137;
        Mon, 21 Sep 2026 04:46:07 -0700 (PDT)
Received: from [10.190.130.145] (178.115.89.92.wireless.dyn.drei.com. [178.115.89.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872459d409sm21348115f8f.33.2026.09.21.04.46.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:46:06 -0700 (PDT)
Message-ID: <b0ec8c92-cf1b-4e71-81ee-cbed5db56365@linbit.com>
Date: Mon, 21 Sep 2026 13:46:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] block: use assign_bit() where applicable
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>, Jens Axboe <axboe@kernel.dk>,
 Denis Efremov <efremov@linux.com>, Yuho Choi <dbgh9129@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, Hongyan Xu <getshell@seu.edu.cn>,
 Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: linux-kernel@vger.kernel.org, drbd-dev@lists.linux.dev,
 linux-block@vger.kernel.org
References: <20260918141609.3022848-1-peng.fan@oss.nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
In-Reply-To: <20260918141609.3022848-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/18/26 16:16, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Convert open-coded if/else with set_bit/clear_bit and their
> non-atomic __set_bit/__clear_bit variants to the assign_bit/__assign_bit
> API.
> 
> Done with Coccinelle semantic patch:
>      // set_bit -> clear_bit => assign_bit
> 
>      @@
>      expression cond, bit, addr;
>      @@
> 
>      -if (cond)
>      -        set_bit(bit, addr);
>      -else
>      -        clear_bit(bit, addr);
>      +assign_bit(bit, addr, cond);
> 
>      // clear_bit -> set_bit => assign_bit
> 
>      @@
>      expression cond, bit, addr;
>      @@
> 
>      -if (cond)
>      -        clear_bit(bit, addr);
>      -else
>      -        set_bit(bit, addr);
>      +assign_bit(bit, addr, !cond);
> 
>      // __set_bit -> __clear_bit => __assign_bit
> 
>      @@
>      expression cond, bit, addr;
>      @@
> 
>      -if (cond)
>      -        __set_bit(bit, addr);
>      -else
>      -        __clear_bit(bit, addr);
>      +__assign_bit(bit, addr, cond);
> 
>      // __clear_bit -> __set_bit => __assign_bit
> 
>      @@
>      expression cond, bit, addr;
>      @@
> 
>      -if (cond)
>      -        __clear_bit(bit, addr);
>      -else
>      -        __set_bit(bit, addr);
>      +__assign_bit(bit, addr, !cond);
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>   drivers/block/drbd/drbd_nl.c       | 16 ++++------------
>   drivers/block/drbd/drbd_receiver.c |  5 +----
>   drivers/block/floppy.c             |  8 ++------
>   drivers/block/mtip32xx/mtip32xx.c  |  6 ++----
>   4 files changed, 9 insertions(+), 26 deletions(-)
For DRBD:

Reviewed-by: Christoph Böhmwalder <christoph.boehmwalder@linbit.com>

Regards,
Christoph
