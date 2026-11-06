Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793976539;
	b=guAYAGoCKG67EGjedLMciosLV5Z57ov6Rosu1bqeXFNf+Dzs2FCIVfUaukh9qGtvEOnf
	 i+O/EYUZOE3q75UaCFgz1zyajaRsWWhNKiOVyChPh5tg7a6Va5b0eEEzQOh8nO2DJAbpY
	 zdSBoC8IYi/Hx//jVQRck4dhRXe8PHbzAdqbHt7lBTlsTlBCqw/Ur2TYd+EwIWxZmxqsW
	 bRUDeeTXh4GBLsXvtN7lDDlzcHSJjDSUMR7AFFQLuNZ6yzGqcVwyt7NqDEOoFbnyVZ0tT
	 uwCuBx+GBVUQa930souInl7r2FgEvAIUdQ430yeGv4bRE1x9rwe82q9VChJHdFbn2tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793976539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=KmBUd9exzk7mgN4IOC0euSWsN74BamsE8FTjSoZz/1w=;
	b=x14KcSEdAEIfxQ1ApJ606pUoUk+QL42wYIHGJ/rqG55nJyibgbsGffXn+oe5TTeopmAI
	 UaVCj1SBLpi9nvd1+Uhgz/Oh2zpb3zEZU+J/rP+wo0XU9gnRwas+bch+PQSpw9wipvvdC
	 Rw7HYvWcDsel1ImNh2LVyWu9hNFq5aF1t3rlzRMZ59vPsd0SOWLmM0cS+oQLXJsTmFY09
	 NdOahuTGKbM27yBeKJzdrNJB0WSbYBh/ENZRDrxPhyhGzeBP3b9dPvI6G8pVbbmk5hUK+
	 M7hPBXjkQdHDjXfq7YRXBVZSr7OafCcbP6xkpkSLC0OWkBeVnTdgrQJ3OTTQXzoXPIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nI/43n0C";
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11E8606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 14:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B11E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nI/43n0C
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-15ea896ddc8so1335559c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 06:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793976538; x=1794581338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmBUd9exzk7mgN4IOC0euSWsN74BamsE8FTjSoZz/1w=;
        b=nI/43n0C+rFZwHbfKiP50Gu300gQvTOeFIWjKqmN34VnX/JLU7Li8hqalh4NUxLjsM
         oIxmexytObScGVnUv6DB0KjflvOIYxXL/EYoMMziP2EHLhP+GbFHLVh2FckeqZqrzk9I
         6eMzsSxLhaFSe1f98VDrI/NZRk18wB8os3kDtC9WypwpDkb00pRyc19a86Hjezhf0smo
         sc3kGMhfiny29tG8v9nCo0NewknL8C0QP17LkjKIr5MJpkdhQ4Ht6rkZ1ueJ9OjdMogH
         hvrRN9h0/2iboJrOuyYesanUF1huR9rbhPAsCRGmWDifgKQi1ZONLLODvHmTpbrF+mWG
         xCEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976538; x=1794581338;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmBUd9exzk7mgN4IOC0euSWsN74BamsE8FTjSoZz/1w=;
        b=erS+o6qwa0V6WchniNRTB5KJ8GL07ZDYsxdOBUrLp2IP/8MlwotoQbr7SuFNDMv7kv
         WelI+5+5n6hHEHE103YxvzbBfE+5yTEop8QM3ttXRoGbsuJ637y9k9BZGZf1OZJZ9H7N
         QdozfKw2r1uda/4EHPBZg+giz6MKjHMxXVII0qg4Aj9ubYMeKiXGgjO5hanMsLZmVDf3
         kDZ5FiTNbVrv812UlOLLou2AjHJwfELjStfxSruR3d8dQWKzq3X2N6Uti2b0kfA4FsHg
         ZE4oHLknGck+aLioHZ5LC0ALEboLteorkiIn7XP6uL+98Bg0U0dBLXOeUs/FN9CstlrH
         bo6A==
