Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566923;
	b=GYZwBVV0bZ3ozSGjRFBnRhgEliJdiTLJ8AYJxtVUqlShmbjnOacw3FCjOCmWaAJZIUls
	 sx74DgfVOyG1ofEidn0rTBiV8mB5WIGcnfznt2KPRFz7zR6zymXaODmXfO8Qn0W0A3nyw
	 vJwm1Ca1bWn/hBpa23HZ5Cs52A5Dnibt3qhGeRBKXV6JU2Bt24vkcP6PBB1kSVjCffCp0
	 VVO/Z+WzelpoWWfo/Zi1VYPwGeIinn6flO87Bz8k6i6tFfwfVjDEsDcKG7Qa3vBKt/Rb5
	 sFq6NyKPVfrN2XRGK3duQe4sddV3nsAhMZJ1Cit+DhQkZ2upGl6rnCB1VoVzF65T/2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=VJxPZMTDTlkRuxk47N6sxM8yWbIf1M+mMGAPTSzyXHA=;
	b=glVLSfvGzh3tDjBZWHvHv429if0/v8G6/MNOpKyN5+AeTE1Znw2AB4crOg3IAyhLxUqm
	 5Knku9++MMlz/5xx9A77Mm3RXvxmc9OMpCKkfJR9SwUC/PFtr3i0RpvOhZvFCeOXnwgRi
	 +VngciWAu3Jjto+lEhZf0/sRoKT2QrUbeMks/h8sb317/cqNbuJpA4Ts5BtVjF9Bdmyb8
	 ugfxBBYnylQoVYHWmS2fRNXwx5Zh/2C5L5CDBa49ZFc9L44As4eOAhLoeUBORZn7xG9Jw
	 S3l/3kboX671gJFa/UpZ8jSsyXRdCHgD368El0pqRomg9B9Do6f+ofE3fNp6M15+X6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aLqDypN/";
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286A7606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:48:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 286A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aLqDypN/
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso3907955ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:48:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794566922; x=1795171722; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VJxPZMTDTlkRuxk47N6sxM8yWbIf1M+mMGAPTSzyXHA=;
        b=aLqDypN/QcjUsI/x/ysWk/104EpShkzolZGcZAQSR2DS/ZPLmvV0bhD8+tjOb4zDKB
         3sG+jLRGCyz9a7sVjoc4PlGQimcPpsnfhockjffmdP4Wpc3HYSvt4CZIBb+7aDZdaCYA
         NokRoDNDEWSsX305alhvyQPDnjO6+b3v35gSPopoyefm0nkXnweC0ranoFoWSaITnfCe
         oJTRuTovP5aqfLVDBmmwxn+QzijxyDJGO1hgHWWB9lSiMKklmqUwnkm07p6o92s8dMo9
         EtA/j7t0O1uVE6BjX7IomtwHo31wBW4XFU5b7gACnRww7mDZmfsr7dD6Y1IbPujjGdlv
         B+pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794566922; x=1795171722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VJxPZMTDTlkRuxk47N6sxM8yWbIf1M+mMGAPTSzyXHA=;
        b=gK90RINJoPF0f9q7s0Bsl0foVQqc5PQuDp1swTH8MnFg0+FASJhdd3CntZwn7KPyu0
         G4mCmoS0PDohHOJxOcTf3LyvL8dghamdL0CT6XKpatbJ1rvpXlFDlC0IY2uXn3a3nmHp
         nr4k63ilpaldS6aWr/oXWb444WPn9n078UEK5kj/3GPzC0entCF+jNzdptXqCAvrGLlj
         qkPMiaMLwOR8UO4VXV0inoWQdF++Oe2TykgaoF5rc/v9EE4d3QWbJKJ84IaffoYWjdBD
         pFNjgSTmcmme0G/s2RI1DkAp8OrIJYOyDPRFbPnHasjKSatgxzumsBgyRjPgIDrFOLNv
         sjLQ==
