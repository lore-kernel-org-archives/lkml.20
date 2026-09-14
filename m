Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D526442385
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393394; cv=none; b=hwtE0+ara0beuh9a1bJJwFgW3qhNxs1yLjRkGbhPSYgNP/LP1zFYIAqWr/sOd37ENQg1SR9mef36z6FiMuvsxKvG18r2YV/u//Yd3nBOOG1oVztaSCTnIy8F/YayBYDlQbvhx73vqz2FzjHGbyvixE8sBv/MCqNUWi1Ae6MHuDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393394; c=relaxed/simple;
	bh=1Fc0KyZHLk7ULyYS8SIQV3M35fMzcsUO/lWfP2TzYWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJMHn/H9y2TtPz+XuotabUgogKS9x+vveY9AxMPyhlVvMkrNjuh+BLdcK2dkBKrMduZ9Hve6r0zIEYxj1dygNjjLX8Dqj5MAvyQXDkfVQ+IUzervP7UkpOjhoNFWESnS8sKeWTSxMzPpTLsnhnn9qBcB3OV7DLP2yr+59CQttNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b=Po3m6xoh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.b="Po3m6xoh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-486e70f2457so1691977f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1789393389; x=1789998189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6ONs8JfteApgzfSxnZlkhUCoBw9wJsvGngg+TCpNbLU=;
        b=Po3m6xohTvb/Y1G3DiBSTGXmfbEDYVivNLxOzCpeTtGqt0Mzhkre7PS2GsMyoDX20m
         FmdAWeCwoXKPL0QbypACWmHCuEOUgLrPs8UyCG5T70y3FjxrlAt3iYgRivgsGnaPAd5Z
         Bu9yT5oorRnbu06XlBTSwj7P0JQKCZNXzuS3/9ST6nlYMx4WNshawvhi/ipsrkLkedIi
         EP1Q8WT747/WGBUh9i7GGbclHbBllwP81a2oMavxag1IdylaTefFpPVCe082oaYoyRFd
         CdWRWHtjnI4DF0F149dtSp283kmsUpD5x2Xb5UEVSV0dYnaBCNkCtaTqDUYZdKfwaDLd
         ijTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393389; x=1789998189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ONs8JfteApgzfSxnZlkhUCoBw9wJsvGngg+TCpNbLU=;
        b=GbJ2ZCD2bArb6sljXw5mXIcJ2pq+18ynzOe+Gp441D0rrLRS7LJfi3TlI2h5atP0ev
         rtUNfv1lTDHFmuSzdwKwFLTm4CalP8R/0OGY/Ui8mzhzptyDz3fZWaakXA7kyEIkyvAP
         9vg+AVSe9grNaKsRDkW6zq6a+W4n+z+JsLICLRiFHU28N05vDxF/jxmpDLZeOQSNuThe
         5jYwkNVJ7aLJ9OrIGAKWqy8ghWQRz5Js8eJnC28KM6RnED3NX0Nv0XZSzCRBc1WyHU1K
         CTy5bIwDbjoCZpSgJzKKYtOY7ikxQlgRdy/lQaToxIgasLiUqqRHTiZjqRm0UowCwR51
         agMA==
X-Gm-Message-State: AFuF++mORu+3S0ZHMFZO9vAdTctkILRuD0S5qg2FfTFlwTcEalt0zaXZ
	AXeZVEaOGIOUjgK/jgm70K1BWV5lIdTTHeLvuqkEgSBL53j65NEFOZ+RA2BLBt2AcbJkCaSZQl7
	YMZk0N0P4rw==
X-Gm-Gg: AYBFou29xQdkNcjLrvbL7RDvlVDjjYt+IlmtVuTqhOlIaUUeN5Lw3063TN6+kQn/izV
	xW86P8Q+QXfN6oZ1xotIp1juilwQ9bLUSfRCmpGi8WewW88gYfdpfFfj0vsC1NSFp122ZpXssAO
	qXnadyU3Zy4znJylAaTkg0YpaPj7565NI8zvmbkdoMbmSSJtYNGlS4SpAKgXO3Q9E713UXj9Yf2
	dAj6vWsNU38ORaap1P5M+GlXBjrOSaSk7FZ5pB3jLEaVN+NANcymKL3lE+y0eyCvYr4UO5QC1S6
	7j6dlwMPaB26+f2ifCbR3QzzZK92TYjX/0b7O1Rh6ZkqM6PCj/8zHp3703+f5S+YGfFxzL9UJQq
	D/2FtN1v65BMP+Un9QFK9zqOUWv8lWp0PKN7bw9ZY5VG3G1WbJAVuUZoJmDDMm7JOWjRiHrvDex
	MYMORScWaWJEq3CpzkPENFu1tdMrjaqwjXRmExAwVidQ53rCw8heBKQWoAWMm/9wqVeWIguLWev
	Eld8fnTEPYqHig1Rdz8xLoyYWHCn071FXeTtRUmZyTgGsaWlNAa3IlunsGi4/wduqNinErNtF3d
	iDNyew39QSN463usGpaH6q19I4gGn+W0frbgdQ==
X-Received: by 2002:a05:6000:460e:b0:487:4ba:97f1 with SMTP id ffacd0b85a97d-48704ba9a14mr431505f8f.7.1789393388928;
        Mon, 14 Sep 2026 06:43:08 -0700 (PDT)
Received: from [10.160.16.196] (150.red-80-32-100.staticip.rima-tde.net. [80.32.100.150])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm28007119f8f.13.2026.09.14.06.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 06:43:08 -0700 (PDT)
Message-ID: <e39b25a5-6b53-4fbe-9185-9be66ed47df3@kernel.dk>
Date: Mon, 14 Sep 2026 07:43:06 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Missing signoff in the block tree
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
References: <aqfBpkMSF1rFicSh@sirena.co.uk>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <aqfBpkMSF1rFicSh@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/14/26 3:43 AM, Mark Brown wrote:
> Commits
> 
>   0d337c5d5a6ae ("block: warn on too larger integrity allocations")
>   080f146f067f7 ("block: pass a maxlen argument to bio_iov_iter_get_pages")
> 
> are missing a Signed-off-by from their committers

Oops indeed, now fixed up.

-- 
Jens Axboe