X-Forwarded-Encrypted: i=1; AKwUvBxSjX6h2co3XxpHHwYFbnEiKaNTCgUSbnjJTCfSIvQyCD0JMSoFxLc4Vtp5+a0HlrqnvPZ8V7D5jbwnmNE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SjE27lQvdx3aNMASnZ1m7m0G4kZkRtQhQE6QgwDQPd/iPSiz0
	nd8NQC4y82ulnNv5Y7QItcSBPHrO4x7j+S7qcDGJV789VFC8HBc5rtMz
X-Gm-Gg: AYBFou2uZLH8/PyuQwxUenFJbW5BnIWoO7K90MnUUn0Nfiqbcb8JJrHLuAVnbu61VZ8
	0OVZ4sJfHGt7U21qgu3ot03K25tTcvnic+6oQiIdxsduhQQvRvfHn7GYlKBwLDDLALhO3vHEiAZ
	jPDjhRjF+f2mq0bHowvdRlGpVkgoS6y5LX6lZ0FYiZC2pGAh6YkHatJCJSLLiRi/bqmc4JsLACt
	lRsVCX9jhSyEuQBgSimMlf/2WRUGyUdjsElfrC6MsiYK1Ia7zJ115LPP4jAbVfgNG4nCr0xU8MY
	7419oqGKsaIMgAAb2V8d1pvlEXfSB1X40oRs5ivngbdHbnU7os7dS6hQi/3BDl7Pb9HUNb9N8qz
	aWKputEz+cFyc3wShlDNMAD4qGquFxit00/6fNTkvknk2l+3tAHBgXE0Cyn0XscHHMz2NGXqvqL
	lsEYlYF1EDUyiPLFbxSXrjVchhUiceR+oABG461BLNfvTf+PZ/Q9rU/A7p//2cnvv9oXxQYW7+f
	0B7dflK1YIE3D9FnfSZy+V6KYYdXlN8ZDzJwBJFU2Jf3LtMuZBYKbhFPW0km02ZKPT/lFkm0BIk
	8cHrBjrK3eSwMdw76gKHQfP/HVCV8k+gtQ1eBefOjgS6ljiPg9wQXWPzpNGhKLdnbzUr6wpbxFt
	LZrXhnHhPtVL2iUei4GxG0CjsIr8uDcLWJo5O5nMbpprtgWH/WEf/ZA==
X-Received: by 2002:a05:701b:4542:20b0:17f:7280:1332 with SMTP id a92af1059eb24-1b25d3303bamr3329207c88.40.1793976537298;
        Fri, 06 Nov 2026 06:48:57 -0800 (PST)
Received: from fedora-laptop ([120.229.31.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4879adsm7528337c88.6.2026.11.06.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:48:56 -0800 (PST)
Date: Fri, 6 Nov 2026 08:48:52 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: socketpair@gmail.com
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ublk: publish a new device by its id only once it is
 set up
Message-ID: <au3o1OB1vxt1fJ-1@fedora-laptop>
References: <20261105-ublk-del-gendisk-hang-v1-0-913a91a4314d@gmail.com>
 <20261105-ublk-del-gendisk-hang-v1-1-913a91a4314d@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-ublk-del-gendisk-hang-v1-1-913a91a4314d@gmail.com>

On Thu, Nov 05, 2026 at 12:25:05AM +0500, Mark Korenberg via B4 Relay wrote:
> From: Mark Korenberg <socketpair@gmail.com>
> 
> ADD_DEV stores the device in ublk_index_idr when it allocates the id,
> and control commands find it there as soon as ublk_add_chdev() has
> initialized its struct device, before the char device is added. If
> dev_set_name() or cdev_device_add() then fails, ublk_add_chdev() drops
> the initial reference to free the device. A DEL_DEV that found the
> device meanwhile waits for ublk_ctl_mutex, then calls ublk_remove():
> cdev_device_del() of a device that was never added, and a second put of
> the initial reference, which frees the device under the callers still
> holding references.
> 
> Reserve the id with a NULL entry, which idr_find() and the idr iterators
> skip, and store the device once ublk_add_chdev() succeeded.
> 
> Fixes: 71f28f3136af ("ublk_drv: add io_uring based userspace block driver")
> Signed-off-by: Mark Korenberg <socketpair@gmail.com>

Reviewed-by: Ming Lei <tom.leiming@gmail.com>

Thanks,
Ming
