Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559940;
	b=QgEEdJIixY5DL+lWjzsHD3ttQqL1rlrlL8NI1DlgLH+iImigYyqATR5uDqQouTtdRw3q
	 rRTnBeliWMT+JFXThvvn2hvcqxU+rRCXTe3+ymEEBFu98/p72EaCALykLBEbzR2YUnOUj
	 GsZOnDxj39f/RLyT+9ja8TKYakfW81D9uc+JSXCha1hsZoyGeZCU6nPGUkEzL1LOniav3
	 4nEp+G9OHJSC62RFXki2awEY5ZOLKwZJw6WuAUFFslvpEDCBooWXM95qB13sIF2REGDd/
	 p1DvA1mHpYvfJY3w4At7J6wa6DNr68Lnmf+iXld2atxXSAKBLijOr3pcvsrK9Q9J9LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=e4bPcAILoFa159OMZMpYEpI9iPNGmEeupM4uWcOHC14=;
	b=eExtCJozwZsCC/L1hc/6tjodxWOtHyeFKs62ketJGjSmvMpRNVbBJDXwDymN2ss7F4hM
	 LCjvYfSYeK/pUhl8tW4etWD+qtzQ0kghgB5eDMniv4ErrS2DcT+Q4S9s1UPQGjoWxX4m6
	 9/VSALrPRENlCrAm4AM6cAPrOAfHvnwuzWeOYvmvvfzV/AX3qhRJsVeXiBtcKm7TWDWr/
	 b1e7p07/HTYYFr2mvg5+2J04ybFGL0SvSdvk4xdsQ5Z7GQv/q00HRYKvguZfhHozO9x40
	 DY2HkGs3Pc25nNvgVBjvdMGckitXrnyLfj/V7oZ2Xj2k6LZlYxo/LJOhJVCxHu8zoYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sfmDehrG;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DD060A6F5B
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DD060A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=sfmDehrG
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so1111110a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559939; x=1795164739; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e4bPcAILoFa159OMZMpYEpI9iPNGmEeupM4uWcOHC14=;
        b=sfmDehrGMuC54s47QTefOIcfqgHZa+7vrS3luDVNdnTqceF4rooXYxrQi01jbYr2C1
         C3fd0Y8Nclxu64x0i0e1Bikk49Nm9JsIcmq72LvL6YluDn5JL3hXTo1Dof29YystGvwv
         IghGCSDCUaX65mGLt5jQD0af8fBVNV0t3+GDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559939; x=1795164739;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4bPcAILoFa159OMZMpYEpI9iPNGmEeupM4uWcOHC14=;
        b=WAgffuETjVqYsfLMjU4JRD/lJPBdKSSYV5XZaUuvUHx/PR7gtYgN/rYriUrA8e+2u4
         xyOtC9iAUY3XndziKUCJqG79+vuPKS/GM7HHrDb5WjfqWVI/tVbNb5fY9trZ9C5QZlj2
         /enKn9hcu07HXcmmaZVgnEf10jMCr6iwoymvEftUR0poNzruM5fRG7zB1AxEgJw9nN9I
         6AChDoobN+CqX0P26zlVY9kd6aBBH9A/DYjIfLmrsQlluxSWgX3mboTGWfGbgbRZszXF
         qcuxpOfYHXqBmdDwWz41ZqlNDEvIkZdXxcAUWLfnfT0WzfD/BVzA4UwUG47sCltoDPnO
         HIRQ==
X-Forwarded-Encrypted: i=1; AL+hErH0PeQotzSSLsZcXHCz9w3PFNfEY/w5rlKuK/fDZOBSopq7teBT1Qi8mOC8d0dgQF2xC4WTWk8pu4KCWbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gCMW0wGVwdCDNIQld4LBEhl5j1kwyWsj53VX5RSmpJk++vlnJ
	CEzinayvEzY5X7S/GOhZbi8sChkX77MlbfZb167N0LPYrc+48/IL7x8uW8CZUthrCzM=
