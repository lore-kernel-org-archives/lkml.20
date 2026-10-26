Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793038400;
	b=ERQVcYdnRivRqePEtJUCm2i452M1sc2A8oKjAgfw364eBDEvJqr9/t/RINeN+Nqk5Rii
	 EIDnmBhyZPPnfTGrPvLtB59of8mipBR7rrs+yrs8KYPVuAQYdUP4+Q9RHtrVWUUTIhFVC
	 GT2CVGd/ziaNzy1AKBq/9QU2rPyAbYneMRQ9QHtl3zwI/8nmMFUW7FEKVtfk2TgYRj/tW
	 ymNH2THfo6qAxtStWy64iDR26NhMmkNQSGS+FQE9G2QlhrL+xKOEYmCYyfOZILkE4FKyb
	 ZUEWoeCvFwEP8VMvQfbDS607wqcCmh2XNEgKF3lhLnw5NHotenVLoPKkUdgVYOt8dPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793038400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer;
	bh=BGZxAd03i/0YaHod1b+jkyBQpqIXL1mTYVcUoIY96ws=;
	b=OxjLHIdxl/7AGD2PgHuZqguYykWq847SkiQLrj/ouUL/GUkqh6/UH5fqVb/dBXOD1wAp
	 e9xV0g/Q1FD282ds44RpPU93CH2LuC3MqFSWaun8btYPgp+8xehAkqTodRnpcjr41vANX
	 wxTLMGt2YhE1TOH+wtvAmk0w750GBtRI7qXPfUVIUk5UktBI2mDjlCRkpxWx85Wuls6YY
	 okDfFldYJ6+RSZmG1kd5nAvEHg2P4u/zRxoRL+d8Q2OrDJuWKadw7vHz2sP21Ne6XFyHP
	 PzJ/6MdEacFln+KhbXhPyPsxcaOPCESYyp5chuaaAXkpbn0nlCiKroKm+dezieU6OVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mIc9FYhy;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C4606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 18:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=mIc9FYhy
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1931ff67a29so1465356c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1793038398; x=1793643198; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGZxAd03i/0YaHod1b+jkyBQpqIXL1mTYVcUoIY96ws=;
        b=mIc9FYhyzWaYR5N6/tWYI0RadP0uQbgwAcPY2pWU7GWToD+eIc6TXd26yUsExZMw5/
         N9NS8qYKOQVKGBcTyGnSJst2lhOIrNU8SorUNxHJ7kzbcVftxGo4VAsLRwLqMSUuo/jh
         jz2OZuaQnCwVaqxAyLpTHxilf4yAxcVZeME2NuM09dUkjKuIOkeHKyb+luIWhqt0ukG6
         E2MCyWnUgwWl5ld6CYwDXPyfsImc0TvJrKIWjNQbYBbtnUNPBcAbuGLWwcoysd2l2eIX
         qh/9zx4XItyYJ+Flsdt1zCKsZVjdkb08FJe+gaBy2fTiDhitJzwuRRLwQJQ2ydE8j9JP
         ZvNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793038398; x=1793643198;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGZxAd03i/0YaHod1b+jkyBQpqIXL1mTYVcUoIY96ws=;
        b=MPypgwIqlpBwtTyYhKvt+hhP2/0Q/IQOuHpzcTD5XbUFhnvBPA3/RPviic7/QYK0ey
         PkORqfA8qSus/p36uoyqAuQAdxUYhJmwXe7mrx2s8d+Rjfr40iHdf7/SxuJLE3KgXvwr
         Dz0x5t9SPAGnPZj2UYNKM5d1XQ08pIZZQD+2JEtq0tsIWzN6569um5c3kDIg27BhxTvT
         vGkK2XkWacaYFaNVd5UJ9WMYrTAhjiF/vRCRUSYpYAVzQRG5z8OCSMSpTxX9bDR1yHBh
         Q43Wnh5/5Zqmdk1HpxPRWm8lAsqqXF58wYczVDwtoYJIg80XPX+VJ60maL0PFWptL5rS
         aU6Q==
