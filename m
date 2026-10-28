Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793146329;
	b=avk+8Im0uzNtqxSns2STdXkL/UVzDS1xurY9XBWAqK4WQ4zJ3/NSVDe0srINV0UMaq+D
	 RNc5ggsoI339sZRoBvi6A5SfrT3Gt2gUiX7qfWDP1XcruppO189mCah6R8ugJ4XNGYcPL
	 0SGrkNSGao2KPdDMHYAMVlq97lR9rp2BR6h7QfnVr0GMgnLAtN0XBxWyxtMquZGC/cn4x
	 a5XCw4t8+4497P0yM0E1ooO87KdH+SB1lO7xUvpViG+bF+xhatKsA9//hc1LkcswW5Ue6
	 ZYvz6SvkDl/rhZTUURZDRggAqQlAutMwIHdDJN7BlouFvwm8bHNT+7lfU7tExMJLLFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793146329;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=X7/TY3AgukGfoieSJDQxLpG5Fggby8BROw4KBBUkUhI=;
	b=0eJo42/cjajdznP4+KgJ75po63xeWhS6Zl9VLqYb1Z2PgVQJbiSQPKlHjU9THrNLp55q
	 XkiprqJi8Huz05l4o0wZ/e9VyjTfHZwLtpTQ6pVzIA/91VhiYp5oipdhrXjHOF6OomR4d
	 QHSoV97iypI9IABiAtWdoTuPy5hwdBsz+g7RFJNfg3j/IQUzrlzT77S7elxMSQU6z7a3j
	 91wvZNpPABoUQDFCnEOupoRPHPrx41X7mZP3979LBtSWLIKxGz8LKqEs09RXNnBfe4ChP
	 Z/5sk22e25Pi5lS2VLYLv+2N6QoXzcEjjHAaehAE8r2ywWPy46P59cgiTFJsFUpRcUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3vjEIj4;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD4606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43FD4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=J3vjEIj4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3514b90bb89so790141eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 17:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793146328; x=1793751128; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7/TY3AgukGfoieSJDQxLpG5Fggby8BROw4KBBUkUhI=;
        b=J3vjEIj4VNTW9zJPu6xP8J//CiufUtoWOvE2tqsVUE6wmkKpeo6OPGbfMBQ21xIXYk
         a0o+zY8whCEOuDIWAzWsRfxM8Tzo8JJI0YEUk6AEbpSz0VV+hASUzkQDRDXUtmEzSPeF
         j4/0GVA4WpsUTwbOOKzHZnXWqFh64GOC/7zDm06IikH3H+3C9Gd0KalrW9eJC+W3ttnu
         iE2ZbLVM06+utlh41bE8CSU5VZBcvmMrkgdxm2BAxXyLw91M+IImGl6dnRmWDgxRbuJ8
         ZD+TJ55TaEQK7i7ibP7XRHac/XCKmce9WMcN6evVVir63HsDDzT40kgjVGYxcQj1jWu6
         KGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793146328; x=1793751128;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7/TY3AgukGfoieSJDQxLpG5Fggby8BROw4KBBUkUhI=;
        b=vH2x43Gtu88cQvO7nnpJ03HKfdCqQQmDbi4YBRo/3ON3gnDoS6r0HP50EHI9kAitJe
         ysY38eUzrjExiyjnpbhS+PMyRpBL5ez6/zMWHbOruN4DpyQuIS9xUQ+5vM2Bnj4Ux9DZ
         vGks4pn3XWA7KIwpWpxZbELObNjYh1r6ooVkfPXm39PBXGCLTLnm4Y5Q3cedZqvN2GrV
         MEX9HzJjcwrJXQz8boJCewEjVknS0G5PQW9OCAzYmmW2fnJFQR67mptdCLbp+F4Dt8p+
         w2o6rraqPUI7S43chmdrOGcmst1+NSmu3ypMBv9nz45FWhqJbeshnqSp9sjq7nbuJkKg
         3y8g==
