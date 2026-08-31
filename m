Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F31034B1A2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168176; cv=pass; b=SX3J7A6Yd/9d6vz29pNnzVTtrm0sGgT4exkMKojDo6V8+OZnha+Ypr0//UOS7tjGabQYuCBmz70QsGwxUuuz/it24tMVpsajWDOytHHeUGxsf9X43vjepzLCzuNEdYhePrWPNM52vf1Su4lJerGZoF7B9O+KDMwUrak14TKNO9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168176; c=relaxed/simple;
	bh=5aGYxWzpIdizAMBVvnP3Q8Dp5Aty9zq/HyVAn7/6pFg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=N9f02YKQfL0pcfsuVjeCV0wlyGy0Kdt5rFudL8MR3/t4dD85uFhVzcui13enHz5Fz4REUYyK8/n75NtOO4rMGaRSdKDQAgFV4Sp31oHyQXPcyUhKopilDD65bI0B79ih3wDPou23iEXBbSHY3A6z2WGG94HcvHH4mfJo3VtdXak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1ZPKsxl; arc=pass smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1ZPKsxl"
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-782df51b4c1so2358278137.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788168173; cv=none;
        d=google.com; s=arc-20260327;
        b=EFbs1NdaWwgEz7AjrjCwYg+VlVfaz7WTzrb9AoNUDRfydIJwSDNYQ1RKIgGywjCxhI
         KDoLpP7ugyYHqqeF9XOjIPiIlI9Z4N5yYw9pFJKoRppe53H+vk/OiyDcf/pSUT77Tx3Q
         lPOLert63Vsjn9pvMEgD/f53Ddcn+Sm2nvFyCFvegORWN3TUz3JHVU3DnYsprJSnMiI1
         qZCFWxJeXaVZrVTgvwpia6rHP4JhHm9iPA/MNuUw5A1UoHyp/13YovibWgnsdLLSefXu
         e7wsMQCD7cIhHyMHDW8cKdjnTtdN05/nCyfpy0YvezA3fpQFtL3BTOekYPcoe4/dhknH
         gWyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=f4C8ZMLaV/MISxfV8jvIGrHl36lbxjwK/T0/Dx+yNdA=;
        fh=9futoeHlZr/qqi/b53ZGC9cEDfLwlCOIUwRvUmwB+WI=;
        b=lcNE22wmXH/KfTohJ+cA2i/n815Y38VV8ixV/m+9R5Yx9kXDnP7ufMyKrwIVKxw3qY
         n1Xilvae0SDq5G6jtpU4bv7vymI8WjdnDKv/cwZxO5YUf2C68+VQc1WyLdpz2HLf2Ieo
         mYohA5MXGCUPknqQTsoaaQERx5P10lyxEQtF+5quDVivA+mmLwQIGSuHXnmJCugP4e5v
         hbazlW3GKD060koniUj8da5qd8vCF3UXP/mhf3Ec93dafwknwu+Rt2oWG7G+gxcgWs5l
         iDnpdXnvlkb+NsqbMy0c836N6HV6JHOhHIRoLUxW8nJyO535o80tBqPFlGyyG+UpbnfE
         01Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168173; x=1788772973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f4C8ZMLaV/MISxfV8jvIGrHl36lbxjwK/T0/Dx+yNdA=;
        b=C1ZPKsxlWppPFbVHp2kyt7eVmxh+Sujw4oxhWpOfKJzXqR8GmQKcQ30em4xfK4h/N8
         vidpn3jD5Mk0maOkU920qLoWRUB2/LmG6hAk8FGwf4Ij4KRSo+GHAO0/goRiAUkTL7TN
         88qOHxKJmtXwZ2kDsSOk7wy6lYb2bCnTEJNWVxsTKfur4sucq3KQS6BihOTCPvuyMqr2
         DpMCuHbUW8sbkCGCR/jB15R9/BQSRQJQklbg8SAl0HUyW8Fo7oKHsEZaME45OHD/7fTg
         FRYIJKEL0S7afzhFpbMM/TUF34pOj9x7y5+6LqLMAdJNm8x///KIWpURNA4vmQRMcPHQ
         I4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168173; x=1788772973;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=f4C8ZMLaV/MISxfV8jvIGrHl36lbxjwK/T0/Dx+yNdA=;
        b=mTBHxzGMiwCSGZETygSGwTYXAPm5zUABmStentSTgVwx7loyayFti2APu2Huz8w9mn
         /fqiYk/9NIOyk2g9TLMsCimooRYGO/77+RXR8mpX0s+/XFAoE8giSc11WLA3z/f4SxKL
         1QwaVYj0virkkL8I0nqYEashkY7Q8UebKfTKFOkKro3v8/gCWvUKX1zeJWNFYG8BXV9m
         ZWGO49vntQPdg0I6iO+Q2v/3Z/ZboN4mBXpbhgERp+OD99DhOt1M2+Ty+wf/M2e9UlCo
         cf6LH4REOX2IgU29xJeuOPg1JWDx6eq1SpgNk6QKQf1XWhcu3jNsKNy7cgURBJiIZELJ
         z9Mw==
