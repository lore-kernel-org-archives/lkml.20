Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769378;
	b=00Rp2YcS+VfvcM+7KRhmGvoR3bPICltGeFYtRyj2NkMxIw5+VGvqHikI/44iHPyUav4i
	 0M+vxjWvrLMbzaBADnIvZrnawHu7Ocd7DPi8WbQ9sKn+XdBEl0MMv/bvilRrwGlgQ0/1G
	 OA4IMuD0QsVNXmKRDb4zcnDwsoXX1IXYkrh94uIs3u5TniEjc7NxckQ3wHpFdgmTSZK9p
	 KT9GCzKPvtGvZALrgBfwZufRBGewAomm8yZTRtiEH5JtB9xSTU5bodfL0J2j9eNv7lgh0
	 FA+C5ezAbTZhrsbIS4hwvfxHfX35Hu48UyG1VXYmY131K6Zzao71HgEoW+XtxmnDxOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=/XKIXXQ3UIAhONGG2sXhMuUiyRVcSsnmp8iX7lnpXaQ=;
	b=AMwOkOH5IV/BWggNGKH3Ar0t8RJg/UFEtdHoP/Q4Pwj7oRajDWyufYQnwbGMoahaEbhM
	 31tgfIvf0/B2qHP5I5Tq3PbS6rj9xkRGHVdhnoR0vZEfoVaXCH8tSIiC7HqVfJAAnqsk+
	 knhCVl/OFZchPTV/Ed5f/OOrpDMjl14rt5T0RzLl0wvGQIm4Lq3RgOiZqaW5gPhbg5L7C
	 HLT5WoAPD2HERRCfiphvctVG5PWERD2hT86y7Yf09DEY9uvCdFbG0EpFyZAzC0rmpC5Ag
	 9UU9FTz+n9Fslq5oynOWfSYL5Cy7yRCdHysJw2dovCx/6Vr/A6Pqx0Y794hqQq85xqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ff1y+tre;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2B2606A320
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B2B2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=Ff1y+tre
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-156cbe59622so725388c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792769376; x=1793374176; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XKIXXQ3UIAhONGG2sXhMuUiyRVcSsnmp8iX7lnpXaQ=;
        b=Ff1y+trewxHWLvgWqOFQjl/KOJuftTw8pGMbsAbkEG6utYuho6TZXK29qMcBpBZU3J
         tfc2JEuXc9bdcLuaSDLezjA+ybjEe+TlJKC0vFPKqyxpS5+wgAxVJEvbBzrqh2ehIt/U
         /R4TBBCbjmwO+z9gz3jVOqUESpYZ0WJWXh+Bm4mbi3oTCddvZAHfORcaJcBMB3JKwknQ
         KOW/QZIqDcjZWxMRI1sPMh8xOb05Qk8y3s18UK7DnGWJFjRsknnfafKY76RFNuqFcNV2
         cze/air3P/VGXCn/eKOtDnJS2ow3yTmRYFddLYRB7maolVeujNWBueDMwPOoi8EELiIs
         khGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769376; x=1793374176;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/XKIXXQ3UIAhONGG2sXhMuUiyRVcSsnmp8iX7lnpXaQ=;
        b=ZFDEmpA022bUBP1RxqXk8lEm0cVKKAFaaoaXB5AuUd6CHxKnPWglIVN8GXHLDEYjzw
         JEwgW8TBLo8+J0D9KXcOfj2HPGyp0NrBcNjS6nbXu6OaeJj/83/1tCxd+xYGhzr/CNi3
         VJVgVBKUIGghgzg3JR33jHCay1/6Zg5dhGyBIeciO4JQnbXLYuD8OjFr4OMFEytzj/UE
         hR1SHD6JknjYyDVSJGaJ2ieqLiPmHRwlhD9fL5oP82ILvTZnkBUY7l2X9PuQVzWLMBwr
         H4E6PlSTIApaziy8XpGrbKt1NWy2tdeYQIZ/Pvz8KPnpO7rvUTfvousAtRKlQV+Y6cpQ
         +Y3Q==
