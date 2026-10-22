Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792679816;
	b=wJxWDDiG7h7SEAM/MTJA/mk4DCWaSuJc1maaw8iJXhVSq0ExMP8yHzjRJP9XI9H3nsVl
	 sa8MDNqfh8pTNCR6UdEniVXVKR7iCBKvQjNQGTra2rcFKAl6kcOT6fvDwmEUIRr3OlYxX
	 hYGVGhRGoVzMqg7ou8u1SZ9UpemyLc4KVazw6DMCg+MYJYsl1UlrdDgE0dCN1LJ1vf/Gj
	 rJwfqHEtRlrcodDIKNVVCGYfdT/rlGRkyFGNsa1hCSPLQ27HQomGL/JxlDj8VsjpW08Qy
	 knd/EWyZLM8kMhsTdu21ODKgxlrx1xIRlIo/UbasTag2UFpWKyQOZbcpArBQrpPomBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792679816;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=mvAGYPaHlikIZq5QDERlND46MryykUYmthk/Ww6XUqk=;
	b=ya/iQjSJTCWU/Z7pHdCRFTTIJ7ZMmw9aRkkgxWccpskq3M3QHXwG9sa3bZaANfTXyroT
	 e9Iim2la41rU2jH6g271cKVAS6M3yVPW4c3I4X8gCWgZlDJu0J0G+uE1K21/89wwCB39n
	 jErfLPvgyOKfsaRTqoZgWX5a5eo9THwxnsW3C3DdofwqxgCew7Z75Bv3sl9QxSFnizk0G
	 8c12Yrj0laXmiiRiqnOuv3D8jEQIiTTkZ8lGkTQueR4zb+Q84hsIRVflec3J12l0KxTGN
	 Leqvx+7ZzVVGMX19sv01mbtO18Yjq88flJLM1qobIvN0GgNYFgxEmc6I4v76T0i2Ejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWzOsQYX;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCA0606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCA0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rWzOsQYX
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c20ce3c118aso182800666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 07:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792679815; x=1793284615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvAGYPaHlikIZq5QDERlND46MryykUYmthk/Ww6XUqk=;
        b=rWzOsQYXQqTVdPHfBv4oBRlk7alBl9C7/EGhfrE8iN/K9/eKdRFqvZLFyRwDFPZwtU
         VBf455BTddg6zUW8/A5bTMmZyJ1WxnNI7fJqcYf5W8vn0R835CpG0egI6j6gZscYSvud
         sguFmG5aBPUQkoapBZSSqsx9pCiifvytK6KoDRZJ60JMmCCsuWLDj0jrTsFDZ2qu9s6k
         vIJZwJ6WA+b+C0w5piTFqTsLgBcYDrPBlfCM1pJAYOeBTDkCdrZWwvasn4J89U0AJwGV
         qjGWaRjPxnNF0icCnOZx45Ku7BO5l/cb9GebiRA+tVLKqrPpLx4F0aV6s9ze5CtB+Rb0
         fREg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792679815; x=1793284615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvAGYPaHlikIZq5QDERlND46MryykUYmthk/Ww6XUqk=;
        b=iIk59zQNW0eZWbMwKBgMjyMmBc7EKNoZM0GLLabWJAUnUSumlCwLlZJRSJ9mMJTtWf
         cmufWA3yGVvAJ+JTViMCxYZPqguWr5+Hnpf4YAltQXW/nb3RsAQBOc1xt832PuRPayHW
         m7O1vhTk5AHekyuBOy7spzhJSLKKbOzR067E4pQjs90lGbrI59k329FVgzBHVrcf63jY
         TOaW8uv/tJ4vEBYgWYVhXFIZTPHFIUpwop/1jevkgOY0x1q7V5lJ4e0FAHB/Nxnfr+9j
         k5dRZecWavCuOVGA8QDzyxLpvYAs0pMHeDHlOZtp4MpiR7qvNEbtmmT0d5D5Dn0lHoLg
         thPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOYEX4tAeeUagWlysICmU0q80SvGkHU6PNyCIQKH8bLLg2GofEeRscAvThArQ+xrlC923/zS4QBsi+/bY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrRm1FVGcmB1fU1VRKHlMKsI7ftAa+/RpoN4BAd3DpMJUCVoBk
	AjF2pDyAsFmxBZ5SQp6AaueBZ1Itk89U/8s5RbOp/Ye5v//Ge7xkRii9
