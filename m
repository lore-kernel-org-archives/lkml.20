Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638737;
	b=kiL/LaGJqd0njfSoqd3JvtBwYJqapRJN4cxLjfi3jDRyGJIvB1t29aNfC/DnKkxNFizM
	 zwkinGHQvKhmvkRXMkPQUvymfgAh+7HxT+1ESLLNjX2qOM2M08wCS9iR/n+gMoTlSMvep
	 3xOpGot3WrElcX06nJ0NFQwOd/3wgzuxEHhmFAZU7wGvrLbZAA0RYKE6aaMMTLTKXdcHj
	 xpfSb0gD9LNEzsZ51Bs/sXg0ROCi8wXPAQ/73lnyOz/HdM2fYqgwIx6z4yd4OYw9OMA62
	 4HHWIOXu0BEjVdIEn1mXAgvTCAGIdelg5aWNtTyUKT7oQBScjM7X4qXcbtV8FsOYC9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=a1UEizqhRrALzFHTNmQJUTSrG4L5xUZaP4W7alKZj4s=;
	b=ZlQd8tXrQQL+WsJ81XdgycwhSZbhj4jbOcUYzhW3TBhWQqG0vj0LBaigL+dPn4+CiECH
	 5tqBrs4NhRRqj1o2x3V194L6tb9yVq0P5zlUsXWDDzYEPONJgdJz63fICT2v2jzjXqG59
	 rbnHXPVyYcrAWaFGclB5nHJWIvDJhdZ1co2KcQkLvgMqYptdU2oD7HjRRGUlWGqH0yq5O
	 otYOE5XeUl3aVAeO1Uvaiodxp3NiBcKsfMnd8GPS73c9PvR+nLVNLL1sW9yXHD4uOqDRq
	 FB4X7j+KDFn+g7JZcwC6MPPsnr+YYXBeDKPDV5TnwnqIt7izW37fzCFlbd6C7Rwpg1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxufiMKy;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D109606A5B7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D109606A5B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YxufiMKy
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e946155442so29329345ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638731; x=1794243531; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a1UEizqhRrALzFHTNmQJUTSrG4L5xUZaP4W7alKZj4s=;
        b=YxufiMKy+5T6HFI/woya2krFgptqtHLbGe3rwyLWiQZMTCIIxkoLbaDFYuinTxnDFQ
         jBNeRWpghfgUamRChITph1viv7GFidy9xg4+jtJoiBRdR8InNlMfCI05jOIRCkoqALPK
         GpA8ByvN7M6EL+H3AZZh2427QyqKSXxkbrSYxWIa2YHY8mR4wdniz25s+VrHilKMecZ5
         iN+88ridw0KG+e9+ILMExg7wzeDWazL5ZXxTMlsM1iO1815PwMqxV/JXNb9drO1a7Kqb
         GgJoT13jzZAsjaZuixpDgSYbCxuTuKN0hLBCDqQjivoCOgZsS7uIJh5fm89oD2UbzlHD
         fVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638731; x=1794243531;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a1UEizqhRrALzFHTNmQJUTSrG4L5xUZaP4W7alKZj4s=;
        b=uV1nbEq86Rto5qKW4fgrkVVCgVNmTDeHxwN1h1qeMGpaMM+3Se+JBgfbx9Erk2gjwX
         4YOMuIqQe1xoeP3ZT2WU8e8n33tWaLj3IbjLA8w3r7Uz0HXrcPyRehs8TX4nS/S97TIq
         DskCQfOMknKphNAH9T/N2KI3ExcoarEjWSIyPjEx9eHD0gdMc78uIHOaI6i5kirPtlJD
         7Z5OXN9YfAwNnnIMfEfwlSrgKXW3+0SAW2LsqWgLRKx92etpV9gaaiTjoXAlxagC9ZkK
         pSVEdRZBABgjQz+IHRmUs5XLcvYTR8jAbUx4kX9Sf4teCDojv7v9lgDkcgqWAt0OPBHy
         zxQw==
X-Forwarded-Encrypted: i=1; AKwUvByDTj0XysxhZChOH8i5ZHijXvvJJXxox/zMaw1YPcwuo7vc7qyE2HuYIz1LwgMR6e74vmhMhn91mhczKuI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Q5Nl7AjLKzVhwjZPBvFb7W1dSzKGceiEbwEtPI9VsiCmlSMeW
	pCHDOp25ZAUPPorUubK8eikQ5HeCn6i58V5Zpu0KKFjNjGwRDcUxP3Lw
