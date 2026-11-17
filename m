Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922849;
	b=rjRAIeZLsx+im6AO5p5xECXWK/J7YeYIG2cQHEwfFye4kcysKlurO+STojnRd/Fp7+5x
	 m5oVI92/qa9GBXX7pvx7eUNcIpLJQyVpPQdBSBE29wauOynHfe2/5f4qLR6VVPZMSuiXu
	 ved7Dd1LY9/rbGUBxDx/GU8+08KaYjfkjTs4MYHowBaxucmnDvhsy4nFpVhx29LbIZCpf
	 es0Ey3sTxst56id3KR+OFaX7tq7g0C1JWESNU+fycbEfMt7K+Y/BpqQZbEEkF8RmfBxMd
	 OEwFkF3zwXQJzJVleK9ZRNPHkJI9MZXNIj0biARe0Eq6aTwLsFQVNwCwV53NV83wvtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922849;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=2onvA3w1AX2T652rmvjKcErttBTJ29lM7H+Z12l/3jk=;
	b=Y9iC2AHkd8B+y8QFlm8mVQnstAFFJqXBcS06REsOqP1jy8W0KfzzY0t7/rsqSlHJfDq/
	 8YnLwUPWvDMyPNassiURFbNCY5iBM5ZTQH+dPZuU3/l0n6Fq40zjXmZgywrhFCVfWk+Fy
	 JxkHHPlE0rW3dyoBvWdtlxKsHACN4CRx7kNeO6b7nL/9T0lbDGIXNLH6CsyyanEAmMz2c
	 Gu1YN7rtfOc/LmXIDCoQc+5m/uVKBhxDk3jKiA6JmXGLXJ6/QDDIDECMaARTXXAxCC9GQ
	 yB1UIO3TJm52pb6MCLBetSpg4XeTZTwV5YWfkMIRfyOqKJP4z+cL9QAowncuApxp1Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGbWyZtJ;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3B5606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E3B5606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DGbWyZtJ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so6885657eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794922848; x=1795527648; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2onvA3w1AX2T652rmvjKcErttBTJ29lM7H+Z12l/3jk=;
        b=DGbWyZtJbhqEwRIAHmzYMFxe1csMND28ldH5bojZRrhsbMW2C3JsjxfWcew6ou3dAS
         PZ3IosuOzq+L5DzoRmVyqWCeh9OD39BZk/2hz22F2XtQpIR4KcOnKPYITTeXzRRM8+hJ
         ZjR0/gaY3uHEfGMpZiGicO4TXqvt0EDo+9Dv4FfkMoYpclMM7ROstUcHN/N1sMtMavzh
         GwpfX1PQw4Q0bXmdnavwlNicLbHpjozLBgJUCfzHHmYWCF5x659l0nnco0HQ9eMFXWoc
         C6PS5Zgx8UKAsTklR9xKTgQ6t7Ig1S5M44my1N/nCQ4j8h6ZGnVKI1lEmTJJHWgcT7WJ
         bgyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922848; x=1795527648;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2onvA3w1AX2T652rmvjKcErttBTJ29lM7H+Z12l/3jk=;
        b=IEr1ufsUVB8qsJMeJ6xWRvwsY9mY/oEY1YYrkHbihdF2b19Wz8tZRjOU1UJSGuofRB
         AZBzCdkYz/Ba00jalRmmbhEgX5ajbU67GLbMY7SV36hn5H8nNKHOZYNQ5V7qnlCviIey
         opco0S7Cj7iJXly+yJCh5Aa7KdU8wv82YLYFvBot1FP5pw5sT5kMjPe0WDhrCaA4lSra
         zoIMejJng3mcHLIIfPHi3YN1M6nsenZUfUNDWTTooU7ifgKwh1OeOUZg+Ib985AmRYBa
         /yf7I2Sh2iFG5iWuYFfJIVrN/nCz2+pV76NN6yH0N/AOn1gvvASSJlxD3zh/IYUXNh5Q
         rIlA==
X-Forwarded-Encrypted: i=1; AL+hErE7bTHdAooeRgxZa9IBea6+NwHYnh8Hu4WBUqh3YkXF3kUFsP10h+nC/bn5iwe7TMSrNaKlLMA18Dklp/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mjly+Y4SXfjIUlamfeDgUhp04mC+ZKCkPehRNueC7p9LzZm0T
	OBgI+/qTXDq4zPnlHQAaa9Qlh/qkuEQRPM2XAcId/lOLHKJNvkZpWSX2u98apFyi
