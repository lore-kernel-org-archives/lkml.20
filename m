Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491044;
	b=ld3lSU6y8dEJh0SPBKGUmYxA/hDnl4OLO6T23S5hnd1hzg+quFh9mUWYlFS1ZEi5MQhS
	 4qG3hoV5Q+wVjGeA+uG52s2Oc5okGPV+nrkfx+KYwUkwRxa2+S82n8b0HlCEWU37rdb9B
	 KV2DCAKzVKwSGqpvpmulPUK7XTqrwnq+ubdroKRcQ/7KxWrF5IxWLcBB6kuQUcCKEfUSd
	 3K2w59pAaW2aF1LLHIBaM6uB3zwAA8Z06NQDFJZECpDBbb1nkHOcpEuvrfddTQ5AKKudS
	 NciZlybWx4tlWjXjdqKTTPcuurZg0urCCjAPW7l7sL0JJQHjC0ZK/gtO2+06smlfxSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491044;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=1ObhwPum69aDUV39SNJmJP04Yb8owKhA7mNwPpuepF8=;
	b=FunOM6+47syIYG1rhCQdQtrCHVN4ccW4SSjkn6IbJk5bgYebN98TITrdpk2j2tchzG7/
	 dONSZaYzfgXNhmtmf3PKI/HbTDk1RDXU1PHHXLI1GFFQMcWQGPLd4eG7nfJLnGCU2XcX1
	 bqdJTljSaWDoU8DygakPUA2CuRMygcKmP7OB9XK6ODpykZnRsZBdV48CDM0ESoPoqIHNO
	 R8jj1nvA5lsYz7W9c5m38sSAXhe9GLBZQnYhEQGUAYmBoBcG7N7+BjYwMRRe3kKzuX79p
	 zzCMVs6GO8leaVW+b9rKuce+gp0IMN/GhkyjFbi0Wds9CbY1KTg/BNoaC9OhfgH/9NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YAnvGcrD;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=isKD7XaP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D8F606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D8F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YAnvGcrD;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=isKD7XaP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794491042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1ObhwPum69aDUV39SNJmJP04Yb8owKhA7mNwPpuepF8=;
	b=YAnvGcrDVJH0Ub8/z3dmAkc14w9MuJWHX913dFLrq2P7GcoVAChnJM+sbY9QkvrcKJouOD
	K7v9JROQ1AzoolaLrQ2oL9D2dJqpIKd2ptnrufeBz6R29vjrJrpwGdqMLgQDh9SlWhGxB5
	yMiZC9tlMuFjle9FLyJr+7xYvE06UG4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-GOn4Tg1fPKawrU4rxH_XUQ-1; Thu, 12 Nov 2026 08:44:01 -0500
X-MC-Unique: GOn4Tg1fPKawrU4rxH_XUQ-1
X-Mimecast-MFC-AGG-ID: GOn4Tg1fPKawrU4rxH_XUQ_1794491040
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c504bdea834so222376766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794491040; x=1795095840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ObhwPum69aDUV39SNJmJP04Yb8owKhA7mNwPpuepF8=;
        b=isKD7XaPxeYF7ge77GAW3uvPieIkX/mWvfKhUW+4MGBxTzkS48NvxOAvg3x+9jmky7
         jnd7LKdNHm41rJyON7Cfi3kDEWmbU085Tw2Xev93EQC8m0pE95p6HedGBth654YK90Av
         wCfx3c/b86YKe1SIAqRVfpwXmH26BHVEkgkYHd8/b6EN7JxEnVIGnvcVAIz5ZZm/YqeR
         TDrWUOtv+S2Pb7CoHuHbX8AvlHkaQnWvyjdeff/UJoIG80OmC9T+fFeAbpRCIGZWIzmi
         fIUcaYVBwfX13mvxkUiYyHOB6Usv5QASwyFB0aGyi72RIjl1yGsXztzv8XTD37Aan/2f
         mTeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491040; x=1795095840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ObhwPum69aDUV39SNJmJP04Yb8owKhA7mNwPpuepF8=;
        b=dB/pF+58RhPWifiyGPukcYR4SUKkojjjoNRNsMUN73APGYC/jYYYFrxRRFUtEmm/IO
         z9H1/gwWT8d/mSjyy4TLNboVdEYsz+IVNkWNI8EPTQCndNraSgqTccCYBKXgLhcR/eYI
         dSeSA9U7zZre2G02BRApUc/o9SezZpZoxeTpEIJgwJdGaVJPgI8uaUmTdCs3qpCzoH+1
         Tizg2/vfTxQeHcjkmmnVG74I/u2tG+0DIUhF1Zhvu+BqFKNLNjyc8eTylrS0PJXOevyD
         UC/i/VpYaj+f/utskIKnRvsKC/7z96ZxXRY8B19LnfP5MDuMlwxts3JlF1FRSnezV10N
         NUDA==
