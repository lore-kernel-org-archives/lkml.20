Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595425;
	b=tzbKYh5KqbJdwiIgmHm6+cJmyrHiww/sy9O8jPTX665XxlOVcf7Z0jtRKB9ucrYCr7Ej
	 j8+ZocnCdgvik4v9M/cFagM0vygWGTVT+atQOz96nld2q3P549xEHnU6I6lrCIFltkbLD
	 /T4XDuca6qfofg5HeuEnzzkXlrMEIG7RdN+x77aJVNXXdkzuEkwAZ8kxLQ7sUwbOmb7t1
	 4MgBYtbwdAU9QJxeZ9nt7Qsw2KquwNYgOemV5BNQMVNg7FJ4NCz5ktUHPUHYWKz6b7qXw
	 S/A5Tw2u2cXajbHc18WkZK+6MRvGhPlgXumHn6MByaNatoORWUf9lwfDCsa1rk+s/mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
	b=5IhGZ3/xqUpw7tcV0aUqMizzcWweOawba+T9qqvVP6hiD3XR9PROygTmM2rpWuAY5/Hi
	 4+3DFMWAT3VrJfJ9FMp2rFPKKX1NWKzDVR5jukTF8C8h1fJK0VuSVKPP5q7JjHsuNzpv5
	 IVQI4+cXN/ohYnKyRZvFCefq5Hfykfdf8YihnL6AmeNkvKUkyoOJ66gV8orYdQFaVaDQp
	 29hagSzBGl+StKjMXsX+nyHKe0AmVD3gu4v0rFClhOtnkPMOKhkcnL92QGx2sPOymnMuG
	 R6y9SPCmuobHWjChd/CMirAg5k3DpRr7+Pi8g5O5bxvfYstqCcgZj2+ty5Tvvmle5Rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kh7xgRb1;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DDA606BDE3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43DDA606BDE3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kh7xgRb1
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e98798cbddso10596405ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794595424; x=1795200224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
        b=Kh7xgRb1QUKSAPrSkw9d5aIlc54rk65xgTssxlagqncf3mHLtIOy7FPS6tpXwVWRvO
         gB1XmzJJGAAGel5n9T7NXeEghD7gyFuku9yHizAKTRxYh4sP0nmem6wLMKIEnz/lL5C5
         T4/gTHkLlihdIp79czjJvLAeRhGS0IcU9scyERSXKhW3/U4yjaY2BBkhPy1wfI3+0Vkq
         XazFTO2s0RHn3w7AYA30fStEBSnw9lUt2y4DpoB68zDydqvkZ/ZdB0WJnxTOA4aF/XzB
         kABVT1/rwXQv6HzqOVVIpu/WW5CGmG2YWz/MMh4105NBKhGMHeG/zl3rkPJ7+oyxCMMP
         4bLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595424; x=1795200224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2+DnKoed/3axURwhBA7JYRjlV0Q+DlCdWZGm6h7Zxg=;
        b=0F+LvtGaTJxNHxEYdlxj34I9E69qyu95+j01BEWzj/Ay9kWSqJBbEvKsmiYX8G2wCg
         mbQzOPdHn49k0mJ7uIQstvK9GKSHLYLxcH7sopRF+dwTyTZeqSwASF1Gq9P8YKmGxcRB
         xXCNfgxysywziSZT8yEmWMocmJyXaK1cwmd8RWZkU4MB/QlLeLMn/aAkm2d/Frix1jXF
         7D/w1unTPu6qL3ykHSeCGbXhqpf1Ccm9PIuAYA8tABO5FPeJAmCEdaOP53nqNkqDe6SO
         9TULG5WlC2BNKN71QwegwD/Jywm5NViMV2HsHmoXZZvzw8pYLIVOdZKxKqrOUlf5KUKT
         taVg==
X-Forwarded-Encrypted: i=1; AL+hErEPtnZ8PfeP3yX8D/ESiPM9cFNdXlZqXD10xoQ7pGnj2wb0kaYK3ELpSmG6mwbRJ6c3olewuwhIFL5hOAw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+XL+1Jfo4OGhdf8NukdD2jYVJ1BHqoeSFfHgmku1VjeG8swK3u
	jr56kN5NVl4bj29P8PggdXAgXMrY5VAECTUcsw+/7xg9TkJ8oI74PJK0
X-Gm-Gg: AYBFou1cWxBZLIhe1V5LhPNtaTx3CEJdqjoVWF/h7yryDyZniOwIVIeoUypNLIwXAk0
	uWXXjR10OhUFQ1OsG0jh70zUci2Abb8jhXSY45EKl5jBWHkLhX/g8no/a8Vbxvz7nanUMqcGsLp
	+YPofqXc+y8sw0VAQhwaY4NFzACNLSsToshq+Q4Mq/04V5oSddDwzJvHy3VyPRWcOcEPilsGoTl
	G13v6IZqMAjcC4Es93L/0b7WT1O1/DGj+U26K3El5fRiyBiyReZzWvUIDIX+5wXg8rucZGrcXR5
	eHVzPyh+l04QQiHntGueGo6FAkIe2jwJ38RH8MG6X3XUBpPO50DS7gexZfx6F6Yq+nQCx3AoZAk
	Ax8paMnZ0BX+qHseFT+u+7L3wL2oKucC4g5/WeXJQ0KEr81V4iGVMPqHKFhqZcMx8722prwwElW
	SW6n/MRdCDHO6GoRc+7AYoeS3I/lmsppJsxsDoHzMnlfk2+V1SRGOf3oD2o2QFMcf1xfthE+QwQ
	rDxDzgULV4m0TpyL8EbBh+nTLxkhp7r7sBoTjywsIRtUXRaj5ESjwA8VYK81et/9NaLx0j7j0GT
	Ityk2f12MougviLwrGNeRVZw2HK2ok6+rSlgjyvlCXXvJKOdxMLljBtF
X-Received: by 2002:a17:903:3d0d:b0:2e9:734c:5027 with SMTP id d9443c01a7336-2ee0de41b52mr35325395ad.15.1794595424503;
        Fri, 13 Nov 2026 10:43:44 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0fa14f7esm13391505ad.70.2026.11.13.10.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:43:43 -0800 (PST)
Message-ID: <e068c222-eec8-4dcc-bf7e-d91ae2ef175b@gmail.com>
Date: Fri, 13 Nov 2026 10:43:42 -0800
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
Subject: Re: [PATCH v5 2/4] MIPS: Skip generic IPI setup for platform-specific
 callbacks
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
References: <20261113184210.470320-1-f.fainelli@gmail.com>
 <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261113184210.470320-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 10:42, Florian Fainelli wrote:
> A generic MIPS kernel can select a platform SMP backend with direct IPI
> callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
> mailboxes, so generic IPI allocation would find no domain and BUG when
> more than one CPU is present.
> 
> Skip generic IPI initialization when neither selected send callback uses
> the generic implementation. Keep initialization when either callback
> uses generic IRQ IPIs, and retain the existing single-CPU shortcut.
> 
> Sashiko AI reported the XBurst integration issue; Codex assisted with
> the change and extracted-function/build checks.

Argh sorry I missed adding my Signed-off-by tag here..
-- 
Florian
