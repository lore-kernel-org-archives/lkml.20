Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294156;
	b=B0VDqMc958hawr2PwWrI+EDhQk9rbUNIdofDNIlEffWL/HtTfHakoaqbeQew+MuLgOi3
	 12j4yBwgwL6Twa+5y/5dZadILdjbEuVmI1f4NK1Xm0eu+Zi4G+XCpPDQyxFx9mcSh1OiC
	 Qn57lRWyYQryVwfbb3Er2i5hcLX36R5ai6eTVRJGPPnv0Brk4qF0cbh/t9321ep3hpJGs
	 s7NUtB4LyG7sP+FprDSKzsA3LyGegBzzYIm0jDK8jVsfJmQmXhB+C8IuE28GUOHh+5YEd
	 M8SxDJRQi+aj+q3J2z/1kLIhLLEasUj8x1kjaayWCTuYzJHc6wJPYMt/9B2P314y9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294156;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=4AC+76/KQ+QerS0vbEfd85krwo5e3I+GiqoZ0yXri7Q=;
	b=DTDEahF/5/bMW5sW7gdOJ/MbSxAknymx1L+eGqNH+xovAvdqLQ1kw1UTN2eFhrjd/gb2
	 DfBDynbUQeltgeeFD+BB0cfEZBejzgbti+vT5x2SckVBxtwCcFVnGo4Oo7g2O3cjDAjGr
	 hr0IeXLzN4QGWOlKFPsOjP6yMUZZ7PkDn1Q3e0udx1R0bGCfO6hEVGrFjBnXljPCD73ev
	 uhtl85ZsrRjmfHpRxX0RD54Y1kRzfreUO6s/J6ncRmoAT9FVB3jgaU0qvjpHJJYwWsiuK
	 WIfLoadJf18lMgtsuaUnG1vExC7/EHJB8Z5TgLf/Y7MD6FqHI+4PIxXg6sbH0Y0Feqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dT11O6tJ;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AD1606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 17:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AD1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=dT11O6tJ
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3adf5f6833cso1519965a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793294155; x=1793898955; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4AC+76/KQ+QerS0vbEfd85krwo5e3I+GiqoZ0yXri7Q=;
        b=dT11O6tJyExylRrs1nXl3/kAWbLocR/Q3wbKp6eWfFGOl5xbvupjbb7NLG1DxBS4kR
         7CZlnnngeHVGtjQ+MGsUgPRdXjy4FoMlT92COUAEAu0lBmC13ZRVYTaNNHG8pHSklvMv
         oGPPeTCk1PYZuV7eUY1ZVoqclYUFxAJ2al2s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294155; x=1793898955;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4AC+76/KQ+QerS0vbEfd85krwo5e3I+GiqoZ0yXri7Q=;
        b=rhmoLlelhHuYonDG2Q5+ukeFet/Uly33hDEIrLZIYBl5vkS9y4mtuDVqJiTsTsUIOy
         XYsW9FWjosGzdpYSy07aS5D258tDmFmDRlZQE/8sp4b0dSiTzEBffBwLLsdWjrRcPKzR
         i2I5PCj73VBNmpnbJrjuH7laAWup8EGF+vftrJGnELdGUGDIJmFfnBR2j+hnRc9mM1Bd
         70FK3xeekUn+Bx7/nedIwdhLLtz6N1u1huX9oJ+/oegdX1ilWGwNL1eDBXPxpKszT+jM
         H6WBm6XLafJvdzjfPr+DEKDw5O+XyQpa00Nmxwfr9RGCl5EVpa0/6SKInvW+lWN6HwQi
         NrMg==
