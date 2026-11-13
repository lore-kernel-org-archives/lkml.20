Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794607763;
	b=1ChK8ZDwXYGOxXWkd6MPax+Cg0MGiBrlU3xxF3olQ1gZZi1VvU8cmpzsr+QUgfZCPOzP
	 8rSOn1qfq8GvcJ8nabAPpq0J5yGGnKEaLTHTAYgU3yIRJx8V3SlHoA0jvQrLftoUVHQV/
	 Wuqmgq0J6qvsULEouYpOms6m2bv5Yx7UA7+KZ8VLGu5UbnHBIS1E4F5ce0P3Bd9lCP7c9
	 MyTdkgDSuilb7aqXEZ0CpVkpf/ICXj5ExNX6WVQM6vkwMxmZ9AEQ4j1bEj5ls9PPyT8Pv
	 wwO2aXE/JBQG7llis7PnafEBx2kWXV3cX8mHhYWetQKctISsHyGvuaZZtJbWSw7KY0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794607763;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eAX2A50EYtJkcTfS6TxnLukDj/BxU0JA6j0fOn1wRUc=;
	b=DTNr8RxnMstZYLWh90RMmVpVUFkNep7qtIXBaO4w5pPde0EFbn+MBvBdZt6FaGOwHG8c
	 GJh594h6Hp6zWHqUU5iu833RRq2NPE4iimKQ+WovZsEbUk1TwIgqCtO6CjmHw6UBdMqCy
	 bKMSMj1kOOohU/CqE7sT+1+PsDOZUmUpEXLyy7XrLPUUYCh1oKy1pj+UHd0WawCmCbQq/
	 r5IfgFPlcj4xmzC0LNpR15/FrxIQ2iVAvSe2YR1NlgV4IIh9bQ8tht3SxKQYvP3twNHor
	 b3nRmSy6LZrPkOUjHp1EIRfeYnLbdbungRXNcOGrxFh8lqoDb+tQduhau9Wj2qJ16tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zpg9buxU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DFA606A333
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:09:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47DFA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Zpg9buxU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso10344715e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 14:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794607761; x=1795212561; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eAX2A50EYtJkcTfS6TxnLukDj/BxU0JA6j0fOn1wRUc=;
        b=Zpg9buxU1o9Z00Kb2GMN6SokzoV0WckspdEtudVGjsdPuxxztrLFHlgFEK4077S1LF
         ccK+FcYkH7eame7BwYSCSrZ+SgmKHGC/3iNuq7d9gn9wKxrxIW+a7SnzDJqBQlQhX0So
         CeQ12FKEM8mxDAXAMrkcl+d6nxHoJ5uY1T6LOVMUs4w+NkhZb+staBSHcC2nq8dIyQu4
         j0K2apJ6A4pXs5/IbwuijNV8E7saOQp4Olm4ydtRDqFS+YzxUX2WjzoVyR3Pi8IfAyi6
         o3C0r3dg6abjkmbW4hePM3Oao+mR9cDm00xLf5mesAGxXVA9XQBev+D7OZN9Gwh5XwlR
         nA8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794607761; x=1795212561;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eAX2A50EYtJkcTfS6TxnLukDj/BxU0JA6j0fOn1wRUc=;
        b=U8OQBakpwHdsZozN1F11aeX3hm4CbBSWdAKC3jLTHnW7eux6YffPu22P4cjzAD/GpQ
         vDYTuSFmlWsnE8chvUWRz5RbJP0t5to6vcJ/OvZxLzb15XZw16ejzOqh8RnP2CmDgmDf
         VTgYg9Il9f4xX6Jw/QZd1pVGNGVhA4lqs1xbOrik1UwdQ7bBUREIj6QuhqpGXlYkAx20
         W7pz2SrqrCtFF8YkWAWljzhhqSFb6J66xE65kssQqbdCFT2akU/NrCgHMhVipEFe0Zy0
         vGLjOYgWA/gyB9qAVtPpvYpRDXjQmKfCA6LITenhG9YQwNHwHDF4ICKUOL4yP0/Ezmw2
         1kzA==
X-Forwarded-Encrypted: i=1; AL+hErHSwBvfnLGV9gwDsJF3PKr80qYqUHLpQjF4ngR1omAz/dZjo4b3IcQXtPfwkKagpsxLmdkMFA40xaq9qBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JZ5bt29fOHosS0Q/gFwCR5kTPFro/9UaR+oUMCsRfgQkjEUC6
	nweWzknOA0wfOBeYmK1SlS6ck0R+eGWZXgG7zkGKDhmliV5PjQGqt5I=
X-Gm-Gg: AYBFou1DrBGz9elchWi6VeVTJ15M447mGr7bjMMFzw/TKXi3v8Y+Kb5AtG1Jauz0xOX
	vROp+MNW44ew2JsFTZD78LXaaypO4oGnoQqtcK//VXCl20N0u/bF9jvT34n2zvBGTBSgY7X/UkD
	noJh5teYSrysCBLFb0EOZaz90O0mJKQBLgexPpNQLJQ9c4D3YKViAd+8gzHDkjZyHpJaiEVcWBj
	W35ohlz0No6hTcWxm33PsEobfatWqQxWcD69BwEzydIBMlsT8mCeJesBmiqhRFvCgQCvGFUGD/2
	iDD15b5xBNYT0Q8uV0AteA7DpHMOEWa0XNf7Qvi9pcq/NniGEqkJLb3OJE1KEoPrEk0U9Xx833i
	3GnsQx72/1CjV2ZpprJYEGqYhcLW63fUbBnr8r0VXfTkrDPOQqH6RQ52mJLHvG0jJN2mjH/dNSO
	6DN1o71xvG0ZPRHK/LnxFWoTtxNwmJyf02Mx5LTUAxQYdtm6gWAXqT80o/bvxyDa0JYve7oZS9M
	cv9hY56YvgDHleKrwEXRraEV8l6GwH7mY4Vh+T36nr0RckUrbISTljFun4skEC8qHy+b7k=
X-Received: by 2002:a05:600c:8b8c:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb609ae053mr20773075e9.7.1794607761393;
        Fri, 13 Nov 2026 14:09:21 -0800 (PST)
Received: from debian ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm102617785e9.11.2026.11.13.14.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 14:09:21 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
To: netdev-bot+sinfo@kernel.org
Cc: jhs@mojatatu.com, jiri@resnulli.us, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 brauner@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net] net/sched: cls_flow: pin file with get_file_rcu
 before reading f_cred
Date: Fri, 13 Nov 2026 22:09:20 -0000
Message-ID: <179460776060.2603197.3619232752332382972@gmail.com>
In-Reply-To: <179441146372.2168702.5462633106767625518@kernel.org>
References: <20261111153106.580776-1-tristmd@gmail.com>
 <179441146372.2168702.5462633106767625518@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

These were found by manual code inspection. After commit 0ede61d8589cc
("file: convert to SLAB_TYPESAFE_BY_RCU"), I audited callers that read
file->f_cred under RCU without pinning the file with get_file_rcu().

The issue has not been triggered in practice. It is a theoretical race
where a struct file slab slot is freed and reused while netfilter code
still reads f_cred through the old pointer, but the race window is
narrow (a few loads in softirq context).

The same bug class was independently confirmed and fixed in eventpoll
(commits a10fbbe74e1c7, 0d8cd9537c641 in v7.3), which validates that
SLAB_TYPESAFE_BY_RCU file reuse is a real concern for unpinned readers.

Thanks,
Tristan
