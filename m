Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793822501;
	b=Q62lBKTRwQJE8OfdAbQvRoCu9FSUhNboHDaW+96cJFG3E1YF///SqBEgCEe0uiDmylVV
	 f21z7xUqIDX8VicMFTNLYAwe9d1/21RlrnaPsRkEu9D1K5vvRpKqjOF3LJg0W4k3PCdgw
	 wcLIa0/Z8vNihzKgoPT20ZQY/X410LJk75o+d9qTy4Q5ozz3aOZ+BIjw2I9MRT13aSY1A
	 8D8JMMFzeC0MXQiNK1MeU7gnhu57zYW4wxW5uLmdsLDKfZAezDpEtjME97JRjoMOYQS7L
	 3QLOWiyoFGVcCHzu7t2BdApE/0Sk1hhzHZVAcM/Yt16FmmsBYZY6v07oK1FxoaZGNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3BSS+uJc04js/YlB2qVs7at04D+tMWzUSOIfTvRJOps=;
	b=POc+f2WgclSzZTYH948r9WacCoQOCRQpEEbfL8I1NRgI+Iixivl29bwsSArPghkQSZEy
	 LijBfBqMgXVMHAK7kk+aaFnaU/3K7bSBgy1bKCHyG4g4BYiHSgzQVht61Fk3i2h0Zf5dt
	 O5TQNUI6OzQu2YZ4RguRQ9mjIpz01wd887Ol7DTOQkxpY7aZTlfuC5/qGD15zBf5w+oya
	 noW964+Ivf3pyrP5fpkCr9K4kV66bYSTgyEuYyNBpGozf9eElFmzVBCg/Vg53EP9EzU+P
	 YwRA5Zq/NqIT29oE4D5bCLwHsLAxXTLovCMGE91mRViyTHMLwKoLA1aAlQaAQZTb0TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmE5KnUD;
	arc=none smtp.remote-ip=209.85.160.54
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DCB606C930
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DCB606C930
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=bmE5KnUD
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4a76f63b243so1728487fac.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1793822499; x=1794427299; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3BSS+uJc04js/YlB2qVs7at04D+tMWzUSOIfTvRJOps=;
        b=bmE5KnUDDSUNAo5PA/rfmnfnOcps8vdIDjZhxxwhhn/wgpUKSpm/yFbj4tuIWBnZw6
         3mlCHtwT5/qbzXi1AhF8JzgjcfBYW3PYmsRV1hdlcaqGtdkEMp+omN55ZUC6QtQ/oQgM
         6feo4q36rTZeidqcQmxK60wJMtCwTtncRZ6Id3xq31rQKnp0jqA1bTfZ0LyXJpLqpd34
         w4aaQ9lk7XFUi2rOHyNMXkQXNVCjYQ6+T60f0WyXP1X1AnOcs0AmD/7ezYbUqlK5h/tn
         mnUVTw83xY045b5/K3sdBhZazT7jFYKQOh96f+laLpT/51ViDiHPbBzj3J7GvtFoySE9
         qZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822499; x=1794427299;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3BSS+uJc04js/YlB2qVs7at04D+tMWzUSOIfTvRJOps=;
        b=RIjPLBjzOEDKiGzgess3oIuSCkbzACRYOe4qzAofModGnepcveVwva2N2bt4zn9IRa
         mlnxmVxeUCxquBAIy9EUhL+Mtp7B/lLB2LBnRTqB8Y0x0dmiSpXGaOM/cJKku5H1NSXh
         zvyeWyAMV/LkeBt0Pd/LU+C9Ot2UDDQZDp/dmxVqjVMGVoHukOmegW7d8/2C6ThR3QD7
         yqNTMeTvEcvZyrCmcn365ToadSvajCMFf9FUKVzgEf1cNXtyW7vrHu8xkNM1O33ZxAwr
         rsrlIrKhozRmWtECWSXnfhIVnz30q/ulfuYKS0Dn22Kyi+Al8zNyAtcBLpfW0g1LtWWo
         DYTw==