X-Forwarded-Encrypted: i=1; AKwUvBzTTNPUrEZjoBYAfAkrp1QMv9A1rMcr91u5DQFIzCErsJaDnbKF4BrxhP0XkNJNk5JFb5O5qntFI12fUCw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYFRzHOn8bNhGHZismTq6xCUapP8sSHrmEwJx0mNqchRGFWJ2Z
	x6vgzuVVzwMsZ7Vr5/yw0/5OsD7lGNCLumfuE708J0eS9zW2AEQn5j4H
X-Gm-Gg: AYBFou1Gb44GYPqKij6J/1o+2SvI9cIWOJOF8lqygDk0C2OjIDI3cUrJsIAwhOdv22S
	iVXzBVc+U9FYTiKQb6brB7ibP9eBxxIeMqrPjgKz8Q5fHhjgLTKW3b7tscJvowL4O8rnYeAWCiA
	1qIqvX22qgEbj5gODnFrYGOvl0fZIrYnFutFfBBqmaqZPvHpTSKZbwArHGLiFvyMt+7wBcLDCYE
	zSKoNld4yjgHKPb3+S+eNIi/JVjRsf1jTRgXc776LZFksz5ZnUBRZszw72lteFfwRWVPkC53Bh0
	E3XGFxyffTGqnOl7QL/dETxCnwGG2ZYosJ8Lt/MQBVzgHRGMIrt2wn7sCunBCs8CN5+FRe+eJ/y
	brgtji6O2EWdGAU/oh7tinWFxIypLz5YupOYZJFneLtxvyLlUnX+VeX2OfFlZVuNWiGb9z63iFK
	nMDxE30/Y/AUQ0W/zKPMiLJQ1hW4mmpGj0mjgYSGyNzbJ7BcFodhSbQH3BwkRvjR70MJvMxl54w
	itcsFcRoT53t0JId8iFWQlj6Oqm3VHWMh4mINyeJCj3f2qTG84N9Wa4OhcezFSFAEkiae7qJHf9
	E38uMzcdf2eIPaOF2/pc7KraNWOL4IS0ZQ==
X-Received: by 2002:a05:693c:87d0:20b0:35d:eb9c:fce with SMTP id 5a478bee46e88-36a2009314fmr1308536eec.25.1793146328218;
        Tue, 27 Oct 2026 17:12:08 -0700 (PDT)
Received: from [192.168.2.21] (wsip-184-189-202-35.oc.oc.cox.net. [184.189.202.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a238da3e1sm461059eec.8.2026.10.27.17.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 17:12:06 -0700 (PDT)
Message-ID: <49ae504c-b22e-435f-b727-91db5ca7c0b5@gmail.com>
Date: Tue, 27 Oct 2026 17:12:03 -0700
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
Subject: Re: [PATCH net 00/11] net: au1000: Bug fixes
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jijie Shao <shaojijie@huawei.com>,
 Simon Horman <horms@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>,
 David Yang <mmyangfl@gmail.com>, Herbert Valerio Riedel <hvr@gnu.org>,
 Jeff Garzik <jeff@garzik.org>, Danny Kukawka <danny.kukawka@bisect.de>,
 Mugunthan V N <mugunthanvnm@ti.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Manuel Lauss <manuel.lauss@gmail.com>
References: <20261027223140.3774570-1-f.fainelli@gmail.com>
 <20261027162136.301932d4@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20261027162136.301932d4@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 10/27/2026 4:21 PM, Jakub Kicinski wrote:
> On Tue, 27 Oct 2026 15:31:29 -0700 Florian Fainelli wrote:
>> This patch series contains bug fixes that were found during code
>> inspection and also during fixing the open/close/open issue that was met
>> on the MTX-1 platform.
> 
> Are you trying to bypass the 15 patch limit by using 2 email addrs? 🤔️

That would be clever, would not it, not at all. There's what happens at 
work and then in my "spare" time. Things should slow down once patches 
get accepted.
-- 
Florian

