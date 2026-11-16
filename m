Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845386;
	b=y1/noKZ39VRUPZOkAmC20w99PR9du9ZMYPQSaRaQSVxIzoMV6qAIJlj3hjfg/wSAr0Wh
	 tSbhgpKOy1TjjzmwKNcfRn5UeUfy/OryETUbBugvNfPJpE9cPuD4WwlBs1x+q212dgAIN
	 n4Atqc9OGF6PVgJd/kp7HmK1W/8d1TIgLenuCDXM38/OXaUKxLvbcTFc1yiLFdQyFlAWB
	 ntRzfyZhw5Ss6Y09g1MTJX7f32gFnIrx0SORLxT9lFoKb+xJqlVNNNxCA+Vz+qsF8PY+X
	 w3z5Mhwr5vCHaIMCHgTjuNR8Bnq38DG066DTgnN4usZT7G+cDyOjFQh4ajJxE6eDOzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845386;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=O/mwZYYaBoMRcXn1MKOiGJvQffr+SWgcNW4Z7wvG98U=;
	b=5O+yxcbLZdulAMqy+PKOCbFhs8YyBUnPFlXU6G9x5KtG5HLdaklWoQKXv6FJtGndxXzp
	 IopWTyfUl8ncCRg6P4/G+2ZFI6s4QtWJnFcLqg9PrJEGfQJibHgaJdGl8iBeOrhJDyaMf
	 U4/dPsBSGjeYe7ja0c9zhs7gZhhMBo0OCIDQA+6lmascVpO5QMkpWY+9pdoMakDkRlkYk
	 FlYs1pZoSHUntL9SwLAs9etwaefD3EezLuieVmd7Yc7QuFhdk/q7QVVJX3isROdj8YIRC
	 J/Sak46o7jmNvbH5Fsnkebxh/m82WeX3GVert2NlaZ7DKIL/0il+WDJpSD1JgKY5vMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Pwoj9ith;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F902606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F902606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=Pwoj9ith
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ecd81cd67so46484106d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794845385; x=1795450185; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=O/mwZYYaBoMRcXn1MKOiGJvQffr+SWgcNW4Z7wvG98U=;
        b=Pwoj9ithuYi/5fpoYzERLi4LsD3EQgXEzgL+h8/4anPHsJZ7zKgS7puJ446SO3SAbB
         W3q0/I+fZ7LsFa2hJniqO0eyxWwTRO2lIZiMrPejnATDLb7ZVkwcOJcS3JuThp/1ov1c
         uh+sU4u3QcN3E/nVGYI5boiGhypkvBsVpbKtyjdpIxRM3sme7xOwIpNARGf9pPi6ptr4
         qQacE8rnNtFvpW0JvJAfuFni3s5F2rE/ny/wl+xbkPOO8mTXCO/+/uV89aqC+MzP7S0P
         AwyDWvVIwvjwP5PWeC8DHD2u87uYLwrDzej4/2SF9O00iEmtPcoh1u6hGbMjh7A5uGlv
         sLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794845385; x=1795450185;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/mwZYYaBoMRcXn1MKOiGJvQffr+SWgcNW4Z7wvG98U=;
        b=WO4cKNbISkvsvOYFsLHinQ01l0ABDFS89g0fsc/JPNSh/we8KhSOsGYY8pLGmyN75N
         QlJDDA3j1MTKdmQ0fVQW+t1sQHk6ycX2tdXrE+sOz4Pk8QqC2RhZG3amP3lSIUsF01/9
         deE/Q5DDUpCbSAZgBjeUIDGPSwMBtdJ6EaiQkUF9KfJiaOqtDIoj8Z7hpDADAhARpHZ7
         JquNOKNX5ObbvbI9e39luIHkGYwQD2+BR0JvCiRAUfcOCJbQ4FNzyybFIXJ2jvhrSkxQ
         pxg+QAGCORvteswwsmXA3La96bcZkbwlWnQJCV5Vin7PLTIvOK8T83STpCqYQOl2s51S
         TcNw==
