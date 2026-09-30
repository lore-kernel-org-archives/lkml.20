Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01058497B61
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.156.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770507; cv=none; b=sANW4wiZCgm+VgcdayhGhXaPJHPBQ0s4UB+2Vsx2CNWwLrEZdGkTS2W2jfuME5prXNAKIhh0e6R91vmUwGQ3lRzIGJ13eT/xksfBBKeck/DqbfTK0JOSnhP+aerRuMpt1rh9708ejkp/Yml6X0JYff92ERTACSTS8aFPANZoyzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770507; c=relaxed/simple;
	bh=nBXdwPyZQR1lFGQmVieyKRwAO3UGnjcvn7D2/cxVZyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hJOSNfAOOfWJrxUs4zB8FHFjAdWKQsfYKQNvMRJ0g9BU3xAbi6pBDz6eFmkHyUsdln7yy1AY/CBN9bHTQLJOLfG3dgXWDTHQnTRFlb1Ogx/7lLP23xoT+LvtZ2rqEFpcvc6ZyD60w33X3c0S9ew6Z8neE6q6eYJ7NTWsSbOsbvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=TXakTUj8; arc=none smtp.client-ip=62.149.156.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="TXakTUj8"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id Bt6Jxwm5xxUh5Bt6JxVwJE; Wed, 30 Sep 2026 14:07:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790770076; bh=nBXdwPyZQR1lFGQmVieyKRwAO3UGnjcvn7D2/cxVZyI=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=TXakTUj8p9iYPN6l37+kwJj6dOnUusIAM+xTXPnaQ6pArIi5HKbznXqZz4GXHikzn
	 g3ktRXvvTWyHdVqlUHyMC6ckf4UXJLxKXd0qmUhvEdrse2Sz6Bsi0uwH2sSA7AQ9eO
	 CnGSOxMXgIUmfkU/T9ukSR1DVcZmhQmFIvVd+7PuX9M85+xECNA4WfF4iQVncqOYYv
	 A/vn+++vLYno3WliupPhSOzo66RW905X+Whr5jHAGLVFhrH415El5g4p/R5SuTHwub
	 I4eHg6RNIkTCRLazACwQC7OEjVSNFag7JMCRDVTrcWCy7+SBTH5J4hfdtZWqfK0wKb
	 A7s7/AnGIWu4Q==
Message-ID: <1888e57b-8e0d-46c2-87d4-d65080e9ebbd@enneenne.com>
Date: Wed, 30 Sep 2026 14:07:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] pps: generators: fix use-after-free on unregister
 with the file open
Content-Language: en-US
To: Danish Khateeb <danishkhateeb03@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Calvin Owens <calvin@wbinvd.org>, Yibo Tan <lhfff@tju.edu.cn>,
 linux-kernel@vger.kernel.org
References: <20260929124937.51114-1-danishkhateeb03@gmail.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260929124937.51114-1-danishkhateeb03@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfGQ7VXSacxzT8EF5dADYLGg7wx3dPc47EfnvjiXWLPjSFySFcL/iKSI9DjXNmcJyGCW632g1z4Uq/N9+XESVKcJAPBe+0zUHzNnUQt6xawgv/YbORZ6l
 ZArXGBo5a5MTVLb674RFoPELOqjKyzYF7iiW5E3VyWtEU9XvU4/R21av7sUs9z51oog5s8MVgkU4kn5KPxodnqJrvCrohMuoD70ZT9YSien3/YZLouD3hh1c
 CA/pJx8/y3zBfLMeSaIFQFV3hHngY6/Dpy/X+uMmzcv2r0c2Y+zM/tEae5dQ6TN4+l04ZxZ4MBWzyr/yyWlVAKhA/OVFS9EcBR6lKoWLewVOv19lCChQRGlo
 kjS9eEzxn6ovfRMnA+xYdUqWEkPX7Q==

On Tue, 29 Sep 2026 07:49:33 -0500, Danish Khateeb wrote:
> This fixes what goes wrong when a PPS generator is unregistered while
> userspace is using it:
>
> 1/4: closing the file frees pps_gen in ->release(), and __fput() then
> calls cdev_put() on the cdev embedded in it. pps.c had the same bug
> before commit c79a39dc8d06 ("pps: Fix a use-after-free"). Fixed with
> cdev_device_add().
>
> 2/4: the ioctls keep using the driver's pps_gen_source_info: TIO's devm
> memory after an unbind, and pps_gen-dummy's module data and code after
> an rmmod. They now return -ENODEV, as PPS_KC_BIND does for a removed
> PPS device since commit 3649f9a6b897.
>
> 3/4: a PPS_GEN_SETENABLE, or a write to "enable", between the driver
> stopping its timer and the unregister starts the timer again, and it
> then outlives the driver. The core now stops the generator on
> unregister.
>
> 4/4: a reader in PPS_GEN_FETCHEVENT is now woken up on unregister and
> gets -ENODEV, instead of sleeping until a signal.
>
> Yibo Tan's "pps: generators: Pin dummy provider while a file is open"
> [1] keeps the dummy module loaded while its file is open. That covers
> only the dummy rmmod case; a device such as TIO can still be unbound,
> so 2/4 is needed either way.
>
> Changes in v2:
> - New 3/4 and 4/4, suggested by Rodolfo.
> - 1/4 and 2/4 are unchanged.
> - v1: https://lore.kernel.org/all/20260929022219.212024-1-danishkhateeb03@gmail.com/
>
> [1] https://lore.kernel.org/all/20260911134952.648064-1-lhfff@tju.edu.cn/
>
> Danish Khateeb (4):
>   pps: generators: fix use-after-free when closing a removed device
>   pps: generators: don't use the driver's info after unregister
>   pps: generators: stop the generator on unregister
>   pps: generators: wake up PPS_GEN_FETCHEVENT readers on unregister
>
>  drivers/pps/generators/pps_gen.c | 111 ++++++++++++++++++++-----------
>  include/linux/pps_gen_kernel.h   |   4 +-
>  2 files changed, 76 insertions(+), 39 deletions(-)
>
>
> base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e

Thanks for picking up both points, and for testing them.

For the whole series:

Acked-by: Rodolfo Giometti <giometti@enneenne.com>

Ciao,

Rodolfo
