Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711196;
	b=PiQ8Q+FzYMAYaNmsqINxphm9+hNPooA/cZ6BKwg/SowIGC7xZ8YGzxCSCSQmdJk9U049
	 ytgv4bb382veLA+xTK/Ar99TV8sFWUGtZmj9PsJVHmSfdEVtZYU9mtNVTMemfo+RAJYg1
	 qhl0m1tz79LFAvCxW9KpnEWuwFD+M3YchPYaz57Cx+6dCS3GNyCL6Jw6p3fnazHCrOJ1L
	 pxffGaJJYjl/MpEfi0ksnq6tYbb0h4x2U6TS53vCKc8rtYgTSdaSS9N9dVe74fSRILFNu
	 W9yhjSWHTOVQRMWXBei6dGJjJxSfuEOA8VmamF8RLXfzrlA3MeCM/0V48QDcCbdvNjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
	b=FG6t2P/tsy2KQqCNZGAfxKnjiOkoTtieIaH4VAr1TzMQcaaMEWkWC23OXOrfcat+LhOA
	 aYeOz9lxs8DsWt1izfZ/MuNlkKi4HjcmCRUM3oHiBj0HMU5DyI1xiALa5AhJkJ3S9CBf5
	 sN92RPXt4jYhxRP0iRKJbHFOHwST19upr4wjRfXuVupu0SkhL8TCSjJfGkkzuxs+fppVA
	 m1nS/gHYSVP+LZJDyiuUMnQt+qcWUKSfbAWf/B7FcjsdnDGZ3hO8OjF6C3a7C5ZoJwgLS
	 Qjiyg0e8ga1k89/mFkXvuSqwwOPqeJinFyQ9KZeL3UBeYA9EWjNTr4CHipC8V05UIGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcrn69dz;
	arc=none smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7776606A32E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 02:53:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7776606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcrn69dz
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-94961b68685so108754685a.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711195; x=1795315995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
        b=qcrn69dzmQolEs+h5yEiGzVJHu4bLX1DKf+xYNeVJXaDRLsor4tZEhx0QaAMSct2Tz
         LN798TXybSwRmQRtctyWLyEz+Jjw8D1neNJ9la9K39X0ZbxWbPtEJbREdwkj+ZY/dozn
         G1DTejOIXmlYRFDHgnWyoT1JygHcZjaH+ZjvOSwRZsh5R1u0YEkp88Aiq61QignskC1k
         DXDZ2yAK595kXGwUTtrSzpqB22ijBdfQrZMXI/vKtcw2O6umgX92Z2Ke6L1QcxCwAo8k
         UGtwfpzn5iCUd9ae//G54GJeHk8wUvPcwBEOmVUPzBikroIQJN8ai85vc7c5qVW1oyML
         ypUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711195; x=1795315995;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FEFqR+LrcVL3DPo39+xuQCQE0txVSiEwhPQ2lR4VeeI=;
        b=Osc/xmwV8QgqjV7fzVjMEYLlizwjmnftV71K1RYZ6DS58n4zJH4smI4UxTFoN30TUA
         +mcS8b5buWf3Lsw8urbOC/WsPD1+CVP3aP/5IfLDQ+TDCw0V0PH/PdssxWeGAKvq6AVm
         zUn2DRhm00NBznV7bzFn4/+Gp++zIP5x1CdgzYk1H6UBCK05G8B+FQVW2kwrZWl/Khu8
         nEpzvCEfokYnVe7fZ8iig5mb3VJy7MGZ4NR1AQw2N4J+J1CzBLUFmo9EX2wGmIc4TKTW
         s5X75YQFOSiHZYAwPTnb+w5khnlTupJ0QvQqu4EjwkTGyuDT8R/9elifyoeBMIzSL9pe
         iLuw==
X-Forwarded-Encrypted: i=1; AL+hErFkx4CdWnMMC2YydmJD3qCVr6TKrVaMheqWBFUbW0XgGG1DRsRoqy4DSr47hFU95Z3JaEri9iY3IDMKenc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VKrtlW1J+TZPGGJ8U87VHjLXBFZVkXhjJOOFKWE0Jf7h7peb5
	WjO8fsavUA94gUkfCal/7o+8n/YCX/k2b9ryDXN1NviYpkIoQ6eJvfKE