X-Forwarded-Encrypted: i=1; AHgh+RofxrztYq6mcNE1MRTAuG1olHYWL/kvSYBqPp3hfQWRm9RlQkC79/2U4fZQEw70G2oaTpet5Tamamgcp3Y=@vger.kernel.org
X-Gm-Message-State: AFuF++nwDykIEOJxPQ9Kkb1VwbrAoVFv/ff7ng29SsipHP+hw2UUOQd6
	58GNmZdGOqLVL6xlwIDAOyD651bFWQ2TIuuhdmUeCoWJn3Y+IwaNz1/KjOGAAXqz456Y1xO2HsH
	B29VFA7aZK4fkcW1L2/WbVMXAszmx/aSUco08rnDBqA==
X-Gm-Gg: AR+sD11neUTWpX1uCPvjzTATTPmjf7bBOxYRfTdaG4NUGjAuT4gYJ2Qdms7SJexvHZf
	vXfQWC6Y2v35kHUfon9nK8DXiBXFXmsqn7VYHWMEdCFYNrJBB4fv4V2WNP1ExVjfW0ygGzpDDPd
	7Ft+u2VaQ+s0rwpfi0ptqBxHw3resO/hbxDR81WO5EHox/ZfraC7QkHWywMFbwulZKZA0R3j1kG
	lwOzOzDztv+P657yrLimuv6Dvp0d5UtQx6ht1LJf16ZNn/SEv5EILK9gxvCG4nuQD+Wlpa0oUYJ
	4i+EQND+X5s+g3Tw/ffOAwy8HOfZfVHu3bJvUTE1UWKjHL1qXpGIfsrjg71qAM3SHIy6kP6Aw2v
	4
X-Received: by 2002:a05:6102:f9b:b0:77f:7df:ddd2 with SMTP id
 ada2fe7eead31-785972e710emr9591999137.1.1788168173106; Mon, 31 Aug 2026
 02:22:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Xianying Wang <wangxianying546@gmail.com>
Date: Mon, 31 Aug 2026 17:22:38 +0800
X-Gm-Features: AcwNN1VxHmoqQRhhZsQ23eUyyYFi5HXQVGYoAwjgcjV4ph4CWZUZ2jKULw6WLKc
Message-ID: <CAOU40uDkU0mUvnBv_J7CWPfG-RAtYo579JnF_OezDSu7LPig_g@mail.gmail.com>
Subject: [BUG] general protection fault in su3000_i2c_transfer
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi media maintainers/developers,,

I am reporting a general protection fault in the DVB USB dw2102 driver
that is reproducible on Linux 7.2-rc3.

The reproducer connects a crafted USB DVB device through dummy_hcd and
then issues an I2C_RDWR ioctl through the i2c-dev interface. The I2C
message passed to the adapter has no data buffer / invalid length, but it
still reaches the su3000_i2c_transfer() callback.

The crash happens when su3000_i2c_transfer() dereferences the I2C message
buffer without first validating that the message has a valid buffer and a
sufficient length:

  Oops: general protection fault, probably for non-canonical address
  KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
  RIP: su3000_i2c_transfer+0x549/0xdb0

The relevant call trace is:

  su3000_i2c_transfer
  __i2c_transfer
  i2c_transfer
  i2cdev_ioctl_rdwr
  i2cdev_ioctl
  __x64_sys_ioctl
  do_syscall_64

The syzkaller reproducer sends the following I2C_RDWR request after the
USB device has been created:

  ioctl$I2C_RDWR(fd, I2C_RDWR, {
      msgs = [{ addr = 0x1a00, flags = 0x9211, len = 0, buf = NULL }],
      nmsgs = 1
  })

This looks similar to the existing syzbot report for
su3000_i2c_transfer(), but I wanted to provide a fresh reproduction on the
current kernel I tested:

  Kernel version: 7.2.0-rc3
  HEAD commit: 1137d8b5df06137fb49513cc923b3b24d94cb809

Full console log, syzkaller reproducer, and kernel config are attached
below.
HEAD commit:
1137d8b5df06137fb49513cc923b3b24d94cb809
report: https://pastebin.com/raw/YT3zKcrX
console output :https://pastebin.com/raw/UE2E67ws
kernel config : https://pastebin.com/raw/k2Vq1fKj

Thanks for taking a look.
