Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449703;
	b=TI4w318l/5xZFrQMG2dh/IxlqwybeQp8BujWIcL6CwsXp04oZUaW38LEfYkxgVQqWN1o
	 X6kNqCmxxtCS0+uznJOM9i9FluELhXVgKCjR6m7QhFjG8px8rJvV97+LBrzLapjaS2Vsd
	 X5/dIGtnRjyv9hz7Yi5LmphIuUMBBX6cRTMci5xF0D7dok9WL/CQKBevX72uvNBpzlqx3
	 yOX28J+h0xFSr4inlNVHD9YXVgbUPWzu9KxtqMUZ94Q4HE2AM7SDbtedFPPFFB8jEKODg
	 /FZjTBmJX3cSU5QX2HvkSugoOO7kKZARWr60/3bPVtzSpimNVYd22Nax5TDGEIN9Spw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449703;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=1xCaH4HUY4jE9shdiHIoND7z6gJxF6tiu/0JOdXHPA4=;
	b=iq+nxzRGz0rJBGGJ2rm0D3TdtpM9ja2+rWJlqDcef+Vp8K4EhsxI2+7FoG+UMu2LqAHh
	 Sip93yqE5WitXTyX2n0nr0TXr0n1se60cZDfXFr96V9evXlGP/1H//X0JqHQL+hFawslD
	 xju+uO7GcbNPVD7r2O24Hc8Uy0QfAAnkW4RX6QsQXwxOOX3ZhNNLmtXDskPRJEEj+HlXR
	 0w7BqCvlqlrKjTPaFqwHBpUs8C97+lnXOIWjPxxSO7qbXrjCJWNPDFJzA13bT1W39d5Wc
	 qDgDuIRUq7msScGFBr/nOe02xbLfaBk+WRH+hoibRvxHr7TbZnyOgBqYZbnLgjsUDqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yH7XyaP8;
	arc=none smtp.remote-ip=115.124.30.98
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE081606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE081606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=yH7XyaP8
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794449694; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=1xCaH4HUY4jE9shdiHIoND7z6gJxF6tiu/0JOdXHPA4=;
	b=yH7XyaP8QSJyiw3Il9T/GynPjqkX21pmeASQXdYBGEDauat7XdXeAFyEvaamu37VtvQpl3GKJTiHqpeyCiaio4+jpAQU+SmjDWrT77r6J4HRhwbXHdQ84mxRD5RwwMjyRYiDm264yG8cVKAzHETgjnJlLcadGKsfVoxZneR0nnw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R821e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0XEaSUOK_1794449689;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XEaSUOK_1794449689 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 12 Nov 2026 10:14:51 +0800
From: fangyu.yu@linux.alibaba.com
To: tanchi25@mails.ucas.ac.cn
Cc: alex@ghiti.fr,
	andrew.jones@linux.dev,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	baolu.lu@linux.intel.com,
	fangyu.yu@linux.alibaba.com,
	gong.shuai@sanechips.com.cn,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	jgg@nvidia.com,
	jgg@ziepe.ca,
	joerg.roedel@amd.com,
	joro@8bytes.org,
	jroedel@suse.de,
	kevin.tian@intel.com,
	kvm-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	skhawaja@google.com,
	tomasz.jeznach@linux.dev,
	vasant.hegde@amd.com,
	will@kernel.org,
	zong.li@sifive.com
Subject: Re: [PATCH v7 00/10] iommu/riscv: Add hardware dirty tracking for second-stage domains
Date: Thu, 12 Nov 2026 10:14:48 +0800
Message-Id: <20261112021448.48441-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20261111150249.13262-1-tanchi25@mails.ucas.ac.cn>
References: <20261111150249.13262-1-tanchi25@mails.ucas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

>Hi Fangyu,
>
>The following QEMU patch series adds support for automatic PTE A/D updates through AMO_HWAD:
>
>https://lore.kernel.org/qemu-devel/20261108143934.129923-1-tanchi25@mails.ucas.ac.cn/
>
>It may be useful for the end-to-end dirty tracking tests mentioned in your follow-up work,
>particularly for testing G-stage dirty-bit updates triggered by DMA writes.
>
>If you notice any issues with the implementation, feedback would be very welcome.
>

Hi Tan Chi,

Thanks for your work on adding HWAD support in QEMU. In the next
version, I’ll include your patch in my test setup and run the
related tests there.

Thanks,
Fangyu

>Thanks,
>Tan Chi