X-Forwarded-Encrypted: i=1; AL+hErH4q/XDPq9laMSDkPl7O1d9JTCr6i3o0xyJ/UcOt8E+ei1FfUzA3yRQiF75cLTpu/pAqHFVRQy2inPh0Pk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+9wKX1jf9QdKCp185erhcBRlcO8KvvJUJ7WMBc6d3HtGPPibyu
	pydMQybumJNyRBnymAV84YCMpQRKa2BihczAIrE4r81w5/QWny0GpmB3HK3MDHqM2WjSs6sNFkM
	HeKx/lAX6V1Q5xdbm7sdLs+4yMKFNxzVbT/V7L+tzDrfYcuOqdkVJN4JHxlWAy79rww==
X-Gm-Gg: AYBFou32blB4b00HYUCb9b4v8WjPPWIVhncaX24+a/WCg85lfpOd8Wu1jShBmmB0QS3
	xLXJmWjUc3THlUDgIOymhZmQF5vLztiGCCGvcud5z/m9KqclTA5pwBZS6hwiawhWNIODmraRbjC
	h1uwFGBn75T1/iHmwfpgB50X0XKMMDPCzx7K12v/Vxj+dE50o3iT7GAIKPH8tvHZFALI3f9kPrz
	tCu/M3U3efO8U3WelCVHEQcvKXBdQXr+v23b4kcfj5sRKJBFC+rksrSKfTB+GBfddQhKFaS/CDR
	neAo9icmOYQseuNcXeNo4Dx4Anm/016vOAEgxwn1/IjAcV281SgEFwn9284l1FGOvICJnZABUnF
	34NlwFozezFDbb22MnJodcMJ628bNs8KZlzY1f3+NP93MzNLwnfQZ2jWUiTSFYh8dtMF2SuvW2B
	h3TScIOBAtrsEh35W7FQmRxafLxw4uY1n4U6pATqT3qoe5
X-Received: by 2002:a17:907:9448:b0:c49:a571:c4f9 with SMTP id a640c23a62f3a-c5066aaaab9mr461892466b.13.1794491039983;
        Thu, 12 Nov 2026 05:43:59 -0800 (PST)
X-Received: by 2002:a17:907:9448:b0:c49:a571:c4f9 with SMTP id a640c23a62f3a-c5066aaaab9mr461890566b.13.1794491039561;
        Thu, 12 Nov 2026 05:43:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a3a6930sm349521366b.5.2026.11.12.05.43.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:43:59 -0800 (PST)
Message-ID: <62abc297-daf8-415f-9450-202d226ebd9e@redhat.com>
Date: Thu, 12 Nov 2026 14:43:57 +0100
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
Subject: Re: [PATCH net-next v2] net/sched: cls_flow: avoid integer overflow
 in perturb_period
To: Wei Tao <taowei@kylinos.cn>, jhs@mojatatu.com, jiri@resnulli.us,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org
Cc: horms@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106063823.99731-1-taowei@kylinos.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261106063823.99731-1-taowei@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/6/26 07:38, Wei Tao wrote:
> @@ -486,7 +487,13 @@ static int flow_change(struct net *net, struct sk_buff *in_skb,
>   		if (tb[TCA_FLOW_PERTURB]) {
>   			if (mode != FLOW_MODE_HASH)
>   				goto err2;
> -			perturb_period = nla_get_u32(tb[TCA_FLOW_PERTURB]) * HZ;
> +			val = nla_get_u32(tb[TCA_FLOW_PERTURB]);
> +			if (val > INT_MAX / HZ) {
> +				NL_SET_ERR_MSG_MOD(extack, "invalid perturb period");
> +				err = -EINVAL;
> +				goto err2;

Sashiko noted the added code could by simplified/substituted with
a  NLA_POLICY_FULL_RANGE(NLA_U32, &range):

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261106063823.99731-1-taowei@kylinos.cn

/P

