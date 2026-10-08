Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7360446C83F
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 13:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464610; cv=none; b=n2oW/dipjEhjRa2AiXeOZFfrZu/ekJuQPA+94yIGTaGJgyot4xwUvajeadZ5KZTyaX7BWgseQOPi/kH9+oGJcvCffpGJziMBngBbObbw6wza2Uf11i3CGsujGApOoB3WTKhvHXMg+X0oq9W9UzNhqqBYsXdw2kWQx1p5D+wLLU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464610; c=relaxed/simple;
	bh=VpV0KaD44FbDOc/jXrwmrc0sWLFS4pT8PRkJ2EdDDpA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQreyBCCS5m78kTNMndoqGbCdPyeQ4Re/Ieg4Ar7zl4+xAxFUn+2tgRZHpkabXQdGFevVcrayjfheSbgqPamzfiypweziiNB65ju/+VzeBxknLOWmqCvaH70WqYA61Kg7ntNG09JI4HMokcdwKOXKlaqyzMdsnr5kqCtIS11H5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p0HfSe4b; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p0HfSe4b"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b13fb95060so861387a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 06:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791464608; x=1792069408; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+kGI3k/44UlMEz8kQ2oCVgsiUMpT90qi7dL2PUgRNcs=;
        b=p0HfSe4bmTWV0pcHjzxWrpNbk1Nwcmc9quyoV+qtgcv/R2DoN+8LY5QN3h0CkzMlgY
         Qze+cK5h6nuI2jo9Lcm48MalOBAupjLg8IxcM/F+l6yxsYBsKmAaI8KXOvse4gUNF3PA
         NAj7FMX8DRO/Y1xVzhWtIZup3K0XVMyUog/ed+3VC6RO8BaDrJjY3aioYmOEZ7Yx8RYL
         pzC1N1ogqdB4m6Gd9h7TOC+RpN8uJXS5P7E1Kbw/7pBY+UPIwxeP/yTvyuIcocQ59v7j
         NsguLluwOg2zy5BiWq+briuHW2zMP2c3JXM0/VD7VRQeprmmnW5eJbNhd4HpMvJt3Ees
         Iy3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791464608; x=1792069408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+kGI3k/44UlMEz8kQ2oCVgsiUMpT90qi7dL2PUgRNcs=;
        b=V20pohJWtpgFknwRTL1g2MF2WN7CIRurMaz8JhyS3Odiyl7nH+UIOS4VW5Ivn2ia1T
         eN4dXAaKl/d4hjoaErfpre0kPBzrzauDopUr/R6p9wvNw6t4jSCw8PQ5DMd61XocYcwU
         3CwJRUckSx0eqGsDL1Juzy5GjfVUSrkDtlAqEhpFfNvycZD1WcR2892ItgOw9DPe+Mqi
         JNkEv46etFsK8lt99+2/+KWR8PtoojvC9vgLEnHtk6DeUwC6PPkGEhYWMnCBujbfHoLr
         qR2moEwHZCYCVHV2GeBkMWKPVIH1S0XDJr/7RlkmLSLk5L1GbdcYHni7tCvYsn3xMtVW
         azcQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuixaoZbfiEirBf07LX0z4vILjT4iM1XeEqlP68/NCMfFZHVuCmIluMu65i7R0OjVwhD7baGGkQpeWYy8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLrp2ajo6hB90tDQC3hcAkSUI2nGXc0OYXsaZVhmJSEJftry57C
	kqtysH/DHS6S9ykUW3pDeN6Fn0YllqdMIn6bo+YwJ1H9NKpyKWFx7gm5
X-Gm-Gg: AYBFou3ekvBeSrttI/Yh9dFI7TF/ob7YzK8Y0ZDQoku2LLXnPcreqCPVGUntEcgAnYY
	M1Rp3Vt9cXbcKm/AxWJUxkB7ozuOsImdYS7qlGJF/stLX/llEyQ35iWGBIy4iytTH+PFVpARns8
	VH+lhpvzF27Iyw3Zvu2I0LgeyI+lWQyn/iogmB7Az1Lia7uKKHiFC/BhWj8kcsBV6AS0MQHGnsX
	mWSPoAh1LmImzx6Jw45toeABKGJcFnpDNTxWEt1aah931KFIXvoY5b3WeQ2e7bUlmXDAw/Z4+PB
	D6XKQNY10nDqRsw5H8eGxIaUMFdmfVH3kiT6HljpfgjyPzZUnwdpzIFdOYJzjsCSWujInLhZo6b
	I5nUcTwZ+leSX0DIl44YabkxHMaAAriGRd6lhxv2YTY+LlD7wk2uTd/tA+YR0DJKwz6aSPjbEf+
	g8KKPRHwq6l+/nwK03tIAyW7WOk4HKfyBeRjtL4ahObzDa9ibDTz4EQJEH77kYJVEONwX8Dkuf3
	wr2g4xV9II3+nO9+nbIdmMOyUo6g1WcZTRTIgw9AjKytuXCn0LBydqx9/9nhh9ChANe4j6rx9AP
	R6tdOkSmtWmoVhKM3pQy2VkSZoQ6AuIdy892jmxTMm6o2gDOmNvALBPyZwo=
X-Received: by 2002:a05:6402:278d:b0:6af:5b14:78e7 with SMTP id 4fb4d7f45d1cf-6aff454b592mr5115802a12.34.1791464607322;
        Thu, 08 Oct 2026 06:03:27 -0700 (PDT)
Received: from ?IPV6:2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c? ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b00aa4c9b8sm1413473a12.37.2026.10.08.06.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 06:03:26 -0700 (PDT)
Message-ID: <36d9e570-15d8-4a2d-aafb-3ee6e5681205@gmail.com>
Date: Thu, 8 Oct 2026 14:03:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1] net: devmem: prevent mixing fragments from
 different bindings
To: Mina Almasry <almasrymina@google.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>,
 Kaiyuan Zhang <kaiyuanz@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Bobby Eshleman <bobbyeshleman@meta.com>,
 Ralf Lici <ralf@mandelbit.com>
References: <20261008033952.1399670-1-almasrymina@google.com>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20261008033952.1399670-1-almasrymina@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/8/26 04:39, Mina Almasry wrote:
> validate_xmit_unreadable_skb() only inspects shinfo->frags[0] and
> assumes all fragments in an unreadable skb belong to that same devmem
> binding. However, tcp_sendmsg_locked() only checks that readability
> matches the presence of a binding (skb_frags_readable(skb) != !binding),
> allowing consecutive sendmsg() calls with different dmabuf bindings to
> collapse into the same skb and bypass per-device and unbind checks in
> validate_xmit_unreadable_skb().
> 
> Add net_devmem_skb_binding() to query the binding associated with an
> skb, reuse it in validate_xmit_unreadable_skb(), and check in
> zerocopy_fill_skb_from_devmem() that existing fragments match the target
> binding.

Looks good

Pavel Begunkov <asml.silence@gmail.com>

-- 
Pavel Begunkov

