Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9382F3ACA5B
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061595; cv=none; b=cgvf6V+2cvG8x0ut3CW1mI5af+eEgpKiorylfiWuvmgp4XqO7TwwPShH5YoeJB3WMvwJP9aNUBEj/Fjp2xxXFlAFIP3gBrfkQFLezn11ye5x6LBl1ad8H7S28nlUZFfDB0Q8vy/zFmY37Y2KwDMUiVIbvO7A4rJUw0bq36OG2mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061595; c=relaxed/simple;
	bh=mBX4z2VJhRPZnv9f6eQyJQ/gucy6LJHIvxxPIGWeDPw=;
	h=Subject:From:To:Cc:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ti6dQ7eZ7Kp2KhHan+3A9oAhh66DieDrC59TbEbeP3Hg1gFSjv17qrKI60WqIoEdlxpZ13ipR+G4TOaMl3MwnzXCArFCLJ6jSpa9FsfucX4o6v0aDcizyVxXha4ebeGuZ/b4rLMkz3nNj0QnLn4K8soTNYhtLL5yd8km5QmcVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr; spf=pass smtp.mailfrom=dgu.ac.kr; dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b=o3/CuWWo; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dgu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dgu-ac-kr.20251104.gappssmtp.com header.i=@dgu-ac-kr.20251104.gappssmtp.com header.b="o3/CuWWo"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8623e5d435cso1322663b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dgu-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790061583; x=1790666383; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBX4z2VJhRPZnv9f6eQyJQ/gucy6LJHIvxxPIGWeDPw=;
        b=o3/CuWWo1PNUAQzOW4VOrvb7FyAvpDmJDdx5zblAUMKpafdyosFoUUN0EGLrYf1H9H
         HRiCQU58GlLwmX+aJmppZrbZpvm2isMjnBoz/lUTC8rm9lh5y/bu3MSZ28LklMfB6rKA
         GnQvfh4XB0xToVwDXLraDThRPDZ30agSIwGOBLYKauvzd+LE7mYMZJFHI6a0P8g1KRLW
         AjI4Rc+WyT3wPJwfQUCdnTx/ge5tKzg1XIzPQJTYFo9PC4KXcZBOjbeJiH3ALsl+73q4
         SLIMnPn/7DJplJcEws7vknQvNs7ngV97rVJlCnF9dJeyGm1hydpxYbV+3JcTl4OEUYFp
         04wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061583; x=1790666383;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBX4z2VJhRPZnv9f6eQyJQ/gucy6LJHIvxxPIGWeDPw=;
        b=ovwBJ1IQivvVJgd2u5RySbGAv6RDpl1KofqSXlq0nSFcvO7iJF2dHisGP86x6fpPVN
         SoVFsUWh7JaXcvVp5BgdUYqEZYxo7lt3yo7zXpCalah8YAdl1pGD/rg91zT02454ipRG
         33c64K0KX53Rh4bmohY0Caitp7SVmdvZVQrTVfnn0/oxMMUlLGmu6wOCFlsHaMEQauZP
         YwTS3dEob/L7Q1hGJHRYjPzuFUuJGCUjUrLWfvUR21J9ugnA4Y6A5SjcRQGpBS2zi57c
         LfwKCN09vgzjzGRK233igijqdL7+m0Aqpr+Co+ihMZjuJ7VPxfa8yP1S3Yt2I/fKN7ix
         7AFg==
X-Forwarded-Encrypted: i=1; AKwUvBzbZc+XA3Nk7FNIOMp7NOwBlDezAV4jKVA/Na6fIHoAa0QbLvFLpqwWLCt5LuGUkHlYW5hOHLnlJqRYUJk=@vger.kernel.org
X-Gm-Message-State: AFuF++kMWAZEeoV15rRwERFfkR/Uv/1iOKPgMq3hCg6K85tV3F+7IDFh
	+szf23LqM3vLudSWPHyKfYEZam9ti2v4QABEvzhxU+rPkMLFlVI721LawTnlMgfikJxmio7Zf1F
	OorLK
X-Gm-Gg: AYBFou0Nv1od96Aj9K7ijBmZr6suGi49F5GHrxVQnzQxQIxE8fcd5sGHqeTkaMgwhiO
	x7Rx2o+bmd31emuBatzuRWUZVYD0CMOc/wLBvpEJ8KpmjeJZgkRIPNSXPnF483XCnb+iXr/X9MC
	Uyi7fShJ6jv1P93LjG4rqjsdMXYc3+cnEPV9o92ww3IT/pDf6J3MV1KS60sr1h2dEA/sc54IWiU
	HfYuQJPBB0CzhQmiTa+T0nQHkFoKSeKdHDs/BBitlOMpqCH5B/zyLObvx79Ar/SpqtnE5Nz5oc5
	R4MPBVZW9Pg2z9TT6K5bQl+Gp8TmlESsj9H8OuFaqVebKVqQDj9t9P+I/cOVxPPJV6Cfy5Y70R4
	BuL//SSemDRfY2L2alWW5ZI4DijSdmGmeoZsHh+fOeiPZlN+IrxR/zPL7fenfqu3uCII91pY4SG
	lQdLDWSmgruqIH849vxOKSjGTenSBGebjpJ7ZF9egx95cElvlnogDjyFVCqZ9rFKHFmg==
X-Received: by 2002:aa7:914b:0:b0:878:3704:e0f6 with SMTP id d2e1a72fcca58-87c8cbd2624mr162498b3a.28.1790061582980;
        Tue, 22 Sep 2026 00:19:42 -0700 (PDT)
Received: from PC2. ([175.193.106.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87c324cf14fsm397422b3a.22.2026.09.22.00.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 00:19:42 -0700 (PDT)
Subject: Re: [PATCH] selftests/mm: mremap_test: handle ENOSYS for userfaultfd
 and add missing newlines
From: Park Tae-sun <ts930@dgu.ac.kr>
To: Sarthak Sharma <sarthak.sharma@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Park Tae-sun <ts930@dgu.ac.kr>
Date: Tue, 22 Sep 2026 16:19:40 +0900
Message-ID: <179006158019.123863.10328178989374348836@dgu.ac.kr>
In-Reply-To: <2e0a8157-a529-4355-bd7e-11ef0234b825@arm.com>
References: <20260922065143.118702-1-ts930@dgu.ac.kr>
 <2e0a8157-a529-4355-bd7e-11ef0234b825@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Sarthak,

Thanks for letting me know!

That sounds completely fine with me. I independently ran into the same
issue while testing mremap_test in QEMU on a minimal kernel without
CONFIG_USERFAULTFD, so I'm glad to see it addressed as part of your
larger series.

Feel free to add my:
Tested-by: Park Tae-sun <ts930@dgu.ac.kr>

Thanks,
Park Tae-sun
