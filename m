Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459675;
	b=ECnP0uH9qIrfSzX+brmfC4ENpAwrhWcLPmRmV/7QYfp33Ns8IFlPDL0ZbCZzESmECSz8
	 e7QKiM10aO0MNj7gqgRLfJOQvbtpaNPJBrTlhyc5N9mrChXIxBTOiLxSEGrghhoZe1bCv
	 AjMA+0jYM1bX432ha67cZk2NVYBWQElNyER1+i9Hw5ZsOtf0o9WCOulX5vfqVqdMMEGrN
	 oo54HUSCHp33hywXIvtf7BBJMEQnDMO8opdJHRWDiA9IoLWdtfg2ciiSTbGCmfY1lb0QJ
	 ayaBIlCPVIv8rTTCR2lj9L3PyRLLl2cs960OU9s3af6/DQofayGVYKVY6whJJIRMP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
	b=RjBkzjL7prV4Iemwwk6HtE4JBCt7UiVpJ0DIAtBYjq5VyIxhTPZLNUx2YL6H0iqBxriO
	 eJPsGWFCYhbAS3y4Y3NSDPmOPAriX45HOr7qONG4o4Y7JMXRicuZqGiPdvQD+hc+viDQ6
	 SS9OC1biSx2gveX6OvFEZY1V4JRAzhCAfozytPTyC7huq9YiEeXaXrMWVpzO/dARSCN6U
	 +sb/3JSp6PVX2bkYQC0YeXg8VwByV2iOSE6PAJyGNt1hkVCXz74rKzCSndD1g/5ZSLkVN
	 UOrJWIlVSsHQUUtlO6jbWGmIOeuZrpIm0TZF9rge0urgbafszx/8yMiJ+t+qQlyrRsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSPzFsAP;
	arc=none smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E30606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:01:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3E30606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mSPzFsAP
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-53c156ba662so2010563b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 21:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794459673; x=1795064473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
        b=mSPzFsAPaT9tym6cizOY3groV50kh2tvVRiY5Aos5AwFH91/B/LfpKc9wRotRxoK3A
         lux/SjtbyrknH8jgKwOYE8eoEevdS3OUBb469kaGVzAcWLChw2NUe8gJnMngt1X/szW/
         pTq2FiiIH3RRLnW5sT0lrdAC3gx3hXyKMZKgjkYqmCmUrjd8FzwJL1Mq4htzuzDWeBet
         Nz28SXlGj6QjdnLSlQx3b6fUCr61dREGOS+9PlxfXN8LkbDXJ8y0pbjhv8/K9qQLOaC1
         xtvPT0tbhqOloKMb9LNjNKV/N4FOO09b5IxggtakChrL/Lf8Rgd9zA+Qatc5G2hxAGgm
         zubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794459673; x=1795064473;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOtS0jZSJLnbuCUHqHGLiVmcLs9rLHyD3/gIICXW7CQ=;
        b=zXijldfLbD6QTzFGLnSHU6T/BRjnkvQBgaCm2X8m9ROUj0SVSOs1lnkH667H20f+oN
         sktTtfSraCZ5IgkiY9q4AVvyMRzjVz1MYvq0jBM9dcsnwJa/4JFOwArpmAs/daoKPd/0
         sXLvHhTV9WDIwR6Ma/pAYNEaHVgXs31QQAt4kh8d5uEdL/semZ2Jru+OXDorA/Zelk0/
         FK9OTacnRM2ruI3IiV03P92LGNrnBNsC9eHMbvylRku3Ko/asOtzsnSOhwHI9eISeNap
         hCcQTnLBzdS04gBxH9KOTjWa1kP0MwbsdW/DHxT977h3+1s8Et6xcXMgUVKStr14A1dF
         59Hw==
X-Forwarded-Encrypted: i=1; AL+hErH3vGiS/esHt2HKj1xEvZDZb5eoOHpGQUuanRAfFVZeo7O4gyLnZvdxJtKo4qbWAID1vjqL6gXg7EtF7T4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/4CTCT47A0dt6XZXMxLQiyMIXuagkiY1fIAcUwDn0TMi9Au96
	zNE4TFywxOFOYihOGEEI8G4VXY5RivBz3/IEh+oY0XTKfyEqE44uoZTz
X-Gm-Gg: AYBFou2tXHyFZrfFFulsU+KCC5wIHbqkkuUwPqVRSLlka2UV+hgXFii2MnWPXfzhliw
	3/xPeoE4+jngKjbSECcKqzlhp7j2MpAT6u9MkKW6GZjT+fkbt/xGoODaJ6ayv7rk5q6dPE5K8Qb
	rk1AR0OzkdvGeE1k/7HsEjjKsctaqTE5fxLegD1kpgUi8RxYKJh7HlTckggw9MhB4o8cNxOqx7T
	26UkF7lFdbydOrYADnrPQW8sNm3ESivx3TGTvUbZANTro77+2Hi5uuWl0ym7HvglrT1Zu2XKelS
	dQ5wpHrkkY8aoLkvHQujVI87LGykdeazuwXvK/+Re4MJtGnBNKwBIJxGG4EONdMakp3Wnts3WFr
	yktz/E7pivywOgAhdvUbtI7+4+L6G3uNqcAqAa1p1+PcLBKhH2eplTqsX4vrre+/KxSTXcMS2Di
	52+KJW5SyK03JLwzHcwRAyk6X8Uhl+cIPBvUasxk9/e9ob1W0PQdz8PCb4soUaFEvjsXATH6lF2
	7CKf90pOz0hEH3FhguZbLqNvLnt5oJ/R8Bx5WgW43t+kwR89P7Fj8jxm6ZEVviS8+19k91n/Afw
	PtwU89v/7RtGosU49L38VwtxYs1P1Uuq/Uw/JtYvClfHlhCmRmUrU7yp8gp9mlg4/MT1mXHSU3X
	D
X-Received: by 2002:a05:6808:1a02:b0:564:22ae:a68c with SMTP id 5614622812f47-56b968c7f46mr4463769b6e.13.1794459673581;
        Wed, 11 Nov 2026 21:01:13 -0800 (PST)
Received: from [192.168.10.3] (ip70-187-214-22.oc.oc.cox.net. [70.187.214.22])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56906036028sm7779876b6e.11.2026.11.11.21.00.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 21:00:59 -0800 (PST)
Message-ID: <e158710e-bf16-4010-8bf1-b8ee0ff2347b@gmail.com>
Date: Wed, 11 Nov 2026 21:00:47 -0800
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
Subject: Re: [PATCH v3 0/3] MIPS: CI20: Enable SMP with two CPUs
To: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261112041422.2997275-1-f.fainelli@gmail.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261112041422.2997275-1-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/11/2026 8:14 PM, Florian Fainelli wrote:
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.
> 
> Changes in v3:
> 
> • Align the second line of the readl_poll_timeout_atomic() per Brian's
>    feedback
> • Collected Paul's R-b and T-b tags
> 
> Changes in v2:
> 
> • Moved SMP sources to arch/mips/ingenic/ and the header to arch/mips/include/asm/
> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP directly
> • Renamed JZ4780-specific SMP symbols to XBurst names
> • Changed CPU enumeration to assign consecutive logical IDs and removed the explicit two-core limit
> • Changed mailbox IRQ allocation failure from panic to logging and returning
> • Shortened commit descriptions, removed Codex attribution, and adjusted source credits and sign-offs
> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>    added Paul's R-b for patch #1
> • Updated the kernel baseline to include additional upstream fixes

Looks like Sashiko found some issues to address, I will do that, re-test 
and re-spin.
-- 
Florian

