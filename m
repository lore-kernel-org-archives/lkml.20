Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830466;
	b=NdOJuRZC0Yz8b/j/V8ONFr5SUF16eRxOBOemYvdv4S3WeMq55DAhN4lailBqIAPwAnZL
	 bak6RD7sPce9h6/CzeTVvFlMQsN1F/cYqVc7FNq2vK65LLZbuo+kQuFvqaCA79KfKTBrY
	 Pjut5JzJRTWnX6uJorBUuYVVQuWufqQ5rsCzVYZYqVl5BTkG//zLMdR4+4Z7b1g1BFDWh
	 lw0A+kRAXCFpvuerSe+YbP8jcDg9sWM5ILwmGPgfGDC7bo++fJI38BOs/NK7QFHDsUupf
	 uxeZIEYgijdCpcM02RKIau/B1YbV9Tu/yd/NUSPWYMuCRGquC3HAUoE+KEseIJjSNYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830466;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=D2FzhDRzTtc/XzcM0zNgPuhyPMJQZQhyp9SQGVRa/yY=;
	b=Dss7uzk2sQlOLJ8IwU7syi/reHynSA/+ybZn9AL224uz498GEAcPOp++xBWuGSp6R1Ox
	 RqF4tIzLxL0xbY/bF8RWmXgXQ2YPTHsUdJpyCFyCq2HfZXuzJzXFni8mRg/Q/J9whPF5c
	 jrIjVZz/C0CN9Giu1WgrX9B+S62otqV3qHgZu7/Tl0KfceNIr2XiuzXELE81MkEvfxScj
	 sAKTSJxvFGrWExmQFbgUGl4kgkASEMNBccPC2RsZKR9v/3ZCQa88ZUlg8R13EepXleoTA
	 oAIT+9kk4qzux2N+NvWIdWN3HOqr0ifyKWk2thqWov12z5CntGjL5s611TMeSxHZdmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="p/GvMdef";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6FA606A851
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:14:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B6FA606A851
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p/GvMdef
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48afbd2c386so839635f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793830465; x=1794435265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2FzhDRzTtc/XzcM0zNgPuhyPMJQZQhyp9SQGVRa/yY=;
        b=p/GvMdefB1vncMm/eOc69a16L/Hb9Ony43POmEECNx/GKFlJCUsTii2GOBCu9HxbdS
         7X8iry+FlWqMou6UN8xvnPJHLAQlInT9uo8ixduIMdn4lp0N92dautNshtYZm+bA9JL7
         dWsSApyg+4dSzA9p6J7+9MvYQDON/Emnp4RpxFwnyrcBY2+n/40TWd27vUvna0JdnpjY
         GOZ5c8YogaAprRSg3iZlaNlPfOYrzIzpWrzVe41KcKS0pWkIf26d6seAElzEiS7U/yEl
         ERGNP7RJFdV1woymBOVyQg0+J21wvP4k5W1UuH3guoV2yjBnjViaXS5G0OTyBfmtnMHg
         NQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830465; x=1794435265;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2FzhDRzTtc/XzcM0zNgPuhyPMJQZQhyp9SQGVRa/yY=;
        b=cZmrEhOcjQaJ/pGK6swZFCFpdMcWTKv3+s8/fJgmS40hoKgcpnvqSZL7+B5v9S+0mp
         yzNlXDzEn/8nBJOEfjjcJSsn+fu6el655DUXm1S5K1/fJTiMctiM3/c87lMB2TAio9DD
         2Z2Rja1Fccgx06QbP7qoeosXS0jBctQ+FRi0CpIDkVr38WWqOxEivD4SScKqSEqwyWrk
         y1vuiF3kpDYdlWQYqGDUHlp/dSnmQ0IrAcVzXJK3Rmw2sTwa6wx2W3vtDkV89kJRA4JO
         wuFje4RwD5rxsUoHmmz7TEOU548dYwsk8wZpN9CIYfPH890h2A934K9ZqDkmGiKZ+XwJ
         IoSA==
