Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794528319;
	b=ObHKyf4ATUQg8nGnEoiGMZY+Dea43U/QaoczS65irkwvH3btPONDHrturVr3H/jiUlx5
	 k1ILU4gVGskmT+LUX2qeftXCmEyPzr6OjevFUTLehxD7WNckBAAjRQpWkqzpN5/W2KE0O
	 QOIkwfn1CftuyHsZO452f6glgux+smS8dUKMcKWoPkfLtgCEN6YJgSdlXYm1Hx1jXVNqR
	 HRS8kCZjQoOkOi9wut5WUgQ3rxY+8Pf0BDLdKJBvqPeR3oDHs8+LlyQt+V8gJA7gY7y7m
	 tljnYIVcpxSglBTumEjWqNPBXOuELL+Q3H5j/UKHmnI0T0saBVVwboLvcwNZ1tjfJEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794528319;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ZP7w34GShAuXcCWiodI7YmsdXNmvF5TzQf1yjJvKrG8=;
	b=d24S/wxvXeTDj6kUb0oIbquXz2OILiFoRb7AU9m4llxWH/DHapNqVtmdOqyECrIzibdh
	 pVHxc32WRz7urO9jH7BDb44vua9FjvO8CAYNRqQ4XalFIqyZsPfNuKc4Xupz+nMUXQvpx
	 /YTecqtmAfVfnPResLuzxjk12tXB2diCjAXjj1Leohn/GzX1QbfeBiqSJ+NIzo9x+/0sh
	 a4NXKulyIo0WPEhhqfUY8rDcfFmBrftH36bsfBWvwwbKiuoe1wMyFL9fY0YDxc44iCyHG
	 8K9juynRsdIBwryoYwdCY7dJBPNpiFgkPb08VHR6UMqwlzKWgtvxiCbZw3P1JSzIoPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmDmIqDs;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C38606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3C38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DmDmIqDs
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7cc3eb09dd2so80504137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794528318; x=1795133118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZP7w34GShAuXcCWiodI7YmsdXNmvF5TzQf1yjJvKrG8=;
        b=DmDmIqDsd3KGpm3pYfSBm6QfRSeIJaviqKbucIixjaB2kq+0Uq/HX0AqFy02tySaaa
         Qasz/xY0ZgxEaiLqbAmrfPtK8sdbsfG9DN5C8SYcR/++KtBTGbx00Bbvc+Ak6kUYclTj
         bLBS2xO10lpVwFda9Abuk9p6yYUi/hYA005qCZtVscxZENGD0FOgt+r7Dok96HK1zf7b
         oF2K6A5jk/ZYZdCHz1yI2OlArvWk/HXMFoIC8kBl3ssryTugnB9UXOyMZvA0LIMc7V22
         JFDZmNfldjBnPKSzdsK5KnSEQdhHWfv6cpmHKJbbrqn3ZzdKZMFwBoHJMgUPy6a4AAbC
         6s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794528318; x=1795133118;
        h=content-transfer-encoding:content-type:mime-version:subject
         :references:in-reply-to:message-id:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZP7w34GShAuXcCWiodI7YmsdXNmvF5TzQf1yjJvKrG8=;
        b=jy9Tznbxr+oH+FUiJEGSObGvvd5u5wcb/+UjtKMJzS2WRVPWIMOlrljtz+tWZjRAVG
         pepFDYhNTMJ7gQ53eQ0JtkJiw/ejQrWA0rKeYlNouzHYmgdzhuZ9FQ5SuMi2k6G06r31
         vh86n7GCI3E5cIs3H2/C03xJK0n3Fb9ZZWXPWAZFgUyTAATzetItMkybeXG6HGS4zApN
         QLJL8/dlGibm1S+IV/8PYP2xRwzNqC4lyydoQhyS1OiI7qJ9ctCY64f6SWJHazMu4CNI
         zoOyYMLOolsmYYCKs8p+92L6bxvKcikQOzSM6Rw2BX88m74BMOoTM73QeiQFmrGrpIdU
         xWdw==
X-Forwarded-Encrypted: i=1; AL+hErEzacAKSBk5BCfhMwgwXy+JJjl7YsdSrswiyetuyJLbEOBZSthXPPjyIGQ50Ad7hpOrQugBVFBGRFYakww=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZxktAEEP+VLXy7rykihp7worzwPca8YUhxWVli2dPC3ENBguC
	P53AQn59XRI/PjGPdP3iNwiCUAs6WpyYJnt3kAZHAiS3fq/RooUo2bV3
