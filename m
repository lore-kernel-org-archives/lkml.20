Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0FA502D5A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570997; cv=none; b=HOD6TgtyPyRwNaseiKNhHUGqlG6fl1Bt9bc9oHzJ2twJqDSL11FnqxgcVQt60q7eyBTgT2OtVM2/fOJn4Ceb6ZxGoNwTk45xT955qLU/8gcrzNNEGX/nXiG8g9FWJNQ41jo/0npqclqiy8W8uPcaaTdBNs3q9U/IGrSztaOtag0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570997; c=relaxed/simple;
	bh=Di5fW5pmuMQ0JNPAdAV3VOZrDfjlCYpI+PifW2Vfsls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CF23vqDjqLhSUEEgGHO2WSPq+df92YCU3SmiSI2/A1VFX0gC6A4ZEbnusSuxY6crsH7GVVbseFNaoTomIg+kXSNLs9kHGQqSyCm7qO4y1p6lBspExJCTwdY3K9Az3M6CDrL5BSi/doAKXpkHl12v36jRu8LCRmS0LgN0XD/Ps+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SFcv5Lae; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SFcv5Lae"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so3290708a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570993; x=1792175793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OKGJknNN32NOHQQ/BHcC2WEmlpewEle5M8KqTBEYtlw=;
        b=RsvFxO5d7LGd9dbHCDOZb5OCTjrtgG1ljUli1kBJpNTRv/hutjKO0aelTI8l7aga0U
         Lcc2h8lYFqH6Nv5XjWvK/2qGpVhE8vr6mNEIhcE/MLM9w8yjdofkrjqDtrYf5p2wiixj
         BFjSQT8mkLeW20SiYPLm0bgFRPIMN+X0mCGixaPxmegaGfWa8vNoh89S6/gaNIrUQ6R3
         BaKDEXhKi7jTWc3cnUpwiwhI7u+wIVFGkdQjEpE26RauncPLQJZuSa4pcIlxa2+5xZHW
         EAti3+i7OquXEKd/6iOMY+EwMLl9ap+wIwTE9N+cNkXtuANXG+Zwx6ZoceQL46ZUn7NL
         c4ig==
X-Forwarded-Encrypted: i=1; AKwUvBw2c9NCNgQ7p77GcU+0CefK26dVupPmoTlhEskovlUAhzNCdQ942ozlW/OW9t4D4PLQyC5CEM8meYmIafk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVUAPAPIiw0R6g2rm5zlKmBXixP1/Zc7QUGseyf4HdLjizd1rH
	gpsR/gzeIHNFwytAOmlWPZfJB/Lq+CJ20tWZys1LaRt2m3sxTIrz3ag/4G2KqY5aMjx50rPvJ6o
	nO5J2uPSjpvYgRIVW6q38igu53QOWWNRxq3nAbOOKqB59907m+tsk739bz9TSGPB1atyUkdqPk6
	/BZaD+2NKyiVMKdt4Oho3QcRSO52ErTyXXmC0F6bZ65NKRSNYwxMFgrWej/I0D8sLlLizEm7OC4
	s0N56mbtNhqY3ukDg==
X-Gm-Gg: AYBFou3F6HG575BE5jAFlwuc0Y//DCp7dnd+VL0v0rPClRoBW4ntdUc4HANWjJRbCsv
	SHAQnx0LNxofINIxSpbzYuXFspv7RN6yi50Uy0rKdB2VrqXkBC8Ya8y8XfulGRn/3dK6KsyGtg6
	uHrICvjMp8FA2jLwQ0OvIvzcQClRy6ic0KyC9PXyPE3EAQ6U005p/ZLqUO3/3p0MpVmqYfnSJsZ
	9UxJmQfXm2Sf/tUF7kkriHx0WndSZ8FXsvtS23wUmioFVa8i+IDkrnjkCwF90Al2YVt5rwZlZf/
	0GbcYYHJ25HFgJfmidI708ZLJoUYMZj0XDjeQKra0wb6SaNYgcGx2RRknioCXIdbHUVBj2TAmsY
	qmC08hHRtKvamOJS9+17CYWiodCbFmkJ2F5FGtaALK9v9nDeQGLZZ32aqD69Tx5J2Zp381j0wpi
	RZ5VJDo2/iirDPjgDidGtkYSRCiF66IHCm5s0w
