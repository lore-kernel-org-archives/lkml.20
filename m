Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505356;
	b=ie501oIGdzOqqfljfuAI+wUgFzbZCn95YSibQ2RpKjzBf5RVvwptguBG5y9FluQeVdLN
	 t5YBbY0CYAJtRw+3/+CWvkZDiC5t9cEGxJa6Ik953GzCkZbXfZ2m0zkjhdISoNF4fNNzc
	 ODft+AjHgybUJW2i+c9DxCYbExu7A9kXX9T3m/RMnt4/cn0zdA5LYMgZmfU3ptpXXF/LE
	 4ztQbRW+BDvsEY8jD4nlH0YWXgbA4hHj+HurDT/+HJWjABq+QYjWV9DGb2TRV+VOhY1m2
	 opY0N6e7cM2KEkb4SauzDKci08EsdWZ+clQ/5XfXhMDwfkbK/YKo0a0w5yQocLQLIWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=u1NEdh1mEZe2kKVcz0g0eDrtNWhvrCkFo+Hf8BDUgg8=;
	b=Jvx/mgzfhyqSs7dX/pViAl2vuU2isDLHAugeiZJSWq93LPYV9V6bYkjzzm3xGDv9GnsT
	 CReQcwpnxTfNw5PkRYPiB4x3w81wlSbtu8H5k5Dsq9yvLGXkWdgL9rrJHC050M+RZlry4
	 zUKN6HPU988M92kcTJ1uxCI4qbwUh+E6aB7gxRMS0PdFJW31e/RJvTA6+SXCrrxzFtdtQ
	 O4/G81hu4VFtwISuMgG7sBbpL4Ym88JpHWoeHmPkO/xiqtTVR53vq8eKvkjrspa25Yawk
	 OCgU7Bjcs2X6gJlDxGm6/wMjjy+YPjdPc5TGfEGHaJnGCajFHy9qYSiVfkWJC2PmSvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmPebONr;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40250606A891
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40250606A891
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KmPebONr
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso7785a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505355; x=1795110155; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u1NEdh1mEZe2kKVcz0g0eDrtNWhvrCkFo+Hf8BDUgg8=;
        b=KmPebONrlKWW6witqDSPIGv9QobVTxveqKT9knC9PSB1Vx9RGei3Nt5h4qW2mwz6b+
         k0EoVuIC5KCdgcZykUUvbhHtluzKrG1Q6Yiija/1ZZmZikFkYTVCSq2OUYT1LP7w5DUd
         NiYryhxihRSuJC00l9IINTq3ZZ4AcqPYnUQHChqtZ3PDpXsxrc290TgLltMeLxOygAjH
         8yLATWSJdvG6z1fuVEaVEzDaUs8REGxiXhq2RXCEJXACcoM2QIchoit2Y6CBh01xnZA2
         HxYPSOIXn1UENgYjE59GsJCJvMMvFybqlxt+fXHCqT5bMRu1Yvnq8CE0CyXMyp0JDxTx
         PYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505355; x=1795110155;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u1NEdh1mEZe2kKVcz0g0eDrtNWhvrCkFo+Hf8BDUgg8=;
        b=vv3V9fFDyAsDcuzpX0i7Sw1bw06Q4k5bDWX6F9mvEvl9LQCP+zt/a9F1CjAKeIVt8F
         wsq42vgk48KPYy1QEVAf2DUcEb9RogKJtTl886/F4GgssyD6bl5PEkKpyA/FmyVMJkgj
         PkhoGrya4clweS72DwaxG5woWVvNUtTcCra9XqmMxloZLGGXQjF4iqEgSMWeN4Xk7t9r
         WMQ12A9fgJ9mLTdLGXyQYiwhhIdMOrj43RlkwrZ0HMesnaw8TnyUY3nkL6laqiy5Dg+9
         gJglvmv74nDOYWRJzNgJQye3bcAv+N77Sd8swQIuebsLigURBWePKMeBiyPflxw85uSi
         f/6g==
X-Forwarded-Encrypted: i=1; AL+hErGScSKKbXx4ShxGAx9bE5s6hX1/hQnXh/H4VCBqZuZeiONRKb8H2sfYQLZDxdWtJW5LuSsJqJ6PziN7+FM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pvjr5HehVKtyu0l6vGgFTZO6f7Xd6gJn5ya40N+e1EUtEuar9
	q+GH/Dn9P6EJveGi3fY3eJaMkoLLkoyFuqMbJQa18MLkVaLK3DZo+Hn/