X-Forwarded-Encrypted: i=1; AKwUvBwOP9Pp7WbzmDO0d/tkhu3CFAkFbKGP440GDCeEUXWeGUNP1gCycyVy18m4s2siNSGO1ZoJefYlZW0rilU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+wfxzT+F1RFyVqahUgmbc0Il8gAMJrzUftq1rNgYzF5B3MdyJ3
	c5saj7cdW6wn+xuFG4mr5mN1atINALePbYt/TXvbUXjwzZd//FehfNHVAgxwDQBUltA=
X-Gm-Gg: AYBFou169r3Z+Kx+SpuACl9H2ld7aFy/tcmsvkl9ryTxzywRRhNaB+zmaldro4tAR2P
	8ZK27MmCbY9Fp7RkAnZx8waUqjBpUfoYpI8nxeaTdfbyU8q4hNuMBJ1oeWlRSz+mdKJ9btk2Gtp
	VqQ/sRvM6adrvjRgEa0H+/VyLWuk1B2eGuuJCsAaY7k2jlyhoNhZ/LAVRglpM0lCtfnIGMzrwMc
	SjxiXAgeAPiuBtyiSARsl4soYL1myQwQti0ViGsG1MtB1UBsp/RXHKie1NmIk3c4BWvhmvPJECx
	bcIksEtffzz9jxwBn3qwP71LiM6nJpiQDJ2eLSK4HDRtF1LheUx87kwU8ZL6Wd7MufIWPzBeKyt
	Eids0DvINmk1caZA2ZIMyh1r5x5/ahZ5w+31chGfml0cPh3mVfhtE73uhJHxkcb9K01enYHCgKg
	u3XXbtIY1m7ZpWbfpCrbA/11LNo91SX7+sW5EVC+wIZwD+sOi6Btuwes9wUDHWPCUAEY1GQelO7
	8ebIa1OpYXp4Ldut8lMgmH9TYXuYz8r2c5X9tLsgMGitZwzk4O88ooydhnXswx6llmRPOmL0rY+
	eNAeg9VVK2QiBAE/vq8KqO1PAfsDXT0tjOC62JG6TBopq8VXlI9J1yHM+Y8DrpMY9u0ixIVpBwS
	YrKGSmAPKhw==
X-Received: by 2002:a05:6808:bc1:b0:4e7:f052:460c with SMTP id 5614622812f47-567be3b68d5mr333629b6e.23.1793822499034;
        Wed, 04 Nov 2026 12:01:39 -0800 (PST)
Received: from [192.168.2.38] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f400fasm2430983b6e.8.2026.11.04.12.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:01:38 -0800 (PST)
Message-ID: <641c7c0d-0455-490a-8811-e6eda728a7e7@kernel.dk>
Date: Wed, 4 Nov 2026 13:01:36 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: reject completions for requests that are not in
 flight
To: Mauricio Faria de Oliveira <mfo@igalia.com>,
 Keith Busch <kbusch@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
 Chao Shi <coshi036@gmail.com>, kernel-dev@igalia.com,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261103-nvme-double-cmpl-uaf-blk-mq-v1-1-b10fea474423@igalia.com>
 <auo5a1kRTSWsAYtF@kbusch-mbp> <352cfcec6865cbf636a22442511f16b1@igalia.com>
 <auo-v5ZliGbM1Tiz@kbusch-mbp> <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <65414ea51d23fdbeb5d8b7bb4bd9d535@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> I agree that a device in this state can't be used successfully, but the
> kernel should, IMHO. 
> Say, in case the device hits this due to firmware which needs an update,
> the kernel crash might prevent the user from applying it, in the first
> place.

OK, now we're really reaching... If the device is so buggy that it can't
even do basic operations without violating protocol and crashing the
kernel, then there's nothing the kernel can (or should) do to try and
prevent that. We don't cater to severely broken firmware or devices.

Please stop all of this nonsense.

-- 
Jens Axboe
