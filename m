Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AC94E2F28
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010304; cv=none; b=t2KNW8ezDehDT0WMwDBD9t9aZ/zoS222GffE2puunLFV7o3Qyb5MNcSIrbvNb3G1/1LkrxqkhM0Rgwtque1GzVAnb3jA4sfUvXZDH4EZS2RG6V+kEyJwoE0YcqIdot+3R/Qpl2aBEf7NgUJX4BXKmkiHrJiFpyeVaZjcsZeO6z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010304; c=relaxed/simple;
	bh=UE/E6CwtSRO5jTRXSvtyJcHoke+D2mQVa9MShYJdIN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RUJRKeplunp0uwHkXZXs3XsgiLujvYd0LSkfVJQiTYgTKFluRBeq3KMTPY1SMdpNK6xNJ+H6Z05ok3KRd9KCtF1NWqDPvw4rMoig7Mpp0Su/hd5u/TioGsIcD3Bm6oIRQkhUe8TuvxBl4f/gY04+VI/Hn0gG62r1VWacVsSz1lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oQs6olMD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oQs6olMD"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39dfcef2896so423817a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790010302; x=1790615102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Uus09vYPEXHFApWCOovYoZZLizLBAtxcjeR9wZ/FY4k=;
        b=oQs6olMDkgYai7RNIo5dyusYz7X+5LUrKNH13iclFv6tXIWrQgaZ8+7J/5iZ41h3oa
         4fAbJDp3Hgnst2HJM5CJnkKSDBRWqUMuESuvCZM+3FR5gUuH7jKHWDuDKE9AJnloMktc
         rGyxh2QQ6G6FjuIkk4QldRtsb7LXNt6C19R0bTZWE2CUx57nqyGNwyJFd9nT3F1NsHPA
         OBs0qeauDUK4hI9A6Nc1xraGp3V+Gbdrb0deVfeJeYC3nhBdsmQeLhUw+X4NR6cLBEBa
         WI7+fBBZ2FVRKPtexU8Z553LunxzYy6C8U84oTiy8xpOBLHuJk7vfNCSfLRSv1V0YMq6
         iHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010302; x=1790615102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Uus09vYPEXHFApWCOovYoZZLizLBAtxcjeR9wZ/FY4k=;
        b=2X6osWYg9Hq6FVlZIwUOHveSraRECXj79ANaJL0AqdKxdW4tsHfV91JdxvT9U5Yvu2
         Jvxh9hsJto9cj+bnMH/pRGbFVrmBRlsnzdRxtMT8nkkJFJXukcndAa1e12G3zbLH9Igg
         pNdu7TuLkhOiADo3VMdT3uK2cDELT5PmFcCYgNBdAFsIzA/GSEn3ncep6G33o0QDLx3b
         WwiwNcnccG4fD0voGnoT3Syrfd5QCVlutVZp0Y2827lD0bLFCjJusvtaIUHifhAEherx
         99BAaL/Wq6wnbrP5o9MZWWC/Vw+5iB7REazvGEJGMUXAWVbWjck0DMSx2JaDhmXD7cBc
         A6PA==
X-Forwarded-Encrypted: i=1; AKwUvBw3IBIIdwmLwxkMVffWKVPJiJOG1pSQCKXWMNIsBSJdgb2n/E6j7n7NzPpFcOCwRCDCbfT2gLwYzxl+FXM=@vger.kernel.org
X-Gm-Message-State: AFuF++l1T0ch1o+JLj3qYdGWeCMomg9r9R8+G8t1/vxGhu3L8XIWzVkH
	+A75YckZ3BKY+YdJTGAduDgPLZg5DcgFONc//3N4kgrvQVUEDiJpged5
X-Gm-Gg: AYBFou2O1qBMxHakGi5cRDNkh5csCMV1SElbTDGsxol8XKk11N6VCXcI+EiPsfHach/
	YC0RNXpZFloVTC7VYKJ4FrvbuO3nlVrSbemt+wOSezl+Gq/DUjKM4wdDd23eZOnbc+sQK0xYTqQ
	dv+g1DUx/i5KaS9oxP/NXfLYhJiy2FE77HfEPcSgp0Gj5vMITnQf8tYRzeI+yufQ0O0NVoJgV3f
	xpOXOGh9K+mJEqmPbJVeTeU8hOdklQ2z2Hs36N1F/n8p83kRpO1jnxjL6+siEMvkNdnWIVS00t4
	gUyq0ySZsn3mjCCGY1neuDjhkz3lceicmhwp6X5PWHOnJKAVwwSTTZxphot+StNzxLjhP4cKozB
	uGME2Mds585iArTvrL2CPlVGuelfGE9Xyd8MgWRo81oKLvI1iEcoVQItDfxk7+EH/hRpVGNw5Ny
	BBVxVkW5AzWK7ELvcoQv5lEjZrl1vtfOAhzObId1Uctb5U/vUDWWtHXl7Q566xusUdRUfggoVH4
	WnEyYHcEtBHcu3VDNOBHlqRi6GGOaV2DSNSUa3amOMeydPkYH/rSrihUu1MveKIR3cP0tf/piMv
	u9ueJp9WhKfiCQt29a0j
X-Received: by 2002:a17:90b:254a:b0:398:a2e4:c784 with SMTP id 98e67ed59e1d1-39e5940c49cmr20845132a91.1.1790010301926;
        Mon, 21 Sep 2026 10:05:01 -0700 (PDT)
Received: from cachyos-aura ([45.112.148.109])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0670b410fsm240975a91.9.2026.09.21.10.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 10:05:01 -0700 (PDT)
From: Navon John Lukose <navonjohnlukose@gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: designware: size the RX FIFO threshold to the queued transfer
Date: Mon, 21 Sep 2026 22:34:56 +0530
Message-ID: <20260921170456.53354-1-navonjohnlukose@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921120526.GV106095@black.igk.intel.com>
References: <20260919232647.448748-1-navonjohnlukose@gmail.com> <20260921120526.GV106095@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 02:05:26PM +0200, Mika Westerberg wrote:
> I'm slightly worried about the latency increase here and the fact that
> HIDIOCGINPUT is pretty much same as HID_REQ_GET_REPORT so it's not only
> hidraw that is affected but everything else using HID_REQ_GET_REPORT as
> well.

You are right, it is every HID_REQ_GET_REPORT user, not just hidraw.

The main motivation for this patch was cutting the wakeups from the
interrupts, and I should have made that clearer. The /dev/cpu_dma_latency
line was just to measure where the extra latency comes from.

What the wakeups cost, measured with a 21-byte HID GET_REPORT at 142 Hz
pinned to one CPU, display off, 32 reps per arm in randomized order:

                        psys W
    idle             1.87 +/- 0.28
    patched          2.53 +/- 0.17
    stock            4.11 +/- 0.44

Against the idle floor the polling costs 2.24 W without the patch and
0.66 W with it. Paired saving 1.58 W, 95% CI [1.42, 1.75].

So the added exit latency is the package idling deeper than it can when
the controller interrupts once per received byte.