X-Forwarded-Encrypted: i=1; AL+hErFu72jl54V3ws+6fqxyyR7AIhDRadcnUxer5VO/AuzCGYklCPp86fR1HzjbQTnP4yo1I5ldMyHnXnSz8iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z99TmBSOHyZ8TOzV7yWKj8wISu4ZOP7ji9+7Gk5P7PAevkAB4IJ
	+0OlrNR2VEikr3dd/2vHOySp+FN3WfIVGiUL8PyvQZ1QncRqw9wCmhQ4qWnvYT89O8k=
X-Gm-Gg: AZFdTZetooJQtvqqu1T8kv7dDd789Nnpp5SVdhtj+wU5qTMRDbVEF6ufrd6l9fQ1SAn
	BET4maFj3p+ssOtBpn4aEm6YVmelFkllOs0BaB64jd1P9cxOR0a4LV/PEGlK+0yYMWH48bR26dv
	46ZAH9azhWAk89wVmtgLEoiUs5KJlcM/Zpi1Y+Zj8swVzYF8hHF5V9VsQ+gMN0fI3OyIm3zpQBG
	wLxr60DM3IUZSarWKoUwq9LFOpPIxhD8Hu3NYN9ZwXQrVZ20y6XthpqZh34lcl4VJ5gXZen16wj
	DmW/IxkVN4rHYjLQcA5bYfm9Cpxnsf0vSevbTSq1trsQFdRS/KmCpT+bmekGruwBeke23Ctmwrk
	Bb2oBjZ5f4Lr/0Cg3gQLBGJJ6mhIfP/Km16JQ1qhGIrVAhXqsJCP4Gq5il8if/u40VgeuSEVBx1
	HNOKhnnz32TLoywrygmaUaNrjZ5yxyC6cLAegRztTX10U27HzJYPsQnAEtAC1vKWYHn31HQojPN
	JPYmGYC4TsQ6EbxOVRGhMLAFH3qvqz01EyZ/WFV+n1/WhHQb2YZobNrS7CET4R4IWqiYySAdR9Y
	vbGXxvdp4oRQxUHDCCXVckVq1lLyr3qX+v0BILTWnjePUoSHhYh9k/twCTQ8fbnQqLCEDcBFES3
	7Vk7Fwu8=
X-Received: by 2002:ad4:4484:0:b0:91e:9ab9:bf37 with SMTP id 6a1803df08f44-91f2415f57amr132104666d6.14.1794845384821;
        Mon, 16 Nov 2026 08:09:44 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d6193esm88683016d6.19.2026.11.16.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:09:44 -0800 (PST)
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
Subject: Re: [PATCH] mm/hmm: reject shadow-stack mappings
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Alistair Popple <apopple@nvidia.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
 "Gregory Price (Meta)" <gourry@gourry.net>, 
 Jason Gunthorpe <jgg@nvidia.com>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, leon@kernel.org, 
 akpm@linux-foundation.org, kas@kernel.org, dave.hansen@linux.intel.com, 
 bp@alien8.de, rppt@kernel.org, stable@vger.kernel.org, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
In-Reply-To: <avpAQyLCpJPKSpT-@nvdebian.thelocal>
References: <20261113195536.2660763-1-gourry@gourry.net>
 <20261113200303.GA395967@nvidia.com>
 <179460249376.482102.14669935557901467762.b4-reply@b4>
 <20261114002027.GE3706007@nvidia.com>
 <179464112539.482102.8723246686117488051.b4-reply@b4>
 <2fc85df3-cffc-4786-a7a8-0f0a6347fd59@kernel.org>
 <avpAQyLCpJPKSpT-@nvdebian.thelocal>
Date: Mon, 16 Nov 2026 11:09:42 -0500
Message-Id: <179484538296.482102.4367398493158269026.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-16 10:48 +1100, Alistair Popple wrote:
> On 2026-11-14 at 22:11 +1100, "David Hildenbrand (Arm)" <david@kernel.org> wrote...
> > It's writable by the hardware, that's what matters to core-mm, for example, when
> > it comes to things like fork(), mproetect() etc.
> 
> Except they're not universally writable by HW, after all _PAGE_RW = 0. So
> pte_write() is documented to return if it is logically writable, which of course
> is what hmm_range_fault() also needs for certain values of "logic" :-)
> 
> So it's easy to see how this is confusing and got missed. Anyway this fix looks
> good:
> 
> Reviewed-by: Alistair Popple <apopple@nvidia.com>
> 

Thank's Alistair!

-- 
~Gregory

