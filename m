Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845BA333730
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787831109; cv=none; b=D5/bdyK6NFx676+DsWfl41GUdC3sAym4J61Szcprew+jKhnHqT+MwlRmxA28QogpdGy04MJHLcBRRztzP9dtIuBdiZKQjVpALgfqheBEMFHoV8Ul7h0zAsRZHhf7A1DBRo5s8h2um3sDhyrSs86PONL+PvK3+dZ5a/2ZitD8e0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787831109; c=relaxed/simple;
	bh=tl/MrtSWTP2YZYbhCAQl0DVDAuF9kj/Byi1DrzYz8OU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sdxOOwZ7FF56hsCnzkWwK9fSJyMLoySDbJix8vM1sQc4PvM78cUvoxHAISRKX+qDYSEywLauL8iS3ah0UARBJwgEzDC1kOwLPUcg3iiQZKbckiNFlzhAOgPUFjsXR7iHxMi0M2X39bkvXBx7AldJ96mJfs/WtCYzT52oj6OLeb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CuGlYJP/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CuGlYJP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEDA1F00AC4
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787831108;
	bh=tl/MrtSWTP2YZYbhCAQl0DVDAuF9kj/Byi1DrzYz8OU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CuGlYJP/X78YG2vgI9NoV3MhRkkbHUcpgyKNj6odwl5Nb2XIETf+HicwwpDXdqlnd
	 wXFc3aZtixxzAzN3iEJvLSbU0h5YeS28yFQDcjKYJxjmxg7GCJe01Bss8e2MXhplT9
	 QW4ly8ljvGq2yRBJJ0oKjT/hHIBXPG+mj1M9WRymkGHmPBnl1MN5dL7U1e8JruijO5
	 WOBhp3PeR2plTcDXiGzX5vneVADUhqaethosmtZa86/PwMZRvyKdjhr2dtBKDDYGpI
	 lIqfxvePqYu5UovUerFW3fp/sI9wlcz33bF/Z9G92HZ1cC9EBGCIQ6CbK7aqmA1q+j
	 km0nkFqY8aLkQ==
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-9390a2c8909so15800085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:45:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzI4Bx8wwBf9+hXxXnqIOAixIQ3OPpgmSszohx6B8dFKfuZIF8ECtekpnxAd8fHPlQ/4/Sl+ZVdvwZp8k=@vger.kernel.org
X-Gm-Message-State: AFuF++nl/0LRzyo1da502KxzYHgH9WW/QGP/Ce9yBXGG5SECpHtl0+J3
	w1+iyiXuj2WncMZVic42IEyAxSYayptt+gsuciB/YWjWXWiJgbMXzisBMU9hv8HYkD6B2eEH20H
	paWKmHyF9UQYPmvONFRTd+3V92Cntwic=
X-Received: by 2002:a05:620a:4688:b0:92e:fc42:2c19 with SMTP id
 af79cd13be357-9378012ed0fmr1253366785a.11.1787831107251; Thu, 27 Aug 2026
 04:45:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827082722.1809702-1-yuehaibing@huawei.com>
In-Reply-To: <20260827082722.1809702-1-yuehaibing@huawei.com>
From: Barry Song <baohua@kernel.org>
Date: Thu, 27 Aug 2026 19:44:55 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4zEn3fn0qU8QZqs9ujcLWL4KPWd8os2CbEhmZ23wCC_bQ@mail.gmail.com>
X-Gm-Features: AcwNN1UEJWG47THBIyOeUsF3FWdr22GgPA-FTUeI3kQ5gT1BObP07Cd9-ND9oqk
Message-ID: <CAGsJ_4zEn3fn0qU8QZqs9ujcLWL4KPWd8os2CbEhmZ23wCC_bQ@mail.gmail.com>
Subject: Re: [PATCH -next] mm/swap: Remove unused declaration swapcache_clear()
To: Yue Haibing <yuehaibing@huawei.com>
Cc: akpm@linux-foundation.org, chrisl@kernel.org, kasong@tencent.com, 
	shikemeng@huaweicloud.com, nphamcs@gmail.com, baoquan.he@linux.dev, 
	youngjun.park@lge.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 4:06=E2=80=AFPM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> Commit c246d236b18b ("mm/shmem: never bypass the swap cache for
> SWP_SYNCHRONOUS_IO") removed the implementations but leave this.
>
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>

Right!
Reviewed-by: Barry Song <baohua@kernel.org>
