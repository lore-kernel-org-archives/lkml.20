Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793799582;
	b=FuzI32BfyQikJfAt++suDp0cm5ZZHZkOaGytYhjGZeYdLwVqyiRqLrLXOH7GozN52OV/
	 oH/oHaqLLIlANvH0uyotNtAf06p/diFcvgZKvWGdILNAo9fg/5vtI98VProfGaqEbV3PK
	 fG0aY3RVVbj1nXc7GRX1MmtkbRCrJ3I2+Ht+dAq11z0IxsZ8XGSHZPHWiTvihlQnLV6ps
	 V5wKlmeImYkGo/JYliVxP9lLRg0KpYZhFx9ik5K6+KO5m2A1fNZ/QeYke7/dAEdqMMBI5
	 owiM+H3MzLHZSLP+mEiIA3WUbmD30d/u+jL8nj4FCYxmb9NeZIpYXU4wTIjYuuDsPug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793799582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Lu6oIX/8hhhXX+/jHh7o/Ii7L+nOb7laO+bG3Z0feVk=;
	b=kCxduYXkenrvXd77iyLwEDUDmJiQhXau88692MEW/NwodaEEbvttydbWVfVFhQqdv3Yv
	 B7FLHzyeJLY4zsAQot+1G9tHb5zvk+RsmhpEce0cUZu7TeJmaQE4Emu+HC3B4kDyVj2Tv
	 AncLkw6GVH+9njRmxeXtJJKiRl5jodhEbJ3vBUhIiDerduU1+Nv7WovrqkUEIv4cAbmqf
	 2o6lsPkZvL0VobmYcqYTDJ3IBJZDIo3bGJHwIlKWL1DVY/mKDLJHBTGz7WmhYteQHR6HE
	 kBerRi6ptSHO97DQDcsSgO+8wsBcYvUuLFw/vY50bW791nTkj6WYiEv/Y3aZLEBbAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hAgqiMcv;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D2606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 13:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A96D2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=hAgqiMcv
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-536c8f958d7so5180111cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 05:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793799580; x=1794404380; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lu6oIX/8hhhXX+/jHh7o/Ii7L+nOb7laO+bG3Z0feVk=;
        b=hAgqiMcvcgTcz4QsX/ocvnzE+L+vb6JzBNaAFdDRoTBEf6uV+GvEXHJecqV7UtjlmB
         nMWep7UVAvhkBNXjf276o9VmYAotsWv/aE1y0QQ1rrr73UwPRCD2ZrQwOgKG3QBEVtRC
         WhR7o5wCiT1vj+NJW1Yk8ib+H3MGGL/Xkm2Xp2TlvMg7aQImIh4ciWiB0oq0ZB795JjA
         WUErsYEtbSIyL0sgofwmOFjD13SLPCnFnWlnZvM6tvoVTERuMrSJ1iBSZAbFcOBWC9V7
         JyzIz2moZI3RSsPMvsyXDPSOjJa9Z2f6YRKVSd20Ef2IFzjniiFxIj23G798/vUFQUk9
         3xXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793799580; x=1794404380;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Lu6oIX/8hhhXX+/jHh7o/Ii7L+nOb7laO+bG3Z0feVk=;
        b=KPYEgNJGGQW9WMjwcmWmK4HGbJYu1BRcNdeDrg59LDqh5RdjmG9nm3wgw2liSGf/oL
         Mssq6BV4gmC5KmspzINSsLuD+gIjwaREIMid6ORQyMeX55LNwk9UToJoKlamppum8wgj
         LPfuIrSHutDJJxhRtRfODfK7F7eCG7RlbG2BRdhcIAj57GEmENUC/2BQrhn/Oika1+NR
         BzlgBfwmROV46Q9HZYafWbprmWLzHGl3EYtionAUWYGxMQMYcPAQpEkUiwNqDgMKf52m
         OI8YBNTNjO430O5Yp3sYlYW7c6Nd3mfRv72CV+AGgwA0ci4qW4bPcqdjrKe3HSI7F//m
         66Zw==
