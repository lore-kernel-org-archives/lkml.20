Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B468F49EC59
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141996; cv=pass; b=Q9luIyQv9+PWN2eMdHFjgNSUHQhkug9Tnsu/0RfdlJuNTz6RaUNcxITPqd6Q4KwYjveoCvDVR0mZytMi6FHoPPsT0+K45uYvZcZUAQGWePpljs0+TwuOzuBf+7bY9v9pR507ebcofWQgKIuhPIay9EBnp2jW1ddxYJkoijNh+x0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141996; c=relaxed/simple;
	bh=F39xQOImaxJK8CevVQCFMKOX+9LgzBRLUqk9ae5qoSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rVwIL4Jy7THc1atk6fbSsKxJK0Q6bUx+fMEAtKlW4M0bcXhlbqvcrc4H2a10sKdWZwg/rkkhUSg6H0Im6IDYcL/9J/gvMB35VSMzIEKh9Dev2Ijk+u7OGZUNiIJHQonoqqjZZOrsVxfBVxDcbog1kFcTmQkffs2MyURfP6p0Dtg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw; spf=pass smtp.mailfrom=gs.ncku.edu.tw; dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b=TU4HrLPr; arc=pass smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gs.ncku.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gs-ncku-edu-tw.20251104.gappssmtp.com header.i=@gs-ncku-edu-tw.20251104.gappssmtp.com header.b="TU4HrLPr"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso699212e0c.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:53:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789141993; cv=none;
        d=google.com; s=arc-20260327;
        b=DtoXRPe+YJsgouuhvFGeKj0CqgDMeiytQ69vaFmXkpDoq1X8xfvpeTc3qmYaRDLbdl
         kMk+SqqHKl0WBNjDWyju5J2NR0rKJWUW7p3hmythiVCVsJwlEXIUMTlFPOc5TLR5PVGj
         GLuVY2xubhi+Yz0n7FLyRNHi6C67xHJ4b5XjRW4cqwykhTcviWF9q2yV4LbGaiFCaRCP
         sW583xxAV0MmJYmIEBX5gosmJ4wezyBgJbt4bTz4nR92qlh3ph/YLsWsUyTNSod7fx4S
         RBeS9ggHZD/nhR22blmQUcfhEbyrmyysWMVQUpXxxyKgR2Crrv9aXQ9ACuTR/lolNbxf
         yIIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1vv7gvwFES7J25+C+0P5Z/9fMTwoyrVRDGhTkAbqC3U=;
        fh=lN38mhO7eiiB5EJ84BGvjCSftWCJUxC8t6NqGWvjSTk=;
        b=NFAuPlA9t4P6tuqoXxMbHCcrbDuVrNVH8T2V/e/ITsV8tIsGxKVfuth1rLrZd2akWW
         QGBsetluFj8tNbBGffF4JmDVJQbERyNlYuDQP15MdE2gykUslA1u6+9fPLOepk2izzFH
         PnaHkort82mMUJqTwA9u0sM5Izfzku7gQnrMKCPrZWz/X3kRFmgzCYSG8KPU0v+65s3E
         lJHy5b4l800wlNMLO0oHE/QrWPuocb9hjobFII9LBsMXqgc/JhQQsFDGbM0W4NX99WMw
         DaZlgfEUjhUzYivsUJgzndWIFaB/Gx4lCd2QKSdZ9AlPoILl7u/QTDI2j/sbwBB7EeYe
         wwKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gs-ncku-edu-tw.20251104.gappssmtp.com; s=20251104; t=1789141993; x=1789746793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1vv7gvwFES7J25+C+0P5Z/9fMTwoyrVRDGhTkAbqC3U=;
        b=TU4HrLPrlHtlktUhdsoiWo4rdxP2ayY2q7G0lhCV1Z56O+wKgWF4FbO87/POWyQT3D
         8vSqisFEbSw/zy5/zznoZO9aPs3wdgHfatIQSbq0D7vNIU23WQ03BPbZfb2P4KzUPcVZ
         jicdK18YP44TNI8NRW8TZ+YRvIP1Trz4yUHbDZC6vL31fQA7aQ276LSSp7/pmYMADvNX
         CVh9hm+hcgw/5BKM2gB2t0+HRIdFIIMbdV5kOkSKPE3IsXVQrigE8FSD/7cQHyOIhjjB
         mL+tqNFTJtZp3JdOwh06TTvGwIme1kTcNfhwxXXKuJCavsyxm1AQtpLMj2U79iMCOO7D
         pjkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141993; x=1789746793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1vv7gvwFES7J25+C+0P5Z/9fMTwoyrVRDGhTkAbqC3U=;
        b=tO8j/aQMEbgoaa25dh1gm4HtrE48iTcPmkA+dAunmkQmind51hkEj5edE0HogLnas3
         dpi4CygoZIHBYkwATAQ3Z5CE3ZQfnomUOb3qKz3X9Cn6CHeRocSGBA3+9a9iU27O7YvV
         RIdCzOmTffCYEh75RXC8xP768CJcNhFpdlNkJphtkJSeZkCZ3vBL+2tqPKnPo6sSHIqr
         NSfn/v3zc+xg9EdhGc1sIv078zXxO84lqHAQMWc4bun3fNTePkdg9YuyIVGWIJyrJjFE
         dWJZigrLQurXN2Jc5xhncKx8gvyrieVBJe0aEx9+pf0dcQalUEcaOpv46jU3cAvbXQ3o
         1UeA==
