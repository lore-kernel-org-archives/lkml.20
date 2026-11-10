Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794330885;
	b=mmHHv6uYxhZdPMnIttgX/KP79gSWfR+4xp/B9/vCvj7tILmhlR2kIkLPWDrSBAUHSic/
	 6UY1O8t5eGBdP7csZkr6lUf9MJ0FocmLU+SXN/oSTZ8s4jVRIoKdBt7lkJ0ttPC3xTVSk
	 /gpNFCyHfg5uqnIqlK2vl410dElNRxqzi2zq9oPb7j8QtAeUbR6n2WZf1PR05FLhuy4c4
	 +Axwm6krmV7A7IaV1Hf7t4XSwuD6qOMrgNsIDoPq+Mfxg+kX+S8rY/IzcQBBv22+Pv49Y
	 upkKKpUkwIKUHAnryv0Kok5RkGJ0VVb61dneXCyguph+cd/jia4MBBqs/ZvunDmvvGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794330885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
	b=DLEf5tSjJaMzHJx0HdZtPRd47oH8i/5YJGXxqiVc6K0qQ8HYfdM1b/Gr66vwvGKWD2Ly
	 sU81cfWB6QhjUxyJ/6cdiJ0GTOCnXutSmbfpkEScKvPcA0d+0Kf8mLYA6Yd/Fp+2ykojO
	 c8cY4QJ3ylfDqEE7yhoT7UG5KeFpgBSC7ugo2ZifgZzfC+35caKmzEQ/kmEzDL5w3C2ak
	 pCUy29rpuc0qFpK6+bZ/3dILL6C+TReDHvs/ZraacZoHfQ7ev3vNpbvO+5Zaqc0y5l5y5
	 UTsaHcGjxXxtIILxXYxrKOSb2+KvyVK0BNa0a/vXb4uXqK0tdvzu2EPIetVwBWI8xIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Isk1ca0I;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D99606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 17:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D99606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Isk1ca0I
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5361e313e63so22011491cf.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 09:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794330884; x=1794935684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
        b=Isk1ca0I30RMY+8oOixfoUtKFUb92r+JB+FTOYbGORvjFe+4pLoPI7uWL/tCbKyIwv
         g8Gue7qlz7uzKqJFZJZxmfyi4VVDrfyej0NqTTJbJkEeSEi2ahOGDInhkt1oy8//7Dvm
         Jlbxg0qJF97m4s5nQYSYsZpHILdgIQ35oT/T2aA0aBilW39XdEadvUkQf94wgYxxFJPj
         ZvkARhwpbsSpWkH3OBA1IGSqBBLxWOt+lgCanmJG2TL1sKUC0Zxf78nYDUwOBQryCIQ8
         h+ViZhY1z7aIqM8Em8vpLa9rsx6NxlNpkswBuchqitA+MMr2JjWoXh7iImMJvvP87We/
         1yFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794330884; x=1794935684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oujdvcye93Xof0isVHmwpB1y2xPdgyYOn7LBWK9psyI=;
        b=x0Fv9BveAVDQhEkm0/wG8puEmNE8/4sBwYbVCTjJw6UYixEBJZe6yIKzT+rAeKBPsT
         FlVYrHmQAPj0Mr69u1AX63Ez87YiMvKVfqRWPD653rwlfFFWJaSDyyK+LTgThArcS7++
         ueBPBfETYWSuKtUEFIX6xIrePKZOqdO99hNyi4Rp3I7re5kEO07BQd56YHEljfCkV6EL
         bEfQ+pv8353FXF2zmD2NVTLtnABOPIBSdkvtirKjcmboZGasyfgx6bCALt2ZRSCLmuQ+
         DuKzP9AmEWeXXGDUSv5ZwH/Obt47sDB5XKx7MVY6AKk38oEiRERkm+QSFbyPkFbDLlkM
         YJ0g==
X-Forwarded-Encrypted: i=1; AL+hErEmH9yrxuxEPxmgBvb82ZCPQnEKrE5264UkQv/qpF0MaiF0ZuvnKn8oe6+EcQII/vcoMl8oCZWftWezjQg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8U1nxro+iPNxBtbV1sXfn5O595sXpyA3VhOuVgt/qnNe/0MUhA
	qqG7Cv3CJ0lhCnXW215qcKz7Pqd/NNhioRRwrdKY84J5KvB86pVgK4GV