X-Gm-Message-State: AFq9FYKvVXdREDZ+X2PERf48GbcbwWCz+yxi0eBUXIvA3ldI5TL/ea3o
	SB0G9MDqWOpLOTLbU8f4C0Ak0ISqYLXTcNDUXgCQqD8V0bGRMVrPcMJAl2OaQ/KY8M2G8uUvP2I
	uECTzNxI=
X-Gm-Gg: AYBFou1DSxvytQzSdt71pgH/J8u3pNtfK+JeZanO+gd3drFR5LHBvl2fSuEV2fedVeQ
	BtveHW+8Rv9/lZpMUwlv+T1C6ygLgCD6vEyv2s+8tBhU4NuQ0Y2RUXnFNCiKaiG79PGtprl+Q5s
	DUmD5VACPr4Mc32yL/pjksbciXJC1TvcBOhxcdJDV9uXQuCybsgwyPVxsZ2dTPBUzjpRhfZM6zD
	mFEoAT+hpM4TvMNqhJi1B4vLtcGVl5t+gP7sDzFvfLy43Z1uHvfo9hhja7dy6dmSlxSSRSpukJ+
	7nqzwDw6iusZ7VUk6/Nm/GK1zFAExlAxD6G/i6JfxMyr66Y6H8pcMYvHvEzJf8xt70FfO4GtUbp
	zcAx12wSs29sEqYotXBa2/96zeq57lZ+PnOmdkwald4CmOBtVMvjqbKXLfT+m5dQcgCmWCPmnuP
	8QJRKBVbZLeUFRoq/p7sd96Whd6PY1az1YttF0Gc7v1LqcGMFzHin2FtdL1VmlnNqg8tDXxU+ZQ
	lg6zOIPNYG0uNsmkjyd9JZb/vkTO49VZwIa46YDrxVevvP4BocJ74+5gxIHvo72xzqp+HMKp/Jm
	D00kBaBM4FB8stCmG3AFMdkIMC40pzfefbDu2vA=
X-Received: by 2002:a05:7023:885:b0:16e:6e3:9a9f with SMTP id a92af1059eb24-1993639e6efmr13695821c88.34.1793038397474;
        Mon, 26 Oct 2026 11:13:17 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm23576455c88.8.2026.10.26.11.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:13:16 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: io-uring@vger.kernel.org, Yichong Chen <chenyichong@uniontech.com>
Cc: linux-kernel@vger.kernel.org, Pavel Begunkov <asml.silence@gmail.com>, 
 Josef Bacik <josef@toxicpanda.com>
In-Reply-To: <20261023091711.83481-1-chenyichong@uniontech.com>
References: <20261023091711.83481-1-chenyichong@uniontech.com>
Subject: Re: [PATCH] io_uring/kbuf: advance head when a pickup empties the
 buffer ring
Message-Id: <179303839621.792754.2729531624854221506.b4-ty@b4>
Date: Mon, 26 Oct 2026 12:13:16 -0600
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Fri, 23 Oct 2026 17:17:11 +0800, Yichong Chen wrote:
> io_ring_buffers_peek() flags the request with REQ_F_BL_EMPTY if the
> buffers it picked were the last ones available, comparing head to tail.
> When the loop breaks because max_len was exhausted the buffer was picked,
> but head is left pointing at it, so the flag isn't set if it was the last
> buffer. A bundle receive then retries, finds no buffer, and the request,
> which has received data, is marked as failed on account of the -ENOBUFS.
> That severs a link, and ends a multishot.
> 
> [...]

Applied, thanks!

[1/1] io_uring/kbuf: advance head when a pickup empties the buffer ring
      commit: 8742f4b5a472c347fe568a73468a2d9e4d630b33

Best regards,
-- 
Jens Axboe



