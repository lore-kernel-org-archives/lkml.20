Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793843116;
	b=J8U0Wzj78eDF623eKnNSWBgAbG+7zItmDyMs0b2d/0rtTsYCF6Nhh+zbwxBohCejzXbR
	 c/cnAyeKcBqIQDu/vYNVhWwZ5mr+uu+gKsOLT6hxVz9+GCuLD+qLeXeyx7DM6xGuIL2Tw
	 nS5Nz0p82rwVHrgK51hRi/MViz5XUmCRutfpH/h8pn3X/G56nd8ieVjIjzPYmVM63C1ve
	 fy58zn7FWhKRmL30fIosPJQ2uTZiPHZmqtPkBv7QvExE/zm4oMhgPjRmgmuIyfDgCIHMs
	 aJIRulL2VXVAswavRUmAPkx2AWM6ihVxkNn719gYTY437GiTR1oJD1ACGlUAM/W8BSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793843116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=aw1j/DMSrkeRfjbyviCP/rue4/RfxPKGIkftd8fC4p8=;
	b=YbthPd8fLFKesyKjWd1i9D/Ku2OEfwjXQi9njKxUpHdY1O+GV82oVOWOsi3Gc6g0OlE8
	 MB8WtZ+HWojlrpdPdqeXHz3GosIA2Ma937Nto58oKZXiYM6CX+86h4wYTb9cXRLlPIlBY
	 Jpa7cbstii37KzIRXI1MNiu3t+HRLeGpwKSiXnrUD7pS0SGP5EczmQMS9dADJs0pdT+4k
	 sgM8LoLQ6FyFkQc6y5s3Ni7V1vDYjWjE2WOcATcu0ifhpjx+LokWKxZZopQaR4/QwAV5T
	 Z5SnE0uchagILbMkOXE947WcI8ei7wpXiw2OUBRLBW3i82E8GW2xAzsgxrwlIFOu/Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBAZvD7X;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F91606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F91606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bBAZvD7X
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb2893531bso775030a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793843116; x=1794447916; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aw1j/DMSrkeRfjbyviCP/rue4/RfxPKGIkftd8fC4p8=;
        b=bBAZvD7X2qxqnVxmX3qR10bvg/TMHOASdti/3z/WlQubvrJcW/AVlrGVDFL7ny89QK
         wJHOC/gKEtr9M40oqv3wqysmzIa7sTBr7W6O6z2fnCq0gvanT+rDqZ+R1GkgnaYN0plw
         7iwahSPNtBUhXQw31Zw7Uk7jziiutQy/ol+W2fa+vJovbbsGLfY34D5JjIcYLoeWRgDO
         VepUNrFj2ceP6iZ5dLKpk5ssyrO6pLAS/lJXTPFQkZuth3+WOyBDS66aJ5U0oK+PQi8x
         wQQPSSZBHEtl+75Wn/h/ugqAV5cGd2blf6pVevC4FFtFwFN9UDyyKEf9ybcoLOtvWJ7n
         89tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793843116; x=1794447916;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aw1j/DMSrkeRfjbyviCP/rue4/RfxPKGIkftd8fC4p8=;
        b=J7uLuH3KB1vCWAE/kV19D5jxOMiueyaNS4njqWuKBpUEMWd0/nE5PexcSv3WdnZt8K
         K80Iz6uxvQ6gYv3HMHjVzeTHeCLQ7FO/lSj0XNuWZpH+HkPWgeLC9fFtZmsKmoTsimqo
         YLbm+vlgwKQxY+N2qGdA1OJqZKdEQ6GhfAK8dfyiBFlfUU1F+IDlIMKSLdHXnZcMIXmF
         1e43VJUCdSO2f2W+oQjeivPSRYajJyq8nOAFazHnf2cW3BCLk9nlJCGHJCF/hkYArAwA
         RJMQs1Z0s4Cgn1Q7RzSpI2p3toTZxKp2o4y65KI780/lR8xj8A37APgQuAMpg1BViuOg
         tyoQ==
