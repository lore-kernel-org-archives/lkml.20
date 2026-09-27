Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B92237E5D0
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 13:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790514324; cv=none; b=SuMa5ihxHRuET7Jee7cfdVent7dBszcC8iG8qdaB4rprLQUu9hK2ZhfCGmg1MZ7bWSIYIOVUTAB2j8fxqWEbYxDqGvWCEeJmPziJIweW64N+DWHvi+H7AFpK2Z4fQ3hOqXWo22GfJClksAJybg214TnzRHGap2ofoltyRFNGkjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790514324; c=relaxed/simple;
	bh=28+YZo/XmVy3fRF3zKr/BYguA0KLZnlApveULGmwDog=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G9WYvqU+PJ5XbUaSmX7oqApaYGPBIYPnLOqfqPMhlcVVK8q+ADkrozbjdIwXg04+F1z4Rg9+nIMPnhWf55JUepriJxi0szgKgIibM2vTdLkqHPIqOEF2+wQkztJnZb859eaf8qca8Mbb1tHEhzh/tetoWRVJYUSB+tiRlARZFKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hweTVajr; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hweTVajr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=42DMKxIAPoMuDerQkwnMYkPlNRutMUE8w4801xKA6Kc=;
	b=hweTVajrofIo90OREoqTUE3MHJ6ngspImj8wA+9LjOUuya7zii80Lv+aiFXO1z
	qqwt89kpoVu2PXDp4mIicroY7eJ0P2qLDZk5Kescg6aflAgHvPmVg/wC1Xfnx4sI
	IwPBA2jdF6X6V7w+TPfqyjz/Emoq57knXXdOkZqISumEs=
Message-ID: <9e6e7f65-33b3-4bf2-9254-011b5e1faaa9@163.com>
Date: Sun, 27 Sep 2026 21:04:58 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] exfat: drain in-flight DIO before buffered write
 fallback
To: Jiale Yao <yaojiale02@163.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 "Darrick J. Wong" <djwong@kernel.org>, exfat@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260926072612.3022680-1-yaojiale02@163.com>
 <20260926072612.3022680-4-yaojiale02@163.com>
From: Chi Zhiling <chizhiling@163.com>
In-Reply-To: <20260926072612.3022680-4-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3L056FLlqMOuYBA--.1878S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtr4rCF1UAFykAryxKFW8Xrb_yoWfZwb_Ga
	92yrsrX3Wjg3WrJw4xCryFyrn7Ka18uas3Zws3Aw1ag3W7W395AFsrurn7Cayjg3ZFkrn3
	Cws3Xw1Uta4kGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1Za9DUUUUU==
X-CM-SenderInfo: hfkl6xxlol0wi6rwjhhfrp/xtbC9xosyWq5FHr+DAAA3H

On 9/26/26 3:26 PM, Jiale Yao wrote:
> diff --git a/fs/exfat/file.c b/fs/exfat/file.c
> index a2a9ee1a2004..cf5ccbd54823 100644
> --- a/fs/exfat/file.c
> +++ b/fs/exfat/file.c
> @@ -807,6 +807,12 @@ static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
>   
>   	iocb->ki_flags &= ~IOCB_DIRECT;
>   
> +	/*
> +	 * Prevent concurrent direct I/O and buffered I/O to the same file
> +	 * range. Wait for in-flight DIO to finish before dirtying pages.
> +	 */
> +	inode_dio_wait(file_inode(iocb->ki_filp));

This change is correct, but the comment is not accurate because the 
function you modified is not part of the buffered I/O path in exFAT.

You can add inode_dio_wait() to both exfat_file_write_iter() and 
exfat_fallback_buffered_write(), and move the comment to 
exfat_file_write_iter().

> +
>   	written = iomap_file_buffered_write(iocb, from, &exfat_write_iomap_ops,
>   			NULL, NULL);
>   	if (written < 0)

