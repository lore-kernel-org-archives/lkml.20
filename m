Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190002;
	b=pQ2Cn6d8NLHkudscmWSRKHMBmCEGKqKrYVMUWUO/gR/NQxjOTSihWKtJ2vHljAky16U4
	 kerJwmJFSHH5Tmr3pfm9Wy23N+q1umfOaI7q778zYmThBKhWWe5K3n5/LG43vZQyDohYy
	 o3Klm9q/fElNHLpejwuIU4PNOp4mSVZmsS75nDPvV0DFA0R5Fe27SRlclJ/sC9gNPumeq
	 lfseSQmnjruC1v5E3YO8LGB8jJKzOjd7jw8Gs+aQxocMrR8jsPBHJTpe3dbATn7KJwkA6
	 RFhJek/inKNYDDAu/xyEYvjgIUAC1yDJPX7rYC5YTNtuUwJBK9uR2j3YVmb7Cs6lTqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5kFTJIpUf1QkGirssQOcC5z5ijwGWiYcRSbJt3q3HL8=;
	b=suZF5B6mvtlGENluWRIvC8AMKyIwsvNAE4/4SBES16O4VyS4JYMJGSarWQemjUnn/tcN
	 oP5bPvvVGiGUS9DqMZ5x23M5+HLOxlqWWSZ+h7zpzEDZlHTOBeD5mW1lo4Q+62LqEr/vP
	 GGGJLdPS31dfhqOX76JrNHTMzSz0jGo3V5zJ61j3Ld9EbDsany65alf5O1KKnhCPtgMSj
	 r2KOnLd7gO9we9idVOXyJoknYDKOa8GhuuFUUlnCmKo+rG2ISbeXFVPAzyArKQ6USawaZ
	 5I8QLhwBUSUEkD1MBTndTl6/jfkpEssA1OF+4Fa5bJH/l6j1zIH1RVKX0FwXX0JdboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxjgtRID;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50548606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:20:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50548606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yxjgtRID
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8a83d2706fdso7742617b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793190001; x=1793794801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5kFTJIpUf1QkGirssQOcC5z5ijwGWiYcRSbJt3q3HL8=;
        b=yxjgtRIDQCo9PH+S550/uh92/aLIYneEcVSaL9nGavFETMpzrtM/nsozyghZTKg5dJ
         s9dXy4lX58bNF5rPb+hYu2kUKc6EJ8XIkp6OLVuHpSdAyxs4PUTWFbuCXxQSZ2PUAJaj
         r3Q1x//CszCJUHffp8s2JiDjyRA81nZrxZp7IHO9P26IBVvpPDbIplH9IML4RloQ65gV
         WxiZuoxyyJw+hQ8A5/7M6j61IZe4CMSnM69YjljceYl0fsl6G0HUQ6XEIFzdHdNmChea
         c67f7ZsMdRrd0oUtDNXVI5Q6c5riGHZRuIdXoJfEBkG+/6rqGJunDyuiy0NB2oJF6N/P
         J5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190001; x=1793794801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5kFTJIpUf1QkGirssQOcC5z5ijwGWiYcRSbJt3q3HL8=;
        b=USxQIAvhTxbqvmBO/3sye66gwlnijjPuYQ47rBmdyKy1Ih6w81kPWYRyUrGAYwgykl
         TglTwbrCZit/8cSrDDfj7fRrDIXml5bswdJ9fPI+G2Ltly3nWm0ruAqb/64wi2Zys34B
         0aPKWrnaWnuSZ+9tamjmAGS33/8z+VfigQT94xnWqqvpCbBNIOqo3/2+PQeqavvGW2yi
         u2/t5vaktbL0J6jyhJTRLs4kDQcmxBb4YZelOiZDt4RUJbqYIJUZHJ1+eCkm/gcjnO8+
         uzWPz1CvfzvNn52GHRFbDJUCh9ui+0Vo8k1YIcUNpJO5sNwYF/HntSYt/L2sEvbLUKlS
         UmKw==
X-Forwarded-Encrypted: i=1; AKwUvByyzEiy0C6b42X9zWlxPcEKv6T9de9uP5EkIOisoWYg6Ua0Nz2jDIibjaYdaKFt5cEZVS885NTZ3It5qJA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIhle3hAgRwvJM6EIlnsVYwCmIfpT2aqf5FJFRrX6VwUBmycn8L
	VmYZOeqsbXStwkXoL2i/lW2i3BlCwygG7R1bv4/PteYVBUdSQkNFiGOP