X-Gm-Gg: AYBFou30NIVJpMaKDfMiDLBAtWe7qX/zmKpjA7hK6c2DZRfQFD6ZpH/bnIUBS+U/9Os
	LrytMoX7khItfw0mg5vBak1r7/iCxcU1jFG3Q81w6q/sIY/GAGvlqZpI7n5Aad2PF+P0nZ2wgGg
	PP/UiE6qyCXIkI2Uh/EGi3FLvizH40jCPnyZZlMDr/tsYPF3FmD7qvbJXrjzl3N/1qAhuD500Zk
	YcwOTZ7r8hJM/1ATrkl80PMUoZVjanXeQ8FNkFWNghkO3xwW0YFVQTqfcE2h4VyJerFIggIBWWp
	YgrP1+xWUSGfZgq4PhWpB0jWos+7geP+u8lm5oQu5ywbEUb5cRj9k8uksVRC2WdyDtbSo8Zv+kY
	WP7RYQ6e70tZje+ise+NEqUgEg86nPNlL5E/UrvdoOqSSMN3ZvUwlaC/LFN5PPM3pveUYLMO7UB
	M2GbqVWDbnB5z749MoYsQqiF2/Fql+yMxm6C4v8NxKR9M4ncJ8hLszmHzuXixzWA5MUIgyOqntP
	GHcqkJeFx77Ca0luPYVpBrJoEazA35fjGfLYIR7D+jQHQMSQ7yYThqD/dw/M/kVggmgyt+fOPma
	QVAJvMQP9PQ313+fG7OeutTWPTn+EHK4lyzxc5InCSF8HH3B64Go6hUb2Lzx+PKr7AdlrXW2tvF
	wrVvxOwEnBrCZq2va78wNe0Wshy7+BCTKUyoJrbwWmdizZ7RN9ZJT13N7vXKSRN/pCB0o/KGIAJ
	Ua625mRXfm
X-Received: by 2002:a05:6102:32d1:b0:7c3:a6f0:99cb with SMTP id ada2fe7eead31-7d64db100cbmr246150137.33.1794528316894;
        Thu, 12 Nov 2026 16:05:16 -0800 (PST)
Received: from gmail.com (15.60.86.34.bc.googleusercontent.com. [34.86.60.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c8424fb8fsm546119241.3.2026.11.12.16.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:05:16 -0800 (PST)
Date: Thu, 12 Nov 2026 19:05:15 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jan Koester <jan.koester@tuxist.de>, 
 linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 Jason Wang <jasowangio@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Karol Wachowski <karol.wachowski@linux.intel.com>, 
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Jens Wiklander <jenswi@kernel.org>, 
 Sumit Garg <sumit.garg@kernel.org>, 
 Christian Brauner <brauner@kernel.org>, 
 netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, 
 op-tee@lists.trustedfirmware.org, 
 linux-fsdevel@vger.kernel.org
Message-ID: <willemdebruijn.kernel.31eb7df44411@gmail.com>
In-Reply-To: <20261112153841.1661720-1-jan.koester@tuxist.de>
References: <cover.1792552161.git.jan.koester@tuxist.de>
 <20261112153841.1661720-1-jan.koester@tuxist.de>
Subject: Re: [RFC PATCH v2 0/3] uid_r: convert tun, ivpu and tee
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jan Koester wrote:
> Hi,
> 
> Building the UUID/GUID id RFC (uid_r v2,
> <cover.1792552161.git.jan.koester@tuxist.de>) with a distribution
> config instead of the one I had tested with turned up three users of
> kuid_t/kgid_t it doesn't build with: kuid_t is a tagged union now and
> has no .val, and it no longer fits READ_ONCE()/WRITE_ONCE().
> 
> 1/3 tun: TUNSETOWNER/TUNSETGROUP write the owner and group under RTNL,
>     tun_fill_info() may read them without it. Mark that read as
>     data_race() instead of READ_ONCE(). Only classic ids from
>     make_kuid()/make_kgid() are ever stored there.
> 
> 2/3 accel/ivpu: the per-user context limits are keyed by
>     __kuid_val(). UUID and GUID users share the (uid_t)-1 bucket, which
>     only makes the limit stricter for them.
> 
> 3/3 tee: the TEE_IOCTL_LOGIN_USER client UUID is derived from the
>     classic uid. With __kuid_val() alone every UUID or GUID user would
>     get the same one and could act as any other such user towards the
>     TEE, so those logins are refused with -EPERM, like ublk refuses
>     unprivileged devices to them in the series.
> 
> These belong into the series before the patch that lets kuid_t and
> kgid_t hold a UUID or a GUID and will be folded in there in v3; I'm sending
> them now so that the reviewers of these drivers see what uid_r means
> for them.
> 
> Jan Koester (3):
>   tun: read the owner and group without READ_ONCE()
>   accel/ivpu: key user limits by __kuid_val()
>   tee: refuse user logins of UUID and GUID users
> 
>  drivers/accel/ivpu/ivpu_drv.c |  2 +-
>  drivers/net/tun.c             |  8 ++++----
>  drivers/tee/tee_core.c        | 13 +++++++++++--
>  3 files changed, 16 insertions(+), 7 deletions(-)

I only received this cover letter. Also do not see the patches on
https://lore.kernel.org/all