X-Forwarded-Encrypted: i=1; AKwUvBxf0uFqlvnl3VBn6ccJqlAXW04ewmBpliiiYht6tw3pyTi6Izz2oKsVACXOXH1VNDWwTPW3AeoV6zEHI7A=@vger.kernel.org
X-Gm-Message-State: AFuF++koOWMtbXxduuhKvYK/B2ffNlQ0bjQk2VJQ921yseeNEwxHJ+bs
	e8LrHfAjsUFNt4a26ZnvXIpJ5pjOBqsOT8++eTcgi+JsVPI0TEelWJYVS0kbBBPes1gSDELj4Fl
	oi/gMWr4qGU4Ptk0BdFLLHsRyg59bp1COdf8UWYU49KLhRII2cokyCwfWm8BI
X-Gm-Gg: AYBFou1QcxnDF3Aunc2dF9yWIRPpnC1LPjJrTgoj5Vjl5xy7pyx6sZmI5qTANVp8AOC
	n4Xvf/a5GetGYcnO0KzQprgS8e7Wj5M3jp7dN5i0MRWZAD0r4T1Hjo7CQOFoB/jAPYiT65LQmsM
	kkYSWXWApa+bp3fDDkoVYaRmD2PV/GY/2BgUgMFd/sf4lGWNn3EgotuOnKQfYmyHIa+Sc4W4l1x
	BUVQ5QBKCJNnMU/SSwYVB++6/coGkS3o/NnTRVYOIcxnVeAZE2WJu+I8pOGdo0boRpPYUCNJH0r
	flAuYJaQadkHs2iWX7PVL9z1aQc/qu5KVNco+i/CmjtgXC5pL1w9j/3R1BpekyCdp3GYd4WRndp
	2TQyEVJw/HOhE
X-Received: by 2002:a05:6122:3d0c:b0:5c6:5daf:52ea with SMTP id
 71dfb90a1353d-5c8462d0000mr7158736e0c.6.1789141993589; Fri, 11 Sep 2026
 08:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906145643.219609-1-f64116045@gs.ncku.edu.tw> <20260909180851.01488994@kernel.org>
In-Reply-To: <20260909180851.01488994@kernel.org>
From: =?UTF-8?B?RjY0MTE2MDQ16buDIOaclCBIVUFORyBTSFVP?= <f64116045@gs.ncku.edu.tw>
Date: Fri, 11 Sep 2026 23:53:00 +0800
X-Gm-Features: AcwNN1UWcuwxZCQR1n7msY-EQ_gz2d88U52Op93xGQ8dQ4m1tuBVPc8TQvU3y2o
Message-ID: <CAEqcOowoHcmjpU5Nub5k+YVV1tHb7oX9beoTLE25ho4t49LB6w@mail.gmail.com>
Subject: Re: [PATCH net-next] selftests: net: Add TCP payload verification to udpgso_bench_rx
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, shuah@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> This new option is not exercised by any in-tree test.
> Do you have any special use case that needs it?
> Otherwise either its useful and in-tree tests should run it, or it's
> not useful and we shouldn't merge this patch either..

Thanks for the review. I've added an in-tree test to
udpgso_bench.sh that exercises TCP payload verification for
IPv4 and IPv6 and checks the receiver's exit status.

I'll include this test in v2.


Jakub Kicinski <kuba@kernel.org> =E6=96=BC 2026=E5=B9=B49=E6=9C=8810=E6=97=
=A5=E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=889:08=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Sun,  6 Sep 2026 22:56:43 +0800 shuo huang wrote:
> > udpgso_bench_rx supports UDP payload verification but rejects the
> > combination of TCP and verification mode. Its TCP receive path discards
> > the payload, so it cannot check the data generated by udpgso_bench_tx.
> >
> > Read the TCP payload into a buffer when verification is requested
> > and check it against the transmitter's repeating alphabetic
> > pattern. Preserve the verification position across recv() calls
> > because TCP does not preserve send boundaries. Restart the pattern
> > at the payload length supplied with -l, matching the transmitter's
> > pattern restart on each message.
> >
> > Require a nonzero -l value for TCP verification and retain the existing
> > discard path when verification is disabled.
>
> This new option is not exercised by any in-tree test.
> Do you have any special use case that needs it?
> Otherwise either its useful and in-tree tests should run it, or it's
> not useful and we shouldn't merge this patch either..
> --
> pw-bot: cr