X-Forwarded-Encrypted: i=1; AKwUvBwtl5kn6QdqggOTTnxcuEK1LkWhT4/MkjEB4skxpubuESpp0zilHPGntKuTAPCZO4Qr0qOnQAHTp7/pM8o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9LEG9dR0FFoz7gqAXwkcXyucmVTJ/SnfVlbP6iKLpubrA7mrTy
	mpBlqkygql72l9oTU2ycxM9sMUgVLvMcO8AyESko6yFpW8DSWsQ3FZVTMpOnZoXTNZY=
X-Gm-Gg: AYBFou0RZcY1XnDV8HXTOY5+dF+XMWNpXyufUO8XQzGjLOtcz2X4p33jbQqSZUkaiTy
	oSDs62R0jt4J1SzNTg1FCKRJ3Q2mVYZRgx/XwsKzSoB1zvDZMdQ6RZyc5euMFKrloBlfyAleYZx
	3ftk5HC0I3EMpXhSviPGCPDTSMsC2sOIV0nH0Glcpe2XQTQe/hbUgOgTYwz1SH17YKcfOoaSh8+
	+M/LA3FrJnUc6Qq/Zzx0dbDkEdzxyJk2IO1P1xSrHmXZW8SwvhgOd32VSOnT+buQgzrciz/fkPU
	XNOufluJNXKfRiBSY73XGBJm2sTadfCtxX+t9+BIEpykTuT3aA1nk2Oipj2HUGqoxhMA8X1SoRH
	vVzyow588iUCgsAwfztvkp3b9MfUJAQf9CNo7vL1s8ni3g9KUvNXwAL3AdDMGbgHcgE56gbVvDr
	8fiNCaTO3h/VuTLMpnK84aFCfaEiO9kiBYbI5eUTBNuQkKSnsqimR/vpR5Lzl+qgmo9TY743jq0
	HhAmPubrRBI6lNnMHZaWFJq0gDfJVCGsRWu4K9vWgIqsfMv5wOs0IfdkevgzTAe6hmKKPM912DX
	6nMZs9jGS0Nh/MubmYGtbEVjq2MI7d/SVKGvv69vDXoPXtoVKhwScV6qMzYQqguEElHcaqeBVGD
	zF8aJLgcSNikWXOLe+nV+O/oFzA==
X-Received: by 2002:a17:90b:2f08:b0:3ad:50a2:9abf with SMTP id 98e67ed59e1d1-3ae89835db3mr14659660a91.38.1793843115728;
        Wed, 04 Nov 2026 17:45:15 -0800 (PST)
Received: from [192.168.52.49] (ec2-13-158-86-59.ap-northeast-1.compute.amazonaws.com. [13.158.86.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3131f8csm1307297a91.2.2026.11.04.17.45.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 17:45:15 -0800 (PST)
Message-ID: <0ee661a9-b642-424f-99a1-21c9731c53aa@gmail.com>
Date: Thu, 5 Nov 2026 09:45:10 +0800
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
Subject: Re: [PATCH] mm/damon/core: reject empty access pattern intervals on
 scheme commit
To: SJ Park <sj@kernel.org>
Cc: jm5905938@gmail.com, akpm@linux-foundation.org, david@kernel.org,
 ljs@kernel.org, error27@gmail.com, damon@lists.linux.dev,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>
References: <20261105013653.88123-1-sj@kernel.org>
From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20261105013653.88123-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/11/5 9:36, SJ Park 写道:
> On Wed, 4 Nov 2026 09:17:24 +0800 Wang Xiaolei <xiaoleiwangxiaolei@gmail.com> wrote:
>
>> Hi SeongJae and Aveline
>>
>>    Thank you both for the careful review.
>>
>> I appreciate the clarification that DAMON simply executes what
>>
>>    the user configured, and that this is more of an input validation
>>
>> improvement than a bug fix. Perhaps I was too aggressive in framing
>>
>> it as a bug.
> Thank you for clarifying.  But my point is that this change might be just
> unnecessary behavior change rather than an improvement.  What do you think?
Hi SeongJae

Thank you again for the clear explanation.

I agree with you . My earlier framing was wrong;

I won't push this patch further. Let me focus on the

other items that are genuine bugs instead.

thanks

xiaolei

>
>
> Thanks,
> SJ
>
> [...]