X-Received: by 2002:a17:90b:1d4f:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3ab3a94ff23mr2203624a91.18.1791570992751;
        Fri, 09 Oct 2026 11:36:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab3382cffdsm782189a91.1.2026.10.09.11.36.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd3b9e70f77so686738a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791570991; x=1792175791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKGJknNN32NOHQQ/BHcC2WEmlpewEle5M8KqTBEYtlw=;
        b=SFcv5LaeV+km1UY73dXJkmR1ZjWueoh/+ZdtFRQyfHuts2Gg9WFO2sgOWg5P8VQc9p
         nJup7w1uj8aaB6VPSmAZ05ouHbFHxjRADP5bDut0XyaMfEQIJrBX+hqQoyvW/owHmRdy
         cNwyGeDp2GbdqVVeLHDOV5R14teAVD1Gjbq18=
X-Forwarded-Encrypted: i=1; AKwUvBxAEK6eAGMv37vSnBU2JUC4pQ0mFIzfb3kCsvJ8yUIT/YZ4WCuu5VqAGHlQexaMnN5Rr1FrJSylKDl2BIc=@vger.kernel.org
X-Received: by 2002:a17:90b:3c08:b0:3a4:d338:4156 with SMTP id 98e67ed59e1d1-3ab3ae6ae4amr2194078a91.52.1791570990937;
        Fri, 09 Oct 2026 11:36:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:3a4:d338:4156 with SMTP id 98e67ed59e1d1-3ab3ae6ae4amr2194051a91.52.1791570990443;
        Fri, 09 Oct 2026 11:36:30 -0700 (PDT)
Received: from [10.14.5.199] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3386ba90sm3142707a91.1.2026.10.09.11.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:36:30 -0700 (PDT)
Message-ID: <eb4b6a59-2cca-43fc-910c-2a067d165d7d@broadcom.com>
Date: Fri, 9 Oct 2026 11:36:28 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 3/6] net: bcmasp: validate minimum RX packet size
 in bcmasp_rx_poll()
To: Florian Fainelli <florian.fainelli@broadcom.com>, netdev@vger.kernel.org
Cc: Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Zak Kemble <zakkemble@gmail.com>,
 Simon Horman <horms@kernel.org>, Ryo Takakura <ryotkkr98@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Nicolai Buchwitz <nb@tipi-net.de>
References: <20261008210621.1374785-1-florian.fainelli@broadcom.com>
 <20261008210621.1374785-4-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20261008210621.1374785-4-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/26 2:06 PM, Florian Fainelli wrote:
> In bcmasp_rx_poll(), the driver removes a 2-byte alignment pad and
> optionally strips the ETH_FCS_LEN CRC from received packets before
> passing them to eth_type_trans().
> 
> If the hardware reports a descriptor size smaller than the sum of the
> 2-byte pad, the Ethernet header (ETH_HLEN), and optional CRC
> (ETH_FCS_LEN), subtracting the pad and CRC lengths underflows u32 len.
> This adds ~4 GiB to rx_bytes statistics, while the undersized frame
> reaches eth_type_trans(), which reads past skb->len into stale buffer
> data.
> 
> Check that desc->size is at least (2 + ETH_HLEN + (crc_fwd ? ETH_FCS_LEN
> : 0)) before proceeding to process the descriptor.
> 
> Fixes: 490cb412007d ("net: bcmasp: Add support for ASP2.0 Ethernet controller")
> Assisted-by: LLM
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
Reviewed-by: Justin Chen <justin.chen@broadcom.com>
