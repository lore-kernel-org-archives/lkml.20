Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104672;
	b=iLTlizkMmNWYCVJ8ByDJvSnbpoAHoVMZ5J5ij0FkHgxRQT1JAauiiKvjxkSIio/Z2tyL
	 0w+hdFhsLfxQ2GOkELHmYCDS1py3oXUVaNXcbzS+bIxajxLAzxTfJQ6CsOQdUfIs1V/8c
	 8bEZhf6v0/yyTyJ82OYPsBOkB2WBbnuefKdw+PKxSVdpM7aHnV0U2r9jDrLKrkxF7gn8J
	 lUGCZoVKr/HSCpmczv66AZBLLugYrz3OST8FJTNvyJCvOalJLKWkEC9xkdaPnygPXPx2k
	 gWTuMmeVtqDfgNYLMVEDCSEF/p87HRz7gkxV2JzdWB8wCX2ak8nBBVWx2/pXeSrPHyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=/2fYbBkSw+Q0X0CFuvq2qZXwXeHUb7jlBvQS4ttpb+w=;
	b=D9KiHupZGRyltvWmMbk8b8oMwg7K/XSbevgO35/Ppsdc+qHlGfjtC27jELLWX25stcUV
	 w6be8kDJi+HZ5a6RINGPWqM1lq8l4eq86JUB90V3Eto8zfGjUaaBdE8uQH7XrlvRL7kvr
	 VDp+XI2iaNvyBsEGM2CBFULDBxM+6xK5qlX4T0Dxsu+j4YAGFsSorKXDks7WJ7vO/leaa
	 id6Kyojm5RdwujvA4jvJDR21Bl0yEvdjg/CnNpsxVQoeggIvejZKAMIc+ScsGziV3FMpn
	 N45SxgB8XmNH5Y1FJZtZ+h/Hf8vuW8oe18ot22T70FalaOLemaf61ntWxkPjeF9iPdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CnMDTU7a;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCA2606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DCA2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=CnMDTU7a
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a70b241fd6so2152255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793104670; x=1793709470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/2fYbBkSw+Q0X0CFuvq2qZXwXeHUb7jlBvQS4ttpb+w=;
        b=CnMDTU7aZ0v8MjPemUnm6nSR0Qez/31xvHI01Ts/vyEOhUN3bh/LUvz9USa4cleqtK
         gQXTrLD9Ka8nZbKSuDE2Et5rpbbnvsWc83tepdpTA8zyplQqIVNHAae10889wSbSbZFt
         C2Y3sOg0pYt9JW0znv6QprDgz5Ay59LpuP/wLskeAqS1Vj8jlA+bFs1kFJ1I4jdiWfp0
         tMsv/sycV9GbStVRCxgO0ir78J7nqRkwN/OjUyynAr5ZPngiEpQ2Fn7O/DW/JRCSuETV
         YJCOqG4uXa82Nzpi7W0LNUZLcH3mA0KWZihvXl+eFm6Vf6TEmN17WqUZQ/SkbPw9QmNQ
         7JQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104670; x=1793709470;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/2fYbBkSw+Q0X0CFuvq2qZXwXeHUb7jlBvQS4ttpb+w=;
        b=SP9GhkiHKdh/NruRESbnH8o/KdANo70vgp2iDi4KdhhKaODna/nVohv6ZnwdIfgfl9
         95KVQhFdy8KuSgNwmPM4LRv5XXEJgDkMxOLzB+Yyx4aRT7Ds7QcoruFBzh0P/L2z1b7r
         S1We9k9wSalzfq6lab2XnvDFpieLjviwqAbAbgJwcXUGcj/OXJCKJERfxGneDBYWE7ok
         +EURm5tCvfAttsO/D7G4YhE8PUVrKNGh/rLE02Fk3s1gn9RYPq0JijArUfKCeIYVF6Fv
         3g07kHla5X8rx4t9nF1aYgWQTo8O117i3WFUYhve0ujCKxWye1rwXRFTCsAQcF/o/SWd
         30LA==