X-Forwarded-Encrypted: i=1; AKwUvByMZkCibrb1OwecTmnQIYxiqZEVPVb0jxfxIZWSELBm3JQk8CHJhoYi2A2+prHwEVQSSrQBc10QssHUSSw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LqaN43QNGMBmUZVDO87s/gde6cAkExuvZCelUhERv8jzG77rw
	a/uIbWbpkq2qJkD4DfFV2LyPCt2qOsmUj6Hzg7OFizh4hMbDHVjgvtWJ03hIAH7bkpw=
X-Gm-Gg: AYBFou3TbVHrzrRV9CYc/59dzz1KB0HSu8fmtzv0qrt8no2sw0YURznxYZgBiPd6LGb
	ro95aoVTf7XF6BCLPjOM6WA3qqKNlMwpU720YXvJK/B0XGxqtEtLRd8prK6qIap9TwUIv5vIpuB
	e8WQIfeJVgHpYWPbTlM+BoYHKnqswfEjrcE5zbmxvw7ONPL8hymvuu8d6mFHiax7glRuPSptiUl
	MEAvJDlT26yy7OEhXBlagCoOtEcnBxPbJuvM/HJQZ06ApIndcpjKkqkQiqli5IItA3GaZ4RqjNk
	cidU1c0dPO3a1IsXKdunxoglDPvG9wo8vtRwaNus0ep1Xl8HM6yh67AuApIhhf7kK3jQTdo5rV/
	Wb6fOdu+8M19TYg5ATCPdchM+qct6yOmXZb0HfQFxcEaxD8mqG71FHdBcv1/ZUYiD6Uj+jDB5Rc
	/Jyq/8lFyyk8AqWACxYxcwE0dggnushjjAsU4dxAUyxpvjck0t/oYk03wLu8jl2CcRhO/VsMILc
	6RL84sRcP7KfA5xzfsmd6Jk+jevYwGwXTDkqP+kRUzEHvGeMcaREQHgyzIJ7MTzIFiq4iCrHT5z
	bARc99tRn63QkT/PQ3ygzzKjFgYI7J7Fqsg8WD5JFLI1g/D9wYnNoXnzLIkeiB7AzHQULQkfeLx
	O5j2Cib4f5Q==
X-Received: by 2002:a05:622a:a12:b0:535:10be:7d46 with SMTP id d75a77b69052e-542b687da57mr269211251cf.29.1793799580284;
        Wed, 04 Nov 2026 05:39:40 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b1086db63sm24026871cf.11.2026.11.04.05.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:39:39 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xObDG-0000000GBDX-3ZyX;
	Wed, 04 Nov 2026 09:39:38 -0400
Date: Wed, 4 Nov 2026 09:39:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Sandeep Bhoot <sandeep.bhoot@hpe.com>,
	Iraimani P <iraimani.pavadai@hpe.com>,
	Mamila Santosh <santosh-kumar.mamila@hpe.com>,
	Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 00/23] Subject: [PATCH net-next 00/23] net/hpe: add HPE
 Slingshot NIC drivers
Message-ID: <20261104133938.GP3889730@ziepe.ca>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030151121.1f232b50@kernel.org>
 <7d4583c2-e8dc-4ffb-bc45-e2121f824b14@lunn.ch>
 <bde936b5-1b3f-4987-a3e5-36ec5c4710e6@hpe.com>
 <2f831f13-58ff-40ca-a76f-3aca647012b6@lunn.ch>
 <b260f39e-2ac0-4899-90d9-3e9dbadfacc4@hpe.com>
 <e9937650-1354-4d66-95fa-3492e3821823@lunn.ch>
 <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3418b0f9-d053-4be1-81a0-fc938fc5a7ac@hpe.com>

On Tue, Nov 03, 2026 at 08:21:05PM -0800, Doug Ledford wrote:
> Top-posting an executive summary: HPE's ask is whether we should submit
> this driver through the netdev community or the rdma community. HPE
> prefers netdev, with RDMA as an aux driver, but needs the maintainers’
> call. A minimal Ethernet driver is about 48k lines plus 36k lines of
> mostly machine-generated headers (details below).

It depends on a simple question: can you create a functional ultra
ethernet device without a netdev and without an IP or routing table?
Like IB?

If yes then maybe you could do RDMA first.

If no, then you must get a netdev first.

Jason