X-Gm-Gg: AYBFou0EE3EugZMj7IcNugxLixZecBtj6w/ld230k6WgOUDp/ztzdO9Q9mdwP3QuTNm
	ROhzYnmI9QJCADGWw1j8jci4Zr38rDMyQuMWHoyBM0uZPwpyiXiXyX1cLXuh1RxpKTQr2VMPwcI
	sSUKp3arhjPE/vQudnFRup96iRE5/mBHI01AgXpQBnSVXI66YwWX9JWd+eX3Q/+R5P/rBpZe9R2
	JOPzsMMdi76n3jLAL0tlCuc2yDBtqJKOCVI9k/l7BzcieEl20Ax3C0+irT3WdqMgyyywtA7h84v
	ROQvXr9oDmXvcTiqdXkziEO70EvBZVzUHplxyulosKFj2kzySvIozmOBMsVnc5S+olV5/Lc2/wh
	s+EGsfCKYcBToRQ+qsIvzJj5JQ4ZMQdOFNnF84DPwNvuHVcywn18Rqwbd/iENyTGK8P9GzTQtyI
	4dSJwPwYRE8r2f7b4K1ja9h/JvMbuVE51p5/+UjXY2U/iwGIwaDNSxuQ4Rcqs0bTB8WW+tQ7W5A
	oVXE6yylvDGHBF8GIvaGD5coqFTmj72/CaN/9/i2cHw9TKqyU1kM/ch8M0AGX1/y7BCt35ISHzg
	yBdY4yiY1MupzbmlX6Ad/UG6JHcGO00/wnXkUNomgSFe9/mY8Y+zuOiTCg6iY2mAdWkeF7PljbS
	L9w==
X-Received: by 2002:a17:90b:3c46:b0:3a0:b312:1fbe with SMTP id 98e67ed59e1d1-3b182efb282mr5707612a91.23.1794505355301;
        Thu, 12 Nov 2026 09:42:35 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4b12esm37630625ad.21.2026.11.12.09.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:42:33 -0800 (PST)
Message-ID: <bc45c1e8-6904-47f7-9c96-512e024c9d71@gmail.com>
Date: Thu, 12 Nov 2026 09:42:32 -0800
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
Subject: Re: [PATCH net] vlan: prevent cross-netns MII register writes
To: Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>
Cc: Hungyu Lin <dennylin0707@gmail.com>, davem@davemloft.net,
 edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, n05ec@lzu.edu.cn,
 ylong030@ucr.edu, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261106124639.12584-1-dennylin0707@gmail.com>
 <20261112075624.23c04230@kernel.org>
 <706b09ea-49cc-4801-a24b-b22d2ea7d257@lunn.ch>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <706b09ea-49cc-4801-a24b-b22d2ea7d257@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/26 08:15, Andrew Lunn wrote:
> On Thu, Nov 12, 2026 at 07:56:24AM -0800, Jakub Kicinski wrote:
>> On Fri,  6 Nov 2026 12:46:39 +0000 Hungyu Lin wrote:
>>> vlan_dev_ioctl() forwards SIOCSMIIREG to the underlying real
>>> device without checking whether the VLAN device and real device
>>> belong to the same network namespace.
>>>
>>> A VLAN device can be moved into another network namespace while
>>> its real device remains in the host namespace. This allows a
>>> process with the required privileges in the VLAN device's
>>> namespace to modify PHY registers on the host's real device.
>>>
>>> Reject SIOCSMIIREG when the two devices belong to different
>>> network namespaces. Preserve MII reads across namespaces and
>>> allow MII writes when both devices belong to the same namespace.
>>>
>>> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
>>
>>> diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
>>> index bca0a3693636..0d0904103302 100644
>>> --- a/net/8021q/vlan_dev.c
>>> +++ b/net/8021q/vlan_dev.c
>>> @@ -416,9 +416,12 @@ static int vlan_dev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
>>>   	ifrr.ifr_ifru = ifr->ifr_ifru;
>>>   
>>>   	switch (cmd) {
>>> +	case SIOCSMIIREG:
>>> +		if (!net_eq(dev_net(dev), dev_net(real_dev)))
>>> +			break;
>>> +		fallthrough;
>>>   	case SIOCGMIIPHY:
>>>   	case SIOCGMIIREG:
>>> -	case SIOCSMIIREG:
>>>   		err = dev_eth_ioctl(real_dev, &ifrr, cmd);
>>>   		break;
>>>   	}
>>
>> Andrew, Florian, any idea if we could delete this completely?
>> Why would anyone want to run MII/PHY commands on a VLAN?
> 
> It does seem questionable.

Agreed, it does not quite make sense to me to forward these ioctl() 
calls. Looks like this predates the import of Linux-2.6.12-rc2 into git, 
need to do some more history digging to find out why this was done.

> 
> Hungyu, do any other virtual devices forward these ioctl calls to the
> physical device below? I assume they have the same problem. So we need
> a fix for them all.
> 
> 	 Andrew


-- 
Florian