X-Gm-Gg: AYBFou21/k0TAuIwGLmCAPyYrNRpbMiM/gYW+ruE6Jtbta/FrNwNK4Z5bdBuTXrkUb0
	Lr5pXvo1IEeSkrPICwt61mbGX+cSWqgmNPExF6W5WzNwsDEh3ENGG8K8mh8axwdykzkZiot1kQb
	Zn7a0qvoYRjgQ/JOi6PaS39GOJNl5lkhN1mgz8/tCvtL9XPUKyRFghA2CWIyePgek2TZ15UZpZv
	IJVQW8CI1dh/aYwK3L+IK/GEv8Fw0nbEqBdoHE/r000aUcETEhzgxt3WTKmFLd+LIFruMkwg/xy
	bu5pUPDVnXiq/XSUDMbgOvJwCYqzqZZh+p0SVyarvo5jOEHhvbZVquTWe/tkHpCskzm8aF9qQms
	fkwei8nNZ+06Eey5Mw8QwOKt4nbLLOZKgiAoKl2yyv5KYc+je9b5UG2NedFawWrmnng/7FWArXg
	4YIvWsWdaueEEu/H0Au3l75KqRZ8Oy4okgG0vHi65KZXN6wrHji4hBYEk8ZUb3IZk3MpBxGRRGt
	Nv+jPR9P8+AhyxGiW/9NZ9zQr2yYJFW5wI5oCpytjp3Bbl1rqqxSIuiIVXhGfH2bGPH4uWtnd/R
	GMPfpEZEcR6HoBkZD++Sh4HGBf9WcCuiLIlYfKHSDtmRBZ+r7DEeXdsUnEAbY/4lLAhG1Du+ZZg
	=
X-Received: by 2002:a17:90b:570c:b0:3ac:8897:7ba9 with SMTP id 98e67ed59e1d1-3ae8985d52dmr9637264a91.56.1793638731557;
        Mon, 02 Nov 2026 08:58:51 -0800 (PST)
Received: from ?IPV6:2a03:83e0:1151:15:c56:221b:35d5:85f? ([2620:10d:c090:500::4:97ab])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85d24261sm8776807a91.0.2026.11.02.08.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 08:58:51 -0800 (PST)
Message-ID: <ea9e29df-6f3a-4f98-a08a-d7efbee2ce9a@gmail.com>
Date: Mon, 2 Nov 2026 08:58:49 -0800
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
Subject: Re: [PATCH net] selftests: drv-net: pause: Skip support tests without
 link autonegotiation
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, shuah@kernel.org
References: <20261030173516.1002250-1-mohsin.bashr@gmail.com>
 <701c6f7e-e715-4647-bddf-48a1485afbe2@bootlin.com>
 <7cd99851-5bc0-4db8-a44c-a664c3f824b1@gmail.com>
 <2efe9f61-5a04-473e-bb57-12d2779ad829@lunn.ch>
Content-Language: en-US
From: Mohsin Bashir <mohsin.bashr@gmail.com>
In-Reply-To: <2efe9f61-5a04-473e-bb57-12d2779ad829@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/30/26 1:12 PM, Andrew Lunn wrote:
>>> Or maybe a bit more clever, have a quick check to see if the device accepts
>>> an ethtool -s XXX command ? looks like fbnic will refuse all of'em as it
>>> doesn't have a .set_link_ksettings.
>>>
>>
>> Yes, checking whether the DUT accepts ethtool -s is one options. We could
>> reuse the existing autonegotiated and forced-link attempts, and report SKIP
>> if neither allows pause checks to run. Alternatively, we can add a remote
>> arg to require_link_autoneg(), default to True, and pass False for this test
>> so it checks only the DUT’s autonegotiation support.
> 
> There is a subset of pause configurations which don't require autoneg.
> 
> ethtool --pause eth42 autoneg off [rx on|off] [tx on|off]
> 
> These can be implemented by a device which does not support
> autoneg. These setting go straight to the MAC. They are never
> negotiated.
> 
> 	 Andrew

Hi Andrew,

Right. The autoneg setup and MAC pause checks need to be decoupled. Let 
me respin the fix.
