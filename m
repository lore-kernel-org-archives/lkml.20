Received: from mail-m15588.qiye.163.com (mail-m15588.qiye.163.com [101.71.155.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEDE35C6AB
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788931858; cv=none; b=SG/xspXewwiNQb6bEnaqIwhBvG80uMf0SmD4znTlby8v4+v9r/DQDruIACaS+WXg2Z+rWZYEZ73hnEPBv9gNFAZRymae7UvqRmjls3KYo+hSxrgz4yqNa2BW0de2SG/taj7YHiBi5ZTxAb4LhEECKOWLGg0RMT8kQPZlLHwGr1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788931858; c=relaxed/simple;
	bh=0uEessHzcSfxsC9/R4E/G5cHhOHZfHSBc4M8wjJU3EI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WAlfSwl71a5uYdQYaqngkd2yAy68DCCFPdfFpI8f6HaJ70D2E41O2w7UeSxIgpDiMLC2qSS9x4vnd1kQ7cLxKjaKCnU0adPIMKC5ZuRYP4ZJHXiYykcDfv3n/EtrkZEeFMJGReQ+3mrANbuu7jTYDDT6NcK+rpRarNxNACrJrWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com; spf=pass smtp.mailfrom=hj-micro.com; dkim=pass (1024-bit key) header.d=hj-micro.com header.i=@hj-micro.com header.b=a8vY9GZL; arc=none smtp.client-ip=101.71.155.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hj-micro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hj-micro.com header.i=@hj-micro.com header.b="a8vY9GZL"
Received: from [127.0.0.1] (unknown [122.224.241.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d0ba6a2f;
	Wed, 9 Sep 2026 10:01:22 +0800 (GMT+08:00)
Message-ID: <d1c64269-63b3-40ed-9efd-1ba545f8cb2e@hj-micro.com>
Date: Wed, 9 Sep 2026 10:01:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/arm-cmn: Fix {wp_dev_sel2, wp_dev_sel} limited to
 0/1 when MXP_MULTIPLE_DTM_EN is TRUE
To: Robin Murphy <robin.murphy@arm.com>, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peter.du@hj-micro.com, andy.xu@hj-micro.com,
 allen.wang@hj-micro.com
References: <20260819105443.668784-1-allen.wang@hj-micro.com>
 <f97fa5ae-3535-4e1a-a164-77138a93cc89@hj-micro.com>
 <58adffd2-6ef4-4a4c-ba3a-3f510522d928@arm.com>
Content-Language: en-US
From: "allen.wang" <allen.wang@hj-micro.com>
In-Reply-To: <58adffd2-6ef4-4a4c-ba3a-3f510522d928@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa083e5fbc009d8kunme32fd7ee3c8753
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDThoeVkofQxgYSUJPTh5NHlYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUlPSlVIT1lXWRYaDxIVHRRZQVlPS0hVQk
	JJTktVSktLVUpCS0JZBg++
DKIM-Signature: a=rsa-sha256;
	b=a8vY9GZLrLFJA9Epxm8DFpwotP6Ktm3Iv64lfTXz0NlLfQ8OZ7jl/dPdtyJ6kZaxEVLGF8cpv/ODOehuhRhUE/VACwMMcH8KrFCKmWZDGcm1wercTeuFL7GSn5bADXqReIKm/HEE4Syr7vjctGHZgqtKOa8uQuImylIGGx3DDi8=; c=relaxed/relaxed; s=default; d=hj-micro.com; v=1;
	bh=0uEessHzcSfxsC9/R4E/G5cHhOHZfHSBc4M8wjJU3EI=;
	h=date:mime-version:subject:message-id:from;

Hi Robin:

Yes, that's exactly what I'm saying. I've tested this on actual
multi-DTM hardware, and the hardware does not ignore wp_dev_sel2
automatically — it must be correctly configured by software.

Thanks!
Allen

On 9/8/2026 11:04 PM, Robin Murphy wrote:
> https://support.arm.com/documentation/102308/0307/Debug-trace-and-PMU/
> Debug-Trace-system-overview/DTM-watchpoint?lang=en