X-Gm-Gg: AYBFou2FCIqaeb1Lfh+Jcejeh9qhzs4FGMeeYLEbbr2bZPeOsD+WNpWLKV8zxvb2aPz
	7rcqp8fjlYVZH7V/HRtpPNNDmM/XSIrHpK/+j5kOcwGsoYGv9xF3Sa4aigpkE+iijIZcrlkG+se
	qvWQpyJwFP1woxUy7H1iS+LkVgdld3Q2kNxThJuiPdxDCUo/ymzs54IzpIMEdq4Dje20+ZZBA01
	qC7v5J0iEJ07vdpmwGj1KuLY9wxJFkBV/jN2l3Ed6P7KEIspFb0VwAto0YhRok1U0HHmANaSOmJ
	GxpzE8p11T89PTQP/CQJ4rcrdfhi+r+Wj3Ha3zqqIAaIyIIpL1qnKwTAqU3tomf47+zTMc2vKKr
	qqgNnO0IsAO5mctmOGJb0NNwqt7gBhI69v7XmGZX9zYgbxiESGrV3DsFYWlEoNP0K3LBen5d82d
	JsaifSmXAG/6O16FAwXyzOPn63BMmjVDTJsTMUgHBXAVCcIEr/Lr7O/UqgkKcWUSaHh713DiZ/G
	nAOtk+9d54oawxi0lRl7DpF1zaYmTvOwL+IZAwDsrO8Ao5JRIoMQ9WuOiKrgvVCAvQangnqAyhz
	2vlusIoNTGXs83vk8ls5R8dSj6u5iD3huL33835kUTf1CSTBmTvSDnXWiaJlMgyEZTYB4SaUR9F
	oYQ6qwZlFiGEaFlMhzC8Sbxh4KArGRnqKaC3kOEagngOfJJin/VXnoZWrQxEWbzzGxQ18nDnX/R
	U2Z1I6V0kwCv/KbgG5lbuhA/jMYkQ7Iz5fDa0eJ4OnEPU/hY6uC3r5jNghK9s=
X-Received: by 2002:a17:90b:58f0:b0:3b1:4eb6:b3a with SMTP id 98e67ed59e1d1-3b1b081887amr1718429a91.8.1794559939633;
        Fri, 13 Nov 2026 00:52:19 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad534sm7140735ad.9.2026.11.13.00.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:52:18 -0800 (PST)
Date: Fri, 13 Nov 2026 00:52:12 -0800
From: Chris Down <chris@chrisdown.name>
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, Marco Elver <elver@google.com>, GONG Ruiqi <gongruiqi@huaweicloud.com>, Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org, linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v2 5/6] mm/slab: Support disabling KMALLOC_PARTITION_CACHES at boot
In-Reply-To: <202610302123.687A961@keescook>
References: <cover.1793253633.git.chris@chrisdown.name> <617bbfdce4fb2689c2510f0cd7f9adbb3ab8edfa.1793253633.git.chris@chrisdown.name> <202610302123.687A961@keescook>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113005212.556c6f234712bdfe@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Kees,

Kees Cook writes:
>Swap the ifdef for a CONFIG-controlled static branch that defaults off
>without CONFIG_KMALLOC_PARTITION_CACHES.

I've dropped the #ifdef in v3. kmalloc_partition_enabled now defaults to
IS_ENABLED(CONFIG_KMALLOC_PARTITION_CACHES), and kmalloc_partition= is
ignored without that option, so new_kmalloc_cache() doesn't need any
#ifdef.

I've kept it as a bool rather than a static key, for the same reason as
on 3/6: the only reader is new_kmalloc_cache(), at boot. When
partitioning is off, kmalloc_type() still picks a partition index, but
every one of them resolves to the normal cache. So the flag is never
read on the allocation path.

The one place a static key would actually help is kmalloc_type(), where
it could skip picking a partition and go straight to KMALLOC_NORMAL.
Since kmalloc_type() is inline, that means exporting the key to modules.
That seemed like more than this series needs, but if you think it's
worth it I'm happy to add it.

Thanks!

Chris
