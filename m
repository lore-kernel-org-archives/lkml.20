Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793170711;
	b=vuWs+TDsaNC+Hv7J6ZnzZCLaRV46LXoVF7pxq3+5mn6BkKhhJx9TmZqSp/jX4c8v1kzd
	 Qo+OM8GoIxdj/RthkMmxFkvFUYW7dZbQYH58bcH2x+Et7eQtOv8BxGFgGKuG4jMUNXE3A
	 2XrU4DZK8GkjBWJe3TiZMe9jk5fwqvn3uq6d6b2HIkqJNhU0hxfwodm0092efMADaj7+K
	 Cs4sdZnBs2irYzIk8Lp3i4Zmoyh6ILhZgY4/VQ5uO6wuxcMUU/z/c5exbxCUdhgmTPIFX
	 MbVTXP6ZQIngKjY0uWL2Mar3EDQUH+beNrCrGeDGRSdMTzu4nbgYMUPtNEticFa/CBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793170711;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/SMm2YpudK66NsGAe68ZoW6GAWXqQP+W1Wbd7hczTxM=;
	b=RPPs3ZFg1VlUoL1SZ/Xl3H1QbMXFwbvhCRWbySsM0rU/RmDdRTJ332vUb8CvmnE38vdw
	 aUMdtaNBO34kH0O0sX0hAkI/vmYUVsNV+DtgUISeicAn0ToeNwRPMY0ozR4zhznXYiLqb
	 t53i4Jeo9M938R4bVKP4S5pvgCOh+vE/n833CWqYYEZBExuK2iMltQKGlJDpQI1ycUpzJ
	 /gehKkyGMzQm0EQtbt/I3cYy+g5q3YmPXMsRFVxw1tabJHn7Uqsr/bFX8l6t3CzcmUTXe
	 0SxGCYPHEM/m7SOFHf8f1TW0N+xFPBCtDQDwD485dcCQCnPKHcxghkaxvLdGQzcESbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uQ3ViB2m;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE2F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:58:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE2F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uQ3ViB2m
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793170701; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=/SMm2YpudK66NsGAe68ZoW6GAWXqQP+W1Wbd7hczTxM=;
	b=uQ3ViB2maUnRySRnp78bFfh9bk+74djPMdsoBTU9V5l1WP8iZaFPorucp4mGA1zpTgJk7Jw9wjM5wX4Iqy4NJQTn7Te/7x6rdLvm7S90umw307bV2TpGjWFJPiT/VGSWUdXlGKcBLS/iIiiuoBMHQL0JwYEoHQG1qI7+AqC0oi0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDg3Ape_1793170700;
Received: from 30.74.144.137(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XDg3Ape_1793170700 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 28 Oct 2026 14:58:21 +0800
Message-ID: <bb3b1c3d-f656-4238-9c89-2639687b6f8e@linux.alibaba.com>
Date: Wed, 28 Oct 2026 14:58:20 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] shmem: clamp negative used-block samples in statfs
To: Hungyu Lin <dennylin0707@gmail.com>, hughd@google.com
Cc: akpm@linux-foundation.org, tim.c.chen@linux.intel.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261028051826.23058-1-dennylin0707@gmail.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261028051826.23058-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/28/26 1:18 PM, Hungyu Lin wrote:
> percpu_counter_sum() holds the counter lock while scanning the per-CPU
> values, but local updates can still proceed. Concurrent allocation and
> freeing on different CPUs can therefore produce a negative sample even
> though the number of used tmpfs blocks cannot be negative.
> 
> shmem_statfs() subtracts this sample from max_blocks, reporting more free
> blocks than the filesystem's total. With a one-page file being written
> and truncated on separate CPUs, GNU df reports negative used space, for
> example 67108864 total bytes, -28672 used and 67137536 available.
> 
> Use percpu_counter_sum_positive() to clamp a negative sample to zero.
> This keeps the existing best-effort accounting in statfs and does not
> change allocation or limit enforcement.
> 
> Fixes: 7e496299d4d2 ("tmpfs: make tmpfs scalable with percpu_counter for used blocks")
> Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
