Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794688427;
	b=q/afrqRtpKmq1nxGZ700eyEB1FXlvCyjG1SHGkaFZP7lwc+ogIUrwcRVm+clyLHza9LF
	 2Mjlr7QP1ugEie62OAhwaV8St8PCFoiKHJQbDXgoSYLzilb7JX64xervVNURr3tDFn3Mu
	 V9GtjqPGKJkQhPIoY4+j+Eb9BYIJYejYtkieRErJ/2u/SNO3m4GuHHOMm03wYrQYg0AsN
	 9knNr9lW+I1fapmcemG/r07jEFKwkfAEnhykI+e04NmWzYPL9sEkB1cKfWoay26ZH2dd4
	 0fCBV7WOFC1Gd7WKVcHQwY+zftSOKtT5BUexV6nKx0Xqqh18XNG1KkQmtgbK2Ho+miw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794688427;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=mUNTxU6y4TEUEh2QskFJN7r1v0olPGCGxnMzFiH63eA=;
	b=Dpa46Mvwn6fwpuaGs5nbxrwvcALpEN+0UcLJS9A/IK2xJKQFaPjiDkOUrjiHbVm3CHD4
	 QeFx2Fteszknvz6cR1MBV3o97bZ1u3xQU8PglHXCJQHd4goIVLgYhFkE2ZDN9SJvDevBY
	 6XTWU8kEyodN3N8CKzQP9SGuUSBkq/ixC0sz4JR89ZXH9UDg0G1HtulzMuHW6Dw3QjBbr
	 GgbCsQXDf3SRHm4zjgkiK7FOMb1m9IQLHa0UF/frPGay5Zbc92+z5RzH8uCAAE3g6Wop9
	 JmeVisAMn4UguAPfTnqAr44Brqj8nDwTvvqatvO9pA5n6pJuKiOB55oa1sPaH9LGuRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=uymy2ub0;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDEF606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DDEF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=uymy2ub0
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91f332a4b2eso10280846d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794688426; x=1795293226; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mUNTxU6y4TEUEh2QskFJN7r1v0olPGCGxnMzFiH63eA=;
        b=uymy2ub0Zijc0G3JOCyduPFpd8uQPMdNsfes4Z2FXVzUBywxjJIiq06aljmqVRvGVd
         MkG2MBDLYkaODgkaRqb3LLLF20+YlPv3bRmudBF5Ue4T7J7a1l0o/v+v8bqhdJ8kfra2
         1x0B0TgCOS7ULF9jrFrA4Qc+Fya5NDoDUGqrVXqwlrNm99DvwiMdUe2PI/9OYQiN/UDj
         2A7NTVOz/NJq6Sb/wKyi3MsngPX7fz7chyL1hrTUwr9+2zEAVYCZUQU5AMGu4OOc2xEr
         Fq0ywvN0l4NKvjFJIbupmKUCqhzbndiIr2WMpEuualU9UoVdMmYN7OZVSb59JWktHXJx
         dlfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794688426; x=1795293226;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUNTxU6y4TEUEh2QskFJN7r1v0olPGCGxnMzFiH63eA=;
        b=DrdIj4Tn7f/foFxSSErudQLAxO9/DtpUXNy5OyWcq8Rkhbl8ZXIXWQXVpOHnn8aXHU
         5UqjfTU/lgZJFNbD8ZJSVLLtwlfJVqHDfu+NcTbzr7PVsPYWcg9Q2JwoiCR7cxRizmvC
         8qulEPZ6T3vE68VEq3AKfsyMNGwpFVi0+IlR5uEvi7LteyGyUp1BiY2WS5R56720ygcS
         u5OuWRp4dff6UB1N3x9PKeuEYmr4wxkp14Yl+MghN4qjFHYg8pWg/zjr2/upSi4AkBtB
         4GDhEKwaec0gQVuYi3pcW7LdRhoZ7uq+G9rbYwWJ8dNH7F+V61WxuWTvezQtIfxvvhlF
         +jQg==