X-Forwarded-Encrypted: i=1; AL+hErG2ALq/D3/I+ef/Wkad/1Ct9tXFQ/jVVVvyT0z3RNFyaVwMK2PvlMUZwugPvCqIwoRsCDhoE/7MsOIseWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Q2mYW0KdLdYVEOMgxLLNb4cZMMhoqyt17EKeITFW39VpVjJv0
	A+P9Vvw7NiiItMrhF9oi61QDJR4o9j6d8912StfUukeRznQP6may50dR
X-Gm-Gg: AYBFou0XC/w2FCZtD6o2JDURDQeKg7lDTkZooQF6e+QUx3WJ9wB189APA9KL3yW4tN5
	p60hEJOHxosS2Mhosxoi49wcO4rBscnjqf1nizJREIXpW9XExhlv21Zi+snFmJLZLwRuCMwZW/l
	WqEUKrS+xvxlbuliLRjpTShCUyoZoiMBwSN7mLIETOUKwu94//KL+tmWGzBgR0E8uvDMC0QP8M7
	GJsoq1gl60We/qWhPj4LPNOtUZGdMTyjcb91ZJFZmxmofevYlJZY5cYIydP0/NzivXm28LEeo3M
	GgFGw8u5auSc78OVSGgtBmlPL/dwk1v1dEBeFiJdMZnDLfbdcJYzVUbol+M6yMAQu6/K/6oaNo9
	PvD5PFj97BAbwxLkjgnpq9qCg8PIR3mlLpQi+mvs7xIG4JqfHApQZoenUTsu3lG1I1I/PaXg2Wx
	oZ/qYf2+hFrWiuiY6YRVzouiS84gvmvLz1SqipaXVfu3HP47J6C0/UlL6YaqelTtV4tPwrnnSL9
	m1SuVVgEtrWsZJ0riQ8B6VWKwnFdnjBi5N6omKom1VJBmKDCv1mDdI6Tl7bstTgvkhDH8/pnulG
	+9iScuML0et63jFxgsRqLv32vJmmniIjqfBc0tsv5/FiCYOCtH6GssezBrZvmVhU5whnADRD3yn
	JxTXX2T0mBn2RLwJbkh4=
X-Received: by 2002:a17:902:db0c:b0:2dd:c100:4248 with SMTP id d9443c01a7336-2ee0dc35db0mr20668645ad.44.1794566922402;
        Fri, 13 Nov 2026 02:48:42 -0800 (PST)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75c875sm8140875ad.15.2026.11.13.02.48.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 02:48:41 -0800 (PST)
Message-ID: <d2b47b79-a579-4ac2-84ef-de477dd84a66@gmail.com>
Date: Fri, 13 Nov 2026 19:48:40 +0900
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
Subject: Re: [PATCH v2] docs/ja_JP: translate submitting-patches.rst (patch
 format)
To: Akiyoshi Kurita <weibu@redadmin.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261106225619.12869-1-weibu@redadmin.org>
 <20261113024405.871312-1-weibu@redadmin.org>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <20261113024405.871312-1-weibu@redadmin.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 13 Nov 2026 11:44:05 +0900, Akiyoshi Kurita wrote:
> Translate the sections describing permission requirements for
> adding tags, the canonical patch format, and subject line
> conventions into Japanese.
> 
> Update existing cross-references to point to the newly
> translated section.
> 
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> Changes in v2:
> - Reword the explanation of subject line sorting as suggested
>   by Akira Yokosawa.
> - Translate "global" as "大域的" instead of "世界的".
> 

Looks good to me now.

Reviewed-by: Akira Yokosawa <akiyks@gmail.com>

Thanks!

>  .../ja_JP/process/submitting-patches.rst      | 108 ++++++++++++++++--
>  1 file changed, 100 insertions(+), 8 deletions(-)
[...]