X-Forwarded-Encrypted: i=1; AKwUvByGD0HGboMpffekmvrmPxMO+69aO3Vag7kYoPMP1AaoPMiY002mAoE8ido7NfQI8HEIarRRW09U+ORHHrw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLZI/JopZM255yAtpHyL2F6I1rrQMMBheKbaIIzlqWf9+/9JDrL
	HZHEn8Zmp5/gWcTPitJ3xl2RLUJWoZ9lG7kuQAzgbn4kSPBCx/39cOafsV+aPZgjXYcRgzTPvr5
	uq2Uwjug=
X-Gm-Gg: AYBFou2LrW8LftRxCllZ7+LUSj6GOwldkMmkkTwo+gYcZpZsB0Czxr8baAy78qWXC2m
	dMdyGj3zJVAz0y02D8yds80N5wyW2iEaM7+P/VpKZD1LVtRDxLEipjFz+2AEex73wGyFBN98/wg
	fmEo3Gm88TQQz7fLxaqrNr6mwSe0+lHZBSJV6eFTWIcac4X8oPXnBdQR5aIXXSyE3lBrk3YtRh1
	qjPIcPKKQ7cJ3yDmpu04aJOJIHpN7CtTkz8YHcotFfE/7zWuqO1B7ohlLuj70AXN6a6YUxMUaL1
	Y6a102wlaXG6vSNF8bIvqjJ2pUc4j7SkAljKgB0PhsgZBLn1rDv8Qhc29GxNMN/wOb80tAOh1oT
	7codpB7390ya/X9qC8aWZbiLx3s9AxD/ndp4YRNJhK+g1FWifpdtm+Y0Jtmof0nrQPUcNQQeexX
	6o982jXJr7n8s1q52dgJNVUDsrajM0buih9PerggOD7OCZixlsG7GAWhXecO8EqeFbI7GtGk+T1
	s4t1RnCIUu0m+1cKSVXaN+DZwrYuPUMhOi0I58mZ3aLNuwK4t1Vz5KcqyBDTZQqLhT6ZypvM2Uu
	IxNxj0jPF3XaEsH/3Zn6ISYCDRTzbnf+CPqZ5V3O6Alf1bvgwughNBlYHe14T/Cw4oXb0qE2TBN
	CB+LvfztMDwsCJ9Cc2xPkuoBZP9ICcEIktgpPS7/sNom0T/PJmmmcK2AAOWVzMrOclvZvTE5A
X-Received: by 2002:a17:90b:3c43:b0:3ab:c80:936f with SMTP id 98e67ed59e1d1-3ae57f95afcmr4290753a91.16.1793294155121;
        Thu, 29 Oct 2026 10:15:55 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae85e567ecsm64167a91.3.2026.10.29.10.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:15:54 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:15:51 +0800
From: Chris Down <chris@chrisdown.name>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Mykyta Yatsenko <yatsenko@meta.com>, Shuah Khan <shuah@kernel.org>,
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf 0/2] bpf: Gate dynptr probe-read kfuncs like helpers
Message-ID: <auN_R9gCBqNwEkKV@chrisdown.name>
References: <20260615-f01-07-dynptr-probe-read-cap-v1-0-e626cd61a381@mails.tsinghua.edu.cn>
 <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJ9QOWVIXFHR.1S8UL5H0USVCB@gmail.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hey Alexei,

Alexei Starovoitov writes:
> It's fine as-is. Won't fix.

Could you expand a bit on the lockdown side of this? I ran into the same 
discrepancy independently and was preparing fixes until I found this thread 
while looking for prior discussion.

The CAP_PERFMON side is now covered by 81c975aae375 ("bpf: Require CAP_PERFMON 
for kfuncs reading memory"), but the probe_read_kernel helpers still check 
LOCKDOWN_BPF_READ_KERNEL while the matching dynptr kfuncs don't. Is that 
intentional?

I also checked bpf_rdonly_cast() plus typed loads, which can still read kernel 
memory in that mode, so I can see why just gating the two dynptr kfuncs 
wouldn't give us a consistent boundary. I'm less clear on whether that's the 
reason for leaving them alone or there's some other reason.

Thanks,

Chris