X-Gm-Message-State: AFq9FYLCT0ieE3RNnYb/nM9PWEYfxRYZf1OCYqcTSwKVvl7XUO3VRsKJ
	Ljbun002dxFFuAOz/xdtD7XNf/AiJX2EFm4HYwhDknPXz5sc8izFz0EZY8sOgLzrD1o=
X-Gm-Gg: AYBFou1CvBe9xW5XotxzoSNkoiYeN9aC56FYZfnxVLQ10lKRri5b/CVDhAfPnGP6J9/
	gCLELbdQVRxSGhi8X/78P+M0Gc4iNAFTyUieXrr8Fqhf9tNo7hGJtGtvt5n3H4WVdpuoNL7PW9W
	wvwNphqgDr8I0U0zaBxblzuX28+7XTiFVRXwN4jx5mDxatYFY7kIppUYM0/uqbzutxkgg3yaK7B
	m8MZ/EKfSkJd481dw3BWlfx2yyy/tJEjVRoaEclGln7vCxKUmi4vLjQ56owa4rA+0XzCUuhZYlv
	IHExHwucA4c0lijKcU2Zurvq1Ft6oy7eWLoqFkGoMNp/noILXG9NVjc9cUnDUXA20FHV9MtcihF
	UjFWjGlF5R0Qh/aLG+4C+sCq5k2amXlnq0nlf37ENx4UntCgqXO9YTW6MGgn8IBLPBCQDWH7R5E
	42xLTocOsckWSz2Nbe0vnp2X6FDGhuI3+QVp8mG21fj6UDYqLKlfLSVLaIQmRiB3+7/WgNFfElQ
	V0WAj0fHTeX4Ije0jzuEPkmbMJzLafnEw3RbXlVNOPq5JHOfm0bJtt0DamU4FgGLp2oYCO6U0eo
	IufTfXLpGODessMDCz9apta7ZL5ffTko2qBh1iQ=
X-Received: by 2002:a05:7022:b051:10b0:196:4eeb:76e8 with SMTP id a92af1059eb24-1964eeb770amr2857954c88.20.1792769375688;
        Fri, 23 Oct 2026 08:29:35 -0700 (PDT)
Received: from [192.168.1.106] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-197eddb7086sm699652c88.23.2026.10.23.08.29.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:29:35 -0700 (PDT)
Message-ID: <6ef167c0-d9a2-44a5-a909-cace45ff4a51@kernel.dk>
Date: Fri, 23 Oct 2026 09:29:34 -0600
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
Subject: Re: [PATCH] io_uring/net: keep recvmsg buffer select length within
 MAX_RW_COUNT
To: Yichong Chen <chenyichong@uniontech.com>, io-uring@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Stefan Metzmacher <metze@samba.org>
References: <20261023112209.87979-1-chenyichong@uniontech.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261023112209.87979-1-chenyichong@uniontech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/26 5:22 AM, Yichong Chen wrote:
> io_recvmsg() takes the transfer length from the ring provided buffer when
> sqe->len is 0, and such a buffer can be up to 4G. min_ret is an int, so 2G
> or more makes it negative and the (ret < min_ret) block is skipped, and the
> oversized length reaches the socket layer unchanged: an empty socket then
> completes with 0 instead of arming poll, and a short read is reported as
> complete. Clamp the length to MAX_RW_COUNT, as io_recv() does.
> 
> Fixes: 78d0d2063bab ("io_uring/net: disable partial retries for recvmsg with cmsg")

Don't think that's correct, it just moved the check. Should be:

c7fb19428d67 ("io_uring: add support for ring mapped supplied buffers")

instead. I will fix that up. Waiting on Linus pulling the
previous bits, then I will queue this up for 7.4.

-- 
Jens Axboe

