Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0B42248A5
	for <linux-kernel@vger.kernel.org>; Sun,  6 Sep 2026 00:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788653148; cv=none; b=PzVQoNBCLmxA9fabBHzKoL1vJCkArwYVohtUOPvMH7vnL8rCU9epDEMF4v/MjE1acu45VE3B/ybJENPDhknJvte0ACgFAsMmaoQZ8jTc2RxYd6F3ImRHZQGKylPIN547BoSHAk4MPbuYGNUxicHTq/+zeXFXezxUFeJngvh8uTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788653148; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgLSWR6eGbwc+EKJrgtW4OJ3m5/LyiEQJPqdvPSsPIqtpxNR1aky/MMP/gYVvdHQ3zpiFb1WaU27uY1eT8FU/LAcyBJXtK9CqiY/CyrOytDEZ0qSvr8cJMUa/yGJEEH7GkXTj2gd3JbPreGlb/mYF/Qaj7eCq7kIkH0d85iMHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0eab380eso20140625e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 17:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788653144; x=1789257944;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=h9bGHzcQFhmmQfvpAEjUkXydM+gdGig9kW7/xTtyj5QkSUc10q8v6B5jDETlUAl7z2
         bNyXYbuiyHX0kVATj81qDxZJYEDdSkCvN7n2io7C/gYlywopnvrBs5WV8Hkignh1Mv8P
         rwuNJKPY3XA7YDGfFo62hIK3N4kZgDaKG0p1lMnL8Aquy5O71QCh3ut20R8VpyNygBsV
         Xdj03V2sRlKrBIn3P9F/h2pn2PPD1Qe5zLcffUKKto2NgHXRFXuP8QpesX67SG1EPuPV
         7T1ppIEWn8o084dP+oqe7L4HKdcpIxKDEeP/EJ0mGqhP2ZCuTGsusmjWKf8CMTyVo9I3
         TXJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN8bIfw8HUxxjf1UZO2kV/+6H4/lFXJ414FoK2ZOXYupMw/ivZdj2cOCJ6FaZb++1CUojiIJTFhnmkKsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mkKXM08FCy7V0c7Tfb41j29gI3m3XX/JMTeFZp/koKWQbazaHy
	TrNylPHNPyo/j+GzT/hasFgFPPfaGzTBw09t3QeFPylXhjPqqNto8Vjp
X-Gm-Gg: AYBFou3RmWaFrvcD93sokYDXKZBmFs54mXhZlALzFnSmcvaurnTKFh37zPVvfs8x4R3
	iZhqamgbLtEn1kdd+CG9aJoEFK3JxmGv5dU13swLhozbCUx/Bbx3ZRR8JybUK5Ya6v9eaphtoFJ
	geBrFqKEYtaB+Erz2TD2GHaYVeGQAFutvn/hLohdl0uYSZNceyp23eeA57J+LrAOZWTpA4CvF7W
	0QWEVTnrTNXJmfzTBze9Ft+n4Zr503Yz/7vPrqSiqiO6CulvqCUGuvk4N+gizVmCN1nCGACGFbq
	eWs4Q0VypaEYKjE2Ckt7sElK068eMRo3jgkQh6wt7HXFHDFE+g38QgCkD/uy0CzHN5uDnXi/VkM
	nREyu8St/bIrVygDWoAnh5B3aQhHXDaMRozW4rO67g0QD10SF2XKuhYA/5b7XmCSsIcNvP0j6lM
	qsNemxhY2RR5+MJPucJlJ27SgJUkYCFwZ3+pGPg4uG7c+1cJlnisKKwc5mNAG6I3JNRGe+V6B5k
	8z3EpXVL8WXAhnbz4pvrA==
X-Received: by 2002:a05:600c:c4b8:b0:49c:799a:177b with SMTP id 5b1f17b1804b1-49cf82be855mr139993475e9.2.1788653143599;
        Sat, 05 Sep 2026 17:05:43 -0700 (PDT)
Received: from [10.100.102.74] (89-138-77-243.bb.netvision.net.il. [89.138.77.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm414632675e9.15.2026.09.05.17.05.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Sep 2026 17:05:43 -0700 (PDT)
Message-ID: <8bd8c5e1-c165-4e88-a4fc-a7a93413bf1c@grimberg.me>
Date: Sun, 6 Sep 2026 03:05:41 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvme-tcp: reject C2HData for a non-read command
To: Yifei Chu <Chuyf26@linux.alibaba.com>, kbusch@kernel.org
Cc: axboe@kernel.dk, hch@lst.de, roys@lightbitslabs.com,
 yhlee@isslab.korea.ac.kr, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <178730451245.442148.11684394617763960186@linux.alibaba.com>
 <20260822014037.1978918-1-yhlee@isslab.korea.ac.kr>
 <0a6b07e8-3ea6-4458-95eb-4a63b6108823@grimberg.me>
 <178842720109.1034236.7954869548413684234@linux.alibaba.com>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <178842720109.1034236.7954869548413684234@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