X-Forwarded-Encrypted: i=1; AKwUvBxTEMvNBvB10kIpnLRtudXqhWZZOEd4WK9ftx/MU98x6K1xe+R4q3uqO+RdcLKn7npjB3as0lcU2NFyi2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z+giKGwPbyp1ObIgsikGFIPOP3b/rhR0LAqazSlkSyZMQWO2QIU
	EXB5dWCMSpXUapH42JRvT3BtVpKliq8sAYq3Y0WzeNC8BAz8M0BAQlO6
X-Gm-Gg: AYBFou0bsVeWdBcNWCa7t3b8Y+cruFt62usbVPbXxoFuIZ5creryAC88NMDGviacKQV
	ZvxxIMEv8hnYEXX5VOPn4Aiul/GqHwcYT3LXjx1Qz5GBCUaaZYy9R5rRHnKCh68OZHf2L5DFMnw
	QHmAL3t+KGOB608FIsEbjjXUgCCsp/RwerIlH4VAXMQA5KUxkedRJrnL5RCBmUjxEvfGpzg6bt5
	VmKXIVSv4REkWHrBuTH5MrxVG110N5b4Z+ndIj9dU3YX2Jb3Ca/4keqLxYhZEROQvKUFPqvpmB9
	jhUJVc8oEb5XGDSRNVafVt4mbzH86P947HDq7ZvWMhQ47LD3ZTZKxAgac+MmXZsfu/h9imMzL90
	YRf9p87NiOozihXz7BK4pWyrz3tRVYfRf6OEp0+RwFDWf/1uzdvyCYiLfVnfVpJ7lkfqi3ZigQs
	vyk8aFEPHBF3Prly+I6cnIwKMNEL4tLv45bVnDtnVP0J0PKW+5FcIWV8Rf3XGhb/Z8ERRRIVBat
	K/ZZUnmSnQG6YV/S4awWiqBxjDxjZbzXcKHwfnnQdoCEv3//iRGeiy0AgmX1mFyIgpy1IoHa0aq
	v9cmKIuhMhNNbE51hZO+XyDrTTiKRRZGUFFCHFFo2W0+
X-Received: by 2002:a05:6000:2c04:b0:48d:f7af:be35 with SMTP id ffacd0b85a97d-48e6e303f44mr39514518f8f.29.1793830464779;
        Wed, 04 Nov 2026 14:14:24 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed552aaesm6405241f8f.40.2026.11.04.14.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 14:14:23 -0800 (PST)
Message-ID: <ee08889d-4cbf-46e7-b6e5-3cf4fa8cfc6c@gmail.com>
Date: Wed, 4 Nov 2026 23:14:21 +0100
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
Subject: Re: [PATCH v2 1/3] kho: walk bootmem areas in address order
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Chen Pei <cp0613@linux.alibaba.com>, George Guo <guodongtai@kylinos.cn>,
 Kexin Liu <liukexin@kylinos.cn>, Sourabh Jain <sourabhjain@linux.ibm.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20261104-kho-bootmem-sizing-v2-0-b0d1a834780f@kernel.org>
 <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261104-kho-bootmem-sizing-v2-1-b0d1a834780f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/4/26 5:50 PM, Mike Rapoport (Microsoft) wrote:
> kexec_add_buffer() users may depend on the order in which memory holes are
> searched. For instance, arm64 places the kernel bottom-up and then
> requires the DTB to be above the kernel.
> 
> kho_walk_bootmem() walks the bootmem areas in the order they were
> reserved, so if the kernel lands in a small area at the top of the memory
> there is no room left for the DTB and kexec fails. For example, on an
> arm64 VM with 2G of RAM and kho_bootmem=8M,64M,64M, the lowmem area is
> reserved first at the top of the memory, the kernel image takes most of
> it and kexec fails with
> 
>   kexec_file(Image): Could not find any suitable kernel location!
> 
> Sort the bootmem areas by address and walk them in ascending order, or in
> descending order for top-down searches, like kexec_walk_resources() does.
> 
> Fixes: 3bdecc3c93f9 ("kexec: add KHO support to kexec file loads")
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