X-Gm-Message-State: AFq9FYL5jyQysj3POmvfzaYuPzEIcXFrlygIwh/EuSeqwssg+hYwDm8S
	ymvSJRUutXQBof7SbdDTSUXaXiKh5+yUKiAktdkOILJ4gcmlRL0cbQRWazYH6gOPD4U=
X-Gm-Gg: AYBFou0nMc0gXysIZvp83AO/H/yhg62ZW2oVK4jZWyPzoq58FzVpP6wOoC78nWhltO+
	7v6HsTGRltb8y270Zl84jQsno7o3jmabjvZJC1PMc1nbA+/gMQ8xcGQh1z5gNu7DV7hx+Uk5ZuR
	AuyvG9XgV/sh6REUKvrWyxoFbg4BtKFHVeTAestLZE218CQZnzFrM4IvO9uJuyJuLUeuVw69k2/
	nPpC3sD7omjM9cR5vh2ZbyPdyb6sCgnk+d6fRjprzZVejTelDA9MuFB0w7uSKoDp0cu3dMVuK+c
	5nG8W5A9MpZ+DNz7nPOwYzbNcAHACxQfMftSoo6v4tfpBxbvrq6f5SIQX+dBmRTJuWZU4s+LOGm
	5fpCkefcDZSSHSAX9YAFUu/SeFo7O9pVP++PabgFnHYi2DY/yKqdSfr6DW/GEl/Fry51BfouW+u
	4WqL40+PthMsRhT2CfaSJjwQPkyACBR95Y1XHQNkdO25YJxl5t7OW5L/B+vbiIQ/PVctg1My9FW
	b91qrAgTuyYSJ/MiG7aNVQtfEpN/OgyeKYyQCDifuc6GbrZIReLArlz6CNRrYjN
X-Received: by 2002:a05:600c:a114:b0:4a1:e015:6441 with SMTP id 5b1f17b1804b1-4a35aae2c99mr133680015e9.0.1793104669920;
        Tue, 27 Oct 2026 05:37:49 -0700 (PDT)
Received: from mordecai (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb9cesm23707434f8f.27.2026.10.27.05.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:37:49 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:37:46 +0100
From: Petr Tesarik <ptesarik@suse.com>
To: Thorsten Blum <blum@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Hans Peter Anvin <hpa@zytor.com>, Peter
 Zijlstra <peterz@infradead.org>, Juergen Gross <jgross@suse.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v2 0/3] x86/tsc: Remove some magic constants
Message-ID: <20261027133746.3ccd4b01@mordecai>
In-Reply-To: <20261014132932.1495303-1-ptesarik@suse.com>
References: <20261014132932.1495303-1-ptesarik@suse.com>
Organization: SUSE LINUX
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.53; x86_64-suse-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

what about this series? It's not super-important, but neither should it
be too hard to review...

Petr T

On Wed, 14 Oct 2026 15:29:29 +0200
Petr Tesarik <ptesarik@suse.com> wrote:

> The TSC code is full of various magic constants, making it difficult to
> understand the calculations. This patch series tries to document their
> actual meaning.
> 
> No functional change intended, but the code is not bit-for-bit
> identical; some 32-bit multiplications are converted into 64-bit
> multiplications, because HZ_PER_KHZ is an unsigned long. If anything,
> this should reduce the risk of arithmetic overflow.
> 
> Changes from v1:
> - Use TICK_NSEC instead of (NSEC_PER_SEC / HZ)
> - Use HZ_PER_KHZ and KHZ_PER_MHZ from <linux/units.h>
> 
> Petr Tesarik (3):
>   x86/tsc: Replace magic constants with xxx_PER_SEC
>   x86/tsc: Use HZ_PER_KHZ and KHZ_PER_MHZ
>   x86/tsc: Use TSC_CALIBRATE_MULT for the TSC multiplier
> 
>  arch/x86/kernel/tsc.c | 54 +++++++++++++++++++++----------------------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 