X-Gm-Gg: AYBFou3Xl94NhwbJFFLA3/THYP8Zn/amqUDzP89A3VPXNJO0WMTRdsEE03cgCzCZnEn
	OfwwPHYm3w41fVxOMvOEt6ouKgST17BB5o63EgtX2daD/UDL2OytqvlZD1Xu/AO9vWsNG42hKmm
	DWotX1f8DTjjhLBDyr8y01cqMvu4ciDJ0RRayWWPcnBR1eR68HtLhBYo0vlY5T2qyMkd2w+vsmO
	2HcSKr3ZfCWfL+E1V3GK3sZeen6jXjl8Yc2ysH3tP1sPT0t3ViCiNhoHftnMkJdN5rfGgMXd42Y
	UolqJwgU/rKldm5br1qlJ0PXj4gLEngKhZtgIrvGkXka9Mt7tydlpx5+zKjZQQud6P8cqXUcNQC
	D1ud+xMPH5Uv56YEMjMhFrIeGqYdwXCc/GkGCmOpBU33uFdWI98uWYdabjRvTZeNsekfLGWdEez
	ztEtewYb2UhEpw2Ka+eK/QC9rvA+f2qA41pxrH8HCg98QQRgzntuJbpLyklRGYNnOkwEOx8PhSu
	uYKFBUrzNsR9j5n0xDPyQ56NAF8KtpRrU6tVpw6YSMYnPWmibsTjAsIdnGagt5g3o2/eWO+3xG+
	5cvHmjbUT+m5LbCIc2K70ul3ZE4J4QpvIynkCyabx2f0t5SwqDzimFg9
X-Received: by 2002:a05:622a:1911:b0:54d:a34f:c736 with SMTP id d75a77b69052e-555271342c7mr48254351cf.17.1794330883512;
        Tue, 10 Nov 2026 09:14:43 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef04d8397sm25744446d6.18.2026.11.10.09.14.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 09:14:42 -0800 (PST)
Message-ID: <135a8f3d-9eb4-43e7-a20d-056362a29c14@gmail.com>
Date: Tue, 10 Nov 2026 09:14:40 -0800
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
Subject: Re: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
To: Paul Cercueil <paul@crapouillou.net>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 hns@goldelico.com, paul@boddie.org.uk
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
 <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/10/26 07:44, Paul Cercueil wrote:
> Hi Florian,
> 
> Le lundi 09 novembre 2026 à 20:31 -0800, Florian Fainelli a écrit :
>> This patch series resurrects SMP support for the CI20 board. This was
>> submitted back in 2020 by Zhou Yanjie.
>>
>> Changes in v2:
>>
>> • Moved SMP sources to arch/mips/ingenic/ and the header to
>> arch/mips/include/asm/
>> • Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and CONFIG_SMP
>> directly
>> • Renamed JZ4780-specific SMP symbols to XBurst names
>> • Changed CPU enumeration to assign consecutive logical IDs and removed the
>> explicit two-core limit
>> • Changed mailbox IRQ allocation failure from panic to logging and returning
>> • Shortened commit descriptions, removed Codex attribution, and adjusted
>> source credits and sign-offs
>> • Kept the clock polling patch and CI20 defconfig changes unchanged,
>>    added Paul's R-b for patch #1
>> • Updated the kernel baseline to include additional upstream fixes
> 
> You should also have a changelog per-patch, in each patch's header.

This seems to vary on per-subsystem basis, for netdev where I contribute 
the vast majority of the time, putting the changelog in the cover letter 
works, but I will do it on a per-patch basis next time.

> 
> Your patch [1/3] has a Fixes: tag but does not Cc stable@vger.kernel.org, so
> you'll have to send a v3.
> 
> I reviewed [2/3] and it looks good to me, but I'm a bit concerned about
> Nikolaus' reported issue.
> 
> Thomas, if you can wait a few days, I can test it on my CI20 and if it works
> report back with a Tested-by: tag.

Thanks Paul, yes please do test it because I could not reproduce what 
Nikolaus reported, that makes me think there must be additional 
configuration options and/or patches being carried that could be 
responsible.
-- 
Florian