X-Gm-Gg: AZFdTZfix4GtVD6yraaaotbHOUrlHN/N17ix8lkGktFe4ilAkGxBK/EcZWLQuejjYgd
	BaF4bUSSqh5SDeBGYX0q91Yn+wWeFbA9NNlzhuWJO3gkCRWlgE6t3PlVBesEcgs2Y9td71qR6zE
	LkR7cg7B26RDMMDWDYSJs1c13RPlYHpIVkcGEvwDNG4HwbLADf1v5CFxjtK97hgEIOEEaRrihvX
	DYO3XWRaFvbZ4XVarcoSLRMPm0ZF1c3sVIFTFENcYw771pX0Y9Nhi3dFa/nMTMbio2uNK/fQSUc
	7uML3UApKsTlVhiiemcsLBP73fBBXtefFq29uNaHIBoOGrxxWASPbN36Lva+3rtvMxM5/BOXDS8
	giUPH0M6Vi+IV1YhhA1DAysOiwlXtJDtkzRMNf+fxmBLg4QqAENnKCCRS4n7ZCFZnP2jYGfq/FO
	r8opeDpvmRhkHwYnUJ7nY84O58Jz1cnDdhuqd5D3dsX/ms51uirT32lZG3TRyrAD5z4NnB0kU3m
	T9DtrUyoSgnjOrp0NcMr68fDFm98Dv9lw7Uv/D3EpPuEP+ziEEI9c+MMSygYtvqaVfYMpIf0yHU
	Tq7d9jHiyOI+dZQ3Zy4f7BSJOgs=
X-Received: by 2002:a05:7300:e9cb:10b0:369:f9da:a70f with SMTP id 5a478bee46e88-3796676acefmr15663596eec.17.1794922848321;
        Tue, 17 Nov 2026 05:40:48 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3815045b90esm6193856eec.13.2026.11.17.05.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:40:47 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, chzigotzky@xenosoft.de
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, msuchanek@suse.de, harshpb@linux.ibm.com, gautam@linux.ibm.com, amachhiw@linux.ibm.com, venkat88@linux.ibm.com, nnmlinux@linux.ibm.com, mkchauras@gmail.com
Subject: Re: [PATCH v4 1/3] PPC32: Fix hard_irq_disable to follow tracing and lockdep state
In-Reply-To: <20261117131612.707038-2-sshegde@linux.ibm.com>
Date: Tue, 17 Nov 2026 18:58:41 +0530
Message-ID: <y0ar7fjq.ritesh.list@gmail.com>
References: <20261117131612.707038-1-sshegde@linux.ibm.com> <20261117131612.707038-2-sshegde@linux.ibm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Shrikanth Hegde <sshegde@linux.ibm.com> writes:

> On PPC32, the code for hard_irq_disable has diverged and it doesn't
> do lockdep/tracing anymore, leading to use of both local_irq_disable
> and hard_irq_disable on PPC32 to overcome those.
>
> That is un-necessary, instead simply calling local_irq_disable is
> enough. It disables EE bit and does lockdep tracking.
>
> Subsequent patch uses this API in KVM code to avoid the warnings.
> Wider use of it is possible, but it will be taken subsequently.
>
> Fixes: 5d38902c4838 ("powerpc: Add irqtrace support for 32-bit powerpc")
> Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> PS: Fixes tag is based on the historical analysis done by Ritesh.
> I haven't got a chance to delve deep into it. Note that it is old
> commit and lot of code interleave would have happened since 
> including local_irq_disable at some would have added proper
> lockdep support.
>

Yes, not sure whether we really want this this fix to go back to that
old change?

Maybe we can add CC: stable and keep the minimum kernel version to it,
so that it gets applied >= vX.Y+ sort of. Instead of stable backports
picking this change and taking it all the way to a very a old kernel
release - which in my opinion is not worth it. Thoughts?

Do we know from when we started hitting this problem? Should this be
after we merge generic entry/exit? Or was there any previous kernel
version too, where we were hitting this?

>  arch/powerpc/include/asm/hw_irq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

BTW, thanks for taking it forward.

The change looks good to me. So, please Feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>

However, note that we should still get the stable tag / fixes thing
sorted, for stable backports to do it's right thing.