X-Gm-Gg: AYBFou0EjKDyDcK7HGWs9RtPsNriiyB6S6+1frUBHJ3spOA16StIYlY/MJnuiU77Ifa
	ybiO2rP19Y+LCGE9FksbCSJGlkYJvyNpRWIRxRF1hilzf+/WFGIvcyKSNTX/vu1HNr4KxpEpRJt
	qlq/xN66QbzefwmcMQXe/TdyyLAPxy2JkIXRU6mP0ikvNSArzclnv30XnsvcLnsg6U+ojezs8Ny
	EP26etaN6wpsjDnkxA7RW9TKLESPpUJ7zJ7+EFUuRjrFgOoqGqyA9EQmuggZ0R2/L0UyI/cln1g
	8q+rGoBbXM3kDKNkrCiZWHaA6VToK0RDql3FSXu2EbIUu+mcQO0zHZZfYbsobmAlTaXEJS+7TqS
	/wNQ5A4snO/GCkVOLjxFdM3uQKjujf2eN67V/A/hnw2mmKnKLwFazDDvz46qtqkFyzYzinaycRN
	/unTrMv1SOKaXOzGR/N73coEnkh46lSbuXJ3iQMdf3L/xhVgeUty0GR6uOahnQ4CXlqoxfTGU0F
	bBTBC165La7QV7chzxxtEfxU+Wc2tbPQLbcLoX3dM5hnTmZRVq0Zvf0QjH9AlUNuRqcqgDLDiGp
	3lsm8dNiBZnMQb/ReBk6CqF0mKnQFx4HK1z1CU46O5VPlHxIUqVQuNxD9qG2/vfsw7JZ7G+Xapk
	UbTi5e0XYXAoh+mE40lg0Hr50Kg9KWiVvZ1aq6FHDOpRTqS5cLdE30Tg6Xs/6TBAIadWmOCUReb
	I=
X-Received: by 2002:a05:620a:2614:b0:939:fde0:a71b with SMTP id af79cd13be357-9494b86e99fmr1082857185a.0.1794711194579;
        Sat, 14 Nov 2026 18:53:14 -0800 (PST)
Received: from ?IPV6:2600:4040:5abf:f200::9dd? ([2600:4040:5abf:f200::9dd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c836156sm531348285a.19.2026.11.14.18.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 18:53:14 -0800 (PST)
Message-ID: <9c17de44-8c69-432a-a196-90a4765be871@gmail.com>
Date: Sat, 14 Nov 2026 21:53:13 -0500
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
Subject: Re: [PATCH 0/5] Add support for the Microsoft Surface Pro X
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maximilian Luz
 <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20261104070441.74127-1-val@packett.cool>
Content-Language: en-US
From: Haipeng Lin <jimmie.lin@gmail.com>
In-Reply-To: <20261104070441.74127-1-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 2:04 AM, Val Packett wrote:
> The Surface Pro X is a 2019-era tablet powered by the Qualcomm SC8180X SoC,
> released in three variants (SQ1, Wi-Fi, SQ2).
> 
> Patches to support it have been around in a downstream tree at
> https://github.com/linux-surface/kernel for a while. Let's upstream it!
> 
> I have permission from Maximilian Luz to use his From/S-o-b with modified
> (squashed, stripped down and split by model variant) patches:
> https://github.com/linux-surface/surface-pro-x/issues/7#issuecomment-6597291831
> [...]

Hi Val,

Thanks for your work upstreaming this. I've been running the 
linux-surface SPX patches on my Surface Pro X Wi-Fi SQ2
(Surface_Pro_X_2010) for a while and tested this series on it (v7.4-rc1
+ your SLPI + this series) plus a few fixups needed to get it working:

1. Labels for smb2351_2 (pmic@2) and smb2351_a (pmic@a) in
   sc8180x-pmics.dtsi so the board DTS files build.

2. &qupv3_id_2 { status = "okay"; } in the SPX dtsi so uart13 (BT) and
   uart15 (SAM EC) are populated.

3. Tested caspar.dtb as-is but this will cap CPU4 at 2.995 GHz (SQ1
   clocks). Added carina's two SQ2 CPU4 OPPs to reach 3.15 GHz on my
   SQ2 Wi-Fi. Please see reply to 2/5.

4. Wi-Fi: I had to revert v7.4-rc1 544d85de4dc2 ("net: qrtr: Send HELLO
   message on endpoint registration") otherwise MPSS hits a fatal error
   ~40s after every start and crash-loops. Wi-Fi associates but never 
   passes traffic.
   After reverting it the modem starts up so this may be a regression
   unrelated to this series.

With the fixups noted above, for
- Surface Pro X Wi-Fi SQ2 (Surface_Pro_X_2010)

Tested-by: Haipeng Lin <jimmie.lin@gmail.com>

Happy to re-test v2 on this unit if needed.

Thanks,
Haipeng