X-Gm-Gg: AYBFou2aSuoKllzpdNKB3Igold5yw4PIU9UqbB9L+G9POQrLR68qNEsS5IhFwNu7FEf
	bTKFRl+w17uJj6z71jTynJV800CJFyuROxZ/Y+I/rxGnp/mTAW3B2CRN6tqOJnt2ivJ4UfIbdux
	+5AfBK8t3n5MA5NqIGIJYjaun32D680p63tJs4YwszcoeDhRb1KMDLj9BLe7zWwIXUWQa/URLm1
	tdNKgI24Y28VwYt29XLfOiDn/sgvJAMMf5ZWC6IWH1wf2yA0ukATgkQpLvcv+6NlPBXhELEFWxz
	YgaR2ECuwuHgePH4RfUPJsW4zLB+D4VKJe0FotaDIyTBWmPaSzev+g8kbcDwhEdJX4Tsnl0iGLa
	d6WrHk3MXthZpK4m+oew5V2ioChaPAPePNo0lLp6ULqBaERdOjLvEhvn9KbAtNn+Kb4s2GwoQsn
	DFezj+iCao5xpuFAraNMGCfEc4i0kpQpAlqmvCm/Uc+EBXKiFWKfZrM1Dqj+Fp0/Itbtgff0TA2
	eznfjVLx78lYjiFe3Z78cgitvM4utcteiKh4FfWPsJR8/i4KasZk7qGIhDm9THfvpOX2KH4M4M5
	DTzIzISgH1AL3PIq0D+TMPl3BGELQu8hL2c=
X-Received: by 2002:a05:690c:dd4:b0:87f:cfa:3db1 with SMTP id 00721157ae682-8b1b5bf286emr12448807b3.39.1793190000802;
        Wed, 28 Oct 2026 05:20:00 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e6198e2sm25691377b3.38.2026.10.28.05.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:20:00 -0700 (PDT)
Date: Wed, 28 Oct 2026 09:19:53 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kuen-Han Tsai <khtsai@google.com>, Sonali Pradhan <sonalipradhan@google.com>, 
	Kees Cook <kees@kernel.org>, Felipe Balbi <balbi@ti.com>, Jim Baxter <jim_baxter@mentor.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_ncm: restart the TX timer if the TX
 freelist is empty
Message-ID: <75snoennvklw3l7zuwighfx5f2crthf3l2zyaufhalbcu2uyot@kw5gnvof257p>
References: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
In-Reply-To: <20260817192638.437798-1-cosmin-gabriel.tanislav.xa@renesas.com>

On Mon, Aug 17, 2026 at 10:26:38PM +0300, Cosmin Tanislav wrote:
> ncm_wrap_ntb() aggregates datagrams into a pending NTB, which is sent
> either when it becomes full, or after 300us since the NTB was started,
> using ndo_start_xmit() (eth_start_xmit()).
> 
> ndo_start_xmit() returns NETDEV_TX_BUSY when the TX freelist is empty.
> 
> For regular packets this is fine since the networking core will requeue
> them, but for timer-flushed packets there is no logic to handle this
> situation, and HRTIMER_NORESTART is returned from ncm_tx_timeout()
> without checking eth_start_xmit()'s return value.
> 
> Under sustained TX saturation the request freelist is empty most of the
> time. Since the timer is never restarted, small packets keep getting
> accumulated into the NTB, until either TX_MAX_NUM_DPE packets are stored
> or NTB_DEFAULT_IN_SIZE is reached, which is an unknown amount of time.
> 
> Check the return value of ndo_start_xmit() and restart the timer after
> another 300us.
> 
> Cc: stable@vger.kernel.org
> Fixes: 6d3865f9d41f ("usb: gadget: NCM: Add transmit multi-frame.")
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---

Tested-by: Leonardo Costa <leonardo.costa@toradex.com>
Reported-by: Hiago De Franco <hiago.franco@toradex.com>
Closes: https://lore.kernel.org/all/20231204183751.64202-1-hiagofranco@gmail.com/
