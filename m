Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4574F4D14
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 18:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791571038; cv=none; b=NxtpNkMhRApsiGP/FtNMzEDEa2cxs2MfNapJbzyt+tjXWa3QRunhIT7xoKDUdAQjAtxNU6Vi3El5zBQTsNF0SD184stLAm8KcE4lyB/gZ2MpdoLdoC80tx/IL1Q7vs3ViiIQ9eA4fJos+sfbYZ3cV4zjkqM38Q1QuPuhWSs4B18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791571038; c=relaxed/simple;
	bh=BwV1w/kBdih+sU8YWUK9wf123zjS2iGLeow+Rttl59k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NNsfRRtU2Cfbef98AS7lvPO7xqUXBlhFon5GsKTQU6dsJCcbF6ooRoTweLeCs/6gfPBK1Uj2Bx7Xmte+Ulh9xzWJGR74p9D+M+55hms1ruaRwynZI39LBqD2FIZfnLvlVIWbeHmYCGcwZwq8RveMbO7xCvutN5TBwo+NtB5eChM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gFMTaIXl; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gFMTaIXl"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ab2cb8d577so1232275a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:37:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791571034; x=1792175834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7PADv+tCmNjIHUGxn6O6/3F4aFPIb1RdHXRti7uDfyo=;
        b=GkGFm+yIj2XPWsYbBo08H8zBpoii29ovs04JMolaMRGAH7IoVEcEwbdAdi/IB54paU
         Cbr6GaNsS3t3d3RkgqQfOReI592lS3Mj02C2Oss0srCo4l9g+e4EqKH/8wbP31RxGjyV
         ncvWPDP+frdld7KfeoIGki2sN3BQKLIg360Vf7mDcgobL8nK2M3B9Ajn2HDtEgvoeLYk
         ayM1moyBPYZx/y1vXPBNR9wkLn2mCxMMRpDXItWc1UbFLayqnS234yaYWXMsNT7n688u
         VBUJfpK/dcVE3VIkvpn1WYz8ar6oXukQ/v4rAj8WhumbGxBL8vozDLUYYrnm78k9Cjnp
         Xkwg==
X-Forwarded-Encrypted: i=1; AKwUvBxkw7amEMlhaPO7Lvr78hctDwQJl7He2n11BZyDldYQnkn8mA1+uPCf18/WOLfVhFFVxOfHAAbesoGcsFQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKP8rcXR1cWMeEgzj/zMds3ciUvrFyLFFRuOgnMxX7DGMNPkOyO
	Xj6SZ9Y6cQrgjIs4Gm7EDspnfRdKrgPwk69DzJK0/ntSjV/eP2RcVuj2iErsXSt9ue62E1lZKvN
	ierYyeGPdIhGrIBQQlMRBawtPAtcqlRfyjPrPu4PclxNhKag2fKT+V5mL9Q6y+cmOiYLMS/mMLt
	f/Cbc+R/SOTMRXpQtFnsTmpauYqqZU1ikwVTA3scdgCY42YK2jNqC7JWaTDH/kUj12MDuC10FE8
	76CpvyJRptU5FZt6w==
X-Gm-Gg: AYBFou2vArtFOaBC6JMFX3jFfIlcuRDJyj4cf9S/bSNBgpQ7RbGNB6FIPhmx0Db9k6E
	VHC1E76U0eiRLF7t0qX1nFZFo9q5I4Fw13/CpnRThDjjvWOxMQEtHRnAiYYNXk4NtcGBvBI5I5G
	hei6zcQ+4VLfgq+unS0WOrVRvk1nUSIUdD03Xq/7LxU8jB29mLjDXqtR/qEtHTE6zZa6X4PQtMf
	mapUg8ift9UIXpeQKmDuj5YRmhaZ4sq99Ha2CZoR3k4zekF0ZH5R+KvQ037kCPpCXDslX3FvnMO
	nCqomv60RtM7NDL+tM0dikzyZE2msnCtkKwY9fwp5Grh1JFn5XASIXdoZShv5H1zzBY3/Q2lGHR
	n6wAOI7dP4unUpcwxDX9lqqU7qwpP41D74KeMojpRZY4r+Z9yyRGmoGlnPw1X7Mxk5VmYf8f9QI
	Y2AfQAxVc+/XRZ5TU3sz52nxGy+QfH4aSYgsgN
X-Received: by 2002:a17:90b:28c4:b0:3ab:188b:c5be with SMTP id 98e67ed59e1d1-3ab3acdc5e3mr2523136a91.45.1791571033737;
        Fri, 09 Oct 2026 11:37:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ab36def334sm1606379a91.5.2026.10.09.11.37.13
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:37:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so9867172a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 11:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791571032; x=1792175832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PADv+tCmNjIHUGxn6O6/3F4aFPIb1RdHXRti7uDfyo=;
        b=gFMTaIXlcOJyLqD1gEdSSPYgQZN+xDEm9zqu1hOs/KQ5zsjnKPc1nUvi3EQNXaIx9S
         hDxCVH3gMwSgvTY2+NyBqr52a8B0UMtL/jtjOJkPIZiAtRWKTQA8j3S0IozXA7sQik4t
         SipdNSaWOO6nUHRB0NzSaNEiDLpJugnf7zckU=
X-Forwarded-Encrypted: i=1; AKwUvBw813NmJpSJ7XC1poT+Ir89biOtlcW+i9u8JwjbRxyDPG2DwzStMDlv08JQlwMsnQwbRrX77dC4cDFNQrk=@vger.kernel.org
X-Received: by 2002:a17:90b:57ce:b0:3a8:6d4d:fb94 with SMTP id 98e67ed59e1d1-3ab3ace92e4mr2584916a91.49.1791571032191;
        Fri, 09 Oct 2026 11:37:12 -0700 (PDT)
X-Received: by 2002:a17:90b:57ce:b0:3a8:6d4d:fb94 with SMTP id 98e67ed59e1d1-3ab3ace92e4mr2584892a91.49.1791571031716;
        Fri, 09 Oct 2026 11:37:11 -0700 (PDT)
Received: from [10.14.5.199] ([192.19.161.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b9638fsm4388474a91.3.2026.10.09.11.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 11:37:11 -0700 (PDT)
Message-ID: <345e2bc8-8406-4d5d-a73d-e54a888c98f8@broadcom.com>
Date: Fri, 9 Oct 2026 11:37:09 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 6/6] net: bcmasp: fix network filter lookup and
 wake filter pair allocation
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
 <20261008210621.1374785-7-florian.fainelli@broadcom.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20261008210621.1374785-7-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 10/8/26 2:06 PM, Florian Fainelli wrote:
> In bcmasp_netfilt_get_init(), when looking up an existing filter (!init)
> for a specified location, if the filter at loc was not claimed, the
> previous loop continued searching higher indices and could return an
> arbitrary unrelated filter belonging to the port. This caused flow get or
> delete operations on an empty rule location to return or delete an
> unintended filter.
> 
> Fix this by checking only the requested location on lookup and rejecting
> RX_CLS_LOC_ANY when !init. In addition, harden wake filter allocation
> and release by ensuring wake filter pair searches stay on even boundaries
> where both entries are free, checking that loc + 1 is free for positioned
> wake filters, and validating parity and bounds on release.
> 
> Fixes: c5d511c49587 ("net: bcmasp: Add support for wake on net filters")
> Assisted-by: LLM
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Reviewed-by: Justin Chen <justin.chen@broadcom.com>