X-Forwarded-Encrypted: i=1; AL+hErF2uG8zRG34S78ae0k4FOIBSNAox10EJVqUHVruoTtf4gbWUffet8webLRCevLX5JLE3ZXQdGw+ti6DM2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8PkAP5IJRDTEygeMLYbPOWjL09H3w4vvNV+OWEfMbpKVWsalz
	2qwhyA+Yen37YYJCg03pChlax5cNI7Asd+qh39+avikUn+ti6RO39DOSAE8vW6K/neg=
X-Gm-Gg: AYBFou0/xWKpU3YZOy75g9ZhQ+HAr1WOG364FarxdCMC8hCjSrkFSNzPb4RaZbnI62N
	Nymaj1Mr/fuS5LysjwoV2jO5/WpL1JoDSXJxamQgTm1XlETgSk2xAZi7hQAe7h1sFRBoaglAcID
	FKd8MC3vryDgLoY9BqdomSigSaw43Ez11UloHi7ovlpUijFikOyrMRVr+1n5r1zb4Xf5s5H9H9Y
	GUOkZQqlcFzKYc4vxc47e+ONlNbhxz1uXiPY4jyi5YXrKoWBWzCo6c79uZmQFoUi7bWD3k1QeRB
	YxfGK8FOCqZxEyl1E9vq7dUzOqwlqU0iBT4jykKevdGoE3Oc/pe3wm+bWNMGKTR6WZ9kRzWf4Jg
	akgsByds/B7qOou/pO5tN5HNGvHYdvePCIKx5BrBdz1M/Ntlc04rCqKq3FUxBwoxP4MPCdsMXbE
	m5BcPRKeoFr8Hrvz1YfmscHmp7wAtBZYCpkNucBOZDo9oBi5N6eamvyq+FLZv0lrq+xKdtR4AaM
	zJ4QFiNZt+CrQJDpKf8/3MZjshlE6QhkcF7IoTUl3sI/jmpobkA+DUpvrJ0Tz4NvsYUC1ahHg3M
	m9bEwvPun+1mxznbc46DD6myL6Z2aLr5eKh9/gNUkR+xPiIyl42j7tSI9GgqEP0npu4GnJLj7NJ
	jdOCCmXc=
X-Received: by 2002:a05:6214:5291:b0:919:7384:99a6 with SMTP id 6a1803df08f44-91f24246723mr103621956d6.41.1794688426276;
        Sat, 14 Nov 2026 12:33:46 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d954e1sm49818366d6.33.2026.11.14.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:33:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] mm/migrate: fix softlockup in do_pages_move() with
 huge page arrays
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: shao.mingyin@zte.com.cn, akpm@linux-foundation.org, david@kernel.org, 
 linux-mm@kvack.org, ziy@nvidia.com, matthew.brost@intel.com, 
 joshua.hahnjy@gmail.com, byungchul@sk.com, gourry@gourry.net, 
 ying.huang@linux.alibaba.com, apopple@nvidia.com, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <avifKRgR0Q4WPUNR@gremlin>
References: <20261108142831046W_fbNCAFfuY0BjHPCCHgi@zte.com.cn>
 <avifKRgR0Q4WPUNR@gremlin>
Date: Sat, 14 Nov 2026 15:33:45 -0500
Message-Id: <179468842502.482102.17860580592179578567.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-14 17:51 +0000, Lorenzo Stoakes (ARM) wrote:
> On Sun, Nov 08, 2026 at 02:28:31PM +0800, shao.mingyin@zte.com.cn wrote:
> > From: Shao Mingyin <shao.mingyin@zte.com.cn>
> >
> > do_pages_stat() had the same problem; it was fixed by 8e934ab44389.  In
> > current mainline only alpha, hexagon and classic m68k can select
> > PREEMPT_NONE and they cannot enable CONFIG_NUMA, so this mainly targets
> > pre-v7.0 stable kernels.
> >
> > Fixes: a49bd4d71637 ("mm, numa: rework do_pages_move")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> NAK.
...
> And absolutely not to this person/script doing backports, thanks.

Have to agree here.  This is just creating backport busywork.

This might matter if we intended to do automated cross-arch testing
on QEMU TCG on these platforms... on those LTS kernels... but also
mehhhhhh

Yeah we shouldn't encourage this kind of patch spew.

-- 
~Gregory

