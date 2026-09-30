Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E2751AEEE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777359; cv=none; b=FsHB1yqZVb6j1/cCDKLe50U3Z9lhon6dk2E1eNYJ839JkH1MJY+DDj/oVis2tN4Kyc2g/9larvgzASFIerXDlWxMurmQPj9HVpEwXOXLkEUZVRldHxScPYss44C5cyIKipcKgFFqCnUo4xch9z2k6D1L0ILbzOEoNQMeINC3Pd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777359; c=relaxed/simple;
	bh=BN8qNZrn5KUe47KrPph76MRZuWYXHDzUb9aSvc4F6Tw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKaSV846iRQjTqLyhPj4BBmRdUSs6KP0o3JCOmXYejtmD377k4sgca9CD2kcCa5Fsded6rmSe9W2dk9dkfojLfg1Kaedjl4XCGRX2ZTNyGfTXkTX9SUtQ5cV4CfrTA0u1+KSBTm+GmRFdSX0c1gmumJE12z0wuaJpOO6XLHhgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=BusD2SQM; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="BusD2SQM"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48879b94823so652558f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1790777339; x=1791382139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tdG34iKbPg/dwz5nj8mIvaNch6v4ZkxNF8npErR5dgw=;
        b=BusD2SQMeNc9qIwPavPHiOm5OZWZJV90oDDI/3iC5w1Nd0OUfddlgAhdKoB/0O3aHL
         geVMedIw7bU58L8CMt54+jF7iW8pqbUcmTxvrXDrGMFBb16mEGtxG4teFELoOapcFfLp
         bMxVW2Mg8N/M+t2vcQybJEhlIqus9xRCQKJVr0bu9qgZPY0uc+5ZQ8jO2h4AWGVDUPE7
         8iBVT/CCxZ9Th8+YeiFUZJufc27/PvZR6oq51kmJl5f3ez0lnDor1UmOlPsh4hHW2Ly5
         IhZ127CjZqiUc5xhm8xHrN2nvS4bmyoy8RO+C0HNRBXuxim08CVrZ8nunlzddNnGbfxH
         jYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777339; x=1791382139;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tdG34iKbPg/dwz5nj8mIvaNch6v4ZkxNF8npErR5dgw=;
        b=yjYdRu6rSh8Ufsu29/sivtj+WCCUU2xGgvaePavOwWgcFs9Gkv2az0bBqQZTxaLAgr
         S82G7l5QiKcDiL23LKeXcxqYOKh2wCNJ4uKVgPt16FViEqr2B21HAiS2zvJ8RylyXh2F
         5WgI3eSKWk4obgr8P9KW/Nvex9BO+0EO8Ak7lxku4/9c0vNwqaL766ak2pzjfE92Fjma
         igC4kE3oC879oDs4VY/c6YJRDd0e/IrUa+tD5bkFVoiPuPfCK7GuaKc4DY1VTYZCST/p
         gCu50E1PaNliXd7EPo3/bBaPlzJeSVJmbOb2cw3U+B2PuVO1HtuVcVBP3Igw9QqcN8O2
         jVWA==
X-Forwarded-Encrypted: i=1; AKwUvBxKK4apcqQwfXFfNRo8EULKh00ZETihB71S6TYmMOFxkKtB8Yiqp0sb78qDa7nMxG+coCUONPXaMKjVrt4=@vger.kernel.org
X-Gm-Message-State: AFuF++mPCFT3gbh/yrjpsMYP3RKl28nLKVMvhExQSFeDMtM0eEHmRCKB
	plaYSy2z43Dtv5IB/b+JHKbmHHa+LkRi35s+fRaPxwOdMWCZqNieaeHLg9YFSOnCzI8=
X-Gm-Gg: AYBFou3k2vBwTwnwiiFq4T5Rc8t5ix3uhvIImtgOy22wiW7ZfBUgfX2FpsCLXx+ZDZz
	61RTPinwDyLat+5jMFoEoG9QwIVFPMkJCdPbzFfBgtVuAQVk3tZvxFKye6zyQWnXGkBty7CDWgo
	tHj9WkbN+2vfvbzhZulfTZ/LInZ5mO/bgee/0/FYOFfgn/wVj3ImUiSOLmEn67I/1R7SMBFS9+f
	nNn8zEbxyPIZh+gA7lkXIW4vfWfmSzojM8MLzI+Yv9yzbXF1EUyaUkpY/hNNeG1IMGq+4SlQ8QE
	1HsvX01/Pog9oZSHCfPtVZuAp5lngfm1X+vD8yNZEvl7xfJjl7a0HqyjlknPM0PR5Q9likM5Y9D
	01nQttFp6AzUJJxDKjLAU3vb/F61bnkitMFWMVIBGmqT5SVDmgl7iEVzXtpznIx+wqJIxGgAOIX
	gqbgu7FeUPS+7RPGSR/4ygWtPkLsvSYtlPFrcOK64S9SfKqaTQp8KrMuVmlsA/iNmeslPLZks4+
	cw962nlmV4hMyzZg2RXzgmO1oK1NzBiCJ6hE60bSFsYvGHC0aI=
X-Received: by 2002:a05:600c:628b:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-4a01ab4dde1mr25863645e9.0.1790777339323;
        Wed, 30 Sep 2026 07:08:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e64c322sm2327035e9.4.2026.09.30.07.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 07:08:58 -0700 (PDT)
Message-ID: <7d8f1378-d5a6-4a87-82cd-98eb794f85f2@6wind.com>
Date: Wed, 30 Sep 2026 16:08:57 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v9 2/6] net: change netdev_hw_addr_list count
 through helpers
To: Yuyang Huang <sigefriedhyy@gmail.com>
Cc: Ajay Singh <ajay.kathat@microchip.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>,
 Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>,
 Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Kees Cook <kees@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>,
 Kuniyuki Iwashima <kuniyu@google.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org
References: <20260930112842.21323-1-sigefriedhyy@gmail.com>
 <20260930112842.21323-3-sigefriedhyy@gmail.com>
 <235a33c2-7138-4815-820d-793568757d95@6wind.com>
 <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <CA+7S2v+VaVYksOpuUKzo+DoWZ97M_XKvnMr8cCcgwTkrOxsvEw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 30/09/2026 à 15:43, Yuyang Huang a écrit :
>> If you respin a version, you can use netdev_hw_addr_list_count() in
>> __hw_addr_list_snapshot() also.
> 
> Thanks, will do if there is a v10.
Thanks. FYI, please don't top post:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst#n336