X-Gm-Gg: AYBFou1PbANbUvf2cwqhFVp9Lb5ej8qjKFm7+HLYZ66ks2r7cx8IyRa0KAL7n5n4970
	ibCpA4F6VscM2tg3LDWPPAk4rGO886mNM1PGppx65yExqyzei0zcz1NH6ydZ3BAOxpspO3H7lys
	PSave/VWAToTUCD9/i7b337SmznbdUQhXNpGTCMsn+OTBsyAH0wK+zPhRuG4k+orQs2Q23cRVaf
	4+vW8LGF1d3+TZ4sYgEjtm3kVvA4xAkx8H49tvIJhoewYQKvPxvGkcuER3gnfgRqhzkS7gyrVY7
	UINRtGGr7EtCRfRNOjcx7XvsRGHVXkpRZma5m2nm7XEakT7hOMjUSD4xtikpSwvzUY4A2rljB1v
	7Dqm78pWGLoDqF+ELxkOfLFdM9d5MD9rV8rhgaZvzK4piem3xtc+L02z89O1XF8LHJSU8OPWJTC
	CH51lDZQtYkEofJXAyayxkQ6O2mI8Pnz+g9wwdenHF4P1/hoV4jVJoCnO70VrgTmQepbmK3pxYp
	oZFk3TYDktZ4esVXoADMfuwU6hT3NgunGkljTNiWQxenfM7SaMbVzcspQdFYYd2evH006gi7EZC
	i4HINWTUykwsXRxPR8BDMf4UtjXeN8HamvQjU4WqkQ==
X-Received: by 2002:a17:907:6d05:b0:c40:9b35:ad91 with SMTP id a640c23a62f3a-c468d76a6bdmr355258666b.13.1792679814548;
        Thu, 22 Oct 2026 07:36:54 -0700 (PDT)
Received: from [192.168.1.122] (cpc159313-cmbg20-2-0-cust161.5-4.cable.virginm.net. [82.0.78.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcddsm112143966b.14.2026.10.22.07.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 07:36:53 -0700 (PDT)
Message-ID: <46fdec20-c37b-4d7a-afa1-3caadcfc4640@gmail.com>
Date: Thu, 22 Oct 2026 15:36:52 +0100
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
Subject: Re: [PATCH net] sfc: fix use-after-free of filter_work in
 efx_realloc_channels()
To: Sicong Huang <congei42@163.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Kees Cook <kees@kernel.org>,
 linux-net-drivers@amd.com, linux-kernel@vger.kernel.org
References: <20261022133927.3860186-1-congei42@163.com>
Content-Language: en-GB
From: Edward Cree <ecree.xilinx@gmail.com>
In-Reply-To: <20261022133927.3860186-1-congei42@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22/10/2026 14:39, Sicong Huang wrote:
> With CONFIG_RFS_ACCEL, each channel has a delayed work item,
> channel->filter_work, that expires aRFS filters. efx_poll() queues it
> with mod_delayed_work(), and efx_filter_rfs_expire() always re-arms it
> with schedule_delayed_work(dwork, 30 * HZ). Once efx_poll() has queued
> it, the work is therefore always pending, queued or running. It is
> only cancelled in efx_remove_filters(), which is not called on the ring
> resize path.
...
> Fix this in both drivers by calling cancel_delayed_work_sync() on
> filter_work before freeing an unused channel. The work does not take
> the RTNL. It only trylocks efx->rps_mutex, and the filter table locks
> it takes are never held while waiting for the RTNL, so waiting for it
> under the RTNL cannot deadlock. On the copy failure and rollback paths,
> the freed channels are new copies whose filter_work was never queued,
> so the cancel does nothing there.
> 
> Signed-off-by: Sicong Huang <congei42@163.com>

The analysis looks correct, but I wonder if rather than placing the
 cancel_delayed_work_sync() inline in efx_realloc_channels(), it should
 be done by efx_remove_channel() (or rolled up with the kfree() into a
 new efx_free_channel(), since it's undoing efx_alloc_channel() rather
 than efx_probe_channel()), to reduce the risk of the same race popping
 up elsewhere.  Consumers of the channels API should not need to know
 that they have to do this 'magic' cancel to safely free a channel,
 that's a layering violation.

(Actually, it's a layering violation that filter_work even lives in the
 efx_channel and not its efx_rx_queue, but I never had time to fix that
 and am now not likely to — I commend the idea to future maintainers.)

-ed
